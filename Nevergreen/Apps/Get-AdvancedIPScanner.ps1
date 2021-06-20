$URL32 = Get-Link -Uri 'https://www.advanced-ip-scanner.com' -MatchProperty href -Pattern 'Advanced_IP_Scanner.+\.exe'
$Version = $URL32 | Get-Version

if ($Version -and $URL32) {
    [PSCustomObject]@{
        Version      = $Version
        Architecture = 'x86'
        URI          = $URL32
    }
}