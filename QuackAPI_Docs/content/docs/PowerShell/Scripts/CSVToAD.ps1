cls
Import-Module "C:\Scripts\Mach-Functions.psm1"
$Date = Get-Date -Format dd_MM_yyyy_hh_mm
$LogRoot = "C:\Data"
$Log = "$LogRoot\CSVADlog_$Date.txt"
Start-Transcript $log
$Debug = $false # Should we be verbose with printing info
$CSVAD = "$LogRoot\CSVAD.csv"
$CSVADdone = "$LogRoot\CSVADDone.csv"
$CSVADFailedToAdd = "$LogRoot\CSVADFailedToAdd.csv"
$CSVADGroup = "UserGroup"
$UserEmail = "`@EmailDomain.co.uk"

Write-Host "List $CSVAD LogList $CSVADdone Failed List $CSVADFailedToAdd Group Name $CSVADGroup Debug $Debug"
$users = Import-CSV $CSVAD
Write-Host "List Of Users $Users"
foreach ($User in $Users){
    DBW ($User.EmailOrUsername -eq "Delete_this_row") "blue" $false
    if ($User.EmailOrUsername -eq "Delete_this_row") {
        Write-Host "No users to add / instructions ignored, goodbye (Closeing)" -ForegroundColor Red
        Stop-Transcript
        exit 4
    }
    $User = $User.EmailOrUsername -replace "$UserEmail", "" 
    DBW "Trying to add $User To $CSVADGroup " "blue" $Debug
    try {
        Write-Host "Lets try to add the user"
        Add-ADGroupMember -Identity $CSVADGroup -Members $User
        $Name = Get-ADUser $User | Select -ExpandProperty Name
        Write-Host "Sucsess, lets add this to a file so i don't keep getting asked"
        [PSCustomObject] [ordered] @{
            'EmailOrUsername' = $User
            'Name'            = $Name
            'DateAdded'       = get-date -Format dd_MM_yyyy_HH_mm

        } | Export-Csv -Path "$CSVADdone" -NoTypeInformation -Append
    }
    catch {
        DBW "Failed to add $User, lets log this" "red" $Debug
        [PSCustomObject] [ordered] @{
            'EmailOrUsername' = $User
            'DateFailed'       = get-date -Format dd_MM_yyyy_hh_mm

        } | Export-Csv -Path "$CSVADFailedToAdd" -NoTypeInformation -Append
    }

}

[PSCustomObject] [ordered] @{
    'EmailOrUsername' = "Delete_this_row"
    'LastRun-dd-MM-yyyy-hh-mm' = Get-Date -Format dd_MM_yyyy_hh_mm 
} | Export-Csv -Path "$CSVAD" -NoTypeInformation
