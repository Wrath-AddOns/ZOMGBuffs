local L = LibStub("AceLocale-2.2"):new("ZOMGLog")

L:RegisterTranslations("zhTW", function() return
--@debug@
{
  Behaviour = "Behaviour",
	Changed = "已更動",
	["Changed %s's exception - %s from %s to %s"] = "已更動 %s的 例外 - %s 從 %s 至 %s",
	["Changed %s's template - %s from %s to %s"] = "已更動 %s的 樣板 - %s 從 %s 至 %s",
	Clear = "清除",
	["Cleared %s's exceptions for %s"] = "Cleared %s's exceptions for %s",
	["Clear the log"] = "清除日誌",
	["Event Logging"] = "Event Logging",
	["Generated automatic template"] = "Generated automatic template",
	["Loaded template '%s'"] = "Loaded template '%s'",
	Log = "日誌",
	["Log behaviour"] = "Log behaviour",
	Merge = "合併",
	["Merge similar entries within 15 seconds. Avoids confusion with cycling through buffs to get to desired one giving multiple log entries."] = "Merge similar entries within 15 seconds. Avoids confusion with cycling through buffs to get to desired one giving multiple log entries.",
	Open = "開啟",
	["Remotely changed"] = "Remotely changed",
	["Saved template '%s'"] = "已儲存樣板 '%s'",
	["%s %s's exception - %s from %s to %s"] = "%s %s的 例外 - %s 從 %s 至 %s",
	["%s %s's template - %s from %s to %s"] = "%s %s的 樣板 - %s 從 %s 至 %s",
	["View the log"] = "顯示日誌",
}
--@end-debug@
--@localization(locale="zhTW", format="lua_table", namespace="ZOMGLog")@
end)
