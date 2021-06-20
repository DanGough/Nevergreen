$URL32,$URL64 = Get-Link -Uri 'https://bitbucket.org/phjounin/tftpd64/wiki/Download%20Tftpd64' -MatchProperty href -Pattern 'tftpd32-.+-setup\.exe','tftpd64-.+-setup\.exe'
$Version32,$Version64 = $URL32,$URL64 | Get-Version

New-NevergreenApp -Version $Version32 -Uri $URL32 -Architecture 'x86'
New-NevergreenApp -Version $Version64 -Uri $URL64 -Architecture 'x64'