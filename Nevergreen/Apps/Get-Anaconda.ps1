$URL = Get-Link -Uri 'https://www.anaconda.com/products/individual' -MatchProperty href -Pattern '\.exe$'
$Version = $URL | Get-Version
New-NevergreenApp -Name 'Anaconda' -Version $Version -Uri $URL -Architecture 'x64' -Type 'exe'