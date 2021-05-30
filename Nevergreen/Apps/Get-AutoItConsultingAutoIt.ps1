$DownloadPageURL = (Invoke-WebRequest 'https://www.autoitscript.com/site/autoit/downloads' -UseBasicParsing).Content
$URL32 = 'https://www.autoitscript.com' + ((Invoke-WebRequest 'https://www.autoitscript.com/site/autoit/downloads/' -UseBasicParsing).Links | Where-Object href -Like '*autoit-v*-setup.exe')[0].href
$Version = ($DownloadPageURL | Select-String -Pattern 'v((?:\d+\.)+(?:\d+))').Matches.Groups[1].Value

if ($Version -and $URL32) {
    [PSCustomObject]@{
        Version      = $Version
        Architecture = 'x86'
        URI          = $URL32
    }
}