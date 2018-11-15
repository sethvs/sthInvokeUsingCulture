---
external help file: sthInvokeUsingCulture-help.xml
Module Name: sthInvokeUsingCulture
online version:
schema: 2.0.0
---

# Reset-sthCulture

## SYNOPSIS
Возвращает региональные настройки.

## SYNTAX

```
Reset-sthCulture
```

## DESCRIPTION
Функция возвращает региональные настройки для текущей сессии к изначальному значению.

## PARAMETERS

## INPUTS

### None

## OUTPUTS

### System.Object
## NOTES

## EXAMPLES

### Пример 1: Возвращение региональных настроек к первоначальному значению
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

Первая команда получает текущие региональные настройки. Сейчас это en-US.\
Вторая команда изменяет их на fr-FR для текущей сессии.\
Третья команда получает текущие региональные настройки. Сейчас это fr-FR.\
Четвертая команда возвращает их к первоначальному значению.\
Третья команда получает текущие региональные настройки. Сейчас это снова en-US.

## RELATED LINKS
