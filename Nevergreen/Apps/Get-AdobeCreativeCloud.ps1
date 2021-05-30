$VersionDesktop = ((Invoke-WebRequest 'https://helpx.adobe.com/ie/creative-cloud/release-note/cc-release-notes.html' -UseBasicParsing).Content | Select-String -Pattern '((?:\d+\.)+\d+).+mandatory release').Matches.Groups[1].Value
$URLDesktop = 'https://prod-rel-ffc-ccm.oobesaas.adobe.com/adobe-ffc-external/core/v1/wam/download?sapCode=KCCC&productName=Creative%20Cloud&os=win&environment=prod&api_key=CCHomeWeb1'

$URL64ZipEnterprise = ((Invoke-WebRequest -Uri 'https://helpx.adobe.com/ca/download-install/kb/creative-cloud-desktop-app-download.html' -UseBasicParsing).Links | Where-Object href -Like '*win64*')[0].href
$Version64Enterprise = ($URL64ZipEnterprise | Select-String -Pattern 'ACCCx((?:\d+_)+(?:\d+)).zip$').Matches.Groups[1] -replace ("_", ".")
$URL64Enterprise = 'https://prod-rel-ffc-ccm.oobesaas.adobe.com/adobe-ffc-external/core/v1/wam/download?sapCode=KCCC&productName=Creative%20Cloud&os=win&guid=db6d0d93-606a-4dad-be46-4d7ca43fdf10&contextParams=%7B%22component%22%3A%22cc-home%22%2C%22visitor_guid%22%3A%2280873655155223673852670279815058766993%22%2C%22browser%22%3A%22Chrome%22%2C%22context_guid%22%3A%228929cf6c-c4f0-4dff-a1f5-d0a84e26caf6%22%2C%22planCodeList%22%3A%22dc_free%7Ccc_free%22%2C%22installerWaitTime%22%3A30%2C%22updateCCD%22%3A%22true%22%2C%22secondarySapcodeList%22%3A%22%22%2C%22Product_ID_Promoted%22%3A%22KCCC%22%2C%22userGuid%22%3A%22839D16724F1F72C40A490D45%40AdobeID%22%2C%22authId%22%3A%22839D16724F1F72C40A490D45%40AdobeID%22%2C%22contextComName%22%3A%22ACom%3ACCH%22%2C%22contextSvcName%22%3A%22NO-CCD%22%2C%22contextOrigin%22%3A%22ACom%3ACCH%22%2C%22gpv%22%3A%22helpx.adobe.com%3Adownload-install%3Akb%3Acreative-cloud-desktop-app-download%22%2C%22creative-cloud-referrer%22%3A%22https%3A%2F%2Fhelpx.adobe.com%2F%22%2C%22AMCV_D6FAAFAD54CA9F560A4C98A5%2540AdobeOrg%22%3A%22870038026%257CMCMID%257C80873655155223673852670279815058766993%257CvVersion%257C5.0.0%22%2C%22mid%22%3A%2209147132003933883351319444832905857026%22%2C%22aid%22%3A%22%22%2C%22AppMeasurementVersion%22%3A%222.20.0%22%2C%22kaizenTrialDuration%22%3A7%7D&wamFeature=nuj-live&environment=prod&api_key=CCHomeWeb1'

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