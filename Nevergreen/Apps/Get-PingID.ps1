$content = Invoke-RestMethod 'https://prod-ping-sfc.zoominsoftware.io/api/bundle/pingid/toc?language=enus'
$Release = $content|Where-Object title -eq 'Release Notes'
$DestopRelease = $Release.childEntries|Where-Object title -eq 'PingID desktop app release notes'
$DestopVersion = $DestopRelease.childEntries|Select-Object -First 1|Select-Object -ExpandProperty title

$version = Get-Version -string $DestopVersion

$URL32 = Get-Link -Uri 'https://www.pingidentity.com/en/resources/downloads/pingid.html' -MatchProperty href -Pattern 'pc-client/PingID.exe'

New-NevergreenApp -Name 'PingID' -Version $Version -Uri $URL32 -Architecture 'x86' -Type 'Exe'