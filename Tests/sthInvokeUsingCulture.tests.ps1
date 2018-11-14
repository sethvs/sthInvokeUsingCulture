Remove-Module -Name sthInvokeUsingCulture -Force -ErrorAction 'SilentlyContinue'
Import-Module "$PSScriptRoot\..\sthInvokeUsingCulture.psd1"

Describe "sthInvokeUsingCulture" {
    
    Write-Host "$($PSVersionTable.PSVersion)" 
    BeforeAll {
        $en = [System.Globalization.CultureInfo]'en-US'
        $en_name = 'en-US'
        $en_id = 1033

        $de = [System.Globalization.CultureInfo]'de-DE'
        $de_name = 'de-DE'
        $de_id = 1031

        $ru = [System.Globalization.CultureInfo]'ru-RU'
        $ru_name = 'ru-RU'
        $ru_id = 1049

        $ScriptBlock = {"{0:c}" -f 15}

        $data = Get-Content -Path "$PSScriptRoot\sthInvokeUsingCulture.tests.data.psd1" -Raw -Encoding utf8
        $result = ConvertFrom-StringData -StringData $data
    }

    Context "Invoke-sthUsingCulture" {

        Context "Using CultureInfo objects" {

            $testCases = @(
                @{Culture = $en; Result = $result.en}
                @{Culture = $de; Result = $result.de}
                @{Culture = $ru; Result = $result.ru}
            )

            It "Should use culture <Culture>" -TestCases $testCases {

                Param ($Culture, $Result)
                Invoke-sthUsingCulture -Culture $Culture -ScriptBlock $ScriptBlock | Should -BeExactly $Result
            }
        }

        Context "Using culture names" {

            $testCases = @(
                @{Culture = $en_name; Result = $result.en}
                @{Culture = $de_name; Result = $result.de}
                @{Culture = $ru_name; Result = $result.ru}
            )

            It "Should use culture <Culture>" -TestCases $testCases {

                Param ($Culture, $Result)
                Invoke-sthUsingCulture -Culture $Culture -ScriptBlock $ScriptBlock | Should -BeExactly $Result
            }
        }

        Context "Using culture IDs" {

            $testCases = @(
                @{Culture = $en_id; Result = $result.en}
                @{Culture = $de_id; Result = $result.de}
                @{Culture = $ru_id; Result = $result.ru}
            )

            It "Should use culture <Culture>" -TestCases $testCases {

                Param ($Culture, $Result)
                Invoke-sthUsingCulture -Culture $Culture -ScriptBlock $ScriptBlock | Should -BeExactly $Result
            }
        }
    }

    Context "Enter-sthCulture" {

        $HostScriptBlockString = @"
        `$Script:Host = [PSCustomObject]@{Name = 'Host'}
        `$Script:Host | Add-Member -MemberType ScriptMethod -Name EnterNestedPrompt -Value {$ScriptBlock}
"@

        $HostScriptBlock = [ScriptBlock]::Create($HostScriptBlockString).GetNewClosure()

        InModuleScope -ModuleName sthInvokeUsingCulture -ScriptBlock $HostScriptBlock

        Context "Using CultureInfo objects" {

            $testCases = @(
                @{Culture = $en; Result = $result.en}
                @{Culture = $de; Result = $result.de}
                @{Culture = $ru; Result = $result.ru}
            )

            It "Should use culture <Culture>" -TestCases $testCases {

                Param ($Culture, $Result)
                Enter-sthCulture -Culture $Culture | Should -BeExactly $Result
        }
    }

        Context "Using culture names" {

            $testCases = @(
                @{Culture = $en_name; Result = $result.en}
                @{Culture = $de_name; Result = $result.de}
                @{Culture = $ru_name; Result = $result.ru}
            )

            It "Should use culture <Culture>" -TestCases $testCases {

                Param ($Culture, $Result)
                Enter-sthCulture -Culture $Culture | Should -BeExactly $Result
            }
        }

        Context "Using culture IDs" {

            $testCases = @(
                @{Culture = $en_id; Result = $result.en}
                @{Culture = $de_id; Result = $result.de}
                @{Culture = $ru_id; Result = $result.ru}
            )

            It "Should use culture <Culture>" -TestCases $testCases {

                Param ($Culture, $Result)
                Enter-sthCulture -Culture $Culture | Should -BeExactly $Result
            }
        }
    }

    Context "Set-sthCulture" {

        $OriginalCulture = Get-Culture
        $OriginalUICulture = Get-UICulture
        $OriginalResult = & $ScriptBlock

        Context "Using CultureInfo objects" {

            $testCases = @(
                @{Culture = $en; Result = $result.en}
                @{Culture = $de; Result = $result.de}
                @{Culture = $ru; Result = $result.ru}
            )

            It "Should use culture <Culture>" -TestCases $testCases {

                Param ($Culture, $Result)
                Set-sthCulture -Culture $Culture
                & $ScriptBlock | Should -BeExactly $Result
            }

            It "Should revert to original culture '$OriginalCulture'" {
                Reset-sthCulture
                Get-Culture | Should -Be $OriginalCulture
                Get-UICulture | Should -Be $OriginalUICulture
                & $ScriptBlock | Should -BeExactly $OriginalResult
            }
        }

        Context "Using culture names" {

            $testCases = @(
                @{Culture = $en_name; Result = $result.en}
                @{Culture = $de_name; Result = $result.de}
                @{Culture = $ru_name; Result = $result.ru}
            )
            It "Should use culture <Culture>" -TestCases $testCases {

                Param ($Culture, $Result)
                Set-sthCulture -Culture $Culture
                & $ScriptBlock | Should -BeExactly $Result
            }

            It "Should revert to original culture '$OriginalCulture'" {
                Reset-sthCulture
                Get-Culture | Should -Be $OriginalCulture
                Get-UICulture | Should -Be $OriginalUICulture
                & $ScriptBlock | Should -BeExactly $OriginalResult
            }
        }

        Context "Using culture IDs" {

            $testCases = @(
                @{Culture = $en_id; Result = $result.en}
                @{Culture = $de_id; Result = $result.de}
                @{Culture = $ru_id; Result = $result.ru}
            )

            It "Should use culture <Culture>" -TestCases $testCases {

                Param ($Culture, $Result)
                Set-sthCulture -Culture $Culture
                & $ScriptBlock | Should -BeExactly $Result
            }

            It "Should revert to original culture '$OriginalCulture'" {
                Reset-sthCulture
                Get-Culture | Should -Be $OriginalCulture
                Get-UICulture | Should -Be $OriginalUICulture
                & $ScriptBlock | Should -BeExactly $OriginalResult
            }
        }
    }
}
