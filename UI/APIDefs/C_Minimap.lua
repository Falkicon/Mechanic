-- Generated APIDefinitions for namespace: C_Minimap
local _, ns = ...
local APIDefs = ns.APIDefinitions

APIDefs["C_Minimap.CanTrackBattlePets"] = {
    key = "C_Minimap.CanTrackBattlePets",
    name = "CanTrackBattlePets",
    category = "map",
    subcategory = "c_minimap",
    func = _G["C_Minimap"] and _G["C_Minimap"]["CanTrackBattlePets"],
    funcPath = "C_Minimap.CanTrackBattlePets",
    params = {  },
    returns = { { name = "CanTrackBattlePets", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["C_Minimap.ClearAllTracking"] = {
    key = "C_Minimap.ClearAllTracking",
    name = "ClearAllTracking",
    category = "map",
    subcategory = "c_minimap",
    func = _G["C_Minimap"] and _G["C_Minimap"]["ClearAllTracking"],
    funcPath = "C_Minimap.ClearAllTracking",
    params = {  },
    returns = {  },
    midnightImpact = "NORMAL",
}

APIDefs["C_Minimap.ClearMinimapInsetInfo"] = {
    key = "C_Minimap.ClearMinimapInsetInfo",
    name = "ClearMinimapInsetInfo",
    category = "map",
    subcategory = "c_minimap",
    func = _G["C_Minimap"] and _G["C_Minimap"]["ClearMinimapInsetInfo"],
    funcPath = "C_Minimap.ClearMinimapInsetInfo",
    params = {  },
    returns = {  },
    midnightImpact = "NORMAL",
}

APIDefs["C_Minimap.GetDefaultTrackingValue"] = {
    key = "C_Minimap.GetDefaultTrackingValue",
    name = "GetDefaultTrackingValue",
    category = "combat_midnight",
    subcategory = "c_minimap",
    func = _G["C_Minimap"] and _G["C_Minimap"]["GetDefaultTrackingValue"],
    funcPath = "C_Minimap.GetDefaultTrackingValue",
    params = { { name = "filterType", type = "MinimapTrackingFilter", default = nil } },
    returns = { { name = "defaultValue", type = "bool", canBeSecret = false } },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Minimap.GetDrawGroundTextures"] = {
    key = "C_Minimap.GetDrawGroundTextures",
    name = "GetDrawGroundTextures",
    category = "map",
    subcategory = "c_minimap",
    func = _G["C_Minimap"] and _G["C_Minimap"]["GetDrawGroundTextures"],
    funcPath = "C_Minimap.GetDrawGroundTextures",
    params = {  },
    returns = { { name = "draw", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["C_Minimap.GetNumQuestPOIWorldEffects"] = {
    key = "C_Minimap.GetNumQuestPOIWorldEffects",
    name = "GetNumQuestPOIWorldEffects",
    category = "map",
    subcategory = "c_minimap",
    func = _G["C_Minimap"] and _G["C_Minimap"]["GetNumQuestPOIWorldEffects"],
    funcPath = "C_Minimap.GetNumQuestPOIWorldEffects",
    params = {  },
    returns = { { name = "worldEffectCount", type = "number", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["C_Minimap.GetNumTrackingTypes"] = {
    key = "C_Minimap.GetNumTrackingTypes",
    name = "GetNumTrackingTypes",
    category = "map",
    subcategory = "c_minimap",
    func = _G["C_Minimap"] and _G["C_Minimap"]["GetNumTrackingTypes"],
    funcPath = "C_Minimap.GetNumTrackingTypes",
    params = {  },
    returns = { { name = "numTrackingTypes", type = "number", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["C_Minimap.GetObjectIconTextureCoords"] = {
    key = "C_Minimap.GetObjectIconTextureCoords",
    name = "GetObjectIconTextureCoords",
    category = "combat_midnight",
    subcategory = "c_minimap",
    func = _G["C_Minimap"] and _G["C_Minimap"]["GetObjectIconTextureCoords"],
    funcPath = "C_Minimap.GetObjectIconTextureCoords",
    params = { { name = "index", type = "number", default = nil } },
    returns = { { name = "textureCoordsX", type = "number", canBeSecret = false }, { name = "textureCoordsY", type = "number", canBeSecret = false }, { name = "textureCoordsZ", type = "number", canBeSecret = false }, { name = "textureCoordsW", type = "number", canBeSecret = false } },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Minimap.GetPOITextureCoords"] = {
    key = "C_Minimap.GetPOITextureCoords",
    name = "GetPOITextureCoords",
    category = "combat_midnight",
    subcategory = "c_minimap",
    func = _G["C_Minimap"] and _G["C_Minimap"]["GetPOITextureCoords"],
    funcPath = "C_Minimap.GetPOITextureCoords",
    params = { { name = "index", type = "number", default = nil } },
    returns = { { name = "textureCoordsX", type = "number", canBeSecret = false }, { name = "textureCoordsY", type = "number", canBeSecret = false }, { name = "textureCoordsZ", type = "number", canBeSecret = false }, { name = "textureCoordsW", type = "number", canBeSecret = false } },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Minimap.GetTrackingFilter"] = {
    key = "C_Minimap.GetTrackingFilter",
    name = "GetTrackingFilter",
    category = "combat_midnight",
    subcategory = "c_minimap",
    func = _G["C_Minimap"] and _G["C_Minimap"]["GetTrackingFilter"],
    funcPath = "C_Minimap.GetTrackingFilter",
    params = { { name = "spellIndex", type = "luaIndex", default = nil } },
    returns = { { name = "trackingType", type = "MinimapScriptTrackingFilter", canBeSecret = false } },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Minimap.GetTrackingInfo"] = {
    key = "C_Minimap.GetTrackingInfo",
    name = "GetTrackingInfo",
    category = "combat_midnight",
    subcategory = "c_minimap",
    func = _G["C_Minimap"] and _G["C_Minimap"]["GetTrackingInfo"],
    funcPath = "C_Minimap.GetTrackingInfo",
    params = { { name = "spellIndex", type = "luaIndex", default = nil } },
    returns = { { name = "trackingInfo", type = "MinimapScriptTrackingInfo", canBeSecret = false } },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Minimap.GetUiMapID"] = {
    key = "C_Minimap.GetUiMapID",
    name = "GetUiMapID",
    category = "map",
    subcategory = "c_minimap",
    func = _G["C_Minimap"] and _G["C_Minimap"]["GetUiMapID"],
    funcPath = "C_Minimap.GetUiMapID",
    params = {  },
    returns = { { name = "uiMapID", type = "number", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["C_Minimap.GetViewRadius"] = {
    key = "C_Minimap.GetViewRadius",
    name = "GetViewRadius",
    category = "map",
    subcategory = "c_minimap",
    func = _G["C_Minimap"] and _G["C_Minimap"]["GetViewRadius"],
    funcPath = "C_Minimap.GetViewRadius",
    params = {  },
    returns = { { name = "yards", type = "number", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["C_Minimap.IsFilteredOut"] = {
    key = "C_Minimap.IsFilteredOut",
    name = "IsFilteredOut",
    category = "combat_midnight",
    subcategory = "c_minimap",
    func = _G["C_Minimap"] and _G["C_Minimap"]["IsFilteredOut"],
    funcPath = "C_Minimap.IsFilteredOut",
    params = { { name = "filterType", type = "MinimapTrackingFilter", default = nil } },
    returns = { { name = "isFiltered", type = "bool", canBeSecret = false } },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Minimap.IsInsideQuestBlob"] = {
    key = "C_Minimap.IsInsideQuestBlob",
    name = "IsInsideQuestBlob",
    category = "combat_midnight",
    subcategory = "c_minimap",
    func = _G["C_Minimap"] and _G["C_Minimap"]["IsInsideQuestBlob"],
    funcPath = "C_Minimap.IsInsideQuestBlob",
    params = { { name = "questID", type = "number", default = nil } },
    returns = { { name = "isInside", type = "bool", canBeSecret = false } },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Minimap.IsRotateMinimapIgnored"] = {
    key = "C_Minimap.IsRotateMinimapIgnored",
    name = "IsRotateMinimapIgnored",
    category = "map",
    subcategory = "c_minimap",
    func = _G["C_Minimap"] and _G["C_Minimap"]["IsRotateMinimapIgnored"],
    funcPath = "C_Minimap.IsRotateMinimapIgnored",
    params = {  },
    returns = { { name = "isIgnored", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["C_Minimap.IsTrackingAccountCompletedQuests"] = {
    key = "C_Minimap.IsTrackingAccountCompletedQuests",
    name = "IsTrackingAccountCompletedQuests",
    category = "map",
    subcategory = "c_minimap",
    func = _G["C_Minimap"] and _G["C_Minimap"]["IsTrackingAccountCompletedQuests"],
    funcPath = "C_Minimap.IsTrackingAccountCompletedQuests",
    params = {  },
    returns = { { name = "IsTrackingAccountCompletedQuests", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["C_Minimap.IsTrackingBattlePets"] = {
    key = "C_Minimap.IsTrackingBattlePets",
    name = "IsTrackingBattlePets",
    category = "map",
    subcategory = "c_minimap",
    func = _G["C_Minimap"] and _G["C_Minimap"]["IsTrackingBattlePets"],
    funcPath = "C_Minimap.IsTrackingBattlePets",
    params = {  },
    returns = { { name = "isTrackingBattlePets", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["C_Minimap.IsTrackingHiddenQuests"] = {
    key = "C_Minimap.IsTrackingHiddenQuests",
    name = "IsTrackingHiddenQuests",
    category = "map",
    subcategory = "c_minimap",
    func = _G["C_Minimap"] and _G["C_Minimap"]["IsTrackingHiddenQuests"],
    funcPath = "C_Minimap.IsTrackingHiddenQuests",
    params = {  },
    returns = { { name = "isTrackingHiddenQuests", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["C_Minimap.SetDrawGroundTextures"] = {
    key = "C_Minimap.SetDrawGroundTextures",
    name = "SetDrawGroundTextures",
    category = "combat_midnight",
    subcategory = "c_minimap",
    func = _G["C_Minimap"] and _G["C_Minimap"]["SetDrawGroundTextures"],
    funcPath = "C_Minimap.SetDrawGroundTextures",
    params = { { name = "draw", type = "bool", default = nil } },
    returns = {  },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Minimap.SetIgnoreRotateMinimap"] = {
    key = "C_Minimap.SetIgnoreRotateMinimap",
    name = "SetIgnoreRotateMinimap",
    category = "combat_midnight",
    subcategory = "c_minimap",
    func = _G["C_Minimap"] and _G["C_Minimap"]["SetIgnoreRotateMinimap"],
    funcPath = "C_Minimap.SetIgnoreRotateMinimap",
    params = { { name = "ignore", type = "bool", default = nil } },
    returns = {  },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Minimap.SetMinimapInsetInfo"] = {
    key = "C_Minimap.SetMinimapInsetInfo",
    name = "SetMinimapInsetInfo",
    category = "combat_midnight",
    subcategory = "c_minimap",
    func = _G["C_Minimap"] and _G["C_Minimap"]["SetMinimapInsetInfo"],
    funcPath = "C_Minimap.SetMinimapInsetInfo",
    params = { { name = "minAngle", type = "number", default = nil }, { name = "maxAngle", type = "number", default = nil }, { name = "scalar", type = "number", default = nil } },
    returns = {  },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Minimap.SetTracking"] = {
    key = "C_Minimap.SetTracking",
    name = "SetTracking",
    category = "combat_midnight",
    subcategory = "c_minimap",
    func = _G["C_Minimap"] and _G["C_Minimap"]["SetTracking"],
    funcPath = "C_Minimap.SetTracking",
    params = { { name = "index", type = "luaIndex", default = nil }, { name = "on", type = "bool", default = nil } },
    returns = {  },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Minimap.ShouldUseHybridMinimap"] = {
    key = "C_Minimap.ShouldUseHybridMinimap",
    name = "ShouldUseHybridMinimap",
    category = "map",
    subcategory = "c_minimap",
    func = _G["C_Minimap"] and _G["C_Minimap"]["ShouldUseHybridMinimap"],
    funcPath = "C_Minimap.ShouldUseHybridMinimap",
    params = {  },
    returns = { { name = "shouldUse", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
}
