$DownloadPageURL = (Invoke-WebRequest 'https://www.komodolabs.com/product-downloads' -UseBasicParsing).Content
$URL32 = 'https://www.komodolabs.com' + ((Invoke-WebRequest 'https://www.komodolabs.com/product-downloads' -UseBasicParsing).Links | Where-Object href -Like '*newtpro.exe')[0].href
$Version = ($DownloadPageURL | Select-String -Pattern 'NEWT Professional v((?:\d+\.)+(?:\d+))').Matches.Groups[1].Value

if ($Version -and $URL32) {
    [PSCustomObject]@{
        Version      = $Version
        Architecture = 'x86'
        URI          = $URL32
    }
}