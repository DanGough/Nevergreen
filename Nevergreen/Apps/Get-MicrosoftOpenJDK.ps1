$URL11Zip,$URL11MSI,$URL17Zip,$URL17MSI = Get-Link -Uri 'https://docs.microsoft.com/en-gb/java/openjdk/download' -MatchProperty href -Pattern 'microsoft-jdk-11.+zip$','microsoft-jdk-11.+msi$','microsoft-jdk-17.+zip$','microsoft-jdk-17.+msi$'
$Version11,$Version17 = $URL11MSI,$URL17MSI | Get-Version

New-NevergreenApp -Name 'Microsoft OpenJDK' -Version $Version11 -Uri $URL11Zip -Architecture 'x64' -Type 'Zip'
New-NevergreenApp -Name 'Microsoft OpenJDK' -Version $Version11 -Uri $URL11MSI -Architecture 'x64' -Type 'MSI'
New-NevergreenApp -Name 'Microsoft OpenJDK' -Version $Version17 -Uri $URL17Zip -Architecture 'x64' -Type 'Zip'
New-NevergreenApp -Name 'Microsoft OpenJDK' -Version $Version17 -Uri $URL17MSI -Architecture 'x64' -Type 'MSI'