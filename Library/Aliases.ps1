${function:up} = { cd .. }
${function:...} = { cd ..\.. }
${function:....} = { cd ..\..\.. }
${function:.....} = { cd ..\..\..\.. }
${function:......} = { cd ..\..\..\..\.. }
${function:.......} = { cd ..\..\..\..\..\.. }

Set-Alias grep       $ENVIRONMENT\Git\Bin\grep.exe
Set-Alias touch      $ENVIRONMENT\Git\Bin\touch.exe
Set-Alias gpg        $ENVIRONMENT\Git\Bin\gpg.exe
Set-Alias scp        $ENVIRONMENT\Git\Bin\scp.exe
Set-Alias ssh        $ENVIRONMENT\Git\Bin\ssh.exe
Set-Alias ssh-keygen $ENVIRONMENT\Git\Bin\ssh-keygen.exe
Set-Alias openssl    $ENVIRONMENT\Git\Bin\openssl.exe

Set-Alias atom $ENV:EDITOR
Set-Alias vlc  $ENV:MEDIA_PLAYER

Set-Alias Link mklink
function mklink
{
  cmd /C "mklink $Args"
}

function Halt
{
  Shutdown /S /T 5
}

function Reboot
{
  Shutdown /R /T 5
}

function Reload
{
  . $Profile
}

Set-Alias Drive Set-Location-Backup
function Set-Location-Backup
{
  if (Test-Path $BACKUP)
  {
    pushd $BACKUP
  }
}

Set-Alias Home Set-Location-Home
function Set-Location-Home
{
  pushd ~
}

Set-Alias Desktop Set-Location-Desktop
function Set-Location-Desktop
{
  pushd $ENV:USERPROFILE\Desktop
}

Set-Alias Project Set-Location-Project
function Set-Location-Project([string]$Project)
{
  $Paths = $BACKUP, $HOME, $ENV:USERPROFILE
  foreach ($Path in $Paths)
  {
    $Path = "$Path\Projects\$Project"
    if (Test-Path $Path)
    {
      pushd $Path
      return
    }
  }
  Write-Host "Project $Project not found." -ForeGroundColor Red
}