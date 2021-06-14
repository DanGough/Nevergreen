$Response = Invoke-WebRequest 'https://support.8x8.com/cloud-phone-service/voice/work-desktop/download-8x8-work-for-desktop' -UseBasicParsing

$URL32 = $Response.Links | Where-Object href -Like '*work-32-msi*.msi' | Select-Object -Expand href -First 1
$URL64 = $Response.Links | Where-Object href -Like '*work-64-msi*.msi' | Select-Object -Expand href -First 1

$Version32 = $URL32 -replace '.+work-32-msi-v((?:\d+\.)+\d+(?:-\d+)?).msi','$1' -replace '-','.'
$Version64 = $URL64 -replace '.+work-64-msi-v((?:\d+\.)+\d+(?:-\d+)?).msi','$1' -replace '-','.'

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