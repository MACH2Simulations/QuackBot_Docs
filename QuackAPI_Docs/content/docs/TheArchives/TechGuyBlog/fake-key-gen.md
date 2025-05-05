---
title: 'Fake Key Gen'
date: '2018-10-14T14:58:50+00:00'
---
Script a ‘week’ 00001110

This script allows you to generate a large amount of steam like, Fake keys. This is designed for game devs to give a ton of fake keys to scammers to waste their time.

```powershell
####Script by Chris of TECHGUYBLOG.CO.UK (C) 2018
####Tested on PS 5.0 AND Should work on 6.0 
.SYNOPSIS
This file creates a list of fake steam sytax keys for sending to scammers and morons 
.DESCRIPTION
This file creates a list of fake steam sytax keys for sending to scammers and morons. 
It gets 5 numbers or letters and exports them in a CSV To a location of your desision in the format
WLGSV-RK9EB-N5H36
You can change the ammount of chars / letters by chaning $charcount
.INFO
You need R/W Permissions for the folder you are saving in, and the file needs to exsist
#>
$CharCount = 5
$RunAmmount = Read-Host "How many codes do you want to create"
$CSVLocation = Read-Host "Where do you want the CSV To Go"
$CSVName = Read-Host "What do you want the csv to be called"
for ($i=0; $i -le $RunAmmount; $i++){ #Create X ammount of keys
    $a = -join ((65..90) + (48..57) | Get-Random -Count $CharCount | % {[char]$_}) #Sets a to 5 random letters or numbers
    $b = -join ((65..90) + (48..57) | Get-Random -Count $CharCount | % {[char]$_}) #Sets b to 5 random letters or numbers
    $c = -join ((65..90) + (48..57) | Get-Random -Count $CharCount | % {[char]$_}) #Sets c to 5 random letters or numbers
    write-host $a-$b-$c -ForegroundColor Green #Prints the fake keys to the screen
    "$a-$b-$c" | out-file "$CSVLocation\$CSVNAME.csv" -Append #Dumps the keys in a csv
}
```

**PS Version** – Test on 5.0 Should work on 6.0  
**OS** – Script tested on windows 10  
**Administrative Credentials required** – NO, However R/W permission needed in directory you select  
**Changes needed?** – Optional change charnumber to fit syntax you need for your fake keys