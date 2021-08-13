$Version = Get-Version -Uri 'https://www.komodolabs.com/product-downloads' -Pattern 'Slitheris Network Discovery v((?:\d+\.)+\d+)'

$URL32 = Get-Link -Uri 'https://www.komodolabs.com/product-downloads' -MatchProperty href -Pattern 'slitheris_installer\.exe$' -PrefixDomain

New-NevergreenApp -Name 'Komodo Labs Slitheris' -Version $Version -Uri $URL32 -Architecture 'x86' -Type 'Exe'