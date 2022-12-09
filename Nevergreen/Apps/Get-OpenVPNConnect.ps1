$Version = Get-Version -Uri 'https://openvpn.net/client-connect-vpn-for-windows/' -Pattern 'Release notes for ((?:\d+\.)+\d+)'

$Releases = @(
    @{Architecture = 'x86'; Type = 'Msi'; Pattern = 'x86\.msi$'}
    @{Architecture = 'x64'; Type = 'Msi'; Pattern = 'windows\.msi$'}
)

foreach ($Release in $Releases) {
        $URL = Get-Link -Uri 'https://openvpn.net/client-connect-vpn-for-windows/' -MatchProperty href -Pattern $Release.Pattern
        New-NevergreenApp -Name 'OpenVPNConnect' -Version $Version -Uri $URL -Architecture $Release.Architecture -Type $Release.Type
}