try {

    $Version = Get-Version -Uri 'https://fujifilm-x.com/en-gb/support/download/software/x-raw-studio/' -Pattern 'Windows Version: (?:Ver\.)?((?:\d+\.)+\d+)'

    $URL = Get-Link -Uri 'https://fujifilm-x.com/en-gb/support/download/software/x-raw-studio/' -MatchProperty href -Pattern '\.exe$'

    New-NevergreenApp -Name 'Fujifilm X Raw Studio' -Version $Version -Uri $URL -Architecture 'x64' -Type 'Exe'

}
catch {
    Write-Error "$($MyInvocation.MyCommand): $($_.Exception.Message)"
}