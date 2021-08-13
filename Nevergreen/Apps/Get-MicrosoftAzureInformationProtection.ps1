$Version = Get-Version -Uri 'https://docs.microsoft.com/en-us/azure/information-protection/rms-client/unifiedlabelingclient-version-release-history' -Pattern '>Version\s((?:\d+\.)+\d+)'
$URLMsi = Get-Link -Uri 'https://www.microsoft.com/en-us/download/confirmation.aspx?id=53018' -MatchProperty href -Pattern '_UL\.msi'
$URLExe = Get-Link -Uri 'https://www.microsoft.com/en-us/download/confirmation.aspx?id=53018' -MatchProperty href -Pattern '_UL\.exe'

New-NevergreenApp -Name 'Microsoft Azure Information Protection' -Version $Version -Uri $URLMsi -Architecture 'x86' -Type 'MSI'
New-NevergreenApp -Name 'Microsoft Azure Information Protection' -Version $Version -Uri $URLExe -Architecture 'x86' -Type 'Exe'