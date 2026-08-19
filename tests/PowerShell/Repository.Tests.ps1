BeforeAll {
    $script:Root = Split-Path -Parent (Split-Path -Parent $PSScriptRoot)
    $script:ScriptFiles = @(Get-ChildItem -Path (Join-Path $script:Root 'scripts') -Filter '*.ps1' -Recurse)
}

Describe 'BAS-Guardian repository' {
    It 'contains at least one PowerShell scanner file' {
        $script:ScriptFiles.Count | Should -BeGreaterThan 0
    }

    It 'has PowerShell scanner files that parse without errors' -ForEach $script:ScriptFiles {
        $tokens = $null
        $errors = $null
        [void][System.Management.Automation.Language.Parser]::ParseFile($_.FullName, [ref]$tokens, [ref]$errors)
        $errors.Count | Should -Be 0
    }

    It 'contains required governance and safety documentation' {
        @('CHANGELOG.md','CODE_OF_CONDUCT.md','docs/safe-operation.md','docs/threat-model.md','docs/sample-report.md') | ForEach-Object {
            Test-Path (Join-Path $script:Root $_) | Should -BeTrue
        }
    }

    It 'states that use requires authorization' {
        (Get-Content (Join-Path $script:Root 'README.md') -Raw) | Should -Match '(?i)authorized|permission'
    }
}
