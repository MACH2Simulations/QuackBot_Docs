#!/bin/sh

# Exit on error
set -e

# Error handling
trap 'echo "An error occurred at line $LINENO. Exiting."' ERR

# Path to the Git repository (current directory)
REPO_DIR="."
CHANGELOG_FILE="$REPO_DIR/QuackAPI_Docs/content/docs/CHANGELOG.md"

echo "Starting changelog generation script..."
git config --global --add safe.directory /github/workspace
git -C /github/workspace fetch --unshallow

# Create or clear the changelog file
> $CHANGELOG_FILE

# Add the introductory text to the changelog
# echo "# Changelog" >> $CHANGELOG_FILE
echo "+++" >> $CHANGELOG_FILE
echo "title = \"Changelog\"" >> $CHANGELOG_FILE
echo "weight = 10000 " >> $CHANGELOG_FILE
echo "+++" >> $CHANGELOG_FILE
echo "" >> $CHANGELOG_FILE
echo "All notable changes to this project will be documented in this file." >> $CHANGELOG_FILE
echo "" >> $CHANGELOG_FILE
echo "The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/), this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html) and to [Conventional Commits](https://www.conventionalcommits.org/en/v1.0.0/)." >> $CHANGELOG_FILE
echo "" >> $CHANGELOG_FILE

# Go to the repository directory
cd $REPO_DIR

# Get repository url
GITHUB_REPO_URL=$(git remote get-url origin 2>/dev/null | sed 's/\.git$//')
if [ -z "$GITHUB_REPO_URL" ]; then
    GITHUB_REPO_URL=0
fi

echo "Repository:"
echo $GITHUB_REPO_URL

# Fetch the latest changes
git fetch --tags --depth=10
echo "Fetched latest tags."

# Get the latest tag
LATEST_TAG=$(git describe --tags --abbrev=0)

# Get tags in reverse order
TAGS=$(git tag --sort=-v:refname)

# Check if there are any tags
if [ -z "$TAGS" ]; then
    echo "No tags found in the repository."
    exit 1
fi

echo "Found tags: $TAGS"

# Placeholder for the previous tag
TAG_TO=HEAD

# Define categories
CATEGORIES="feat fix ci perf docs gitops deploy test demo build chore style refactor"

# Regular expression for matching conventional commits
CONVENTIONAL_COMMIT_REGEX="^.* (feat|fix|ci|perf|docs|gitops|deploy|test|demo|build|style|refactor)(\(.*\))?: "

print_tag() {
    echo "Processing tag: $2"
    TAG_DATE=$(git log -1 --format=%ai $2 | cut -d ' ' -f 1)
    if [ "$2" = "HEAD" ]; then
        if [ $(git rev-parse $1) != $(git rev-parse "HEAD") ]; then
            echo "## Unreleased changes" >> $CHANGELOG_FILE
            echo "" >> $CHANGELOG_FILE
        fi
    else
        echo "## $2 ($TAG_DATE)" >> $CHANGELOG_FILE
        echo "" >> $CHANGELOG_FILE
    fi
    

    # Collect all commits for this tag range
    if [ -z "$1" ]; then
        ALL_COMMITS=$(git log $2 --oneline --always)
    else
        ALL_COMMITS=$(git log $1..$2 --oneline --always)
    fi

    # Process each category
    for KEY in $CATEGORIES; do
        CATEGORY_COMMITS=$(echo "$ALL_COMMITS" | grep -E "^.* $KEY(\(.*\))?: " || true)
        if [ ! -z "$CATEGORY_COMMITS" ]; then
            case $KEY in
                "feat") CATEGORY_NAME="Feature" ;;
                "fix") CATEGORY_NAME="Bug Fixes" ;;
                "ci") CATEGORY_NAME="Continuous Integration" ;;
                "perf") CATEGORY_NAME="Performance Improvements" ;;
                "docs") CATEGORY_NAME="Documentation" ;;
                "gitops") CATEGORY_NAME="GitOps" ;;
                "deploy") CATEGORY_NAME="Deployment" ;;
                "test") CATEGORY_NAME="Test" ;;
                "demo") CATEGORY_NAME="Demo" ;;
                "build") CATEGORY_NAME="Build" ;;
                "chore") CATEGORY_NAME="Chore" ;;
                "style") CATEGORY_NAME="Style" ;;
                "refactor") CATEGORY_NAME="Refactor" ;;
            esac
            echo "### $CATEGORY_NAME" >> $CHANGELOG_FILE
            echo "Listing commits for category: $CATEGORY_NAME under tag $2"
            echo "$CATEGORY_COMMITS" | while read -r COMMIT; do
                HASH=$(echo $COMMIT | awk '{print $1}')
                MESSAGE=$(echo $COMMIT | sed -E "s/^$HASH $KEY(\(.*\))?: //")
                if [ "$GITHUB_REPO_URL" != "0" ]; then
                    echo "- $MESSAGE [\`$HASH\`]($GITHUB_REPO_URL/commit/$HASH)" >> $CHANGELOG_FILE
                else
                    echo "- $MESSAGE" >> $CHANGELOG_FILE
                fi
            done
            echo "" >> $CHANGELOG_FILE
        fi
    done

    # Process 'Other' category
    OTHER_COMMITS=$(echo "$ALL_COMMITS" | grep -v -E "$CONVENTIONAL_COMMIT_REGEX" || true)
    if [ ! -z "$OTHER_COMMITS" ]; then
        echo "### Other" >> $CHANGELOG_FILE
        echo "Listing commits for category: Other under tag $2"
        echo "$OTHER_COMMITS" | while read -r COMMIT; do
            HASH=$(echo $COMMIT | awk '{print $1}')
            MESSAGE=$(echo $COMMIT | sed -E 's/^[^ ]* //')
            if [ "$GITHUB_REPO_URL" != "0" ]; then
                echo "- $MESSAGE [\`$HASH\`]($GITHUB_REPO_URL/commit/$HASH)" >> $CHANGELOG_FILE
            else
                echo "- $MESSAGE" >> $CHANGELOG_FILE
            fi
        done
        echo "" >> $CHANGELOG_FILE
    fi

    echo "Completed processing tag: $2"
    # Update the previous tag
}

# Iterate over tags
for TAG_FROM in $TAGS; do
    print_tag $TAG_FROM $TAG_TO
    TAG_TO=$TAG_FROM
done
print_tag "" $TAG_FROM

echo "Changelog generation complete."
echo "Content of the Changelog file:"
cat CHANGELOG.md
