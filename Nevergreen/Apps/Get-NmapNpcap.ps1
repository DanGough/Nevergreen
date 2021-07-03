$URL = Get-Link -Uri 'https://nmap.org/npcap/' -MatchProperty href -Pattern 'npcap.+exe$' -PrefixParent

$Version = $URL | Get-Version

New-NevergreenApp -Name 'Nmap Npcap' -Version $Version -Uri $URL -Architecture 'Multi'