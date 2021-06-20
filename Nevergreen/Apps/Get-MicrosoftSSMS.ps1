$URL64 = 'https://aka.ms/ssmsfullsetup'

$Version = (Invoke-WebRequest 'https://docs.microsoft.com/en-us/sql/ssms/download-sql-server-management-studio-ssms?view=sql-server-ver15' -UseBasicParsing).Content | Get-Version -Pattern 'Release number: ((?:\d+\.)+\d+)'

New-NevergreenApp -Version $Version -Uri $URL64 -Architecture 'x64'