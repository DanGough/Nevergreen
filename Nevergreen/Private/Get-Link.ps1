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

    .PARAMETER MatchProperty
        Optional. Specifies which property to return from the link. Defaults to href, but 'data-filename' can also be useful to retrieve.

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
        [ValidateSet('href', 'OuterHTML', 'class', 'title', 'data-filename')]
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
        [Switch] $PrefixDomain,
        [Switch] $PrefixParent
    )

    $ProgressPreference = 'SilentlyContinue'
    $Response = Invoke-WebRequest -Uri $Uri -DisableKeepAlive -UseBasicParsing

    foreach ($CurrentPattern in $Pattern) {
        $Link = $Response.Links | Where-Object $MatchProperty -match $CurrentPattern | Select-Object -First 1 -ExpandProperty $ReturnProperty

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