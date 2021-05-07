$ProgressPreference = 'SilentlyContinue'

$Version = ((Invoke-WebRequest 'https://www.microsoft.com/download/details.aspx?id=58494' -UseBasicParsing).Content | Select-String -Pattern 'Version:\s+</div><p>(.+)</p>').Matches.Groups[1].Value
$URL32 = ((Invoke-WebRequest 'https://www.microsoft.com/en-us/download/confirmation.aspx?id=58494' -UseBasicParsing).Links | Where-Object href -Like '*PBIDesktopSetup.exe')[0].href
$URL64 = ((Invoke-WebRequest 'https://www.microsoft.com/en-us/download/confirmation.aspx?id=58494' -UseBasicParsing).Links | Where-Object href -Like '*PBIDesktopSetup_x64.exe')[0].href

if ($Version -and $URL64) {
    [PSCustomObject]@{
        Version      = $Version
        Architecture = 'x64'
        URI          = $URL64
    }
}

if ($Version -and $URL32) {
    [PSCustomObject]@{
        Version      = $Version
        Architecture = 'x86'
        URI          = $URL32
    }
}