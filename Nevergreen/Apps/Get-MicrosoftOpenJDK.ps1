$Releases = @(
    @{Architecture = 'x64'; Type = 'msi'; Pattern = 'microsoft-jdk-11.+x64\.msi$'}
    @{Architecture = 'x64'; Type = 'zip'; Pattern = 'microsoft-jdk-11.+x64\.zip$'}
    @{Architecture = 'ARM64'; Type = 'msi'; Pattern = 'microsoft-jdk-11.+aarch64\.msi$'}
    @{Architecture = 'ARM64'; Type = 'zip'; Pattern = 'microsoft-jdk-11.+aarch64\.zip$'}
    @{Architecture = 'x64'; Type = 'msi'; Pattern = 'microsoft-jdk-17.+x64\.msi$'}
    @{Architecture = 'x64'; Type = 'zip'; Pattern = 'microsoft-jdk-17.+x64\.zip$'}
    @{Architecture = 'ARM64'; Type = 'msi'; Pattern = 'microsoft-jdk-17.+aarch64\.msi$'}
    @{Architecture = 'ARM64'; Type = 'zip'; Pattern = 'microsoft-jdk-17.+aarch64\.zip$'}
)

foreach ($Release in $Releases) {
    try {
        $URL = Get-Link -Uri 'https://docs.microsoft.com/en-gb/java/openjdk/download' -MatchProperty href -Pattern $Release.Pattern -ErrorAction Stop
        $Version = $URL | Get-Version
        New-NevergreenApp -Name 'Microsoft OpenJDK' -Version $Version -Uri $URL -Architecture $Release.Architecture -Type $Release.Type
    }
    catch {
        Write-Error "$($MyInvocation.MyCommand): $($_.Exception.Message)"
    }
}