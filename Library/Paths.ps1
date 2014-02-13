function Append-Path([string]$Path) {
  if ((Test-Path $Path) -and (-not $ENV:PATH.Contains($Path)))
  {
    $ENV:PATH += ";$Path"
  }
}

function Append-Path-Extension([string]$Extension) {
  if (-not $ENV:PATHEXT.Contains($Extension))
  {
    $ENV:PATHEXT += ";.$Extension"
  }
}

function script:Shorten-Path([string]$Path)
{
   $Path = $Path.Replace($HOME, '~')
   $Path = $Path.Replace('^[^:]+::', $Null)
   $Path = $Path.Replace('\\(\.?)([^\\])[^\\]*(?=\\)', '\$1$2')
   return $Path
}
