$Version = Get-Version -Uri 'https://openvpn.net/community-downloads/' -Pattern 'OpenVPN ((?:\d+\.)+\d+\S*)'

$Releases = @(
    @{Architecture = 'x86'; Type = 'Msi'; Pattern = 'x86\.msi$'}
    @{Architecture = 'x64'; Type = 'Msi'; Pattern = 'amd64\.msi$'}
    @{Architecture = 'ARM64'; Type = 'Msi'; Pattern = 'arm64\.msi$'}
)

foreach ($Release in $Releases) {
        $URL = Get-Link -Uri 'https://openvpn.net/community-downloads/' -MatchProperty href -Pattern $Release.Pattern
        New-NevergreenApp -Name 'OpenVPNCommunity' -Version $Version -Uri $URL -Architecture $Release.Architecture -Type $Release.Type
}