+++
title = 'One Liners'
date = 2024-02-08T20:01:44Z
weight = 1
+++


This page will be a selection of useful one-liners  

## Notes

When you see "$User", replace this with the username of the account you are querying.  
You may need to run "Import-Module ActiveDirectory" if things fail.  

> All of theses can be found as functions in  
>
[Mach's Functions](../../powershell/machsfunctions)

### Password Last Set  

```PowerShell
get-aduser $user -properties passwordlastset, lastLogon select name, passwordlastset, @{n='LastLogon';e={[DateTime]::FromFileTime($_.LastLogon)}}
```

### Computer Password Last Set  

This gets ALL COMPUTERS IN AD where there password was last set before the date, its a dirty way of finding VERY stale computers.  There are better ways of doing this and i will add
them to the site. But this works too.  

```PowerShell
get-adcomputer -filter "Passwordlastset -lt '1/1/2020'" -properties *| Select name,passwordlastset  
```

### Beep

Makes the computer beep.  

```PowerShell
[console]::beep(100,500) #First number is frequency, second is length
```
