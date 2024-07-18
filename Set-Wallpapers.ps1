# Caminho da imagem que você deseja definir como tela de fundo
$wallpaperPath = ".\Wallpapers\Wallpaper.jpg"

# Caminho da imagem que você deseja definir como tela de bloqueio
$lockScreenPath = ".\Wallpapers\Bloqueio.jpg"

# Resolver caminhos relativos para caminhos absolutos
$wallpaperPath = Resolve-Path $wallpaperPath
$lockScreenPath = Resolve-Path $lockScreenPath

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

# Função para definir a tela de bloqueio
function Set-LockScreenImage {
    param (
        [string]$path
    )

    # Verificar se a chave do registro existe, se não, criar
    $regPath = "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\PersonalizationCSP"
    if (-Not (Test-Path $regPath)) {
        New-Item -Path $regPath -Force
    }

    $bytes = [System.IO.File]::ReadAllBytes($path)
    $encodedImage = [System.Convert]::ToBase64String($bytes)

    Set-ItemProperty -Path "$regPath" -Name "LockScreenImageStatus" -Value 1 -Type Dword
    Set-ItemProperty -Path "$regPath" -Name "LockScreenImageUrl" -Value $path -Type String
    Set-ItemProperty -Path "$regPath" -Name "LockScreenImageUrlStatus" -Value 1 -Type Dword

    $UserKey = "HKCU:\Software\Microsoft\Windows\CurrentVersion\Lock Screen"
    if (-Not (Test-Path $UserKey)) {
        New-Item -Path $UserKey -Force
    }
    Set-ItemProperty -Path $UserKey -Name "CreativeId" -Value $encodedImage -Type String
}

Set-Wallpaper -path $wallpaperPath
Set-LockScreenImage -path $lockScreenPath