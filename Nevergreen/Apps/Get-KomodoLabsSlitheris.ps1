$Version = (Invoke-WebRequest 'https://www.komodolabs.com/product-downloads' -DisableKeepAlive -UseBasicParsing).Content | Get-Version -Pattern 'Slitheris Network Discovery v((?:\d+\.)+\d+)'

$URL32 = Get-Link -Uri 'https://www.komodolabs.com/product-downloads' -MatchProperty href -Pattern 'slitheris_installer\.exe$' | Set-UriPrefix -Prefix 'https://www.komodolabs.com'

New-NevergreenApp -Version $Version -Uri $URL32 -Architecture 'x86'