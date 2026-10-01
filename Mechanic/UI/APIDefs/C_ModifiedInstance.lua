-- Generated APIDefinitions for namespace: C_ModifiedInstance
local _, ns = ...
local APIDefs = ns.APIDefinitions

APIDefs["C_ModifiedInstance.GetModifiedInstanceInfoFromMapID"] = {
    key = "C_ModifiedInstance.GetModifiedInstanceInfoFromMapID",
    name = "GetModifiedInstanceInfoFromMapID",
    category = "general",
    subcategory = "c_modifiedinstance",
    funcPath = "C_ModifiedInstance.GetModifiedInstanceInfoFromMapID",
    params = { { name = "mapID", type = "number", default = nil } },
    returns = { { name = "info", type = "ModifiedInstanceInfo", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}
