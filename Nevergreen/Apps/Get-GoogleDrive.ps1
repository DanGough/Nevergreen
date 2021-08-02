# Release notes are out of date so not releasing this just yet

try {

    #$Version = Get-Version -Uri 'https://support.google.com/a/answer/7577057?hl=en' -Pattern 'Version ((?:\d+\.)+\d+)'

    $Version = (Invoke-RestMethod -Uri 'https://update.googleapis.com/service/update2' -Method Post -DisableKeepAlive -Body '<?xml version="1.0" encoding="UTF-8"?><request protocol="3.0" updaterversion="1.3.36.82"><app appid="{6BBAE539-2232-434A-A4E5-9A33560C6283}"><updatecheck/></app></request>').response.app.updatecheck.urls.url.codebase | Select-Object -First 1 | Get-Version

    $URL = 'https://dl.google.com/drive-file-stream/GoogleDriveSetup.exe'


    New-NevergreenApp -Name 'Google Drive' -Version $Version -Uri $URL -Architecture 'Multi' -Type 'Exe'

}
catch {
    Write-Error "$($MyInvocation.MyCommand): $($_.Exception.Message)"
}