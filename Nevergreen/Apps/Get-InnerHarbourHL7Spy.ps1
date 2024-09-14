$AppName = "HL7Spy"

$Arch = "x64" # Apparently the only supported one.
$ReleaseUrl = "https://hl7spy.ca/blog/"
$ReleaseNotesUrl = "https://hl7spy.ca/release-history/" # N.B. This does not always appear to be kept upto date.
$InstallInstructionsUrl = "https://conevity.atlassian.net/wiki/spaces/HL7Spy4/pages/626065447/Download+Installation"

Write-Verbose "Obtaining $($AppName) Release Versions from $($ReleaseUrl)...`n"

$AppVersions = @(
    @{AppName = "$($AppName)"; Type = 'exe'; URLPattern = 'HL7Spy\.(\d+\.\d+(\.\d+))'}
)

foreach ($AppVersion in $AppVersions) {

    # Get all matching URLs
    $URLs = Get-Link -Uri $ReleaseUrl -MatchProperty href -Pattern $AppVersion.URLPattern |
            Set-UriPrefix -Prefix 'https://hl7spy.ca/'

    if (-not $URLs) {
        Write-Warning "Could not find release for $($AppVersion.AppName) $($AppVersion.Type)"
        continue
    }

    # Get versions from URLs
    $VersionUrlPairs = @()
    foreach ($Url in $URLs) {
        $VerString = Get-Version -String $Url

        try {
            $VersionObj = [version]$VerString
            $VersionUrlPairs += [PSCustomObject]@{
                Version = $VersionObj
                Url     = $Url
            }
        } catch {
            Write-Warning "Invalid version format '$VerString' for URL '$Url'"
        }
    }

    if (-not $VersionUrlPairs) {
        Write-Warning "Could not extract valid versions for $($AppVersion.AppName) $($AppVersion.Type)"
        continue
    }

    # Sort versions descending using [version] comparison
    $HighestVersionPair = $VersionUrlPairs | Sort-Object -Property Version -Descending | Select-Object -First 1

    New-NevergreenApp -Name $($AppVersion.AppName) `
                      -Architecture $Arch `
                      -Version $($HighestVersionPair.Version) `
                      -Uri $($HighestVersionPair.Url) `
                      -Type $($AppVersion.Type)
}

Write-Verbose ""
Write-Verbose "$($AppName) Install instructions are available here: $($InstallInstructionsUrl)"
Write-Verbose "$($AppName) (Version: $($Version)) Release notes are available here: $($ReleaseNotesUrl)"
