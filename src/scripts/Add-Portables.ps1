# Caminho da pasta de origem
$LibreSprite = "$PSScriptRoot\..\portable\LibreSprite"
$MagicaVoxel = "$PSScriptRoot\..\portable\MagicaVoxel"
$Piskel = "$PSScriptRoot\..\portable\Piskel"

# Caminho da pasta de destino
$destinationFolder = [System.Environment]::GetEnvironmentVariable('ProgramFiles')

Write-Host "Copiando programas portateis para a pasta $destinationFolder" -ForegroundColor Cyan

# Copiar a pasta inteira recursivamente
Copy-Item -Path $LibreSprite -Destination $destinationFolder -Recurse -Force
Copy-Item -Path $MagicaVoxel -Destination $destinationFolder -Recurse -Force
Copy-Item -Path $Piskel -Destination $destinationFolder -Recurse -Force

# Função para criar um atalho na área de trabalho
function New-Shortcut {
    param (
        [string]$shortcutName,
        [string]$targetPath,
        [string]$description = "",
        [string]$iconLocation = ""
    )
    
    # Caminho da área de trabalho do usuário atual
    $desktop = [System.Environment]::GetFolderPath('Desktop')
    
    # Caminho completo do atalho
    $shortcutPath = Join-Path $desktop "$shortcutName.lnk"
    
    # Criar o objeto COM para manipular atalhos
    $WScriptShell = New-Object -ComObject WScript.Shell
    
    # Criar o atalho
    $shortcut = $WScriptShell.NewShortcut($shortcutPath)
    $shortcut.TargetPath = $targetPath
    $shortcut.Description = $description
    if ($iconLocation) {
        $shortcut.IconLocation = $iconLocation
    }
    
    # Salvar o atalho
    $shortcut.Save()
    
    Write-Host "Atalho criado: $shortcutPath" -ForegroundColor Green
}

# Criar atalhos para os programas copiados
New-Shortcut -shortcutName "LibreSprite" -targetPath "$destinationFolder\LibreSprite\LibreSprite.exe" -description "LibreSprite" -iconLocation "$destinationFolder\LibreSprite\LibreSprite.exe"
New-Shortcut -shortcutName "MagicaVoxel" -targetPath "$destinationFolder\MagicaVoxel\MagicaVoxel.exe" -description "MagicaVoxel" -iconLocation "$destinationFolder\MagicaVoxel\MagicaVoxel.exe"
New-Shortcut -shortcutName "Piskel" -targetPath "$destinationFolder\Piskel\Piskel.exe" -description "Piskel" -iconLocation "$destinationFolder\Piskel\Piskel.exe"

Write-Host "Processo concluido!" -ForegroundColor Green -BackgroundColor DarkGreen