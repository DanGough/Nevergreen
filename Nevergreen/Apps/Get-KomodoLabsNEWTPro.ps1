$Response = Invoke-WebRequest 'https://www.komodolabs.com/product-downloads' -UseBasicParsing
$URL32 = $Response.Links | Where-Object href -Like '*newtpro.exe' | Select-Object -ExpandProperty href -First 1

if ($URL32 -match '.exe$' -and $URL32 -notmatch '^http') {
    $URL32 = 'https://www.komodolabs.com' + $URL32
}

if ($URL32  -and $Response.Content -match 'NEWT Professional v((?:\d+\.)+\d+)') {
    [PSCustomObject]@{
        Version      = $matches[1]
        Architecture = 'x86'
        URI          = $URL32
    }
}