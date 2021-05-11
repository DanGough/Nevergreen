$URL32 = 'https://www.advanced-ip-scanner.com' + ((Invoke-WebRequest 'https://www.advanced-ip-scanner.com' -UseBasicParsing).Links | Where-Object href -Like '*Advanced_IP_Scanner*.exe')[0].href
$Version = ($URL32 | Select-String -Pattern '.+Advanced_IP_Scanner_(.+).exe').Matches.Groups[1].Value

if ($Version -and $URL32) {
    [PSCustomObject]@{
        Version      = $Version
        Architecture = 'x86'
        URI          = $URL32
    }
}