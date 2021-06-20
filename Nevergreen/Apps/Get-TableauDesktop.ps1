$URL64 = (Resolve-Uri -Uri 'https://www.tableau.com/downloads/desktop/pc64').Uri
$Version = $URL64 | Get-Version -Pattern '((?:\d+-)+\d+)\.exe$' -ReplaceWithDot

if ($URL64 -and $Version) {
    [PSCustomObject]@{
        Version      = $Version
        Architecture = 'x64'
        URI          = $URL64
    }
}