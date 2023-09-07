$Links = (Invoke-WebRequest 'https://docs.microsoft.com/en-us/windows-hardware/get-started/adk-install' -DisableKeepAlive -UseBasicParsing).Links

$URL = ($Links | Where-Object outerHTML -match "Download the Windows ADK" | Select-Object -ExpandProperty href -First 1 | Resolve-Uri).Uri
if ($URL) {
    New-NevergreenApp -Name 'Microsoft Windows ADK for Windows 11' -Version '22H2' -Uri $URL -Architecture 'x86' -Type 'Exe'
}

$URL = ($Links | Where-Object outerHTML -match "ADK for Windows 11" | Select-Object -ExpandProperty href -First 1 | Resolve-Uri).Uri
if ($URL) {
    New-NevergreenApp -Name 'Microsoft Windows ADK for Windows 11' -Version '21H2' -Uri $URL -Architecture 'x86' -Type 'Exe'
}

$Versions = @('1607','1703','1709','1803','1809','1903','1909','2004')

foreach ($Version in $Versions) {
    $URL = ($Links | Where-Object outerHTML -match "ADK for Windows 10, version $Version" | Select-Object -ExpandProperty href -First 1 | Resolve-Uri).Uri
    if ($URL) {
        New-NevergreenApp -Name 'Microsoft Windows ADK for Windows 10' -Version $Version -Uri $URL -Architecture 'x86' -Type 'Exe'
    }
}