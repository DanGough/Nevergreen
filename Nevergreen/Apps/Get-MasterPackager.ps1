$URL32 = Get-Link -Uri 'https://www.masterpackager.com/pricing' -MatchProperty href -Pattern '\.msi$' -PrefixDomain

try {
    $Version = Get-Version -Uri 'https://www.masterpackager.com/uploads/file_archive/version.txt' ErrorAction Stop
}
catch {
    $Version = $URL32 | Get-Version
}

New-NevergreenApp -Name 'Master Packager' -Version $Version -Uri $URL32 -Architecture 'x86' -Type 'Msi'