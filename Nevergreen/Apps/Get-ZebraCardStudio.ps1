$URL32 = (Resolve-Uri -Uri 'https://cardstudio.zebra.com/download').Uri

$Version = $URL32 | Get-Version

if ($URL32 -and $Version) {
    [PSCustomObject]@{
        Version      = $Version
        Architecture = 'x86'
        URI          = $URL32
    }
}