# Definir política de execução para o processo atual
Set-ExecutionPolicy Bypass -Scope Process -Force

# Caminho relativo da imagem que você deseja definir como tela de fundo
$relativeWallpaperPath = ".\Wallpapers\Wallpaper.jpg"

# Caminho relativo da imagem que você deseja definir como tela de bloqueio
$relativeLockScreenPath = ".\Wallpapers\Bloqueio.jpg"

# Resolver caminhos relativos para caminhos absolutos
$wallpaperPath = Resolve-Path $relativeWallpaperPath
$lockScreenPath = Resolve-Path $relativeLockScreenPath

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

    $bytes = [System.IO.File]::ReadAllBytes($path)
    $encodedImage = [System.Convert]::ToBase64String($bytes)

    Set-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\PersonalizationCSP" -Name "LockScreenImageStatus" -Value 1 -Type Dword
    Set-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\PersonalizationCSP" -Name "LockScreenImageUrl" -Value $path -Type String
    Set-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\PersonalizationCSP" -Name "LockScreenImageUrlStatus" -Value 1 -Type Dword

    $UserKey = "HKCU:\Software\Microsoft\Windows\CurrentVersion\Lock Screen"
    if (-Not (Test-Path $UserKey)) {
        New-Item -Path $UserKey
    }
    Set-ItemProperty -Path $UserKey -Name "CreativeId" -Value $encodedImage -Type String
}

Set-Wallpaper -path $wallpaperPath
Set-LockScreenImage -path $lockScreenPath

# Manter a janela aberta após a execução dos comandos
Read-Host -Prompt "Pressione Enter para fechar esta janela"