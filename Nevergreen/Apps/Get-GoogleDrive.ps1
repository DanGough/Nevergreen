try {

    $Version = Get-Version -Uri 'https://support.google.com/a/answer/7577057?hl=en' -Pattern 'Version ((?:\d+\.)+\d+)'
    $URL = 'https://dl.google.com/drive-file-stream/GoogleDriveSetup.exe'

    New-NevergreenApp -Name 'Google Drive' -Version $Version -Uri $URL -Architecture 'x86' -Type 'Exe'

}
catch {
    Write-Error "$($MyInvocation.MyCommand): $($_.Exception.Message)"
}