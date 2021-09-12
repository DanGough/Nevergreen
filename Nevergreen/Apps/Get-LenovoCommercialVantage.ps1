# js file referenced in https://support.lenovo.com/gb/en/solutions/hf003321-lenovo-vantage-for-enterprise; hopefully stays the same for future versions, will require monitoring
# Abusing Get-Version to return URL as it can extract regex patterns from web content

$Version = Get-Version -Uri 'https://support.lenovo.com/gb/en/api/v4/contents/cdn/hf003321_1626445331000.js' -Pattern 'Version ((?:\d+\.)+\d+)'

$URL32 = Get-Version -Uri 'https://support.lenovo.com/gb/en/api/v4/contents/cdn/hf003321_1626445331000.js' -Pattern 'href=\\"(https://.+LenovoCommercialVantage.+zip)'

New-NevergreenApp -Name 'Lenovo Commercial Vantage' -Version $Version -Uri $URL32 -Architecture 'x86' -Type 'Zip'