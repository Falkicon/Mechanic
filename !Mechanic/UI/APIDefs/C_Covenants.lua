-- Generated APIDefinitions for namespace: C_Covenants
local _, ns = ...
local APIDefs = ns.APIDefinitions

APIDefs["C_Covenants.GetCovenantData"] = {
	key = "C_Covenants.GetCovenantData",
	name = "GetCovenantData",
	category = "combat_midnight",
	subcategory = "c_covenants",
	func = _G["C_Covenants"] and _G["C_Covenants"]["GetCovenantData"],
	funcPath = "C_Covenants.GetCovenantData",
	params = {
		{ name = "covenantID", type = "number", default = nil, examples = { { value = "id", label = "ClassyMap" } } },
	},
	returns = { { name = "data", type = "CovenantData", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}
