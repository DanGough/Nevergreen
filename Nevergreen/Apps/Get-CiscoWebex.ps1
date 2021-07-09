$Version = Get-Version -Uri 'https://help.webex.com/en-us/mqkve8/Webex-Release-Notes' -Pattern 'Version:\s((?:\d+\.)+(?:\d+))</p>'

$URL32 = Get-Link -Uri 'https://help.webex.com/en-us/nw5p67g/Webex-Installation-and-Automatic-Upgrade' -MatchProperty href -Pattern 'Webex_x86\.msi'
$URL64 = Get-Link -Uri 'https://help.webex.com/en-us/nw5p67g/Webex-Installation-and-Automatic-Upgrade' -MatchProperty href -Pattern 'Webex\.msi'

New-NevergreenApp -Name 'Cisco Webex' -Version $Version -Uri $URL32 -Architecture 'x86' -Type 'Msi'
New-NevergreenApp -Name 'Cisco Webex' -Version $Version -Uri $URL64 -Architecture 'x64' -Type 'Msi'