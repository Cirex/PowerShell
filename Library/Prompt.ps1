function Prompt
{
  if (Git-Repository)
  {
    $Branch = Git-Branch
    $Status = Git-Status

    $Title += "GIT [Branch: $Branch]"

    $Status.Values | Foreach-Object { $Changes += $_ }
    if ($Changes -gt 0)
    {
      $Title += ' (Uncommited Changes)'
    }
  }

  Set-Title $Title

  $Path = Shorten-Path(Get-Location)

  Write-Host
  Write-Host '[' -NoNewLine -ForeGroundColor Red
  Write-Host $Path -NoNewLine -ForeGroundColor Yellow
  Write-Host ']' -ForeGroundColor Red

  return '$ '
}
