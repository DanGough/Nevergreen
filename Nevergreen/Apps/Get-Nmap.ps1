$URL = Get-Link -Uri 'https://nmap.org/download.html' -MatchProperty href -Pattern 'nmap-(?:\d+\.)+\d+-setup\.exe$'
$Version = $URL | Get-Version

New-NevergreenApp -Name 'Nmap' -Version $Version -Uri $URL -Architecture 'x86' -Type 'Exe'