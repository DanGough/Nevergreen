try {

    $URL = (Get-Link -Uri 'https://www.tmurgent.com/APPV/en/resources/tools-downloads/tools-downloads-appv5/89-tools/app-v-5-tools/159-appv-defcongroups' -MatchProperty href -Pattern '\.zip$' -PrefixDomain | Resolve-Uri).Uri

    $Version = Get-Version -Uri 'https://www.tmurgent.com/APPV/en/resources/tools-downloads/tools-downloads-appv5/89-tools/app-v-5-tools/159-appv-defcongroups' -Pattern '<td>((?:\d+\.)+\d+)'

    New-NevergreenApp -Name 'TMurgent AppVDefConGroups' -Version $Version -Uri $URL -Architecture 'x86' -Type 'Zip'

}
catch {
    Write-Error "$($MyInvocation.MyCommand): $($_.Exception.Message)"
}