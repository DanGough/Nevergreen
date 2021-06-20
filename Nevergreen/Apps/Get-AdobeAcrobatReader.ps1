$DownloadPageURL = Get-Link -Uri 'https://www.adobe.com/devnet-docs/acrobatetk/tools/ReleaseNotesDC/index.html' -MatchProperty title -Pattern '^next chapter$' | Set-UriPrefix -Prefix 'https://www.adobe.com/devnet-docs/acrobatetk/tools/ReleaseNotesDC/'

$DownloadPage = Invoke-WebRequest -Uri $DownloadPageURL -DisableKeepAlive -UseBasicParsing

$Version = Get-Version -String $DownloadPage.Content -Pattern '<title>((?:\d+\.)+\w+)\s'

if ($Version -match 'x$') {
    # 21.001.201xx had different versions for Windows and Mac, assuming if this happens again it will follow the same pattern as last time:
    # "In this release there are different versions of application for win (21.001.200150) and mac (21.001.20149)."
    $Version = Get-Version -String $DownloadPage.Content -Pattern 'win\s\(((?:\d+\.)+\d+)\)'
}

$URL64,$URL32,$URL32MUI = Get-Link -Uri $DownloadPageURL -MatchProperty href -Pattern 'AcroRdrDCx64Upd\d+\.msp','AcroRdrDCUpd\d+\.msp','AcroRdrDCUpd\d+_MUI\.msp'

if ($Version -and $URL64) {
    [PSCustomObject]@{
        Version      = $Version
        Architecture = 'x64'
        Language     = 'Neutral'
        URI          = $URL64
    }
}

if ($Version -and $URL32) {
    [PSCustomObject]@{
        Version      = $Version
        Architecture = 'x86'
        Language     = 'Neutral'
        URI          = $URL32
    }
}

if ($Version -and $URL32MUI) {
    [PSCustomObject]@{
        Version      = $Version
        Architecture = 'x86'
        Language     = 'Multi'
        URI          = $URL32MUI
    }
}