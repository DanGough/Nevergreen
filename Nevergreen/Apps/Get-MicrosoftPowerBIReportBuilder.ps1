$Version = ((Invoke-WebRequest 'https://www.microsoft.com/en-us/download/details.aspx?id=58158' -UseBasicParsing).Content | Select-String -Pattern 'Version:\s+</div><p>(.+)</p>').Matches.Groups[1].Value
$URL32 = ((Invoke-WebRequest 'https://www.microsoft.com/en-us/download/confirmation.aspx?id=58158' -UseBasicParsing).Links | Where-Object href -Like '*.msi')[0].href

if ($Version -and $URL32) {
    [PSCustomObject]@{
        Version      = $Version
        Architecture = 'x86'
        URI          = $URL32
    }
}