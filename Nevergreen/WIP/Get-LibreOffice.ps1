# Evergreen does not return latest version. This implementation does, but is slow and needs optimisation.

$Branches = @('Fresh','Still')
$Architectures = @('x86_64','x86')
$Languages = (Invoke-WebRequest -Uri 'https://www.libreoffice.org/download/download/?lang=pick' -DisableKeepAlive).Links | Where-Object href -Match 'lang=' | Select-Object -ExpandProperty href | ForEach-Object { $_ -replace '.+lang=(.+)','$1' }

foreach ($Branch in $Branches) {

    try {
        $Version = Get-Version -Uri 'https://www.libreoffice.org/download/release-notes' -Pattern "LibreOffice ((?:\d+\.)+\d+)[^<]+$Branch"
    }
    catch {
        Write-Error "$($MyInvocation.MyCommand): $($_.Exception.Message)"
        break
    }

    foreach ($Architecture in $Architectures) {

        $GotMainApp = $false

        try {

            foreach ($Language in $Languages) {

                $DownloadPage = (Get-Link -Uri "https://www.libreoffice.org/download/download/?type=win-$Architecture&version=$Version&lang=$Language" -MatchProperty href -Pattern "$Version.+$($Architecture.Replace('86_',''))\.msi$") -replace '^//','https://'

                if ($GotMainApp -eq $false) {
                    $URL = (Get-Link -Uri $DownloadPage -MatchProperty href -Pattern '\d\.msi$') -replace '^//','https://'
                    New-NevergreenApp -Name 'LibreOffice' -Version $Version -Uri $URL -Architecture $Architecture.Replace('86_','') -Type 'MSI' -Channel $Branch -Language 'Multi'
                    $GotMainApp = $true
                }

                $URL = (Get-Link -Uri $DownloadPage -MatchProperty href -Pattern "$Language\.msi$") -replace '^//','https://'
                if ([String]::IsNullOrEmpty($URL) -eq $false) {
                    New-NevergreenApp -Name 'LibreOffice Help Pack' -Version $Version -Uri $URL -Architecture $Architecture.Replace('86_','') -Type 'MSI' -Channel $Branch -Language $Language
                }
            }

        }
        catch {
            Write-Error "$($MyInvocation.MyCommand): $($_.Exception.Message)"
        }
    }

}