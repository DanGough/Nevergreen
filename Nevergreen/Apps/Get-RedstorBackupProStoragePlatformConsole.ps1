$DownloadPageURL =  'https://support.redstor.com' + ((Invoke-WebRequest 'https://support.redstor.com/hc/en-gb/sections/200458081-Downloads' -UseBasicParsing).Links | Where-Object href -Like '*Downloads-Redstor-Pro*')[0].href + '#tab2'
$URL32 = ((Invoke-WebRequest $DownloadPageURL -UseBasicParsing).Links | Where-Object href -Like '*RedstorBackupPro-SP-Console*')[0].href 
$Version = ($URL32 | Select-String -Pattern 'RedstorBackupPro-SP-Console-((?:\d+\.)+(?:\d+)).exe').Matches.Groups[1].Value

if ($Version -and $URL32) {
    [PSCustomObject]@{
        Version      = $Version
        Architecture = 'x86'
        URI          = $URL32
    }
}