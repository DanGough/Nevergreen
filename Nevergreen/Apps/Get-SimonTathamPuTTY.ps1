$Version = (Invoke-WebRequest -Uri 'https://www.chiark.greenend.org.uk/~sgtatham/putty/latest.html' -DisableKeepAlive -UseBasicParsing).Content | Get-Version -Pattern 'latest\srelease\s\(((?:\d+\.)+\d+)\)'

$URL32,$URL64,$URLARM32,$URLARM64 = Get-Link -Uri 'https://www.chiark.greenend.org.uk/~sgtatham/putty/latest.html' -MatchProperty href -Pattern 'putty-\d+\.\d+.+\.msi','putty-64bit.+\.msi','putty-arm32.+\.msi','putty-arm64.+\.msi'

New-NevergreenApp -Version $Version -Uri $URL32 -Architecture 'x86'
New-NevergreenApp -Version $Version -Uri $URL64 -Architecture 'x64'
New-NevergreenApp -Version $Version -Uri $URLARM32 -Architecture 'ARM32'
New-NevergreenApp -Version $Version -Uri $URLARM64 -Architecture 'ARM64'