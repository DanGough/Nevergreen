$Apps = @(
    @{Name = '7zip'; Architecture = 'x64'; Type = 'Exe'; Pattern = '7z\d{4}\-x64\.exe' }
    @{Name = '7zip'; Architecture = 'x86'; Type = 'Exe'; Pattern = '7z\d{4}\.exe' }
    @{Name = '7zip'; Architecture = 'ARM64'; Type = 'Exe'; Pattern = '7z\d{4}\-arm64\.exe' }
    @{Name = '7zip'; Architecture = 'x64'; Type = 'Msi'; Pattern = '7z\d{4}\-x64\.msi' }
    @{Name = '7zip'; Architecture = 'x86'; Type = 'Msi'; Pattern = '7z\d{4}\.msi' }
    @{Name = '7zip  extra'; Architecture = 'Multi'; Type = '7z'; Pattern = '7z\d{4}-extra\.7z' }
)

foreach ($App in $Apps) {
    try {
        $URL = Get-Link -Uri 'https://www.7-zip.org/download.html' -MatchProperty href -Pattern $App.Pattern -PrefixDomain
        $Version = Get-Version -Uri 'https://www.7-zip.org/download.html' -Pattern "7-Zip ((?:\d+\.)+\d+)" -Verbose
        New-NevergreenApp -Name $App.Name -Version $Version -Uri $URL -Architecture $App.Architecture -Type $App.Type
    }
    catch {
        Write-Error "$($MyInvocation.MyCommand): $($_.Exception.Message)"
    }
}
