$DownloadPageURL = (Invoke-WebRequest 'https://www.poly.com/gb/en/support/downloads-apps/hub-desktop' -UseBasicParsing).Content
$URL32 = 'https://www.poly.com' + ((Invoke-WebRequest 'https://www.poly.com/gb/en/support/downloads-apps/hub-desktop' -UseBasicParsing).Links | Where-Object href -Like '*PlantronicsHubInstaller.exe*')[0].href
$Version = ($DownloadPageURL | Select-String -Pattern 'Version ((?:\d+\.)+(?:\d+))').Matches.Groups[1].Value

if ($Version -and $URL32) {
    [PSCustomObject]@{
        Version      = $Version
        Architecture = 'x86'
        URI          = $URL32
    }
}