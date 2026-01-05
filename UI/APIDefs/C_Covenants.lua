-- Generated APIDefinitions for namespace: C_Covenants
local _, ns = ...
local APIDefs = ns.APIDefinitions

APIDefs["C_Covenants.GetActiveCovenantID"] = {
    key = "C_Covenants.GetActiveCovenantID",
    name = "GetActiveCovenantID",
    category = "general",
    subcategory = "c_covenants",
    func = _G["C_Covenants"] and _G["C_Covenants"]["GetActiveCovenantID"],
    funcPath = "C_Covenants.GetActiveCovenantID",
    params = {  },
    returns = { { name = "covenantID", type = "number", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["C_Covenants.GetCovenantData"] = {
    key = "C_Covenants.GetCovenantData",
    name = "GetCovenantData",
    category = "combat_midnight",
    subcategory = "c_covenants",
    func = _G["C_Covenants"] and _G["C_Covenants"]["GetCovenantData"],
    funcPath = "C_Covenants.GetCovenantData",
    params = { { name = "covenantID", type = "number", default = nil } },
    returns = { { name = "data", type = "CovenantData", canBeSecret = false } },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Covenants.GetCovenantIDs"] = {
    key = "C_Covenants.GetCovenantIDs",
    name = "GetCovenantIDs",
    category = "general",
    subcategory = "c_covenants",
    func = _G["C_Covenants"] and _G["C_Covenants"]["GetCovenantIDs"],
    funcPath = "C_Covenants.GetCovenantIDs",
    params = {  },
    returns = { { name = "covenantID", type = "table", canBeSecret = false } },
    midnightImpact = "NORMAL",
}
