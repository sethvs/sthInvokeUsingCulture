---
external help file: sthInvokeUsingCulture-help.xml
Module Name: sthInvokeUsingCulture
online version:
schema: 2.0.0
---

# Invoke-sthUsingCulture

## SYNOPSIS
Invokes command using specified culture.
## SYNTAX

```
Invoke-sthUsingCulture [[-Culture] <CultureInfo>] [[-ScriptBlock] <ScriptBlock>]
```

## DESCRIPTION
The function invokes command using specified culture.

It doesn't change the current culture.

## PARAMETERS

### -Culture
Specifies the culture.

Parameters accepts CultureInfo objects, culture names, like 'en-us', or culture IDs, like 1033.

```yaml
Type: CultureInfo
Parameter Sets: (All)
Aliases:

Required: False
Position: 0
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -ScriptBlock
Specifies the scriptblock.

```yaml
Type: ScriptBlock
Parameter Sets: (All)
Aliases:

Required: False
Position: 1
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

## INPUTS

### None

## OUTPUTS

### System.Object
## NOTES

## EXAMPLES

### Example 1: Invoke command using specified culture
```powershell
Invoke-sthUsingCulture -Culture de-DE -ScriptBlock {"{0:c}" -f 15}

15,00 €
```

The command invokes the scriptblock using culture de-DE.

### Example 2: Invoke Get-Help command using specified culture
```powershell
Invoke-sthUsingCulture -Culture ru-ru -ScriptBlock { Get-Help Enter-sthCulture }

NAME
    Enter-sthCulture

SYNOPSIS
    Входит в 'область' указанных региональных настроек.
...
```

The command invokes the Get-Help command for the Enter-sthCulture function using culture ru-RU.

If you have already invoked the Get-Help command for the function using default culture, and now the result of the aforementioned command still uses that default culture, just re-import the module, which contain the command you are getting help for, like this: Import-Module sthInvokeUsingCulture and invoke the command again.

## RELATED LINKS
