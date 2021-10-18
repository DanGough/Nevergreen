$RetryCount = 3

for ($i = 0; $i -lt $RetryCount; $i++) {
    try {
        $Version = ((Invoke-WebRequest 'https://welcome.webex.com/svc3300/svccomponents/support/siteAbout.do?serviceID=9&siteurl=welcome' -DisableKeepAlive -UseBasicParsing -ErrorAction Stop).Content | Select-String -Pattern '(?:\d+\.)+(?:\d+)' -AllMatches).Matches.Groups.Value | Select-Object -Skip 1 -First 1
        $URL32 = "https://welcome.webex.com/client/T33L/aainstall.msi"
        New-NevergreenApp -Name 'Cisco Webex Access Anyhwere' -Version $Version -Uri $URL32 -Architecture 'x86' -Type 'Msi'
        break
    }
    catch {
        Write-Warning "Attempt $($i+1) failed, retrying... $_"
    }
}