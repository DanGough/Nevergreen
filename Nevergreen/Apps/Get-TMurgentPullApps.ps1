try {

    $URL = (Get-Link -Uri 'https://www.tmurgent.com/APPV/en/resources/tools-downloads/msix-tools/127-pullapps/511-pullapps-installation' -MatchProperty href -Pattern '\.zip$' -PrefixDomain | Resolve-Uri).Uri

    $Version = $URL | Get-Version

    New-NevergreenApp -Name 'TMurgent PullApps' -Version $Version -Uri $URL -Architecture 'x86' -Type 'Zip'

}
catch {
    Write-Error "$($MyInvocation.MyCommand): $($_.Exception.Message)"
}