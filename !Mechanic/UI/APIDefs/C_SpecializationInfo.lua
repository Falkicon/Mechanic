-- Generated APIDefinitions for namespace: C_SpecializationInfo
local _, ns = ...
local APIDefs = ns.APIDefinitions

APIDefs["C_SpecializationInfo.GetActiveSpecGroup"] = {
	key = "C_SpecializationInfo.GetActiveSpecGroup",
	name = "GetActiveSpecGroup",
	category = "combat_midnight",
	subcategory = "c_specializationinfo",
	func = _G["C_SpecializationInfo"] and _G["C_SpecializationInfo"]["GetActiveSpecGroup"],
	funcPath = "C_SpecializationInfo.GetActiveSpecGroup",
	params = { { name = "isInspect", type = "bool", default = nil }, { name = "isPet", type = "bool", default = nil } },
	returns = { { name = "groupIndex", type = "luaIndex", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_SpecializationInfo.GetClassIDFromSpecID"] = {
	key = "C_SpecializationInfo.GetClassIDFromSpecID",
	name = "GetClassIDFromSpecID",
	category = "combat_midnight",
	subcategory = "c_specializationinfo",
	func = _G["C_SpecializationInfo"] and _G["C_SpecializationInfo"]["GetClassIDFromSpecID"],
	funcPath = "C_SpecializationInfo.GetClassIDFromSpecID",
	params = { { name = "specID", type = "number", default = nil } },
	returns = { { name = "classID", type = "number", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_SpecializationInfo.GetInspectSelectedPvpTalent"] = {
	key = "C_SpecializationInfo.GetInspectSelectedPvpTalent",
	name = "GetInspectSelectedPvpTalent",
	category = "combat_midnight",
	subcategory = "c_specializationinfo",
	func = _G["C_SpecializationInfo"] and _G["C_SpecializationInfo"]["GetInspectSelectedPvpTalent"],
	funcPath = "C_SpecializationInfo.GetInspectSelectedPvpTalent",
	params = {
		{
			name = "inspectedUnit",
			type = "UnitToken",
			default = "player",
			examples = { { value = "unit", label = "Narcissus" } },
		},
		{ name = "talentIndex", type = "number", default = nil },
	},
	returns = { { name = "selectedTalentID", type = "number", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_SpecializationInfo.GetNumSpecializationsForClassID"] = {
	key = "C_SpecializationInfo.GetNumSpecializationsForClassID",
	name = "GetNumSpecializationsForClassID",
	category = "combat_midnight",
	subcategory = "c_specializationinfo",
	func = _G["C_SpecializationInfo"] and _G["C_SpecializationInfo"]["GetNumSpecializationsForClassID"],
	funcPath = "C_SpecializationInfo.GetNumSpecializationsForClassID",
	params = { { name = "classID", type = "number", default = nil } },
	returns = { { name = "specCount", type = "number", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_SpecializationInfo.GetPvpTalentInfo"] = {
	key = "C_SpecializationInfo.GetPvpTalentInfo",
	name = "GetPvpTalentInfo",
	category = "combat_midnight",
	subcategory = "c_specializationinfo",
	func = _G["C_SpecializationInfo"] and _G["C_SpecializationInfo"]["GetPvpTalentInfo"],
	funcPath = "C_SpecializationInfo.GetPvpTalentInfo",
	params = { { name = "talentID", type = "number", default = nil } },
	returns = { { name = "talentInfo", type = "PvpTalentInfo", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_SpecializationInfo.GetPvpTalentSlotInfo"] = {
	key = "C_SpecializationInfo.GetPvpTalentSlotInfo",
	name = "GetPvpTalentSlotInfo",
	category = "combat_midnight",
	subcategory = "c_specializationinfo",
	func = _G["C_SpecializationInfo"] and _G["C_SpecializationInfo"]["GetPvpTalentSlotInfo"],
	funcPath = "C_SpecializationInfo.GetPvpTalentSlotInfo",
	params = {
		{
			name = "talentIndex",
			type = "number",
			default = nil,
			examples = { { value = 1, label = "WeakAuras" }, { value = "i - 3", label = "Narcissus" } },
		},
	},
	returns = { { name = "slotInfo", type = "PvpTalentSlotInfo", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_SpecializationInfo.GetPvpTalentSlotUnlockLevel"] = {
	key = "C_SpecializationInfo.GetPvpTalentSlotUnlockLevel",
	name = "GetPvpTalentSlotUnlockLevel",
	category = "combat_midnight",
	subcategory = "c_specializationinfo",
	func = _G["C_SpecializationInfo"] and _G["C_SpecializationInfo"]["GetPvpTalentSlotUnlockLevel"],
	funcPath = "C_SpecializationInfo.GetPvpTalentSlotUnlockLevel",
	params = { { name = "talentIndex", type = "number", default = nil } },
	returns = { { name = "requiredLevel", type = "number", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_SpecializationInfo.GetPvpTalentUnlockLevel"] = {
	key = "C_SpecializationInfo.GetPvpTalentUnlockLevel",
	name = "GetPvpTalentUnlockLevel",
	category = "combat_midnight",
	subcategory = "c_specializationinfo",
	func = _G["C_SpecializationInfo"] and _G["C_SpecializationInfo"]["GetPvpTalentUnlockLevel"],
	funcPath = "C_SpecializationInfo.GetPvpTalentUnlockLevel",
	params = { { name = "talentID", type = "number", default = nil } },
	returns = { { name = "requiredLevel", type = "number", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_SpecializationInfo.GetSpecIDs"] = {
	key = "C_SpecializationInfo.GetSpecIDs",
	name = "GetSpecIDs",
	category = "combat_midnight",
	subcategory = "c_specializationinfo",
	func = _G["C_SpecializationInfo"] and _G["C_SpecializationInfo"]["GetSpecIDs"],
	funcPath = "C_SpecializationInfo.GetSpecIDs",
	params = { { name = "specSetID", type = "number", default = nil } },
	returns = { { name = "specIDs", type = "table", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_SpecializationInfo.GetSpecialization"] = {
	key = "C_SpecializationInfo.GetSpecialization",
	name = "GetSpecialization",
	category = "combat_midnight",
	subcategory = "c_specializationinfo",
	func = _G["C_SpecializationInfo"] and _G["C_SpecializationInfo"]["GetSpecialization"],
	funcPath = "C_SpecializationInfo.GetSpecialization",
	params = {
		{ name = "isInspect", type = "bool", default = nil },
		{ name = "isPet", type = "bool", default = nil },
		{ name = "specGroupIndex", type = "luaIndex", default = nil },
	},
	returns = { { name = "specializationIndex", type = "luaIndex", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_SpecializationInfo.GetSpecializationInfo"] = {
	key = "C_SpecializationInfo.GetSpecializationInfo",
	name = "GetSpecializationInfo",
	category = "combat_midnight",
	subcategory = "c_specializationinfo",
	func = _G["C_SpecializationInfo"] and _G["C_SpecializationInfo"]["GetSpecializationInfo"],
	funcPath = "C_SpecializationInfo.GetSpecializationInfo",
	params = {
		{
			name = "specializationIndex",
			type = "luaIndex",
			default = nil,
			examples = {
				{ value = "Private.ExecEnv.GetSpecialization() or 0", label = "WeakAuras" },
				{ value = "C_SpecializationInfo.GetSpecialization() or 1", label = "DandersFrames" },
				{ value = "spec", label = "DejaCharacterStats" },
			},
		},
		{ name = "isInspect", type = "bool", default = false },
		{ name = "isPet", type = "bool", default = false },
		{ name = "inspectTarget", type = "string", default = nil },
		{ name = "sex", type = "number", default = nil },
		{ name = "groupIndex", type = "luaIndex", default = nil },
		{ name = "classID", type = "number", default = nil },
	},
	returns = {
		{ name = "specId", type = "number", canBeSecret = false },
		{ name = "name", type = "string", canBeSecret = false },
		{ name = "description", type = "string", canBeSecret = false },
		{ name = "icon", type = "fileID", canBeSecret = false },
		{ name = "role", type = "string", canBeSecret = false },
		{ name = "primaryStat", type = "luaIndex", canBeSecret = false },
		{ name = "pointsSpent", type = "number", canBeSecret = false },
		{ name = "background", type = "string", canBeSecret = false },
		{ name = "previewPointsSpent", type = "number", canBeSecret = false },
		{ name = "isUnlocked", type = "bool", canBeSecret = false },
	},
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_SpecializationInfo.GetSpecializationMasterySpells"] = {
	key = "C_SpecializationInfo.GetSpecializationMasterySpells",
	name = "GetSpecializationMasterySpells",
	category = "combat_midnight",
	subcategory = "c_specializationinfo",
	func = _G["C_SpecializationInfo"] and _G["C_SpecializationInfo"]["GetSpecializationMasterySpells"],
	funcPath = "C_SpecializationInfo.GetSpecializationMasterySpells",
	params = {
		{ name = "specializationIndex", type = "luaIndex", default = nil },
		{ name = "isInspect", type = "bool", default = nil },
		{ name = "isPet", type = "bool", default = nil },
	},
	returns = { { name = "spellIDs", type = "table", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_SpecializationInfo.GetSpellsDisplay"] = {
	key = "C_SpecializationInfo.GetSpellsDisplay",
	name = "GetSpellsDisplay",
	category = "combat_midnight",
	subcategory = "c_specializationinfo",
	func = _G["C_SpecializationInfo"] and _G["C_SpecializationInfo"]["GetSpellsDisplay"],
	funcPath = "C_SpecializationInfo.GetSpellsDisplay",
	params = { { name = "specializationID", type = "number", default = nil } },
	returns = { { name = "spellID", type = "table", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_SpecializationInfo.GetTalentInfo"] = {
	key = "C_SpecializationInfo.GetTalentInfo",
	name = "GetTalentInfo",
	category = "combat_midnight",
	subcategory = "c_specializationinfo",
	func = _G["C_SpecializationInfo"] and _G["C_SpecializationInfo"]["GetTalentInfo"],
	funcPath = "C_SpecializationInfo.GetTalentInfo",
	params = {
		{
			name = "query",
			type = "TalentInfoQuery",
			default = nil,
			examples = {
				{ value = "{       tier = math.ceil(index / 3)", label = "WeakAuras" },
				{ value = "{tier=tier", label = "MRT" },
				{ value = "tier", label = "WeakAuras" },
			},
		},
	},
	returns = { { name = "result", type = "TalentInfoResult", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_SpecializationInfo.IsPvpTalentLocked"] = {
	key = "C_SpecializationInfo.IsPvpTalentLocked",
	name = "IsPvpTalentLocked",
	category = "combat_midnight",
	subcategory = "c_specializationinfo",
	func = _G["C_SpecializationInfo"] and _G["C_SpecializationInfo"]["IsPvpTalentLocked"],
	funcPath = "C_SpecializationInfo.IsPvpTalentLocked",
	params = { { name = "talentID", type = "number", default = nil } },
	returns = { { name = "locked", type = "bool", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_SpecializationInfo.MatchesCurrentSpecSet"] = {
	key = "C_SpecializationInfo.MatchesCurrentSpecSet",
	name = "MatchesCurrentSpecSet",
	category = "combat_midnight",
	subcategory = "c_specializationinfo",
	func = _G["C_SpecializationInfo"] and _G["C_SpecializationInfo"]["MatchesCurrentSpecSet"],
	funcPath = "C_SpecializationInfo.MatchesCurrentSpecSet",
	params = { { name = "specSetID", type = "number", default = nil } },
	returns = { { name = "matches", type = "bool", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_SpecializationInfo.SetPetSpecialization"] = {
	key = "C_SpecializationInfo.SetPetSpecialization",
	name = "SetPetSpecialization",
	category = "combat_midnight",
	subcategory = "c_specializationinfo",
	func = _G["C_SpecializationInfo"] and _G["C_SpecializationInfo"]["SetPetSpecialization"],
	funcPath = "C_SpecializationInfo.SetPetSpecialization",
	params = {
		{ name = "specIndex", type = "luaIndex", default = nil },
		{ name = "petNumber", type = "number", default = nil },
	},
	returns = {},
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_SpecializationInfo.SetPvpTalentLocked"] = {
	key = "C_SpecializationInfo.SetPvpTalentLocked",
	name = "SetPvpTalentLocked",
	category = "combat_midnight",
	subcategory = "c_specializationinfo",
	func = _G["C_SpecializationInfo"] and _G["C_SpecializationInfo"]["SetPvpTalentLocked"],
	funcPath = "C_SpecializationInfo.SetPvpTalentLocked",
	params = {
		{ name = "talentID", type = "number", default = nil },
		{ name = "locked", type = "bool", default = nil },
	},
	returns = {},
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_SpecializationInfo.SetSpecialization"] = {
	key = "C_SpecializationInfo.SetSpecialization",
	name = "SetSpecialization",
	category = "combat_midnight",
	subcategory = "c_specializationinfo",
	func = _G["C_SpecializationInfo"] and _G["C_SpecializationInfo"]["SetSpecialization"],
	funcPath = "C_SpecializationInfo.SetSpecialization",
	params = {
		{
			name = "specIndex",
			type = "luaIndex",
			default = nil,
			examples = {
				{ value = 1, label = "Details" },
				{ value = 2, label = "Details" },
				{ value = 3, label = "Details" },
			},
		},
	},
	returns = { { name = "success", type = "bool", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}
