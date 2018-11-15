---
external help file: sthInvokeUsingCulture-help.xml
Module Name: sthInvokeUsingCulture
online version:
schema: 2.0.0
---

# Reset-sthCulture

## SYNOPSIS
Resets culture.

## SYNTAX

```
Reset-sthCulture
```

## DESCRIPTION
The function resets culture for the current session to its original value.

## PARAMETERS

## INPUTS

### None

## OUTPUTS

### System.Object
## NOTES

## EXAMPLES

### Example 1: Reset culture to its original value
```powershell
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

The first command gets current culture. It is en-US.\
The second command changes culture to fr-FR for the current session.\
The third command gets current culture. Now it is fr-FR.\
The fourth command resets culture.\
The fifth command gets current culture. Now it is en-US again.

## RELATED LINKS
