try {
    $Response = Invoke-RestMethod "https://www.elgato.com/graphql?query=query%20contentJson(%24identifier%3A%5BString%5D%24contentType%3AString%24options%3AContentJsonOptionsInput)%7BcontentJson(identifiers%3A%24identifier%20contentType%3A%24contentType%20options%3A%24options)%7Bidentifier%20entries%7D%7D&operationName=contentJson&variables=%7B%22contentType%22%3A%22downloads%22%2C%22identifier%22%3A%5B%22downloads%22%5D%2C%22options%22%3A%7B%22level%22%3A1%7D%7D&locale=en-US" -ErrorAction Stop
    $Product = ($Response.data.contentJson.entries | ConvertFrom-Json).downloadData.'audio-effects-win'

    $URLVersion = Get-Version -String $Product.downloadURL -Pattern '((?:\d+\.)+\d+)(?!.+(?:\d+\.)+\d+)'
    if ([version]$URLVersion -gt [version]$Product.version) {
        $Product.version = $URLVersion
    }

    New-NevergreenApp -Name 'Elgato Audio Effects' -Version $Product.version -Uri $Product.downloadURL -Architecture 'x64' -Type 'MSI'
}
catch {
    Write-Error "$($MyInvocation.MyCommand): $($_.Exception.Message)"
}