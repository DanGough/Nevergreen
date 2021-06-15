$Version = ((Invoke-WebRequest 'https://welcome.webex.com/sc3300/supportcenter/site/siteabout.do?siteurl=welcome' -UseBasicParsing).Content | Select-String -Pattern '((?:\d+\.)+(?:\d+))' -AllMatches).Matches[1].Groups[0].Value
$URL32 = ((Invoke-WebRequest 'https://welcome.webex.com/sc3300/supportcenter/site/downloads.do?siteurl=welcome' -UseBasicParsing).Links | Where-Object href -Like '*webexsc.msi')[0].href

if ($Version -and $URL32) {
    [PSCustomObject]@{
        Version      = $Version
        Architecture = 'x86'
        URI          = $URL32
    }
}