$Version = (Invoke-WebRequest 'https://docs.microsoft.com/en-us/azure/information-protection/rms-client/unifiedlabelingclient-version-release-history' -UseBasicParsing).Content | Get-Version -Pattern '>Version\s((?:\d+\.)+\d+)'
$URL32 = Get-Link -Uri 'https://www.microsoft.com/en-us/download/confirmation.aspx?id=53018' -MatchProperty href -Pattern '_UL\.msi'

New-NevergreenApp -Version $Version -Uri $URL32 -Architecture 'x86'