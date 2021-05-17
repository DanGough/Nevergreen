$VersionDesktop = ((Invoke-WebRequest 'https://helpx.adobe.com/ie/creative-cloud/release-note/cc-release-notes.html' -UseBasicParsing).Content | Select-String -Pattern '((?:\d+\.)+\d+).+mandatory release').Matches.Groups[1].Value
$URLDesktop = 'https://prod-rel-ffc-ccm.oobesaas.adobe.com/adobe-ffc-external/core/v1/wam/download?sapCode=KCCC&productName=Creative%20Cloud&os=win&environment=prod&api_key=CCHomeWeb1'

$URL64ZipEnterprise = ((Invoke-WebRequest -Uri 'https://helpx.adobe.com/ca/download-install/kb/creative-cloud-desktop-app-download.html' -UseBasicParsing).Links | Where-Object href -Like '*win64*')[0].href
$Version64Enterprise = ($URL64ZipEnterprise | Select-String -Pattern 'ACCCx((?:\d+_)+(?:\d+)).zip$').Matches.Groups[1] -replace ("_", ".")
$URL64Enterprise = 'https://prod-rel-ffc-ccm.oobesaas.adobe.com/adobe-ffc-external/core/v1/wam/download?sapCode=KCCC&productName=Creative%20Cloud&os=win&environment=prod&api_key=CCHomeWeb1'

$URL32Enterprise = ((Invoke-WebRequest -Uri 'https://helpx.adobe.com/ca/download-install/kb/creative-cloud-desktop-app-download.html' -UseBasicParsing).Links | Where-Object href -Like '*win32*')[0].href
$Version32Enterprise = ($URL32Enterprise | Select-String -Pattern 'ACCCx((?:\d+_)+(?:\d+)).zip$').Matches.Groups[1] -replace ("_", ".")

$URLARM64Enterprise = ((Invoke-WebRequest -Uri 'https://helpx.adobe.com/ca/download-install/kb/creative-cloud-desktop-app-download.html' -UseBasicParsing).Links | Where-Object href -Like '*winarm64*')[0].href
$VersionARM64Enterprise = ($URLARM64Enterprise | Select-String -Pattern 'ACCCx((?:\d+_)+(?:\d+)).zip$').Matches.Groups[1] -replace ("_", ".")

if ($VersionDesktop -and $URLDesktop) {
    [PSCustomObject]@{
        Version      = $Version64Enterprise
        Architecture = 'x64'
        Edition      = 'Desktop'
        Type         = 'Exe'
        URI          = $URLDesktop
    }
}

if ($Version64Enterprise -and $URL64Enterprise) {
    [PSCustomObject]@{
        Version      = $Version64Enterprise
        Architecture = 'x64'
        Edition      = 'Enterprise'
        Type         = 'Exe'
        URI          = $URL64Enterprise
    }
}

if ($Version64Enterprise -and $URL64ZipEnterprise) {
    [PSCustomObject]@{
        Version      = $Version64Enterprise
        Architecture = 'x64'
        Edition      = 'Enterprise'
        Type         = 'Zip'
        URI          = $URL64ZipEnterprise
    }
}

if ($Version32Enterprise -and $URL32Enterprise) {
    [PSCustomObject]@{
        Version      = $Version32Enterprise
        Architecture = 'x86'
        Edition      = 'Enterprise'
        Type         = 'Zip'
        URI          = $URL32Enterprise
    }
}

if ($VersionARM64Enterprise -and $URLARM64Enterprise) {
    [PSCustomObject]@{
        Version      = $VersionARM64Enterprise
        Architecture = 'ARM64'
        Edition      = 'Enterprise'
        Type         = 'Zip'
        URI          = $URLARM64Enterprise
    }
}