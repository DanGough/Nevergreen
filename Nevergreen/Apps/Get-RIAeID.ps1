try {

    $URL = Get-Link -Uri 'https://www.id.ee/en/article/install-id-software/' -MatchProperty href -Pattern '\.exe$'
    $Version = $URL | Get-Version

    New-NevergreenApp -Name 'RIA eID' -Version $Version -Uri $URL -Architecture 'Multi' -Type 'Exe'

}
catch {
    Write-Error "$($MyInvocation.MyCommand): $($_.Exception.Message)"
}