$URL32 = (Resolve-Uri -Uri 'https://cardstudio.zebra.com/download').Uri

$Version = $URL32 | Get-Version

New-NevergreenApp -Version $Version -Uri $URL32 -Architecture 'x86'