$URL32 = Get-Link -Uri 'https://www.advanced-port-scanner.com' -MatchProperty href -Pattern 'Advanced_Port_Scanner.+\.exe'
$Version = $URL32 | Get-Version

if ($Version -and $URL32) {
    [PSCustomObject]@{
        Version      = $Version
        Architecture = 'x86'
        URI          = $URL32
    }
}