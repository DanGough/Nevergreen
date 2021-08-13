try {

    $Version = Get-Version -Uri 'https://fujifilm-x.com/global/support/download/software/pixel-shift-combiner/' -Pattern 'Windows Version: (?:Ver\.)?((?:\d+\.)+\d+)'

    $URL = Get-Link -Uri 'https://fujifilm-x.com/global/support/download/software/pixel-shift-combiner/' -MatchProperty href -Pattern '\.exe$'

    New-NevergreenApp -Name 'Fujifilm Pixel Shift Combiner' -Version $Version -Uri $URL -Architecture 'x64' -Type 'Exe'

}
catch {
    Write-Error "$($MyInvocation.MyCommand): $($_.Exception.Message)"
}