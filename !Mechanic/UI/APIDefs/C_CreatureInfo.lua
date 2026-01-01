-- Generated APIDefinitions for namespace: C_CreatureInfo
local _, ns = ...
local APIDefs = ns.APIDefinitions

APIDefs["C_CreatureInfo.GetClassInfo"] = {
	key = "C_CreatureInfo.GetClassInfo",
	name = "GetClassInfo",
	category = "combat_midnight",
	subcategory = "c_creatureinfo",
	func = _G["C_CreatureInfo"] and _G["C_CreatureInfo"]["GetClassInfo"],
	funcPath = "C_CreatureInfo.GetClassInfo",
	params = {
		{
			name = "classID",
			type = "number",
			default = nil,
			examples = {
				{ value = "playerInfo.class or 0", label = "Details" },
				{ value = "playerClassTable[playerTable[1]] or 0", label = "Details" },
				{ value = 1, label = "MRT" },
			},
		},
	},
	returns = { { name = "classInfo", type = "ClassInfo", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_CreatureInfo.GetCreatureFamilyInfo"] = {
	key = "C_CreatureInfo.GetCreatureFamilyInfo",
	name = "GetCreatureFamilyInfo",
	category = "combat_midnight",
	subcategory = "c_creatureinfo",
	func = _G["C_CreatureInfo"] and _G["C_CreatureInfo"]["GetCreatureFamilyInfo"],
	funcPath = "C_CreatureInfo.GetCreatureFamilyInfo",
	params = { { name = "creatureFamilyID", type = "number", default = nil } },
	returns = { { name = "creatureFamilyInfo", type = "CreatureFamilyInfo", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_CreatureInfo.GetCreatureID"] = {
	key = "C_CreatureInfo.GetCreatureID",
	name = "GetCreatureID",
	category = "combat_midnight",
	subcategory = "c_creatureinfo",
	func = _G["C_CreatureInfo"] and _G["C_CreatureInfo"]["GetCreatureID"],
	funcPath = "C_CreatureInfo.GetCreatureID",
	params = { { name = "creatureGUID", type = "WOWGUID", default = nil } },
	returns = { { name = "creatureID", type = "number", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_CreatureInfo.GetCreatureTypeInfo"] = {
	key = "C_CreatureInfo.GetCreatureTypeInfo",
	name = "GetCreatureTypeInfo",
	category = "combat_midnight",
	subcategory = "c_creatureinfo",
	func = _G["C_CreatureInfo"] and _G["C_CreatureInfo"]["GetCreatureTypeInfo"],
	funcPath = "C_CreatureInfo.GetCreatureTypeInfo",
	params = { { name = "creatureTypeID", type = "number", default = nil } },
	returns = { { name = "creatureTypeInfo", type = "CreatureTypeInfo", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_CreatureInfo.GetFactionInfo"] = {
	key = "C_CreatureInfo.GetFactionInfo",
	name = "GetFactionInfo",
	category = "combat_midnight",
	subcategory = "c_creatureinfo",
	func = _G["C_CreatureInfo"] and _G["C_CreatureInfo"]["GetFactionInfo"],
	funcPath = "C_CreatureInfo.GetFactionInfo",
	params = { { name = "raceID", type = "number", default = nil } },
	returns = { { name = "factionInfo", type = "FactionInfo", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_CreatureInfo.GetRaceInfo"] = {
	key = "C_CreatureInfo.GetRaceInfo",
	name = "GetRaceInfo",
	category = "combat_midnight",
	subcategory = "c_creatureinfo",
	func = _G["C_CreatureInfo"] and _G["C_CreatureInfo"]["GetRaceInfo"],
	funcPath = "C_CreatureInfo.GetRaceInfo",
	params = { { name = "raceID", type = "number", default = nil } },
	returns = { { name = "raceInfo", type = "RaceInfo", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}
