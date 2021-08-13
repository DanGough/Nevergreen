$Response = Invoke-WebRequest 'https://community.mimecast.com/s/mimecast-for-outlook' -UseBasicParsing -UserAgent 'Googlebot/2.1 (+http://www.google.com/bot.html)'

$URL32 = ($Response.Links | Where-Object class -EQ 'cta-btn')[0].href.Replace('&amp;','&')
$URL64 = ($Response.Links | Where-Object class -EQ 'cta-btn')[1].href.Replace('&amp;','&')

$Version = $Response.Content | Get-Version -Pattern 'Build\s((?:\d+\.)+\d+)<'

New-NevergreenApp -Name 'Mimecast for Outlook' -Version $Version -Uri $URL32 -Architecture 'x86' -Type 'Zip'
New-NevergreenApp -Name 'Mimecast for Outlook' -Version $Version -Uri $URL64 -Architecture 'x64' -Type 'Zip'