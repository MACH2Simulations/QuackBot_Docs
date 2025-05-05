$LowThreshold = 12 ## 0 - 12 shows green
$MedThreshold = 14 ## 13-25 Shows yellow, 25-50 orange
$ErrorThreshold = 16 ## Above 50 Shows text in red
$Target = "1.1.1.1" #read-host ## Comment this line out with ## and uncomment the bellow line to get it to ask you for input on each run
##$Target = read-host
while($true){
start-sleep(1) ## Wait 1 second
$Response = test-connection $Target -Count 1 #Do the ping
if (  $PSVersionTable.PSVersion -lt 7){ #Check PS Version as they change the output info for V7
$Time = $Response | select -ExpandProperty ResponseTime
$IPV4 = $Response | select -ExpandProperty IPV4Address
$DEST = $Response | select -ExpandProperty Address 
}
else {
$Time = $Response | select -ExpandProperty Latency
$IPV4 = $Response | select -ExpandProperty Address
$DEST = $Response | select -ExpandProperty Address 
}
write-host "Pinged $DEST ($IPV4) THIS TOOK " -foregroundcolor blue -nonewline # Print info to console 
if ($time -le $LowThreshold){
write-host $time -foregroundcolor green -nonewline
write-host "MS"
}elseif($time -le $MedThreshold){
write-host $time -foregroundcolor yellow -nonewline
write-host "MS"
}elseif($time -le $ErrorThreshold){
write-host $time -foregroundcolor magenta -nonewline
write-host "MS"
}else{
write-host $time -foregroundcolor red -nonewline
write-host "MS"
}
}