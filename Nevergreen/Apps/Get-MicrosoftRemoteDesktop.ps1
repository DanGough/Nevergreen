$URL64 = 'https://go.microsoft.com/fwlink/?linkid=2068602'
$URL32 = 'https://go.microsoft.com/fwlink/?linkid=2098960'
$URLARM64 = 'https://go.microsoft.com/fwlink/?linkid=2098961'

$Version = (Resolve-Uri -Uri $URL64).FileName | Get-Version

New-NevergreenApp -Version $Version -Uri $URL32 -Architecture 'x86'
New-NevergreenApp -Version $Version -Uri $URL64 -Architecture 'x64'
New-NevergreenApp -Version $Version -Uri $URLARM64 -Architecture 'ARM64'