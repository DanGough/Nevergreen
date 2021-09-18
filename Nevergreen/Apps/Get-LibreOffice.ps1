$Branches = @('Fresh','Still')
$Architectures = @('x86_64','x86')
$Language = 'en-GB'

foreach ($Branch in $Branches) {

    try {
        $Version = Get-Version -Uri 'https://www.libreoffice.org/download/release-notes' -Pattern "LibreOffice ((?:\d+\.)+\d+)[^<]+$Branch"
    }
    catch {
        Write-Error "$($MyInvocation.MyCommand): $($_.Exception.Message)"
        break
    }

    foreach ($Architecture in $Architectures) {

        try {
            $DownloadPage = Get-Link -Uri "https://www.libreoffice.org/download/download/?type=win-$Architecture&version=$Version&lang=$Language" -MatchProperty href -Pattern "$Version.+$($Architecture.Replace('86_',''))\.msi$"
            $URL = (Get-Link -Uri $DownloadPage -MatchProperty href -Pattern "$Version.+$($Architecture.Replace('86_',''))\.msi$") -replace '^//','https://'
            New-NevergreenApp -Name 'LibreOffice' -Version $Version -Uri $URL -Architecture $Architecture.Replace('86_','') -Type 'MSI' -Channel $Branch -Language 'Multi'
        }
        catch {
            Write-Error "$($MyInvocation.MyCommand): $($_.Exception.Message)"
        }
    }
}