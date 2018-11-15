# sthInvokeUsingCulture
[![Build Status](https://dev.azure.com/sethv/seth/_apis/build/status/sthInvokeUsingCulture)](https://dev.azure.com/sethv/seth/_build/latest?definitionId=7)

**sthInvokeUsingCulture** - is a module, containing four functions for invoking commands using specified culture

It contains following functions:

[**Enter-sthCulture**](#enter-sthculture) - Function enters specified culture 'scope'.

[**Invoke-sthUsingCulture**](#invoke-sthusingculture) - Function invokes command using specified culture.

[**Set-sthCulture**](#set-sthculture) - Function sets specified culture for the current session.

[**Reset-sthCulture**](#reset-sthculture) - Function resets culture for the current session to its original value.


## How to install it?

You can install sthInvokeUsingCulture module from PowerShell Gallery:

```
Install-Module sthInvokeUsingCulture
```

## How to use it?

### Enter-sthCulture

#### Example 1: Enter the specified culture 'scope'

The commands enter the specified culture 'scope' and invoke a command.\
The first command enters the de-DE culture 'scope'.\
The second command uses -f operator to format the number.\
The third command exits the de-DE culture 'scope'.

```
PS C:\> Enter-sthCulture -Culture de-DE

[de-DE] PS C:\>> "{0:n}" -f 1234567890

1.234.567.890,00

[de-DE] PS C:\>> exit

PS C:\>
```

### Invoke-sthUsingCulture

#### Example 1: Invoke command using specified culture

The command invokes the scriptblock using culture de-DE.

```
Invoke-sthUsingCulture -Culture de-DE -ScriptBlock {"{0:n}" -f 1234567890}

1.234.567.890,00
```

---

#### Example 2: Invoke Get-Help command using specified culture

The command invokes the Get-Help command for the Enter-sthCulture function using culture ru-RU.

```
Invoke-sthUsingCulture -Culture ru-ru -ScriptBlock { Get-Help Enter-sthCulture }

NAME
    Enter-sthCulture

SYNOPSIS
    Входит в 'область' указанных региональных настроек.
...
```

If you have already invoked the Get-Help command for the function using default culture, and now the result of the aforementioned command still uses that default culture, just re-import the module, which contain the command you are getting help for, like this: Import-Module sthInvokeUsingCulture and invoke the command again.

### Set-sthCulture

#### Example 1: Change the current culture

The first command sets culture to de-DE for the current session.\
The second command uses -f operator to format the number.

```
Set-sthCulture -Culture de-DE

"{0:n}" -f 1234567890

1.234.567.890,00
```

### Reset-sthCulture

#### Example 1: Reset culture to its original value

The first command gets current culture. It is en-US.\
The second command changes culture to fr-FR for the current session.\
The third command gets current culture. Now it is fr-FR.\
The fourth command resets culture.\
The fifth command gets current culture. Now it is en-US again.


```
Get-Culture

LCID             Name             DisplayName
----             ----             -----------
1033             en-US            English (United States)

Set-sthCulture -Culture fr-FR

Get-Culture

LCID             Name             DisplayName
----             ----             -----------
1036             fr-FR            French (France)

Reset-sthCulture

Get-Culture

LCID             Name             DisplayName
----             ----             -----------
1033             en-US            English (United States)
```
