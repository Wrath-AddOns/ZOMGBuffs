﻿local L = LibStub("AceLocale-2.2"):new("ZOMGBuffs")

L:RegisterTranslations("ruRU", function() return
--[===[@debug@
{
}
--@end-debug@]===]
{
	ABOUT = [=[Об аддоне

Модификация "Все в одном" для всех классов. Баффы Паладина назначаются на основе способностей Паладина и под-классов членов рейда (друид-танк или друид-лекарь и т.п.). Плюс слежение за рейдовыми баффами и мгновенный каст по правому клику мышкой.

Автор: {Author}
Категория: {X-Category}
E-mail: {X-Email}
Website: {X-Website}
Лицензия: {X-License}]=], -- Needs review
	Actions = "Действия",
	["Adjust height of the bars"] = "Настроить высоту панелей",
	["Adjust the size of the timer text"] = "Настроить размер шрифта таймеров",
	["Adjust width of unit list"] = "Настроить ширину списка персонажей",
	Alphabetical = "По-алфавиту",
	["Also buff current target (assuming they're not in your party or raid"] = "Также вешать бафф на текущую цель (подразумевается что цель не в вашей группе или рейде)",
	["Alt-"] = "Alt-",
	["Always Load Manager"] = "Всегда Загружать Менеджер",
	["Always Load Portalz"] = "Всегда загружать Portalz",
	["Always load the Blessings Manager, even when not eligable to modify blessings"] = "Всегда загружать Менеджер Благословений, даже когда не возможности их изменять.",
	["Always load the Portalz module, even when not a Mage"] = "Всегда загружать Portalz модуль, даже если персонаж не Маг",
	Anchor = "Якорь",
	Arena = "Арена",
	["Auto Buy Reagents"] = "Авто-покупка реагентов",
	["Auto-casting is disabled"] = "Авто-каст выключен",
	["Auto-casting %s"] = "Авто-каст",
	["Automatically purchase required reagents from Reagents Vendor"] = "Автоматически покупать необходимые реагенты у торговцев",
	["Automatically switch to this template"] = "Автоматически включать этот шаблон",
	["Auto purchase level for %s (will not exceed this amount)"] = "Уровень автопокупки для %s (не превысит это значение)",
	Autosave = "Автосохранение",
	["Auto Switch"] = "Авто-Переключение",
	["Bar Height"] = "Высота Панелей",
	["Bar Texture"] = "Текстуры Панелей",
	Battleground = "Поле боя",
	Blessings = "Благословения",
	Border = "Граница",
	["Bought |cFF80FF80%d|cFFFFFF80 %s|r from vendor, you now have |cFF80FF80%d|r"] = "Куплено |cFF80FF80%d|cFFFFFF80 %s|r у торговца, у Вас теперь |cFF80FF80%d|r",
	["Buff Pets"] = "Бафф на питомцев",
	["Buff Target"] = "Бафф на цель",
	["Buff Timer"] = "Таймер баффа",
	["Buff times over this number of minutes will not be shown"] = "Время баффа больше этого значения не будет отображаться",
	["Button Five"] = "Кнопка 5",
	["Button Four"] = "Кнопка 4",
	Channel = "Канал",
	CHANNELING = "вы поддерживаете заклинание",
	CHATANSWER = "<ZOMG>",
	CHATMATCH1 = "!бафф",
	CHATMATCH2 = "!zomg",
	CHATMATCH3 = "!баффы",
	["Choose the anchor to use for the player list"] = "Выберите точку привязки для списка игроков",
	["Choose the relative point for the anchor"] = "Выберите относительную точку для точки привязки",
	Class = "Класс",
	["Class Icon"] = "Иконка Класса",
	["Clear talent cache to force refresh"] = "Очистить кэш талантов для запуска обновления",
	["Click Config"] = "Клик-конфигурация",
	Columns = "Колонки",
	["Columns to show in buff list"] = "Колонки для отображения в списке баффов",
	COMBAT = "вы в бою",
	["Configure popup raid list click behaviour"] = "Настроить поведение всплывающего рейд-списка", -- Needs review
	["Ctrl-"] = "Ctrl-",
	DEAD = "вы мертвы",
	Defaults = "По-умолчанию",
	["Define the key used for auto buffing"] = "Назначить кнопку для авто-баффа",
	["Define the mouse click to use for |cFFFFFF80%s|r"] = "Назначить клик мыши для использования |cFFFFFF80%s|r",
	Delete = "Удалить",
	["Delete this template"] = "Удалить этот шаблон",
	Display = "Отображение", -- Needs review
	["Display options"] = "Опции отображения", -- Needs review
	["Display the mouseover icon used by the popup player buff list"] = "Отобразить иконку всплывающего списка баффов", -- Needs review
	["Display the ZOMGBuffs logo on icon"] = "Отображать лого ZOMGBuffs на иконке",
	["Don't auto buff when Mounted"] = "Не использовать функцию авто-баффа верхом",
	["Don't auto buff when Resting"] = "Не использовать функцию авто-баффа во время отдыха",
	["Don't auto buff when Shapeshifted"] = "Не использовать авто-бафф в других формах",
	["Don't auto buff when Stealthed"] = "Не использовать авто-бафф во время невидимости",
	["Don't auto buff when you have Spirit Tap, so you can maximise your regeneration"] = "Не использовать авто-бафф когда на вас \"Захват Души\", таким образом вы максимизируете регенерацию",
	["Don't directly buff PVP flagged players, unless you're already flagged for PVP"] = "Не баффать ПВП-игроков если Вы сами не в ПВП режиме",
	DRINKING = "вы пьете",
	EATING = "вы едите",
	Empty = "Пусто",
	Enable = "Включено",
	["Enable border on the icon"] = "Включить границы на иконке",
	["Enable border on the list"] = "Включить границы в списке",
	FIND_FLASK = "^Настой",
	FIND_POT = "^Эликсир ",
	Finish = "Завершить",
	Flask = "Настой",
	Font = "Шрифт",
	["General buffing behaviour"] = "Поведение основных баффов",
	["Give audible feedback when someone needs rebuffing"] = "Давать звуковую обратную связь когда кто-то нуждается в ребаффе",
	["Give feedback about events"] = "Давать обратную связь о событиях",
	Group = "Группа",
	["Group %d"] = "Группа %d",
	["Group Number"] = "Номер Группы",
	HINT = " |cffeda55fClick|r включить авто-каст, |cffeda55fRight-Click|r для настройки, |cffeda55fClick|r изменить объект, |cffeda55fShift-Click|r объект для удаления из списка само-баффов шаблона.", -- Needs review
	["How much mana should you have before considering auto buffing"] = "Сколько маны должно быть для возможности авто-баффа",
	Icon = "Иконка",
	["Icon Size"] = "Размер Иконки",
	["If players are offline, AFK or in another instance, count them as being present and buff everyone else"] = "Если игроки офлайн, АФК или в другом подземелье, считать их присутствующими и баффать всех остальных",
	["Ignore Absent"] = "Игнорировать Отсутствие",
	["In-Combat"] = "В бою",
	Information = "Информация",
	Intellect = "Интеллект",
	Invert = "Инвертировать",
	["Invert the need/got alpha values"] = "Инвертировать нужно/есть альфа значения",
	Last = "Последний",
	["Learn buff changes in combat"] = "Учиться изменениям баффов в бою",
	["Learn buff changes out of combat"] = "Учиться изменениям баффов вне боя",
	Learning = "Учиться",
	["Left Button"] = "Левая Кнопка",
	List = "Список",
	Load = "Загрузить",
	["Load Raid Module"] = "Загрузить Рейд-модуль",
	["Load this template"] = "Загрузить этот шаблон",
	Lock = "Закрепить",
	MANA = "значение вашей |cFFFFFF80маны|r ниже чем указано в требованиях авто-баффа",
	Mark = "Пометить",
	["Middle Button"] = "Средняя Кнопка",
	["Minimum Mana %"] = "Мин. значение маны %",
	["Miscelaneous actions"] = "Другие действия",
	["Mousewheel Buff"] = "Бафф по вращению колесика мыши",
	Name = "Имя",
	Never = "Никогда",
	["<new name>"] = "<новое имя>",
	NOCONTROL = "Вы не в своем уме",
	Notice = "Замечание",
	["Notice Anchor"] = "Точка привязки замечаний", -- Needs review
	["Not Refreshing because %s"] = "Не Обновляется потому что %s",
	["Not When Mounted"] = "Невозможно верхом",
	["Not When Resting"] = "Невозможно во время отдыха",
	["Not When Shapeshifted"] = "Невозможно в этой форме",
	["Not When Stealthed"] = "Невозможно во время невидимости",
	["Not with Spirit Tap"] = "Невозможно во время действия \"Захват Духа\"",
	["Only use single target buffs"] = "Использовать только баффы единичных целей",
	["Only use single target buffs in arenas"] = "На аренах использовать только баффы единичных целей",
	["Only use single target buffs in battlegrounds"] = "На полях боя использовать только баффы единичных целей",
	["Out of Combat"] = "Вне боя",
	["Out-of-date spell (should be %s). Will be updated when combat ends"] = "Устаревшее заклинание (должно быть %s). Будет обновлено по окончании боя.",
	["Output channel selection"] = "Выбор канала чата для вывода",
	Party = "Группа",
	["Perform extra checks for pets in case any missed the group buffs when they were done"] = "Проводить доп. проверку для питомцев на предмет пропущеных групповых баффов когда они уже сделаны",
	PERSONDIES = "^([^%s]+) умер%.$",
	PORTALZ_HOTKEY = "ZOMGPortalz клавиши быстрого доступа",
	["Position the notification area"] = "Позиция зоны уведомлений",
	["Purchase levels for reagents"] = "Уровень покупки для реагентов",
	Raid = "Рейд",
	["Reagents Levels"] = "Уровень Реагентов",
	["Rebuff Sound"] = "Звук Ребаффа",
	["Relative Point"] = "Относительная Точка",
	Reminders = "Напоминания",
	REMOTECONTROL = "Вы не можете собой управлять",
	Rename = "Переименовать",
	["Renamed template |cFFFFFF80%s|r to |cFFFFFF80%s|r"] = "Переименован шаблон с |cFFFFFF80%s|r на |cFFFFFF80%s|r",
	["Rename this template"] = "Переименовать этот шаблон",
	Report = "Отчет",
	["Report Missing"] = "Отчет отсутствует",
	["Report options"] = "Настройки отчета",
	["Report raid buffs currently missing"] = "Отчет по отсутствующим баффам рейда",
	["Reset Icon Position"] = "Сбросить Позицию Иконки",
	["Reset the icon position to the centre of the screen"] = "Сбросить позицию иконки на центр экрана",
	["Restore default keybindings"] = "Восстановить привязку клавишь по-умолчанию",
	["Revert to the previously unsaved template"] = "Вернуться к предыдущему несохраненному шаблону",
	["Right Button"] = "Правая Кнопка",
	["Route notification messages through SinkLib"] = "Направялть уведомления через SinkLib",
	Save = "Сохранить",
	["Save current setup as a new template"] = "Сохранить текущие настройки как новый шаблон",
	["Saved template %q"] = "Шаблон %q сохранен.",
	["%s blacklisted for 10 seconds"] = "%s в черном списке на 10 сек.",
	["Set the texture for the buff timer bars"] = "Выбрать текстуру для панелей таймеров баффа",
	["Settings for the popup buff list"] = "Настройки для всплывающего списка баффов",
	["Setup spell learning behaviour"] = "Настроить поведение самообучения",
	["Shift-"] = "Shift-",
	["Short Names"] = "Короткие имена",
	Show = "Показать",
	["%s%s%s|r to target"] = "%s%s%s|r на цель",
	["<template name>"] = "<название шаблона>",
	["<ZOMG> Missing %s: %s"] = "<ZOMG> Мимо %s: %s",
}

end)
