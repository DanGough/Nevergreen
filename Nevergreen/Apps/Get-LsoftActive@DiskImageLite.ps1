$URL = Get-Link -Uri 'https://www.disk-image.com/download.htm' -MatchProperty href -Pattern '\DiskImageFreeSetup.exe$' -PrefixDomain
$Version = ((Invoke-WebRequest 'https://www.disk-image.com/history.htm' -DisableKeepAlive -UseBasicParsing).Content | Select-String -Pattern '(?:\d+\.)+(?:\d+)' -AllMatches).Matches.Groups.Value | Sort-Object { [version]$_ } -Descending | Select-Object -First 1

New-NevergreenApp -Name 'LSoft Active@ Disk Image Lite' -Version $Version -Uri $URL -Architecture 'x86' -Type 'Exe'