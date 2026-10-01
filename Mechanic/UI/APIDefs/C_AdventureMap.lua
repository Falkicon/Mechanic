-- Generated APIDefinitions for namespace: C_AdventureMap
local _, ns = ...
local APIDefs = ns.APIDefinitions

APIDefs["C_AdventureMap.GetAdventureMapTextureKit"] = {
    key = "C_AdventureMap.GetAdventureMapTextureKit",
    name = "GetAdventureMapTextureKit",
    category = "map",
    subcategory = "c_adventuremap",
    funcPath = "C_AdventureMap.GetAdventureMapTextureKit",
    params = {  },
    returns = { { name = "adventureMapTextureKit", type = "textureKit", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["C_AdventureMap.GetQuestPortraitInfo"] = {
    key = "C_AdventureMap.GetQuestPortraitInfo",
    name = "GetQuestPortraitInfo",
    category = "map",
    subcategory = "c_adventuremap",
    funcPath = "C_AdventureMap.GetQuestPortraitInfo",
    params = { { name = "questID", type = "number", default = nil } },
    returns = { { name = "info", type = "AdventureMapQuestPortraitInfo", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}
