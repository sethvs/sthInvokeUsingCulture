---
external help file: sthInvokeUsingCulture-help.xml
Module Name: sthInvokeUsingCulture
online version:
schema: 2.0.0
---

# Set-sthCulture

## SYNOPSIS
Sets the culture.

## SYNTAX

```
Set-sthCulture [[-Culture] <CultureInfo>]
```

## DESCRIPTION
The function sets the specified culture for the current session.

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

## INPUTS

### None

## OUTPUTS

### System.Object
## NOTES

## EXAMPLES

### Example 1: Change the current culture
```powershell
Set-sthCulture -Culture de-DE
"{0:c}" -f 15
15,00 €
```

The first command sets culture to de-DE for the current session.\
The second command uses -f operator to format number as currency.

## RELATED LINKS
