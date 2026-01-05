-- Generated APIDefinitions for namespace: C_VideoOptions
local _, ns = ...
local APIDefs = ns.APIDefinitions

APIDefs["C_VideoOptions.GetCurrentGameWindowSize"] = {
    key = "C_VideoOptions.GetCurrentGameWindowSize",
    name = "GetCurrentGameWindowSize",
    category = "general",
    subcategory = "c_videooptions",
    func = _G["C_VideoOptions"] and _G["C_VideoOptions"]["GetCurrentGameWindowSize"],
    funcPath = "C_VideoOptions.GetCurrentGameWindowSize",
    params = {  },
    returns = { { name = "size", type = "vector2", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["C_VideoOptions.GetDefaultGameWindowSize"] = {
    key = "C_VideoOptions.GetDefaultGameWindowSize",
    name = "GetDefaultGameWindowSize",
    category = "combat_midnight",
    subcategory = "c_videooptions",
    func = _G["C_VideoOptions"] and _G["C_VideoOptions"]["GetDefaultGameWindowSize"],
    funcPath = "C_VideoOptions.GetDefaultGameWindowSize",
    params = { { name = "monitor", type = "number", default = nil } },
    returns = { { name = "size", type = "vector2", canBeSecret = false } },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_VideoOptions.GetGameWindowSizes"] = {
    key = "C_VideoOptions.GetGameWindowSizes",
    name = "GetGameWindowSizes",
    category = "combat_midnight",
    subcategory = "c_videooptions",
    func = _G["C_VideoOptions"] and _G["C_VideoOptions"]["GetGameWindowSizes"],
    funcPath = "C_VideoOptions.GetGameWindowSizes",
    params = { { name = "monitor", type = "number", default = nil }, { name = "fullscreen", type = "bool", default = nil } },
    returns = { { name = "sizes", type = "table", canBeSecret = false } },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_VideoOptions.GetGxAdapterInfo"] = {
    key = "C_VideoOptions.GetGxAdapterInfo",
    name = "GetGxAdapterInfo",
    category = "general",
    subcategory = "c_videooptions",
    func = _G["C_VideoOptions"] and _G["C_VideoOptions"]["GetGxAdapterInfo"],
    funcPath = "C_VideoOptions.GetGxAdapterInfo",
    params = {  },
    returns = { { name = "adapters", type = "table", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["C_VideoOptions.IsSpellVisualDensitySystemSupported"] = {
    key = "C_VideoOptions.IsSpellVisualDensitySystemSupported",
    name = "IsSpellVisualDensitySystemSupported",
    category = "general",
    subcategory = "c_videooptions",
    func = _G["C_VideoOptions"] and _G["C_VideoOptions"]["IsSpellVisualDensitySystemSupported"],
    funcPath = "C_VideoOptions.IsSpellVisualDensitySystemSupported",
    params = {  },
    returns = { { name = "isSupported", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["C_VideoOptions.SetGameWindowSize"] = {
    key = "C_VideoOptions.SetGameWindowSize",
    name = "SetGameWindowSize",
    category = "combat_midnight",
    subcategory = "c_videooptions",
    func = _G["C_VideoOptions"] and _G["C_VideoOptions"]["SetGameWindowSize"],
    funcPath = "C_VideoOptions.SetGameWindowSize",
    params = { { name = "x", type = "number", default = nil }, { name = "y", type = "number", default = nil } },
    returns = {  },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}
