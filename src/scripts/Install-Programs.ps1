# Configurar o protocolo de segurança para download
[System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072

# Instalar Chocolatey
iex ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))

# Instalar pacotes usando Chocolatey
choco install adobereader git firacode vscode winrar arduino blender lmms nodejs python3 unity-hub xampp-74 googledrive googlechrome insomnia-rest-api-client teamviewer vlc pgadmin4 -y

# Instalar o Godot na versão 3.5.1
choco install godot --version=3.5.1 -y

# Instalar o Postgresql e definir a senha padrão
choco install postgresql --params '/Password:postgres'

# Função para instalar aplicativos usando winget
function Install-App {
  param (
    [string]$appName
  )
  
  try {
    Write-Host "Instalando $appName..." -ForegroundColor Cyan
    winget install --id $appName --accept-source-agreements --accept-package-agreements
    Write-Host "$appName instalado com sucesso!" -ForegroundColor Green
  } catch {
    Write-Host "Falha ao instalar $appName." -ForegroundColor Red
    Write-Error $_.Exception.Message
  }
}

# Lista de aplicativos para instalar
$apps = @(
  "InfiniteInstant.KoduGameLab",
  "MITMediaLab.Scratch.3",
  "YoYoGames.GameMaker.Studio.2"
)

# Instalar aplicativos
foreach ($app in $apps) {
  Install-App -appName $app
}