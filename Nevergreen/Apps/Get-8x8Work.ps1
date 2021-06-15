$Links = (Invoke-WebRequest 'https://support.8x8.com/cloud-phone-service/voice/work-desktop/download-8x8-work-for-desktop' -DisableKeepAlive -UseBasicParsing).Links

$URL32 = $Links | Where-Object href -Like '*work-32-msi*.msi' | Select-Object -ExpandProperty href -First 1
$URL64 = $Links | Where-Object href -Like '*work-64-msi*.msi' | Select-Object -ExpandProperty href -First 1

if ($URL32 -match '((?:\d+\.)+\d+(?:-\d+)?)\.msi' ) {
    [PSCustomObject]@{
        Version      = $matches[1].Replace('-','.')
        Architecture = 'x86'
        URI          = $URL32
    }
}

if ($URL64 -match '((?:\d+\.)+\d+(?:-\d+)?)\.msi' ) {
    [PSCustomObject]@{
        Version      = $matches[1].Replace('-','.')
        Architecture = 'x64'
        URI          = $URL64
    }
}