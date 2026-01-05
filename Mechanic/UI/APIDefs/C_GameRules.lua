-- Generated APIDefinitions for namespace: C_GameRules
local _, ns = ...
local APIDefs = ns.APIDefinitions

APIDefs["C_GameRules.AutoConnectToGameModeRealm"] = {
    key = "C_GameRules.AutoConnectToGameModeRealm",
    name = "AutoConnectToGameModeRealm",
    category = "combat_midnight",
    subcategory = "c_gamerules",
    func = _G["C_GameRules"] and _G["C_GameRules"]["AutoConnectToGameModeRealm"],
    funcPath = "C_GameRules.AutoConnectToGameModeRealm",
    params = { { name = "gameModeRecordID", type = "number", default = nil } },
    returns = {  },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_GameRules.DoesGameModeHavePromo"] = {
    key = "C_GameRules.DoesGameModeHavePromo",
    name = "DoesGameModeHavePromo",
    category = "combat_midnight",
    subcategory = "c_gamerules",
    func = _G["C_GameRules"] and _G["C_GameRules"]["DoesGameModeHavePromo"],
    funcPath = "C_GameRules.DoesGameModeHavePromo",
    params = { { name = "gameModeRecordID", type = "number", default = nil } },
    returns = { { name = "hasPromo", type = "bool", canBeSecret = false } },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_GameRules.GetActiveGameMode"] = {
    key = "C_GameRules.GetActiveGameMode",
    name = "GetActiveGameMode",
    category = "general",
    subcategory = "c_gamerules",
    func = _G["C_GameRules"] and _G["C_GameRules"]["GetActiveGameMode"],
    funcPath = "C_GameRules.GetActiveGameMode",
    params = {  },
    returns = { { name = "gameMode", type = "GameMode", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["C_GameRules.GetCurrentEventRealmQueues"] = {
    key = "C_GameRules.GetCurrentEventRealmQueues",
    name = "GetCurrentEventRealmQueues",
    category = "general",
    subcategory = "c_gamerules",
    func = _G["C_GameRules"] and _G["C_GameRules"]["GetCurrentEventRealmQueues"],
    funcPath = "C_GameRules.GetCurrentEventRealmQueues",
    params = {  },
    returns = { { name = "eventRealmQueues", type = "EventRealmQueues", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["C_GameRules.GetCurrentGameModeDisplayInfo"] = {
    key = "C_GameRules.GetCurrentGameModeDisplayInfo",
    name = "GetCurrentGameModeDisplayInfo",
    category = "general",
    subcategory = "c_gamerules",
    func = _G["C_GameRules"] and _G["C_GameRules"]["GetCurrentGameModeDisplayInfo"],
    funcPath = "C_GameRules.GetCurrentGameModeDisplayInfo",
    params = {  },
    returns = { { name = "info", type = "GameModeDisplayInfo", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["C_GameRules.GetCurrentGameModeRecordID"] = {
    key = "C_GameRules.GetCurrentGameModeRecordID",
    name = "GetCurrentGameModeRecordID",
    category = "general",
    subcategory = "c_gamerules",
    func = _G["C_GameRules"] and _G["C_GameRules"]["GetCurrentGameModeRecordID"],
    funcPath = "C_GameRules.GetCurrentGameModeRecordID",
    params = {  },
    returns = { { name = "gameModeRecordID", type = "number", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["C_GameRules.GetDisplayedGameModeRecordIDAtIndex"] = {
    key = "C_GameRules.GetDisplayedGameModeRecordIDAtIndex",
    name = "GetDisplayedGameModeRecordIDAtIndex",
    category = "combat_midnight",
    subcategory = "c_gamerules",
    func = _G["C_GameRules"] and _G["C_GameRules"]["GetDisplayedGameModeRecordIDAtIndex"],
    funcPath = "C_GameRules.GetDisplayedGameModeRecordIDAtIndex",
    params = { { name = "displayIndex", type = "luaIndex", default = nil } },
    returns = { { name = "gameModeRecordID", type = "number", canBeSecret = false } },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_GameRules.GetGameModeDisplayInfoByRecordID"] = {
    key = "C_GameRules.GetGameModeDisplayInfoByRecordID",
    name = "GetGameModeDisplayInfoByRecordID",
    category = "combat_midnight",
    subcategory = "c_gamerules",
    func = _G["C_GameRules"] and _G["C_GameRules"]["GetGameModeDisplayInfoByRecordID"],
    funcPath = "C_GameRules.GetGameModeDisplayInfoByRecordID",
    params = { { name = "gameModeRecordID", type = "number", default = nil } },
    returns = { { name = "info", type = "GameModeDisplayInfo", canBeSecret = false } },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_GameRules.GetGameModeGlueScreenName"] = {
    key = "C_GameRules.GetGameModeGlueScreenName",
    name = "GetGameModeGlueScreenName",
    category = "general",
    subcategory = "c_gamerules",
    func = _G["C_GameRules"] and _G["C_GameRules"]["GetGameModeGlueScreenName"],
    funcPath = "C_GameRules.GetGameModeGlueScreenName",
    params = {  },
    returns = { { name = "screenName", type = "cstring", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["C_GameRules.GetGameModePromoGlobalString"] = {
    key = "C_GameRules.GetGameModePromoGlobalString",
    name = "GetGameModePromoGlobalString",
    category = "combat_midnight",
    subcategory = "c_gamerules",
    func = _G["C_GameRules"] and _G["C_GameRules"]["GetGameModePromoGlobalString"],
    funcPath = "C_GameRules.GetGameModePromoGlobalString",
    params = { { name = "gameModeRecordID", type = "number", default = nil } },
    returns = { { name = "promoGlobalString", type = "cstring", canBeSecret = false } },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_GameRules.GetGameRuleAsFloat"] = {
    key = "C_GameRules.GetGameRuleAsFloat",
    name = "GetGameRuleAsFloat",
    category = "combat_midnight",
    subcategory = "c_gamerules",
    func = _G["C_GameRules"] and _G["C_GameRules"]["GetGameRuleAsFloat"],
    funcPath = "C_GameRules.GetGameRuleAsFloat",
    params = { { name = "gameRule", type = "GameRule", default = nil }, { name = "decimalPlaces", type = "number", default = 0 } },
    returns = { { name = "value", type = "number", canBeSecret = false } },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_GameRules.GetGameRuleAsFrameStrata"] = {
    key = "C_GameRules.GetGameRuleAsFrameStrata",
    name = "GetGameRuleAsFrameStrata",
    category = "combat_midnight",
    subcategory = "c_gamerules",
    func = _G["C_GameRules"] and _G["C_GameRules"]["GetGameRuleAsFrameStrata"],
    funcPath = "C_GameRules.GetGameRuleAsFrameStrata",
    params = { { name = "gameRule", type = "GameRule", default = nil } },
    returns = { { name = "frameStrata", type = "cstring", canBeSecret = false } },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_GameRules.GetNumDisplayedGameModes"] = {
    key = "C_GameRules.GetNumDisplayedGameModes",
    name = "GetNumDisplayedGameModes",
    category = "general",
    subcategory = "c_gamerules",
    func = _G["C_GameRules"] and _G["C_GameRules"]["GetNumDisplayedGameModes"],
    funcPath = "C_GameRules.GetNumDisplayedGameModes",
    params = {  },
    returns = { { name = "numDisplayedGameModes", type = "number", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["C_GameRules.IsCharacterlessLoginActive"] = {
    key = "C_GameRules.IsCharacterlessLoginActive",
    name = "IsCharacterlessLoginActive",
    category = "general",
    subcategory = "c_gamerules",
    func = _G["C_GameRules"] and _G["C_GameRules"]["IsCharacterlessLoginActive"],
    funcPath = "C_GameRules.IsCharacterlessLoginActive",
    params = {  },
    returns = { { name = "active", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["C_GameRules.IsClassAllowedForGameMode"] = {
    key = "C_GameRules.IsClassAllowedForGameMode",
    name = "IsClassAllowedForGameMode",
    category = "combat_midnight",
    subcategory = "c_gamerules",
    func = _G["C_GameRules"] and _G["C_GameRules"]["IsClassAllowedForGameMode"],
    funcPath = "C_GameRules.IsClassAllowedForGameMode",
    params = { { name = "classID", type = "number", default = nil } },
    returns = { { name = "valid", type = "bool", canBeSecret = false } },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_GameRules.IsGameModeEnabled"] = {
    key = "C_GameRules.IsGameModeEnabled",
    name = "IsGameModeEnabled",
    category = "combat_midnight",
    subcategory = "c_gamerules",
    func = _G["C_GameRules"] and _G["C_GameRules"]["IsGameModeEnabled"],
    funcPath = "C_GameRules.IsGameModeEnabled",
    params = { { name = "gameModeRecordID", type = "number", default = nil } },
    returns = { { name = "enabled", type = "bool", canBeSecret = false } },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_GameRules.IsGameRuleActive"] = {
    key = "C_GameRules.IsGameRuleActive",
    name = "IsGameRuleActive",
    category = "combat_midnight",
    subcategory = "c_gamerules",
    func = _G["C_GameRules"] and _G["C_GameRules"]["IsGameRuleActive"],
    funcPath = "C_GameRules.IsGameRuleActive",
    params = { { name = "gameRule", type = "GameRule", default = nil } },
    returns = { { name = "isActive", type = "bool", canBeSecret = false } },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_GameRules.IsMultiActionBarVisibilityForced"] = {
    key = "C_GameRules.IsMultiActionBarVisibilityForced",
    name = "IsMultiActionBarVisibilityForced",
    category = "general",
    subcategory = "c_gamerules",
    func = _G["C_GameRules"] and _G["C_GameRules"]["IsMultiActionBarVisibilityForced"],
    funcPath = "C_GameRules.IsMultiActionBarVisibilityForced",
    params = {  },
    returns = { { name = "valid", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["C_GameRules.IsPersonalResourceDisplayEnabled"] = {
    key = "C_GameRules.IsPersonalResourceDisplayEnabled",
    name = "IsPersonalResourceDisplayEnabled",
    category = "general",
    subcategory = "c_gamerules",
    func = _G["C_GameRules"] and _G["C_GameRules"]["IsPersonalResourceDisplayEnabled"],
    funcPath = "C_GameRules.IsPersonalResourceDisplayEnabled",
    params = {  },
    returns = { { name = "isPersonalResourceDisplayEnabled", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["C_GameRules.IsPlunderstorm"] = {
    key = "C_GameRules.IsPlunderstorm",
    name = "IsPlunderstorm",
    category = "general",
    subcategory = "c_gamerules",
    func = _G["C_GameRules"] and _G["C_GameRules"]["IsPlunderstorm"],
    funcPath = "C_GameRules.IsPlunderstorm",
    params = {  },
    returns = { { name = "active", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["C_GameRules.IsStandard"] = {
    key = "C_GameRules.IsStandard",
    name = "IsStandard",
    category = "general",
    subcategory = "c_gamerules",
    func = _G["C_GameRules"] and _G["C_GameRules"]["IsStandard"],
    funcPath = "C_GameRules.IsStandard",
    params = {  },
    returns = { { name = "active", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["C_GameRules.IsWoWHack"] = {
    key = "C_GameRules.IsWoWHack",
    name = "IsWoWHack",
    category = "general",
    subcategory = "c_gamerules",
    func = _G["C_GameRules"] and _G["C_GameRules"]["IsWoWHack"],
    funcPath = "C_GameRules.IsWoWHack",
    params = {  },
    returns = { { name = "active", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
}
