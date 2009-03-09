﻿if (ZOMGSelfBuffs) then
	ZOMGBuffs:Print("Installation error, duplicate copy of ZOMGBuffs_SelfBuffs (Addons\ZOMGBuffs\ZOMGBuffs_SelfBuffs and Addons\ZOMGBuffs_SelfBuffs)")
	return
end

local L = LibStub("AceLocale-2.2"):new("ZOMGSelfBuffs")
local R = LibStub("AceLocale-2.2"):new("ZOMGReagents")
local playerClass, playerName
local template

local InCombatLockdown	= InCombatLockdown
local IsUsableSpell		= IsUsableSpell
local GetSpellCooldown	= GetSpellCooldown
local GetSpellInfo		= GetSpellInfo
local UnitBuff			= UnitBuff
local UnitClass			= UnitClass

local z = ZOMGBuffs
local zs = z:NewModule("ZOMGSelfBuffs")
ZOMGSelfBuffs = zs

z:CheckVersion("$Revision$")

local mismatchList		-- Rogue poisons that don't match their spell names
if (GetLocale() == "deDE") then
	mismatchList = {["Verkrüppelungsgift"] = "Verkrüppelndes Gift"}		-- Crippling Poison
end

local new, del, deepDel, copy = z.new, z.del, z.deepDel, z.copy

local function getOption(v)
	return zs.db.char[v]
end

local function setOption(v, n, s)
	zs.db.char[v] = n
	if (s) then
		z:CheckForChange(zs)
	end
end

local function getPrelude(k)
	return zs.db.char.rebuff[k] or 0
end

local function setPrelude(k, v)
	if ((not v or v == 0) and k ~= "default") then
		zs.db.char.rebuff[k] = nil
	else
		zs.db.char.rebuff[k] = v
	end
end

zs.consoleCmd = L["Self"]
zs.options = {
	type = "group",
	order = 1,
	name = "|cFFFF8080Z|cFFFFFF80O|cFF80FF80M|cFF8080FFG|rSelfBuffs",
	desc = L["Self Buff Configuration"],
	handler = zs,
	disabled = function() return z:IsDisabled() end,
	args = {
		template = {
			type = "group",
			name = L["Templates"],
			desc = L["Template configuration"],
			order = 10,
			hidden = function() return not zs:IsModuleActive() end,
			args = {
			}
		},
		behaviour = {
			type = "group",
			name = L["Behaviour"],
			desc = L["Self buffing behaviour"],
			order = 201,
			hidden = function() return not zs:IsModuleActive() end,
			args = {
				combatnotice = {
					type = "toggle",
					name = L["Combat Warnings"],
					desc = L["Warn about expiring buffs in combat. Note that auto buffing cannot be done in combat, this is simply a reminder"],
					get = getOption,
					set = function(k,v) setOption(k, v, true) end,
					passValue = "combatnotice",
					order = 5,
				},
				rebuff = {
					type = "range",
					name = L["Expiry Prelude"],
					desc = L["Default rebuff prelude for all self buffs"],
					func = timeFunc,
					order = 2,
					get = getPrelude,
					set = setPrelude,
					passValue = "default",
					min = 0,
					max = 15 * 60,
					step = 5,
					bigStep = 60,
					order = 10,
				},
				useauto = {
					type = "toggle",
					name = L["Auto buffs"],
					desc = L["Use auto-intelligent buffs such as Crusader Aura when mounted"],
					get = getOption,
					set = function(k,v) setOption(k, v, true) end,
					passValue = "useauto",
					order = 15,
				},
				info = {
					type = 'toggle',
					name = L["Reagent Reminder"],
					desc = L["Show message when spells requiring reagents are used"],
					get = getOption,
					set = setOption,
					passValue = "reagentNotices",
					order = 20,
				},
			},
		},
	}
}
zs.moduleOptions = zs.options

-- GetMyBuffs
--function zs:GetMyBuffs()
--	local myBuffs
--	for i = 1,40 do
--		local name, rank, buff, count, _, max, endTime, isMine, isStealable = UnitBuff("player", i)
--		if (not name) then
--			break
--		end
--		if (endTime) then		-- isMine) then
--			local dur = endTime and (endTime - GetTime())
--			if (not myBuffs) then
--				myBuffs = new()
--			end
--			myBuffs[name] = (max > 0 and dur) or 99999
--		else
--			if (not z.zoneFlag) then	-- We can't warn immediately on zoning because time info often not available immediately
--				local t = self.classBuffs[name]
--				if (t) then
--					if (t.checkdups) then
--						if (template[name]) then
--							-- Another paladin using our defined aura
--							if (not myBuffs) then
--								myBuffs = new()
--							end
--							myBuffs[name] = 99999	-- We won't buff it because we have what we think we want
--						end
--					end
--				end
--			end
--		end
--	end
--
--	return myBuffs
--end

-- GetExistingItemWithSequence
local function GetExistingItemWithSequence(k, v)
	if (k and v) then
		local n = k
		if (v.sequence) then
			for i = #v.sequence,1,-1 do
				local temp = k..v.sequence[i]
				local c = GetItemCount(temp)
				if (c > 0) then
					return temp
				end
			end
		else
			return GetItemCount(k) > 0 and k
		end
	end
end

-- SetupForItem
function zs:SetupForItem(slot, itemName)
	local spell, item
	local t1, t2 = IsUsableSpell(itemName)
	spell = (t1 or t2) and itemName
	if (not spell) then
		item = GetExistingItemWithSequence(itemName, self.classBuffs[itemName])
	end
	if (spell or item) then
		z:SetupForItem(slot, item, self, spell, item and 4 or nil)	-- 4 for when casting poisons onto weapons, we need more than 1.5 secs for next check
		self.activeEnchant = GetTime()
		lastEnchantSet = spell or item
		return true
	end
end

