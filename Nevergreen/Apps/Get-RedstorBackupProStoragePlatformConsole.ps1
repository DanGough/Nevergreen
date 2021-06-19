$DownloadPageURL = (Invoke-WebRequest 'https://support.redstor.com/hc/en-gb/sections/200458081-Downloads' -DisableKeepAlive -UseBasicParsing).Links | Where-Object href -Like '*Downloads-Redstor-Pro*' | Select-Object -ExpandProperty href -First 1

$DownloadPageURL = Set-UriPrefix -Uri $DownloadPageURL -Prefix 'https://support.redstor.com'

$URL32 = (Invoke-WebRequest $DownloadPageURL -DisableKeepAlive -UseBasicParsing).Links | Where-Object href -Like '*RedstorBackupPro-SP-Console*' | Select-Object -ExpandProperty href -First 1

if ($URL32 -match '((?:\d+\.)+\d+)\.exe$') {
    [PSCustomObject]@{
        Version      = $matches[1]
        Architecture = 'x86'
        URI          = $URL32
    }
}