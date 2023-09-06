$URL64 = (Resolve-Uri -Uri 'https://aka.ms/ssmsfullsetup').Uri

$Version = Get-Version -Uri 'https://docs.microsoft.com/en-us/sql/ssms/download-sql-server-management-studio-ssms' -Pattern 'Release number: ((?:\d+\.)+\d+)'

New-NevergreenApp -Name 'Microsoft SSMS' -Version $Version -Uri $URL64 -Architecture 'x64' -Type 'Exe'