-- GetCurrentItemEnchant
do
	local tempTip, durMatch, encMatchHour, encMatchMin, encMatchSec
	function zs:GetCurrentItemEnchant(slot)
		local hasEnchant, Expiration, Charges = select(1 + (3 * (slot - 16)), GetWeaponEnchantInfo())
		if (hasEnchant) then
			local tipName = "ZOMGBuffTempTip"
			-- See what enchant is, so we can make sure it's the right one

			if (not tempTip) then
				tempTip = CreateFrame("GameTooltip", tipName, UIParent, "GameTooltipTemplate")
			end

			if (not durMatch) then
				-- ConvertGlobalString - Shamelessly pulled from Parser-3.0
				local function ConvertGlobalString(str, first)
					-- Escape lua magic chars.
					local pattern = str:gsub("([%(%)%.%*%+%-%[%]%?%^%$%%])", "%%%1")

					-- Convert %1$s to (..-) and %1$d to (%d+).
					-- We don't care about the capture order, it's always the same for these strings
					pattern = pattern:gsub("%%%%%d%%%$s", "(..-)")
					pattern = pattern:gsub("%%%%%d%%%$d", "(%%d+)")

					-- Convert %s to (..-) and %d to (%d+).
					pattern = pattern:gsub("%%%%s", "(..-)")
					pattern = pattern:gsub("%%%%d", "(%%d+)")

					if pattern:sub(-5) == "(..-)" then
						pattern = pattern:sub(1, -6) .. "(.+)"
					end

					return "^" .. pattern
				end

				durMatch = ConvertGlobalString(DURABILITY_TEMPLATE)
				encMatchHour = ConvertGlobalString(ITEM_ENCHANT_TIME_LEFT_HOURS)
				encMatchMin = ConvertGlobalString(ITEM_ENCHANT_TIME_LEFT_MIN)
				encMatchSec = ConvertGlobalString(ITEM_ENCHANT_TIME_LEFT_SEC)
			end

			tempTip:SetOwner(UIParent, "ANCHOR_NONE")
			local ok, cd = tempTip:SetInventoryItem("player", slot)
			if (ok and cd) then
				local left, prev
				for i = 1,200 do
					left = getglobal(format("%sTextLeft%d", tipName, i))
					if (not left) then
						break
					end
					left = left:GetText()
					if (not left) then
						break
					end
					if (strfind(left, durMatch)) then
						left = prev
						break
					end
					prev = left
					left = nil
				end
				tempTip:Hide()

				if (left) then
					local spellFind, timeLeft = strmatch(left, encMatchHour)
					if (not spellFind) then
						spellFind, timeLeft = strmatch(left, encMatchMin)
						if (not spellFind) then
							spellFind, timeLeft = strmatch(left, encMatchSec)
						end
					end
					if (spellFind) then
						if (mismatchList) then
							for k,v in pairs(mismatchList) do
								spellFind = gsub(spellFind, k, v)
							end
						end

						return spellFind, Expiration / 1000 / 60
					end
				end
			end
			tempTip:Hide()
		end
	end
end

-- CheckEnchant
function zs:CheckEnchant(slot, spellOrItem)
	if (spellOrItem) then
		if (not self.activeEnchant or self.activeEnchant < GetTime() - 4) then
			local hasEnchant, Expiration, Charges = select(1 + (3 * (slot - 16)), GetWeaponEnchantInfo())
			if (hasEnchant) then
				if (playerClass ~= "SHAMAN") then		-- Shaman weapon enchants do not match spell names, so we won't check them
					local enc, timeLeft = self:GetCurrentItemEnchant(slot)
					if (enc) then
						if (not strfind(enc, spellOrItem)) then
							hasEnchant = nil
						end
					end
				end
			end

			if (not hasEnchant or Expiration / 1000 < self.db.char.rebuff.default) then
				if (InCombatLockdown() or self:SetupForItem(slot, spellOrItem)) then
					local itemLink = GetInventoryItemLink("player", slot)
					if (not itemLink) then
						itemLink = (slot == 16 and L["Main Hand"]) or L["Off Hand"]
					end
					z:Notice(format(L["You need %s on |c00FFFF80%s|r"], z:LinkSpell(spellOrItem, nil, true), itemLink), "buffreminder")
					return true
				end
			end
		end
	end
end

-- CheckWeaponBuff
function zs:CheckWeaponBuffs()
	return self:CheckEnchant(16, template.mainhand) or (OffhandHasWeapon() and self:CheckEnchant(17, template.offhand))
end

-- CheckBuffs
function zs:CheckBuffs()
	if (not self.classBuffs) then
		return
	end

	--local myBuffs
	if (self.db.char.useauto and not InCombatLockdown()) then
		if (z.globalCooldownEnd > GetTime()) then
			z:GlobalCDSchedule()
			return
		end

		-- Special case for Crusader Aura when mounted, and Aspect of Cheetah when resting
		--myBuffs = self:GetMyBuffs()
		for k,v in pairs(self.classBuffs) do
			if (v.auto) then
				local name, rank, buff, count, _, max, endTime, isMine, isStealable = UnitBuff("player", k)
				if (not name or not isMine) then
				--if (not myBuffs or not myBuffs[k]) then
					if (v.auto()) then
						if (not UnitOnTaxi("player") and not UnitIsDeadOrGhost("player")) then
							z:SetupForSpell()
							z:SetupForSpell("player", k, self)
							z:Notice(format(L["You need %s"], z:LinkSpell(k, nil, true)), "buffreminder")
							z.icon.autospell = true
							--del(myBuffs)
							return
						end
					end
				end
			end
		end
	end

	if (not z:CanCheckBuffs(self.db.char.combatnotice, true)) then
		--if (self.mounted and not z.db.profile.notmounted) then
		if (IsMounted() and not z.db.profile.notmounted) then
			z:SetupForSpell()
		end
		--del(myBuffs)
		return
	end

	if (z.icon.autospell) then
		if (not InCombatLockdown()) then
			z:SetupForSpell()
		end
	end

	local any
	--if (not myBuffs) then
	--	myBuffs = self:GetMyBuffs()
	--end

	local minTimeLeft
	for k,v in pairs(template) do
		if (v) then
			local cb = self.classBuffs[k]
			if (cb and (cb.who == "self" or cb.who == "single" or cb.who == "party")) then		-- self.trackingBuffs[k] or
				if (not cb.skip or not cb.skip()) then
					local name, rank, buff, count, _, max, endTime, isMine, isStealable = UnitBuff("player", k)

					local timeLeft = endTime and (endTime - GetTime())

					--local timeLeft = myBuffs and myBuffs[k]
					local requiredTimeLeft = self.db.char.rebuff[(cb and cb.rebuff) or k] or self.db.char.rebuff.default
					if ((cb.needStacks and (count or 0) < cb.needStacks) or (endTime ~= 0 and (not timeLeft or timeLeft < requiredTimeLeft))) then
						-- Need recast
						local start, duration, enable = GetSpellCooldown(k)
						if ((start and (start == 0 or start + duration <= GetTime())) and enable == 1 and IsUsableSpell(k)) then
							if (not InCombatLockdown() or not cb.nocombatnotice) then
								z:Notice(format(L["You need %s"], z:LinkSpell(k, nil, true)), "buffreminder")
							end
							if (not InCombatLockdown()) then
								z:SetupForSpell("player", k, self)
							end
							any = true
							break
						elseif (start ~= 0) then
							local temp = (start + duration) - GetTime()
							if (not minTimeLeft or temp < minTimeLeft) then
								minTimeLeft = temp	-- Soon to cooldown spells caught here
							end
						end
					elseif (timeLeft and timeLeft < 10000) then
						local t = timeLeft - requiredTimeLeft
						if (not minTimeLeft or t < minTimeLeft) then
							minTimeLeft = t
						end
					end
				end
			end
		end
	end

	if (not any and (template.mainhand or template.offhand)) then
		if (self:CheckWeaponBuffs()) then
			any = true
		end
	end

	self:CancelScheduledEvent("ZOMGBuffs_SelfCheckBuffs")
	if (not any and minTimeLeft) then
		self:ScheduleEvent("ZOMGBuffs_SelfCheckBuffs", self.CheckBuffs, minTimeLeft, self)
	end

	--del(myBuffs)
