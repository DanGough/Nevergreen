$DownloadPageURL = ((Invoke-RestMethod -Uri 'https://support.logi.com/api/v2/help_center/en-gb/articles.json?label_names=webcontent=productdownload,websoftware=9bf6fc93-8e0b-11e9-a62b-cb4c7fb3c2e2,webos=windows-Windows-10' -DisableKeepAlive).articles | Where-Object title -EQ 'Camera Settings').html_url

$URL32 = (Invoke-WebRequest -Uri $DownloadPageURL -DisableKeepAlive -UseBasicParsing).Links | Where-Object href -Like '*LogiCameraSettings*.exe' | Select-Object -ExpandProperty href -First 1

if ($URL32 -match '((?:\d+\.)+\d+)') {
    [PSCustomObject]@{
        Version      = $matches[1]
        Architecture = 'x86'
        URI          = $URL32
    }
}
