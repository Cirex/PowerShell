function Git-Branch
{
  $Reference = git symbolic-ref HEAD

  if ($Reference)
  {
    $Branch = $Reference.Substring($Reference.LastIndexOf('/') + 1)
    return $Branch
  }
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