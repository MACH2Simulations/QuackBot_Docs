+++
title = 'Get Logged In Users'
date =  '2019-01-20T12:08:24+00:00'
+++

Script a ‘week’ 00001111  
This script will allow you remotely to get the users logged in to windows computers based of a computer name  
It will also ask you for the username of a specific person and pop their location up.

```powershell
CLS
$col = 1 # For text colour, unneeded but it makes it a bit easier to prase
$COMPUTERS = Get-ADComputer -Filter "Name -like 'ComputerName-*'" | select -expandproperty Name
Write-Host "Please enter the USERNAME Of the student you want to find" -ForegroundColor red
$FindUser = Read-Host
Foreach ($computer in $COMPUTERS){
$q = (qwinsta /server:$computer | foreach { (($_.trim() -replace "\s+",","))} | ConvertFrom-Csv)
foreach ($item in $q) {
    $ID = $item | Select-Object -expand id 
    $user = $item | Select-Object -expand username
       $computer = "$computer".ToUpper()
       try {
           $FirstName = get-aduser $User | select -expandproperty GIVENName
           $lastname = get-aduser $User | select -expandproperty surname
           $form = get-aduser $User -Properties * | select -expandproperty description
           $year = get-aduser $User -Properties *| select -expandproperty office
           $Sam = get-aduser $User | select -expandproperty samaccountname
           $name = $firstname + " " + $lastname + " ($year$form)" + " $sam"
           if ($FindUser -contains $sam){
                Write-Host $name "Is on $computer" -ForegroundColor red
                msg * $name "Is on $computer"
           } 
           If ($col -eq 1){
               Write-host $name "Is on $computer" -foregroundColor Blue
               $col = 2
           }elseif ($col -eq 2){
                Write-host $name "Is on $computer" -foregroundColor Green
                $col = 3
           }else{
                Write-host $name "Is on $computer" -foregroundColor Red
                $col = 1
           }
                 }
       catch {
           [exception] | out-null
    } 
}
}
```

**PS Version** – Test on 5.0 Should work on 6.0  
**OS** – Script tested to run from Windows 10, against 7 and 10  
**Administrative Credentials required** – Yes, and on remote machines  
