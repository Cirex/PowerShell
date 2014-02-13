############################
# Configuration
############################
$ENV:EDITOR     = 'notepad'
$ENV:GIT_EDITOR = $ENV:EDITOR
$ENV:BROWSER    = 'iexplore'

$PERSISTENT_SESSION = 1
$HISTORY_SIZE = 4096

############################
# Git
############################
$ENV:GIT_AUTHOR_NAME     = 'Benjamin Bloch'
$ENV:GIT_AUTHOR_EMAIL    = 'cirex@aethernet.org'
$ENV:GIT_COMMITTER_NAME  = $ENV:GIT_AUTHOR_NAME
$ENV:GIT_COMMITTER_EMAIL = $ENV:GIT_AUTHOR_EMAIL

############################
# GitHub
############################
$GITHUB_API_TOKEN = 'GITHUB_API_TOKEN'
$GITHUB_USER_NAME = 'Cirex'

############################
# Paths
############################
$BACKUP      = 'D:\Backup'
$POWERSHELL  = 'D:\Backup\PowerShell'
$ENVIRONMENT = 'D:\Environment'

set-variable -Name HOME -Value ($BACKUP) -Force
(get-psprovider FileSystem).Home = $BACKUP

. $POWERSHELL\Library\Git.ps1
. $POWERSHELL\Library\Paths.ps1
. $POWERSHELL\Library\Backup.ps1
. $POWERSHELL\Library\Prompt.ps1
. $POWERSHELL\Library\GitHub.ps1
. $POWERSHELL\Library\Aliases.ps1
. $POWERSHELL\Library\History.ps1
. $POWERSHELL\Library\Functions.ps1

Set-VisualStudio 2013

Append-Path $ENVIRONMENT\Git\Cmd
Append-Path $ENVIRONMENT\Git\Bin
Append-Path $ENVIRONMENT\Ruby\Bin
Append-Path $ENVIRONMENT\Gems\Bin
Append-Path $ENVIRONMENT\MySQL\Bin
Append-Path $ENVIRONMENT\FFmpeg\Bin
Append-Path $ENVIRONMENT\Nginx
Append-Path $ENVIRONMENT\Redis
Append-Path $ENVIRONMENT\NodeJS
Append-Path $ENVIRONMENT\Python
Append-Path $ENVIRONMENT\Android
Append-Path $ENVIRONMENT\MongoDB
Append-Path $ENVIRONMENT\ImageMagick
Append-Path $ENVIRONMENT\Utilities

Append-Path-Extension 'rb'
Append-Path-Extension 'rbw'
Append-Path-Extension 'py'
Append-Path-Extension 'pyw'

$ENV:HOME        = $POWERSHELL
$ENV:GEM_HOME    = $ENVIRONMENT + '\Gems'
$ENV:MAGICK_HOME = $ENVIRONMENT + '\ImageMagick'
$ENV:NODE_PATH   = $ENVIRONMENT + '\NodeJS\Node_Modules'

# ENV:IRBRC
# ENV:RDEBUGRC

Set-Location $HOME
[System.Environment]::CurrentDirectory = $HOME