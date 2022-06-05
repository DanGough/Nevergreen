$version = Get-Version -Uri 'https://openvpn.net/client-connect-vpn-for-windows/' -Pattern 'Release notes for ((?:\d+\.)+\d+)'

$URL32,$URL64 = Get-Link -Uri 'https://openvpn.net/client-connect-vpn-for-windows/' -MatchProperty href -Pattern 'windows-x86.msi','windows.msi'

New-NevergreenApp -Name 'OpenVPNConnect' -Version $Version -Uri $URL32 -Architecture 'x86' -Type 'Msi'
New-NevergreenApp -Name 'OpenVPNConnect' -Version $Version -Uri $URL64 -Architecture 'x64' -Type 'Msi'