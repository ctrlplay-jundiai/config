# Verificar se o winget está instalado
if (-not (Get-Command winget -ErrorAction SilentlyContinue)) {
  Write-Host "winget nao esta instalado. Instalando winget..." -ForegroundColor Yellow
  
  # Baixar o instalador do winget
  $wingetInstallerUrl = "https://aka.ms/getwinget"
  $wingetInstallerPath = "$env:TEMP\winget.msixbundle"
  Invoke-WebRequest -Uri $wingetInstallerUrl -OutFile $wingetInstallerPath
  
  # Instalar o winget
  Add-AppxPackage -Path $wingetInstallerPath
  
  # Remover o instalador após a instalação
  Remove-Item $wingetInstallerPath
  
  Write-Host "winget instalado com sucesso." -ForegroundColor Green
} else {
  Write-Host "winget ja esta instalado." -ForegroundColor Green
}
