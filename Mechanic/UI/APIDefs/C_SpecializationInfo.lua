-- Generated APIDefinitions for namespace: C_SpecializationInfo
local _, ns = ...
local APIDefs = ns.APIDefinitions

APIDefs["C_SpecializationInfo.CanPlayerUsePVPTalentUI"] = {
    key = "C_SpecializationInfo.CanPlayerUsePVPTalentUI",
    name = "CanPlayerUsePVPTalentUI",
    category = "general",
    subcategory = "c_specializationinfo",
    funcPath = "C_SpecializationInfo.CanPlayerUsePVPTalentUI",
    params = {  },
    returns = { { name = "canUse", type = "bool", canBeSecret = false }, { name = "failureReason", type = "string", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["C_SpecializationInfo.CanPlayerUseTalentSpecUI"] = {
    key = "C_SpecializationInfo.CanPlayerUseTalentSpecUI",
    name = "CanPlayerUseTalentSpecUI",
    category = "general",
    subcategory = "c_specializationinfo",
    funcPath = "C_SpecializationInfo.CanPlayerUseTalentSpecUI",
    params = {  },
    returns = { { name = "canUse", type = "bool", canBeSecret = false }, { name = "failureReason", type = "string", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["C_SpecializationInfo.CanPlayerUseTalentUI"] = {
    key = "C_SpecializationInfo.CanPlayerUseTalentUI",
    name = "CanPlayerUseTalentUI",
    category = "general",
    subcategory = "c_specializationinfo",
    funcPath = "C_SpecializationInfo.CanPlayerUseTalentUI",
    params = {  },
    returns = { { name = "canUse", type = "bool", canBeSecret = false }, { name = "failureReason", type = "string", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["C_SpecializationInfo.GetActiveSpecGroup"] = {
    key = "C_SpecializationInfo.GetActiveSpecGroup",
    name = "GetActiveSpecGroup",
    category = "general",
    subcategory = "c_specializationinfo",
    funcPath = "C_SpecializationInfo.GetActiveSpecGroup",
    params = { { name = "isInspect", type = "bool", default = nil }, { name = "isPet", type = "bool", default = nil } },
    returns = { { name = "groupIndex", type = "luaIndex", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_SpecializationInfo.GetAllSelectedPvpTalentIDs"] = {
    key = "C_SpecializationInfo.GetAllSelectedPvpTalentIDs",
    name = "GetAllSelectedPvpTalentIDs",
    category = "general",
    subcategory = "c_specializationinfo",
    funcPath = "C_SpecializationInfo.GetAllSelectedPvpTalentIDs",
    params = {  },
    returns = { { name = "selectedPvpTalentIDs", type = "table", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["C_SpecializationInfo.GetClassIDFromSpecID"] = {
    key = "C_SpecializationInfo.GetClassIDFromSpecID",
    name = "GetClassIDFromSpecID",
    category = "general",
    subcategory = "c_specializationinfo",
    funcPath = "C_SpecializationInfo.GetClassIDFromSpecID",
    params = { { name = "specID", type = "number", default = nil } },
    returns = { { name = "classID", type = "number", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_SpecializationInfo.GetInspectSelectedPvpTalent"] = {
    key = "C_SpecializationInfo.GetInspectSelectedPvpTalent",
    name = "GetInspectSelectedPvpTalent",
    category = "general",
    subcategory = "c_specializationinfo",
    funcPath = "C_SpecializationInfo.GetInspectSelectedPvpTalent",
    params = { { name = "inspectedUnit", type = "UnitToken", default = "player" }, { name = "talentIndex", type = "number", default = nil } },
    returns = { { name = "selectedTalentID", type = "number", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_SpecializationInfo.GetNumSpecializationsForClassID"] = {
    key = "C_SpecializationInfo.GetNumSpecializationsForClassID",
    name = "GetNumSpecializationsForClassID",
    category = "general",
    subcategory = "c_specializationinfo",
    funcPath = "C_SpecializationInfo.GetNumSpecializationsForClassID",
    params = { { name = "classID", type = "number", default = nil } },
    returns = { { name = "specCount", type = "number", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_SpecializationInfo.GetPvpTalentAlertStatus"] = {
    key = "C_SpecializationInfo.GetPvpTalentAlertStatus",
    name = "GetPvpTalentAlertStatus",
    category = "general",
    subcategory = "c_specializationinfo",
    funcPath = "C_SpecializationInfo.GetPvpTalentAlertStatus",
    params = {  },
    returns = { { name = "hasUnspentSlot", type = "bool", canBeSecret = false }, { name = "hasNewTalent", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["C_SpecializationInfo.GetPvpTalentInfo"] = {
    key = "C_SpecializationInfo.GetPvpTalentInfo",
    name = "GetPvpTalentInfo",
    category = "general",
    subcategory = "c_specializationinfo",
    funcPath = "C_SpecializationInfo.GetPvpTalentInfo",
    params = { { name = "talentID", type = "number", default = nil } },
    returns = { { name = "talentInfo", type = "PvpTalentInfo", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_SpecializationInfo.GetPvpTalentSlotInfo"] = {
    key = "C_SpecializationInfo.GetPvpTalentSlotInfo",
    name = "GetPvpTalentSlotInfo",
    category = "general",
    subcategory = "c_specializationinfo",
    funcPath = "C_SpecializationInfo.GetPvpTalentSlotInfo",
    params = { { name = "talentIndex", type = "number", default = nil } },
    returns = { { name = "slotInfo", type = "PvpTalentSlotInfo", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_SpecializationInfo.GetPvpTalentSlotUnlockLevel"] = {
    key = "C_SpecializationInfo.GetPvpTalentSlotUnlockLevel",
    name = "GetPvpTalentSlotUnlockLevel",
    category = "general",
    subcategory = "c_specializationinfo",
    funcPath = "C_SpecializationInfo.GetPvpTalentSlotUnlockLevel",
    params = { { name = "talentIndex", type = "number", default = nil } },
    returns = { { name = "requiredLevel", type = "number", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_SpecializationInfo.GetPvpTalentUnlockLevel"] = {
    key = "C_SpecializationInfo.GetPvpTalentUnlockLevel",
    name = "GetPvpTalentUnlockLevel",
    category = "general",
    subcategory = "c_specializationinfo",
    funcPath = "C_SpecializationInfo.GetPvpTalentUnlockLevel",
    params = { { name = "talentID", type = "number", default = nil } },
    returns = { { name = "requiredLevel", type = "number", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_SpecializationInfo.GetSpecIDs"] = {
    key = "C_SpecializationInfo.GetSpecIDs",
    name = "GetSpecIDs",
    category = "general",
    subcategory = "c_specializationinfo",
    funcPath = "C_SpecializationInfo.GetSpecIDs",
    params = { { name = "specSetID", type = "number", default = nil } },
    returns = { { name = "specIDs", type = "table", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_SpecializationInfo.GetSpecialization"] = {
    key = "C_SpecializationInfo.GetSpecialization",
    name = "GetSpecialization",
    category = "general",
    subcategory = "c_specializationinfo",
    funcPath = "C_SpecializationInfo.GetSpecialization",
    params = { { name = "isInspect", type = "bool", default = nil }, { name = "isPet", type = "bool", default = nil }, { name = "specGroupIndex", type = "luaIndex", default = nil } },
    returns = { { name = "specializationIndex", type = "luaIndex", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_SpecializationInfo.GetSpecializationInfo"] = {
    key = "C_SpecializationInfo.GetSpecializationInfo",
    name = "GetSpecializationInfo",
    category = "general",
    subcategory = "c_specializationinfo",
    funcPath = "C_SpecializationInfo.GetSpecializationInfo",
    params = { { name = "specializationIndex", type = "luaIndex", default = nil }, { name = "isInspect", type = "bool", default = false }, { name = "isPet", type = "bool", default = false }, { name = "inspectTarget", type = "string", default = nil }, { name = "sex", type = "number", default = nil }, { name = "groupIndex", type = "luaIndex", default = nil }, { name = "classID", type = "number", default = nil } },
    returns = { { name = "specId", type = "number", canBeSecret = false }, { name = "name", type = "string", canBeSecret = false }, { name = "description", type = "string", canBeSecret = false }, { name = "icon", type = "fileID", canBeSecret = false }, { name = "role", type = "string", canBeSecret = false }, { name = "primaryStat", type = "luaIndex", canBeSecret = false }, { name = "pointsSpent", type = "number", canBeSecret = false }, { name = "background", type = "string", canBeSecret = false }, { name = "previewPointsSpent", type = "number", canBeSecret = false }, { name = "isUnlocked", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_SpecializationInfo.GetSpecializationMasterySpells"] = {
    key = "C_SpecializationInfo.GetSpecializationMasterySpells",
    name = "GetSpecializationMasterySpells",
    category = "general",
    subcategory = "c_specializationinfo",
    funcPath = "C_SpecializationInfo.GetSpecializationMasterySpells",
    params = { { name = "specializationIndex", type = "luaIndex", default = nil }, { name = "isInspect", type = "bool", default = nil }, { name = "isPet", type = "bool", default = nil } },
    returns = { { name = "spellIDs", type = "table", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_SpecializationInfo.GetSpellsDisplay"] = {
    key = "C_SpecializationInfo.GetSpellsDisplay",
    name = "GetSpellsDisplay",
    category = "general",
    subcategory = "c_specializationinfo",
    funcPath = "C_SpecializationInfo.GetSpellsDisplay",
    params = { { name = "specializationID", type = "number", default = nil } },
    returns = { { name = "spellID", type = "table", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_SpecializationInfo.GetTalentInfo"] = {
    key = "C_SpecializationInfo.GetTalentInfo",
    name = "GetTalentInfo",
    category = "general",
    subcategory = "c_specializationinfo",
    funcPath = "C_SpecializationInfo.GetTalentInfo",
    params = { { name = "query", type = "TalentInfoQuery", default = nil } },
    returns = { { name = "result", type = "TalentInfoResult", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_SpecializationInfo.IsInitialized"] = {
    key = "C_SpecializationInfo.IsInitialized",
    name = "IsInitialized",
    category = "general",
    subcategory = "c_specializationinfo",
    funcPath = "C_SpecializationInfo.IsInitialized",
    params = {  },
    returns = { { name = "isSpecializationDataInitialized", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["C_SpecializationInfo.IsPvpTalentLocked"] = {
    key = "C_SpecializationInfo.IsPvpTalentLocked",
    name = "IsPvpTalentLocked",
    category = "general",
    subcategory = "c_specializationinfo",
    funcPath = "C_SpecializationInfo.IsPvpTalentLocked",
    params = { { name = "talentID", type = "number", default = nil } },
    returns = { { name = "locked", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_SpecializationInfo.MatchesCurrentSpecSet"] = {
    key = "C_SpecializationInfo.MatchesCurrentSpecSet",
    name = "MatchesCurrentSpecSet",
    category = "general",
    subcategory = "c_specializationinfo",
    funcPath = "C_SpecializationInfo.MatchesCurrentSpecSet",
    params = { { name = "specSetID", type = "number", default = nil } },
    returns = { { name = "matches", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_SpecializationInfo.SetPetSpecialization"] = {
    key = "C_SpecializationInfo.SetPetSpecialization",
    name = "SetPetSpecialization",
    category = "general",
    subcategory = "c_specializationinfo",
    funcPath = "C_SpecializationInfo.SetPetSpecialization",
    params = { { name = "specIndex", type = "luaIndex", default = nil }, { name = "petNumber", type = "number", default = nil } },
    returns = {  },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_SpecializationInfo.SetPvpTalentLocked"] = {
    key = "C_SpecializationInfo.SetPvpTalentLocked",
    name = "SetPvpTalentLocked",
    category = "general",
    subcategory = "c_specializationinfo",
    funcPath = "C_SpecializationInfo.SetPvpTalentLocked",
    params = { { name = "talentID", type = "number", default = nil }, { name = "locked", type = "bool", default = nil } },
    returns = {  },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_SpecializationInfo.SetSpecialization"] = {
    key = "C_SpecializationInfo.SetSpecialization",
    name = "SetSpecialization",
    category = "general",
    subcategory = "c_specializationinfo",
    funcPath = "C_SpecializationInfo.SetSpecialization",
    params = { { name = "specIndex", type = "luaIndex", default = nil } },
    returns = { { name = "success", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}
