$Response = Invoke-WebRequest -Uri 'https://www.qgis.org/en/site/forusers/download.html' -UseBasicParsing

$URL64 = $Response.Links | Where-Object href -Like '*.msi' | Select-Object -First 1 -ExpandProperty href
$Version = ($URL64 | Select-String -Pattern '((?:\d+\.)+(?:\d+))').Matches.Groups[1].Value

$URL64LTR = $Response.Links | Where-Object href -Like '*.msi' | Select-Object -First 1 -Skip 1 -ExpandProperty href
$VersionLTR = ($URL64LTR | Select-String -Pattern '((?:\d+\.)+(?:\d+))').Matches.Groups[1].Value

if ($Version -and $URL64) {
    [PSCustomObject]@{
        Version      = $Version
        Architecture = 'x64'
        Channel      = 'Latest'
        URI          = $URL64
    }
}

if ($VersionLTR -and $URL64LTR) {
    [PSCustomObject]@{
        Version      = $VersionLTR
        Architecture = 'x64'
        Channel      = 'LTR'
        URI          = $URL64LTR
    }
}