function Flac-ToMp3
{
  Param
  (
    [string]$Path = '.',
    [switch]$Delete = $False
  )

  if (Test-Path $Path -PathType Container)
  {
    $Files = Get-ChildItem $Path\*.flac
  }
  elseif ($Path -Match '.flac$')
  {
    $Files = Resolve-Path $Path
  }

  foreach ($File in $Files)
  {
    $Mp3 = $File -Replace 'flac$', 'mp3'
    Write-Host "Converting $File => $Mp3" -ForeGroundColor Green
    ffmpeg -loglevel panic -i $File -ar 44100 -ab 320k -y -ac 2 -map_metadata 0 -vn $Mp3
    if ($Delete)
    {
      Remove-Item $File
    }
  }
}
