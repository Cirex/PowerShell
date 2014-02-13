$HISTORY_FILE = "$POWERSHELL\History.xml"

if ($PERSISTENT_SESSION)
{
  if (Test-Path $HISTORY_FILE)
  {
    Import-CliXml $HISTORY_FILE | Add-History
  }

  Register-EngineEvent PowerShell.Exiting { Get-History -Count $HISTORY_SIZE | Export-Clixml $HISTORY_FILE } -SupportEvent
}

function Clear-History-File
{
  if (Test-Path $HISTORY_FILE)
  {
    Clear-Item $HISTORY_FILE
  }
}