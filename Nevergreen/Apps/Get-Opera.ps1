$Architectures = @('x64','i386')

foreach ($Architecture in $Architectures) {
    try {

        $Redirect = (Resolve-Uri -Uri "https://download.opera.com/download/get/?partner=www&opsys=Windows&download_url=&arch=$Architecture").Uri

        if ($Redirect -match 'id=(\d+)') {
            $URL = (Resolve-Uri -Uri "https://download.opera.com/download/get/?id=$($matches[1])&nothanks=yes").Uri
            $Version = $URL | Get-Version
            if ($Architecture -eq 'i386') { $Architecture = 'x86'}
            New-NevergreenApp -Name 'Opera' -Version $Version -Uri $URL -Architecture $Architecture -Type 'Exe'
        }

    }
    catch {
        Write-Error "$($MyInvocation.MyCommand): $($_.Exception.Message)"
    }
}