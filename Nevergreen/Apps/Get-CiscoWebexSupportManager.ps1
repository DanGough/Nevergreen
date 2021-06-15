$Version = $null
$Version = ((Invoke-WebRequest 'https://welcome.webex.com/sc3300/supportcenter/site/siteabout.do?siteurl=welcome' -DisableKeepAlive -UseBasicParsing).Content | Select-String -Pattern '((?:\d+\.)+(?:\d+))' -AllMatches).Matches[1].Groups[0].Value
$URL32 = (Invoke-WebRequest 'https://welcome.webex.com/sc3300/supportcenter/site/downloads.do?siteurl=welcome' -DisableKeepAlive -UseBasicParsing).Links | Where-Object href -Like '*webexsc.msi' | Select-Object -ExpandProperty href -First 1

if ($Version -and $URL32) {
    [PSCustomObject]@{
        Version      = $Version
        Architecture = 'x86'
        URI          = $URL32
    }
}