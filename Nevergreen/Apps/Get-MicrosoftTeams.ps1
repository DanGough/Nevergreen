$DownloadURL = 'https://raw.githubusercontent.com/ItzLevvie/MicrosoftTeams-msinternal/master/defconfig'
$DownloadText = (Invoke-WebRequest -Uri $DownloadURL -DisableKeepAlive -UseBasicParsing).Content

$Rings = @('Continuous Deployment', 'Exploration', 'Preview', 'Production')
$Architectures = @('x64', 'x86', 'ARM64')
$Types = @('Exe', 'Msi')

foreach ($Ring in $Rings) {
    foreach ($Architecture in $Architectures) {
        foreach ($Type in $Types) {

            $RegEx = "(?:$Ring) (?:.+\n)+((?:\d+\.)+\d+).+win-$Architecture.+(http.+\.$Type)"

            if ($DownloadText -match $RegEx) {
                New-NevergreenApp -Name 'Microsoft Teams' -Version $Matches[1] -Uri $Matches[2] -Architecture $Architecture -Type $Type -Ring $Ring
            }
            else {
                Write-Warning "No match found for Microsoft Teams $Ring $Architecture $Type"
            }

        }
    }
}

$DownloadURL = 'https://raw.githubusercontent.com/ItzLevvie/MicrosoftTeams-msinternal/master/defconfig2'
$DownloadText = (Invoke-WebRequest -Uri $DownloadURL -DisableKeepAlive -UseBasicParsing).Content

$Rings = @('Public Developer Preview', 'Public')
$Architectures = @('x64', 'x86', 'ARM64')
$Types = @('Msix')

foreach ($Ring in $Rings) {
    foreach ($Architecture in $Architectures) {
        foreach ($Type in $Types) {

            $RegEx = "(?:$Ring \(R.+\)) (?:.+\n)+((?:\d+\.)+\d+).+win-$Architecture.+(http.+\.$Type)"

            if ($DownloadText -match $RegEx) {
                New-NevergreenApp -Name 'Microsoft Teams' -Version $Matches[1] -Uri $Matches[2] -Architecture $Architecture -Type $Type -Ring $Ring
            }
            else {
                Write-Warning "No match found for Microsoft Teams $Ring $Architecture $Type"
            }

        }
    }
}