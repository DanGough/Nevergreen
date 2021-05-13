$Resp = Invoke-WebRequest -Uri 'https://www.qgis.org/en/site/forusers/download.html' -UseBasicParsing

$UrlLatest = $Resp.Links | Where-Object href -Like '*.msi' | Select-Object -First 1 -ExpandProperty href
$VersionLatest = ($UrlLatest | Select-String -Pattern '((?:\d+\.)+(?:\d+))').Matches.Groups[1].Value

$UrlLtr = $Resp.Links | Where-Object href -Like '*.msi' | Select-Object -First 1 -Skip 1 -ExpandProperty href
$VersionLtr = ($UrlLtr | Select-String -Pattern '((?:\d+\.)+(?:\d+))').Matches.Groups[1].Value

if ($VersionLatest -and $UrlLatest) {
    [PSCustomObject]@{
        Version      = $VersionLatest
        Architecture = 'x64'
        Channel      = 'Latest'
        URI          = $UrlLatest
    }
}

if ($VersionLtr -and $UrlLtr) {
    [PSCustomObject]@{
        Version      = $VersionLtr
        Architecture = 'x64'
        Channel      = 'LTR'
        URI          = $UrlLtr
    }
}