$URL32,$URL64,$URLARM64 = Get-Link -Uri 'https://helpx.adobe.com/ca/download-install/kb/creative-cloud-desktop-app-download.html' -MatchProperty href -Pattern 'win32','win64','winarm64'
$Version32,$Version64,$VersionARM64 = $URL64,$URL32,$URLARM64 | Get-Version -Pattern 'ACCCx((?:\d+_)+\d+)\.zip$' -ReplaceWithDot

New-NevergreenApp -Version $Version32 -Uri $URL32 -Architecture 'x86'
New-NevergreenApp -Version $Version64 -Uri $URL32 -Architecture 'x64'
New-NevergreenApp -Version $VersionARM64 -Uri $URLARM64 -Architecture 'ARM64'