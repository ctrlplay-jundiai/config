# Definir política de execução para o processo atual
Set-ExecutionPolicy Bypass -Scope Process -Force

# Configurar o protocolo de segurança para download
[System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072

# Instalar Chocolatey
iex ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))

# Instalar pacotes usando Chocolatey
choco install adobereader git firacode vscode winrar arduino blender lmms nodejs python3 unity-hub xampp-74 googledrive googlechrome insomnia-rest-api-client teamviewer vlc -y