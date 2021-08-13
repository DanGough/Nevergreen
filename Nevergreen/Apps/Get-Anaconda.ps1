try {

    $URL64 = Get-Link -Uri 'https://www.anaconda.com/products/individual' -MatchProperty href -Pattern 'Windows-x86_64\.exe$'
    $Version = $URL64 | Get-Version
    New-NevergreenApp -Name 'Anaconda' -Channel 'Individual' -Version $Version -Uri $URL64 -Architecture 'x64' -Type 'Exe'

    $URL32 = Get-Link -Uri 'https://www.anaconda.com/products/individual' -MatchProperty href -Pattern 'Windows-x86\.exe$'
    New-NevergreenApp -Name 'Anaconda' -Channel 'Individual' -Version $Version -Uri $URL32 -Architecture 'x86' -Type 'Exe'

}
catch {
    Write-Error "$($MyInvocation.MyCommand): $($_.Exception.Message)"
}