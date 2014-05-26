$VISUAL_STUDIO = @{
  2013 = $ENV:VS120COMNTOOLS;
  2012 = $ENV:VS110COMNTOOLS;
  2011 = $ENV:VS100COMNTOOLS;
}

function Set-VisualStudio
{
  Param
  (
    [Parameter(Mandatory, HelpMessage = 'Enter Visual Studio version as 2010, 2012, or 2013')]
    [ValidateSet(2010, 2012, 2013)]
    [int]$Version,

    [Parameter(HelpMessage = 'Enter architecture as x86, or x86_amd64')]
    [ValidateSet('x86', 'x86_amd64')]
    [string]$Architecture = 'x86'
  )

  $Directory = $VISUAL_STUDIO[$Version]
  if ($Directory -eq $Null)
  {
    Write-Host "Visual Studio $Version not found." -ForeGroundColor Red
    return
  }

  $BatchFile = Join-Path $Directory '..\..\VC\vcvarsall.bat'
  Invoke-BatchFile -Path $BatchFile -Arguments $Architecture
}