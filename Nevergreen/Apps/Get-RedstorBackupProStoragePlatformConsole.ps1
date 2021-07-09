$DownloadPageURL = Get-Link -Uri 'https://support.redstor.com/hc/en-gb/sections/200458081-Downloads' -MatchProperty href -Pattern 'Downloads-Redstor-Pro' -PrefixDomain

$URL32 = Get-Link -Uri $DownloadPageURL -MatchProperty href -Pattern 'RedstorBackupPro-SP-Console'

$Version = $URL32 | Get-Version -Pattern '((?:\d+\.)+\d+)\.exe$'

New-NevergreenApp -Name 'Redstor Backup Pro Storage Platform Console' -Version $Version -Uri $URL32 -Architecture 'x86' -Type 'Exe'