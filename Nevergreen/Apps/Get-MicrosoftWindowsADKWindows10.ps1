$DownloadPageURL = (Invoke-WebRequest 'https://docs.microsoft.com/en-us/windows-hardware/get-started/adk-install' -UseBasicParsing).Content
$URL32 = ((Invoke-WebRequest 'https://docs.microsoft.com/en-us/windows-hardware/get-started/adk-install' -UseBasicParsing).Links | Where-Object href -Like '*https://go.microsoft.com*')[0].href
$Version = ($DownloadPageURL | Select-String -Pattern 'Download the Windows ADK for Windows 10, version (.+4)').Matches.Groups[1].Value

if ($Version -and $URL32) {
    [PSCustomObject]@{
        Version      = $Version
        Architecture = 'x86'
        URI          = $URL32
    }
}