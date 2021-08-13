$RetryCount = 3

for ($i = 0; $i -lt $RetryCount; $i++) {
    try {
        $Version = ((Invoke-WebRequest 'https://welcome.webex.com/sc3300/supportcenter/site/siteabout.do?siteurl=welcome' -DisableKeepAlive -UseBasicParsing -ErrorAction Stop).Content | Select-String -Pattern '(?:\d+\.)+(?:\d+)' -AllMatches).Matches.Groups.Value | Select-Object -Skip 1 -First 1
        $URL32 = Get-Link -Uri 'https://welcome.webex.com/sc3300/supportcenter/site/downloads.do?siteurl=welcome' -MatchProperty href -Pattern 'webexsc\.msi$'
        New-NevergreenApp -Name 'Cisco Webex Support Manager' -Version $Version -Uri $URL32 -Architecture 'x86' -Type 'Msi'
        break
    }
    catch {
        Write-Warning "Attempt $($i+1) failed, retrying..."
    }
}