function Restore-Fonts
{
  if (Test-Path $BACKUP\Fonts)
  {
    $Shell  = New-Object -ComObject Shell.Application
    $Folder = $Shell.Namespace(0x14)
    $Fonts  = Dir $BACKUP\Fonts

    foreach ($Font in $Fonts)
    {
      if ((Test-Path $ENV:WINDIR\Fonts\$Font) -eq $False)
      {
        $Folder.CopyHere($Font.FullName, 0x10)
      }
    }
  }
}

function Backup-Fonts
{
  $Fonts = Dir $ENV:WINDIR\Fonts -Include @('*.ttf', '*.otf') -Rec
  foreach ($Font in $Fonts)
  {
    Copy-Item -Path $Font -Destination "$BACKUP\Fonts" -Force
  }
}

function Restore-Wallpaper
{
  Link /J $ENV:WINDIR\Web\Wallpaper\$ENV:USERNAME $BACKUP\Wallpaper
}

function Restore-Profile
{
  if (Test-Path $Profile)
  {
    Remove-Item $Profile
  }
  Link $Profile $POWERSHELL\Profile.ps1
}

function Restore-Directories
{
  Link /J $APPLICATIONS $BACKUP\Applications
  Link /J $PROJECTS $BACKUP\Projects
}

function Backup
{
  Backup-Fonts
}

function Restore
{
  Restore-Fonts
  Restore-Profile
  Restore-Wallpaper
  Restore-Directories
}