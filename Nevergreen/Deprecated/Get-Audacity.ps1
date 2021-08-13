try {

    $URL = Get-Link -Uri 'https://www.audacityteam.org/download/windows/' -MatchProperty href -Pattern '\.exe$'

    $Version = $URL | Get-Version

    New-NevergreenApp -Name 'Audacity' -Version $Version -Uri $URL -Architecture 'x86' -Type 'Exe'

}
catch {
    Write-Error "$($MyInvocation.MyCommand): $($_.Exception.Message)"
}