$VersionDesktop = ((Invoke-WebRequest 'https://helpx.adobe.com/ie/creative-cloud/release-note/cc-release-notes.html' -UseBasicParsing).Content | Select-String -Pattern '((?:\d+\.)+\d+).+mandatory release').Matches.Groups[1].Value
$URLDesktop = 'https://prod-rel-ffc-ccm.oobesaas.adobe.com/adobe-ffc-external/core/v1/wam/download?sapCode=KCCC&productName=Creative%20Cloud&os=win&environment=prod&api_key=CCHomeWeb1'

$DownloadPage64 = ((Invoke-WebRequest -Uri 'https://helpx.adobe.com/ca/download-install/kb/creative-cloud-desktop-app-download.html' -UseBasicParsing).Links | Where-Object href -Like '*win64*')[0].href
$Version64Enterprise = ($DownloadPage64 | Select-String -Pattern 'ACCCx((?:\d+_)+(?:\d+)).zip$').Matches.Groups[1] -replace ("_", ".")
$URL64Enterprise ='https://prod-rel-ffc-ccm.oobesaas.adobe.com/adobe-ffc-external/core/v1/wam/download?sapCode=KCCC&productName=Creative%20Cloud&os=win&guid=c80b30ab-33df-4350-9785-77b63d3fb633&contextParams=%7B%22component%22%3A%22cc-home%22%2C%22visitor_guid%22%3A%2280873655155223673852670279815058766993%22%2C%22browser%22%3A%22Chrome%22%2C%22context_guid%22%3A%22e2d73e93-7a99-4071-a32c-c61f83e06326%22%2C%22planCodeList%22%3A%22%22%2C%22installerWaitTime%22%3A30%2C%22updateCCD%22%3A%22true%22%2C%22secondarySapcodeList%22%3A%22%22%2C%22Product_ID_Promoted%22%3A%22KCCC%22%2C%22contextComName%22%3A%22Organic%3ACCH%22%2C%22contextSvcName%22%3A%22NO-CCD%22%2C%22contextOrigin%22%3A%22Organic%3ACCH%22%2C%22gpv%22%3A%22helpx.adobe.com%3Adownload-install%3Akb%3Acreative-cloud-desktop-app-download%22%2C%22AMCV_D6FAAFAD54CA9F560A4C98A5%2540AdobeOrg%22%3A%22870038026%257CMCMID%257C80873655155223673852670279815058766993%257CvVersion%257C5.0.0%22%2C%22mid%22%3A%2209147132003933883351319444832905857026%22%2C%22aid%22%3A%22%22%2C%22AppMeasurementVersion%22%3A%222.20.0%22%2C%22kaizenTrialDuration%22%3A7%7D&wamFeature=nuj-live&environment=prod&api_key=CCHomeWeb1'

if ($VersionDesktop -and $URLDesktop) {
    [PSCustomObject]@{
        Version      = $VersionDesktop
        Architecture = 'x64'
        Edition      = 'Desktop'
        URI          = $URLDesktop
    }
}

if ($Version64Enterprise -and $URL64Enterprise) {
    [PSCustomObject]@{
        Version      = $Version64Enterprise
        Architecture = 'x64'
        Edition      = 'Enterprise'
        URI          = $URL64Enterprise
    }
}