$Apps = @(
    @{Architecture = 'x86'; Type = 'Exe'; Pattern = '(?:\d+\.)+\d+\.exe$' }
    @{Architecture = 'x64'; Type = 'Exe'; Pattern = '(?:\d+\.)+\d+-x64\.exe$' }
)

foreach ($App in $Apps) {
    try {
        $URL = Get-Link -Uri 'https://support.google.com/earth/answer/168344' -MatchProperty href -Pattern $App.Pattern
        $Version = $URL | Get-Version
        New-NevergreenApp -Name 'Google Earth Pro' -Version $Version -Uri $URL -Architecture $App.Architecture -Type $App.Type
    }
    catch {
        Write-Error "$($MyInvocation.MyCommand): $($_.Exception.Message)"
    }
}