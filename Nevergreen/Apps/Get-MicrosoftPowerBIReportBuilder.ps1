$Version = Get-Version -Uri 'https://www.microsoft.com/en-us/download/details.aspx?id=58158' -Pattern 'Version:\s+</div><p>((?:\d+\.)+\d+)'
$URL32 = Get-Link -Uri 'https://www.microsoft.com/en-us/download/confirmation.aspx?id=58158' -MatchProperty href -Pattern '\.msi$'

New-NevergreenApp -Name 'Microsoft Power BI Report Builder' -Version $Version -Uri $URL32 -Architecture 'x86' -Type 'Msi'