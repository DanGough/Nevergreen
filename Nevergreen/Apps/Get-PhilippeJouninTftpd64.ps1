$URL32,$URL64 = Get-Link -Uri 'https://bitbucket.org/phjounin/tftpd64/wiki/Download%20Tftpd64' -MatchProperty href -Pattern 'tftpd32-.+-setup\.exe','tftpd64-.+-setup\.exe'
$Version32,$Version64 = $URL32,$URL64 | Get-Version

if ($URL32 -and $Version32) {
    [PSCustomObject]@{
        Version      = $Version32
        Architecture = 'x86'
        URI          = $URL32
    }
}

if ($URL64 -and $Version64) {
    [PSCustomObject]@{
        Version      = $Version64
        Architecture = 'x64'
        URI          = $URL64
    }
}