try {

    $URL = (Get-Link -Uri 'https://www.tmurgent.com/APPV/en/resources/AppV_Manage/221-appv-manage-introduction' -MatchProperty href -Pattern '\.zip$' -PrefixDomain | Resolve-Uri).Uri

    $Version = $URL | Get-Version

    New-NevergreenApp -Name 'TMurgent AppVManage' -Version $Version -Uri $URL -Architecture 'x86' -Type 'Zip'

}
catch {
    Write-Error "$($MyInvocation.MyCommand): $($_.Exception.Message)"
}