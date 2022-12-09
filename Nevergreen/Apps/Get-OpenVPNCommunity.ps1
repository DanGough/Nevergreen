$Version = Get-Version -Uri 'https://openvpn.net/community-downloads/' -Pattern 'OpenVPN ((?:\d+\.)+\d+\S*)'

$Architectures = @('x64', 'x86', 'ARM64')

foreach ($Architecture in $Architectures) {
        $URL = Get-Link -Uri 'https://openvpn.net/community-downloads/' -MatchProperty href -Pattern "$($Architecture.Replace('x64','amd64'))\.msi$"
        New-NevergreenApp -Name 'OpenVPNCommunity' -Version $Version -Uri $URL -Architecture $Architecture -Type 'Msi'
}