-- Generated APIDefinitions for namespace: C_AssistedCombat
local _, ns = ...
local APIDefs = ns.APIDefinitions

APIDefs["C_AssistedCombat.GetActionSpell"] = {
    key = "C_AssistedCombat.GetActionSpell",
    name = "GetActionSpell",
    category = "general",
    subcategory = "c_assistedcombat",
    func = _G["C_AssistedCombat"] and _G["C_AssistedCombat"]["GetActionSpell"],
    funcPath = "C_AssistedCombat.GetActionSpell",
    params = {  },
    returns = { { name = "spellID", type = "number", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

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

APIDefs["C_AssistedCombat.GetRotationSpells"] = {
    key = "C_AssistedCombat.GetRotationSpells",
    name = "GetRotationSpells",
    category = "general",
    subcategory = "c_assistedcombat",
    func = _G["C_AssistedCombat"] and _G["C_AssistedCombat"]["GetRotationSpells"],
    funcPath = "C_AssistedCombat.GetRotationSpells",
    params = {  },
    returns = { { name = "spellIDs", type = "table", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["C_AssistedCombat.IsAvailable"] = {
    key = "C_AssistedCombat.IsAvailable",
    name = "IsAvailable",
    category = "general",
    subcategory = "c_assistedcombat",
    func = _G["C_AssistedCombat"] and _G["C_AssistedCombat"]["IsAvailable"],
    funcPath = "C_AssistedCombat.IsAvailable",
    params = {  },
    returns = { { name = "isAvailable", type = "bool", canBeSecret = false }, { name = "failureReason", type = "string", canBeSecret = false } },
    midnightImpact = "NORMAL",
}
