try {

    $URL = Get-Link -Uri 'https://www.rstudio.com/products/rstudio/download/' -MatchProperty href -Pattern '\.exe$'

    $Version = $URL | Get-Version

    New-NevergreenApp -Name 'RStudio' -Version $Version -Uri $URL -Architecture 'x64' -Type 'Exe'

}
catch {
    Write-Error "$($MyInvocation.MyCommand): $($_.Exception.Message)"
}