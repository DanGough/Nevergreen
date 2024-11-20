# Ensure .NET System.Web.HttpUtility is available for decoding HTML entities
Add-Type -AssemblyName System.Web

$AppName = "SplunkUniversalForwarder"
$ReleaseUrl = "https://community.chocolatey.org/packages/splunk-universalforwarder#files"

Write-Verbose "Obtaining $($AppName) Release Versions from $($ReleaseUrl)...`n"

$Apps = @(
    @{Name = 'SplunkUniversalForwarder'; Architecture = 'x64'; Type = 'Msi'; Pattern = 'https://download\.splunk\.com/products/universalforwarder/releases/\d+\.\d+\.\d+/windows/splunkforwarder-\d+\.\d+\.\d+-[0-9a-f]+-x64-release\.msi' }
    @{Name = 'SplunkUniversalForwarder'; Architecture = 'x86'; Type = 'Msi'; Pattern = 'https://download\.splunk\.com/products/universalforwarder/releases/\d+\.\d+\.\d+/windows/splunkforwarder-\d+\.\d+\.\d+-[0-9a-f]+-x86-release\.msi' }
)

# Get the HTML content of the page
$PageContent = (Invoke-WebRequest -Uri $ReleaseUrl).Content

# Decode HTML entities in the page content
$DecodedContent = [System.Web.HttpUtility]::HtmlDecode($PageContent)

# Extract version and build from the page using regex
$VersionMatch = [regex]::Match($DecodedContent, 'splunkforwarder-(\d+\.\d+\.\d+)-([0-9a-f]+)-(x86|x64)-release\.msi')
$Version = $VersionMatch.Groups[1].Value
$Build = $VersionMatch.Groups[2].Value

Write-Verbose "Version : $Version"
Write-Verbose "ReleaseUrl : $ReleaseUrl"

foreach ($App in $Apps) {
    try {
        # Extract the first matching download link directly from the decoded content
        $LinkMatch = [regex]::Match($DecodedContent, $App.Pattern)
        $URL = $LinkMatch.Value

        if ($URL) {
            # Decode again if necessary (double-encoded URLs)
            $URL = [System.Web.HttpUtility]::HtmlDecode($URL)

            New-NevergreenApp -Name $App.Name -Version $Version -Uri $URL -Architecture $App.Architecture -Type $App.Type
        } else {
            Write-Error "Download URL not found for $($App.Name) $($App.Architecture)"
        }
    }
    catch {
        Write-Error "$($MyInvocation.MyCommand): $($_.Exception.Message)"
    }
}
