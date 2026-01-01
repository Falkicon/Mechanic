-- Generated APIDefinitions for namespace: C_ProfSpecs
local _, ns = ...
local APIDefs = ns.APIDefinitions

APIDefs["C_ProfSpecs.CanRefundPath"] = {
	key = "C_ProfSpecs.CanRefundPath",
	name = "CanRefundPath",
	category = "combat_midnight",
	subcategory = "c_profspecs",
	func = _G["C_ProfSpecs"] and _G["C_ProfSpecs"]["CanRefundPath"],
	funcPath = "C_ProfSpecs.CanRefundPath",
	params = {
		{ name = "pathID", type = "number", default = nil },
		{ name = "configID", type = "number", default = nil },
	},
	returns = { { name = "canRefund", type = "bool", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_ProfSpecs.CanUnlockTab"] = {
	key = "C_ProfSpecs.CanUnlockTab",
	name = "CanUnlockTab",
	category = "combat_midnight",
	subcategory = "c_profspecs",
	func = _G["C_ProfSpecs"] and _G["C_ProfSpecs"]["CanUnlockTab"],
	funcPath = "C_ProfSpecs.CanUnlockTab",
	params = {
		{ name = "tabTreeID", type = "number", default = nil },
		{ name = "configID", type = "number", default = nil },
	},
	returns = { { name = "canUnlock", type = "bool", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_ProfSpecs.GetChildrenForPath"] = {
	key = "C_ProfSpecs.GetChildrenForPath",
	name = "GetChildrenForPath",
	category = "combat_midnight",
	subcategory = "c_profspecs",
	func = _G["C_ProfSpecs"] and _G["C_ProfSpecs"]["GetChildrenForPath"],
	funcPath = "C_ProfSpecs.GetChildrenForPath",
	params = { { name = "pathID", type = "number", default = nil } },
	returns = { { name = "childIDs", type = "table", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_ProfSpecs.GetConfigIDForSkillLine"] = {
	key = "C_ProfSpecs.GetConfigIDForSkillLine",
	name = "GetConfigIDForSkillLine",
	category = "combat_midnight",
	subcategory = "c_profspecs",
	func = _G["C_ProfSpecs"] and _G["C_ProfSpecs"]["GetConfigIDForSkillLine"],
	funcPath = "C_ProfSpecs.GetConfigIDForSkillLine",
	params = { { name = "skillLineID", type = "number", default = nil } },
	returns = { { name = "configID", type = "number", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_ProfSpecs.GetCurrencyInfoForSkillLine"] = {
	key = "C_ProfSpecs.GetCurrencyInfoForSkillLine",
	name = "GetCurrencyInfoForSkillLine",
	category = "combat_midnight",
	subcategory = "c_profspecs",
	func = _G["C_ProfSpecs"] and _G["C_ProfSpecs"]["GetCurrencyInfoForSkillLine"],
	funcPath = "C_ProfSpecs.GetCurrencyInfoForSkillLine",
	params = { { name = "skillLineID", type = "number", default = nil } },
	returns = { { name = "info", type = "SpecializationCurrencyInfo", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_ProfSpecs.GetDescriptionForPath"] = {
	key = "C_ProfSpecs.GetDescriptionForPath",
	name = "GetDescriptionForPath",
	category = "combat_midnight",
	subcategory = "c_profspecs",
	func = _G["C_ProfSpecs"] and _G["C_ProfSpecs"]["GetDescriptionForPath"],
	funcPath = "C_ProfSpecs.GetDescriptionForPath",
	params = { { name = "pathID", type = "number", default = nil } },
	returns = { { name = "description", type = "string", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_ProfSpecs.GetDescriptionForPerk"] = {
	key = "C_ProfSpecs.GetDescriptionForPerk",
	name = "GetDescriptionForPerk",
	category = "combat_midnight",
	subcategory = "c_profspecs",
	func = _G["C_ProfSpecs"] and _G["C_ProfSpecs"]["GetDescriptionForPerk"],
	funcPath = "C_ProfSpecs.GetDescriptionForPerk",
	params = { { name = "perkID", type = "number", default = nil } },
	returns = { { name = "description", type = "string", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_ProfSpecs.GetEntryIDForPerk"] = {
	key = "C_ProfSpecs.GetEntryIDForPerk",
	name = "GetEntryIDForPerk",
	category = "combat_midnight",
	subcategory = "c_profspecs",
	func = _G["C_ProfSpecs"] and _G["C_ProfSpecs"]["GetEntryIDForPerk"],
	funcPath = "C_ProfSpecs.GetEntryIDForPerk",
	params = { { name = "perkID", type = "number", default = nil } },
	returns = { { name = "entryID", type = "number", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_ProfSpecs.GetPerksForPath"] = {
	key = "C_ProfSpecs.GetPerksForPath",
	name = "GetPerksForPath",
	category = "combat_midnight",
	subcategory = "c_profspecs",
	func = _G["C_ProfSpecs"] and _G["C_ProfSpecs"]["GetPerksForPath"],
	funcPath = "C_ProfSpecs.GetPerksForPath",
	params = { { name = "pathID", type = "number", default = nil } },
	returns = { { name = "perkInfos", type = "table", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_ProfSpecs.GetRootPathForTab"] = {
	key = "C_ProfSpecs.GetRootPathForTab",
	name = "GetRootPathForTab",
	category = "combat_midnight",
	subcategory = "c_profspecs",
	func = _G["C_ProfSpecs"] and _G["C_ProfSpecs"]["GetRootPathForTab"],
	funcPath = "C_ProfSpecs.GetRootPathForTab",
	params = { { name = "tabTreeID", type = "number", default = nil } },
	returns = { { name = "rootPathID", type = "number", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_ProfSpecs.GetSourceTextForPath"] = {
	key = "C_ProfSpecs.GetSourceTextForPath",
	name = "GetSourceTextForPath",
	category = "combat_midnight",
	subcategory = "c_profspecs",
	func = _G["C_ProfSpecs"] and _G["C_ProfSpecs"]["GetSourceTextForPath"],
	funcPath = "C_ProfSpecs.GetSourceTextForPath",
	params = {
		{ name = "pathID", type = "number", default = nil },
		{ name = "configID", type = "number", default = nil },
	},
	returns = { { name = "sourceText", type = "cstring", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_ProfSpecs.GetSpecTabIDsForSkillLine"] = {
	key = "C_ProfSpecs.GetSpecTabIDsForSkillLine",
	name = "GetSpecTabIDsForSkillLine",
	category = "combat_midnight",
	subcategory = "c_profspecs",
	func = _G["C_ProfSpecs"] and _G["C_ProfSpecs"]["GetSpecTabIDsForSkillLine"],
	funcPath = "C_ProfSpecs.GetSpecTabIDsForSkillLine",
	params = { { name = "skillLineID", type = "number", default = nil } },
	returns = { { name = "specTabIDs", type = "table", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_ProfSpecs.GetSpendCurrencyForPath"] = {
	key = "C_ProfSpecs.GetSpendCurrencyForPath",
	name = "GetSpendCurrencyForPath",
	category = "combat_midnight",
	subcategory = "c_profspecs",
	func = _G["C_ProfSpecs"] and _G["C_ProfSpecs"]["GetSpendCurrencyForPath"],
	funcPath = "C_ProfSpecs.GetSpendCurrencyForPath",
	params = { { name = "pathID", type = "number", default = nil } },
	returns = { { name = "currencyID", type = "number", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_ProfSpecs.GetSpendEntryForPath"] = {
	key = "C_ProfSpecs.GetSpendEntryForPath",
	name = "GetSpendEntryForPath",
	category = "combat_midnight",
	subcategory = "c_profspecs",
	func = _G["C_ProfSpecs"] and _G["C_ProfSpecs"]["GetSpendEntryForPath"],
	funcPath = "C_ProfSpecs.GetSpendEntryForPath",
	params = { { name = "pathID", type = "number", default = nil } },
	returns = { { name = "entryID", type = "number", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_ProfSpecs.GetStateForPath"] = {
	key = "C_ProfSpecs.GetStateForPath",
	name = "GetStateForPath",
	category = "combat_midnight",
	subcategory = "c_profspecs",
	func = _G["C_ProfSpecs"] and _G["C_ProfSpecs"]["GetStateForPath"],
	funcPath = "C_ProfSpecs.GetStateForPath",
	params = {
		{ name = "pathID", type = "number", default = nil },
		{ name = "configID", type = "number", default = nil },
	},
	returns = { { name = "state", type = "ProfessionsSpecPathState", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_ProfSpecs.GetStateForPerk"] = {
	key = "C_ProfSpecs.GetStateForPerk",
	name = "GetStateForPerk",
	category = "combat_midnight",
	subcategory = "c_profspecs",
	func = _G["C_ProfSpecs"] and _G["C_ProfSpecs"]["GetStateForPerk"],
	funcPath = "C_ProfSpecs.GetStateForPerk",
	params = {
		{ name = "perkID", type = "number", default = nil },
		{ name = "configID", type = "number", default = nil },
	},
	returns = { { name = "state", type = "ProfessionsSpecPerkState", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_ProfSpecs.GetStateForTab"] = {
	key = "C_ProfSpecs.GetStateForTab",
	name = "GetStateForTab",
	category = "combat_midnight",
	subcategory = "c_profspecs",
	func = _G["C_ProfSpecs"] and _G["C_ProfSpecs"]["GetStateForTab"],
	funcPath = "C_ProfSpecs.GetStateForTab",
	params = {
		{ name = "tabTreeID", type = "number", default = nil },
		{ name = "configID", type = "number", default = nil },
	},
	returns = { { name = "tabInfo", type = "ProfessionsSpecTabState", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_ProfSpecs.GetTabInfo"] = {
	key = "C_ProfSpecs.GetTabInfo",
	name = "GetTabInfo",
	category = "combat_midnight",
	subcategory = "c_profspecs",
	func = _G["C_ProfSpecs"] and _G["C_ProfSpecs"]["GetTabInfo"],
	funcPath = "C_ProfSpecs.GetTabInfo",
	params = { { name = "tabTreeID", type = "number", default = nil } },
	returns = { { name = "tabInfo", type = "ProfTabInfo", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_ProfSpecs.GetUnlockEntryForPath"] = {
	key = "C_ProfSpecs.GetUnlockEntryForPath",
	name = "GetUnlockEntryForPath",
	category = "combat_midnight",
	subcategory = "c_profspecs",
	func = _G["C_ProfSpecs"] and _G["C_ProfSpecs"]["GetUnlockEntryForPath"],
	funcPath = "C_ProfSpecs.GetUnlockEntryForPath",
	params = { { name = "pathID", type = "number", default = nil } },
	returns = { { name = "entryID", type = "number", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_ProfSpecs.GetUnlockRankForPerk"] = {
	key = "C_ProfSpecs.GetUnlockRankForPerk",
	name = "GetUnlockRankForPerk",
	category = "combat_midnight",
	subcategory = "c_profspecs",
	func = _G["C_ProfSpecs"] and _G["C_ProfSpecs"]["GetUnlockRankForPerk"],
	funcPath = "C_ProfSpecs.GetUnlockRankForPerk",
	params = { { name = "perkID", type = "number", default = nil } },
	returns = { { name = "unlockRank", type = "number", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_ProfSpecs.ShouldShowPointsReminderForSkillLine"] = {
	key = "C_ProfSpecs.ShouldShowPointsReminderForSkillLine",
	name = "ShouldShowPointsReminderForSkillLine",
	category = "combat_midnight",
	subcategory = "c_profspecs",
	func = _G["C_ProfSpecs"] and _G["C_ProfSpecs"]["ShouldShowPointsReminderForSkillLine"],
	funcPath = "C_ProfSpecs.ShouldShowPointsReminderForSkillLine",
	params = { { name = "skillLineID", type = "number", default = nil } },
	returns = { { name = "showReminder", type = "bool", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_ProfSpecs.SkillLineHasSpecialization"] = {
	key = "C_ProfSpecs.SkillLineHasSpecialization",
	name = "SkillLineHasSpecialization",
	category = "combat_midnight",
	subcategory = "c_profspecs",
	func = _G["C_ProfSpecs"] and _G["C_ProfSpecs"]["SkillLineHasSpecialization"],
	funcPath = "C_ProfSpecs.SkillLineHasSpecialization",
	params = { { name = "skillLineID", type = "number", default = nil } },
	returns = { { name = "hasSpecialization", type = "bool", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}
