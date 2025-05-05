$LoggedInUsers =  (Get-WMIObject -ClassName Win32_ComputerSystem).Username.substring(4) 
$Dirs = Get-ChildItem c:\users\ -Exclude "Public", $LoggedInUsers,"Default" | select -ExpandProperty Name
get-volume
foreach ($dir in $dirs) {
write-host "Trying to remove profile with path of $dir" -forgroundcolor green
Get-CimInstance -Class Win32_UserProfile | Where-Object { $_.LocalPath.split('\')[-1] -eq $dir } | Remove-CimInstance
write-host "Removable attempt complete" -forgroundcolor blue
}

shutdown -r -t 0 -f