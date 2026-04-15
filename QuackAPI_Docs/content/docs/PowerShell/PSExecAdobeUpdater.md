+++
title = 'PSExec Adobe Updater'
weight = 3
+++

Use this to invoke the Adobe Remote Updater using PSExec and a list of computers from AD. Runs on multiple devices at the same time.   

## Notes  

Requires PowerShell Version >7 due to Parallel Running  
If you don't have a local Adobe Update server be wary of saturating your bandwith doing too many devices at once.  


## The Script  

```powershell
$ComputerList = get-adcomputer -SearchBase "OU=Desktops,DC=CO,DC=UK" -filter * | select -ExpandProperty Name
$ComputerList | ForEach-Object -Parallel { 
 & "C:\Scripts\PSTools\PsExec64.exe" "\\$_" "C:\Program Files (x86)\Common Files\Adobe\OOBE_Enterprise\RemoteUpdateManager\RemoteUpdateManager.exe"
} -ThrottleLimit 20 
```  

Update SearchBase OU and ThrottleLimit as needed for your env  


---

