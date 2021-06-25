$Version = Get-Version -Uri 'https://www.chiark.greenend.org.uk/~sgtatham/putty/latest.html' -Pattern 'latest\srelease\s\(((?:\d+\.)+\d+)\)'

$URL64,$URLARM64,$URL32,$URLARM32 = Get-Link -Uri 'https://www.chiark.greenend.org.uk/~sgtatham/putty/latest.html' -MatchProperty href -Pattern 'putty-64bit.+\.msi','putty-arm64.+\.msi','putty-\d+\.\d+.+\.msi','putty-arm32.+\.msi'

New-NevergreenApp -Version $Version -Uri $URL64 -Architecture 'x64'
New-NevergreenApp -Version $Version -Uri $URLARM64 -Architecture 'ARM64'
New-NevergreenApp -Version $Version -Uri $URL32 -Architecture 'x86'
New-NevergreenApp -Version $Version -Uri $URLARM32 -Architecture 'ARM32'