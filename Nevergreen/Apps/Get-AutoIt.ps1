$Version = Get-Version -Uri 'https://www.autoitscript.com/site/autoit/downloads' -Pattern 'v((?:\d+\.)+\d+)'

$URL32 = (Get-Link -Uri 'https://www.autoitscript.com/site/autoit/downloads' -MatchProperty href -Pattern 'autoit-v.+-setup\.zip' -PrefixDomain | Resolve-Uri).Uri.Replace('.zip','.exe')

New-NevergreenApp -Name 'AutoIt' -Version $Version -Uri $URL32 -Architecture 'x86' -Type 'Exe'