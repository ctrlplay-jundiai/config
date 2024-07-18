# Definir política de execução para o processo atual
Set-ExecutionPolicy Bypass -Scope Process -Force

# Caminhos dos scripts
$setWallpapersScript = ".\Set-Wallpapers.ps1"
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
Execute-Script -scriptPath $setWallpapersScript
Execute-Script -scriptPath $installProgramsScript