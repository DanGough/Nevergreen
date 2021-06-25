$Version = Get-Version -Uri 'https://www.microsoft.com/download/details.aspx?id=58494' -Pattern 'Version:\s+</div><p>((?:\d+\.)+\d+)'
$URL32 = Get-Link -Uri 'https://www.microsoft.com/en-us/download/confirmation.aspx?id=58494' -MatchProperty href -Pattern 'PBIDesktopSetup\.exe$'
$URL64 = Get-Link -Uri 'https://www.microsoft.com/en-us/download/confirmation.aspx?id=58494' -MatchProperty href -Pattern 'PBIDesktopSetup_x64\.exe$'

New-NevergreenApp -Version $Version -Uri $URL32 -Architecture 'x86'
New-NevergreenApp -Version $Version -Uri $URL64 -Architecture 'x64'