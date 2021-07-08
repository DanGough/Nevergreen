try {

    $URL = (Get-Link -Uri 'https://www.tmurgent.com/APPV/en/buy/tmeditx/tmeditx-download' -MatchProperty href -Pattern '\.msix$' -PrefixDomain | Resolve-Uri).Uri

    $Version = $URL | Get-Version

    New-NevergreenApp -Name 'TMurgent TMEditX' -Version $Version -Uri $URL -Architecture 'x86' -Type 'MSIX'

}
catch {
    Write-Error "$($MyInvocation.MyCommand): $($_.Exception.Message)"
}