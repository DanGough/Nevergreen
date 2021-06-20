$Version = ((Invoke-WebRequest 'https://welcome.webex.com/sc3300/supportcenter/site/siteabout.do?siteurl=welcome' -DisableKeepAlive -UseBasicParsing).Content | Select-String -Pattern '(?:\d+\.)+(?:\d+)' -AllMatches).Matches.Groups.Value | Select-Object -Skip 1 -First 1
$URL32 = Get-Link -Uri 'https://welcome.webex.com/sc3300/supportcenter/site/downloads.do?siteurl=welcome' -MatchProperty href -Pattern 'webexsc\.msi$'

if ($Version -and $URL32) {
    [PSCustomObject]@{
        Version      = $Version
        Architecture = 'x86'
        URI          = $URL32
    }
}