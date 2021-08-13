$URL32 = (Resolve-Uri -Uri 'https://aka.ms/installazurecliwindows').Uri
$Version = $URL32 | Get-Version

New-NevergreenApp -Name 'Microsoft AzureCLI' -Version $Version -Uri $URL32 -Architecture 'x86' -Type 'Msi'