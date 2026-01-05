-- Generated APIDefinitions for namespace: C_ModifiedInstance
local _, ns = ...
local APIDefs = ns.APIDefinitions

APIDefs["C_ModifiedInstance.GetModifiedInstanceInfoFromMapID"] = {
    key = "C_ModifiedInstance.GetModifiedInstanceInfoFromMapID",
    name = "GetModifiedInstanceInfoFromMapID",
    category = "combat_midnight",
    subcategory = "c_modifiedinstance",
    func = _G["C_ModifiedInstance"] and _G["C_ModifiedInstance"]["GetModifiedInstanceInfoFromMapID"],
    funcPath = "C_ModifiedInstance.GetModifiedInstanceInfoFromMapID",
    params = { { name = "mapID", type = "number", default = nil } },
    returns = { { name = "info", type = "ModifiedInstanceInfo", canBeSecret = false } },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}
