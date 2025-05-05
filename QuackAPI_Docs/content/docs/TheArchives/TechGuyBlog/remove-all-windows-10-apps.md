---
title: 'Remove all windows 10 apps'
date: '2018-03-25T15:22:03+00:00'

---
PS One Liners 00000001  
This one line below will remove all none system critical windows 10 apps.  
This includes the windows store, calculator etc.

```powershell
Get-AppxPackage -allusers | Remove-AppxPackage

```

POTENTIALLY DESTRUCTIVE  
**PS Version** – Test on 5.0 Should work on 6.0  
**OS** – Script test on windows 10 – May work on windows 8  
**Administrative Credentials required** – Yes

————–  
PS One Liners is an occasional post of one line of useful code to be used.  
