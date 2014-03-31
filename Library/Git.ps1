function Git-Branch
{
  $Reference = git symbolic-ref HEAD

  if ($Reference)
  {
    $Branch = $Reference.Substring($Reference.LastIndexOf('/') + 1)
    return $Branch
  }
}

function Git-Status
{
  $Status = @{
    Modified = 0
    Added    = 0
    Deleted  = 0
    Renamed  = 0
  }

  $Differences = git diff-index HEAD --name-status
  foreach ($Difference in $Differences)
  {
    switch ($Difference[0])
    {
      'M' { $Status['Modified']++ }
      'A' { $Status['Added']++ }
      'D' { $Status['Deleted']++ }
      'R' { $Status['Renamed']++ }
    }
  }

  return $Status
}

function Git-Repository
{
  if (Test-Path '.git')
  {
    return $True
  }

  $Folder = (Get-Item .).Parent

  while ($Folder -ne $Null)
  {
    if (Test-Path ($Folder.FullName + '\.git'))
    {
      return $True
    }
    else
    {
      $Folder = $Folder.Parent
    }
  }

  return $False
}