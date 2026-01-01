-- Generated APIDefinitions for namespace: C_AssistedCombat
local _, ns = ...
local APIDefs = ns.APIDefinitions

APIDefs["C_AssistedCombat.GetNextCastSpell"] = {
	key = "C_AssistedCombat.GetNextCastSpell",
	name = "GetNextCastSpell",
	category = "combat_midnight",
	subcategory = "c_assistedcombat",
	func = _G["C_AssistedCombat"] and _G["C_AssistedCombat"]["GetNextCastSpell"],
	funcPath = "C_AssistedCombat.GetNextCastSpell",
	params = { { name = "checkForVisibleButton", type = "bool", default = false } },
	returns = { { name = "spellID", type = "number", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}
