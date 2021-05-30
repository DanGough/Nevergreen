$DownloadURL = 'https://raw.githubusercontent.com/ItzLevvie/MicrosoftTeams-msinternal/master/defconfig'
$DownloadText = (Invoke-WebRequest -Uri $DownloadURL -UseBasicParsing).Content

$Channels = @('Continuous Deployment', 'Exploration', 'Preview', 'Production')
$Architectures = @('x64', 'x86', 'ARM64')
$Types = @('Exe', 'MSI')

foreach ($Channel in $Channels) {
    foreach ($Architecture in $Architectures) {
        foreach ($Type in $Types) {

            $RegEx = "$Channel(?:.+\n)+((?:\d+\.)+\d+).+win-$Architecture.+(http.+\.$Type)"

            if ($DownloadText -match $RegEx) {
                [PSCustomObject]@{
                    Version      = $matches[1]
                    Ring         = $Channel
                    Architecture = $Architecture
                    Type         = $Type
                    URI          = $matches[2]
                }
            }
            else {
                Write-Warning "No match found for Microsoft Teams $Channel $Architecture $Type"
            }

        }
    }
}
