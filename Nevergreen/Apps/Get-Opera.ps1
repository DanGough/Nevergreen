$Architectures = @('x64','i386')

foreach ($Architecture in $Architectures) {
    try {

        $Response = Invoke-WebRequest -Uri "https://download.opera.com/download/get/?partner=www&opsys=Windows&download_url=&arch=$Architecture" -UseBasicParsing

        if ($IsCoreCLR) {
            $Redirect = $Response.BaseResponse.RequestMessage.RequestUri.AbsoluteUri
        }
        else {
            $Redirect = $Response.BaseResponse.ResponseUri.AbsoluteUri
        }

        if ($Redirect -match 'id%3D(\d+)') {
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