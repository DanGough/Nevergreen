#URL not absolute. Exists on Github so submit to Evergreen instead.

$URL = Get-Link -Uri 'https://desowin.org/usbpcap/' -MatchProperty href -Pattern 'USBPcapSetup-(?:\d+\.)+\d+\.exe$' -PrefixParent

$Version = $URL | Get-Version

New-NevergreenApp -Name 'USBPcap' -Version $Version -Uri $URL -Architecture 'Multi' -Type 'Exe'