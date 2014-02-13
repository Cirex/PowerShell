function Markdown([string]$Path)
{
  $Path = Resolve-Path $Path
  $Contents = Get-Content $Path -Raw

  $Response = Invoke-WebRequest -Uri 'https://api.github.com/markdown/raw' -Method POST -Body $Contents -ContentType 'text/x-markdown'
  $Response.Content | Out-File $ENV:TEMP\Markdown.html

  Start-Process -FilePath $ENV:BROWSER -ArgumentList $ENV:TEMP\Markdown.html
}