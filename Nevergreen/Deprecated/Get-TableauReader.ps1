$URL64 = (Resolve-Uri -Uri 'https://www.tableau.com/downloads/reader/pc64').Uri
$Version = $URL64 | Get-Version -Pattern '((?:\d+-)+\d+)\.exe$' -ReplaceWithDot

New-NevergreenApp -Name 'Tableau Reader' -Version $Version -Uri $URL64 -Architecture 'x64' -Type 'Exe'