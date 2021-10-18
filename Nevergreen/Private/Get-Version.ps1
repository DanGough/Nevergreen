function Get-Version {
    <#
    .SYNOPSIS
        Extracts a version number from either a string or the content of a web page using a chosen or pre-defined match pattern.

    .DESCRIPTION
        Extracts a version number from either a string or the content of a web page using a chosen or pre-defined match pattern.

    .NOTES
        Site: https://packageology.com
        Author: Dan Gough
        Twitter: @packageologist

    .LINK
        https://github.com/DanGough/Nevergreen

    .PARAMETER String
        The string to process.

    .PARAMETER Uri
        The Uri to load web content from to process.

    .PARAMETER UserAgent
        Optional parameter to provide a user agent for Invoke-WebRequest to use. Examples are:

        Googlebot: 'Googlebot/2.1 (+http://www.google.com/bot.html)'
        Microsoft Edge: 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/42.0.2311.135 Safari/537.36 Edge/12.246'

    .PARAMETER Pattern
        Optional RegEx pattern to use for version matching. Pattern to return must be included in parentheses.

    .PARAMETER ReplaceWithDot
        Switch to automatically replace characters - or _ with . in detected version.

    .EXAMPLE
        Get-Version -String 'http://somewhere.com/somefile_1.2.3.exe'

        Description:
        Returns '1.2.3'
    #>
    [CmdletBinding(SupportsShouldProcess = $False)]
    param (
        [Parameter(
            Mandatory = $true,
            Position = 0,
            ValueFromPipeline = $true,
            ParameterSetName = 'String')]
        [ValidateNotNullOrEmpty()]
        [String[]] $String,
        [Parameter(
            Mandatory = $true,
            ParameterSetName = 'Uri')]
        [ValidatePattern('^(http|https)://')]
        [String] $Uri,
        [Parameter(
            Mandatory = $false,
            ParameterSetName = 'Uri')]
        [String] $UserAgent,
        [Parameter(
            Mandatory = $false,
            Position = 1)]
        [ValidateNotNullOrEmpty()]
        [String] $Pattern = '((?:\d+\.)+\d+)',
        [Switch] $ReplaceWithDot
    )

    begin {

    }

    process {

        if ($PsCmdlet.ParameterSetName -eq 'Uri') {

            $ProgressPreference = 'SilentlyContinue'

            try {
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

                $String = (Invoke-WebRequest @ParamHash).Content
            }
            catch {
                Write-Error "Unable to query URL '$Uri': $($_.Exception.Message)"
            }

        }

        foreach ($CurrentString in $String) {

            if ($CurrentString -match $Pattern) {
                if ($ReplaceWithDot) {
                    $matches[1].Replace('-','.').Replace('_','.')
                }
                else {
                    $matches[1]
                }
            }
            else {
                Write-Warning "No version found within $CurrentString using pattern $Pattern"
            }

        }

    }

    end {
    }

}