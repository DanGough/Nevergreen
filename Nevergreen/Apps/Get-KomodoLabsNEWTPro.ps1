$Response = Invoke-WebRequest 'https://www.komodolabs.com/product-downloads' -DisableKeepAlive -UseBasicParsing
$URL32 = $Response.Links | Where-Object href -Like '*newtpro.exe' | Select-Object -ExpandProperty href -First 1

if ($URL32) {

    $URL32 = Set-UriPrefix -Uri $URL32 -Prefix 'https://www.komodolabs.com'

    if ($URL32 -and $Response.Content -match 'NEWT Professional v((?:\d+\.)+\d+)') {
        [PSCustomObject]@{
            Version      = $matches[1]
            Architecture = 'x86'
            URI          = $URL32
        }
    }
}