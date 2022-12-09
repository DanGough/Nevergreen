$Version = ((Invoke-RestMethod 'https://prod-ping-sfc.zoominsoftware.io/api/bundle/pingid/toc?language=enus').childEntries | Where-Object title -eq 'PingID desktop app release notes').childEntries | Select-Object -ExpandProperty title -First 1 | Get-Version

$URL32 = Get-Link -Uri 'https://www.pingidentity.com/en/resources/downloads/pingid.html' -MatchProperty outerHTML -Pattern 'download for windows'

New-NevergreenApp -Name 'PingID' -Version $Version -Uri $URL32 -Architecture 'x86' -Type 'Exe'