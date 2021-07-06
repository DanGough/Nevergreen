try {

    $Version = Get-Version -Uri 'https://fujifilm-x.com/en-gb/support/download/software/x-acquire/' -Pattern 'Windows Version: (?:Ver\.)?((?:\d+\.)+\d+)'

    $URL = Get-Link -Uri 'https://fujifilm-x.com/en-gb/support/download/software/x-acquire/' -MatchProperty href -Pattern '\.exe$'

    New-NevergreenApp -Name 'Fujifilm X Acquire' -Version $Version -Uri $URL -Architecture 'x86' -Type 'Exe'

}
catch {
    Write-Error "$($MyInvocation.MyCommand): $($_.Exception.Message)"
}