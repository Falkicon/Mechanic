-- Generated APIDefinitions for namespace: C_CooldownViewer
local _, ns = ...
local APIDefs = ns.APIDefinitions

APIDefs["C_CooldownViewer.GetCooldownViewerCategorySet"] = {
	key = "C_CooldownViewer.GetCooldownViewerCategorySet",
	name = "GetCooldownViewerCategorySet",
	category = "combat_midnight",
	subcategory = "c_cooldownviewer",
	func = _G["C_CooldownViewer"] and _G["C_CooldownViewer"]["GetCooldownViewerCategorySet"],
	funcPath = "C_CooldownViewer.GetCooldownViewerCategorySet",
	params = {
		{ name = "category", type = "CooldownViewerCategory", default = nil },
		{ name = "allowUnlearned", type = "bool", default = false },
	},
	returns = { { name = "cooldownIDs", type = "table", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_CooldownViewer.GetCooldownViewerCooldownInfo"] = {
	key = "C_CooldownViewer.GetCooldownViewerCooldownInfo",
	name = "GetCooldownViewerCooldownInfo",
	category = "combat_midnight",
	subcategory = "c_cooldownviewer",
	func = _G["C_CooldownViewer"] and _G["C_CooldownViewer"]["GetCooldownViewerCooldownInfo"],
	funcPath = "C_CooldownViewer.GetCooldownViewerCooldownInfo",
	params = { { name = "cooldownID", type = "number", default = nil } },
	returns = { { name = "cooldownInfo", type = "CooldownViewerCooldown", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_CooldownViewer.GetValidAlertTypes"] = {
	key = "C_CooldownViewer.GetValidAlertTypes",
	name = "GetValidAlertTypes",
	category = "combat_midnight",
	subcategory = "c_cooldownviewer",
	func = _G["C_CooldownViewer"] and _G["C_CooldownViewer"]["GetValidAlertTypes"],
	funcPath = "C_CooldownViewer.GetValidAlertTypes",
	params = { { name = "cooldownID", type = "number", default = nil } },
	returns = { { name = "validAlertTypes", type = "table", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_CooldownViewer.SetLayoutData"] = {
	key = "C_CooldownViewer.SetLayoutData",
	name = "SetLayoutData",
	category = "combat_midnight",
	subcategory = "c_cooldownviewer",
	func = _G["C_CooldownViewer"] and _G["C_CooldownViewer"]["SetLayoutData"],
	funcPath = "C_CooldownViewer.SetLayoutData",
	params = { { name = "data", type = "cstring", default = nil } },
	returns = {},
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}
