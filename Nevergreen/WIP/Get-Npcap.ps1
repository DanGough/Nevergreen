#Working but exists on Github so submit to Evergreen

$URL = Get-Link -Uri 'https://nmap.org/npcap/' -MatchProperty href -Pattern 'npcap-(?:\d+\.)+\d+\.exe$' -PrefixParent

$Version = $URL | Get-Version

New-NevergreenApp -Name 'Npcap' -Version $Version -Uri $URL -Architecture 'Multi'