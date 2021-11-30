$DownloadURL = 'https://raw.githubusercontent.com/ItzLevvie/MicrosoftTeams-msinternal/master/defconfig2'
$DownloadText = (Invoke-WebRequest -Uri $DownloadURL -DisableKeepAlive -UseBasicParsing).Content

$Rings = @('Canary', 'Teams', 'IT Admins Preview', 'Developers Partners Preview', 'Microsoft Dogfood', 'TAP/Beta Users', 'Public Developer Preview', 'Microsoft Outer Ring', 'Public')
$Architectures = @('x64', 'x86', 'ARM64')
$Types = @('Exe', 'Msi')

foreach ($Ring in $Rings)
{
    foreach ($Architecture in $Architectures)
    {
        foreach ($Type in $Types)
        {

            $RegEx = "(?:$Ring \(R.+\)) (?:.+\n)+((?:\d+\.)+\d+).+win-$Architecture.+(http.+\.$Type)"

            if ($DownloadText -match $RegEx)
            {
                New-NevergreenApp -Name 'Microsoft Teams' -Version $Matches[1] -Uri $Matches[2] -Architecture $Architecture -Type $Type -Ring $Ring
            }
            else
            {
                Write-Warning "No match found for Microsoft Teams $Ring $Architecture $Type"
            }

        }
    }
}