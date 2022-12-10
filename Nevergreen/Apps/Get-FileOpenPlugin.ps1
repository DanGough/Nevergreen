$Releases = @(
    @{Architecture = 'Multi'; Type = 'exe'; Pattern = '\.exe$' }
    @{Architecture = 'x64'; Type = 'msi'; Pattern = '64\.msi$' }
)

foreach ($Release in $Releases) {
    try {
        $URL = Get-Link -Uri 'https://plugin.fileopen.com/' -MatchProperty href -Pattern $Release.Pattern -PrefixDomain -ErrorAction Stop
        $Version = Get-Link -Uri 'https://plugin.fileopen.com/' -MatchProperty href -Pattern $Release.Pattern -ReturnProperty outerHTML -ErrorAction Stop | Get-Version -Pattern '\[(\d+(?:\.\d+)*)\]'
        New-NevergreenApp -Name 'FileOpen Plugin' -Version $Version -Uri $URL -Architecture $Release.Architecture -Type $Release.Type
    }
    catch {
        Write-Error "$($MyInvocation.MyCommand): $($_.Exception.Message)"
    }
}