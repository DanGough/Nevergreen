$URL32 = Get-Link -Uri 'https://www.advanced-ip-scanner.com' -MatchProperty href -Pattern 'Advanced_IP_Scanner.+\.exe'
$Version = $URL32 | Get-Version

New-NevergreenApp -Name 'Advanced IP Scanner' -Version $Version -Uri $URL32 -Architecture 'x86' -Type 'Exe'