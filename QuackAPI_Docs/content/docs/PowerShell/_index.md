+++
archetype = "chapter"
title = "PowerShell"
weight = 4
+++

Welcome to MACHS Scripts.  
Here you will find a collection of scripts, mostly PowerShell, to help with Active directory management and other automation tasks.  
  
These scripts, unless otherwise specified, and licensed under [GNU Affero General Public License v3.0](/license.md)  

--  

## Tips  

### ExecutionPolicy

When running these scripts, you may need to run the following command in PowerShell.  
This will allow you to run the script without a policy error.  
You can also add this as a parameter when setting up scheduled tasks.  

```powershell
Set-ExecutionPolicy -ExecutionPolicy Bypass
```
---

### Search Base

> -SearchBase  
> Specifies an Active Directory path to search under.  
> ***Can be Combined with***  
>-SearchScope  
>Specifies the scope of an Active Directory search. The acceptable values for this parameter are:  
>Base or 0  
>OneLevel or 1  
>Subtree or 2  

---
