$URL64 = 'https://go.microsoft.com/fwlink/?linkid=2068602'
$URL32 = 'https://go.microsoft.com/fwlink/?linkid=2098960'
$URLARM64 = 'https://go.microsoft.com/fwlink/?linkid=2098961'

$Version = (Resolve-Uri -Uri $URL64).FileName | Get-Version

if ($Version) {
    [PSCustomObject]@{
        Version      = $Version
        Architecture = 'x86'
        URI          = $URL32
    }

    [PSCustomObject]@{
        Version      = $Version
        Architecture = 'x64'
        URI          = $URL64
    }

    [PSCustomObject]@{
        Version      = $Version
        Architecture = 'ARM64'
        URI          = $URLARM64
    }
}
