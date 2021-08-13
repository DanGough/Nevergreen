$Links = (Invoke-WebRequest 'https://docs.microsoft.com/en-us/windows-hardware/get-started/adk-install' -DisableKeepAlive -UseBasicParsing).Links

$Versions = @('1607','1703','1709','1803','1809','1903','1909','2004','20H2','21H1','21H2','22H1','22H2','23H1','23H2','24H1','24H2','25H1','25H2')

foreach ($Version in $Versions) {

    $URL32 = $Links | Where-Object outerHTML -match "ADK for Windows 10, version $Version" | Select-Object -ExpandProperty href -First 1

    if ($URL32) {
        New-NevergreenApp -Name 'Microsoft Windows ADK' -Version $Version -Uri $URL32 -Architecture 'x86' -Type 'Exe'
    }

}