$URL32 = 'https://www.advanced-port-scanner.com' + ((Invoke-WebRequest 'https://www.advanced-port-scanner.com' -UseBasicParsing).Links | Where-Object href -Like '*Advanced_Port_Scanner*.exe')[0].href
$Version = ($URL32 | Select-String -Pattern '.+Advanced_Port_Scanner_(.+).exe').Matches.Groups[1].Value

if ($Version -and $URL32) {
    [PSCustomObject]@{
        Version      = $Version
        Architecture = 'x86'
        URI          = $URL32
    }
}