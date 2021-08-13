try {

    $URL = (Get-Link -Uri 'https://www.tmurgent.com/APPV/en/buy/tmedit/tmedit-download' -MatchProperty href -Pattern '\.zip$' -PrefixDomain | Resolve-Uri).Uri

    $Version = $URL | Get-Version

    New-NevergreenApp -Name 'TMurgent TMEdit' -Version $Version -Uri $URL -Architecture 'x86' -Type 'Zip'

}
catch {
    Write-Error "$($MyInvocation.MyCommand): $($_.Exception.Message)"
}