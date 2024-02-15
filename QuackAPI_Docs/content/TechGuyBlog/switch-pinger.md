---
title: 'Switch Pinger'
date: '2018-03-21T22:22:47+00:00'

---
Script a week 00000110  
This script allows you to ping a range of devices (in a set IP range), useful for pinging things such as network switches

```powershell
####Script by Chris of TECHGUYBLOG.CO.UK (C) 2018
####Tested on PS 5.0 AND Should work on 6.0 
####Script allows you to ping an IPrange of devices 
[uint16]$NETswitch = read-host "Please enter low end of range"
[uint16]$top = read-host "Please enter top of range"
while ($NETswitch -lt $top) 
    {
    If (test-Connection 192.168.1.$NETswitch -Count 2 -Quiet ) 
        {   
        write-host "192.168.1.$NETSwitch is Pinging "   -ForegroundColor Green
        } 
        else  
        {
        write-host "10.24.48.$NETSwitch not pinging"  -ForegroundColor Red
        }
        $NETswitch = $NETswitch + 1      
    }
```

**PS Version** – Test on 5.0 Should work on 6.0  
**OS** – Script run on windows 10, target device OS Shouldn’t matter  
**Administrative Credentials required** – No  
**Changes needed?** – Change the IP range 192.168.1. To the range, you wish to ping. Must be /24 address