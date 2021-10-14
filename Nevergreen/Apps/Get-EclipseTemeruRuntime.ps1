$MajorVersions = @(8,11,16,17,18,19,20)
$ImageTypes = @('JDK', 'JRE')
$Architectures = @('x32','x64')

foreach ($MajorVersion in $MajorVersions) {

    $ReleasesURL = "https://api.adoptium.net/v3/assets/latest/$MajorVersion/hotspot?release=latest&jvm_impl=hotspot&vendor=adoptium&"

    try {

        $Releases = Invoke-RestMethod -Uri $ReleasesURL -DisableKeepAlive -ErrorAction Stop

        foreach ($ImageType in $ImageTypes) {
            foreach ($Architecture in $Architectures) {

                $Release = $Releases | Where-Object { $_.binary.os -eq 'Windows' -and $_.binary.heap_size -eq 'Normal' -and $_.binary.image_type -eq $ImageType -and $_.binary.architecture -eq $Architecture }

                if ($Release) {
                    if ($Release.Count -gt 1) {
                        Write-Warning "Unexpected multiple releases returned for Eclipse Temeru Runtime $MajorVersion $ImageType $Architecture"
                    }

                    if ($Architecture -eq 'x32') {
                        $Architecture = 'x86'
                    }

                    $Release | ForEach-Object {
                        $Version = ($_.version.openjdk_version.Replace('_','.').Replace('+','.') -Replace '-[a-z]','.') -Replace '^1\.8\.','8.'
                        New-NevergreenApp -Name "Eclipse Temeru Runtime $ImageType" -Version $Version -Uri $_.binary.installer.link -Architecture $Architecture -Type 'Msi'
                        New-NevergreenApp -Name "Eclipse Temeru Runtime $ImageType" -Version $Version -Uri $_.binary.package.link -Architecture $Architecture -Type 'Zip'
                    }
                }

            }
        }
    }
    catch {
        Write-Error "$($MyInvocation.MyCommand): Error querying REST API $($ReleasesURL): $($_.Exception.Message)"
    }
}