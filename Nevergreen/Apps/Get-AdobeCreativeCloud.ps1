
$URL64 = (Invoke-WebRequest -Uri 'https://helpx.adobe.com/ca/download-install/kb/creative-cloud-desktop-app-download.html' -UseBasicParsing).Links | Where-Object href -Like '*win64*' | Select-Object -ExpandProperty href -First 1
$Version64 = ($URL64 | Select-String -Pattern 'ACCCx((?:\d+_)+\d+)\.zip$').Matches.Groups[1].Value.Replace("_", ".")

$URL32 = (Invoke-WebRequest -Uri 'https://helpx.adobe.com/ca/download-install/kb/creative-cloud-desktop-app-download.html' -UseBasicParsing).Links | Where-Object href -Like '*win32*' | Select-Object -ExpandProperty href -First 1
$Version32 = ($URL32 | Select-String -Pattern 'ACCCx((?:\d+_)+\d+)\.zip$').Matches.Groups[1].Value.Replace("_", ".")

$URLARM64 = (Invoke-WebRequest -Uri 'https://helpx.adobe.com/ca/download-install/kb/creative-cloud-desktop-app-download.html' -UseBasicParsing).Links | Where-Object href -Like '*winarm64*' | Select-Object -ExpandProperty href -First 1
$VersionARM64 = ($URLARM64 | Select-String -Pattern 'ACCCx((?:\d+_)+\d+)\.zip$').Matches.Groups[1].Value.Replace("_", ".")

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