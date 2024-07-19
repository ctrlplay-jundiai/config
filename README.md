# ✨ PC Config – Ctrl+Play 🖥️🚀
> Este repositório tem como objetivo documentar e padronizar a configuração dos computadores utilizados na escola – elaborado por: [Daniel Antunes](https://github.com/dannesx)
---
## Links
- [✨ PC Config – Ctrl+Play 🖥️🚀](#-pc-config--ctrlplay-️)
  - [Links](#links)
  - [Documentação](#documentação)
    - [1. Formatação](#1-formatação)
    - [2. Configuração Inicial do Windows](#2-configuração-inicial-do-windows)
    - [3. Instalação de Programas](#3-instalação-de-programas)
    - [4. Conta local para os alunos](#4-conta-local-para-os-alunos)
      - [Configuração da barra de tarefas](#configuração-da-barra-de-tarefas)
      - [Atalhos dos Programas](#atalhos-dos-programas)
    - [5. Logar conta Google](#5-logar-conta-google)
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
'Português (Brasil ABNT)'

# WI-FI
'User: CP_ALUNOS'
'Pass: cp4lun0s'

# Conta Microsoft (Uso Pessoal)
login = 'actrlplay.j@hotmail.com'
senha = 'CtrlPlay@1234'

# PIN (Número do Endereço da Escola)
PIN = '0658'

# Negar os serviços da Microsoft
# Não conectar um smartphone 
# Salvar somente arquivos neste computador
# Não atualizar para o Windows 11
```

### 3. Instalação de Programas

Clone este repositório para a máquina e execute o arquivo `OpenTerminal.cmd` como adminstrador. Este é um comando que vai abrir o PowerShell no diretório atual com poderes elevados.

Agora rode o seguinte código:
```powershell
Set-ExecutionPolicy Unrestricted -Scope CurrentUser -Force; .\src\Config.ps1
```

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
- Google Drive
- LibreSprite
- LMMS
- MagicaVoxel
- Piskel
- Roblox Studio
- Unity
- VSCode
- XAMPP

### 5. Logar conta Google
Entre com a conta Google dos alunos no Chrome e no Drive
```python
login = 'actrlplay.j@gmail.com'
senha = 'CtrlPlay@1234'
```