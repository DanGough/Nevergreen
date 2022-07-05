$URL = Get-Link -Uri 'https://knowledge.autodesk.com/support/fusion-360/troubleshooting/caas/sfdcarticles/sfdcarticles/How-to-update-a-Lab-Installation-of-Fusion-360.html' -MatchProperty href -Pattern '\.exe$'
$VersionURL = Resolve-Uri -Uri 'https://autode.sk/whatsnew' |  Select-Object -ExpandProperty Uri
$Version = Get-Version -Uri $VersionURL -Pattern "V.((?:\d+\.)+\d+\d+)"
New-NevergreenApp -Name 'Autodesk Fusion 360' -Version $Version -Uri $URL -Architecture 'x64' -Type 'Exe'