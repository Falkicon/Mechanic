-- Generated APIDefinitions for namespace: C_RecentAllies
local _, ns = ...
local APIDefs = ns.APIDefinitions

APIDefs["C_RecentAllies.CanSetRecentAllyNote"] = {
    key = "C_RecentAllies.CanSetRecentAllyNote",
    name = "CanSetRecentAllyNote",
    category = "combat_midnight",
    subcategory = "c_recentallies",
    func = _G["C_RecentAllies"] and _G["C_RecentAllies"]["CanSetRecentAllyNote"],
    funcPath = "C_RecentAllies.CanSetRecentAllyNote",
    params = { { name = "characterGUID", type = "WOWGUID", default = nil } },
    returns = { { name = "canSetNote", type = "bool", canBeSecret = false } },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_RecentAllies.GetRecentAllies"] = {
    key = "C_RecentAllies.GetRecentAllies",
    name = "GetRecentAllies",
    category = "general",
    subcategory = "c_recentallies",
    func = _G["C_RecentAllies"] and _G["C_RecentAllies"]["GetRecentAllies"],
    funcPath = "C_RecentAllies.GetRecentAllies",
    params = {  },
    returns = { { name = "recentAlliesData", type = "table", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["C_RecentAllies.GetRecentAllyByFullName"] = {
    key = "C_RecentAllies.GetRecentAllyByFullName",
    name = "GetRecentAllyByFullName",
    category = "combat_midnight",
    subcategory = "c_recentallies",
    func = _G["C_RecentAllies"] and _G["C_RecentAllies"]["GetRecentAllyByFullName"],
    funcPath = "C_RecentAllies.GetRecentAllyByFullName",
    params = { { name = "fullCharacterName", type = "cstring", default = nil } },
    returns = { { name = "recentAllyData", type = "RecentAllyData", canBeSecret = false } },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_RecentAllies.GetRecentAllyByGUID"] = {
    key = "C_RecentAllies.GetRecentAllyByGUID",
    name = "GetRecentAllyByGUID",
    category = "combat_midnight",
    subcategory = "c_recentallies",
    func = _G["C_RecentAllies"] and _G["C_RecentAllies"]["GetRecentAllyByGUID"],
    funcPath = "C_RecentAllies.GetRecentAllyByGUID",
    params = { { name = "characterGUID", type = "WOWGUID", default = nil } },
    returns = { { name = "recentAllyData", type = "RecentAllyData", canBeSecret = false } },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_RecentAllies.IsRecentAllyByFullName"] = {
    key = "C_RecentAllies.IsRecentAllyByFullName",
    name = "IsRecentAllyByFullName",
    category = "combat_midnight",
    subcategory = "c_recentallies",
    func = _G["C_RecentAllies"] and _G["C_RecentAllies"]["IsRecentAllyByFullName"],
    funcPath = "C_RecentAllies.IsRecentAllyByFullName",
    params = { { name = "fullCharacterName", type = "cstring", default = nil } },
    returns = { { name = "isRecentAlly", type = "bool", canBeSecret = false } },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_RecentAllies.IsRecentAllyByGUID"] = {
    key = "C_RecentAllies.IsRecentAllyByGUID",
    name = "IsRecentAllyByGUID",
    category = "combat_midnight",
    subcategory = "c_recentallies",
    func = _G["C_RecentAllies"] and _G["C_RecentAllies"]["IsRecentAllyByGUID"],
    funcPath = "C_RecentAllies.IsRecentAllyByGUID",
    params = { { name = "characterGUID", type = "WOWGUID", default = nil } },
    returns = { { name = "isRecentAlly", type = "bool", canBeSecret = false } },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_RecentAllies.IsRecentAllyDataReady"] = {
    key = "C_RecentAllies.IsRecentAllyDataReady",
    name = "IsRecentAllyDataReady",
    category = "general",
    subcategory = "c_recentallies",
    func = _G["C_RecentAllies"] and _G["C_RecentAllies"]["IsRecentAllyDataReady"],
    funcPath = "C_RecentAllies.IsRecentAllyDataReady",
    params = {  },
    returns = { { name = "isReady", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["C_RecentAllies.IsRecentAllyPinned"] = {
    key = "C_RecentAllies.IsRecentAllyPinned",
    name = "IsRecentAllyPinned",
    category = "combat_midnight",
    subcategory = "c_recentallies",
    func = _G["C_RecentAllies"] and _G["C_RecentAllies"]["IsRecentAllyPinned"],
    funcPath = "C_RecentAllies.IsRecentAllyPinned",
    params = { { name = "characterGUID", type = "WOWGUID", default = nil } },
    returns = { { name = "isPinned", type = "bool", canBeSecret = false } },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_RecentAllies.IsSystemEnabled"] = {
    key = "C_RecentAllies.IsSystemEnabled",
    name = "IsSystemEnabled",
    category = "general",
    subcategory = "c_recentallies",
    func = _G["C_RecentAllies"] and _G["C_RecentAllies"]["IsSystemEnabled"],
    funcPath = "C_RecentAllies.IsSystemEnabled",
    params = {  },
    returns = { { name = "isRecentAllySystemEnabled", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["C_RecentAllies.IsSystemSupported"] = {
    key = "C_RecentAllies.IsSystemSupported",
    name = "IsSystemSupported",
    category = "general",
    subcategory = "c_recentallies",
    func = _G["C_RecentAllies"] and _G["C_RecentAllies"]["IsSystemSupported"],
    funcPath = "C_RecentAllies.IsSystemSupported",
    params = {  },
    returns = { { name = "isRecentAllySystemSupported", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["C_RecentAllies.SetRecentAllyNote"] = {
    key = "C_RecentAllies.SetRecentAllyNote",
    name = "SetRecentAllyNote",
    category = "combat_midnight",
    subcategory = "c_recentallies",
    func = _G["C_RecentAllies"] and _G["C_RecentAllies"]["SetRecentAllyNote"],
    funcPath = "C_RecentAllies.SetRecentAllyNote",
    params = { { name = "characterGUID", type = "WOWGUID", default = nil }, { name = "note", type = "cstring", default = nil } },
    returns = {  },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_RecentAllies.SetRecentAllyPinned"] = {
    key = "C_RecentAllies.SetRecentAllyPinned",
    name = "SetRecentAllyPinned",
    category = "combat_midnight",
    subcategory = "c_recentallies",
    func = _G["C_RecentAllies"] and _G["C_RecentAllies"]["SetRecentAllyPinned"],
    funcPath = "C_RecentAllies.SetRecentAllyPinned",
    params = { { name = "characterGUID", type = "WOWGUID", default = nil }, { name = "isPinned", type = "bool", default = nil } },
    returns = {  },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_RecentAllies.TryRequestRecentAlliesData"] = {
    key = "C_RecentAllies.TryRequestRecentAlliesData",
    name = "TryRequestRecentAlliesData",
    category = "general",
    subcategory = "c_recentallies",
    func = _G["C_RecentAllies"] and _G["C_RecentAllies"]["TryRequestRecentAlliesData"],
    funcPath = "C_RecentAllies.TryRequestRecentAlliesData",
    params = {  },
    returns = {  },
    midnightImpact = "NORMAL",
}
