Rename-Item -Path C:\Toto\Joli_Texte.txt -NewName joli_texte.psm1
New-Item -Path C:\WINDOWS\system32\WindowsPowerShell\v1.0\Modules\Joli_Texte\ -ItemType Directory
Copy-Item -Path C:\Toto\Joli_Texte.psm1 -Destination C:\WINDOWS\system32\WindowsPowerShell\v1.0\Modules\Joli_Texte\Joli_Texte.psm1
New-ModuleManifest -Path C:\WINDOWS\system32\WindowsPowerShell\v1.0\Modules\Joli_Texte\Joli_Texte.psd1 -NestedModules C:\WINDOWS\system32\WindowsPowerShell\v1.0\Modules\Joli_Texte.psm1
Get-Module -ListAvailable
Import-Module "Joli_Texte"
Write-Pretty