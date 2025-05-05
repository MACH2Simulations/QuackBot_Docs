---
title: 'Ping a list of computers'
date: '2018-03-07T21:53:35+00:00'

---
Script a week 00000100  
This Script is to ping a list of computers with a Certain name

```powershell
####Script by Chris of TECHGUYBLOG.CO.UK (C) 2018
####Tested on PS 5.0 AND 6.0
####The script below will allow you ping computers with a certain name
####Or with a certain naming convention 
$compname = read-host "Enter computname Do not include * For wild card. it is added automactily: IE PCNAME"
$computers = Get-ADComputer -Filter "Name -like '$compname*'" | 
select-object -expandproperty name
ForEach ($computer in $computers)`
{
  ping $computer
}
```

**PS Version** – Test on 5.0 &amp; 6.0  
**OS** – Tested on Windows 7 &amp; Windows 10, with the script being run on a windows 10 machine  
**Administrative Credentials required** – Yes  
**Changes needed?** – Modifying comments to suit your org needs