# Função para definir uma chave de registro
function Set-RegistryValue {
    param (
        [string]$path,
        [string]$name,
        [object]$value,
        [string]$type = "String"
    )

    if (-Not (Test-Path $path)) {
        New-Item -Path $path -Force
    }
    Set-ItemProperty -Path $path -Name $name -Value $value -Type $type
}

# Bloquear a alteração do wallpaper
$wallpaperPolicyPath = "HKCU:\Software\Microsoft\Windows\CurrentVersion\Policies\ActiveDesktop"
Set-RegistryValue -path $wallpaperPolicyPath -name "NoChangingWallpaper" -value 1 -type "DWord"

# Bloquear mudanças nos ícones da área de trabalho
$desktopPolicyPath = "HKCU:\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer"
Set-RegistryValue -path $desktopPolicyPath -name "NoSaveSettings" -value 1 -type "DWord"

Write-Host "Configuracoes de personalizacao bloqueadas." -ForegroundColor Green -BackgroundColor DarkGreen
