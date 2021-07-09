$Version = Get-Version -Uri 'https://www.poly.com/gb/en/support/downloads-apps/hub-desktop' -Pattern 'Version ((?:\d+\.)+\d+)'

$URL32 = Get-Link -Uri 'https://www.poly.com/gb/en/support/downloads-apps/hub-desktop' -MatchProperty href -Pattern 'PlantronicsHubInstaller\.exe$' -PrefixDomain

New-NevergreenApp -Name 'Plantronics Hub' -Version $Version -Uri $URL32 -Architecture 'x86' -Type 'Exe'