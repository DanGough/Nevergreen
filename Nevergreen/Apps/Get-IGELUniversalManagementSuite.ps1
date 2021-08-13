$URL64 = Get-Link -Uri 'https://www.igel.com/software-downloads/workspace-edition/' -MatchProperty 'data-filename' -Pattern 'setup-igel-ums-windows.+\.exe' -ReturnProperty 'data-filename'
$Version = $URL64 | Get-Version

New-NevergreenApp -Name 'IGEL Universal Management Suite' -Version $Version -Uri $URL64 -Architecture 'x64' -Type 'Exe'