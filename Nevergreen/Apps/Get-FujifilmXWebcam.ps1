try {

    $Version = Get-Version -Uri 'https://fujifilm-x.com/en-gb/support/download/software/x-webcam/' -Pattern 'Windows Version: (?:Ver\.)?((?:\d+\.)+\d+)'

    $URL = Get-Link -Uri 'https://fujifilm-x.com/en-gb/support/download/software/x-webcam/' -MatchProperty href -Pattern '\.zip$'

    New-NevergreenApp -Name 'Fujifilm X Webcam' -Version $Version -Uri $URL -Architecture 'x64' -Type 'Zip'

}
catch {
    Write-Error "$($MyInvocation.MyCommand): $($_.Exception.Message)"
}