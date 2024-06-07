+++ 
title = "Print Adder V2"
+++

> PrinterAddV2.exe is a command line Click to Run file that will progromatically readd printers served from a print server to a set value!  
This is useful for when group policy doesn't correctly add printers (which is a common issue with complicated, many or large GPOs) or if you want to have a shortcut to add many printers at once if you don't want to add printers via GPO.  
This can also delete all printers to get rid of the default stuff that windows creates (as it runs as the user running it they would need permissions to delete)  

## How To use  

> This shows it being ran from a CLI, this can be run as a startup program via GPO

```batch
PrinterAddV2.exe /qn /del "/s m2s-print1" "/p Office-Mono Office-Colour Reception-Direct" "/t 10" 

```  

/qn or /q - Should this run quietly, nothing shown to the user. (Optional)  
/del - Should it delete all the printers before adding the new ones. (Optional)  
/delonly - Should be the only arg passed, will only delete printers. (Optional)  
"/s \<PrintServer\>" - Must be contained in quotes, printer server should be plain ie MY-Server, do not add \\\ etc  - This should work with an IP.  
"/p \<Printer1\> \<Printer2\>" - Space Seperated list of printers, should match the Queue/Share name from the print server  
"/t 10" - Must be contained in quotes, how many times will it try to add the printer. Once is ***normally*** enough, but the default is 5. (Optional)

![Print Adder V2 - A Gui With a progress bar and status info](/PrintAdderV2.png)  

## Change Log  

### 1.1  

```text
Added Del Only  
Started to add dark mode  
```  

### 1.0 - Initail Build  

```text
First Working Build
Can Deploy
Can Delete
Added Extra args for Quite 

```
