# Caminho da imagem que você deseja definir como tela de fundo
$wallpaperPath = "$PSScriptRoot\..\assets\Wallpaper.jpg"

# Resolver caminho relativo para caminho absoluto
$wallpaperPath = Resolve-Path $wallpaperPath

# Definir a tela de fundo
function Set-Wallpaper {
    param (
        [string]$path
    )

    Write-Host "Alterando wallpaper..." -ForegroundColor Cyan
    
    Add-Type -TypeDefinition @"
    using System;
    using System.Runtime.InteropServices;
    public class Wallpaper {
        [DllImport("user32.dll", CharSet=CharSet.Auto)]
        public static extern int SystemParametersInfo(int uAction, int uParam, string lpvParam, int fuWinIni);
    }
"@
    
    $result = [Wallpaper]::SystemParametersInfo(0x0014, 0, $path, 0x0001)
    
    if ($result -ne 0) {
        Write-Host "Wallpaper foi alterado com sucesso!" -ForegroundColor Green 
    } else {
        Write-Host "Falha ao tentar definir wallpaper" -ForegroundColor Red 
    }

    Read-Host -Prompt "Pressione qualquer tecla"
}

Set-Wallpaper -path $wallpaperPath
