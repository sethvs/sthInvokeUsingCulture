# .ExternalHelp sthInvokeUsingCulture.help.xml
function Invoke-sthUsingCulture
{
    Param(
        [System.Globalization.CultureInfo]$Culture,
        [ScriptBlock]$ScriptBlock
    )

    $CurrentCulture = [System.Threading.Thread]::CurrentThread.CurrentCulture
    $CurrentUICulture = [System.Threading.Thread]::CurrentThread.CurrentUICulture

    try
    {
        [System.Threading.Thread]::CurrentThread.CurrentCulture = $Culture
        [System.Threading.Thread]::CurrentThread.CurrentUICulture = $Culture
        Invoke-Command -ScriptBlock $ScriptBlock
    }
    finally
    {
        [System.Threading.Thread]::CurrentThread.CurrentCulture = $CurrentCulture
        [System.Threading.Thread]::CurrentThread.CurrentUICulture = $CurrentUICulture
    }
}

# .ExternalHelp sthInvokeUsingCulture.help.xml
function Enter-sthCulture
{
    Param(
        [System.Globalization.CultureInfo]$Culture
    )

    $CurrentCulture = [System.Threading.Thread]::CurrentThread.CurrentCulture
    $CurrentUICulture = [System.Threading.Thread]::CurrentThread.CurrentUICulture

    $CurrentPrompt = Get-Content -Path function:/prompt

    [System.Threading.Thread]::CurrentThread.CurrentCulture = $Culture
    [System.Threading.Thread]::CurrentThread.CurrentUICulture = $Culture

    # Set-Content -Path function:/prompt -Value {"[$($Culture.Name)] PS $($executionContext.SessionState.Path.CurrentLocation)$('>' * ($nestedPromptLevel + 1)) "}

    $PromptLine = "`"[`$(`$Culture.Name)] PS `$(`$executionContext.SessionState.Path.CurrentLocation)`$('>' * (`$nestedPromptLevel + 1)) `""
    $Prompt = [scriptblock]::Create($PromptLine)
    Set-Content -Path function:/prompt -Value $Prompt

    $host.EnterNestedPrompt()

    Set-Content -Path function:/prompt -Value $CurrentPrompt

    [System.Threading.Thread]::CurrentThread.CurrentCulture = $CurrentCulture
    [System.Threading.Thread]::CurrentThread.CurrentUICulture = $CurrentUICulture
}

# .ExternalHelp sthInvokeUsingCulture.help.xml
function Set-sthCulture
{
    Param(
        [System.Globalization.CultureInfo]$Culture
    )

    if (!$Script:_defaultCulture)
    {
        $Script:_defaultCulture = [System.Threading.Thread]::CurrentThread.CurrentCulture
    }
    if (!$Script:_defaultUICulture)
    {
        $Script:_defaultUICulture = [System.Threading.Thread]::CurrentThread.CurrentUICulture
    }

    [System.Threading.Thread]::CurrentThread.CurrentCulture = $Culture
    [System.Threading.Thread]::CurrentThread.CurrentUICulture = $Culture
}

# .ExternalHelp sthInvokeUsingCulture.help.xml
function Reset-sthCulture
{
    if ($Script:_defaultCulture)
    {
        [System.Threading.Thread]::CurrentThread.CurrentCulture = $Script:_defaultCulture
        Remove-Variable -Name _defaultCulture -Scope Script
    }
    if ($Script:_defaultUICulture)
    {
        [System.Threading.Thread]::CurrentThread.CurrentUICulture = $Script:_defaultUICulture
        Remove-Variable -Name _defaultUICulture -Scope Script
    }
}
