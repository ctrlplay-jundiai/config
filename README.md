# ✨ PC Config – Ctrl+Play 🖥️🚀
> Este repositório tem como objetivo documentar e padronizar a configuração dos computadores utilizados na escola – elaborado por: [Daniel Antunes](https://github.com/dannesx)
---
## Links
- [Formatação](#1-formatação)
- [Configuração Inicial do Windows](#2-configuração-inicial-do-windows)
- [Instalação de Programas](#3-instalação-de-programas)
- [Conta Local para os Alunos](#4-conta-local-para-os-alunos)
- [Logar Conta Google](#5-logar-conta-google)
## Documentação

### 1. Formatação
Abra o serviço de recuperação do próprio sistema operacional através do caminho. Apague todos os arquivos e restaure a partir do próprio dispositivo, é mais rápido que baixar pela nuvem e não consome dados (por volta de 4Gb).

> *OBS: O notebook deve estar conectado na energia*

```python
# Windows 10
'Configurações > Atualização e Segurança > Recuperação > Restaurar o PC'

# Windows 11
'Configurações > Recuperação > Restaurar o PC'
``` 
### 2. Configuração Inicial do Windows

```python
# Região
'Brasil'

# Teclado 
'Português (Brasil ABNT2)'

# WI-FI
'User: SALA1 e SALA2'
'Pass: cp4lun0s'


# Conta Microsoft (Uso Pessoal)
login = 'ctp.{serialNumber}@hotmail.com'
senha = 'Cplay1234'

# PIN (Número do Endereço da Escola)
PIN = '0658'

# Negar os serviços da Microsoft
# Não conectar um smartphone 
# Salvar somente arquivos neste computador
# Não atualizar para o Windows 11
```

1. Após o boot e as configurações iniciadas, iremos fazer um Debloat no Windows, utilizando o [Windows10Debloater](https://github.com/Sycnex/Windows10Debloater). Siga o exemplo do repositório

2. Desative a Inicialização automática do Edge e do OneDrive

### 3. Instalação de Programas

#### 🍫 Chocolatey
Abra o Windows PowerShell como administrador e execute este comando
```powershell
Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))
```

Então, execute o comando abaixo para fazer a instalação dos pacotes necessários

```powershell
choco install adobereader ccleaner git jetbrainsmono vscode winrar arduino blender godot nodejs python3 unity-hub xampp-81 -y
```

#### 🤖 Executáveis

Verifique a lista de [Programas](./Programas.md) para instalar os outros aplicativos restantes

### 4. Conta local para os alunos
Crie uma conta local com o nome `Alunos`, sem nenhum tipo de senha ou PIN. Para facilitar o processo durante as aulas

#### Configuração da barra de tarefas
```python
# Pesquisar
Mostrar Ícone de pesquisa

# Notícias e Interesses
Desligar

# Desmarcar: Mostrar botão Visão de Tarefas
```

#### Atalhos dos Programas
Certifique-se que todos os programas estão com atalhos na área de trabalho

- Arduino
- Blender
- Construct 3
- GameMaker
- Godot
- Google Chrome
- Kodu
- LMMS
- MagicaVoxel
- Piskel
- Roblox
- Scratch
- Stencyl
- Unity
- VSCode

### 5. Logar conta Google
Entre com a conta Google dos alunos no Chrome e no Drive
```python
login = 'actrlplay.j@gmail.com'
senha = 'ctrl1234'
