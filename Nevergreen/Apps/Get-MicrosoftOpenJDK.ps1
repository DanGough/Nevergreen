$URL11Zip,$URL11MSI,$URL16Zip,$URL16MSI = Get-Link -Uri 'https://docs.microsoft.com/en-gb/java/openjdk/download' -MatchProperty href -Pattern 'microsoft-jdk-11.+zip$','microsoft-jdk-11.+msi$','microsoft-jdk-16.+zip$','microsoft-jdk-16.+msi$'
$Version11,$Version16 = $URL11MSI,$URL16MSI | Get-Version

New-NevergreenApp -Name 'Microsoft OpenJDK' -Version $Version11 -Uri $URL11Zip -Architecture 'x64' -Type 'Zip'
New-NevergreenApp -Name 'Microsoft OpenJDK' -Version $Version11 -Uri $URL11MSI -Architecture 'x64' -Type 'MSI'
New-NevergreenApp -Name 'Microsoft OpenJDK' -Version $Version16 -Uri $URL16Zip -Architecture 'x64' -Type 'Zip'
New-NevergreenApp -Name 'Microsoft OpenJDK' -Version $Version16 -Uri $URL16MSI -Architecture 'x64' -Type 'MSI'