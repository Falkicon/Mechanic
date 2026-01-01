-- Generated APIDefinitions for namespace: C_MapExplorationInfo
local _, ns = ...
local APIDefs = ns.APIDefinitions

APIDefs["C_MapExplorationInfo.GetExploredAreaIDsAtPosition"] = {
	key = "C_MapExplorationInfo.GetExploredAreaIDsAtPosition",
	name = "GetExploredAreaIDsAtPosition",
	category = "combat_midnight",
	subcategory = "c_mapexplorationinfo",
	func = _G["C_MapExplorationInfo"] and _G["C_MapExplorationInfo"]["GetExploredAreaIDsAtPosition"],
	funcPath = "C_MapExplorationInfo.GetExploredAreaIDsAtPosition",
	params = {
		{
			name = "uiMapID",
			type = "number",
			default = nil,
			examples = {
				{ value = "ATTC.RealMapID", label = "AllTheThings" },
				{ value = 109, label = "Narcissus_Barbershop" },
			},
		},
		{ name = "normalizedPosition", type = "vector2", default = nil },
	},
	returns = { { name = "areaID", type = "table", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_MapExplorationInfo.GetExploredMapTextures"] = {
	key = "C_MapExplorationInfo.GetExploredMapTextures",
	name = "GetExploredMapTextures",
	category = "combat_midnight",
	subcategory = "c_mapexplorationinfo",
	func = _G["C_MapExplorationInfo"] and _G["C_MapExplorationInfo"]["GetExploredMapTextures"],
	funcPath = "C_MapExplorationInfo.GetExploredMapTextures",
	params = {
		{ name = "uiMapID", type = "number", default = nil, examples = { { value = 118, label = "Narcissus" } } },
	},
	returns = { { name = "overlayInfo", type = "table", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}
