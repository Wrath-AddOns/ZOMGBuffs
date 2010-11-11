-- Do not translate here!!
-- Please go to http://www.wowace.com/addons/zomgbuffs/localization/

do
local L = LibStub("AceLocale-3.0"):NewLocale("ZOMGBuffs", "enUS", true)
if not L then return end

L["TITLE"]							= "ZOMGBuffs"
L["TITLECOLOUR"]					= "|cFFFF8080Z|cFFFFFF80O|cFF80FF80M|cFF8080FFG|cFEFFFFFFBuffs|r"
L["HINT"]							= "|cffeda55fClick|cff10ff10 to toggle auto-casting, |cffeda55fRight-Click|cff10ff10 for options, |cffeda55fClick|cff10ff10 item to change, |cffeda55fShift-Click|cff10ff10 item to remove from self buffs template"
L["PORTALZ_HOTKEY"]					= "ZOMGPortalz Hotkey"
L["Auto-casting %s"]				= true
L["|cFF80FF80Enabled"]				= true
L["|cFFFF8080Disabled"]				= true
L["%s blacklisted for 10 seconds"]	= true
L["FIND_FLASK"]						= "^Flask of "
L["FIND_POT"]						= "^Elixir of "
L["Well Fed"]						= true
L["Flask"]							= true
L["Is player flasked or potted"]	= true
L["Light"]							= true
L["Salvation"]						= true
L["Wisdom"]							= true
L["Might"]							= true
L["Kings"]							= true
L["Sanctuary"]						= true
L["Anchor"]							= true
L["Shadow Protection"]				= true
L["Choose the anchor to use for the player list"] = true
L["Relative Point"]					= true
L["Choose the relative point for the anchor"] = true
L["Invert"]							= true
L["Invert the need/got alpha values"] = true
L["Mousewheel Buff"]				= true
L["Use mousewheel to trigger auto buffing"] = true
L["Key-Binding"]					= true
L["Define the key used for auto buffing"] = true
L["%s%s%s|r to cast %s%s|r%s"]		= true
L["%s%s%s|r to target"]				= true
L[" on %s"]							= true							-- Raid popup tooltip: "Aura Name on PlayerName"
L["|cFF808080%s|r [|Hplayer:%s|h%s|h's pet]"] = true
L["Reminders"]						= true
L["Options to help you notice when things need doing"] = true
L["Notice"]							= true
L["Show notice on screen for buff needs"] = true
L["Notice Anchor"]					= true
L["Show the Notice area anchor"]	= true
L["Rebuff Sound"]					= true
L["Give audible feedback when someone needs rebuffing"] = true
L["Finish"]							= true
L["Information"]					= true
L["Give feedback about events"]		= true
L["Display"]						= true
L["Display options"]				= true
L["Always Load Portalz"]			= true
L["Always load the Portalz module, even when not a Mage"] = true
L["Shift-"]							= true
L["Ctrl-"]							= true
L["Alt-"]							= true
L["Left Button"]					= true
L["Right Button"]					= true
L["Middle Button"]					= true
L["Button Four"]					= true
L["Button Five"]					= true
L["Behaviour"]						= true
L["General buffing behaviour"]		= true
L["Not When Resting"]				= true
L["Don't auto buff when Resting"]	= true
L["...unless PvP"]					= true
L["Allow auto buffing when resting when your PvP is enabled"] = true
L["Not When Mounted"]				= true
L["Don't auto buff when Mounted"]	= true
L["Not When Stealthed"]				= true
L["Don't auto buff when Stealthed"]	= true
L["Not When Shapeshifted"]			= true
L["Don't auto buff when Shapeshifted"] = true
L["Sort Order"]						= true
L["Select sorting order for buff overview (can't be changed during combat)"] = true
L["Bar Texture"]					= true
L["Set the texture for the buff timer bars"] = true
L["Auto Buy Reagents"]				= true
L["Automatically purchase required reagents from Reagents Vendor"] = true
L["Reagents Levels"]				= true
L["Purchase levels for reagents"]	= true
L["Bought |cFF80FF80%d|cFFFFFF80 %s|r from vendor, you now have |cFF80FF80%d|r"] = true
L["Minimum Mana %"]					= true
L["How much mana should you have before considering auto buffing"] = true
L["Waiting for %d%% of raid to arrive before buffing commences (%d%% currently present)"] = true
L["Wait for Raid"]					= true
L["Wait for certain amount of the raid to arrive before group and class buffing commences. Zero to always buff."] = true
L["Report Missing"]					= true
L["Report raid buffs currently missing"] = true
L["Report"]							= true
L["Report options"]					= true
L["<ZOMG> Missing %s: %s"]			= true
L["Mark/Kings"]						= true
L["Stamina"]						= true
L["Intellect"]						= true
L["Spirit"]							= true
L["Blessings"]						= true
L["Channel"]						= true
L["Output channel selection"]		= true
L["Group %d"]						= true
L["|cFF%02X%02X%02XGroup %d|r"]		= true
L["Alphabetical"]					= true
L["Class"]							= true
L["Group"]							= true
L["Unsorted"]						= true
L["Skip PVP Players"]				= true
L["Don't directly buff PVP flagged players, unless you're already flagged for PVP"] = true
L["You have run out of %q, now using single target buffs"] = true
L["Lock"]							= true
L["Lock floating icon position"]	= true

