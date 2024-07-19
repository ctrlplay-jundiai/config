# Caminhos dos scripts
$addPortables = "$PSScriptRoot\scripts\Add-Portables.ps1"
$blockCustomizations = "$PSScriptRoot\scripts\Block-Customizations.ps1"
$installPrograms = "$PSScriptRoot\scripts\Install-Programs.ps1"
$installWinget = "$PSScriptRoot\scripts\Install-Winget.ps1"
$setWallpaper = "$PSScriptRoot\scripts\Set-Wallpaper.ps1"

# Função para executar um script PowerShell
function Invoke-Script {
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
Invoke-Script -scriptPath $setWallpaper
Invoke-Script -scriptPath $addPortables
Invoke-Script -scriptPath $installWinget
Invoke-Script -scriptPath $installPrograms
Invoke-Script -scriptPath $blockCustomizations

Write-Host "Configuracao efetuada com sucesso!" -ForegroundColor Green
Write-Host "AVISO: Lembre-se de instalar manualmente os seguintes programas: Construct3, Roblox Studio" -ForegroundColor Yellow -BackgroundColor Red
Write-Host "RECOMENDADO: Rode um Debloater (Ex: Windows Debloat Tools)" -ForegroundColor Cyan -BackgroundColor Blue
Read-Host "Pressione ENTER para sair"