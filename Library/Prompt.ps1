function Prompt
{
  $Path = Shorten-Path(Get-Location)

  Write-Host '[' -NoNewLine -ForeGroundColor Blue
  Write-Host $Path -NoNewLine -ForeGroundColor Blue
  Write-Host ']' -ForeGroundColor Blue

  return '$ '
}