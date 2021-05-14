$DownloadPageURL = 'https://www.adobe.com/devnet-docs/acrobatetk/tools/ReleaseNotesDC/' + ((Invoke-WebRequest -Uri 'https://www.adobe.com/devnet-docs/acrobatetk/tools/ReleaseNotesDC/index.html' -UseBasicParsing).Links | Where-Object title -EQ 'next chapter' | Select-Object -First 1 -ExpandProperty href)
$DownloadPage = Invoke-WebRequest -Uri $DownloadPageURL -UseBasicParsing
$Version = ($DownloadPage.Content | Select-String -Pattern '<title>(\d+\.\d+\.\w+)\s').Matches.Groups[1].Value

if ($Version -match '\D$') {
    $Version = ($DownloadPage.Content | Select-String -Pattern 'win\s\((\d+\.\d+\.\d+)\)').Matches.Groups[1].Value
}

$URL64 = ($DownloadPage.Links | Where-Object href -Like '*AcrobatDCx64Upd*.msp')[0].href
$URL32 = ($DownloadPage.Links | Where-Object href -Like '*AcrobatDCUpd*.msp')[0].href

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