end

-- GetClassBuffs
function zs:GetClassBuffs()
	local classBuffs
	if (playerClass == "DRUID") then
		classBuffs = {
			{id = 16864, o = 2, duration = 30, who = "self", c = "80A0FF", noauto = true}, -- Omen of Clarity
			{id = 22812, o = 5, duration = 0.25, default = 5, who = "self", c = "A0A020", noauto = true, nocombatnotice = true}, -- Barkskin
			{id = 27009, o = 6, duration = 0.75, default = 5, who = "self", c = "80FF80", noauto = true, skip = function() return IsIndoors() end}, -- Nature's Grasp
			{id = 9846, o = 7, duration = 0.1, default = 1, who = "self", c = "FF8080", noauto = true}, -- Tiger's Fury
		}
		self.reagents = {
			[GetItemInfo(17034) or R["Maple Seed"]]			= {20, 1, 50, minLevel = 20, maxLevel = 29},
			[GetItemInfo(17035) or R["Stranglethorn Seed"]]	= {20, 1, 50, minLevel = 30, maxLevel = 39},
			[GetItemInfo(17036) or R["Ashwood Seed"]]			= {20, 1, 50, minLevel = 40, maxLevel = 49},
			[GetItemInfo(17037) or R["Hornbeam Seed"]]		= {20, 1, 50, minLevel = 50, maxLevel = 59},
			[GetItemInfo(17038) or R["Ironwood Seed"]]		= {20, 1, 50, minLevel = 60, maxLevel = 69},
			[GetItemInfo(22147) or R["Flintweed Seed"]]		= {20, 1, 50, minLevel = 70, maxLevel = 79},
			[GetItemInfo(44614) or R["Starleaf Seed"]]		= {20, 1, 50, minLevel = 70, maxLevel = 79},
		}
		self.notifySpells = {
			[GetSpellInfo(26994)] = {		-- Rebirth
				GetItemInfo(17034) or R["Maple Seed"],
				GetItemInfo(17035) or R["Stranglethorn Seed"],
				GetItemInfo(17036) or R["Ashwood Seed"],
				GetItemInfo(17037) or R["Hornbeam Seed"],
				GetItemInfo(17038) or R["Ironwood Seed"],
				GetItemInfo(22147) or R["Flintweed Seed"],
				GetItemInfo(44614) or R["Starleaf Seed"],
			},
		}

	elseif (playerClass == "MAGE") then
		classBuffs = {
			{id = 7301,  o = 4,  duration = 30,  who = "self", c = "0000FF", exclude = function() return IsUsableSpell(GetSpellInfo(36881)) end},	-- Frost Armor
			{id = 34913, o = 5,  duration = 30,  who = "self", dup = 2, c = "FF0000"},							-- Molten Armor
			{id = 27124, o = 6,  duration = 30,  who = "self", dup = 2, c = "0050FF"},							-- Ice Armor
			{id = 27125, o = 7,  duration = 30,  who = "self", dup = 2, c = "8080FF"},							-- Mage Armor
			{id = 33405, o = 9,  duration = 1,   who = "self", default = 5, c = "B0B0FF", noauto = true, cancancel = true}, -- Ice Barrier
			{id = 27128, o = 10, duration = 0.5, who = "self", default = 5, noauto = true, dup = 3, c = "FF5050", cancancel = true},	-- Fire Ward
			{id = 32796, o = 11, duration = 0.5, who = "self", default = 5, noauto = true, dup = 3, c = "5050FF", cancancel = true},	-- Frost Ward
			{id = 27131, o = 12, duration = 1,   who = "self", default = 5, noauto = true, c = "FFB0B0", cancancel = true},	-- Mana Shield
			{id = 11129, o = 14, duration = -1,  who = "self", noauto = true, c = "F5BC0B"},									-- Combustion
		}
		local singlePort = GetItemInfo(17031) or R["Rune of Teleportation"]
		local groupPort = GetItemInfo(17032) or R["Rune of Portals"]
		self.reagents = {
			[groupPort]		= {20, 1, 100},
			[singlePort]	= {20, 1, 100},
		}
		local singles = {3561, 3562, 3563, 3565, 3566, 3567, 32271, 32272, 33690}
		local groups = {10059, 11416, 11417, 11418, 11419, 11420, 32266, 32267, 33691}
		self.notifySpells = {}
		for i,id in pairs(singles) do
			self.notifySpells[(GetSpellInfo(id))] = singlePort
		end
		for i,id in pairs(groups) do
			self.notifySpells[(GetSpellInfo(id))] = groupPort
		end

	elseif (playerClass == "PRIEST") then
		classBuffs = {
			{id = 25218, o = 1, duration = 0.5, default = 5, who = "single", noauto = true, c = "C0C0FF"},	-- Power Word: Shield
			{id = 25431, o = 2, duration = 10, who = "self", c = "FFA080"},									-- Inner Fire
			{id = 45455, o = 9, duration = -1, who = "self", c = "A020A0"},									-- Shadowform
		}

	elseif (playerClass == "WARLOCK") then
		classBuffs = {
			{id = 27260, o = 1, duration = 30, who = "self", dup = 1, c = "FF80FF"},					-- Demon Armor
			{id = 696,   o = 2, duration = 30, who = "self", dup = 1, c = "FF20FF", exclude = function() return IsUsableSpell(GetSpellInfo(27260)) end}, -- Demon Skin
			{id = 44977, o = 3, duration = 30, who = "self", dup = 1, c = "FF8080"},					-- Fel Armor
			{id = 28610, o = 6, duration = 0.5, default = 5, who = "self", noauto = true, c = "FF60FF"},				-- Shadow Ward
			{id = 19028, o = 7, duration = -1, who = "self", noauto = true, c = "20FF80", skip = function() return not UnitExists("pet") end},				-- Soul Link
		}
		self.reagents = {
			[GetItemInfo(16583) or R["Demonic Figurine"]]	= {5, 1, 100},
			[GetItemInfo(5565) or R["Infernal Stone"]]	= {5, 1, 100},
		}
		local shoulShard = R["Soul Shard"]
		local warlockList = {
			27250, -- Create Firestone
			27238, -- Create Soulstone
			28172, -- Create Spellstone
			27230, -- Create Healthstone
			11726, -- Enslave Demon
			29893, -- Ritual of Souls
			698,   -- Ritual of Summoning
			30546, -- Shadowburn
			30545, -- Soul Fire
			29858, -- Soulshatter
			30146, -- Summon Felguard
			691,   -- Summon Felhunter
			712,   -- Summon Succubus
			697,   -- Summon Voidwalker
		}
		self.notifySpells = {}
		for i,id in pairs(warlockList) do
			self.notifySpells[(GetSpellInfo(id))] = soulShard
		end
		self.notifySpells[GetSpellInfo(24670)] = GetItemInfo(5565) or R["Infernal Stone"]		-- Inferno
		self.notifySpells[GetSpellInfo(18540)] = GetItemInfo(16583) or R["Demonic Figurine"]	-- Ritual of Doom

	elseif (playerClass == "HUNTER") then
		classBuffs = {
			{id = 19506, o = 1, duration = -1, who = "self", c = "FFFFFF"},					-- Trueshot Aura
			{id = 34074, o = 3, duration = -1, who = "self", dup = 1, c = "B080FF"},		-- Aspect of the Viper
			{id = 27044, o = 4, duration = -1, who = "self", dup = 1, c = "4090FF"},		-- Aspect of the Hawk
			{id = 61846, o = 5, duration = -1, who = "self", dup = 1, c = "808090"},		-- Aspect of the Dragonhawk
			{id = 5118, o = 6, duration = -1, who = "self", dup = 1, c = "FFFF80", auto = function() return IsResting() and z.db.profile.notresting and not IsMounted() end},	-- Aspect of the Cheetah
			{id = 13159, o = 7, duration = -1, who = "self", dup = 1, c = "B0B0B0"},		-- Aspect of the Pack
			{id = 27045, o = 8, duration = -1, who = "self", dup = 1, c = "20FF20"},		-- Aspect of the Wild
			{id = 13161, o = 9, duration = -1, who = "self", dup = 1, c = "FFA0FF"},		-- Aspect of the Beast
			{id = 13163, o = 10, duration = -1, who = "self", dup = 1, c = "808020"},		-- Aspect of the Monkey
		}

	elseif (playerClass == "SHAMAN") then
		local onEnableShield = function() 
			local btr = ZOMGBuffTehRaid
			if (btr) then
				local who = btr:ExclusiveTarget("EARTHSHIELD")
				if (who and UnitIsUnit(who, "player")) then
					btr:ModifyTemplate("EARTHSHIELD", nil)
				end
			end
		end

		classBuffs = {
			{id = 49281, o = 1, duration = 10, who = "self", c = "8080FF", onEnable = onEnableShield},					-- Lightning Shield
			{id = 33736, o = 4, duration = 10, who = "self", noauto = true, c = "4040FF", onEnable = onEnableShield},	-- Water Shield
			{id = 25505, o = 1, duration = 30, who = "weapon", c = "FFFFFF", dup = 1},		-- Windfury Weapon
			{id = 25489, o = 2, duration = 30, who = "weapon", c = "FF8080", dup = 1},		-- Flametongue Weapon
			{id = 25500, o = 3, duration = 30, who = "weapon", c = "8080FF", dup = 1},		-- Frostbrand Weapon
			{id = 51993, o = 4, duration = 30, who = "weapon", c = "FFFF80", dup = 1},		-- Earthliving Weapon
		}
		self.reagents = {
			[GetItemInfo(17030) or R["Ankh"]] = {10, 1, 50},
		}
		self.notifySpells = {
			[GetSpellInfo(27740)] = GetItemInfo(17030) or R["Ankh"],										-- Reincarnation
		}

	elseif (playerClass == "WARRIOR") then
		classBuffs = {
			{id = 2048, o = 1, duration = 2, dup = 1, who = "self", c = "FF4040", checkdups = true},		-- Battle Shout
			{id = 469, o = 2, duration = 2, dup = 1, who = "self", c = "40FF40", checkdups = true},			-- Commanding Shout
			{id = 18499, o = 4, duration = 0.165, who = "self", noauto = true, c = "FFFF40"},				-- Berserker Rage
			{id = 29131, o = 5, duration = 0.165, who = "self", noauto = true, c = "FF0000"},				-- Bloodrage
		}

	elseif (playerClass == "ROGUE") then
		classBuffs = {
			{id = 51662, o = 1, duration = 0.5, needStacks = 3, who = "self", c = "FFFF80"},	-- Hunger for Blood
			{id = 41189, o = 3, dup = 1, duration = 60, who = "weapon", c = "40F040", sequence = {"", " II", " III", " IV", " V", " VI", " VII"}},	-- Instant Poison
			{id = 43581, o = 4, dup = 1, duration = 60, who = "weapon", c = "40E040", sequence = {"", " II", " III", " IV", " V", " VI", " VII"}},	-- Deadly Poison
			{id = 3408, o = 5, dup = 1, duration = 60, who = "weapon", c = "40C020"},																-- Crippling Poison
			{id = 5761, o = 6, dup = 1, duration = 60, who = "weapon", c = "40B040"},																-- Mind-numbing Poison
			{id = 43461, o = 7, dup = 1, duration = 60, who = "weapon", c = "A0A040", sequence = {"", " II", " III", " IV", " V"}},					-- Wound Poison
			{id = 57982, o = 8, dup = 1, duration = 60, who = "weapon", c = "209080", sequence = {"", " II"}},										-- Anesthetic Poison
		}
		self.reagents = {
			[6947] = {20, 1, 100, minLevel = 20, maxLevel = 27},			-- Instant Poison I
			[6949] = {20, 1, 100, minLevel = 28, maxLevel = 35},			-- Instant Poison II
			[6950] = {20, 1, 100, minLevel = 36, maxLevel = 43},			-- Instant Poison III
			[8926] = {20, 1, 100, minLevel = 44, maxLevel = 51},			-- Instant Poison IV
			[8927] = {20, 1, 100, minLevel = 52, maxLevel = 59},			-- Instant Poison V
			[8928] = {20, 1, 100, minLevel = 60, maxLevel = 67},			-- Instant Poison VI
			[21927]= {20, 1, 100, minLevel = 68, maxLevel = 72},			-- Instant Poison VII
			[43230]= {20, 1, 100, minLevel = 73, maxLevel = 78},			-- Instant Poison VIII
			[43231]= {20, 1, 100, minLevel = 79, maxLevel = 85},			-- Instant Poison IX

			[2892] = {20, 1, 100, minLevel = 30, maxLevel = 37},			-- Deadly Poison I
			[2893] = {20, 1, 100, minLevel = 38, maxLevel = 45},			-- Deadly Poison II
			[8984] = {20, 1, 100, minLevel = 46, maxLevel = 53},			-- Deadly Poison III
			[8985] = {20, 1, 100, minLevel = 54, maxLevel = 59},			-- Deadly Poison IV
			[20844]= {20, 1, 100, minLevel = 60, maxLevel = 61},			-- Deadly Poison V
			[22053]= {20, 1, 100, minLevel = 62, maxLevel = 69},			-- Deadly Poison VI
			[22054]= {20, 1, 100, minLevel = 70, maxLevel = 75},			-- Deadly Poison VII
			[43232]= {20, 1, 100, minLevel = 76, maxLevel = 79},			-- Deadly Poison VIII
			[43233]= {20, 1, 100, minLevel = 80, maxLevel = 87},			-- Deadly Poison IX

			[10918]= {20, 1, 100, minLevel = 32, maxLevel = 39},			-- Wound Poison I
			[10920]= {20, 1, 100, minLevel = 40, maxLevel = 47},			-- Wound Poison II
			[10921]= {20, 1, 100, minLevel = 48, maxLevel = 55},			-- Wound Poison III
			[10922]= {20, 1, 100, minLevel = 56, maxLevel = 63},			-- Wound Poison IV
			[22055]= {20, 1, 100, minLevel = 64, maxLevel = 71},			-- Wound Poison V
			[43234]= {20, 1, 100, minLevel = 72, maxLevel = 77},			-- Wound Poison VI
			[43235]= {20, 1, 100, minLevel = 78, maxLevel = 85},			-- Wound Poison VII

			[21835]= {20, 1, 100, minLevel = 68, maxLevel = 76},			-- Anesthetic Poison
			[43237]= {20, 1, 100, minLevel = 77, maxLevel = 85},			-- Anesthetic Poison II

			[3775] = {20, 1, 100, minLevel = 20},							-- Crippling Poison
			[5237] = {20, 1, 100, minLevel = 20},							-- Mind-numbing Poison
		}

	elseif (playerClass == "PALADIN") then
		local function skipFunc()
			--return zs.db.char.useauto and zs.mounted and not z.db.profile.notmounted
			return zs.db.char.useauto and IsMounted() and not z.db.profile.notmounted
		end

		classBuffs = {
			{id = 21084, o = 1,  duration = 2, who = "self", dup = 1, noauto = true, c = "C0C0FF", rebuff = L["Seals"]},	-- Seal of Righteousness
			{id = 20375, o = 2,  duration = 2, who = "self", dup = 1, noauto = true, c = "FFD010", rebuff = L["Seals"]},	-- Seal of Command
			{id = 20166, o = 3,  duration = 2, who = "self", dup = 1, noauto = true, c = "6070FF", rebuff = L["Seals"]},	-- Seal of Wisdom
			{id = 20165, o = 4,  duration = 2, who = "self", dup = 1, noauto = true, c = "FFA040", rebuff = L["Seals"]},	-- Seal of Light
			{id = 53736, o = 5,  duration = 2, who = "self", dup = 1, noauto = true, c = "FFD010", rebuff = L["Seals"]},	-- Seal of Corruption
			{id = 31892, o = 6,  duration = 2, who = "self", dup = 1, noauto = true, c = "FFA0A0", rebuff = L["Seals"]},	-- Seal of Blood
			{id = 31801, o = 7,  duration = 2, who = "self", dup = 1, noauto = true, c = "FFA0A0", rebuff = L["Seals"]},	-- Seal of Vengeance
			{id = 20164, o = 8,  duration = 2, who = "self", dup = 1, noauto = true, c = "A0FFA0", rebuff = L["Seals"]},	-- Seal of Justice
			{id = 25780, o = 10, duration = 30, who = "self", c = "FFD020", cancancel = true},								-- Righteous Fury
			{id = 27179, o = 11, duration = 0.165, who = "self", c = "FFF0E0", noauto = true},								-- Holy Shield
			{id = 27149, o = 13, duration = -1, who = "self", dup = 2, mounted = true, c = "8090C0", checkdups = true, skip = skipFunc},		-- Devotion Aura
			{id = 27150, o = 14, duration = -1, who = "self", dup = 2, mounted = true, c = "D040D0", checkdups = true, skip = skipFunc},		-- Retribution Aura
			{id = 19746, o = 15, duration = -1, who = "self", dup = 2, mounted = true, c = "C020E0", checkdups = true, skip = skipFunc},		-- Concentration Aura
			{id = 27151, o = 16, duration = -1, who = "self", dup = 2, mounted = true, c = "8020FF", checkdups = true, skip = skipFunc},		-- Shadow Resistance Aura
			{id = 27152, o = 17, duration = -1, who = "self", dup = 2, mounted = true, c = "2020FF", checkdups = true, skip = skipFunc},		-- Frost Resistance Aura
			{id = 27153, o = 18, duration = -1, who = "self", dup = 2, mounted = true, c = "E06020", checkdups = true, skip = skipFunc},		-- Fire Resistance Aura
			{id = 32223, o = 19, duration = -1, who = "self", dup = 2, mounted = true, c = "D0D060", noauto = true, auto = function(v) return IsMounted() end, c = "FFFFFF"},	-- Crusader Aura
			{id = 54428, o = 21, duration = 0.25, who = "self", c = "FFFF70", noauto = true,		-- Divine Plea
				skip = function()
					local mana, maxmana = UnitMana("player"), UnitManaMax("player")
					return (mana / maxmana) > 0.75					-- Skip if over 75% mana
				end
			},
		}

		self.notifySpells = {
			[GetSpellInfo(19752)] = GetItemInfo(17033) or R["Symbol of Divinity"],		-- Divine Intervention
		}
	elseif (playerClass == "DEATHKNIGHT") then
		local strOfEarth = GetSpellInfo(8076)										-- Strength of Earth
		classBuffs = {
			{id = 49222, o = 1, duration = 5, who = "self", c = "209020"},			-- Bone Armor
			{id = 49142, o = 2, duration = 30, who = "weapon", c = "204090"},		-- Frozen Rune Weapon
			{id = 57623, o = 3, duration = 2, who = "self", c = "808080",			-- Horn of Winter
				skip = function()
					return UnitBuff("player", strOfEarth) ~= nil
				end,
			},
		}
		self.notifySpells = {
			[GetSpellInfo(46584)] = GetItemInfo(37201) or R["Corpse Dust"],			-- Raise Dead
		}
		self.reagents = {
			[GetItemInfo(37201) or R["Corpse Dust"]]	= {20, 1, 200},
		}
	end

	local errors
	if (classBuffs) then
		self.classBuffs = {}
		for i,data in pairs(classBuffs) do
			if (data.id) then
				local name, _, icon = GetSpellInfo(data.id)
				if (name) then
					self.classBuffs[name] = data
				else
					-- Store the errors now till end, so the rest will still function even with unknown spells
					errors = (errors and (errors .. ", ") or "") .. tostring(data.id)
				end
			else
				self.classBuffs[i] = data
			end
		end
	else
		self.classBuffs = nil
		return
	end

	local altList = new()
	for k,v in pairs(self.classBuffs) do
		tinsert(altList, v)
	end

	local setLearnable = not self.db.char.notlearnable
	if (setLearnable) then
		self.db.char.notlearnable = {}
	end

	local rebuff = self.db.char.rebuff
	for k,v in pairs(self.classBuffs) do
		if (setLearnable) then
			if (v.noauto) then
				self.db.char.notlearnable[k] = true
			end
		end

		if (v.default and not not rebuff[k]) then
			rebuff[k] = v.default
		end

		if (v.who == "self" or v.who == "single" or v.who == "party") then
			--local t1, t2 = IsUsableSpell(k)
			local t1 = GetSpellCooldown(k)
			if (not t1) then	--not (t1 or t2)) then
				-- Remove any spells we don't have
				local o = v.o
				self.classBuffs[k] = nil

				for i = 1,#altList do
					if (altList[i].o > o) then
						altList[i].o = altList[i].o - 1
					end
				end
			end
		end
	end

	del(altList)

	self:MakeSpellOptions()
	self:MakeItemOptions()
	z:CheckForChange(self)

	if (errors) then
		error("No spell for spellID "..errors.." (class:".. playerClass ..")")
	end
