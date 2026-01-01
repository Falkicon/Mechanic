-- Generated APIDefinitions for namespace: C_MajorFactions
local _, ns = ...
local APIDefs = ns.APIDefinitions

APIDefs["C_MajorFactions.GetCurrentRenownLevel"] = {
	key = "C_MajorFactions.GetCurrentRenownLevel",
	name = "GetCurrentRenownLevel",
	category = "combat_midnight",
	subcategory = "c_majorfactions",
	func = _G["C_MajorFactions"] and _G["C_MajorFactions"]["GetCurrentRenownLevel"],
	funcPath = "C_MajorFactions.GetCurrentRenownLevel",
	params = {
		{
			name = "majorFactionID",
			type = "number",
			default = nil,
			examples = { { value = 2658, label = "Plumber" }, { value = 2722, label = "Plumber" } },
		},
	},
	returns = { { name = "level", type = "number", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_MajorFactions.GetMajorFactionData"] = {
	key = "C_MajorFactions.GetMajorFactionData",
	name = "GetMajorFactionData",
	category = "combat_midnight",
	subcategory = "c_majorfactions",
	func = _G["C_MajorFactions"] and _G["C_MajorFactions"]["GetMajorFactionData"],
	funcPath = "C_MajorFactions.GetMajorFactionData",
	params = { { name = "majorFactionID", type = "number", default = nil } },
	returns = { { name = "data", type = "MajorFactionData", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_MajorFactions.GetMajorFactionIDs"] = {
	key = "C_MajorFactions.GetMajorFactionIDs",
	name = "GetMajorFactionIDs",
	category = "combat_midnight",
	subcategory = "c_majorfactions",
	func = _G["C_MajorFactions"] and _G["C_MajorFactions"]["GetMajorFactionIDs"],
	funcPath = "C_MajorFactions.GetMajorFactionIDs",
	params = {
		{ name = "expansionID", type = "number", default = nil, examples = { { value = 10, label = "AllTheThings" } } },
	},
	returns = { { name = "majorFactionIDs", type = "table", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_MajorFactions.GetMajorFactionRenownInfo"] = {
	key = "C_MajorFactions.GetMajorFactionRenownInfo",
	name = "GetMajorFactionRenownInfo",
	category = "combat_midnight",
	subcategory = "c_majorfactions",
	func = _G["C_MajorFactions"] and _G["C_MajorFactions"]["GetMajorFactionRenownInfo"],
	funcPath = "C_MajorFactions.GetMajorFactionRenownInfo",
	params = { { name = "majorFactionID", type = "number", default = nil } },
	returns = { { name = "data", type = "MajorFactionRenownInfo", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_MajorFactions.GetRenownLevels"] = {
	key = "C_MajorFactions.GetRenownLevels",
	name = "GetRenownLevels",
	category = "combat_midnight",
	subcategory = "c_majorfactions",
	func = _G["C_MajorFactions"] and _G["C_MajorFactions"]["GetRenownLevels"],
	funcPath = "C_MajorFactions.GetRenownLevels",
	params = { { name = "majorFactionID", type = "number", default = nil } },
	returns = { { name = "levels", type = "table", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_MajorFactions.GetRenownRewardsForLevel"] = {
	key = "C_MajorFactions.GetRenownRewardsForLevel",
	name = "GetRenownRewardsForLevel",
	category = "combat_midnight",
	subcategory = "c_majorfactions",
	func = _G["C_MajorFactions"] and _G["C_MajorFactions"]["GetRenownRewardsForLevel"],
	funcPath = "C_MajorFactions.GetRenownRewardsForLevel",
	params = {
		{
			name = "majorFactionID",
			type = "number",
			default = nil,
			examples = { { value = "factionID", label = "Plumber" } },
		},
		{ name = "renownLevel", type = "number", default = nil },
	},
	returns = { { name = "rewards", type = "table", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_MajorFactions.HasMaximumRenown"] = {
	key = "C_MajorFactions.HasMaximumRenown",
	name = "HasMaximumRenown",
	category = "combat_midnight",
	subcategory = "c_majorfactions",
	func = _G["C_MajorFactions"] and _G["C_MajorFactions"]["HasMaximumRenown"],
	funcPath = "C_MajorFactions.HasMaximumRenown",
	params = { { name = "majorFactionID", type = "number", default = nil } },
	returns = { { name = "hasMaxRenown", type = "bool", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_MajorFactions.IsMajorFactionHiddenFromExpansionPage"] = {
	key = "C_MajorFactions.IsMajorFactionHiddenFromExpansionPage",
	name = "IsMajorFactionHiddenFromExpansionPage",
	category = "combat_midnight",
	subcategory = "c_majorfactions",
	func = _G["C_MajorFactions"] and _G["C_MajorFactions"]["IsMajorFactionHiddenFromExpansionPage"],
	funcPath = "C_MajorFactions.IsMajorFactionHiddenFromExpansionPage",
	params = { { name = "majorFactionID", type = "number", default = nil } },
	returns = { { name = "isHidden", type = "bool", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_MajorFactions.IsWeeklyRenownCapped"] = {
	key = "C_MajorFactions.IsWeeklyRenownCapped",
	name = "IsWeeklyRenownCapped",
	category = "combat_midnight",
	subcategory = "c_majorfactions",
	func = _G["C_MajorFactions"] and _G["C_MajorFactions"]["IsWeeklyRenownCapped"],
	funcPath = "C_MajorFactions.IsWeeklyRenownCapped",
	params = { { name = "majorFactionID", type = "number", default = nil } },
	returns = { { name = "isWeeklyCapped", type = "bool", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_MajorFactions.ShouldDisplayMajorFactionAsJourney"] = {
	key = "C_MajorFactions.ShouldDisplayMajorFactionAsJourney",
	name = "ShouldDisplayMajorFactionAsJourney",
	category = "combat_midnight",
	subcategory = "c_majorfactions",
	func = _G["C_MajorFactions"] and _G["C_MajorFactions"]["ShouldDisplayMajorFactionAsJourney"],
	funcPath = "C_MajorFactions.ShouldDisplayMajorFactionAsJourney",
	params = { { name = "majorFactionID", type = "number", default = nil } },
	returns = { { name = "shouldDisplayMajorFactionAsJourney", type = "bool", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_MajorFactions.ShouldUseJourneyRewardTrack"] = {
	key = "C_MajorFactions.ShouldUseJourneyRewardTrack",
	name = "ShouldUseJourneyRewardTrack",
	category = "combat_midnight",
	subcategory = "c_majorfactions",
	func = _G["C_MajorFactions"] and _G["C_MajorFactions"]["ShouldUseJourneyRewardTrack"],
	funcPath = "C_MajorFactions.ShouldUseJourneyRewardTrack",
	params = { { name = "majorFactionID", type = "number", default = nil } },
	returns = { { name = "shouldUseJourneyRewardTrack", type = "bool", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}
