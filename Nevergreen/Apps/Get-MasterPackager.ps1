$URL32 = Get-Link -Uri 'https://www.masterpackager.com/pricing' -MatchProperty href -Pattern '\.msi$' -PrefixDomain

$Version = $URL32 | Get-Version

New-NevergreenApp -Name 'Master Packager' -Version $Version -Uri $URL32 -Architecture 'x86'