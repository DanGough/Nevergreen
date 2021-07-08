try {

    $URL = Get-Link -Uri 'https://appventix.com/thank-you/' -MatchProperty outerHTML -Pattern 'Download AppVentix'

    $Version = (Resolve-Uri -Uri $URL).FileName | Get-Version

    New-NevergreenApp -Name 'AppVentix' -Version $Version -Uri $URL -Architecture 'x64' -Type 'Zip'

}
catch {
    Write-Error "$($MyInvocation.MyCommand): $($_.Exception.Message)"
}