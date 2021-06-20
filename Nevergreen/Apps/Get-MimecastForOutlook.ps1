$Response = Invoke-WebRequest 'https://community.mimecast.com/s/mimecast-for-outlook' -UseBasicParsing -UserAgent 'Googlebot/2.1 (+http://www.google.com/bot.html)'

$URL32 = ($Response.Links | Where-Object class -EQ 'cta-btn')[0].href.Replace('&amp;','&')
$URL64 = ($Response.Links | Where-Object class -EQ 'cta-btn')[1].href.Replace('&amp;','&')

$Version = $Response.Content | Get-Version -Pattern 'Build\s((?:\d+\.)+\d+)<'

if ($Version -and $URL32) {
    [PSCustomObject]@{
        Version      = $Version
        Architecture = 'x86'
        URI          = $URL32
    }
}

if ($Version -and $URL64) {
    [PSCustomObject]@{
        Version      = $Version
        Architecture = 'x64'
        URI          = $URL64
    }
}