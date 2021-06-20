function Get-Version {
    <#
    .SYNOPSIS
        Extracts a version number from a string using a chosen or pre-defined match pattern.

    .DESCRIPTION
        Extracts a version number from a string using a chosen or pre-defined match pattern.

    .NOTES
        Site: https://packageology.com
        Author: Dan Gough
        Twitter: @packageologist

    .LINK
        https://github.com/DanGough/Nevergreen

    .PARAMETER String
        The string to process.

    .PARAMETER Pattern
        Optional RegEx pattern to use for version matching.

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
            ValueFromPipeline)]
        [ValidateNotNullOrEmpty()]
        [String[]] $String,
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