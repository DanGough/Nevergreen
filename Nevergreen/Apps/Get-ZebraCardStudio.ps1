$URL32 = (Resolve-Uri -Uri 'https://cardstudio.zebra.com/download').Uri

if ($URL32 -match '((?:\d+\.)+\d+)\.exe') {
    [PSCustomObject]@{
        Version      = $matches[1]
        Architecture = 'x86'
        URI          = $URL32
    }
}