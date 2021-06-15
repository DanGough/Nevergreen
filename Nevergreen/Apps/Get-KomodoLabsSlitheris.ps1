$Response = Invoke-WebRequest 'https://www.komodolabs.com/product-downloads' -DisableKeepAlive -UseBasicParsing
$URL32 = $Response.Links | Where-Object href -Like '*slitheris_installer.exe' | Select-Object -ExpandProperty href -First 1

if ($URL32) {

    if ($URL32 -notmatch '^http') {
        $URL32 = 'https://www.komodolabs.com' + $URL32
    }

    if ($Response.Content -match 'Slitheris Network Discovery v((?:\d+\.)+\d+)') {
        [PSCustomObject]@{
            Version      = $matches[1]
            Architecture = 'x86'
            URI          = $URL32
        }
    }
}