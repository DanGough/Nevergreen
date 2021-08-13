try {

    $URL64 = Get-Link -Uri 'https://www.python.org/downloads/windows/' -MatchProperty href -Pattern 'python-((?:\d+\.)+\d+)-amd64\.exe$'
    $Version = $URL64 | Get-Version
    New-NevergreenApp -Name 'Python' -Version $Version -Uri $URL64 -Architecture 'x64' -Type 'Exe'

    $URL32 = Get-Link -Uri 'https://www.python.org/downloads/windows/' -MatchProperty href -Pattern 'python-((?:\d+\.)+\d+)\.exe$'
    New-NevergreenApp -Name 'Python' -Version $Version -Uri $URL32 -Architecture 'x86' -Type 'Exe'

}
catch {
    Write-Error "$($MyInvocation.MyCommand): $($_.Exception.Message)"
}