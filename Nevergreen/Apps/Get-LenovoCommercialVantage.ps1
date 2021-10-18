try {
    $ScriptURL = Get-Version -Uri 'https://support.lenovo.com/gb/en/solutions/hf003321-lenovo-vantage-for-enterprise' -Pattern '(/gb/en/api/v4/contents/cdn/\S+\.js)'
    $Version = Get-Version -Uri "https://support.lenovo.com$ScriptURL" -Pattern 'Version ((?:\d+\.)+\d+)'

    $URL32 = Get-Version -Uri "https://support.lenovo.com$ScriptURL" -Pattern 'href=\\"(https://.+LenovoCommercialVantage.+zip)'

    New-NevergreenApp -Name 'Lenovo Commercial Vantage' -Version $Version -Uri $URL32 -Architecture 'x86' -Type 'Zip'
}
catch {
    Write-Error "$($MyInvocation.MyCommand): $($_.Exception.Message)"
}
