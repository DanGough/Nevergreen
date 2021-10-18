function Get-Link {
    <#
    .SYNOPSIS
        Returns a specific link from a web page.

    .DESCRIPTION
        Returns a specific link from a web page.

    .NOTES
        Site: https://packageology.com
        Author: Dan Gough
        Twitter: @packageologist

    .LINK
        https://github.com/DanGough/Nevergreen

    .PARAMETER Uri
        The URI to query.

    .PARAMETER MatchProperty
        Whether the RegEx pattern should be applied to the href, outerHTML, class, title or data-filename of the link.

    .PARAMETER Pattern
        The RegEx pattern to apply to the selected property. Supply an array of patterns to receive multiple links.

    .PARAMETER ReturnProperty
        Optional. Specifies which property to return from the link. Defaults to href, but 'data-filename' can also be useful to retrieve.

    .PARAMETER UserAgent
        Optional parameter to provide a user agent for Invoke-WebRequest to use. Examples are:

        Googlebot: 'Googlebot/2.1 (+http://www.google.com/bot.html)'
        Microsoft Edge: 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/42.0.2311.135 Safari/537.36 Edge/12.246'

    .EXAMPLE
        Get-Link -Uri 'http://somewhere.com' -MatchProperty href -Pattern '\.exe$'

        Description:
        Returns first download link matching *.exe from http://somewhere.com.
    #>
    [CmdletBinding(SupportsShouldProcess = $False)]
    param (
        [Parameter(
            Mandatory = $true,
            Position = 0,
            ValueFromPipeline)]
        [ValidatePattern('^(http|https)://')]
        [Alias('Url')]
        [String] $Uri,
        [Parameter(
            Mandatory = $true,
            Position = 1)]
        [ValidateSet('href', 'outerHTML', 'innerHTML', 'outerText', 'innerText', 'class', 'title', 'tagName', 'data-filename')]
        [String] $MatchProperty,
        [Parameter(
            Mandatory = $true,
            Position = 2)]
        [ValidateNotNullOrEmpty()]
        [String[]] $Pattern,
        [Parameter(
            Mandatory = $false,
            Position = 3)]
        [ValidateNotNullOrEmpty()]
        [String] $ReturnProperty = 'href',
        [Parameter(
            Mandatory = $false)]
        [String] $UserAgent,
        [Switch] $PrefixDomain,
        [Switch] $PrefixParent
    )

    $ProgressPreference = 'SilentlyContinue'

    $ParamHash = @{
        Uri              = $Uri
        Method           = 'GET'
        UseBasicParsing  = $True
        DisableKeepAlive = $True
        ErrorAction      = 'Stop'
    }

    if ($UserAgent) {
        $ParamHash.UserAgent = $UserAgent
    }

    try {
        $Response = Invoke-WebRequest @ParamHash

        foreach ($CurrentPattern in $Pattern) {
            $Link = $Response.Links | Where-Object $MatchProperty -Match $CurrentPattern | Select-Object -First 1 -ExpandProperty $ReturnProperty

            if ($PrefixDomain) {
                $BaseURL = ($Uri -split '/' | Select-Object -First 3) -join '/'
                $Link = Set-UriPrefix -Uri $Link -Prefix $BaseURL
            }
            elseif ($PrefixParent) {
                $BaseURL = ($Uri -split '/' | Select-Object -SkipLast 1) -join '/'
                $Link = Set-UriPrefix -Uri $Link -Prefix $BaseURL
            }

            $Link

        }
    }
    catch {
        Write-Error "$($MyInvocation.MyCommand): $($_.Exception.Message)"
    }

}