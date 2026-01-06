+++
title = "Enable Accounts"
weight = 46
+++

## What 

This script takes in a CSV of accounts, with the date in ddMMyyyy format, and a Yes/No and will enable the accounts on those days  
{{< table >}}
||||||
|-|-|-|-|-|
| User | 06012026 | 07012026 | 08012026 | 09012026 |
| Test-User-1 | Yes | Yes | Yes | Yes |
| Test-User-2 | Yes | No | Yes | No |
| Test-User-3 | Yes | Yes | No | Yes |
| Test-User-4 | Yes | No | Yes | No |
| Test-User-5 | Yes | Yes | No | Yes |
| Test-User-6 | Yes | No | Yes | No |
| Test-User-7 | Yes | Yes | No | Yes |
{{< /table >}}




## Notes

Line 2 you set the location of the Logging 
Line 4 you set the location of the CSV With The list of accounts to be enabled/disabled

{{< prism lang="powershell" linkable-line-numbers="true" line-numbers="true" >}}
$Date = Get-Date  -Format "ddMMyyyy" 
$LogsPath = "C:\Scripts\Logs\EnableLog_$Date.txt"
start-transcript -Path $LogsPath 
$CSVData = Import-Csv "C:\Scripts\Data\Enable.csv"
Write-Host "Lets Print the CSV Data just to make sure the right stuff is coming in"
Write-Host $CSVData
Write-Host "LETS ENABLE SOME ACCOUNTS"
foreach ($User in $CSVData){
    Write-Host "Lets Check what should happen"
    Write-Host "Should " $User.User "be enabled on $Date" $User.$Date 
    if ($User.$Date -eq "Yes" ){
        Write-Host "User" $User.User "should be enabled, so lets do it"
        Enable-ADAccount -Identity $User.User
        Write-Host "Enabled " $User.User -ForegroundColor Blue
    }else{
        Write-Host "User" $User.User "should NOT be enabled, so lets NOT do it and disable it if it is enabled"
        Disable-ADAccount -Identity $User.User
        Write-Host "Disabled " $User.User -ForegroundColor Blue
    }
}
Stop-Transcript
{{< /prism >}}
