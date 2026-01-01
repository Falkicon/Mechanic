-- Generated APIDefinitions for namespace: C_CovenantSanctumUI
local _, ns = ...
local APIDefs = ns.APIDefinitions

APIDefs["C_CovenantSanctumUI.GetRenownLevels"] = {
	key = "C_CovenantSanctumUI.GetRenownLevels",
	name = "GetRenownLevels",
	category = "combat_midnight",
	subcategory = "c_covenantsanctumui",
	func = _G["C_CovenantSanctumUI"] and _G["C_CovenantSanctumUI"]["GetRenownLevels"],
	funcPath = "C_CovenantSanctumUI.GetRenownLevels",
	params = { { name = "covenantID", type = "number", default = nil } },
	returns = { { name = "levels", type = "table", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_CovenantSanctumUI.GetRenownRewardsForLevel"] = {
	key = "C_CovenantSanctumUI.GetRenownRewardsForLevel",
	name = "GetRenownRewardsForLevel",
	category = "combat_midnight",
	subcategory = "c_covenantsanctumui",
	func = _G["C_CovenantSanctumUI"] and _G["C_CovenantSanctumUI"]["GetRenownRewardsForLevel"],
	funcPath = "C_CovenantSanctumUI.GetRenownRewardsForLevel",
	params = {
		{
			name = "covenantID",
			type = "number",
			default = nil,
			examples = { { value = "factionID", label = "Plumber" } },
		},
		{ name = "renownLevel", type = "number", default = nil },
	},
	returns = { { name = "rewards", type = "table", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}