end

-- OneOfYours
function zs:OneOfYours(spell)
	return self.classBuffs[spell]
end

-- GetSpellIcon
function zs:GetSpellIcon(spell)
	local name, _, icon = GetSpellInfo(self.classBuffs[spell].id)
	return icon
end

-- MakeSpellOptions
do
	local function setFunc(k)
		-- Untick any marked as 'dup' (Mutually exclusive buffs, such as Paladin Seals & Hunter Aspects)
		local b = zs.classBuffs[k]
		if (b) then
			local old = template[k]
			if (b.dup) then
				for i,s in pairs(zs.classBuffs) do
					if (b.dup == s.dup) then
						zs:ModifyTemplate(i, nil)
					end
				end
			end
			zs:ModifyTemplate(k, not old)
		end
		z:SetupForSpell()
		zs:CheckBuffs()
	end

	local function getLearnable(k)
		return not zs.db.char.notlearnable or not zs.db.char.notlearnable[k]
	end

	local function setLearnable(k, v)
		if (v == false) then
			if (not zs.db.char.notlearnable) then
				zs.db.char.notlearnable = {}
			end
			zs.db.char.notlearnable[k] = true
		else
			if (zs.db.char.notlearnable) then
				zs.db.char.notlearnable[k] = nil
				-- Don't nil this array, else next time we startup the defaults will be reset from the noauto values
			end
		end
	end

	function zs:MakeSpellOptions()
		local any
		local args = {}

		local order = 1
		local notDone, needBreak
		for i = 1,25 do
			local done
			for k,v in pairs(self.classBuffs) do
				if (v.o == i and (v.who == "self" or v.who == "single" or v.who == "party")) then
					if (not v.exclude or not v.exclude()) then
						if (needBreak and any) then
							args["header"..order] = {
								type = "header",
								name = " ",
								order = order,
							}
							order = order + 1
						end
						needBreak = nil

						any = true
						notDone = nil
						done = true
						local cName
						if (v.c) then
							cName = format("|cFF%s%s|r", v.c, k)
						else
							cName = k
						end

						args[k] = {
							type = "group",
							name = cName,
							desc = cName,
							order = order,
							isChecked = function() return template[k] end,
							onClick = setFunc,
							passValue = k,
							args = {
								header = {
									type = "header",
									name = cName,
									order = 1,
								},
								nolearn = {
									type = "toggle",
									name = L["Learnable"],
									desc = L["Remember this spell when it's cast manually?"],
									order = 3,
									get = getLearnable,
									set = setLearnable,
									passValue = k,
								}
							}
						}

						if ((v.duration or 0) > 0) then
							args[k].args.rebuff = {
								type = "range",
								name = L["Expiry Prelude"],
								desc = format(L["Rebuff prelude for %s (0=Module default)"], v.rebuff or cName),
								func = timeFunc,
								order = 2,
								get = getPrelude,
								set = setPrelude,
								passValue = v.rebuff or k,
								min = 0,
								max = (v.duration / 2) * 60,
								step = (v.duration <= 60 and 1) or 5,
								bigStep = (v.duration <= 60 and 5) or 60,
								order = 2,
							}
						end

						order = order + 1
						break
					end
				end
			end

			if (not done and not notDone) then
				needBreak = true
			end
		end

		if (any) then
			if (not zs.options.args.spells) then
				zs.options.args.spells = {
					type = "group",
					name = L["Class Spells"],
					desc = L["Class spell configuration"],
					order = 1,
					hidden = function() return not zs:IsModuleActive() end,
					args = {
					}
				}
			end
			zs.options.args.spells.args = args
		end

		del(list)
	end
