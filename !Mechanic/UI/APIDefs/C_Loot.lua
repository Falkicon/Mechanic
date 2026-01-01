-- Generated APIDefinitions for namespace: C_Loot
local _, ns = ...
local APIDefs = ns.APIDefinitions

APIDefs["C_Loot.GetLootRollDuration"] = {
	key = "C_Loot.GetLootRollDuration",
	name = "GetLootRollDuration",
	category = "combat_midnight",
	subcategory = "c_loot",
	func = _G["C_Loot"] and _G["C_Loot"]["GetLootRollDuration"],
	funcPath = "C_Loot.GetLootRollDuration",
	params = { { name = "rollID", type = "number", default = nil } },
	returns = { { name = "duration", type = "number", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}
