# Caminhos dos scripts
$addPortables = "$PSScriptRoot\scripts\Add-Portables.ps1"
$blockCustomizations = "$PSScriptRoot\scripts\Block-Customizations.ps1"
$installPrograms = "$PSScriptRoot\scripts\Install-Programs.ps1"
$setWallpaper = "$PSScriptRoot\scripts\Set-Wallpaper.ps1"

# Função para executar um script PowerShell
function Execute-Script {
    param (
        [string]$scriptPath
    )

    if (Test-Path $scriptPath) {
        Write-Output "Executando script: $scriptPath"
        & $scriptPath
    } else {
        Write-Error "O script $scriptPath não foi encontrado."
    }
}

# Executar os scripts
Execute-Script -scriptPath $setWallpaper
Execute-Script -scriptPath $addPortables
Execute-Script -scriptPath $installPrograms
Execute-Script -scriptPath $blockCustomizations