-- Generated APIDefinitions for namespace: C_PlayerInfo
local _, ns = ...
local APIDefs = ns.APIDefinitions

APIDefs["C_PlayerInfo.CanUseItem"] = {
	key = "C_PlayerInfo.CanUseItem",
	name = "CanUseItem",
	category = "combat_midnight",
	subcategory = "c_playerinfo",
	func = _G["C_PlayerInfo"] and _G["C_PlayerInfo"]["CanUseItem"],
	funcPath = "C_PlayerInfo.CanUseItem",
	params = { { name = "itemID", type = "number", default = nil } },
	returns = { { name = "isUseable", type = "bool", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_PlayerInfo.GUIDIsPlayer"] = {
	key = "C_PlayerInfo.GUIDIsPlayer",
	name = "GUIDIsPlayer",
	category = "combat_midnight",
	subcategory = "c_playerinfo",
	func = _G["C_PlayerInfo"] and _G["C_PlayerInfo"]["GUIDIsPlayer"],
	funcPath = "C_PlayerInfo.GUIDIsPlayer",
	params = { { name = "guid", type = "WOWGUID", default = nil } },
	returns = { { name = "isPlayer", type = "bool", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_PlayerInfo.GetClass"] = {
	key = "C_PlayerInfo.GetClass",
	name = "GetClass",
	category = "combat_midnight",
	subcategory = "c_playerinfo",
	func = _G["C_PlayerInfo"] and _G["C_PlayerInfo"]["GetClass"],
	funcPath = "C_PlayerInfo.GetClass",
	params = {
		{
			name = "playerLocation",
			type = "PlayerLocation",
			default = nil,
			examples = {
				{ value = "target [1]", label = "Details" },
				{ value = "t [1]", label = "Details" },
				{ value = "t[1]", label = "Details" },
			},
		},
	},
	returns = {
		{ name = "className", type = "cstring", canBeSecret = false },
		{ name = "classFilename", type = "cstring", canBeSecret = false },
		{ name = "classID", type = "number", canBeSecret = false },
	},
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_PlayerInfo.GetContentDifficultyCreatureForPlayer"] = {
	key = "C_PlayerInfo.GetContentDifficultyCreatureForPlayer",
	name = "GetContentDifficultyCreatureForPlayer",
	category = "combat_midnight",
	subcategory = "c_playerinfo",
	func = _G["C_PlayerInfo"] and _G["C_PlayerInfo"]["GetContentDifficultyCreatureForPlayer"],
	funcPath = "C_PlayerInfo.GetContentDifficultyCreatureForPlayer",
	params = {
		{
			name = "unitToken",
			type = "UnitToken",
			default = "player",
			examples = { { value = [=[LT["Unit"]]=], label = "Leatrix_Plus" } },
		},
	},
	returns = { { name = "difficulty", type = "RelativeContentDifficulty", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_PlayerInfo.GetContentDifficultyQuestForPlayer"] = {
	key = "C_PlayerInfo.GetContentDifficultyQuestForPlayer",
	name = "GetContentDifficultyQuestForPlayer",
	category = "combat_midnight",
	subcategory = "c_playerinfo",
	func = _G["C_PlayerInfo"] and _G["C_PlayerInfo"]["GetContentDifficultyQuestForPlayer"],
	funcPath = "C_PlayerInfo.GetContentDifficultyQuestForPlayer",
	params = { { name = "questID", type = "number", default = nil } },
	returns = { { name = "difficulty", type = "RelativeContentDifficulty", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_PlayerInfo.GetInstancesUnlockedAtLevel"] = {
	key = "C_PlayerInfo.GetInstancesUnlockedAtLevel",
	name = "GetInstancesUnlockedAtLevel",
	category = "combat_midnight",
	subcategory = "c_playerinfo",
	func = _G["C_PlayerInfo"] and _G["C_PlayerInfo"]["GetInstancesUnlockedAtLevel"],
	funcPath = "C_PlayerInfo.GetInstancesUnlockedAtLevel",
	params = { { name = "level", type = "number", default = nil }, { name = "isRaid", type = "bool", default = nil } },
	returns = { { name = "dungeonID", type = "table", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_PlayerInfo.GetName"] = {
	key = "C_PlayerInfo.GetName",
	name = "GetName",
	category = "combat_midnight",
	subcategory = "c_playerinfo",
	func = _G["C_PlayerInfo"] and _G["C_PlayerInfo"]["GetName"],
	funcPath = "C_PlayerInfo.GetName",
	params = {
		{
			name = "playerLocation",
			type = "PlayerLocation",
			default = nil,
			examples = { { value = "id", label = "Narcissus" } },
		},
	},
	returns = { { name = "name", type = "string", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_PlayerInfo.GetPetStableCreatureDisplayInfoID"] = {
	key = "C_PlayerInfo.GetPetStableCreatureDisplayInfoID",
	name = "GetPetStableCreatureDisplayInfoID",
	category = "combat_midnight",
	subcategory = "c_playerinfo",
	func = _G["C_PlayerInfo"] and _G["C_PlayerInfo"]["GetPetStableCreatureDisplayInfoID"],
	funcPath = "C_PlayerInfo.GetPetStableCreatureDisplayInfoID",
	params = { { name = "index", type = "number", default = nil } },
	returns = { { name = "creatureDisplayInfoID", type = "number", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_PlayerInfo.GetPlayerMythicPlusRatingSummary"] = {
	key = "C_PlayerInfo.GetPlayerMythicPlusRatingSummary",
	name = "GetPlayerMythicPlusRatingSummary",
	category = "combat_midnight",
	subcategory = "c_playerinfo",
	func = _G["C_PlayerInfo"] and _G["C_PlayerInfo"]["GetPlayerMythicPlusRatingSummary"],
	funcPath = "C_PlayerInfo.GetPlayerMythicPlusRatingSummary",
	params = {
		{
			name = "playerToken",
			type = "UnitToken",
			default = "player",
			examples = {
				{ value = "player", label = "AstralKeys" },
				{ value = "unit", label = "Narcissus" },
				{ value = [=[LT["Unit"]]=], label = "!Mechanic" },
			},
		},
	},
	returns = { { name = "ratingSummary", type = "MythicPlusRatingSummary", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_PlayerInfo.GetRace"] = {
	key = "C_PlayerInfo.GetRace",
	name = "GetRace",
	category = "combat_midnight",
	subcategory = "c_playerinfo",
	func = _G["C_PlayerInfo"] and _G["C_PlayerInfo"]["GetRace"],
	funcPath = "C_PlayerInfo.GetRace",
	params = { { name = "playerLocation", type = "PlayerLocation", default = nil } },
	returns = { { name = "raceID", type = "number", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_PlayerInfo.GetSex"] = {
	key = "C_PlayerInfo.GetSex",
	name = "GetSex",
	category = "combat_midnight",
	subcategory = "c_playerinfo",
	func = _G["C_PlayerInfo"] and _G["C_PlayerInfo"]["GetSex"],
	funcPath = "C_PlayerInfo.GetSex",
	params = { { name = "playerLocation", type = "PlayerLocation", default = nil } },
	returns = { { name = "sex", type = "UnitSex", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_PlayerInfo.HasVisibleInvSlot"] = {
	key = "C_PlayerInfo.HasVisibleInvSlot",
	name = "HasVisibleInvSlot",
	category = "combat_midnight",
	subcategory = "c_playerinfo",
	func = _G["C_PlayerInfo"] and _G["C_PlayerInfo"]["HasVisibleInvSlot"],
	funcPath = "C_PlayerInfo.HasVisibleInvSlot",
	params = { { name = "slot", type = "luaIndex", default = nil } },
	returns = { { name = "isVisible", type = "bool", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_PlayerInfo.IsConnected"] = {
	key = "C_PlayerInfo.IsConnected",
	name = "IsConnected",
	category = "combat_midnight",
	subcategory = "c_playerinfo",
	func = _G["C_PlayerInfo"] and _G["C_PlayerInfo"]["IsConnected"],
	funcPath = "C_PlayerInfo.IsConnected",
	params = { { name = "playerLocation", type = "PlayerLocation", default = nil } },
	returns = { { name = "isConnected", type = "bool", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_PlayerInfo.UnitIsSameServer"] = {
	key = "C_PlayerInfo.UnitIsSameServer",
	name = "UnitIsSameServer",
	category = "combat_midnight",
	subcategory = "c_playerinfo",
	func = _G["C_PlayerInfo"] and _G["C_PlayerInfo"]["UnitIsSameServer"],
	funcPath = "C_PlayerInfo.UnitIsSameServer",
	params = {
		{
			name = "playerLocation",
			type = "PlayerLocation",
			default = nil,
			examples = { { value = "unit", label = "Details" } },
		},
	},
	returns = { { name = "unitIsSameServer", type = "bool", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}
