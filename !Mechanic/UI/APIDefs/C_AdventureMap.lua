-- Generated APIDefinitions for namespace: C_AdventureMap
local _, ns = ...
local APIDefs = ns.APIDefinitions

APIDefs["C_AdventureMap.GetQuestPortraitInfo"] = {
	key = "C_AdventureMap.GetQuestPortraitInfo",
	name = "GetQuestPortraitInfo",
	category = "combat_midnight",
	subcategory = "c_adventuremap",
	func = _G["C_AdventureMap"] and _G["C_AdventureMap"]["GetQuestPortraitInfo"],
	funcPath = "C_AdventureMap.GetQuestPortraitInfo",
	params = { { name = "questID", type = "number", default = nil } },
	returns = { { name = "info", type = "AdventureMapQuestPortraitInfo", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}
