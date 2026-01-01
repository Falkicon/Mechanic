-- Generated APIDefinitions for namespace: C_ContributionCollector
local _, ns = ...
local APIDefs = ns.APIDefinitions

APIDefs["C_ContributionCollector.Contribute"] = {
	key = "C_ContributionCollector.Contribute",
	name = "Contribute",
	category = "combat_midnight",
	subcategory = "c_contributioncollector",
	func = _G["C_ContributionCollector"] and _G["C_ContributionCollector"]["Contribute"],
	funcPath = "C_ContributionCollector.Contribute",
	params = {
		{
			name = "contributionID",
			type = "number",
			default = nil,
			examples = { { value = "not app.Contributor and 1", label = "AllTheThings" } },
		},
	},
	returns = {},
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_ContributionCollector.GetAtlases"] = {
	key = "C_ContributionCollector.GetAtlases",
	name = "GetAtlases",
	category = "combat_midnight",
	subcategory = "c_contributioncollector",
	func = _G["C_ContributionCollector"] and _G["C_ContributionCollector"]["GetAtlases"],
	funcPath = "C_ContributionCollector.GetAtlases",
	params = { { name = "contributionID", type = "number", default = nil } },
	returns = { { name = "atlasName", type = "table", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_ContributionCollector.GetBuffs"] = {
	key = "C_ContributionCollector.GetBuffs",
	name = "GetBuffs",
	category = "combat_midnight",
	subcategory = "c_contributioncollector",
	func = _G["C_ContributionCollector"] and _G["C_ContributionCollector"]["GetBuffs"],
	funcPath = "C_ContributionCollector.GetBuffs",
	params = { { name = "contributionID", type = "number", default = nil } },
	returns = { { name = "spellID", type = "number", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_ContributionCollector.GetContributionAppearance"] = {
	key = "C_ContributionCollector.GetContributionAppearance",
	name = "GetContributionAppearance",
	category = "combat_midnight",
	subcategory = "c_contributioncollector",
	func = _G["C_ContributionCollector"] and _G["C_ContributionCollector"]["GetContributionAppearance"],
	funcPath = "C_ContributionCollector.GetContributionAppearance",
	params = {
		{ name = "contributionID", type = "number", default = nil },
		{ name = "contributionState", type = "ContributionState", default = nil },
	},
	returns = { { name = "appearance", type = "ContributionAppearance", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_ContributionCollector.GetContributionCollectorsForMap"] = {
	key = "C_ContributionCollector.GetContributionCollectorsForMap",
	name = "GetContributionCollectorsForMap",
	category = "combat_midnight",
	subcategory = "c_contributioncollector",
	func = _G["C_ContributionCollector"] and _G["C_ContributionCollector"]["GetContributionCollectorsForMap"],
	funcPath = "C_ContributionCollector.GetContributionCollectorsForMap",
	params = { { name = "uiMapID", type = "number", default = nil } },
	returns = { { name = "contributionCollectors", type = "table", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_ContributionCollector.GetContributionResult"] = {
	key = "C_ContributionCollector.GetContributionResult",
	name = "GetContributionResult",
	category = "combat_midnight",
	subcategory = "c_contributioncollector",
	func = _G["C_ContributionCollector"] and _G["C_ContributionCollector"]["GetContributionResult"],
	funcPath = "C_ContributionCollector.GetContributionResult",
	params = { { name = "contributionID", type = "number", default = nil } },
	returns = { { name = "result", type = "ContributionResult", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_ContributionCollector.GetDescription"] = {
	key = "C_ContributionCollector.GetDescription",
	name = "GetDescription",
	category = "combat_midnight",
	subcategory = "c_contributioncollector",
	func = _G["C_ContributionCollector"] and _G["C_ContributionCollector"]["GetDescription"],
	funcPath = "C_ContributionCollector.GetDescription",
	params = { { name = "contributionID", type = "number", default = nil } },
	returns = { { name = "description", type = "cstring", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_ContributionCollector.GetManagedContributionsForCreatureID"] = {
	key = "C_ContributionCollector.GetManagedContributionsForCreatureID",
	name = "GetManagedContributionsForCreatureID",
	category = "combat_midnight",
	subcategory = "c_contributioncollector",
	func = _G["C_ContributionCollector"] and _G["C_ContributionCollector"]["GetManagedContributionsForCreatureID"],
	funcPath = "C_ContributionCollector.GetManagedContributionsForCreatureID",
	params = { { name = "creatureID", type = "number", default = nil } },
	returns = { { name = "contributionID", type = "number", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_ContributionCollector.GetName"] = {
	key = "C_ContributionCollector.GetName",
	name = "GetName",
	category = "combat_midnight",
	subcategory = "c_contributioncollector",
	func = _G["C_ContributionCollector"] and _G["C_ContributionCollector"]["GetName"],
	funcPath = "C_ContributionCollector.GetName",
	params = {
		{
			name = "contributionID",
			type = "number",
			default = nil,
			examples = { { value = "id", label = "Narcissus" } },
		},
	},
	returns = { { name = "name", type = "cstring", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_ContributionCollector.GetOrderIndex"] = {
	key = "C_ContributionCollector.GetOrderIndex",
	name = "GetOrderIndex",
	category = "combat_midnight",
	subcategory = "c_contributioncollector",
	func = _G["C_ContributionCollector"] and _G["C_ContributionCollector"]["GetOrderIndex"],
	funcPath = "C_ContributionCollector.GetOrderIndex",
	params = { { name = "contributionID", type = "number", default = nil } },
	returns = { { name = "orderIndex", type = "number", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_ContributionCollector.GetRequiredContributionCurrency"] = {
	key = "C_ContributionCollector.GetRequiredContributionCurrency",
	name = "GetRequiredContributionCurrency",
	category = "combat_midnight",
	subcategory = "c_contributioncollector",
	func = _G["C_ContributionCollector"] and _G["C_ContributionCollector"]["GetRequiredContributionCurrency"],
	funcPath = "C_ContributionCollector.GetRequiredContributionCurrency",
	params = { { name = "contributionID", type = "number", default = nil } },
	returns = {
		{ name = "currencyID", type = "number", canBeSecret = false },
		{ name = "currencyAmount", type = "number", canBeSecret = false },
	},
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_ContributionCollector.GetRequiredContributionItem"] = {
	key = "C_ContributionCollector.GetRequiredContributionItem",
	name = "GetRequiredContributionItem",
	category = "combat_midnight",
	subcategory = "c_contributioncollector",
	func = _G["C_ContributionCollector"] and _G["C_ContributionCollector"]["GetRequiredContributionItem"],
	funcPath = "C_ContributionCollector.GetRequiredContributionItem",
	params = { { name = "contributionID", type = "number", default = nil } },
	returns = {
		{ name = "itemID", type = "number", canBeSecret = false },
		{ name = "itemCount", type = "number", canBeSecret = false },
	},
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_ContributionCollector.GetRewardQuestID"] = {
	key = "C_ContributionCollector.GetRewardQuestID",
	name = "GetRewardQuestID",
	category = "combat_midnight",
	subcategory = "c_contributioncollector",
	func = _G["C_ContributionCollector"] and _G["C_ContributionCollector"]["GetRewardQuestID"],
	funcPath = "C_ContributionCollector.GetRewardQuestID",
	params = { { name = "contributionID", type = "number", default = nil } },
	returns = { { name = "questID", type = "number", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_ContributionCollector.GetState"] = {
	key = "C_ContributionCollector.GetState",
	name = "GetState",
	category = "combat_midnight",
	subcategory = "c_contributioncollector",
	func = _G["C_ContributionCollector"] and _G["C_ContributionCollector"]["GetState"],
	funcPath = "C_ContributionCollector.GetState",
	params = { { name = "contributionID", type = "number", default = nil } },
	returns = {
		{ name = "contributionState", type = "ContributionState", canBeSecret = false },
		{ name = "contributionPercentageComplete", type = "number", canBeSecret = false },
		{ name = "timeOfNextStateChange", type = "time_t", canBeSecret = false },
		{ name = "startTime", type = "time_t", canBeSecret = false },
	},
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_ContributionCollector.HasPendingContribution"] = {
	key = "C_ContributionCollector.HasPendingContribution",
	name = "HasPendingContribution",
	category = "combat_midnight",
	subcategory = "c_contributioncollector",
	func = _G["C_ContributionCollector"] and _G["C_ContributionCollector"]["HasPendingContribution"],
	funcPath = "C_ContributionCollector.HasPendingContribution",
	params = { { name = "contributionID", type = "number", default = nil } },
	returns = { { name = "hasPending", type = "bool", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_ContributionCollector.IsAwaitingRewardQuestData"] = {
	key = "C_ContributionCollector.IsAwaitingRewardQuestData",
	name = "IsAwaitingRewardQuestData",
	category = "combat_midnight",
	subcategory = "c_contributioncollector",
	func = _G["C_ContributionCollector"] and _G["C_ContributionCollector"]["IsAwaitingRewardQuestData"],
	funcPath = "C_ContributionCollector.IsAwaitingRewardQuestData",
	params = { { name = "contributionID", type = "number", default = nil } },
	returns = { { name = "awaitingData", type = "bool", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}
