# Caminhos dos scripts
$setWallpaperScript = ".\Set-Wallpaper.ps1"
$installProgramsScript = ".\Install-Programs.ps1"

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
Execute-Script -scriptPath $setWallpaperScript
Execute-Script -scriptPath $installProgramsScript

# Manter a janela aberta após a execução dos comandos
Read-Host -Prompt "Pressione Enter para fechar esta janela"
