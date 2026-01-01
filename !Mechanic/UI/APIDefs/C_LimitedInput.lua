-- Generated APIDefinitions for namespace: C_LimitedInput
local _, ns = ...
local APIDefs = ns.APIDefinitions

APIDefs["C_LimitedInput.LimitedInputAllowed"] = {
	key = "C_LimitedInput.LimitedInputAllowed",
	name = "LimitedInputAllowed",
	category = "combat_midnight",
	subcategory = "c_limitedinput",
	func = _G["C_LimitedInput"] and _G["C_LimitedInput"]["LimitedInputAllowed"],
	funcPath = "C_LimitedInput.LimitedInputAllowed",
	params = { { name = "type", type = "LimitedInputType", default = nil } },
	returns = { { name = "allowed", type = "bool", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}
