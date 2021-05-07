$ProgressPreference = 'SilentlyContinue'

$Version = ((Invoke-WebRequest 'https://help.webex.com/en-us/mqkve8/Webex-Release-Notes' -UseBasicParsing).Content | Select-String -Pattern 'Version:\s(.+)</p>').Matches.Groups[1].Value
$URL32 = (Invoke-WebRequest 'https://help.webex.com/en-us/nw5p67g/Webex-Installation-and-Automatic-Upgrade' -UseBasicParsing).Links | Where-Object href -Like '*Webex_x86.msi' | Select-Object -First 1 -ExpandProperty href
$URL64 = (Invoke-WebRequest 'https://help.webex.com/en-us/nw5p67g/Webex-Installation-and-Automatic-Upgrade' -UseBasicParsing).Links | Where-Object href -Like '*Webex.msi' | Select-Object -First 1 -ExpandProperty href

if ($Version -and $URL32) {
    [PSCustomObject]@{
        Version      = $Version
        Architecture = 'x86'
        URI          = $URL32
    }
}

if ($Version -and $URL64) {
    [PSCustomObject]@{
        Version      = $Version
        Architecture = 'x64'
        URI          = $URL64
    }
}