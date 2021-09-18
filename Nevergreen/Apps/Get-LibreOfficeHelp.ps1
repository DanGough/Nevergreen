$Branches = @('Fresh','Still')
$Architectures = @('x86_64','x86')
$Languages = (Invoke-WebRequest -Uri 'https://www.libreoffice.org/download/download/?lang=pick' -DisableKeepAlive).Links | Where-Object href -Match 'lang=' | Select-Object -ExpandProperty href | ForEach-Object { $_ -replace '.+lang=(.+)','$1' } | Sort-Object

foreach ($Branch in $Branches) {

    try {
        $Version = Get-Version -Uri 'https://www.libreoffice.org/download/release-notes' -Pattern "LibreOffice ((?:\d+\.)+\d+)[^<]+$Branch"
    }
    catch {
        Write-Error "$($MyInvocation.MyCommand): $($_.Exception.Message)"
        break
    }

    foreach ($Architecture in $Architectures) {

        foreach ($Language in $Languages) {

            try {
                $URL = Get-Link -Uri "https://www.libreoffice.org/download/download/?type=win-$Architecture&version=$Version&lang=$Language" -MatchProperty href -Pattern "$Version.+$($Architecture.Replace('86_',''))_helppack_$Language\.msi$"

                if ($URL) {
                    New-NevergreenApp -Name 'LibreOffice Offline Help' -Version $Version -Uri $URL -Architecture $Architecture.Replace('86_','') -Type 'MSI' -Channel $Branch -Language $Language
                }
            }
            catch {
                Write-Error "$($MyInvocation.MyCommand): $($_.Exception.Message)"
            }

        }

    }

}