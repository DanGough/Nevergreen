$Apps = @(
    @{Name = 'PatchMyPC Publisher'; Architecture = 'x64'; Type = 'Msi'; ReleasePage = 'https://docs.patchmypc.com/release-history/production-releases'; DownloadURL = 'https://api.patchmypc.com/downloads/publishingservice/PatchMyPC-Publishing-Service.msi' }
    @{Name = 'PatchMyPC Advanced Insights'; Architecture = 'x86'; Type = 'Exe'; ReleasePage = 'https://docs.patchmypc.com/release-history/advanced-insights-releases'; DownloadURL = 'https://api.patchmypc.com/downloads/exe/AdvancedInsights.exe' }
    @{Name = 'PatchMyPC ROI Tool'; Architecture = 'x86'; Type = 'Exe'; ReleasePage = 'https://docs.patchmypc.com/release-history/roi-tool-releases'; DownloadURL = 'https://api.patchmypc.com/downloads/exe/ReturnOnInvestmentTool.exe' }
    @{Name = 'PatchMyPC MEM Patching Optimizer'; Architecture = 'x86'; Type = 'Exe'; ReleasePage = 'https://github.com/PatchMyPCTeam/MEM-Patching-Optimizer/releases/latest'; DownloadURL = $null }
)

foreach ($App in $Apps) {
    try {
        if ($App.ReleasePage -match '^https://github.com') {
            $Response = Invoke-RestMethod -Uri $App.ReleasePage.Replace('https://github.com/','https://api.github.com/repos/') -ContentType 'application/vnd.github.v3+json' -DisableKeepAlive -UseBasicParsing
            $Version = $Response.tag_name | Get-Version
            $DownloadURL = $Response.assets.browser_download_url | Where-Object {$_ -like '*Optimizer.exe'}
            New-NevergreenApp -Name $App.Name -Version $Version -Uri $DownloadURL -Architecture $App.Architecture -Type $App.Type
        }
        else {
            $Version = Get-Link -Uri $App.ReleasePage -MatchProperty 'aria-label' -Pattern 'Direct link to heading' -ReturnProperty 'href' -ErrorAction Stop | Get-Version
            New-NevergreenApp -Name $App.Name -Version $Version -Uri $App.DownloadURL -Architecture $App.Architecture -Type $App.Type
        }
    }
    catch {
        Write-Error "$($MyInvocation.MyCommand): $($_.Exception.Message)"
    }
}