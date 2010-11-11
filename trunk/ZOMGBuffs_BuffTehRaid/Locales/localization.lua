-- Do not translate here!!
-- Please go to http://www.wowace.com/addons/zomgbuffs/localization/

do
local L = LibStub("AceLocale-3.0"):NewLocale("ZOMGBuffTehRaid", "enUS", true)
if not L then return end

L["Group Buff Configuration"]						= true
L["Anchor"]											= true
L["Invert"]											= true
L["Invert the need/got alpha values"]				= true
L["%s needs %s"]									= true
L["Group %d needs %s"]								= true
L["Templates"]										= true
L["Template configuration"]							= true
L["Group Spells"]									= true
L["Group spell configuration"]						= true
L["Single Spells"]									= true
L["Single spell configuration"]						= true
L["Groups"]											= true
L["Select the groups to buff"]						= true
L["Group %d"]										= true
L["Enable buffing of this group"]					= true
L["Group Template: "]								= true
L["(modified)"]										= true
L["none"]											= true
L["Enabled"]										= true
L["Disabled"]										= true
L["Behaviour"]										= true
L["Group buffing behaviour"]						= true
L["Expiry Prelude"]									= true
L["Default rebuff prelude for all group buffs"]		= true
L["Rebuff prelude for %s (0=Module default)"]		= true
L["Mark"]											= true
L["Minimum Group"]									= true
L["How many players of a group must need a buff before the group version is cast"] = true
L["%s on %s%s"]										= true
L["%s on %s"]										= true
L["Auto-Assign"]									= true
L["Auto assign sensible group assignment based the order of your name alphabilically compared to others of your class. All going well, and all using ZOMGBuffs and everyone should end up with different assignments without need for discussion"] = true
L["You are now responsible for Groups %s"]			= true
L[" and "]											= true
L["Warning: %s has auto-assigned themselves to buff groups %s, but you have the Auto Group Assignment option disabled"] = true
L["Reset on Clear"]								= true
L["If noone is selected for this buff when you disable it, then the next time it is enabled, everyone will default to ON. If disabled, the last settings will be remembered"] = true
L["%d of %d stacks remain"]							= true
L["%s remains"]										= true
L["Tracker"]										= true
L["Tracker Icon for single target exclusive buffs"]	= true
L["Enable"]											= true
L["Create a tracking icon for certain exclusive spells (Earth Shield, Fear Ward). Note that the icon can always display the correct status of the spell, but if you change targets in combat then the click action will be to the player who it was last set to before entering combat"] = true
L["Scale"]											= true
L["Adjust the scale of the tracking icon"]			= true
L["Reset"]											= true
L["Reset the position of the tracker icon"]			= true
L["Spell Tracker"]									= true
L["MISSING!"]										= true
L["%s has expired on %s"]							= true
L["%s cooldown ready for %s"]						= true
L["WARNING: The intended target for this icon has changed since you entered combat. (Was %s)"] = true
L["Sound"]											= true
L["Select a soundfile to play when player's tracked buff expires"] = true
L["This button is not clickable because it was created after you entered combat"] = true
L["Learnable"]										= true
L["Remember this spell when it's cast manually?"]	= true
L["Key-Binding"]									= true
L["Define the key used for rebuffing %s from it's Spell Tracker icon"] = true
L["No Auto-cast"]									= true
L["Disables auto-casting for %s in favor of rebuffing via tracker icons or their hotkeys"] = true
L["Lock"]											= true
L["Lock all the Tracker icons to their current position"] = true

L["TICKCLICKHELP1"]								= "|cFFFFFFFFClick|r to toggle player"
L["TICKCLICKHELP2"]								= "|cFFFFFFFFRight-Click|r to toggle everyone"
L["TICKCLICKHELP3"]								= "|cFFFFFFFFAlt-Click|r to toggle $class"
L["TICKCLICKHELP4"]								= "|cFFFFFFFFShift-Click|r to toggle $party"
end


if (GetLocale() == "deDE") then
	local L = LibStub("AceLocale-3.0"):NewLocale("ZOMGBuffTehRaid", "deDE", true)
	if not L then return end
	--@localization(locale="deDE", format="lua_additive_table", namespace="ZOMGBuffTehRaid", handle-unlocalized="ignore")@
end
if (GetLocale() == "esES") then
	local L = LibStub("AceLocale-3.0"):NewLocale("ZOMGBuffTehRaid", "esES", true)
	if not L then return end
	--@localization(locale="esES", format="lua_additive_table", namespace="ZOMGBuffTehRaid", handle-unlocalized="ignore")@
end
if (GetLocale() == "esMX") then
	local L = LibStub("AceLocale-3.0"):NewLocale("ZOMGBuffTehRaid", "esMX", true)
	if not L then return end
	--@localization(locale="esMX", format="lua_additive_table", namespace="ZOMGBuffTehRaid", handle-unlocalized="ignore")@
end
if (GetLocale() == "frFR") then
	local L = LibStub("AceLocale-3.0"):NewLocale("ZOMGBuffTehRaid", "frFR", true)
	if not L then return end
	--@localization(locale="frFR", format="lua_additive_table", namespace="ZOMGBuffTehRaid", handle-unlocalized="ignore")@
end
if (GetLocale() == "koKR") then
	local L = LibStub("AceLocale-3.0"):NewLocale("ZOMGBuffTehRaid", "koKR", true)
	if not L then return end
	--@localization(locale="koKR", format="lua_additive_table", namespace="ZOMGBuffTehRaid", handle-unlocalized="ignore")@
end
if (GetLocale() == "ruRU") then
	local L = LibStub("AceLocale-3.0"):NewLocale("ZOMGBuffTehRaid", "ruRU", true)
	if not L then return end
	--@localization(locale="ruRU", format="lua_additive_table", namespace="ZOMGBuffTehRaid", handle-unlocalized="ignore")@
end
if (GetLocale() == "zhCN") then
	local L = LibStub("AceLocale-3.0"):NewLocale("ZOMGBuffTehRaid", "zhCN", true)
	if not L then return end
	--@localization(locale="zhCN", format="lua_additive_table", namespace="ZOMGBuffTehRaid", handle-unlocalized="ignore")@
end
if (GetLocale() == "zhTW") then
	local L = LibStub("AceLocale-3.0"):NewLocale("ZOMGBuffTehRaid", "zhTW", true)
	if not L then return end
	--@localization(locale="zhTW", format="lua_additive_table", namespace="ZOMGBuffTehRaid", handle-unlocalized="ignore")@
end
