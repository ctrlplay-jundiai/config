# Caminho da imagem que você deseja definir como tela de fundo
$wallpaperPath = ".\Wallpapers\Wallpaper.jpg"

# Resolver caminho relativo para caminho absoluto
$wallpaperPath = Resolve-Path $wallpaperPath

# Definir a tela de fundo
function Set-Wallpaper {
    param (
        [string]$path
    )
    
    Add-Type -TypeDefinition @"
    using System;
    using System.Runtime.InteropServices;
    public class Wallpaper {
        [DllImport("user32.dll", CharSet=CharSet.Auto)]
        public static extern int SystemParametersInfo(int uAction, int uParam, string lpvParam, int fuWinIni);
    }
"@
    
    [Wallpaper]::SystemParametersInfo(0x0014, 0, $path, 0x0001)
}

Set-Wallpaper -path $wallpaperPath
