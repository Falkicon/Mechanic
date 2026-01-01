-- Generated APIDefinitions for namespace: C_RaidLocks
local _, ns = ...
local APIDefs = ns.APIDefinitions

APIDefs["C_RaidLocks.GetRedirectedDifficultyID"] = {
	key = "C_RaidLocks.GetRedirectedDifficultyID",
	name = "GetRedirectedDifficultyID",
	category = "combat_midnight",
	subcategory = "c_raidlocks",
	func = _G["C_RaidLocks"] and _G["C_RaidLocks"]["GetRedirectedDifficultyID"],
	funcPath = "C_RaidLocks.GetRedirectedDifficultyID",
	params = {
		{ name = "mapID", type = "number", default = nil },
		{ name = "difficultyID", type = "number", default = nil },
	},
	returns = { { name = "redirectedDifficultyID", type = "number", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_RaidLocks.IsEncounterComplete"] = {
	key = "C_RaidLocks.IsEncounterComplete",
	name = "IsEncounterComplete",
	category = "combat_midnight",
	subcategory = "c_raidlocks",
	func = _G["C_RaidLocks"] and _G["C_RaidLocks"]["IsEncounterComplete"],
	funcPath = "C_RaidLocks.IsEncounterComplete",
	params = {
		{ name = "mapID", type = "number", default = nil },
		{ name = "encounterID", type = "number", default = nil },
		{ name = "difficultyID", type = "number", default = nil },
	},
	returns = { { name = "encounterIsComplete", type = "bool", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}
