$DownloadPageURL = Get-Link -Uri 'https://www.adobe.com/devnet-docs/acrobatetk/tools/ReleaseNotesDC/index.html' -MatchProperty title -Pattern '^next chapter$' | Set-UriPrefix -Prefix 'https://www.adobe.com/devnet-docs/acrobatetk/tools/ReleaseNotesDC/'

$DownloadPage = Invoke-WebRequest -Uri $DownloadPageURL -DisableKeepAlive -UseBasicParsing

$Version = Get-Version -String $DownloadPage.Content -Pattern '<title>((?:\d+\.)+\w+)\s'

if ($Version -match 'x$') {
    # 21.001.201xx had different versions for Windows and Mac, assuming if this happens again it will follow the same pattern as last time:
    # "In this release there are different versions of application for win (21.001.200150) and mac (21.001.20149)."
    $Version = Get-Version -String $DownloadPage.Content -Pattern 'win\s\(((?:\d+\.)+\d+)\)'
}

$URL32,$URL64,$URL32MUI = Get-Link -Uri $DownloadPageURL -MatchProperty href -Pattern 'AcroRdrDCUpd\d+\.msp','AcroRdrDCx64Upd\d+\.msp','AcroRdrDCUpd\d+_MUI\.msp'

New-NevergreenApp -Version $Version -Uri $URL32 -Architecture 'x86' -Language 'Neutral'
New-NevergreenApp -Version $Version -Uri $URL64 -Architecture 'x64' -Language 'Neutral'
New-NevergreenApp -Version $Version -Uri $URL32MUI -Architecture 'x86' -Language 'Multi'