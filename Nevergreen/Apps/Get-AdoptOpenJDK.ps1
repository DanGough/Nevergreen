$MajorVersions = @(8,11,16)
$JvmTypes = @('HotSpot', 'OpenJ9')
$HeapSizes = @('Normal', 'Large')
$ImageTypes = @('JDK', 'JRE')
$Architectures = @('x32','x64')

foreach ($MajorVersion in $MajorVersions) {
    foreach ($JvmType in $JvmTypes) {

        $ReleasesURL = "https://api.adoptopenjdk.net/v3/assets/latest/$MajorVersion/$($JvmType.ToLower())?release=latest&jvm_impl=$($JvmType.ToLower())&vendor=adoptopenjdk&"

        try {

            $Releases = Invoke-RestMethod -Uri $ReleasesURL -DisableKeepAlive -ErrorAction Stop

            foreach ($HeapSize in $HeapSizes) {
                foreach ($ImageType in $ImageTypes) {
                    foreach ($Architecture in $Architectures) {

                        $Release = $Releases | Where-Object { $_.binary.os -eq 'windows' -and $_.binary.heap_size -eq $HeapSize -and $_.binary.image_type -eq $ImageType -and $_.binary.architecture -eq $Architecture }

                        if ($Release) {
                            if ($Release.Count -gt 1) {
                                Write-Warning "Unexpected multiple releases returned for AdoptOpenJDK $MajorVersion $JvmType $HeapSize $ImageType $Architecture"
                            }

                            if ($Architecture -eq 'x32') {
                                $Architecture = 'x86'
                            }

                            $Release | ForEach-Object {
                                New-NevergreenApp -Name "AdoptOpenJDK$MajorVersion" -Version $_.version.openjdk_version -Uri $_.binary.installer.link -Platform "$JvmType $HeapSize $ImageType" -Architecture $Architecture -Type 'Msi'
                                New-NevergreenApp -Name "AdoptOpenJDK$MajorVersion" -Version $_.version.openjdk_version -Uri $_.binary.package.link -Platform "$JvmType $HeapSize $ImageType" -Architecture $Architecture -Type 'Zip'
                            }
                        }

                    }
                }
            }
        }
        catch {
            Write-Error "$($MyInvocation.MyCommand): Error querying REST API $($ReleasesURL): $($_.Exception.Message)"
        }
    }
}