$Releases = @(
    @{Architecture = 'x64'; Type = 'exe'; Pattern = 'Notepad3_((?:\d+\.)+\d+)_Setup\.exe' }
    @{Architecture = 'x86'; Type = 'exe'; Pattern = 'Notepad3_((?:\d+\.)+\d+)_x86_Setup\.exe' }
)

foreach ($Release in $Releases) {
    try {
        $URL = Get-Link -Uri 'https://www.rizonesoft.com/downloads/notepad3/' -MatchProperty outerHTML -Pattern $Release.Pattern -ReturnProperty href -ErrorAction Stop
        $Version = Get-Version -Uri 'https://www.rizonesoft.com/downloads/notepad3/' -Pattern $Release.Pattern -ErrorAction Stop
        New-NevergreenApp -Name 'Notepad3' -Version $Version -Uri $URL -Architecture $Release.Architecture -Type $Release.Type
    }
    catch {
        Write-Error "$($MyInvocation.MyCommand): $($_.Exception.Message)"
    }
}