+++
title = 'PowerShell PIP Bulk Installer'
weight = 10
+++

This script will bulk install a list of given Python modules and can be ran on user logon (once per device) using GPO.  
It then creates a text file so it doesn't reinstall the modules every time.  
Note: This will update and reinstall all the packages listed.  

## Requirements  

- Python installed to "All Users"  
- Pip Installed  
- PowerShell  

This has been tested and works with Python 3.10 - 3.13  

## The Script itself  

[Python_Packages_313.ps1](../../Python_Packages_313.ps1)  
[Python_Packages_313_Logger.ps1](../../Python_Packages_313_Logger.ps1)  

Update log path, Python path and the .txt file as appropriate for your environment.  

```powershell
if (!(Get-Item c:\Pip313.txt)){
    $PythonPath = "C:\Program Files\Python313\python.exe"
    if (Get-Item $PythonPath){
    $packages = "matplotlib","thonny","numpy","easygui","pyparsing","tomli", "piglet","astroid","pillow","sphinx","pygame","twine","python-docx"
    $Proxy = "1.1.1.1:9999"
    & $PythonPath -m pip install --upgrade pip --proxy "http://$Proxy" --trusted-host pypi.org --trusted-host pypi.python.org --trusted-host files.pythonhosted.org
    Start-Sleep -Seconds 10
    foreach ($Package in $Packages){
    & $PythonPath -m pip install $Package --force-reinstall --upgrade --proxy "http://$Proxy" --trusted-host pypi.org --trusted-host pypi.python.org --trusted-host files.pythonhosted.org
    }
    New-Item c:\Pip313.txt -Force
    }
    else{
        Write-Host "Python Is Not Installed"
    }
}
```

## The logging version

```powershell
if (!(Get-Item c:\Pip313.txt)){
    $Date = Get-Date -Format dd_MM_yyyy_hh_mm
    $HostN = HOSTNAME
    Start-Transcript "c:\$HostN`_$Date.txt" #Logging
    $PythonPath = "C:\Program Files\Python313\python.exe"
    if (Get-Item $PythonPath){
    $packages = "matplotlib","thonny","numpy","easygui","pyparsing","tomli", "piglet","astroid","pillow","sphinx","pygame","twine","python-docx"
    $Proxy = "1.1.1.1:9999"
    & $PythonPath -m pip install --upgrade pip --proxy "http://$Proxy" --trusted-host pypi.org --trusted-host pypi.python.org --trusted-host files.pythonhosted.org
    Start-Sleep -Seconds 10
    foreach ($Package in $Packages){
    & $PythonPath -m pip install $Package --force-reinstall --upgrade --proxy "http://$Proxy" --trusted-host pypi.org --trusted-host pypi.python.org --trusted-host files.pythonhosted.org
    }
    New-Item c:\Pip313.txt -Force
    }
    else{
        Write-Host "Python Is Not Installed"
    }
    Stop-Transcript 
}
```
