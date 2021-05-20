﻿local L = LibStub("AceLocale-2.2"):new("ZOMGBuffs")

L:RegisterTranslations("zhTW", function() return
--[===[@debug@
{
}
--@end-debug@]===]
{
	ABOUT = [=[全職業可用的一體化Buff外掛程式。依據團隊中聖騎士的能力以及團隊人員的次級職業（例如德魯伊坦克 vs 德魯伊治療）自動分配Buff任務。此外還有Raid中重要的Buff的總覽，以及右鍵可迅速的操控重新Buff
作者：{Author}
分類：{X-Category}
E-mail：{X-Email}
網站：{X-Website}
授權: {X-License}]=],
	Actions = "動作",
	["Adjust height of the bars"] = "調整狀態條的高度",
	["Adjust the size of the timer text"] = "調整計時器文字大小",
	["Adjust width of unit list"] = "調整單位列表的寬度",
	["Allow auto buffing when resting when your PvP is enabled"] = "當休息當你的PVP啟用時允許自動BUFF",
	Alphabetical = "字母順序",
	["Also buff current target (assuming they're not in your party or raid"] = "也Buff當前目標(假設他們沒有在你的隊伍或團隊裡",
	["Alt-"] = "Alt+",
	["Always Load Manager"] = "總是載入管理器",
	["Always Load Portalz"] = "總是載入 Portalz",
	["Always load the Blessings Manager, even when not eligable to modify blessings"] = "即便無法更改祝福也總是載入祝福管理器",
	["Always load the Portalz module, even when not a Mage"] = "即便不是法師也總是載入Portalz ",
	["Always show Stamina and Mark of the Wild Columns"] = "總是顯示耐力和野性印記列",
	Anchor = "錨點",
	Arena = "競技場",
	["Auto Buy Reagents"] = "自動購買材料",
	["Auto-casting is disabled"] = "自動施法已禁用",
	["Auto-casting %s"] = "自動施放 %s",
	["Automatically purchase required reagents from Reagents Vendor"] = "自動從商人那裏購入所需的施法材料",
	["Automatically switch to this template"] = "自動切換為這個範本",
	["Auto purchase level for %s (will not exceed this amount)"] = "自動購買%s的基準線（不會超過這個數量）",
	Autosave = "自動保存",
	["Auto Switch"] = "自動切換",
	["Bar Height"] = "計量條高度",
	["Bar Texture"] = "計時條貼圖",
	Battleground = "戰場",
	Behaviour = "行為",
	Blessings = "祝福",
	Border = "邊框",
	["Bought |cFF80FF80%d|cFFFFFF80 %s|r from vendor, you now have |cFF80FF80%d|r"] = "從商人那裏購買了|cFF80FF80%d|r個|cFFFFFF80%s|r，現在你擁有|cFF80FF80%d|r個。",
	["Buff Pets"] = "Buff寵物",
	["Buff Target"] = "Buff目標",
	["Buff Timer"] = "增益計時器",
	["Buff times over this number of minutes will not be shown"] = "增益時間多於這麼多分鐘的增益將不會顯示",
	["Button Five"] = "滑鼠鍵5",
	["Button Four"] = "滑鼠鍵4",
	["|cFF%02X%02X%02XGroup %d|r"] = "|cFF%02X%02X%02X隊伍%d|r",
	["|cFF808080%s|r [|Hplayer:%s|h%s|h's pet]"] = "|cFF808080%s|r[|Hplayer:%s|h%s|h的寵物]",
	["|cFF80FF80Enabled"] = "|cFF80FF80啟用",
	["|cFFFF8080Disabled"] = "|cFFFF8080禁用",
	["|cFFFF8080Waiting for these groups or classes to arrive:"] = "|cFFFF8080正在等待這些職業或者隊伍到達：",
	Channel = "頻道",
	CHANNELING = "你正在引導一個法術",
	CHATANSWER = "<ZOMG>",
	CHATMATCH1 = "!buff",
	CHATMATCH2 = "!zomg",
	CHATMATCH3 = "!buffs",
	["Choose the anchor to use for the player list"] = "為玩家列表指定錨點",
	["Choose the relative point for the anchor"] = "設定該錨點的相對錨點",
	Class = "職業",
	["Class Icon"] = "職業圖示",
	["Clear talent cache to force refresh"] = "清除天賦緩存以強迫刷新",
	["Click Config"] = "點擊選項",
	Columns = "列",
	["Columns to show in buff list"] = "增益列表裏面所顯示的列",
	COMBAT = "你處於戰鬥狀態中",
	["Configure popup raid list click behaviour"] = "設定點擊團佇列表時的行為",
	["Ctrl-"] = "Ctrl+",
	DEAD = "你已經死亡",
	Defaults = "默認",
	["Define the key used for auto buffing"] = "給自動增益設定一個按鍵",
	["Define the mouse click to use for |cFFFFFF80%s|r"] = "為|cFFFFFF80%s|r設定滑鼠點擊",
	Delete = "刪除",
	["Delete this template"] = "刪除這個範本",
	DISABLED = "ZOMGBuffs未啟用",
	Display = "顯示",
	["Display options"] = "顯示選項",
	["Display the mouseover icon used by the popup player buff list"] = "顯示玩家增益列表旁的滑鼠懸浮圖示",
	["Display the spell ready swirl when an autocast spell is loaded on the main icon"] = "當自動施法已載入時顯示法術已準備的漩渦",
	["Display the ZOMGBuffs logo on icon"] = "使用ZOMG增益圖示",
	["Don't auto buff when Mounted"] = "當騎在坐騎上時不自動Buff",
	["Don't auto buff when Resting"] = "當在旅館或者主城的時候不自動Buff",
	["Don't auto buff when Shapeshifted"] = "當處於變身狀態時不自動Buff",
	["Don't auto buff when Stealthed"] = "當處於潛行狀態時不自動Buff",
	["Don't auto buff when you have Spirit Tap, so you can maximise your regeneration"] = "當有“精神分流”Buff時不自動Buff，這樣你可以盡可能的恢復",
	["Don't directly buff PVP flagged players, unless you're already flagged for PVP"] = "不直接Buff開啟PvP的玩家，除非你也開啟了PvP",
	DRINKING = "你正在喝水",
	EATING = "你正在吃飯",
	Empty = "空",
	Enable = "啟用",
	["Enable border on the icon"] = "啟用圖示邊框",
	["Enable border on the list"] = "啟用列表邊框",
	ERRORICON = "錯誤：self.icon未找到",
	FIND_FLASK = "精煉藥劑$",
	FIND_POT = "藥劑$",
	Finish = "完成",
	Flask = "合劑",
	Font = "字體",
	["General buffing behaviour"] = "一般的Buff行為",
	["Give audible feedback when someone needs rebuffing"] = "當有人需要補Buff的時候以聲音通知",
	["Give feedback about events"] = "為事件提供回饋資訊",
	Group = "隊伍",
	["Group %d"] = "隊伍%d",
	["Group Number"] = "隊伍編號",
	HINT = "|cffeda55f滑鼠左鍵|r開關自動施法，|cffeda55f滑鼠右鍵|r開啟選項功能表，|cffeda55f點擊|r專案以修改，|cffeda55fShift點擊|r項目可以將其從自我Buff範本中刪除",
	HINTBM = "|cffeda55f滑鼠左鍵|r開關自動施法，|cffeda55fAlt點擊|r開關祝福管理器|cffeda55f滑鼠右鍵|r開啟選項功能表，|cffeda55f點擊|r 專案以修改，|cffeda55fShift點擊|r項目可以將其從自我Buff範本中刪除",
	["How much mana should you have before considering auto buffing"] = "只有法力大於這個值時才會自動Buff",
	Icon = "圖示",
	["Icon Size"] = "圖示大小",
	["If players are offline, AFK or in another instance, count them as being present and buff everyone else"] = "假如玩家斷線，暫離或者在另外一個副本，將他們算作存在並Buff其他的人",
	["Ignore Absent"] = "忽略缺席者",
	["In-Combat"] = "戰鬥中",
	Information = "信息",
	Intellect = "智力",
	Invert = "反轉",
	["Invert the need/got alpha values"] = "反轉“需要Buff/已經Buff”透明度值",
	INVIS = "你是看不見的",
	["Is player flasked or potted"] = "玩家是否吃了藥",
	["Key-Binding"] = "按鍵綁定",
	Kings = "王者",
	Last = "上一個",
	["Learn buff changes in combat"] = "在戰鬥中學習Buff的更改",
	["Learn buff changes out of combat"] = "在戰鬥外學習Buff的更改",
	Learning = "學習",
	["Left Button"] = "滑鼠左鍵",
	Light = "光明",
	List = "列表",
	Load = "載入",
	["Load Raid Module"] = "載入團隊模組",
	["Load the Raid Buff module. Usually for Mages, Druids & Priests, this module can also track single target spells such as Earth Shield & Blessing of Sacrifice, and allow raid buffing of Undending Breath and so on"] = "載入團隊模組。一般是為法師，德魯伊以及牧師準備的，該模組可以跟蹤單體法術例如大地之盾以及犧牲祝福，並且可以Buff團隊魔息術等等",
	["Load this template"] = "載入這個範本",
	Lock = "鎖定",
	["Lock floating icon position"] = "鎖定浮動圖示位置",
	MANA = "你目前的|cFFFFFF80法力值|r低於已設置的自動Buff最低法力限定值",
	Mark = "野性",
	["Middle Button"] = "滑鼠中鍵",
	Might = "力量",
	["Minimum Mana %"] = "最小法力百分比",
	["Miscelaneous actions"] = "其他動作",
	MOUNTED = "你正處於騎乘狀態並且啟用了|cFFFFFF80騎乘狀態不Buff|r選項",
	["Mousewheel Buff"] = "滾輪Buff",
	Name = "名稱",
	Never = "從不",
	["<new name>"] = "<新名稱>",
	NOCONTROL = "你目前不屬於正常行為",
	None = "無",
	Notice = "通報",
	["Notice Anchor"] = "通報錨點",
	["Not Refreshing because %s"] = "已暫停工作，因為%s",
	["Not When Mounted"] = "騎馬時不Buff",
	["Not When Resting"] = "休息狀態不Buff",
	["Not When Shapeshifted"] = "變身時不Buff",
	["Not When Stealthed"] = "潛行時不Buff",
	["Not with Spirit Tap"] = "精神分流狀態不Buff",
	["Only use single target buffs"] = "無論何時都只使用單體Buff",
	["Only use single target buffs in arenas"] = "在競技場中只使用單體Buff",
	["Only use single target buffs in battlegrounds"] = "在戰場中只使用單體Buff",
	[" on %s"] = "在 %s",
	["Options to help you notice when things need doing"] = "當有事情需要做時提醒你注意的選項",
	Outline = "細邊框",
	Outlining = "邊框",
	["Out of Combat"] = "戰鬥外",
	["Out-of-date spell (should be %s). Will be updated when combat ends"] = "過期法術（應該為 %s），在戰鬥結束後會更新",
	["Output channel selection"] = "選擇輸出頻道",
	Party = "隊伍",
	["Perform extra checks for pets in case any missed the group buffs when they were done"] = "當團隊Buff完成時額外再檢查一次寵物Buff，以確定它們沒有錯過",
	PERSONDIES = "^([^%s]+)死亡了。$",
	PORTALZ_HOTKEY = "ZOMGPortalz熱鍵",
	["Position the notification area"] = "設定通知區域的位置",
	["Purchase levels for reagents"] = "夠買施法材料的基準線",
	Raid = "團隊",
	["Reagents Levels"] = "材料基準",
	["Rebuff Sound"] = "補Buff聲音",
	["Relative Point"] = "相對錨點",
	Reminders = "提醒",
	REMOTECONTROL = "你感覺目前不像是你自己",
	Rename = "重命名",
	["Renamed template |cFFFFFF80%s|r to |cFFFFFF80%s|r"] = "已將範本|cFFFFFF80%s|r重命名為|cFFFFFF80%s|r",
	["Rename this template"] = "重命名這個範本",
	Report = "報告",
	["Report Missing"] = "缺失報告",
	["Report options"] = "報告選項",
	["Report raid buffs currently missing"] = "彙報當前缺少的團隊Buff",
	["Reset Icon Position"] = "重置圖示位置",
	["Reset the icon position to the centre of the screen"] = "將圖示位置重新放在螢幕中央",
	RESTING = "你正處於休息狀態並且啟用了|cFFFFFF80休息狀態不Buff|r選項",
	["Restore default keybindings"] = "恢復默認的按鍵綁定",
	["Revert to the previously unsaved template"] = "恢復為上一個沒保存的範本",
	["Right Button"] = "滑鼠右鍵",
	["Route notification messages through SinkLib"] = "通過SinkLib輸出通知資訊",
	["RuneScroll/Drums"] = "符文滾動/鼓",
	Salvation = "拯救",
	Sanctuary = "庇護",
	Save = "保存",
	["Save current setup as a new template"] = "將當前設置保存為一個新的範本",
	["Saved template %q"] = "範本 %q 已保存",
	["%s blacklisted for 10 seconds"] = "%s 暫時遮罩10秒鐘",
	["Select sorting order for buff overview (can't be changed during combat)"] = "顯示Buff總覽的排列順序（戰鬥中無法更改）",
	Selling = "賣出",
	["Set the texture for the buff timer bars"] = "設置計時條所用的材質貼圖",
	["Settings for the mouseover icon used by the popup player buff list"] = "玩家Buff列表所使用的滑鼠懸浮圖示的選項",
	["Settings for the popup buff list"] = "浮動Buff列表的選項",
	["Setup spell learning behaviour"] = "設定法術學習行為",
	["Shadow Protection"] = "暗影防護",
	SHAPESHIFTED = "你正處於變身狀態並且啟用了|cFFFFFF80變身狀態不Buff|r選項",
	["Shift-"] = "Shift+",
	["Short Names"] = "簡短名稱",
	Show = "顯示",
	["Show buff time remaining with bar"] = "在計量條上顯示Buff剩餘時間",
	["Show notice on screen for buff needs"] = "在螢幕上提醒要進行的Buff",
	["Show player role icons"] = "顯示玩家角色圖示",
	["Show Roles"] = "顯示角色",
	["Show spell icons with spell names in messages"] = "在資訊裏顯示帶著法術圖示的法術名稱",
	["Show the group number next to list"] = "在列表旁邊顯示隊伍編號",
	["Show the Notice area anchor"] = "顯示通報區域的錨點",
	["Show the popup raid list when you are in a party"] = "當你在隊伍中時顯示團隊佇列表",
	["Show the popup raid list when you are not in a raid or party"] = "當你不在團隊或隊伍中時顯示團隊佇列表",
	["Show the popup raid list when you in a raid"] = "當你處於團隊中時顯示團佇列表",
	["Singles Always"] = "永遠單體",
	["Singles in Arena"] = "競技場中單體",
	["Singles in BGs"] = "戰場中單體",
	["Sink Output"] = "Sink輸出",
	Size = "大小",
	["Size of main icon"] = "主圖示的大小",
	["Skip PVP Players"] = "忽略PvP玩家",
	Solo = "Solo",
	["Sort Order"] = "排列順序",
	["Spell Icons"] = "法術圖示",
	Spirit = "精神",
	SPIRITTAP = "你身上有精神分流Buff並且啟用了|cFFFFFF80精神分流狀態不Buff|r選項",
	["%s%s%s|r to cast %s%s|r%s"] = "%s%s%s|r施放%s%s|r%s",
	["%s%s%s|r to target"] = "%s%s%s|r選定目標",
	Stamina = "耐力",
	STEALTHED = "你正處於潛行狀態並且啟用了|cFFFFFF80潛行狀態不Buff|r選項",
	Suspended = "已暫停",
	Swirl = "漩渦",
	["Switched to template %q"] = "切換為 %q 範本",
	["Switched to template %q because %s"] = "切換為 %q 範本，因為：%s",
	Target = "目標",
	Targetting = "Targetting",
	TAXI = "你正在搭乘飛機",
	["<template name>"] = "<範本名稱>",
	["Thick Outline"] = "粗邊框",
	["Timer Size"] = "計時器大小",
	["Timer Threshold"] = "計時器臨界值",
	TITLE = "ZOMGBuffs",
	TITLECOLOUR = "|cFFFF8080Z|cFFFFFF80O|cFF80FF80M|cFF8080FFG|cFEFFFFFFBuffs|r",
	Training = "訓練",
	["...unless PvP"] = "...除非PvP",
	Unsorted = "不排序",
	["Use mousewheel to trigger auto buffing"] = "使用滑鼠滾輪觸發自動Buff",
	["Use short spell names where appropriate"] = "在合適的地方使用簡短的法術名稱",
	["Uses your main ZOMGBuffs spell for the floating icon, instead of the ZOMGBuffs default"] = "使用你的主ZOMGBuffs法術圖示代替ZOMGBuffs的默認圖示當作浮動圖示",
	VEHICLE = "載具",
	["Visiblity options"] = "可見性選項",
	["Wait for all of a class or group to arrive before buffing them"] = "等待某個職業或者隊伍到達才開始Buff",
	["Wait for certain amount of the raid to arrive before group and class buffing commences. Zero to always buff."] = "等到指定數量的團隊成員到達後才開始Buff。設置0則一直會Buff。",
	["Wait for Class/Group"] = "等待職業/隊伍",
	["Wait for Raid"] = "等待團隊",
	["Waiting for %d%% of raid to arrive before buffing commences (%d%% currently present)"] = "等到%d%%的團隊成員到達後才開始Buff（目前已到達%d%%）",
	["Waiting for these groups or classes to arrive: %s"] = "等待這些隊伍或者職業到達：%s",
	["Well Fed"] = "充分進食",
	Width = "寬度",
	["Wipe Talent Cache"] = "清空天賦緩存",
	Wisdom = "智慧",
	["You are now in a battleground"] = "你現在在一個戰場裏面",
	["You are now in an arena"] = "你現在在一個競技場裏面",
	["You are now in a party"] = "你現在在隊伍中",
	["You are now in a raid"] = "你現在在一個團隊裏面",
	["You are now solo"] = "你現在在Solo",
	["You can re-enable it by single clicking the ZOMGBuffs minimap/fubar icon"] = "你可以通過點擊FuBar或者小地圖圖示重新啟用",
	["You have run out of %q, now using single target buffs"] = "你的 %q 用完了，現在起改用單體目標Buff",
	["<ZOMG> Missing %s: %s"] = "<ZOMG> 缺少 %s：%s",
	ZONED = "你剛剛切換了區域，請稍等一會兒",
}

end)
