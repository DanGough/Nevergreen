$URL64,$URL32,$URLARM64 = Get-Link -Uri 'https://helpx.adobe.com/ca/download-install/kb/creative-cloud-desktop-app-download.html' -MatchProperty href -Pattern 'win64','win32','winarm64'
$Version64,$Version32,$VersionARM64 = $URL64,$URL32,$URLARM64 | Get-Version -Pattern 'ACCCx((?:\d+_)+\d+)\.zip$' -ReplaceWithDot

if ($Version64 -and $URL64) {
    [PSCustomObject]@{
        Version      = $Version64
        Architecture = 'x64'
        URI          = $URL64
    }
}

if ($Version32 -and $URL32) {
    [PSCustomObject]@{
        Version      = $Version32
        Architecture = 'x86'
        URI          = $URL32
    }
}

if ($VersionARM64 -and $URLARM64) {
    [PSCustomObject]@{
        Version      = $VersionARM64
        Architecture = 'ARM64'
        URI          = $URLARM64
    }
}