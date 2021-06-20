$Version = (Invoke-WebRequest 'https://www.microsoft.com/download/details.aspx?id=58494' -UseBasicParsing).Content | Get-Version -Pattern 'Version:\s+</div><p>((?:\d+\.)+\d+)'
$URL32,$URL64 = Get-Link -Uri 'https://www.microsoft.com/en-us/download/confirmation.aspx?id=58494' -MatchProperty href -Pattern 'PBIDesktopSetup\.exe$','PBIDesktopSetup_x64\.exe$'

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