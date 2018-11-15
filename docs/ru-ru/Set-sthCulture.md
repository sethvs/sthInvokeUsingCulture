---
external help file: sthInvokeUsingCulture-help.xml
Module Name: sthInvokeUsingCulture
online version:
schema: 2.0.0
---

# Set-sthCulture

## SYNOPSIS
Задает региональные настройки.

## SYNTAX

```
Set-sthCulture [[-Culture] <CultureInfo>]
```

## DESCRIPTION
Функция задает указанные региональные настройки для текущей сессии.

## PARAMETERS

### -Culture
Указывает региональные настройки.

В качестве значения параметр принимает объекты CultureInfo, имена, такие как 'en-US' или идентификаторы, такие как 1033, региональных настроек.

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

### Пример 1: Изменение текущих региональных настроек
```powershell
Set-sthCulture -Culture de-DE

"{0:n}" -f 1234567890

1.234.567.890,00
```

Первая команда изменяет текущие региональные настройки на de-DE.\
Вторая команда использует оператор -f для форматирования значения.

## RELATED LINKS