-- Suspsended reasons for floating icon
L["Suspended"]						= true
L["Not Refreshing because %s"]		= true
L["Selling"]						= true
L["Training"]						= true
L["ZONED"]							= "you have recently zoned, please wait a few seconds"
L["DEAD"]							= "you are dead"
L["ERRORICON"]						= "ERROR: Missing self.icon"
L["DISABLED"]						= "ZOMGBuffs is disabled"
L["TAXI"]							= "you are on a taxi"
L["VEHICLE"]						= "you are in a vehicle"
L["COMBAT"]							= "you are in combat"
L["MOUNTED"]						= "you are mounted and the |cFFFFFF80Not When Mounted|r option is enabled"
L["RESTING"]						= "you are resting and the |cFFFFFF80Not When Resting|r option is enabled"
L["MANA"]							= "your |cFFFFFF80mana|r is below the minimum configured threshold for auto buffing"
L["EATING"]							= "you are eating"
L["DRINKING"]						= "you are drinking"
L["CHANNELING"]						= "you are channeling a spell"
L["SPIRITTAP"]						= "You have Spirit Tap and the |cFFFFFF80Not with Spirit Tap|r option is enabled"
L["REMOTECONTROL"]					= "You don't feel like yourself"
L["NOCONTROL"]						= "You are not in your right mind"
L["STEALTHED"]						= "You are stealthed and the |cFFFFFF80Not When Stealthed|r option is enabled"
L["SHADOWMELD"]						= "you are shadowmelded"
L["SHAPESHIFTED"]					= "You are shapeshifted and the |cFFFFFF80Not When Shapeshifted|r option is enabled"
L["INVIS"]							= "You are invisible"

