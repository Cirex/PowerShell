Set-Alias E Start-Explorer
function Start-Explorer([string]$Path = '.')
{
  $Path = Resolve-Path $Path
  if ($Path)
  {
    Explorer $Path
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
function Edit-File([string]$File)
{
  $File = Resolve-Path $File
  if ($File)
  {
    Start-Process -FilePath $ENV:EDITOR -ArgumentList $File
  }
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

function Invoke-BatchFile([string]$Path, [string]$Arguments)
{
  $TempFile = [IO.Path]::GetTempFileName()
  cmd.exe /c " `"$Path`" $Arguments && set > `"$TempFile`" "

  Get-Content $TempFile | Foreach-Object {
    if ($_ -Match '^(.*?)=(.*)$')
    {
      Set-Item -Path "ENV:\$($Matches[1])" -Value $Matches[2] -Force
    }
  }

  Remove-Item $TempFile
}

Set-Alias ?: Invoke-Ternary
filter Invoke-Ternary([scriptblock]$Condition, [scriptblock]$T, [scriptblock]$F)
{
  if (& $Condition) {& $T} else {& $F}
}

function Ask([string]$Question)
{
  while ($Choice -NotMatch 'y|yes|n|no')
  {
    $Choice = Read-Host "$Question (Y/N)"
  }

  return $Choice -Match 'y|yes'
}

function Write-FileHash
{
  $PSO = Get-FileHash @Args
  $File = $PSO.Path, $PSO.Algorithm.ToLower() -Join '.'
  $PSO.Hash | Out-File $File -NoClobber
}
