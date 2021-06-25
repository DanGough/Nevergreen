$URL32 = Get-Version -Uri 'https://support.lenovo.com/gb/en/solutions/hf003321-lenovo-vantage-for-enterprise' -Pattern '.+(https://.+LenovoCommercialVantage_(?:\d+\.)+\d+.+zip)'

$Version = $URL32 | Get-Version

New-NevergreenApp -Version $Version -Uri $URL32 -Architecture 'x86'