L["Last"]							= true
L["Revert to the previously unsaved template"] = true
L["Save"]							= true
L["Save current setup as a new template"] = true
L["<template name>"]				= true
L["Rename"]							= true
L["Rename this template"]			= true
L["<new name>"]						= true
L["Renamed template |cFFFFFF80%s|r to |cFFFFFF80%s|r"] = true
L["Delete"]							= true
L["Delete this template"]			= true
L["Saved template %q"]				= true
L["Switched to template %q"]		= true
L["Switched to template %q because %s"] = true
L["Auto purchase level for %s (will not exceed this amount)"] = true
L["Load"]							= true
L["Load this template"]				= true
L["Group Number"]					= true
L["Show the group number next to list"] = true
L["Out-of-date spell (should be %s). Will be updated when combat ends"] = true
L["Empty"]							= true
L["Buff Target"]					= true
L["Also buff current target (assuming they're not in your party or raid"] = true
L["Autosave"]						= true
L["You are now in a battleground"]	= true
L["You are now in an arena"]		= true
L["You are now in a raid"]			= true
L["You are now in a party"]			= true
L["You are now solo"]				= true
L["Auto Switch"]					= true
L["Automatically switch to this template"] = true
L["Never"]							= true
L["Solo"]							= true
L["Party"]							= true
L["Raid"]							= true
L["Arena"]							= true
L["Battleground"]					= true
L["Show"]							= true
L["Visiblity options"]				= true
L["Show the popup raid list when you are not in a raid or party"] = true
L["Show the popup raid list when you are in a party"] = true
L["Show the popup raid list when you in a raid"] = true
L["Width"]							= true
L["Adjust width of unit list"]		= true
L["Bar Height"]						= true
L["Adjust height of the bars"]		= true
L["Font"]							= true
L["Size"]							= true
L["Outlining"]						= true
L["None"]							= true
L["Outline"]						= true
L["Thick Outline"]					= true
L["Reset Icon Position"]			= true
L["Reset the icon position to the centre of the screen"] = true
L["Icon Size"			]			= true
L["Size of main icon"]				= true
L["Border"]							= true
L["Enable border on the icon"]		= true
L["Name"]							= true
L["Display the ZOMGBuffs logo on icon"] = true
L["Swirl"]							= true
L["Display the spell ready swirl when an autocast spell is loaded on the main icon"] = true
L["Enable border on the list"]		= true
L["Icon"]							= true
L["Settings for the mouseover icon used by the popup player buff list"] = true
L["Enable"]							= true
L["Display the mouseover icon used by the popup player buff list"] = true
L["List"]							= true
L["Settings for the popup buff list"] = true
L["Columns"]						= true
L["Columns to show in buff list"]	= true
L["Not with Spirit Tap"]			= true
L["Don't auto buff when you have Spirit Tap, so you can maximise your regeneration"] = true
L["Buff Pets"]						= true
L["Perform extra checks for pets in case any missed the group buffs when they were done"] = true
L["Position the notification area"] = true
L["Learning"]						= true
L["Setup spell learning behaviour"] = true
L["Out of Combat"]					= true
L["Learn buff changes out of combat"] = true
L["In-Combat"]						= true
L["Learn buff changes in combat"]	= true
L["Actions"]						= true
L["Miscelaneous actions"]			= true
L["Wipe Talent Cache"]				= true
L["Clear talent cache to force refresh"] = true
L["Ignore Absent"]					= true
L["If players are offline, AFK or in another instance, count them as being present and buff everyone else"] = true
L["Singles Always"]					= true
L["Only use single target buffs"]	= true
L["Singles in BGs"]					= true
L["Only use single target buffs in battlegrounds"] = true
L["Singles in Arena"]				= true
L["Only use single target buffs in arenas"] = true
L["Click Config"			]		= true
L["Configure popup raid list click behaviour"] = true
L["Define the mouse click to use for |cFFFFFF80%s|r"] = true
L["Target"]							= true
L["Targetting"]						= true
L["Defaults"]						= true
L["Restore default keybindings"]	= true
L["Class Icon"]						= true
L["Uses your main ZOMGBuffs spell for the floating icon, instead of the ZOMGBuffs default"] = true
L["Sink Output"]					= true
L["Route notification messages through SinkLib"] = true
L["Load Raid Module"]				= true
L["Load the Raid Buff module. Usually for Mages, Druids & Priests, this module can also track single target spells such as Earth Shield & Blessing of Sacrifice, and allow raid buffing of Undending Breath and so on"] = true
L["Buff Timer"]						= true
L["Show buff time remaining with bar"] = true
L["Timer Size"]						= true
L["Adjust the size of the timer text"] = true
L["Timer Threshold"]				= true
L["Buff times over this number of minutes will not be shown"] = true
L["Spell Icons"]					= true
L["Show spell icons with spell names in messages"] = true
L["Short Names"]					= true
L["Use short spell names where appropriate"] = true
L["Show Roles"]						= true
L["Show player role icons"]			= true
L["Auto-casting is disabled"]		= true
L["You can re-enable it by single clicking the ZOMGBuffs minimap/fubar icon"] = true
L["RuneScroll/Drums"]				= true
L["Always show Stamina and Mark of the Wild Columns"] = true
L["ZOMGPortalz"]					= "Portalz"
L["ZOMGSelfBuffs"]					= "Self Buffs"
L["ZOMGBuffTehRaid"]				= "Raid Buffs"
L["Top Left"]						= true
L["Top Right"]						= true
L["Top"]							= true
L["Left"]							= true
L["Right"]							= true
L["Bottom Left"]					= true
L["Bottom"]							= true
L["Bottom Right"]					= true
L["Reagents"]						= true
L["Reagent buying options"]			= true
L["Profiles"]						= true
L["Hot-Key Setup"]					= true
L["Configuration"]					= true
L["Minimap"]						= true
L["Show minimap icon"]				= true

