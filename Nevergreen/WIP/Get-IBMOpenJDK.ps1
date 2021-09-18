$DownloadPage = (Invoke-WebRequest -Uri 'https://developer.ibm.com/languages/java/semeru-runtimes/downloads' -DisableKeepAlive).Content

if ($DownloadPage -match 'let sourceDataJson = ([^;]+);') {
    $Downloads = (ConvertFrom-Json $matches[1]).Downloads | Where-Object os -eq 'Windows'
}

foreach ($Download in $Downloads) {
    $Version = $Download.name | Get-Version
    New-NevergreenApp -Name "IBM OpenJDK$($Download.version)" -Version $Version -Uri $Download.jdk.opt1.downloadlink -Architecture $Download.arch -Type (Get-Culture).TextInfo.ToTitleCase($Download.jdk.opt1.displayName)
    New-NevergreenApp -Name "IBM OpenJDK$($Download.version)" -Version $Version -Uri $Download.jdk.opt2.downloadlink -Architecture $Download.arch -Type (Get-Culture).TextInfo.ToTitleCase($Download.jdk.opt2.displayName)
}