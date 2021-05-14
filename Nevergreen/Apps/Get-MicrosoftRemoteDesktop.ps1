$URL64 = 'https://go.microsoft.com/fwlink/?linkid=2068602'
$URL32 = 'https://go.microsoft.com/fwlink/?linkid=2098960'
$URLARM64 = 'https://go.microsoft.com/fwlink/?linkid=2098961'

$Version = ((Invoke-WebRequest $URL64 -Method HEAD -UseBasicParsing).Headers.'Content-Disposition' | Select-String -Pattern '_((?:\d+\.)+(?:\d+))_(?:.+)\.msi$').Matches.Groups[1].Value

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
