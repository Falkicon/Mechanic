-- Generated APIDefinitions for namespace: C_LFGInfo
local _, ns = ...
local APIDefs = ns.APIDefinitions

APIDefs["C_LFGInfo.AreCrossFactionGroupQueuesAllowed"] = {
	key = "C_LFGInfo.AreCrossFactionGroupQueuesAllowed",
	name = "AreCrossFactionGroupQueuesAllowed",
	category = "combat_midnight",
	subcategory = "c_lfginfo",
	func = _G["C_LFGInfo"] and _G["C_LFGInfo"]["AreCrossFactionGroupQueuesAllowed"],
	funcPath = "C_LFGInfo.AreCrossFactionGroupQueuesAllowed",
	params = { { name = "lfgDungeonID", type = "number", default = nil } },
	returns = { { name = "areCrossFactionGroupQueuesAllowed", type = "bool", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_LFGInfo.DoesActivePartyMeetPremadeLaunchCount"] = {
	key = "C_LFGInfo.DoesActivePartyMeetPremadeLaunchCount",
	name = "DoesActivePartyMeetPremadeLaunchCount",
	category = "combat_midnight",
	subcategory = "c_lfginfo",
	func = _G["C_LFGInfo"] and _G["C_LFGInfo"]["DoesActivePartyMeetPremadeLaunchCount"],
	funcPath = "C_LFGInfo.DoesActivePartyMeetPremadeLaunchCount",
	params = { { name = "lfgDungeonID", type = "number", default = nil } },
	returns = { { name = "doesActivePartyMeetPremadeLaunchCount", type = "bool", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_LFGInfo.DoesCrossFactionQueueRequireFullPremade"] = {
	key = "C_LFGInfo.DoesCrossFactionQueueRequireFullPremade",
	name = "DoesCrossFactionQueueRequireFullPremade",
	category = "combat_midnight",
	subcategory = "c_lfginfo",
	func = _G["C_LFGInfo"] and _G["C_LFGInfo"]["DoesCrossFactionQueueRequireFullPremade"],
	funcPath = "C_LFGInfo.DoesCrossFactionQueueRequireFullPremade",
	params = { { name = "lfgDungeonID", type = "number", default = nil } },
	returns = { { name = "doesCrossFactionQueueRequireFullPremade", type = "bool", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_LFGInfo.GetAllEntriesForCategory"] = {
	key = "C_LFGInfo.GetAllEntriesForCategory",
	name = "GetAllEntriesForCategory",
	category = "combat_midnight",
	subcategory = "c_lfginfo",
	func = _G["C_LFGInfo"] and _G["C_LFGInfo"]["GetAllEntriesForCategory"],
	funcPath = "C_LFGInfo.GetAllEntriesForCategory",
	params = { { name = "category", type = "luaIndex", default = nil } },
	returns = { { name = "lfgDungeonIDs", type = "table", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_LFGInfo.GetDungeonInfo"] = {
	key = "C_LFGInfo.GetDungeonInfo",
	name = "GetDungeonInfo",
	category = "combat_midnight",
	subcategory = "c_lfginfo",
	func = _G["C_LFGInfo"] and _G["C_LFGInfo"]["GetDungeonInfo"],
	funcPath = "C_LFGInfo.GetDungeonInfo",
	params = {
		{
			name = "lfgDungeonID",
			type = "number",
			default = nil,
			examples = { { value = "id", label = "DBM-Core" }, { value = "string.sub(name", label = "DBM-Core" } },
		},
	},
	returns = { { name = "dungeonInfo", type = "LFGDungeonInfo", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_LFGInfo.GetLevelUpInstances"] = {
	key = "C_LFGInfo.GetLevelUpInstances",
	name = "GetLevelUpInstances",
	category = "combat_midnight",
	subcategory = "c_lfginfo",
	func = _G["C_LFGInfo"] and _G["C_LFGInfo"]["GetLevelUpInstances"],
	funcPath = "C_LFGInfo.GetLevelUpInstances",
	params = {
		{ name = "currPlayerLevel", type = "number", default = nil },
		{ name = "isRaid", type = "bool", default = nil },
	},
	returns = { { name = "instances", type = "table", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_LFGInfo.HideNameFromUI"] = {
	key = "C_LFGInfo.HideNameFromUI",
	name = "HideNameFromUI",
	category = "combat_midnight",
	subcategory = "c_lfginfo",
	func = _G["C_LFGInfo"] and _G["C_LFGInfo"]["HideNameFromUI"],
	funcPath = "C_LFGInfo.HideNameFromUI",
	params = { { name = "dungeonID", type = "number", default = nil } },
	returns = { { name = "shouldHide", type = "bool", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_LFGInfo.IsLFGFollowerDungeon"] = {
	key = "C_LFGInfo.IsLFGFollowerDungeon",
	name = "IsLFGFollowerDungeon",
	category = "combat_midnight",
	subcategory = "c_lfginfo",
	func = _G["C_LFGInfo"] and _G["C_LFGInfo"]["IsLFGFollowerDungeon"],
	funcPath = "C_LFGInfo.IsLFGFollowerDungeon",
	params = { { name = "dungeonID", type = "number", default = nil } },
	returns = { { name = "result", type = "bool", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}
