﻿local L = LibStub("AceLocale-2.2"):new("ZOMGBuffs")

L:RegisterTranslations("zhCN", function() return
--@debug@
{
	["TITLE"]				= "ZOMGBuffs",
	["TITLECOLOUR"]			= "|cFFFF8080Z|cFFFFFF80O|cFF80FF80M|cFF8080FFG|cFEFFFFFFBuffs|r",
	["HINT"]				= "|cffeda55f鼠标左键|r开关自动施法，|cffeda55f鼠标右键|r开启选项菜单，|cffeda55f点击|r项目以修改，|cffeda55fShift点击|r项目可以将其从自我Buff模板中删除",
	["HINTBM"]				= "|cffeda55f鼠标左键|r开关自动施法，|cffeda55fAlt点击|r开关祝福管理器|cffeda55f鼠标右键|r开启选项菜单，|cffeda55f点击|r 项目以修改，|cffeda55fShift点击|r项目可以将其从自我Buff模板中删除",
	["Auto-casting %s"]		= "自动施放 %s",
	["|cFF80FF80Enabled"]	= "|cFF80FF80启用",
	["|cFFFF8080Disabled"]	= "|cFFFF8080禁用",
	["%s blacklisted for 10 seconds"] = "%s 暂时屏蔽10秒钟",
	["FIND_FLASK"]			= "合剂$",
	["FIND_POT"]			= "药剂$",
	["Well Fed"]			= "进食充分",
	["Flask"]				= "合剂",
	["Is player flasked or potted"] = "玩家是否吃了药",
	["Light"]				= "光明",
	["Salvation"]			= "拯救",
	["Wisdom"]				= "智慧",
	["Might"]				= "力量",
	["Kings"]				= "王者",
	["Sanctuary"]			= "庇护",
	["Anchor"]				= "锚点",
	["Choose the anchor to use for the player list"] = "为玩家列表指定锚点",
	["Relative Point"]		= "相对锚点",
	["Choose the relative point for the anchor"] = "设定该锚点的相对锚点",
	["Invert"]				= "反转",
	["Invert the need/got alpha values"] = "反转“需要Buff/已经Buff”透明度值",
	["Mousewheel Buff"]		= "滚轮Buff",
	["Use mousewheel to trigger auto buffing"] = "使用鼠标滚轮触发自动Buff",
	["Key-Binding"]			= "按键绑定",
	["Define the key used for auto buffing"] = "给自动Buff设定一个按键",
	["%s%s%s|r to cast %s%s|r%s"] = "%s%s%s|r施放%s%s|r%s",
	["%s%s%s|r to target"]	= "%s%s%s|r选定目标",
	[" on %s"]				= "于 %s",
	["|cFF808080%s|r [|Hplayer:%s|h%s|h's pet]"] = "|cFF808080%s|r[|Hplayer:%s|h%s|h的宠物]",
	["Reminders"]			= "提醒",
	["Options to help you notice when things need doing"] = "当有事情需要做时提醒你注意的选项",
	["Notice"]				= "通报",
	["Show notice on screen for buff needs"] = "在屏幕上提醒要进行的Buff",
	["Notice Anchor"]		= "通报锚点",
	["Show the Notice area anchor"] = "显示通报区域的锚点",
	["Rebuff Sound"]		= "补Buff声音",
	["Give audible feedback when someone needs rebuffing"] = "当有人需要补Buff的时候以声音通知",
	["Finish"]				= "完成",
	["Information"]			= "信息",
	["Give feedback about events"] = "为事件提供反馈信息",
	["Display"]				= "显示",
	["Display options"]		= "显示选项",
	["Always Load Manager"]	= "总是载入管理器",
	["Always load the Blessings Manager, even when not eligable to modify blessings"] = "即便无法更改祝福也总是载入祝福管理器",
	["Shift-"]				= "Shift+",
	["Ctrl-"]				= "Ctrl+",
	["Alt-"]				= "Alt+",
	["Left Button"]			= "鼠标左键",
	["Right Button"]		= "鼠标右键",
	["Middle Button"]		= "鼠标中键",
	["Button Four"]			= "鼠标键4",
	["Button Five"]			= "鼠标键5",
	["Behaviour"]			= "行为",
	["General buffing behaviour"] = "一般的Buff行为",
	["Not When Resting"]	= "休息状态不Buff",
	["Don't auto buff when Resting"] = "当在旅馆或者主城的时候不自动Buff",
	["Not When Mounted"]	= "骑马时不Buff",
	["Don't auto buff when Mounted"] = "当骑在坐骑上时不自动Buff",
	["Not When Stealthed"]	= "潜行时不Buff",
	["Don't auto buff when Stealthed"] = "当处于潜行状态时不自动Buff",
	["Not When Shapeshifted"] = "变身时不Buff",
	["Don't auto buff when Shapeshifted"] = "当处于变身状态时不自动Buff",
	["Sort Order"]			= "排列顺序",
	["Select sorting order for buff overview (can't be changed during combat)"] = "显示Buff总览的排列顺序（战斗中无法更改）",
	["Bar Texture"]			= "计时条贴图",
	["Set the texture for the buff timer bars"] = "设置计时条所用的材质贴图",
	["Auto Buy Reagents"]	= "自动购买材料",
	["Automatically purchase required reagents from Reagents Vendor"] = "自动从商人那里购入所需的施法材料",
	["Reagents Levels"]		= "材料基准",
	["Purchase levels for reagents"] = "够买施法材料的基准线",
	["Bought |cFF80FF80%d|cFFFFFF80 %s|r from vendor, you now have |cFF80FF80%d|r"] = "从商人那里购买了|cFF80FF80%d|r个|cFFFFFF80%s|r，现在你拥有|cFF80FF80%d|r个。",
	["Minimum Mana %"]		= "最小法力百分比",
	["How much mana should you have before considering auto buffing"] = "只有法力大于这个值时才会自动Buff",
	["Waiting for %d%% of raid to arrive before buffing commences (%d%% currently present)"] = "等到%d%%的团队成员到达后才开始Buff（目前已到达%d%%）",
	["Waiting for these groups or classes to arrive: %s"] = "等待这些队伍或者职业到达：%s",
	["Wait for Raid"]		= "等待团队",
	["Wait for certain amount of the raid to arrive before group and class buffing commences. Zero to always buff."] = "等到指定数量的团队成员到达后才开始Buff。设置0则一直会Buff。",
	["Wait for Class/Group"] = "等待职业/队伍",
	["Wait for all of a class or group to arrive before buffing them"] = "等待某个职业或者队伍到达才开始Buff",
	["|cFFFF8080Waiting for these groups or classes to arrive:"] = "|cFFFF8080正在等待这些职业或者队伍到达：",
	["Report Missing"]		= "缺失报告",
	["Report raid buffs currently missing"] = "汇报当前缺少的团队Buff",
	["Report"]				= "报告",
	["Report options"]		= "报告选项",
	["<ZOMG> Missing %s: %s"] = "<ZOMG> 缺少 %s：%s",
	["Mark"]				= "爪子",
	["Stamina"]				= "耐力",
	["Intellect"]			= "智力",
	["Spirit"]				= "精神",
	["Blessings"]			= "祝福",
	["Channel"]				= "频道",
	["Output channel selection"] = "选择输出频道",
	["Group %d"]			= "队伍%d",
	["|cFF%02X%02X%02XGroup %d|r"] = "|cFF%02X%02X%02X队伍%d|r",
	["Alphabetical"]		= "字母顺序",
	["Class"]				= "职业",
	["Group"]				= "队伍",
	["Unsorted"]			= "不排序",
	["Skip PVP Players"]	= "忽略PvP玩家",
	["Don't directly buff PVP flagged players, unless you're already flagged for PVP"] = "不直接Buff开启PvP的玩家，除非你也开启了PvP",
	["You have run out of %q, now using single target buffs"] = "你的 %q 用完了，现在起改用单体目标Buff",
	["Lock"]				= "锁定",
	["Lock floating icon position"] = "锁定浮动图标位置",

	-- Suspsended reasons for floating icon
	["Suspended"]			= "已暂停",
	["Not Refreshing because %s"] = "已暂停工作，因为%s",
	["ZONED"]				= "你刚刚切换了区域，请稍等一会儿",
	["DEAD"]				= "你已经死亡",
	["ERRORICON"]			= "错误：self.icon未找到",
	["DISABLED"]			= "ZOMGBuffs未启用",
	["TAXI"]				= "你正在搭乘飞机",
	["COMBAT"]				= "你处于战斗状态中",
	["MOUNTED"]				= "你正处于骑乘状态并且启用了|cFFFFFF80骑乘状态不Buff|r选项",
	["RESTING"]				= "你正处于休息状态并且启用了|cFFFFFF80休息状态不Buff|r选项",
	["MANA"]				= "你目前的|cFFFFFF80法力值|r低于已设置的自动Buff最低法力限定值",
	["EATING"]				= "你正在吃饭",
	["DRINKING"]			= "你正在喝水",
	["CHANNELING"]			= "你正在引导一个法术",
	["SPIRITTAP"]			= "你身上有精神分流Buff并且启用了|cFFFFFF80精神分流状态不Buff|r选项",
	["REMOTECONTROL"]		= "你感觉目前不像是你自己",
	["NOCONTROL"]			= "你目前不属于正常行为",
	["STEALTHED"]			= "你正处于潜行状态并且启用了|cFFFFFF80潜行状态不Buff|r选项",
	["SHAPESHIFTED"]		= "你正处于变身状态并且启用了|cFFFFFF80变身状态不Buff|r选项",

	["Last"]				= "上一个",
	["Revert to the previously unsaved template"] = "恢复为上一个没保存的模板",
	["Save"]				= "保存",
	["Save current setup as a new template"] = "将当前设置保存为一个新的模板",
	["<template name>"]		= "<模板名称>",
	["Rename"]				= "重命名",
	["Rename this template"] = "重命名这个模板",
	["<new name>"]			= "<新名称>",
	["Renamed template |cFFFFFF80%s|r to |cFFFFFF80%s|r"] = "已将模板|cFFFFFF80%s|r重命名为|cFFFFFF80%s|r",
	["Delete"]				= "删除",
	["Delete this template"] = "删除这个模板",
	["Saved template %q"]	= "模板 %q 已保存",
	["Switched to template %q"] = "切换为 %q 模板",
	["Switched to template %q because %s"] = "切换为 %q 模板，因为：%s",
	["Auto purchase level for %s (will not exceed this amount)"] = "自动购买%s的基准线（不会超过这个数量）",
	["Load"]				= "载入",
	["Load this template"]	= "载入这个模板",
	["Group Number"]		= "队伍编号",
	["Show the group number next to list"] = "在列表旁边显示队伍编号",
	["Out-of-date spell (should be %s). Will be updated when combat ends"] = "过期法术（应该为 %s），在战斗结束后会更新",
	["Empty"]				= "空",
	["Buff Target"]			= "Buff目标",
	["Also buff current target (assuming they're not in your party or raid"] = "同样Buff当前的目标（假定他们没有在你的队伍或者团队里面）",
	["Autosave"]			= "自动保存",
	["You are now in a battleground"] = "你现在在一个战场里面",
	["You are now in an arena"] = "你现在在一个竞技场里面",
	["You are now in a raid"] = "你现在在一个团队里面",
	["You are now in a party"] = "你现在在一个队伍里面",
	["You are now solo"]	= "你现在在Solo",
	["Auto Switch"]			= "自动切换",
	["Automatically switch to this template"] = "自动切换为这个模板",
	["Never"]				= "从不",
	["Solo"]				= "Solo",
	["Party"]				= "组队",
	["Raid"]				= "团队",
	["Arena"]				= "竞技场",
	["Battleground"]		= "战场",
	["Show"]				= "显示",
	["Visiblity options"]	= "可见性选项",
	["Show the popup raid list when you are not in a raid or party"] = "当你不在团队或者队伍中时显示团队列表",
	["Show the popup raid list when you are in a party"] = "当你处于队伍中时显示团队列表",
	["Show the popup raid list when you in a raid"] = "当你处于团队中时显示团队列表",
	["Width"]				= "宽度",
	["Adjust width of unit list"] = "调整单位列表的宽度",
	["Bar Height"]			= "计量条高度",
	["Adjust height of the bars"] = "调整计量条的高度",
	["Font"]				= "字体",
	["Size"]				= "大小",
	["Outlining"]			= "边框",
	["None"]				= "无",
	["Outline"]				= "细边框",
	["Thick Outline"]		= "粗边框",
	["Reset Icon Position"]	= "重置图标位置",
	["Reset the icon position to the centre of the screen"] = "将图标位置重新放在屏幕中央",
	["Icon Size"]			= "图标大小",
	["Size of main icon"]	= "主图标的大小",
	["Border"]				= "边框",
	["Enable border on the icon"] = "启用图标边框",
	["Enable border on the list"] = "启用列表边框",
	["Icon"]				= "图标",
	["Settings for the mouseover icon used by the popup player buff list"] = "玩家Buff列表所使用的鼠标悬浮图标的选项",
	["Enable"]				= "启用",
	["Display the mouseover icon used by the popup player buff list"] = "显示玩家Buff列表旁的鼠标悬浮图标",
	["List"]				= "列表",
	["Settings for the popup buff list"] = "浮动Buff列表的选项",
	["Columns"]				= "列",
	["Columns to show in buff list"] = "Buff列表里面所显示的列",
	["Not with Spirit Tap"]	= "精神分流状态不Buff",
	["Don't auto buff when you have Spirit Tap, so you can maximise your regeneration"] = "当有“精神分流”Buff时不自动Buff，这样你可以尽可能的恢复",
	["Buff Pets"]			= "Buff宠物",
	["Perform extra checks for pets in case any missed the group buffs when they were done"] = "当团队Buff完成时额外再检查一次宠物Buff，以确定它们没有错过",
	["Position the notification area"] = "设定通知区域的位置",
	["Learning"]			= "学习",
	["Setup spell learning behaviour"] = "设定法术学习行为",
	["Out of Combat"]		= "战斗外",
	["Learn buff changes out of combat"] = "在战斗外学习Buff的更改",
	["In-Combat"]			= "战斗中",
	["Learn buff changes in combat"] = "在战斗中学习Buff的更改",
	["Actions"]				= "动作",
	["Miscelaneous actions"] = "其他动作",
	["Wipe Talent Cache"]	= "清空天赋缓存",
	["Clear talent cache to force refresh"] = "清除天赋缓存以强迫刷新",
	["Ignore Absent"]		= "忽略缺席者",
	["If players are offline, AFK or in another instance, count them as being present and buff everyone else"] = "假如玩家掉线，暂离或者在另外一个副本，将他们算作存在并Buff其它的人",
	["Singles Always"]		= "永远单体",
	["Only use single target buffs"] = "无论何时都只使用单体Buff",
	["Singles in BGs"]		= "战场中单体",
	["Only use single target buffs in battlegrounds"] = "在战场中只使用单体Buff",
	["Singles in Arena"]	= "竞技场中单体",
	["Only use single target buffs in arenas"] = "在竞技场中只使用单体Buff",
	["Click Config"]		= "点击选项",
	["Configure popup raid list click behaviour"] = "设定点击团队列表时的行为",
	["Define the mouse click to use for |cFFFFFF80%s|r"] = "为|cFFFFFF80%s|r设定鼠标点击",
	["Target"]				= "目标",
	["Targetting"]			= "Targetting",
	["Defaults"]			= "默认",
	["Restore default keybindings"] = "恢复默认的按键绑定",
	["Class Icon"]			= "职业图标",
	["Uses your main ZOMGBuffs spell for the floating icon, instead of the ZOMGBuffs default"] = "使用你的主ZOMGBuffs法术图标代替ZOMGBuffs的默认图标当作浮动图标",
	["Sink Output"]			= "Sink输出",
	["Route notification messages through SinkLib"] = "通过SinkLib输出通知信息",
	["Load Raid Module"]	= "载入团队模块",
	["Load the Raid Buff module. Usually for Mages, Druids & Priests, this module can also track single target spells such as Earth Shield & Blessing of Sacrifice, and allow raid buffing of Undending Breath and so on"] = "载入团队模块。一般是为法师，德鲁伊以及牧师准备的，该模块可以跟踪单体法术例如大地之盾以及牺牲祝福，并且可以Buff团队魔息术等等",
	["Buff Timer"]			= "Buff计时器",
	["Show buff time remaining with bar"] = "在计量条上显示Buff剩余时间",
	["Timer Size"]			= "计时器大小",
	["Adjust the size of the timer text"] = "更改计时器文字的大小",
	["Timer Threshold"]		= "计时器临界值",
	["Buff times over this number of minutes will not be shown"] = "Buff时间多于这么多分钟的Buff将不会显示",
	["Spell Icons"]			= "法术图标",
	["Show spell icons with spell names in messages"] = "在信息里显示带着法术图标的法术名称",
	["Short Names"]			= "简短名称",
	["Use short spell names where appropriate"] = "在合适的地方使用简短的法术名称",
	["Show Roles"]			= "显示角色",
	["Show player role icons"] = "显示玩家角色图标",
	["Auto-casting is disabled"] = "自动施法已禁用",
	["You can re-enable it by single clicking the ZOMGBuffs minimap/fubar icon"] = "你可以通过点击FuBar或者小地图图标重新启用",

	["CHATMATCH1"]			= "!buff",
	["CHATMATCH2"]			= "!zomg",
	["CHATMATCH3"]			= "!buffs",
	["CHATANSWER"]			= "<ZOMG>",
	["PERSONDIES"]			= "^([^%s]+)死亡了。$",
	
	ABOUT				=	"全职业可用的一体化Buff插件。依据团队中圣骑士的能力以及团队人员的次级职业（例如德鲁伊坦克 vs 德鲁伊治疗）自动分配Buff任务。此外还有Raid中重要的Buff的总览，以及右键可迅速的操控重新Buff。\r\r"..
							"作者：{Author}\r"..
							"分类：{X-Category}\r"..
							"E-mail：{X-Email}\r"..
							"网站：{X-Website}\r"..
							"授权: {X-License}\r"
}
--@end-debug@
--@localization(locale="zhCN", format="lua_table", namespace="", handle-unlocalized="ignore")@
end)
