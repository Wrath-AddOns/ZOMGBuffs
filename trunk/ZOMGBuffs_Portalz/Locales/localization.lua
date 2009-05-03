local L = LibStub("AceLocale-2.2"):new("ZOMGPortalz")

L:RegisterTranslations("enUS", function() return
--@debug@
 -- lets try to nuke out the errors for svn WCs, at least when using the english locale
{
	["Adjust the scale of the portals"] = "Adjust the scale of the portals",
	Announce = "Announce",
	["Announce when you've created a portal to someplace more fun and sunny than this dark damp dungeon."] = "Announce when you've created a portal to someplace more fun and sunny than this dark damp dungeon.",
	Arc = "Arc",
	["Are you sure you're not leaving your friends behind?!"] = "Are you sure you're not leaving your friends behind?!",
	Circle = "Circle",
	["Click to equip. Click again when cooldown is up"] = "Click to equip. Click again when cooldown is up",
	[">>> Created a Portal to %s <<<"] = ">>> Created a Portal to %s <<<",
	["Define the key used for portal popup"] = "Define the key used for portal popup",
	Horizontal = "Horizontal",
	["Include appropriate items as castable portals (eg: %s or %s)"] = "Include appropriate items as castable portals (eg: %s or %s)",
	Items = "Items",
	["Key-Binding"] = "Key-Binding",
	Locked = "Locked",
	Pattern = "Pattern",
	["Portal Configuration"] = "Portal Configuration",
	["Portal Spell"] = "Portal Spell",
	["Reagent information"] = "Reagent information",
	Scale = "Scale",
	[">>> %s created <<<"] = ">>> %s created <<<",
	["Select the arrangement layout for the portals"] = "Select the arrangement layout for the portals",
	["Show All"] = "Show All",
	["Show all portal spells, even if you have not learnt them yet."] = "Show all portal spells, even if you have not learnt them yet.",
	Sticky = "Sticky",
	["Unlocked, the portals can be dragged using the |cFF00FF00Right Mouse Button|r"] = "Unlocked, the portals can be dragged using the |cFF00FF00Right Mouse Button|r",
	Vertical = "Vertical",
	["When sticky, the portals open on one keypress and close on another. When disabled, you are required to hold the key whilst making your selection."] = "When sticky, the portals open on one keypress and close on another. When disabled, you are required to hold the key whilst making your selection.",
	ZOMGBUFFS_PORTAL_KEY = "Portalz Hotkey",
	ZOMGBUFFS_PORTALZ = "ZOMGBuffs Portalz",
}
--@end-debug@
--@localization(locale="enUS", format="lua_table", namespace="ZOMGPortalz")@
end)
