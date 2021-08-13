$Response = Invoke-WebRequest -Uri 'https://www.qgis.org/en/site/forusers/download.html' -DisableKeepAlive -UseBasicParsing

$URL64 = $Response.Links | Where-Object href -Like '*.msi' | Select-Object -First 1 -ExpandProperty href
$Version64 = $URL64 | Get-Version

$URL64LTR = $Response.Links | Where-Object href -Like '*.msi' | Select-Object -First 1 -Skip 1 -ExpandProperty href
$Version64LTR = $URL64LTR | Get-Version

New-NevergreenApp -Name 'QGIS' -Version $Version64 -Uri $URL64 -Architecture 'x64' -Channel 'Latest' -Type 'Msi'
New-NevergreenApp -Name 'QGIS' -Version $Version64LTR -Uri $URL64LTR -Architecture 'x64' -Channel 'LTR' -Type 'Msi'