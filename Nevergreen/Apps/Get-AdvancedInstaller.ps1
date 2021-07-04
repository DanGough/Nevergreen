$URL = Get-Link -Uri 'https://www.advancedinstaller.com/downloading.html' -MatchProperty href -Pattern '\.msi$' -PrefixDomain

$Version = Get-Link -Uri 'https://www.advancedinstaller.com/download.html' -MatchProperty title -Pattern 'Release Notes' | Get-Version

New-NevergreenApp -Name 'Advanced Installer' -Version $Version -Uri $URL -Architecture 'x86' -Type 'Msi'