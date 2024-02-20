---
title: 'Remote shutdown / Restart'
date: '2018-02-25T14:50:47+00:00'
---
Script a week – week 00000011  
This Is A Script To Remotely Restart Computers.  
WARNING THIS IS A **POTENTIALLY DESTRUCTIVE ACTION,** RUNNING THIS SCRIPT INCORRECTLY COULD RESTART ALL MACHINES ON YOUR NETWORK INCLUDING SERVERS.

```powershell
####Script by Chris of TECHGUYBLOG.CO.UK (C) 2018
####Tested on PS 5.0 AND 6.0
####The script below will allow you remotely restart computers with a certain name
####Or with a certain naming convention 
####WARNING THIS IS A POTENTIALLY DESTRUCTIVE ACTION, 
####RUNNING THIS SCRIPT INCORRECTLY COULD SHUT DOWN ALL MACHINES ON YOUR NETWORK 
####INCLUDING SERVERS
##
$compname = read-host "Enter computname Do not include * For wild card. `
it is added automactily::::: IE COMPNAME"
$secs = read-host "enter how many seconds until restart"
$computers = Get-ADComputer -Filter "Name -like '$compname*'" | `
select-object -expandproperty name
$msg =  "Your comupter will restart in $secs Seconds" 
ForEach ($computer in $computers) {
    WRITE-HOST $computer
    Invoke-WmiMethod `
        -Path Win32_Process `
        -Name Create `
        -ArgumentList "msg * /time:$secs $msg" `
        -ComputerName $computer
        SHUTDOWN /r /f /m  $computer -t $secs -d UP:4:1
}
##
```

**Replace /r with /s to shut down and not restart  
WARNING** – By running this with just a wildcard it will force close all programs on a machine and Restart it THIS INCLUDES SERVERS, Be careful when running.  
**PS Version** – Test on 5.0 &amp; 6.0  
**OS** – Tested on Windows 7 &amp; Windows 10, with the script being run on a windows 10 machine  
**Administrative Credentials required** – Yes  
**Changes needed?** – Modifying comments to suit your org needs  
**Additional Things** – RPC Turned on
