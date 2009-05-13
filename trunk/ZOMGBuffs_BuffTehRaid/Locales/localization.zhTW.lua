﻿local L = LibStub("AceLocale-2.2"):new("ZOMGBuffTehRaid")

L:RegisterTranslations("zhTW", function() return {
	["Group Buff Configuration"]					= "隊伍Buff配置",
	["Anchor"]										= "錨點",
	["Invert"]										= "反轉",
	["Invert the need/got alpha values"]			= "反轉“需要Buff/已經Buff”透明度值",
	["%s needs %s"]									= "%s需要%s",
	["Group %d needs %s"]							= "隊伍%d需要%s",
	["Templates"]									= "範本",
	["Template configuration"]						= "範本配置",
	["Group Spells"]								= "群體法術",
	["Group spell configuration"]					= "群體法術配置",
	["Single Spells"]								= "單體法術",
	["Single spell configuration"]					= "單體法術配置",
	["Groups"]										= "隊伍",
	["Select the groups to buff"]					= "選擇要Buff的隊伍",
	["Group %d"]									= "%d隊",
	["Enable buffing of this group"]				= "對該隊開啟Buff",
	["Group Template: "]							= "隊伍範本：",
	["(modified)"]									= "(已修改)",
	["none"]										= "無",
	["Enabled"]										= "啟用",
	["Disabled"]									= "禁用",
	["Behaviour"]									= "行為",
	["Group buffing behaviour"]						= "群體Buff行為",
	["Expiry Prelude"]								= "失效預知",
	["Default rebuff prelude for all group buffs"]	= "所有群體Buff重新Buff的默認提前時間",
	["Rebuff prelude for %s (0=Module default)"]	= "%s的提前重新Buff時間（0=模組默認）",
	["Mark"]										= "爪子",
	["Minimum Group"]								= "最小隊伍",
	["How many players of a group must need a buff before the group version is cast"] = "隊伍要有多少人需要Buff時才使用群體Buff",
	["%s on %s%s"]									= "%s -> %s%s",
	["%s on %s"]									= "%s -> %s",
	["Auto-Assign"]									= "自動分配",
	["Auto assign sensible group assignment based the order of your name alphabilically compared to others of your class. All going well, and all using ZOMGBuffs and everyone should end up with different assignments without need for discussion"] = "無需討論，依據你的職業所有玩家的名字的字母順序合理化自動分配，所有使用ZOMGBuffs插件的玩家最終將被分配指定Buff不同的隊伍。",
	["You are now responsible for Groups %s"]		= "你現在負責Buff %s隊",
	[" and "]										= "以及",
	["Warning: %s has auto-assigned themselves to buff groups %s, but you have the Auto Group Assignment option disabled"] = "警告：%s 已經自動分配他們自己Buff %s隊，而你沒有開啟自動隊伍分配選項",
	["Reset on Clear"]								= "清除時重置",
	["If noone is selected for this buff when you disable it, then the next time it is enabled, everyone will default to ON. If disabled, the last settings will be remembered"] = "當你禁用這個Buff的時候如果沒有指定給任何人，那麼下次再開啟的時候默認對所有人開啟。如果該選項關閉，那麼將記住上一次的設置。",
	["%d of %d stacks remain"]						= "剩餘%d/%d組",
	["Tracker"]										= "跟蹤",
	["Tracker Icon for single target exclusive buffs"] = "單體目標例外Buff跟蹤圖示",
	["Enable"]										= "啟用",
	["Create a tracking icon for certain exclusive spells (Earth Shield, Fear Ward). Note that the icon can always display the correct status of the spell, but if you change targets in combat then the click action will be to the player who it was last set to before entering combat"] = "為部分例外法術（大地之盾，防護恐懼結界）創建一個跟蹤圖示。這個圖示可以永遠顯示法術正確的狀態，但是如果你在戰鬥中更改了目標，那麼點擊圖示依然還在作用於進入戰鬥之前設置的目標。",
	["Scale"]										= "縮放",
	["Adjust the scale of the tracking icon"]		= "更改跟蹤圖示的縮放等級",
	["Reset"]										= "重置",
	["Reset the position of the tracker icon"]		= "重置跟蹤圖示的位置",
	["Spell Tracker"]								= "法術跟蹤",
	["MISSING!"]									= "缺失！",
	["%s has expired on %s"]						= "%s的%s失效了",
	["WARNING: The intended target for this icon has changed since you entered combat. (Was %s)"] = "警告：自從進入戰鬥以來，這個圖示預期的作用目標已經被更改（之前是 %s）",
	["Sound"]										= "聲音",
	["Select a soundfile to play when player's tracked buff expires"] = "選擇一個當玩家跟蹤的Buff失效後播放的聲音",
	["This button is not clickable because it was created after you entered combat"] = "這個按鈕無法點擊，因為它是在你進入戰鬥之後創建的",
	["Learnable"]									= "可學習",
	["Remember this spell when it's cast manually?"] = "當手動施放時是否自動啟用",
	["Key-Binding"]									= "按鍵綁定",
	["Define the key used for auto buffing from Spell Tracker (FIRST icon only)"] = "設置法術跟蹤自動Buff的按鍵（只能是第一個圖示）",

	["TICKCLICKHELP1"]								= "|cFFFFFFFF滑鼠左鍵|r切換玩家",
	["TICKCLICKHELP2"]								= "|cFFFFFFFF滑鼠右鍵|r切換所有人",
	["TICKCLICKHELP3"]								= "|cFFFFFFFFAlt點擊|r切換$class",
	["TICKCLICKHELP4"]								= "|cFFFFFFFFShift點擊|r切換$party",
} end)

