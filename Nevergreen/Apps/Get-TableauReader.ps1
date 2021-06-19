$URL64 = (Resolve-Uri -Uri 'https://www.tableau.com/downloads/reader/pc64').Uri

if ($URL64 -match '((?:\d+-)+\d+)\.exe$') {
    [PSCustomObject]@{
        Version      = $matches[1].Replace('-','.')
        Architecture = 'x64'
        URI          = $URL64
    }
}