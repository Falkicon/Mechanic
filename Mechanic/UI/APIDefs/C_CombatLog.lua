-- Generated APIDefinitions for namespace: C_CombatLog
local _, ns = ...
local APIDefs = ns.APIDefinitions

APIDefs["C_CombatLog.ApplyFilterSettings"] = {
    key = "C_CombatLog.ApplyFilterSettings",
    name = "ApplyFilterSettings",
    category = "combat_midnight",
    subcategory = "c_combatlog",
    func = _G["C_CombatLog"] and _G["C_CombatLog"]["ApplyFilterSettings"],
    funcPath = "C_CombatLog.ApplyFilterSettings",
    params = { { name = "filterSettings", type = "LuaValueVariant", default = nil } },
    returns = {  },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_CombatLog.AreFilteredEventsEnabled"] = {
    key = "C_CombatLog.AreFilteredEventsEnabled",
    name = "AreFilteredEventsEnabled",
    category = "general",
    subcategory = "c_combatlog",
    func = _G["C_CombatLog"] and _G["C_CombatLog"]["AreFilteredEventsEnabled"],
    funcPath = "C_CombatLog.AreFilteredEventsEnabled",
    params = {  },
    returns = { { name = "enabled", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["C_CombatLog.ClearEntries"] = {
    key = "C_CombatLog.ClearEntries",
    name = "ClearEntries",
    category = "general",
    subcategory = "c_combatlog",
    func = _G["C_CombatLog"] and _G["C_CombatLog"]["ClearEntries"],
    funcPath = "C_CombatLog.ClearEntries",
    params = {  },
    returns = {  },
    midnightImpact = "NORMAL",
}

APIDefs["C_CombatLog.DoesObjectMatchFilter"] = {
    key = "C_CombatLog.DoesObjectMatchFilter",
    name = "DoesObjectMatchFilter",
    category = "combat_midnight",
    subcategory = "c_combatlog",
    func = _G["C_CombatLog"] and _G["C_CombatLog"]["DoesObjectMatchFilter"],
    funcPath = "C_CombatLog.DoesObjectMatchFilter",
    params = { { name = "mask", type = "CombatLogObject", default = nil }, { name = "flags", type = "CombatLogObject", default = nil } },
    returns = { { name = "matches", type = "bool", canBeSecret = false } },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_CombatLog.GetEntryRetentionTime"] = {
    key = "C_CombatLog.GetEntryRetentionTime",
    name = "GetEntryRetentionTime",
    category = "general",
    subcategory = "c_combatlog",
    func = _G["C_CombatLog"] and _G["C_CombatLog"]["GetEntryRetentionTime"],
    funcPath = "C_CombatLog.GetEntryRetentionTime",
    params = {  },
    returns = { { name = "retentionTime", type = "number", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["C_CombatLog.GetMessageLimit"] = {
    key = "C_CombatLog.GetMessageLimit",
    name = "GetMessageLimit",
    category = "general",
    subcategory = "c_combatlog",
    func = _G["C_CombatLog"] and _G["C_CombatLog"]["GetMessageLimit"],
    funcPath = "C_CombatLog.GetMessageLimit",
    params = {  },
    returns = { { name = "messageLimit", type = "number", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["C_CombatLog.IsCombatLogRestricted"] = {
    key = "C_CombatLog.IsCombatLogRestricted",
    name = "IsCombatLogRestricted",
    category = "general",
    subcategory = "c_combatlog",
    func = _G["C_CombatLog"] and _G["C_CombatLog"]["IsCombatLogRestricted"],
    funcPath = "C_CombatLog.IsCombatLogRestricted",
    params = {  },
    returns = { { name = "restricted", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["C_CombatLog.RefilterEntries"] = {
    key = "C_CombatLog.RefilterEntries",
    name = "RefilterEntries",
    category = "general",
    subcategory = "c_combatlog",
    func = _G["C_CombatLog"] and _G["C_CombatLog"]["RefilterEntries"],
    funcPath = "C_CombatLog.RefilterEntries",
    params = {  },
    returns = {  },
    midnightImpact = "NORMAL",
}

APIDefs["C_CombatLog.SetEntryRetentionTime"] = {
    key = "C_CombatLog.SetEntryRetentionTime",
    name = "SetEntryRetentionTime",
    category = "combat_midnight",
    subcategory = "c_combatlog",
    func = _G["C_CombatLog"] and _G["C_CombatLog"]["SetEntryRetentionTime"],
    funcPath = "C_CombatLog.SetEntryRetentionTime",
    params = { { name = "retentionTime", type = "number", default = nil } },
    returns = {  },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_CombatLog.SetFilteredEventsEnabled"] = {
    key = "C_CombatLog.SetFilteredEventsEnabled",
    name = "SetFilteredEventsEnabled",
    category = "combat_midnight",
    subcategory = "c_combatlog",
    func = _G["C_CombatLog"] and _G["C_CombatLog"]["SetFilteredEventsEnabled"],
    funcPath = "C_CombatLog.SetFilteredEventsEnabled",
    params = { { name = "enabled", type = "bool", default = nil } },
    returns = {  },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_CombatLog.SetMessageLimit"] = {
    key = "C_CombatLog.SetMessageLimit",
    name = "SetMessageLimit",
    category = "combat_midnight",
    subcategory = "c_combatlog",
    func = _G["C_CombatLog"] and _G["C_CombatLog"]["SetMessageLimit"],
    funcPath = "C_CombatLog.SetMessageLimit",
    params = { { name = "messageLimit", type = "number", default = nil } },
    returns = {  },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}
