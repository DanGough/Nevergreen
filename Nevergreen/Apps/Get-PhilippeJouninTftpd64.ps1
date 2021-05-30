$URL32= ((Invoke-WebRequest 'https://bitbucket.org/phjounin/tftpd64/wiki/Download%20Tftpd64' -UseBasicParsing).Links | Where-Object href -Like '*tftpd32-*-setup.exe')[0].href
$URL64 = ((Invoke-WebRequest 'https://bitbucket.org/phjounin/tftpd64/wiki/Download%20Tftpd64' -UseBasicParsing).Links | Where-Object href -Like '*tftpd64-*-setup.exe')[0].href
$Version = ((Invoke-WebRequest 'https://bitbucket.org/phjounin/tftpd64/wiki/Download%20Tftpd64' -UseBasicParsing).Content | Select-String -Pattern 'v((?:\d+\.)+(?:\d+))').Matches.Groups[1].Value

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