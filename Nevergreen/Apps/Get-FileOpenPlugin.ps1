$Apps = @(
    @{Architecture = 'x64'; Type = 'MSI'; Pattern = '64\.msi$' }
    @{Architecture = 'x86'; Type = 'MSI'; Pattern = '(?<!64)\.msi$' }
)

foreach ($App in $Apps) {
    try {
        $URL = Get-Link -Uri 'https://plugin.fileopen.com/' -MatchProperty href -Pattern $App.Pattern -PrefixDomain
        $Version = Get-Link -Uri 'https://plugin.fileopen.com/' -MatchProperty href -Pattern $App.Pattern -ReturnProperty outerHTML | Get-Version -Pattern '\[(\d+(?:\.\d+)*)\]'
        New-NevergreenApp -Name 'FileOpen Plugin' -Version $Version -Uri $URL -Architecture $App.Architecture -Type $App.Type
    }
    catch {
        Write-Error "$($MyInvocation.MyCommand): $($_.Exception.Message)"
    }
}