end

-- MakeItemOptions
function zs:MakeItemOptions()
	local any
	local args = {
	}

	local function getFunc(k)
		local a,b = strmatch(k, "^(%a+):(.+)$")
		if (a == "mainhand") then
			return b == template.mainhand
		elseif (a == "offhand") then
			return b == template.offhand
		end
	end
	local function setFunc(k,v)
		local a,b = strmatch(k, "^(%a+):(.+)$")
		self.activeEnchant = nil
		self:ModifyTemplate(a, v and b)
	end

	local function hideOHWeapon()
		return GetInventoryItemLink("player", 17) == nil
	end

	for k,v in pairs(self.classBuffs) do
		if (v.who == "weapon") then
			local spell, item
			local t1, t2 = IsUsableSpell(k)
			spell = (t1 or t2) and k
			if (not spell) then
				item = GetExistingItemWithSequence(k,v)
			end
			if (spell or item) then
				local e1, e2, e3
				e1 = "mainhand:"..k
				e2 = "offhand:"..k
				e3 = "both:"..k

				local spellIcon
				if (item) then
					spellIcon = select(10, GetItemInfo(item))
				else
					spellIcon = v.id and select(3, GetSpellInfo(v.id))
				end

				any = true
				args[k] = {
					type = "group",
					name = spell or item,
					desc = spell or item,
					order = v.o,
					get = function(k) return template[spell or item] end,
					set = function(k,v) end,
					icon = spellIcon,
					passValue = k,
					args = {
						mainhand = {
							type = "toggle",
							name = L["Main Hand"],
							desc = L["Use this item or spell on the main hand weapon"],
							order = 1,
							get = getFunc,
							set = setFunc,
							passValue = e1,
						},
						offhand = {
							type = "toggle",
							name = L["Off Hand"],
							desc = L["Use this item or spell on the off hand weapon"],
							order = 1,
							hidden = hideOHWeapon,
							get = getFunc,
							set = setFunc,
							passValue = e2,
						},
					}
				}
			end
		end
	end

	if (any) then
		if (not zs.options.args.item) then
			zs.options.args.item = {
				type = "group",
				name = L["Items"],
				desc = L["Item configuration"],
				order = 2,
				hidden = function() return not zs:IsModuleActive() end,
				args = {
				}
			}
		end
		zs.options.args.item.args = args
	end

	del(list)
