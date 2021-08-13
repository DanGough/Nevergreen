$Branches = @('Fresh','Still')
$Architectures = @('x86_64','x86')
$Language = 'en-GB'

foreach ($Branch in $Branches) {
    foreach ($Architecture in $Architectures) {
        try {

            $Version = Get-Version -Uri 'https://www.libreoffice.org/download/release-notes' -Pattern "LibreOffice ((?:\d+\.)+\d+)[^<]+$Branch"
            $URL = Get-Link -Uri "https://www.libreoffice.org/download/download/?type=win-$Architecture&version=$Version&lang=$Language" -MatchProperty href -Pattern "$Version.+$($Architecture.Replace('86_',''))\.msi$"

            $Architecture = $Architecture.Replace('86_','')

            New-NevergreenApp -Name 'LibreOffice' -Version $Version -Uri $URL -Architecture $Architecture -Type 'MSI' -Channel $Branch

        }
        catch {
            Write-Error "$($MyInvocation.MyCommand): $($_.Exception.Message)"
        }
    }
}