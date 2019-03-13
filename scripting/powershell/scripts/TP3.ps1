function Get-OSInfo {
    $OS = Get-WmiObject -Class Win32_OperatingSystem
    $Culture = Get-Culture
    $Drive = Get-PSDrive -PSProvider 'FileSystem'
    Write-Host "version : $($OS.Version)"
    Write-Host "Language : $($Culture.DisplayName)"
    Write-Host "Disque Install : $($OS.SystemDrive)"
    Write-Host "Disques Disponibles : $($Drive.Name): $($Drive.Free/1gb)"
    }
Get-OSInfo