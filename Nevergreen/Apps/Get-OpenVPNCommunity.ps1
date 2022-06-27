$version = Get-Version -Uri 'https://openvpn.net/community-downloads/' -Pattern 'OpenVPN ((?:\d+\.)+\d+)'

$URL32,$URL64 = Get-Link -Uri 'https://openvpn.net/community-downloads/' -MatchProperty href -Pattern '-x86.msi*$','-amd64.msi*$'

New-NevergreenApp -Name 'OpenVPNConnect' -Version $Version -Uri $URL32 -Architecture 'x86' -Type 'Msi'
New-NevergreenApp -Name 'OpenVPNConnect' -Version $Version -Uri $URL64 -Architecture 'x64' -Type 'Msi'