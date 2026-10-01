-- Generated APIDefinitions for namespace: C_WarbandScene
local _, ns = ...
local APIDefs = ns.APIDefinitions

APIDefs["C_WarbandScene.GetRandomEntryID"] = {
    key = "C_WarbandScene.GetRandomEntryID",
    name = "GetRandomEntryID",
    category = "general",
    subcategory = "c_warbandscene",
    funcPath = "C_WarbandScene.GetRandomEntryID",
    params = {  },
    returns = { { name = "warbandSceneID", type = "number", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["C_WarbandScene.GetWarbandSceneEntry"] = {
    key = "C_WarbandScene.GetWarbandSceneEntry",
    name = "GetWarbandSceneEntry",
    category = "general",
    subcategory = "c_warbandscene",
    funcPath = "C_WarbandScene.GetWarbandSceneEntry",
    params = { { name = "warbandSceneID", type = "number", default = nil } },
    returns = { { name = "warbandSceneEntry", type = "WarbandSceneEntry", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_WarbandScene.HasWarbandScene"] = {
    key = "C_WarbandScene.HasWarbandScene",
    name = "HasWarbandScene",
    category = "general",
    subcategory = "c_warbandscene",
    funcPath = "C_WarbandScene.HasWarbandScene",
    params = { { name = "warbandSceneID", type = "number", default = nil } },
    returns = { { name = "owned", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_WarbandScene.IsFavorite"] = {
    key = "C_WarbandScene.IsFavorite",
    name = "IsFavorite",
    category = "general",
    subcategory = "c_warbandscene",
    funcPath = "C_WarbandScene.IsFavorite",
    params = { { name = "warbandSceneID", type = "number", default = nil } },
    returns = { { name = "favorite", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_WarbandScene.SearchWarbandSceneEntries"] = {
    key = "C_WarbandScene.SearchWarbandSceneEntries",
    name = "SearchWarbandSceneEntries",
    category = "general",
    subcategory = "c_warbandscene",
    funcPath = "C_WarbandScene.SearchWarbandSceneEntries",
    params = { { name = "searchParams", type = "WarbandSceneSearchInfo", default = nil } },
    returns = { { name = "matchingEntryIDs", type = "table", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_WarbandScene.SetFavorite"] = {
    key = "C_WarbandScene.SetFavorite",
    name = "SetFavorite",
    category = "general",
    subcategory = "c_warbandscene",
    funcPath = "C_WarbandScene.SetFavorite",
    params = { { name = "warbandSceneID", type = "number", default = nil }, { name = "favorite", type = "bool", default = nil } },
    returns = {  },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}
