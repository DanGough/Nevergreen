$Public = @(Get-ChildItem -Path ([System.IO.Path]::Combine($PSScriptRoot, 'Public', '*.ps1')))
$Private = @(Get-ChildItem -Path ([System.IO.Path]::Combine($PSScriptRoot, 'Private', '*.ps1')) -ErrorAction Ignore)

ForEach ($Import in @($Public + $Private)) {
    Try {
        . $Import.FullName
    }
    Catch {
        Write-Error -Message "Failed to import function $($Import.FullName): $_"
    }
}

Export-ModuleMember -Function $Public.Basename

Register-ArgumentCompleter -CommandName 'Get-NevergreenApp', 'Find-NevergreenApp' -ParameterName 'Name' -ScriptBlock {
    param($commandName, $parameterName, $wordToComplete, $commandAst, $fakeBoundParameters)

    $Apps = Get-ChildItem -Path ([System.IO.Path]::Combine($PSScriptRoot, 'Apps', '*.ps1'))
    $Apps.Name -replace '^Get-' -replace '\.ps1$' | Where-Object {
        $_ -like "$wordToComplete*"
    }
}
