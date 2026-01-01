-- Generated APIDefinitions for namespace: C_PerksActivities
local _, ns = ...
local APIDefs = ns.APIDefinitions

APIDefs["C_PerksActivities.AddTrackedPerksActivity"] = {
	key = "C_PerksActivities.AddTrackedPerksActivity",
	name = "AddTrackedPerksActivity",
	category = "combat_midnight",
	subcategory = "c_perksactivities",
	func = _G["C_PerksActivities"] and _G["C_PerksActivities"]["AddTrackedPerksActivity"],
	funcPath = "C_PerksActivities.AddTrackedPerksActivity",
	params = { { name = "perksActivityID", type = "number", default = nil } },
	returns = {},
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_PerksActivities.GetPerksActivityChatLink"] = {
	key = "C_PerksActivities.GetPerksActivityChatLink",
	name = "GetPerksActivityChatLink",
	category = "combat_midnight",
	subcategory = "c_perksactivities",
	func = _G["C_PerksActivities"] and _G["C_PerksActivities"]["GetPerksActivityChatLink"],
	funcPath = "C_PerksActivities.GetPerksActivityChatLink",
	params = { { name = "perksActivityID", type = "number", default = nil } },
	returns = { { name = "link", type = "cstring", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_PerksActivities.GetPerksActivityInfo"] = {
	key = "C_PerksActivities.GetPerksActivityInfo",
	name = "GetPerksActivityInfo",
	category = "combat_midnight",
	subcategory = "c_perksactivities",
	func = _G["C_PerksActivities"] and _G["C_PerksActivities"]["GetPerksActivityInfo"],
	funcPath = "C_PerksActivities.GetPerksActivityInfo",
	params = { { name = "perksActivityID", type = "number", default = nil } },
	returns = { { name = "info", type = "PerksActivityInfo", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_PerksActivities.RemoveTrackedPerksActivity"] = {
	key = "C_PerksActivities.RemoveTrackedPerksActivity",
	name = "RemoveTrackedPerksActivity",
	category = "combat_midnight",
	subcategory = "c_perksactivities",
	func = _G["C_PerksActivities"] and _G["C_PerksActivities"]["RemoveTrackedPerksActivity"],
	funcPath = "C_PerksActivities.RemoveTrackedPerksActivity",
	params = { { name = "perksActivityID", type = "number", default = nil } },
	returns = {},
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}
