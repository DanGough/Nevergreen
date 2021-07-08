try {

    $URL = (Get-Link -Uri 'https://www.tmurgent.com/APPV/en/resources/AVME/349-avme-introduction' -MatchProperty href -Pattern '\.zip$' -PrefixDomain | Resolve-Uri).Uri

    $Version = $URL | Get-Version

    New-NevergreenApp -Name 'TMurgent AppVManifestEditor' -Version $Version -Uri $URL -Architecture 'x86' -Type 'Zip'

}
catch {
    Write-Error "$($MyInvocation.MyCommand): $($_.Exception.Message)"
}