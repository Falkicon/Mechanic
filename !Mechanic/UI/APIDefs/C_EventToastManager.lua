-- Generated APIDefinitions for namespace: C_EventToastManager
local _, ns = ...
local APIDefs = ns.APIDefinitions

APIDefs["C_EventToastManager.GetLevelUpDisplayToastsFromLevel"] = {
	key = "C_EventToastManager.GetLevelUpDisplayToastsFromLevel",
	name = "GetLevelUpDisplayToastsFromLevel",
	category = "combat_midnight",
	subcategory = "c_eventtoastmanager",
	func = _G["C_EventToastManager"] and _G["C_EventToastManager"]["GetLevelUpDisplayToastsFromLevel"],
	funcPath = "C_EventToastManager.GetLevelUpDisplayToastsFromLevel",
	params = { { name = "level", type = "number", default = nil } },
	returns = { { name = "toastInfo", type = "table", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}