L["ABOUT"] =	"All in one buffing mod for all classes. Paladin buff generated assignments based on Paladin capabilities and raid member sub-classes (druid tank vs. druid healer etc.). Plus overview of important raid buffs, and instant access rebuff on right click.\r\r"..
				"Author: {Author}\r"..
				"Category: {X-Category}\r"..
				"E-mail: {X-Email}\r"..
				"Website: {X-Website}\r"..
				"License: {X-License}\r"
end

if (GetLocale() == "deDE") then
	local L = LibStub("AceLocale-3.0"):NewLocale("ZOMGBuffs", "deDE", true)
	if not L then return end
	--@localization(locale="deDE", format="lua_additive_table", namespace="", handle-unlocalized="ignore")@
end
if (GetLocale() == "esES") then
	local L = LibStub("AceLocale-3.0"):NewLocale("ZOMGBuffs", "esES", true)
	if not L then return end
	--@localization(locale="esES", format="lua_additive_table", namespace="", handle-unlocalized="ignore")@
end
if (GetLocale() == "esMX") then
	local L = LibStub("AceLocale-3.0"):NewLocale("ZOMGBuffs", "esMX", true)
	if not L then return end
	--@localization(locale="esMX", format="lua_additive_table", namespace="", handle-unlocalized="ignore")@
end
if (GetLocale() == "frFR") then
	local L = LibStub("AceLocale-3.0"):NewLocale("ZOMGBuffs", "frFR", true)
	if not L then return end
	--@localization(locale="frFR", format="lua_additive_table", namespace="", handle-unlocalized="ignore")@
end
if (GetLocale() == "koKR") then
	local L = LibStub("AceLocale-3.0"):NewLocale("ZOMGBuffs", "koKR", true)
	if not L then return end
	--@localization(locale="koKR", format="lua_additive_table", namespace="", handle-unlocalized="ignore")@
end
if (GetLocale() == "ruRU") then
	local L = LibStub("AceLocale-3.0"):NewLocale("ZOMGBuffs", "ruRU", true)
	if not L then return end
	--@localization(locale="ruRU", format="lua_additive_table", namespace="", handle-unlocalized="ignore")@
end
if (GetLocale() == "zhCN") then
	local L = LibStub("AceLocale-3.0"):NewLocale("ZOMGBuffs", "zhCN", true)
	if not L then return end
	--@localization(locale="zhCN", format="lua_additive_table", namespace="", handle-unlocalized="ignore")@
end
if (GetLocale() == "zhTW") then
	local L = LibStub("AceLocale-3.0"):NewLocale("ZOMGBuffs", "zhTW", true)
	if not L then return end
	--@localization(locale="zhTW", format="lua_additive_table", namespace="", handle-unlocalized="ignore")@
end
