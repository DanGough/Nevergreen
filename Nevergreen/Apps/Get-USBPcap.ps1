$URL = Get-Link -Uri 'https://desowin.org/usbpcap/' -MatchProperty href -Pattern 'USBPcapSetup-(?:\d+\.)+\d+\.exe$' -PrefixParent

$Version = $URL | Get-Version

New-NevergreenApp -Name 'USBPcap' -Version $Version -Uri $URL -Architecture 'Multi'