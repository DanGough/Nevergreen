try {
    $Response = (Invoke-RestMethod -Uri 'https://update.googleapis.com/service/update2' -Method Post -DisableKeepAlive -Body '<?xml version="1.0" encoding="UTF-8"?><request protocol="3.0" updaterversion="1.3.36.82"><app appid="{6BBAE539-2232-434A-A4E5-9A33560C6283}"><updatecheck/></app></request>').response
    $Version = $Response.app.updatecheck.manifest.version
    $URL = @($Response.app.updatecheck.urls.url.codebase)[-1] + $Response.app.updatecheck.manifest.packages.package.name
    $SHA256 = $Response.app.updatecheck.manifest.packages.package.hash_sha256

    New-NevergreenApp -Name 'Google Drive' -Version $Version -Uri $URL -Architecture 'Multi' -Type 'Exe' -SHA256 $SHA256
}
catch {
    Write-Error "$($MyInvocation.MyCommand): $($_.Exception.Message)"
}