end

-- SelectTemplate
function zs:OnSelectTemplate(templateName)
	template = self.db.char.templates.current

	for key,buff in pairs(self.classBuffs) do
		if (template[key]) then
			if (buff.onEnable) then
				buff.onEnable()
			end
		end
	end
end

-- OnModifyTemplate
function zs:OnModifyTemplate(key, value)
	if (value) then
		local buff = self.classBuffs[key]
		if (buff and buff.onEnable) then
			buff.onEnable()
		end
	end
end

-- SpellCastFailed
function zs:SpellCastFailed(spell, rank, manual)
	if (not manual) then
		if (spell == lastEnchantSet) then
			self.activeEnchant = nil
		end
		self:CheckBuffs()
	end
end

-- CheckMounted
function zs:CheckMounted()
	if (self.checkMountedCounter and self.checkMountedCounter > 0) then
		self.checkMountedCounter = self.checkMountedCounter - 1
		self:ScheduleEvent("ZOMGBuffs_CheckMounted", self.CheckMounted, 0.2, self)
	end

	if (not InCombatLockdown()) then
		local m = IsMounted()
		if (self.mounted ~= m) then
			self.mounted = m
			if (m) then
				self.checkMountedCounter = nil
				z:SetupForSpell()
				self:CheckBuffs()
				return
			end
		end
	end
