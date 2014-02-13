${function:u} = { cd .. }
${function:...} = { cd ..\.. }
${function:....} = { cd ..\..\.. }
${function:.....} = { cd ..\..\..\.. }
${function:......} = { cd ..\..\..\..\.. }
${function:.......} = { cd ..\..\..\..\..\.. }

Set-Alias Link mklink
function mklink
{
  cmd /c mklink $Args
}

function Reboot
{
  shutdown /r /t 5
}