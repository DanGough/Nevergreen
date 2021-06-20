$Version = (Invoke-WebRequest 'https://www.autoitscript.com/site/autoit/downloads' -DisableKeepAlive -UseBasicParsing).Content | Get-Version -Pattern 'v((?:\d+\.)+\d+)'

$URL32 = Get-Link -Uri 'https://www.autoitscript.com/site/autoit/downloads' -MatchProperty href -Pattern 'autoit-v.+-setup\.exe' | Set-UriPrefix -Prefix 'https://www.autoitscript.com'

New-NevergreenApp -Version $Version -Uri $URL32 -Architecture 'x86'