end

-- UNIT_AURA
function zs:UNIT_AURA(unit)
	if (unit == "player") then
		if (not InCombatLockdown()) then
			-- self:Print("UNIT_AURA - self.mounted = "..tostring(self.mounted)..", IsMounted() = "..tostring(IsMounted()))
			self:CancelScheduledEvent("ZOMGBuffs_CheckMounted")
			if (not self.mounted and not IsMounted()) then
				-- Nasty hack, because IsMounted() does not work immediately after
				-- the player gains a mount buff, as it did with PLAYER_AURAS_CHANGED
				-- Currently, there are no events fired when IsMounted() is toggled on
				-- Might have to do an OnUpdate check
				self:ScheduleEvent("ZOMGBuffs_CheckMounted", self.CheckMounted, 0.2, self)
				self.checkMountedCounter = 10
			end
			self:CheckMounted()
			z:CheckForChange(self)
		end
	end
end

-- ChecksAfterItemChanges
function zs:ChecksAfterItemChanges()
	self.activeEnchant = nil
	self:CheckBuffs()
	self:MakeItemOptions()
end

-- UNIT_INVENTORY_CHANGED
function zs:UNIT_INVENTORY_CHANGED(unit)
	if (unit == "player") then
		self:CancelScheduledEvent("ZOMGBuffs_ChecksAfterItemChanges")
		if (not any and minTimeLeft) then
			self:ScheduleEvent("ZOMGBuffs_ChecksAfterItemChanges", self.ChecksAfterItemChanges, 5, self)
		end
	
		if (self.checkReagentUsage) then
			if (self.checkReagentUsage.time + 5 >= GetTime()) then
				local count = GetItemCount(self.checkReagentUsage.reagent)
	
				if (count < self.checkReagentUsage.count) then
					local colourCount
					if (count < 2) then
						colourCount = "|cFFFF4040"
					elseif (count < 5) then
						colourCount = "|cFFFFFF40"
					else
						colourCount = "|cFF40FF40"
					end
	
					self:Print(L["%s, %s%d|r %s remain"], self.checkReagentUsage.spell, colourCount, count, self.checkReagentUsage.reagent)
					self.checkReagentUsage = del(checkReagentUsage)
				end
			else
				self.checkReagentUsage = del(checkReagentUsage)
			end
		end
	end
end

-- OnSpellsChanged
function zs:OnSpellsChanged()
	playerName = UnitName("player")
	playerClass = select(2, UnitClass("player"))
	self:GetClassBuffs()
end

