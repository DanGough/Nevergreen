$AppName = "RProgrammingLanguage"

$Arch = "x64" # Apparently the only supported one.
$ReleaseUrl = "https://cran.r-project.org/bin/windows/base/"
$ReleaseNotesUrl = "https://cran.r-project.org/bin/windows/base/old/"
$InstallInstructionsUrl = "https://cran.r-project.org/bin/windows/base/rw-FAQ.R-4.4.1.html#What_0027s-the-best-way-to-upgrade_003f"

$Apps = @(
    @{Name = 'RProgrammingLanguage'; Architecture = 'x64'; Type = 'Exe'; Pattern = 'R-\d+\.\d+\.\d+-win\.exe'}
)

$Version = Get-Version -Uri $ReleaseUrl -Pattern 'R-(\d+\.\d+\.\d+)-win\.exe'

foreach ($App in $Apps) {
    try {
        $URL = Get-Link -Uri $ReleaseUrl -MatchProperty href -Pattern $App.Pattern -PrefixParent
        New-NevergreenApp -Name $App.Name -Version $Version -Uri $URL -Architecture $App.Architecture -Type $App.Type
    }
    catch {
        Write-Error "$($MyInvocation.MyCommand): $($_.Exception.Message)"
    }
}
