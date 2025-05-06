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
