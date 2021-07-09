$Version = Get-Version -Uri 'https://www.komodolabs.com/product-downloads' -Pattern 'NEWT Professional v((?:\d+\.)+\d+)'

$URL32 = Get-Link -Uri 'https://www.komodolabs.com/product-downloads' -MatchProperty href -Pattern 'newtpro\.exe$' -PrefixDomain

New-NevergreenApp -Name 'Komodo Labs NEWT Pro' -Version $Version -Uri $URL32 -Architecture 'x86' -Type 'Exe'