function Write-PipeLineValue {
[cmdletbinding()]
param(
    [parameter(
        Mandatory         = $true,
        ValueFromPipeline = $true)]
    $pipelineInput
)
    Begin {
        Write-Host `n"Block de démarrage."
        Write-Host "-------------------------------------------------------------------------------"
    }
    Process {
        ForEach ($input in $pipelineInput) {
            Write-Host "Process [$($input.Name)] information"
            if ($input.Path) {
                Write-Host "Path: $($input.Path)"`n
            } else {
                Write-Host "Pas de path trouvé !"`n -ForegroundColor Red
            }
        }
    }
    End {
        Write-Host "-------------------------------------------------------------------------------"
        Write-Host "Block de fin."`n
    }
}