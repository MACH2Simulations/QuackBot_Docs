---
title: 'Get Disk space of remote computer in OU'
date: '2018-03-07T22:06:01+00:00'

---
Script a week 00000101  
This script allows you to get the free space on disk C and give you an option for a second drive

```powershell
####Script by Chris of TECHGUYBLOG.CO.UK (C) 2018
####Tested on PS 5.0 AND 6.0
####The script below will allow you to get the free disk space on remote machines in an OU
####And an second drive

$comp = Get-ADComputer -Filter * -SearchBase "OU=Servers,OU=School,OU=CO,OU=UK"| select -expand name
Get-WMIObject Win32_Logicaldisk -filter "deviceid='C:'" -ComputerName $comp | 
Select PSComputername,DeviceID, 
@{Name="SizeGB";Expression={$_.Size/1GB -as [int]}},
@{Name="FreeGB";Expression={[math]::Round($_.Freespace/1GB,2)}}

##and d drive

#B
Get-WMIObject Win32_Logicaldisk -filter "deviceid='D:'" -ComputerName $comp | 
Select PSComputername,DeviceID, 
@{Name="SizeGB";Expression={$_.Size/1GB -as [int]}},
@{Name="FreeGB";Expression={[math]::Round($_.Freespace/1GB,2)}}
#B
```

**PS Version** – Test on 5.0 &amp; 6.0  
**OS** – Tested on Windows 7 &amp; Windows 10, with the script being run on a windows 10 machine  
**Administrative Credentials required** – Yes  
**Changes needed?** – Change OU For your ORG, Change or remove the second section for extra drives (In between the B Comments). Note you can copy the section between the b comments and duplicate for as many drives as needed. Just replace the device ID Letter for the drive.  
**Additional Things** – RPC Turned on  
