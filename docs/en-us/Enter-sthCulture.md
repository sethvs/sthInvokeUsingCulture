---
external help file: sthInvokeUsingCulture-help.xml
Module Name: sthInvokeUsingCulture
online version:
schema: 2.0.0
---

# Enter-sthCulture

## SYNOPSIS
Enters the specified culture 'scope'.

## SYNTAX

```
Enter-sthCulture [[-Culture] <CultureInfo>]
```

## DESCRIPTION
The function enters the specified culture 'scope'.

While in this 'scope', all commands invoke using this culture.

To exit, type 'exit'.

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

### Example 1: Enter the specified culture 'scope'
```powershell
PS C:\> Enter-sthCulture -Culture de-DE

[de-DE] PS C:\>> "{0:c}" -f 15

15,00 €

[de-DE] PS C:\>> exit

PS C:\>
```

The first command enters the de-DE culture 'scope'.\
The second command uses -f operator to format number as currency.\
The third command exits the de-DE culture 'scope'.

## RELATED LINKS
