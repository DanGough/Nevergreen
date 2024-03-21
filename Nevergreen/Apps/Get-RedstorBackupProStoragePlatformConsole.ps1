$GetLinkExtraParams = @{}
if (-not $IsCoreCLR) {
    # User agent for Edge, taken from the Get-Link example.
    $GetLinkExtraParams['UserAgent'] = 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/42.0.2311.135 Safari/537.36 Edge/12.246'
}
$DownloadPageURL = Get-Link `
    @GetLinkExtraParams `
    -Uri 'https://support.redstor.com/hc/en-gb/sections/200458081-Downloads' `
    -MatchProperty href `
    -Pattern 'Latest-downloads' `
    -PrefixDomain


$URL32 = Get-Link `
    @GetLinkExtraParams `
    -Uri $DownloadPageURL `
    -MatchProperty href `
    -Pattern 'RedstorBackupPro-SP-Console'

$Version = $URL32 | Get-Version -Pattern '((?:\d+\.)+\d+)\.exe$'

New-NevergreenApp -Name 'Redstor Backup Pro Storage Platform Console' -Version $Version -Uri $URL32 -Architecture 'x86' -Type 'Exe'
