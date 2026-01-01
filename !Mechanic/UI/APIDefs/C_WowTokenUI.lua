-- Generated APIDefinitions for namespace: C_WowTokenUI
local _, ns = ...
local APIDefs = ns.APIDefinitions

APIDefs["C_WowTokenUI.StartTokenSell"] = {
	key = "C_WowTokenUI.StartTokenSell",
	name = "StartTokenSell",
	category = "combat_midnight",
	subcategory = "c_wowtokenui",
	func = _G["C_WowTokenUI"] and _G["C_WowTokenUI"]["StartTokenSell"],
	funcPath = "C_WowTokenUI.StartTokenSell",
	params = { { name = "tokenGUID", type = "WOWGUID", default = nil } },
	returns = {},
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}
