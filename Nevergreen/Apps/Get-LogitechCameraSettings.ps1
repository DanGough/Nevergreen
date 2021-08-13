$DownloadPageURL = ((Invoke-RestMethod -Uri 'https://support.logi.com/api/v2/help_center/en-gb/articles.json?label_names=webcontent=productdownload,websoftware=9bf6fc93-8e0b-11e9-a62b-cb4c7fb3c2e2,webos=windows-Windows-10' -DisableKeepAlive).articles | Where-Object title -EQ 'Camera Settings').html_url

$URL32 = Get-Link -Uri $DownloadPageURL -MatchProperty href -Pattern 'LogiCameraSettings.+\.exe'
$Version = $URL32 | Get-Version

New-NevergreenApp -Name 'Logitech Camera Settings' -Version $Version -Uri $URL32 -Architecture 'x86' -Type 'Exe'