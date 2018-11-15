---
external help file: sthInvokeUsingCulture-help.xml
Module Name: sthInvokeUsingCulture
online version:
schema: 2.0.0
---

# Invoke-sthUsingCulture

## SYNOPSIS
Выполняет команду с использованием указанных региональных настроек.

## SYNTAX

```
Invoke-sthUsingCulture [[-Culture] <CultureInfo>] [[-ScriptBlock] <ScriptBlock>]
```

## DESCRIPTION
Функция выполняет команду с использованием указанных региональных настроек.

Текущие региональные настройки при этом не изменяются.

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

### -ScriptBlock
Указывает скрипт-блок.

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

### Пример 1: Выполнение команды с использованием указанных региональных настроек
```powershell
Invoke-sthUsingCulture -Culture de-DE -ScriptBlock {"{0:n}" -f 1234567890}

1.234.567.890,00
```

Команда выполняет скрипт-блок с использованием региональных настроек de-DE.

### Пример 2: Выполнение команды Get-Help с использованием указанных региональных настроек
```powershell
Invoke-sthUsingCulture -Culture ru-ru -ScriptBlock { Get-Help Enter-sthCulture }

NAME
    Enter-sthCulture

SYNOPSIS
    Входит в 'область' указанных региональных настроек.
...
```

Команда выполняет команду Get-Help для функции Enter-sthCulture с использованием региональных настроек ru-RU.

Если ранее вы уже использовали команду Get-Help для функции с использованием региональных настроек по умолчанию и теперь вышеприведенная команда возвращает результат в соответствии с этими настройками по умолчанию вместо указанных, просто реимпортируйте модуль в который входит функция, для которой вы получаете справочную информацию, например, так: Import-Module sthInvokeUsingCulture и вызовите команду еще раз.

## RELATED LINKS
