$URL = Get-Link -Uri 'https://support.8x8.com/cloud-phone-service/voice/work-desktop/download-8x8-work-for-desktop' -MatchProperty href -Pattern '\.msi'

$Version = $URL | Get-Version -ReplaceWithDot

New-NevergreenApp -Name '8x8 Work' -Version $Version -Uri $URL -Architecture 'x64' -Type 'msi'