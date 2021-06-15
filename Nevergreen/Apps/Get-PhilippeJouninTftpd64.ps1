$Links = (Invoke-WebRequest 'https://bitbucket.org/phjounin/tftpd64/wiki/Download%20Tftpd64' -DisableKeepAlive -UseBasicParsing).Links
$URL32 = $Links | Where-Object href -Like '*tftpd32-*-setup.exe' | Select-Object -ExpandProperty href -First 1
$URL64 = $Links | Where-Object href -Like '*tftpd64-*-setup.exe' | Select-Object -ExpandProperty href -First 1

if ($URL32 -match '((?:\d+\.)+\d+)') {
    [PSCustomObject]@{
        Version      = $matches[1]
        Architecture = 'x86'
        URI          = $URL32
    }
}

if ($URL64 -match '((?:\d+\.)+\d+)') {
    [PSCustomObject]@{
        Version      = $matches[1]
        Architecture = 'x64'
        URI          = $URL64
    }
}