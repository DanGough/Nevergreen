$URL32 = ((Invoke-WebRequest 'https://support.lenovo.com/gb/en/solutions/hf003321-lenovo-vantage-for-enterprise' -UseBasicParsing).Content | Select-String -Pattern '.+(https://.+LenovoCommercialVantage_(?:\d+\.)+\d+.+zip)').Matches.Groups[1].Value

if ($URL32 -match '((?:\d+\.)+\d+)') {
    [PSCustomObject]@{
        Version      = $matches[1]
        Architecture = 'x86'
        URI          = $URL32
    }
}