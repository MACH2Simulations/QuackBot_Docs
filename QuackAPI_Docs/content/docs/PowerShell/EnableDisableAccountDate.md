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

## Password Change By OU Filtered by Username

This allows you to bulk change passwords for users in an OU But also filter by Name, so if you wanted to renamed all of "TEST-USER-DAVE-*" In a OU Of test users you can use this.  


## Note
In the last line only you Set your OU, Per "distinguishedName" in AD.  
You Set the base password in Quotes to whatever you want it to be IE "Cheesecake"  
The set Random to 1 if you want randmoness added to the end, IE Cheesecake_hgg54 By Default this adds 8 Charaters to the end  
If you want to enable the accounts, set enable to 1  


{{< prism lang="powershell" linkable-line-numbers="true" line-numbers="true" >}}

function Set-OUPasswordAsBulk {
    param (
        [Parameter(Mandatory, HelpMessage = "The Full OU To change the password in: OU=ROOM,OU=DESKTOPS,DC=COMP,DC=LOCAL")]
        $OU, 
        [PSDefaultValue(Value = "*")]
        [Parameter(HelpMessage = "Should you filter by username in ou `"name -like `*moo`* `" ")]
        $Filter,
        [PSDefaultValue(Value = 1)]
        [Parameter(HelpMessage = "Set Active: Should the accounts be enabled: Def 1")]
        $Enable,
        [PSDefaultValue(Value = 1)]
        [Parameter(HelpMessage = "Random: Add random noise to end of password: Def 1")]
        $Random,
        [Parameter(Mandatory, HelpMessage = "The base password for the accounts")]
        $Base
    )
    $Users = @(Get-ADUser -SearchBase $OU -Properties * -Filter "$Filter" | Select -ExpandProperty samaccountname)
    Write-Host $Users
    $Users | ForEach-Object -Parallel {
        $Noise = ""
        if ($using:random -EQ 1) {
            $noise = -join ((35..38) + (33) + (42) + (43) + (48..57) + (61) + (63..90) + (97..122) | Get-Random -Count 8 | % { [char]$_ })
        }
        $NewPassword = $Using:Base + $Noise
        Write-Host "$_,$NewPassword,"
        Set-ADAccountPassword -Identity $_ -Reset -NewPassword (ConvertTo-SecureString -AsPlainText "$NewPassword" -Force)
        if ($using:enable -EQ 1) {
            Enable-ADAccount -Identity $_
        }
    }    -ThrottleLimit 2  
}

Set-OUPasswordAsBulk -OU "OU=ROOM,OU=DESKTOPS,DC=COMP,DC=LOCAL" -Filter "NAME -LIKE '*TEST-USER-DAVE-*'" -Base "Spare@Enter1" -Enable 1 -Random 0
{{< /prism >}}