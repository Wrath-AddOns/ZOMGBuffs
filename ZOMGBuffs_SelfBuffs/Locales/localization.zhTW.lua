﻿local L = LibStub("AceLocale-2.2"):new("ZOMGSelfBuffs")

L:RegisterTranslations("zhTW", function() return
--@debug@
{
	["Self Buff Configuration"]								= "自我Buff配置",
	["Self"]												= "自我",
	["Templates"]											= "範本",
	["Template configuration"]								= "範本配置",
	["Class Spells"]										= "職業法術",
	["Class spell configuration"]							= "職業法術配置",
	["Items"]												= "物品",
	["Item configuration"]									= "物品配置",
	["Main Hand"]											= "主手",
	["Use this item or spell on the main hand weapon"]		= "將這個物品或者法術使用在主手武器上",
	["Off Hand"]											= "副手",
	["Use this item or spell on the off hand weapon"]		= "將這個物品或者法術使用在副手武器上",
	["You need |cFFFFFF80%s|r"]								= "你需要|cFFFFFF80%s|r",
	["You need %s"]											= "你需要%s",
	["You need |c0080FF80%s|r on |c00FFFF80%s|r"]			= "你需要|c0080FF80%s|r給|c00FFFF80%s|r",
	["You need %s on |c00FFFF80%s|r"]						= "你需要%s給|c00FFFF80%s|r",
	["You need %s on %s"]									= "你需要%s給%s",
	["Tracking"]											= "跟蹤",
	["Tracking configuration"]								= "配置跟蹤",
	["Behaviour"]											= "行為",
	["Self buffing behaviour"]								= "自我Buff行為",
	["Auto buffs"]											= "自動Buff",
	["Use auto-intelligent buffs such as Crusader Aura when mounted"] = "使用智慧的自動Buff，例如上馬時使用十字軍光環",
	["Self Buffs Template: "]								= "自我Buff範本：",
	["(modified)"]											= "(已修改)",
	["none"]												= "無",
	["Main Hand"]											= "主手",
	["Off Hand"]											= "副手",
	["Seals"]												= "聖印",				-- Generic Paladin 'Seal of ' description
	["Expiry Prelude"]										= "失效預知",
	["Rebuff prelude for %s (0=Module default)"]			= "%s的提前重新Buff時間（0=模組默認）",
	["Default"]												= "默認",
	["Default rebuff prelude for all self buffs"]			= "所有自我Buff重新Buff的默認提前時間",
	["Warning: |cFF%s%s|r already applied by another %s"]	= "警告：|cFF%s%s|r已經有一個其他的 %s 在作用了",
	["Combat Warnings"]										= "戰鬥警告",
	["Warn about expiring buffs in combat. Note that auto buffing cannot be done in combat, this is simply a reminder"] = "在戰鬥中警告要消失的Buff。注意自動補Buff不能在戰鬥中使用，這只是簡單的提醒",
	["%s, %s%d|r %s remain"]								= "%s, %s%d|r %s 剩餘",
	["Learnable"]											= "可學習",
	["Remember this spell when it's cast manually?"]		= "當手動施放時是否自動啟用",
	["Reagent Reminder"]									= "材料提醒",
	["Show message when spells requiring reagents are used"] = "當法術所需材料消耗時顯示資訊",
}
--@end-debug@
--@localization(locale="zhTW", format="lua_table", namespace="ZOMGSelfBuffs", handle-unlocalized="ignore")@
end)
