+++
title = 'From CSV To AD Group'
weight = 6
+++

This script will read from a CSV and add users with the email in it to an AD Group.  

This is very useful when you need an non IT Person to be able to add users to a group, without them going within 100 miles of AD, or involving IT. 

***This needs to be run as an admin with AD Perms.***

## REQUIRES Machy's Functions  

Requires the DBW Function from this script. You can just add the function to the top of the file.  
[Mach's Functions](../../mfunctions.md)

## The Script itself  

[ProfileFix.ps1](../../PowerShell/Scripts/CSVtoAD.ps1)  
[CSVAD.CSV](../../PowerShell/Scripts/CSVAD.csv)
### Usage

Line 2 Update function file location, or replace with the DBW function from Mach's Functions.  
$LogRoot # Update to your preferred location for logging.  
$Debug # Set to true if you are having issues.  
$UserEmail #If you want the script to be able to take (UPNS) as well as just the username add the UPN here, if your user understand "just the username" then you don't need to change it.  

### The CSV  

Delete the first row AFTER The headers  
Put username in first column  
One per row  

***CSV***
"EmailOrUsername","LastRun-dd-MM-yyyy-hh-mm"
"Delete_this_row","19_01_2024_10_12"

### Script  

```PowerShell
cls
Import-Module "C:\Scripts\Mach-Functions.psm1"
$Date = Get-Date -Format dd_MM_yyyy_hh_mm
$LogRoot = "C:\Data"
$Log = "$LogRoot\CSVADlog_$Date.txt"
Start-Transcript $log
$Debug = $false # Should we be verbose with printing info
$CSVAD = "$LogRoot\CSVAD.csv"
$CSVADdone = "$LogRoot\CSVADDone.csv"
$CSVADFailedToAdd = "$LogRoot\CSVADFailedToAdd.csv"
$CSVADGroup = "UserGroup"
$UserEmail = "`@EmailDomain.co.uk"

Write-Host "List $CSVAD LogList $CSVADdone Failed List $CSVADFailedToAdd Group Name $CSVADGroup Debug $Debug"
$users = Import-CSV $CSVAD
Write-Host "List Of Users $Users"
foreach ($User in $Users){
    DBW ($User.EmailOrUsername -eq "Delete_this_row") "blue" $false
    if ($User.EmailOrUsername -eq "Delete_this_row") {
        Write-Host "No users to add / instructions ignored, goodbye (Closeing)" -ForegroundColor Red
        Stop-Transcript
        exit 4
    }
    $User = $User.EmailOrUsername -replace "$UserEmail", "" 
    DBW "Trying to add $User To $CSVADGroup " "blue" $Debug
    try {
        Write-Host "Lets try to add the user"
        Add-ADGroupMember -Identity $CSVADGroup -Members $User
        $Name = Get-ADUser $User | Select -ExpandProperty Name
        Write-Host "Sucsess, lets add this to a file so i don't keep getting asked"
        [PSCustomObject] [ordered] @{
            'EmailOrUsername' = $User
            'Name'            = $Name
            'DateAdded'       = get-date -Format dd_MM_yyyy_HH_mm

        } | Export-Csv -Path "$CSVADdone" -NoTypeInformation -Append
    }
    catch {
        DBW "Failed to add $User, lets log this" "red" $Debug
        [PSCustomObject] [ordered] @{
            'EmailOrUsername' = $User
            'DateFailed'       = get-date -Format dd_MM_yyyy_hh_mm

        } | Export-Csv -Path "$CSVADFailedToAdd" -NoTypeInformation -Append
    }

}

[PSCustomObject] [ordered] @{
    'EmailOrUsername' = "Delete_this_row"
    'LastRun-dd-MM-yyyy-hh-mm' = Get-Date -Format dd_MM_yyyy_hh_mm 
} | Export-Csv -Path "$CSVAD" -NoTypeInformation

Stop-Transcript

```
