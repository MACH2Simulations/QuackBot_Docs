+++
title = "House Cleaning"
date = 2018-03-25T15:16:11Z
+++


Script a week  
This POTENTIALLY DESTRUCTIVE SCRIPT  
Removes all Windows 10 apps, various junkie files from the c drive then cleans up the system image

```powershell

####Script by Chris of TECHGUYBLOG.CO.UK (C) 2018
####Tested on PS 5.0 AND Should work on 6.0 
####  POTENTIALLY DESTRUCTIVE SCRIPT 
#### THIS SCRIPT ALSO REMOVES ALL WIN 10 APPS 
#### This script removes various files from the C drive of windows machines
#### It Then cleans up the system install image 
#region date
Get-AppxPackage -allusers | Remove-AppxPackage ####
$min = Get-Date '08:00'
$max = Get-Date '17:30'
$now = Get-Date
#endregion
#region clean
Remove-Item -path c:\temp\ -Recurse -Force
Remove-Item  c:\users\* -Force
Remove-Item -path c:\windows\temp\ -Recurse -Force
Remove-Item -path c:\windows.old\ -Recurse -Force
Remove-Item -path "c:\windows\Software Distribution.old\" -Recurse -Force
Remove-item -path "C:\Windows\ServiceProfiles\LocalService\AppData\Local\FontCache\" -Include FontCache-S-*.dat -Recurse -Force
#endregion
Remove-Item  c:\windows.old\ -Force
Remove-Item "c:\windows\Software Distribution.old\" -Force
#endregion 
#region CHECK FOR TIME, THEN REMOVE OLD IMAGES
if (((!($min.TimeOfDay -le $now.TimeOfDay -and $max.TimeOfDay -ge $now.TimeOfDay))) 
{
    Dism.exe /online /Cleanup-Image /StartComponentCleanup ## cleans up image
    Dism.exe /online /Cleanup-Image /StartComponentCleanup /ResetBase ##This gets rid of superseded windows images
    Dism.exe /online /Cleanup-Image /SPSuperseded ##More old superseded stuff removal

    msg * "Cleanup Ran"
}
elseif ($min.TimeOfDay -le $now.TimeOfDay -and $max.TimeOfDay -ge $now.TimeOfDay)
    {
        msg * "not run due to time"
    }
else
{ 
    #DO NOTHING
}
#endregion
Clear-RecycleBin -Force
gpupdate /force
##End Of House Cleaning Files

```

**WARNING** – POTENTIALLY DESTRUCTIVE SCRIPT

**PS Version** – Test on 5.0 Should work on 6.0  
**OS** – Script test on windows 10 – some dir changes may be required on older OS’  
**Administrative Credentials required** – Yes  
**Changes needed?** – Optional to remove the line that removes all win 1- apps and add or remove directory deletions