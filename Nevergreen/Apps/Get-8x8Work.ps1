$URL32,$URL64 = Get-Link -Uri 'https://support.8x8.com/cloud-phone-service/voice/work-desktop/download-8x8-work-for-desktop' -MatchProperty href -Pattern 'work-32-msi','work-64-msi'

$Version32,$Version64 = $URL32,$URL64 | Get-Version -Pattern '((?:\d+\.)+\d+(?:-\d+)?)' -ReplaceWithDot

if ($URL32 -and $Version32) {
    [PSCustomObject]@{
        Version      = $Version32
        Architecture = 'x86'
        URI          = $URL32
    }
}

if ($URL64 -and $Version64) {
    [PSCustomObject]@{
        Version      = $Version64
        Architecture = 'x64'
        URI          = $URL64
    }
}