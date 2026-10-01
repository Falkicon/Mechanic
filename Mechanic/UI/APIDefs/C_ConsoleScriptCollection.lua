-- Generated APIDefinitions for namespace: C_ConsoleScriptCollection
local _, ns = ...
local APIDefs = ns.APIDefinitions

APIDefs["C_ConsoleScriptCollection.GetCollectionDataByID"] = {
    key = "C_ConsoleScriptCollection.GetCollectionDataByID",
    name = "GetCollectionDataByID",
    category = "general",
    subcategory = "c_consolescriptcollection",
    funcPath = "C_ConsoleScriptCollection.GetCollectionDataByID",
    params = { { name = "collectionID", type = "number", default = nil } },
    returns = { { name = "data", type = "ConsoleScriptCollectionData", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_ConsoleScriptCollection.GetCollectionDataByTag"] = {
    key = "C_ConsoleScriptCollection.GetCollectionDataByTag",
    name = "GetCollectionDataByTag",
    category = "general",
    subcategory = "c_consolescriptcollection",
    funcPath = "C_ConsoleScriptCollection.GetCollectionDataByTag",
    params = { { name = "collectionTag", type = "string", default = nil } },
    returns = { { name = "data", type = "ConsoleScriptCollectionData", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_ConsoleScriptCollection.GetElements"] = {
    key = "C_ConsoleScriptCollection.GetElements",
    name = "GetElements",
    category = "general",
    subcategory = "c_consolescriptcollection",
    funcPath = "C_ConsoleScriptCollection.GetElements",
    params = { { name = "collectionID", type = "number", default = nil } },
    returns = { { name = "elementIDs", type = "table", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_ConsoleScriptCollection.GetScriptData"] = {
    key = "C_ConsoleScriptCollection.GetScriptData",
    name = "GetScriptData",
    category = "general",
    subcategory = "c_consolescriptcollection",
    funcPath = "C_ConsoleScriptCollection.GetScriptData",
    params = { { name = "consoleScriptID", type = "number", default = nil } },
    returns = { { name = "data", type = "ConsoleScriptData", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}
