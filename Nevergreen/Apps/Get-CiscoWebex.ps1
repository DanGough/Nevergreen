$Version = Get-Version -Uri 'https://help.webex.com/en-us/article/mqkve8/Webex-App-%7C-Release-notes' -Pattern 'Windows[^\d]+((?:\d+\.)+(?:\d+))'

$URL32 = Get-Link -Uri 'https://help.webex.com/en-us/article/nw5p67g/Webex-App-%7C-Installation-and-automatic-upgrade' -MatchProperty href -Pattern 'Webex_x86\.msi'
$URL64 = Get-Link -Uri 'https://help.webex.com/en-us/article/nw5p67g/Webex-App-%7C-Installation-and-automatic-upgrade' -MatchProperty href -Pattern 'Webex\.msi'

New-NevergreenApp -Name 'Cisco Webex' -Version $Version -Uri $URL32 -Architecture 'x86' -Type 'Msi'
New-NevergreenApp -Name 'Cisco Webex' -Version $Version -Uri $URL64 -Architecture 'x64' -Type 'Msi'