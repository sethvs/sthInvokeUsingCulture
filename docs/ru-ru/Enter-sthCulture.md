---
external help file: sthInvokeUsingCulture-help.xml
Module Name: sthInvokeUsingCulture
online version:
schema: 2.0.0
---

# Enter-sthCulture

## SYNOPSIS
Входит в 'область' указанных региональных настроек.

## SYNTAX

```
Enter-sthCulture [[-Culture] <CultureInfo>]
```

## DESCRIPTION
Функция входит в 'область' указанных региональных настроек.

Во время нахождения в этой 'области', все вызванные команды выполняются с этими региональными настройками.

Для выхода, введите 'exit'.

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

### Пример 1: Вход в область указанных региональных настроек
```powershell
PS C:\> Enter-sthCulture -Culture de-DE

[de-DE] PS C:\>> "{0:c}" -f 15

15,00 €

[de-DE] PS C:\>> exit

PS C:\>
```

Первая команда входит в область региональных настроек de-DE.\
Вторая команда использует оператор -f для форматирования значения 15 в виде денежных единиц.\
Третья команда выходит из области de-DE.

## RELATED LINKS
