+++
title = 'Machs Functions'
date = 2024-02-08T20:01:44Z
weight = 2
+++


This will be a large mishmash of useful PowerShell functions.  

> This contains everything from  

[One Liners](powershell/oneliners/)  

## To Pull In  

[Mach-Functions.psm1](../../Scripts/Mach-Functions.psm1)

```PowerShell  
Import-Module "C:\Scripts\Mach-Functions.psm1"
```

## Debug Write  

Possibly redundant, but you can use this to choose if to print certain elements to the console based on a passed through Boolean.

***Usage***

```Powershell
DBW "Text" "Colour" $trueORfalse
```

***Function***

```PowerShell
function DBW {
  param (
      [string]$ToPrint,
      [string]$Colour,
      [bool]$Shouldwrite
  )
  if ($Shouldwrite){
      Write-host $ToPrint -ForegroundColor $Colour
  }
}
```

## Get Password Last Set  

Gets the last time a password was set for the user

***Usage***

```PowerShell
Get-PWDLS "UserName"
```

***Function***

```PowerShell
function Get-PWDLS {
  param (
    [string]$UserName
  )
  return get-aduser $UserName -properties passwordlastset, lastLogon select name, passwordlastset, @{n='LastLogon';e={[DateTime]::FromFileTime($_.LastLogon)}}
}
```

## Get Stale PCs (Dirty Way)  

This is a very bad and dirty way of getting stale PCs  
This scans ALL of AD  

***Usage***

```PowerShell
Get-StalePCDirty
```

***Function***

```PowerShell
function Get-StalePCDirty {
  return get-adcomputer -filter "Passwordlastset -lt '1/1/2020'" -properties *| Select name,passwordlastset  
}
```

## Invoke Beep

Makes the computer Beep  

***Usage***  

```PowerShell
Invoke-Beep $Pitch $Length
```

***Function***

```PowerShell
function Invoke-Beep {
  param (
    [Int32]$Freq,
    [Int32]$Length
  )
  [console]::beep($Freq,$Length)
}
```
