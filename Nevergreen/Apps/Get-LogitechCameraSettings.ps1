$DownloadPageURL = (Invoke-WebRequest 'https://support.logi.com/api/v2/help_center/en-gb/articles.json?label_names=webcontent=productdownload,websoftware=9bf6fc93-8e0b-11e9-a62b-cb4c7fb3c2e2,webos=windows-Windows-10' -UseBasicParsing).Content
$URL32 = ((($DownloadPageURL).Split('"=\,\"') | Select-String -Pattern '.exe')[1] | Out-String).Trim("")
$Version = ($URL32 | Select-String -Pattern 'LogiCameraSettings_((?:\d+\.)+(?:\d+)).exe').Matches.Groups[1].Value

if ($Version -and $URL32) {
    [PSCustomObject]@{
        Version      = $Version
        Architecture = 'x86'
        URI          = $URL32
    }
}
