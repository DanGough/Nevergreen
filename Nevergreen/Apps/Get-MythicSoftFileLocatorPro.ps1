$AppName = "FileLocatorPro"

$ReleaseUrl = "https://www.mythicsoft.com/filelocatorpro/download/"
$ReleaseNotesUrl = "https://www.mythicsoft.com/filelocatorpro/information/#version-history"
$InstallInstructionsUrl = "https://www.mythicsoft.com/filelocatorpro/download/"

Write-Verbose "Obtaining $($AppName) Release Versions from $($ReleaseUrl)...`n"

$Apps = @(
    @{Name = 'FileLocatorPro'; Architecture = 'x64'; Type = 'Exe'; Pattern = 'filelocator_\d+\.exe' }
    @{Name = 'FileLocatorPro'; Architecture = 'x86'; Type = 'Msi'; Pattern = 'filelocator_x86_msi_\d+\.zip' }
    @{Name = 'FileLocatorPro'; Architecture = 'x64'; Type = 'Msi'; Pattern = 'filelocator_x64_msi_\d+\.zip' }
)

$Version = Get-Version -Uri $ReleaseUrl -Pattern 'filelocator_(?:x64|x86)(?:_msi)?_(\d+)\.(?:exe|zip)'  # \d+ represents a build number here, which the vendor uses as a version string.

foreach ($App in $Apps) {
    try {
        $URL = (Get-Link -Uri $ReleaseUrl -MatchProperty href -Pattern $App.Pattern -PrefixDomain) -replace 'www\.mythicsoft\.com/', ''
        New-NevergreenApp -Name $App.Name -Version $Version -Uri $URL -Architecture $App.Architecture -Type $App.Type
    }
    catch {
        Write-Error "$($MyInvocation.MyCommand): $($_.Exception.Message)"
    }
}
