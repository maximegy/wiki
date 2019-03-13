$dossier = Read-Host "Veuillez renseigner le dossier"
$fichier = Read-Host "Nom du fichier"
$chemin = "$dossier\$fichier"
Write-Host "L'export sera fait dans le fichier : $chemin"
if (!(Test-Path -Path $dossier)) {New-Item -ItemType "directory" -Path $dossier}
Get-Process | Select-Object Name,CPU | Sort-Object CPU -Descending | Out-File -FilePath $chemin 
notepad.exe $chemin
Start-Sleep -Seconds 10 & Get-Process *notepad* | Stop-Process
Remove-Item $chemin