-- SpellCastSucceeded
function zs:SpellCastSucceeded(spell, rank, target, manual)
	if (spell == lastEnchantSet and target == UnitName("player")) then
		if (z.icon.mod == self) then
			if ((z.icon:GetAttribute("spell") or z.icon:GetAttribute("item")) == spell) then
				z:SetupForSpell()
				z:RequestSpells()
			end
		end
		self.activeEnchant = nil
	end

	if (manual) then
		if (z:CanLearn() and (not zs.db.char.notlearnable or not zs.db.char.notlearnable[spell])) then
			local ours
			-- Manual cast buffs will override the current template and mark it as modified.
			local buff = self.classBuffs[spell]
			if (buff) then
				if (buff.who == "self") then
					-- Manual buff override
					if (buff.dup) then
						for k,v in pairs(self.classBuffs) do
							if (v.dup == buff.dup) then
								self:ModifyTemplate(k, nil)
							end
						end
					end
					ours = true
				end
			end

			if (ours) then
				z:CheckForChange(self)
				self:ModifyTemplate(spell, true)
			end
		end
	end

	-- Check for a spell used with a consumable reagent not covered in raid/blessings
	if (self.notifySpells and self.db.char.reagentNotices) then
		local found = self.notifySpells[spell]
		if (found) then
			local reagent
			if (type(found) == "table") then
				reagent = found[rank]
				if (not reagent) then
					reagent = found[#found]
				end
			else
				reagent = found
			end

			if (reagent) then
				self.checkReagentUsage = {
					reagent = reagent,
					spell = spell,
					time = GetTime(),
					count = GetItemCount(reagent)
				}
			end
		end
	end
end

-- TooltipOnClick
function zs:TooltipOnClick(name)
	if (name) then
		if (IsShiftKeyDown()) then
			self:ModifyTemplate(name, nil)
		else
			local b
			if (name == "mainhand" or name == "offhand") then
				b = self.classBuffs[template[name]]
			else
				b = self.classBuffs[name]
			end

			local nextOne, firstOne, replaceTo
			local lowest = 99
			if (b and b.dup) then
				for find,s in pairs(self.classBuffs) do
					if (not s.exclude or s.exclude()) then
						if (b.dup == s.dup) then
							if (s.o < lowest) then
								lowest = s.o
								firstOne = find
							end
							if (s.o == b.o + 1) then
								replaceTo = find
							end
						end
					end
				end
			end

			if (replaceTo or firstOne) then
				if (name == "mainhand" or name == "offhand") then
					self.activeEnchant = nil
					self:ModifyTemplate(name, replaceTo or firstOne)
				else
					if (name ~= (replaceTo or firstOne)) then
						self:ModifyTemplate(name, nil)
						self:ModifyTemplate(replaceTo or firstOne, true)
					end
				end
			end
		end
	end
end

-- AddItem
function zs:AddItem(cat, which, item)
	local name = (which == "mainhand" and L["Main Hand"]) or L["Off Hand"]
	local itemName = GetExistingItemWithSequence(item, self.classBuffs[item])
	local checkIcon
	if (itemName) then
		item = itemName
		checkIcon = select(10, GetItemInfo(itemName))
	end

	cat:AddLine(
		"text", name,
		"textR", 0.5,
		"textG", 1,
		"textB", 0.5,
		"text2", item,
		"text2R", 1,
		"text2G", 1,
		"text2B", 0.5,
		"func", "TooltipOnClick",
		"arg1", self,
		"arg2", which,
		"hasCheck", checkIcon and true,
		"checked", checkIcon and true,
		"checkIcon", checkIcon
	)
end

-- SortedBuffList
function zs:SortedBuffList()
	local list = new()
	for name,info in pairs(self.classBuffs) do
		if (info.who == "self") then
			local insertPos = #list + 1
			for i,key in ipairs(list) do
				if (self.classBuffs[key].who == "self" and self.classBuffs[key].o > info.o) then
					insertPos = i
					break
				end
			end
			tinsert(list, insertPos, name)
		end
	end
	return list
end

-- TooltipUpdate
function zs:TooltipUpdate(cat)
	if (template and self.classBuffs) then
		cat:AddLine('text', " ")
		cat:AddLine(
			"text", L["Self Buffs Template: "].."|cFFFFFFFF"..(zs.db.char.selectedTemplate or L["none"]),
			"text2", (template and template.modified and "|cFFFF4040"..L["(modified)"].."|r") or ""
		)

		if (template.mainhand) then
			self:AddItem(cat, "mainhand", template.mainhand)
		end
		if (template.offhand) then
			self:AddItem(cat, "offhand", template.offhand)
		end

		local list = self:SortedBuffList()
		for i,key in ipairs(list) do
			if (template[key]) then
				local buff = self.classBuffs[key]
				local checkIcon = buff.id and select(3, GetSpellInfo(buff.id))
				local c = "|cFF"..((buff and buff.c) or "FFFF80")

				cat:AddLine(
					"text", c..key,
					"func", "TooltipOnClick",
					"arg1", self,
					"arg2", key,
					"hasCheck", checkIcon and true,
					"checked", checkIcon and true,
					"checkIcon", checkIcon
				)
			end
		end
		del(list)
	end
end

-- OnModuleInitialize
function zs:OnModuleInitialize()
	self.db = z:AcquireDBNamespace("SelfBuffs")
	z:RegisterDefaults("SelfBuffs", "char", {
		useauto = true,
		templates = {},
		reagents = {},
		combatnotice = true,
		rebuff = {
			default = 30,
			[L["Seals"]] = 5,
		},
		reagentNotices = true,
	} )

	z:RegisterChatCommand({"/zomgself", "/zomgselfbuffs"}, zs.options)
	self.OnMenuRequest = self.options
	z.options.args.ZOMGSelfBuffs = self.options

	template = zs.db.char.templates.current
	if (not template) then
		template = {}
		zs.db.char.templates.current = template
	end

	z:RegisterBuffer(self, 1)

	self.OnModuleInitialize = nil
end

-- OnResetDB
function zs:OnResetDB()
	template = self.db.char.templates.current
end

-- OnModuleEnable
function zs:OnModuleEnable()
	self:OnResetDB()

	playerName = UnitName("player")
	playerClass = select(2, UnitClass("player"))

	if (playerClass == "ROGUE") then
		self.db.char.reagents.flashpowder = nil

		if (not self.db.char.hfbdone) then
			-- New default for Hunger for Blood
			self.db.char.hfbdone = true
			self.db.char.rebuff[GetSpellInfo(51662)] = 5
		end
	end

	self:OnSpellsChanged()
	z:MakeOptionsReagentList()

	self.mounted = IsMounted()

	self:RegisterEvent("UNIT_AURA")
	self:RegisterEvent("UNIT_INVENTORY_CHANGED")
	z:CheckForChange(self)
end

-- OnModuleDisable
function zs:OnModuleDisable()
	z:CheckForChange(self)
	self.classBuffs = nil
	self.activeEnchant = nil
end
