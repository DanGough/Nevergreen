$AppName = "WinFSP"

$Arch = "x64" # Apparently the only supported one.
$ReleaseUrl = "https://winfsp.dev/rel/"
$ReleaseNotesUrl = "https://github.com/winfsp/winfsp/blob/v2.0/Changelog.md"
$InstallInstructionsUrl = "https://winfsp.dev/rel/"

$Apps = @(
    @{Name = 'WinFSP'; Architecture = 'x64'; Type = 'Msi'; Pattern = 'winfsp-\d+\.\d+\.\d+\.msi'}
)

$Version = Get-Version -Uri $ReleaseUrl -Pattern 'winfsp-(\d+\.\d+\.\d+)\.msi'

foreach ($App in $Apps) {
    try {
        $URL = Get-Link -Uri $ReleaseUrl -MatchProperty href -Pattern $App.Pattern -PrefixDomain
        New-NevergreenApp -Name $App.Name -Version $Version -Uri $URL -Architecture $App.Architecture -Type $App.Type
    }
    catch {
        Write-Error "$($MyInvocation.MyCommand): $($_.Exception.Message)"
    }
}
