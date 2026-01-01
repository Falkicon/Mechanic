-- Generated APIDefinitions for namespace: C_RestrictedActions
local _, ns = ...
local APIDefs = ns.APIDefinitions

APIDefs["C_RestrictedActions.CheckAllowProtectedFunctions"] = {
	key = "C_RestrictedActions.CheckAllowProtectedFunctions",
	name = "CheckAllowProtectedFunctions",
	category = "combat_midnight",
	subcategory = "c_restrictedactions",
	func = _G["C_RestrictedActions"] and _G["C_RestrictedActions"]["CheckAllowProtectedFunctions"],
	funcPath = "C_RestrictedActions.CheckAllowProtectedFunctions",
	params = {
		{ name = "object", type = "FrameScriptObject", default = nil },
		{ name = "silent", type = "bool", default = false },
	},
	returns = { { name = "protectedFunctionsAllowed", type = "bool", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_RestrictedActions.GetAddOnRestrictionState"] = {
	key = "C_RestrictedActions.GetAddOnRestrictionState",
	name = "GetAddOnRestrictionState",
	category = "combat_midnight",
	subcategory = "c_restrictedactions",
	func = _G["C_RestrictedActions"] and _G["C_RestrictedActions"]["GetAddOnRestrictionState"],
	funcPath = "C_RestrictedActions.GetAddOnRestrictionState",
	params = { { name = "type", type = "AddOnRestrictionType", default = nil } },
	returns = { { name = "state", type = "AddOnRestrictionState", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_RestrictedActions.IsAddOnRestrictionActive"] = {
	key = "C_RestrictedActions.IsAddOnRestrictionActive",
	name = "IsAddOnRestrictionActive",
	category = "combat_midnight",
	subcategory = "c_restrictedactions",
	func = _G["C_RestrictedActions"] and _G["C_RestrictedActions"]["IsAddOnRestrictionActive"],
	funcPath = "C_RestrictedActions.IsAddOnRestrictionActive",
	params = { { name = "type", type = "AddOnRestrictionType", default = nil } },
	returns = { { name = "active", type = "bool", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}
