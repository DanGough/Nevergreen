# MSIX links on site out of date
try {

    $URL = (Get-Link -Uri 'https://www.tmurgent.com/APPV/en/resources/tools-downloads/msix-tools/128-msix-tools/557-psftoolingv48' -MatchProperty href -Pattern '\.msix$' -PrefixDomain | Resolve-Uri).Uri

    $Version = $URL | Get-Version

    New-NevergreenApp -Name 'TMurgent PsfTooling' -Version $Version -Uri $URL -Architecture 'x86' -Type 'MSIX'

}
catch {
    Write-Error "$($MyInvocation.MyCommand): $($_.Exception.Message)"
}