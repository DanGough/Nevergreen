try {

    $Version = Get-Version -Uri 'https://fujifilm-x.com/en-gb/support/download/software/raw-file-converter-ex-powered-by-silkypix/' -Pattern 'Windows Version: (?:Ver\.)?((?:\d+\.)+\d+)'

    $URL = Get-Link -Uri 'https://fujifilm-x.com/en-gb/support/download/software/raw-file-converter-ex-powered-by-silkypix/' -MatchProperty href -Pattern '\.exe$'

    New-NevergreenApp -Name 'Fujifilm Raw File Converter EX 3.0' -Version $Version -Uri $URL -Architecture 'x86' -Type 'Exe'

}
catch {
    Write-Error "$($MyInvocation.MyCommand): $($_.Exception.Message)"
}