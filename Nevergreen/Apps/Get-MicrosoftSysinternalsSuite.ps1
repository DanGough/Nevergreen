$Editions = @(
    @{Architecture = 'x86'; Platform = 'Windows'; Uri = 'https://download.sysinternals.com/files/SysinternalsSuite.zip'}
    @{Architecture = 'x64'; Platform = 'Nano Server'; Uri = 'https://download.sysinternals.com/files/SysinternalsSuite.zip'}
    @{Architecture = 'ARM64'; Platform = 'Windows'; Uri = 'https://download.sysinternals.com/files/SysinternalsSuite-ARM64.zip'}
)

foreach ($Edition in $Editions) {

    try {
        $LastModified = (Resolve-Uri -Uri $Edition.Uri).LastModified
        $Version = @($LastModified.Year,$LastModified.Month,$LastModified.Day) -join '.'
        New-NevergreenApp -Version $Version -Uri $Edition.Uri -Architecture $Edition.Architecture -Platform $Edition.Platform
    }
    catch {
        Write-Warning "Could not find download for Sysinternals Suite $($Edition.Architecture) for $($Edition.Platform)"
    }

}