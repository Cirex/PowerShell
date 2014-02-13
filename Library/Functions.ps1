Set-Alias Drive Set-Location-Backup
function Set-Location-Backup
{
  if (($BACKUP -ne $Null) -and (Test-Path $BACKUP))
  {
    pushd
    cd $BACKUP
  }
}

Set-Alias Hosts Edit-Hosts
function Edit-Hosts
{
  Edit-File $ENV:WINDIR\system32\drivers\etc\hosts
}

Set-Alias Profile Edit-Profile
function Edit-Profile
{
  Edit-File $Profile
}

Set-Alias Edit Edit-File
function Edit-File([string]$Path)
{
  Start-Process -FilePath $ENV:EDITOR -ArgumentList $Path
}

function Set-Title([string]$Title)
{
  if ([string]::IsNullOrEmpty($Title) -ne $True)
  {
    $HOST.UI.RawUI.WindowTitle = $Title
  }
}

function Time-Stamp
{
  return [System.DateTime]::Now.ToString('yyyy.MM.dd hh:mm:ss')
}

$VISUAL_STUDIO = @{
  2013 = $ENV:VS120COMNTOOLS;
  2012 = $ENV:VS110COMNTOOLS;
  2011 = $ENV:VS100COMNTOOLS;
}

function Set-VisualStudio
{
  param(
    [Parameter(Mandatory, HelpMessage = 'Enter Visual Studio version as 2010, 2012, or 2013')]
    [ValidateSet(2010, 2012, 2013)]
    [int]$Version,

    [Parameter(HelpMessage = 'Enter architecture as x86, or x86_amd64')]
    [ValidateSet('x86', 'x86_amd64')]
    [string]$Architecture = 'x86'
  )

  $Directory = $VISUAL_STUDIO[$Version]
  $BatchFile = Join-Path $Directory '..\..\VC\vcvarsall.bat'

  if ((Test-Path $BatchFile) -eq $False)
  {
    Write-Host "Visual Studio $Version not found."
    return
  }

  Invoke-BatchFile -Path $BatchFile -Arguments $Architecture
}

function Invoke-BatchFile([string]$Path, [string]$Arguments)
{
  $TempFile = [IO.Path]::GetTempFileName()
  cmd.exe /c " `"$Path`" $Arguments && set > `"$TempFile`" "

  Get-Content $TempFile | Foreach-Object {
    if ($_ -Match "^(.*?)=(.*)$")
    {
      Set-Item -Path "ENV:\$($Matches[1])" -Value $Matches[2] -Force
    }
  }

  Remove-Item $TempFile
}