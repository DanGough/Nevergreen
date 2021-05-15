$Version = ((Invoke-WebRequest 'https://helpx.adobe.com/ie/creative-cloud/release-note/cc-release-notes.html' -UseBasicParsing).Content | Select-String -Pattern '(\d.\d.\d.\d+).+mandatory release').Matches.Groups[1].Value
$URL32 = 'https://prod-rel-ffc-ccm.oobesaas.adobe.com/adobe-ffc-external/core/v1/wam/download?sapCode=KCCC&productName=Creative%20Cloud&os=win&environment=prod&api_key=CCHomeWeb1'

if ($Version -and $URL32) {
    [PSCustomObject]@{
        Version      = $Version
        Architecture = 'x86'
        URI          = $URL32
    }
}