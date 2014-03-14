############################
# Configuration
############################
$BACKUP       = 'D:\Backup'
$POWERSHELL   = 'D:\Backup\PowerShell'
$ENVIRONMENT  = 'D:\Environment'
$APPLICATIONS = 'D:\Applications'
$PROJECTS     = 'D:\Projects'

$PERSISTENT_SESSION = 1
$HISTORY_SIZE = 4096

$ENV:TERM       = 'msys'
$ENV:BROWSER    = 'chrome'
$ENV:EDITOR     = 'intype'
$ENV:GIT_EDITOR = $ENV:EDITOR

############################
# Vagrant
############################
$ENV:VAGRANT_DEFAULT_PROVIDER = 'hyperv'

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

set-variable -Name HOME -Value ($BACKUP) -Force
(get-psprovider FileSystem).Home = $BACKUP

. $POWERSHELL\Library\Aliases.ps1
. $POWERSHELL\Library\Backup.ps1
. $POWERSHELL\Library\Functions.ps1
. $POWERSHELL\Library\Git.ps1
. $POWERSHELL\Library\GitHub.ps1
. $POWERSHELL\Library\History.ps1
. $POWERSHELL\Library\Paths.ps1
. $POWERSHELL\Library\Prompt.ps1
. $POWERSHELL\Library\VisualStudio.ps1

Set-VisualStudio 2013

Append-Path $ENVIRONMENT\Android
Append-Path $ENVIRONMENT\FFmpeg\Bin
Append-Path $ENVIRONMENT\Gems\Bin
Append-Path $ENVIRONMENT\Git\Cmd
Append-Path $ENVIRONMENT\ImageMagick
Append-Path $ENVIRONMENT\MongoDB
Append-Path $ENVIRONMENT\NodeJS
Append-Path $ENVIRONMENT\Redis
Append-Path $ENVIRONMENT\Ruby\Bin
Append-Path $ENVIRONMENT\Tools

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