$AppName = "MirthConnect"
$ReleaseUrl = "https://github.com/nextgenhealthcare/connect/releases/latest/"
$ReleaseNotesUrl = "https://github.com/nextgenhealthcare/connect/releases/"

Write-Verbose "Obtaining $($AppName) Release Versions from $($ReleaseUrl)...`n"

$Apps = @(
    @{Name = 'MirthConnect'; Architecture = 'x64'; Type = 'Exe'; Pattern = 'mirthconnect-\d+\.\d+\.\d+\.b\d+-windows-x64\.exe' }
    @{Name = 'MirthConnect'; Architecture = 'x64'; Type = 'Zip'; Pattern = 'mirthconnect-\d+\.\d+\.\d+\.b\d+-windows-x64\.zip' }
    @{Name = 'MirthConnect'; Architecture = 'x86'; Type = 'Exe'; Pattern = 'mirthconnect-\d+\.\d+\.\d+\.b\d+-windows-x32\.exe' }
    @{Name = 'MirthConnect'; Architecture = 'x86'; Type = 'Zip'; Pattern = 'mirthconnect-\d+\.\d+\.\d+\.b\d+-windows-x32\.zip' }
)

$Version = Get-Version -Uri $ReleaseUrl -Pattern 'mirthconnect-(\d+\.\d+\.\d+\.b\d+)-(?:windows)-(?:x32|x64)\.(?:exe|zip)'

foreach ($App in $Apps) {
    try {
        $URL = (Get-Link -Uri $ReleaseUrl -MatchProperty href -Pattern $App.Pattern -PrefixDomain) -replace "^https://github.com/", ""
        New-NevergreenApp -Name $App.Name -Version $Version -Uri $URL -Architecture $App.Architecture -Type $App.Type
    }
    catch {
        Write-Error "$($MyInvocation.MyCommand): $($_.Exception.Message)"
    }
}
