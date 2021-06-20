$Version = (Invoke-WebRequest 'https://help.webex.com/en-us/mqkve8/Webex-Release-Notes' -UseBasicParsing).Content | Get-Version -Pattern 'Version:\s((?:\d+\.)+(?:\d+))</p>'

$URL32,$URL64 = Get-Link -Uri 'https://help.webex.com/en-us/nw5p67g/Webex-Installation-and-Automatic-Upgrade' -MatchProperty href -Pattern 'Webex_x86\.msi','Webex\.msi'

New-NevergreenApp -Version $Version -Uri $URL32 -Architecture 'x86'
New-NevergreenApp -Version $Version -Uri $URL64 -Architecture 'x64'