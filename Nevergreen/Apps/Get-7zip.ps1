$Apps = @(
    @{Name = '7zip'; Architecture = 'x64'; Type = 'Exe'; Pattern = '7z\d+\-x64\.exe' }
    @{Name = '7zip'; Architecture = 'x86'; Type = 'Exe'; Pattern = '7z\d+\.exe' }
    @{Name = '7zip'; Architecture = 'ARM64'; Type = 'Exe'; Pattern = '7z\d+\-arm64\.exe' }
    @{Name = '7zip'; Architecture = 'x64'; Type = 'Msi'; Pattern = '7z\d+\-x64\.msi' }
    @{Name = '7zip'; Architecture = 'x86'; Type = 'Msi'; Pattern = '7z\d+\.msi' }
    @{Name = '7zip extra'; Architecture = 'Multi'; Type = '7z'; Pattern = '7z\d+-extra\.7z' }
)

$Version = Get-Version -Uri 'https://www.7-zip.org/download.html' -Pattern "7-Zip ((?:\d+\.)+\d+)"

foreach ($App in $Apps)
{
    try
    {
        $URL = Get-Link -Uri 'https://www.7-zip.org/download.html' -MatchProperty href -Pattern $App.Pattern -PrefixDomain
        New-NevergreenApp -Name $App.Name -Version $Version -Uri $URL -Architecture $App.Architecture -Type $App.Type
    }
    catch
    {
        Write-Error "$($MyInvocation.MyCommand): $($_.Exception.Message)"
    }
}
