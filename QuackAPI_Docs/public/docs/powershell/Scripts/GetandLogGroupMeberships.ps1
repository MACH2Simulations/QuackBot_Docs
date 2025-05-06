$Users = Get-ADUser -SearchBase "OU=YOUROUHERE,DC=DOMAIN,DC=TLD" -Filter * | select -ExpandProperty SamAccountName ##This gets all the users in a specifed OU
$Date = get-date -Format ddMMyyyy ## Gets the date in Day Month Year number
$LogLocation = "C:\Scripts\Data\$Date" ## Where the logs will be made, this can be UNC
New-Item $LogLocation -Force -ItemType Directory ## Creates the dated folder
ForEach ($User in $Users){ ## For each user found  
    $LogLocationName = "$LogLocation\$User.txt" ## Prep name of file
    New-Item $LogLocationName ## Create file  
    Get-ADPrincipalGroupMembership $User | select name | Out-File $LogLocationName -Append ## Write group memberships to the folder
}