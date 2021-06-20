$URL32,$URL64 = Get-Link -Uri 'https://support.8x8.com/cloud-phone-service/voice/work-desktop/download-8x8-work-for-desktop' -MatchProperty href -Pattern 'work-32-msi','work-64-msi'

$Version32,$Version64 = $URL32,$URL64 | Get-Version -Pattern '((?:\d+\.)+\d+(?:-\d+)?)' -ReplaceWithDot

New-NevergreenApp -Version $Version32 -Uri $URL32 -Architecture 'x86'
New-NevergreenApp -Version $Version64 -Uri $URL64 -Architecture 'x64'