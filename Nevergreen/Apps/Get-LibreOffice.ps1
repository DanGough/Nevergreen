$Branches = @('Fresh','Still')
$Architectures = @('x86_64','x86')
$Language = 'en-GB'

foreach ($Branch in $Branches) {

    try {
        $Version = Get-Version -Uri 'https://www.libreoffice.org/download/release-notes' -Pattern "LibreOffice ((?:\d+\.)+\d+)[^<]+$Branch" -ErrorAction Stop
    }
    catch {
        Write-Error "$($MyInvocation.MyCommand): $($_.Exception.Message)"
        break
    }

    foreach ($Architecture in $Architectures) {

        try {
            $DownloadPage = Get-Link -Uri "https://www.libreoffice.org/download/download-libreoffice/?type=win-$Architecture&version=$Version&lang=$Language" -MatchProperty href -Pattern "$Version[^`"]+$($Architecture.Substring($Architecture.Length-2,2))\.msi$" -ErrorAction Stop
            $URL = (Get-Link -Uri $DownloadPage -MatchProperty href -Pattern "$Version[^`"]+$($Architecture.Substring($Architecture.Length-2,2))\.msi$" -ErrorAction Stop) -replace '^//','https://'
            New-NevergreenApp -Name 'LibreOffice' -Version $Version -Uri $URL -Architecture $Architecture.Replace('86_','') -Type 'msi' -Channel $Branch -Language 'Multi'
        }
        catch {
            Write-Error "$($MyInvocation.MyCommand): $($_.Exception.Message)"
        }
    }
}