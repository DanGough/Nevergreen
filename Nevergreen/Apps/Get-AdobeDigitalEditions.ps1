try {

    $Version = Get-Link -Uri 'https://www.adobe.com/uk/solutions/ebook/digital-editions/download.html' -Headers @{"accept-language"="en-GB,en;q=0.9,en-US;q=0.8"} -MatchProperty href -Pattern '\.exe$' -ReturnProperty outerHTML | Get-Version -Pattern '>((?:\d+\.)+\d+)'

    $URL = Get-Link -Uri 'https://www.adobe.com/uk/solutions/ebook/digital-editions/download.html' -Headers @{"accept-language"="en-GB,en;q=0.9,en-US;q=0.8"} -MatchProperty href -Pattern '\.exe$'

    New-NevergreenApp -Name 'Adobe Digital Editions' -Version $Version -Uri $URL -Architecture 'x86' -Type 'Exe'

}
catch {
    Write-Error "$($MyInvocation.MyCommand): $($_.Exception.Message)"
}