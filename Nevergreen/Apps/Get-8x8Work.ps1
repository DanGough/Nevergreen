$URL32= ((Invoke-WebRequest 'https://support.8x8.com/cloud-phone-service/voice/work-desktop/download-8x8-work-for-desktop' -UseBasicParsing).Links | Where-Object href -Like '*work-32-msi*.msi')[0].href
$URL64 = ((Invoke-WebRequest 'https://support.8x8.com/cloud-phone-service/voice/work-desktop/download-8x8-work-for-desktop' -UseBasicParsing).Links | Where-Object href -Like '*work-64-msi*.msi')[0].href
$Version32 = ($URL32 | Select-String -Pattern 'work-32-msi-v((?:\d+\.)+(?:\d.+)).msi').Matches.Groups[1].Value
$Version64 = ($URL64 | Select-String -Pattern 'work-64-msi-v((?:\d+\.)+(?:\d.+)).msi').Matches.Groups[1].Value

if ($Version32 -and $URL32) {
    [PSCustomObject]@{
        Version      = $Version32
        Architecture = 'x86'
        URI          = $URL32
    }
}

if ($Version64 -and $URL64) {
    [PSCustomObject]@{
        Version      = $Version64
        Architecture = 'x64'
        URI          = $URL64
    }
}