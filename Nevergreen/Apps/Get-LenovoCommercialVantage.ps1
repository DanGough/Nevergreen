$URL32 = ((Invoke-WebRequest 'https://support.lenovo.com/gb/en/solutions/hf003321-lenovo-vantage-for-enterprise' -UseBasicParsing).Content | Select-String -Pattern '.+(https:\/\/((?:d.+\.)+(?:\d.+)).zip)').Matches.Groups[1].Value
$Version = ($URL32 | Select-String -Pattern 'LenovoCommercialVantage_((?:\d+\.)+(?:\d.+)).zip').Matches.Groups[1].Value

if ($Version -and $URL32) {
    [PSCustomObject]@{
        Version      = $Version
        Architecture = 'x86'
        URI          = $URL32
    }
}