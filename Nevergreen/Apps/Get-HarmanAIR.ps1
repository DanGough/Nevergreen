try {

    $URLRuntime = 'https://airsdk.harman.com/assets/downloads/AdobeAIR.exe'
    $ProgressPreference = 'SilentlyContinue'
    Invoke-WebRequest -Uri $URLRuntime -OutFile "$env:TEMP\AdobeAIR.exe"
    $VersionRuntime = (Get-Item -Path "$env:TEMP\AdobeAIR.exe").VersionInfo.FileVersion
    Remove-Item -Path "$env:TEMP\AdobeAIR.exe" -Force

    New-NevergreenApp -Name 'Harman AIR Runtime' -Channel 'Runtime' -Version $VersionRuntime -Uri $URLRuntime -Architecture 'x86' -Type 'Exe'

    $Response = (Invoke-RestMethod -Uri 'https://airsdk.harman.com/api/config-settings/download' -DisableKeepAlive).latestversion
    $VersionSDK = $Response.versionName
    $URLSDK = $Response.links.SDK_AS_WIN | Set-UriPrefix -Prefix 'https://airsdk.harman.com'
    $URLSDKFlex = $Response.links.SDK_FLEX_WIN | Set-UriPrefix -Prefix 'https://airsdk.harman.com'

    New-NevergreenApp -Name 'Harman AIR SDK' -Channel 'SDK ActionScript' -Version $VersionSDK -Uri $URLSDK -Architecture 'x86' -Type 'Zip'
    New-NevergreenApp -Name 'Harman AIR SDK' -Channel 'SDK Flex' -Version $VersionSDK -Uri $URLSDKFlex -Architecture 'x86' -Type 'Zip'

}
catch {
    Write-Error "$($MyInvocation.MyCommand): $($_.Exception.Message)"
}
