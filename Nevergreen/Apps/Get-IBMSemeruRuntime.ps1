#$DownloadPage = (Invoke-WebRequest -Uri 'https://developer.ibm.com/languages/java/semeru-runtimes/downloads' -DisableKeepAlive).Content
$DownloadPage = (Invoke-RestMethod -Uri 'https://developer.ibm.com/middleware/v1/contents/static/semeru-runtime-downloads' -DisableKeepAlive).results.pagepost_custom_js_value

if ($DownloadPage -match 'let sourceDataJson = ([^;]+);') {
    $Downloads = (ConvertFrom-Json $matches[1]).Downloads | Where-Object os -EQ 'Windows'
}

foreach ($Download in $Downloads) {
    $Version = ($Download.name.Replace('+','.') -Replace '.+OpenJDK (.+)','$1') | Get-Version
    New-NevergreenApp -Name "IBM Semeru Runtime JDK" -Version $Version -Uri $Download.jdk.opt1.downloadlink -Architecture $Download.arch -Type (Get-Culture).TextInfo.ToTitleCase($Download.jdk.opt1.displayName)
    New-NevergreenApp -Name "IBM Semeru Runtime JDK" -Version $Version -Uri $Download.jdk.opt2.downloadlink -Architecture $Download.arch -Type (Get-Culture).TextInfo.ToTitleCase($Download.jdk.opt2.displayName)
    New-NevergreenApp -Name "IBM Semeru Runtime JRE" -Version $Version -Uri $Download.jre.opt1.downloadlink -Architecture $Download.arch -Type (Get-Culture).TextInfo.ToTitleCase($Download.jre.opt1.displayName)
    New-NevergreenApp -Name "IBM Semeru Runtime JRE" -Version $Version -Uri $Download.jre.opt2.downloadlink -Architecture $Download.arch -Type (Get-Culture).TextInfo.ToTitleCase($Download.jre.opt2.displayName)
}