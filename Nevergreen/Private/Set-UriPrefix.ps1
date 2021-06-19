function Set-UriPrefix {
    <#
    .SYNOPSIS
        Prefixes a URI with a specific domain if one is not already present.

    .DESCRIPTION
        Some web pages store URIs as relative paths, this function will prefix such URLs with a chosen domain.

    .NOTES
        Site: https://packageology.com
        Author: Dan Gough
        Twitter: @packageologist

    .LINK
        https://github.com/DanGough/Nevergreen

    .PARAMETER Uri
        The URI to process.

    .PARAMETER Prefix
        The prefix to add to the URI.

    .EXAMPLE
        Set-UriPrefix -Uri '/somefile.exe' -Prefix 'http://somewhere.com'

        Description:
        Returns 'http://somewhere.com/somefile.exe'
    #>
    [CmdletBinding(SupportsShouldProcess = $False)]
    param (
        [Parameter(
            Mandatory = $true,
            Position = 0,
            ValueFromPipeline,
            ValueFromPipelineByPropertyName)]
        [ValidateNotNullOrEmpty()]
        [Alias('Url')]
        [System.String] $Uri,
        [Parameter(
            Mandatory = $true,
            Position = 1)]
        [ValidateNotNullOrEmpty()]
        [System.String] $Prefix
    )

    if ($Uri -like "$Prefix*") {
        # Nothing to do, return input
        $Uri
    }
    else {
        # Strip off any existing domain
        $Suffix = $Uri -replace 'https?://[^/]+',''
        # Output joined strings
        @($Prefix.TrimEnd('/'), $Suffix.TrimStart('/')) -join '/'
    }
}