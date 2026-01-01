-- Generated APIDefinitions for namespace: C_Reputation
local _, ns = ...
local APIDefs = ns.APIDefinitions

APIDefs["C_Reputation.CollapseFactionHeader"] = {
	key = "C_Reputation.CollapseFactionHeader",
	name = "CollapseFactionHeader",
	category = "combat_midnight",
	subcategory = "c_reputation",
	func = _G["C_Reputation"] and _G["C_Reputation"]["CollapseFactionHeader"],
	funcPath = "C_Reputation.CollapseFactionHeader",
	params = { { name = "factionSortIndex", type = "luaIndex", default = nil } },
	returns = {},
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Reputation.ExpandFactionHeader"] = {
	key = "C_Reputation.ExpandFactionHeader",
	name = "ExpandFactionHeader",
	category = "combat_midnight",
	subcategory = "c_reputation",
	func = _G["C_Reputation"] and _G["C_Reputation"]["ExpandFactionHeader"],
	funcPath = "C_Reputation.ExpandFactionHeader",
	params = { { name = "factionSortIndex", type = "luaIndex", default = nil } },
	returns = {},
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Reputation.GetFactionDataByID"] = {
	key = "C_Reputation.GetFactionDataByID",
	name = "GetFactionDataByID",
	category = "combat_midnight",
	subcategory = "c_reputation",
	func = _G["C_Reputation"] and _G["C_Reputation"]["GetFactionDataByID"],
	funcPath = "C_Reputation.GetFactionDataByID",
	params = {
		{
			name = "factionID",
			type = "number",
			default = nil,
			examples = { { value = "id", label = "Details" }, { value = 989, label = "Leatrix_Maps" } },
		},
	},
	returns = { { name = "factionData", type = "FactionData", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Reputation.GetFactionDataByIndex"] = {
	key = "C_Reputation.GetFactionDataByIndex",
	name = "GetFactionDataByIndex",
	category = "combat_midnight",
	subcategory = "c_reputation",
	func = _G["C_Reputation"] and _G["C_Reputation"]["GetFactionDataByIndex"],
	funcPath = "C_Reputation.GetFactionDataByIndex",
	params = { { name = "factionSortIndex", type = "luaIndex", default = nil } },
	returns = { { name = "factionData", type = "FactionData", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Reputation.GetFactionParagonInfo"] = {
	key = "C_Reputation.GetFactionParagonInfo",
	name = "GetFactionParagonInfo",
	category = "combat_midnight",
	subcategory = "c_reputation",
	func = _G["C_Reputation"] and _G["C_Reputation"]["GetFactionParagonInfo"],
	funcPath = "C_Reputation.GetFactionParagonInfo",
	params = { { name = "factionID", type = "number", default = nil } },
	returns = {
		{ name = "currentValue", type = "number", canBeSecret = false },
		{ name = "threshold", type = "number", canBeSecret = false },
		{ name = "rewardQuestID", type = "number", canBeSecret = false },
		{ name = "hasRewardPending", type = "bool", canBeSecret = false },
		{ name = "tooLowLevelForParagon", type = "bool", canBeSecret = false },
		{ name = "paragonStorageLevel", type = "number", canBeSecret = false },
	},
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Reputation.IsAccountWideReputation"] = {
	key = "C_Reputation.IsAccountWideReputation",
	name = "IsAccountWideReputation",
	category = "combat_midnight",
	subcategory = "c_reputation",
	func = _G["C_Reputation"] and _G["C_Reputation"]["IsAccountWideReputation"],
	funcPath = "C_Reputation.IsAccountWideReputation",
	params = { { name = "factionID", type = "number", default = nil } },
	returns = { { name = "isAccountWide", type = "bool", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Reputation.IsFactionActive"] = {
	key = "C_Reputation.IsFactionActive",
	name = "IsFactionActive",
	category = "combat_midnight",
	subcategory = "c_reputation",
	func = _G["C_Reputation"] and _G["C_Reputation"]["IsFactionActive"],
	funcPath = "C_Reputation.IsFactionActive",
	params = { { name = "factionSortIndex", type = "luaIndex", default = nil } },
	returns = { { name = "isActive", type = "bool", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Reputation.IsFactionParagon"] = {
	key = "C_Reputation.IsFactionParagon",
	name = "IsFactionParagon",
	category = "combat_midnight",
	subcategory = "c_reputation",
	func = _G["C_Reputation"] and _G["C_Reputation"]["IsFactionParagon"],
	funcPath = "C_Reputation.IsFactionParagon",
	params = { { name = "factionID", type = "number", default = nil } },
	returns = { { name = "factionIsParagon", type = "bool", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Reputation.IsFactionParagonForCurrentPlayer"] = {
	key = "C_Reputation.IsFactionParagonForCurrentPlayer",
	name = "IsFactionParagonForCurrentPlayer",
	category = "combat_midnight",
	subcategory = "c_reputation",
	func = _G["C_Reputation"] and _G["C_Reputation"]["IsFactionParagonForCurrentPlayer"],
	funcPath = "C_Reputation.IsFactionParagonForCurrentPlayer",
	params = { { name = "factionID", type = "number", default = nil } },
	returns = { { name = "currentPlayerHasParagon", type = "bool", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Reputation.IsMajorFaction"] = {
	key = "C_Reputation.IsMajorFaction",
	name = "IsMajorFaction",
	category = "combat_midnight",
	subcategory = "c_reputation",
	func = _G["C_Reputation"] and _G["C_Reputation"]["IsMajorFaction"],
	funcPath = "C_Reputation.IsMajorFaction",
	params = { { name = "factionID", type = "number", default = nil } },
	returns = { { name = "isMajorFaction", type = "bool", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Reputation.RequestFactionParagonPreloadRewardData"] = {
	key = "C_Reputation.RequestFactionParagonPreloadRewardData",
	name = "RequestFactionParagonPreloadRewardData",
	category = "combat_midnight",
	subcategory = "c_reputation",
	func = _G["C_Reputation"] and _G["C_Reputation"]["RequestFactionParagonPreloadRewardData"],
	funcPath = "C_Reputation.RequestFactionParagonPreloadRewardData",
	params = { { name = "factionID", type = "number", default = nil } },
	returns = {},
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Reputation.SetFactionActive"] = {
	key = "C_Reputation.SetFactionActive",
	name = "SetFactionActive",
	category = "combat_midnight",
	subcategory = "c_reputation",
	func = _G["C_Reputation"] and _G["C_Reputation"]["SetFactionActive"],
	funcPath = "C_Reputation.SetFactionActive",
	params = {
		{ name = "factionSortIndex", type = "luaIndex", default = nil },
		{ name = "setActive", type = "bool", default = nil },
	},
	returns = {},
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Reputation.SetLegacyReputationsShown"] = {
	key = "C_Reputation.SetLegacyReputationsShown",
	name = "SetLegacyReputationsShown",
	category = "combat_midnight",
	subcategory = "c_reputation",
	func = _G["C_Reputation"] and _G["C_Reputation"]["SetLegacyReputationsShown"],
	funcPath = "C_Reputation.SetLegacyReputationsShown",
	params = { { name = "showLegacyReputations", type = "bool", default = nil } },
	returns = {},
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Reputation.SetReputationSortType"] = {
	key = "C_Reputation.SetReputationSortType",
	name = "SetReputationSortType",
	category = "combat_midnight",
	subcategory = "c_reputation",
	func = _G["C_Reputation"] and _G["C_Reputation"]["SetReputationSortType"],
	funcPath = "C_Reputation.SetReputationSortType",
	params = {
		{
			name = "sortType",
			type = "ReputationSortType",
			default = nil,
			examples = { { value = 0, label = "WeakAuras" } },
		},
	},
	returns = {},
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Reputation.SetSelectedFaction"] = {
	key = "C_Reputation.SetSelectedFaction",
	name = "SetSelectedFaction",
	category = "combat_midnight",
	subcategory = "c_reputation",
	func = _G["C_Reputation"] and _G["C_Reputation"]["SetSelectedFaction"],
	funcPath = "C_Reputation.SetSelectedFaction",
	params = { { name = "factionSortIndex", type = "luaIndex", default = nil } },
	returns = {},
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Reputation.SetWatchedFactionByID"] = {
	key = "C_Reputation.SetWatchedFactionByID",
	name = "SetWatchedFactionByID",
	category = "combat_midnight",
	subcategory = "c_reputation",
	func = _G["C_Reputation"] and _G["C_Reputation"]["SetWatchedFactionByID"],
	funcPath = "C_Reputation.SetWatchedFactionByID",
	params = { { name = "factionID", type = "number", default = nil } },
	returns = {},
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Reputation.SetWatchedFactionByIndex"] = {
	key = "C_Reputation.SetWatchedFactionByIndex",
	name = "SetWatchedFactionByIndex",
	category = "combat_midnight",
	subcategory = "c_reputation",
	func = _G["C_Reputation"] and _G["C_Reputation"]["SetWatchedFactionByIndex"],
	funcPath = "C_Reputation.SetWatchedFactionByIndex",
	params = { { name = "factionSortIndex", type = "luaIndex", default = nil } },
	returns = {},
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Reputation.ToggleFactionAtWar"] = {
	key = "C_Reputation.ToggleFactionAtWar",
	name = "ToggleFactionAtWar",
	category = "combat_midnight",
	subcategory = "c_reputation",
	func = _G["C_Reputation"] and _G["C_Reputation"]["ToggleFactionAtWar"],
	funcPath = "C_Reputation.ToggleFactionAtWar",
	params = { { name = "factionSortIndex", type = "luaIndex", default = nil } },
	returns = {},
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}
