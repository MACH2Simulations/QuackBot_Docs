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

function Get-PWDLS {
  param (
    [string]$UserName
  )
  return get-aduser $UserName -properties passwordlastset, lastLogon select name, passwordlastset, @{n='LastLogon';e={[DateTime]::FromFileTime($_.LastLogon)}}
}

function Get-StalePCDirty {
  return get-adcomputer -filter "Passwordlastset -lt '1/1/2020'" -properties *| Select name,passwordlastset  
}

function Invoke-Beep {
  param (
    [Int32]$Freq,
    [Int32]$Length
  )
  [console]::beep($Freq,$Length)
}