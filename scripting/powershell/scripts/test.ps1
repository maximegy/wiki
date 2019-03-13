$var = Read-Host "blabla"
if ($var -match "^[\d\.]+$" -or $var -eq "d") {Write-Host "ok"}
else {write-host "nok"}

while (!($var -match '/^\d+(?:[.,]\d+)?$/' -or $var -eq "d")) {
    $var = Read-host "valeur non numérique"
}

break