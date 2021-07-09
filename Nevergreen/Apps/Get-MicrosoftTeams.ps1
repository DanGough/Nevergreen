$DownloadURL = 'https://raw.githubusercontent.com/ItzLevvie/MicrosoftTeams-msinternal/master/defconfig'
$DownloadText = (Invoke-WebRequest -Uri $DownloadURL -DisableKeepAlive -UseBasicParsing).Content

$Rings = @('Continuous Deployment', 'Exploration', 'Preview', 'Production')
$Architectures = @('x64', 'x86', 'ARM64')
$Types = @('Exe', 'MSI')

foreach ($Ring in $Rings) {
    foreach ($Architecture in $Architectures) {
        foreach ($Type in $Types) {

            $RegEx = "$Ring(?:.+\n)+((?:\d+\.)+\d+).+win-$Architecture.+(http.+\.$Type)"

            if ($DownloadText -match $RegEx) {
                New-NevergreenApp -Name 'Microsoft Teams' -Version $matches[1] -Uri $matches[2] -Architecture $Architecture -Type $Type -Ring $Ring
            }
            else {
                Write-Warning "No match found for Microsoft Teams $Channel $Architecture $Type"
            }

        }
    }
}
