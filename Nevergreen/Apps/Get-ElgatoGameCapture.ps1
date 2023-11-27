try {
    $Response = Invoke-RestMethod "https://www.elgato.com/graphql?query=query%20contentJson(%24identifier%3A%5BString%5D%24contentType%3AString%24options%3AContentJsonOptionsInput)%7BcontentJson(identifiers%3A%24identifier%20contentType%3A%24contentType%20options%3A%24options)%7Bidentifier%20entries%7D%7D&operationName=contentJson&variables=%7B%22contentType%22%3A%22downloads%22%2C%22identifier%22%3A%5B%22downloads%22%5D%2C%22options%22%3A%7B%22level%22%3A1%7D%7D&locale=en-US" -ErrorAction Stop
    $Entries = $Response.data.contentJson.entries | ConvertFrom-Json
    New-NevergreenApp -Name 'Elgato Stream Deck' -Version $Entries.downloadData.'sd-win'.version -Uri $Entries.downloadData.'sd-win'.downloadURL -Architecture 'x64' -Type 'MSI'
}
catch {
    Write-Error "$($MyInvocation.MyCommand): $($_.Exception.Message)"
}


#Elgato 4K Capture Utility = 4kcu-win
#Elgato Audio Effects = audio-effects-win
#Elgato Camera Hub = camera-hub-win
#Elgato Control Center = cc-win
#Elgato Game Capture = gc-win
#Elgato Video Capture = vc-win
#Elgato Wave Link = wave-link-win