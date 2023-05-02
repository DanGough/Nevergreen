$SupportedVersions = @('3.10','3.11')

$Suffixes = @{x86 = '.exe'; x64 = '-amd64.exe'; ARM64 = '-arm64.exe'}

foreach ($SupportedVersion in $SupportedVersions) {

    foreach ($Platform in $Suffixes.keys) {

        $URL = Get-Link -Uri 'https://www.python.org/downloads/windows/' -MatchProperty href -Pattern "python-($([RegEx]::Escape($SupportedVersion))\.\d+)$([RegEx]::Escape($Suffixes[$Platform]))$"
        if ($URL) {
            $Version = $URL | Get-Version
            New-NevergreenApp -Name "Python $SupportedVersion" -Version $Version -Uri $URL -Architecture $Platform -Type 'Exe'
        }
    }

}