$URL32 = Get-Link -Uri 'https://bitbucket.org/phjounin/tftpd64/wiki/Download%20Tftpd64' -MatchProperty href -Pattern 'tftpd32-.+-setup\.exe'
$URL64 = Get-Link -Uri 'https://bitbucket.org/phjounin/tftpd64/wiki/Download%20Tftpd64' -MatchProperty href -Pattern 'tftpd64-.+-setup\.exe'
$Version32 = $URL32 | Get-Version
$Version64 = $URL64 | Get-Version

New-NevergreenApp -Name 'Philippe Jounin Tftpd64' -Version $Version32 -Uri $URL32 -Architecture 'x86' -Type 'Exe'
New-NevergreenApp -Name 'Philippe Jounin Tftpd64' -Version $Version64 -Uri $URL64 -Architecture 'x64' -Type 'Exe'