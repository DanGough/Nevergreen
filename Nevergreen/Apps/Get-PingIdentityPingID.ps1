$Response = Invoke-RestMethod 'https://docs.pingidentity.com/api/khub/maps/v6hqiVhowIDI52XNglkuRw/pages' -DisableKeepAlive
$Version = (($Response.paginatedToc | Where-Object title -eq 'Release Notes').children | Where-Object title -eq 'PingID desktop app release notes').children[0].title | Get-Version

$URL = Get-Link -Uri 'https://www.pingidentity.com/en/resources/downloads/pingid.html' -MatchProperty outerHTML -Pattern 'download for windows'

New-NevergreenApp -Name 'PingID' -Version $Version -Uri $URL -Architecture 'x86' -Type 'Exe'