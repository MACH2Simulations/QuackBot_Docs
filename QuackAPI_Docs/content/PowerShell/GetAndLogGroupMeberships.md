+++
title = 'Log AD Group Memberships'
date = 2024-02-08T20:04:15Z
weight = 3
+++

This script will create a text file containing group memberships, for each member of the OU Specified in the search base.  
This script will work on  
> user, computer, group, or service account  

## Notes

See [Date Formatting](/../../PowerShell/#Date-Formatting) if you wish to change the date format  
Make sure you set the [Search Base](/../../PowerShell/#SearchBase) otherwise it will scan the entirety of active directory

## The Script itself  

[GetandLogGroupMemberships.ps1](/GetandLogGroupMeberships.ps1)  

```powershell
$Users = Get-ADUser -SearchBase "OU=YOUROUHERE,DC=DOMAIN,DC=TLD" -Filter * | select -ExpandProperty SamAccountName ##This gets all the users in a specifed OU
$Date = get-date -Format ddMMyyyy ## Gets the date in Day Month Year number
$LogLocation = "C:\Scripts\Data\$Date" ## Where the logs will be made, this can be UNC
New-Item $LogLocation -Force -ItemType Directory ## Creates the dated folder
ForEach ($User in $Users){ ## For each user found  
    $LogLocationName = "$LogLocation\$User.txt" ## Prep name of file
    New-Item $LogLocationName ## Create file  
    Get-ADPrincipalGroupMembership $User | select name | Out-File $LogLocationName -Append ## Write group memberships to the folder
}
```
