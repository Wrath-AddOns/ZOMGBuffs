-- Do not translate here!!
-- Please go to http://www.wowace.com/addons/zomgbuffs/localization/

do
local L = LibStub("AceLocale-3.0"):NewLocale("ZOMGSelfBuffs", "enUS", true)
if not L then return end
L["Self Buff Configuration"]								= true
L["Self"]													= true
L["Templates"]												= true
L["Template configuration"]									= true
L["Class Spells"]											= true
L["Class spell configuration"]								= true
L["Items"]													= true
L["Item configuration"]										= true
L["Main Hand"]												= true
L["Use this item or spell on the main hand weapon"]			= true
L["Off Hand"]												= true
L["Use this item or spell on the off hand weapon"]			= true
L["Ranged"]													= true
L["Use this item or spell on the ranged weapon"]			= true
L["You need |cFFFFFF80%s|r"]								= true
L["You need %s"]											= true
L["You need |c0080FF80%s|r on |c00FFFF80%s|r"]				= true
L["You need %s on |c00FFFF80%s|r"]							= true
L["You need %s on %s"]										= true
L["Tracking"]												= true
L["Tracking configuration"]									= true
L["Behaviour"]												= true
L["Self buffing behaviour"]									= true
L["Auto buffs"]												= true
L["Use auto-intelligent buffs such as Crusader Aura when mounted"] = true
L["Self Buffs Template: "]									= true
L["(modified)"]												= true
L["none"]													= true
L["Main Hand"]												= true
L["Off Hand"]												= true
L["Seals"]													= true				-- Generic Paladin 'Seal of ' description
L["Expiry Prelude"]											= true
L["Rebuff prelude for %s (0=Module default)"]				= true
L["Minimum Charges"]										= true
L["Rebuff if number of charges left is less than defined amount"] = true
L["Default"]												= true
L["Default rebuff prelude for all self buffs"]				= true
L["Warning: |cFF%s%s|r already applied by another %s"]		= true
L["Combat Warnings"]										= true
L["Warn about expiring buffs in combat. Note that auto buffing cannot be done in combat, this is simply a reminder"] = true
L["%s, %s%d|r %s remain"]									= true
L["Learnable"]												= true
L["Remember this spell when it's cast manually?"]			= true
L["Reagent Reminder"]										= true
L["Show message when spells requiring reagents are used"]	= true
L["Flask of the North"]										= true
L["Special handling for Flask of the North"]				= true
L["Expiry prelude for flasks"]								= true
L["Enabled"]												= true
L["Auto-cast Flask of the North"]							= true
end

if (GetLocale() == "deDE") then
	local L = LibStub("AceLocale-3.0"):NewLocale("ZOMGSelfBuffs", "deDE", true)
	if not L then return end
	--@localization(locale="deDE", format="lua_additive_table", namespace="ZOMGSelfBuffs", handle-unlocalized="ignore")@
end
if (GetLocale() == "esES") then
	local L = LibStub("AceLocale-3.0"):NewLocale("ZOMGSelfBuffs", "esES", true)
	if not L then return end
	--@localization(locale="esES", format="lua_additive_table", namespace="ZOMGSelfBuffs", handle-unlocalized="ignore")@
end
if (GetLocale() == "esMX") then
	local L = LibStub("AceLocale-3.0"):NewLocale("ZOMGSelfBuffs", "esMX", true)
	if not L then return end
	--@localization(locale="esMX", format="lua_additive_table", namespace="ZOMGSelfBuffs", handle-unlocalized="ignore")@
end
if (GetLocale() == "frFR") then
	local L = LibStub("AceLocale-3.0"):NewLocale("ZOMGSelfBuffs", "frFR", true)
	if not L then return end
	--@localization(locale="frFR", format="lua_additive_table", namespace="ZOMGSelfBuffs", handle-unlocalized="ignore")@
end
if (GetLocale() == "koKR") then
	local L = LibStub("AceLocale-3.0"):NewLocale("ZOMGSelfBuffs", "koKR", true)
	if not L then return end
	--@localization(locale="koKR", format="lua_additive_table", namespace="ZOMGSelfBuffs", handle-unlocalized="ignore")@
end
if (GetLocale() == "ruRU") then
	local L = LibStub("AceLocale-3.0"):NewLocale("ZOMGSelfBuffs", "ruRU", true)
	if not L then return end
	--@localization(locale="ruRU", format="lua_additive_table", namespace="ZOMGSelfBuffs", handle-unlocalized="ignore")@
end
if (GetLocale() == "zhCN") then
	local L = LibStub("AceLocale-3.0"):NewLocale("ZOMGSelfBuffs", "zhCN", true)
	if not L then return end
	--@localization(locale="zhCN", format="lua_additive_table", namespace="ZOMGSelfBuffs", handle-unlocalized="ignore")@
end
if (GetLocale() == "zhTW") then
	local L = LibStub("AceLocale-3.0"):NewLocale("ZOMGSelfBuffs", "zhTW", true)
	if not L then return end
	--@localization(locale="zhTW", format="lua_additive_table", namespace="ZOMGSelfBuffs", handle-unlocalized="ignore")@
end
