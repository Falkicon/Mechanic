-- Generated APIDefinitions for namespace: C_Glue
local _, ns = ...
local APIDefs = ns.APIDefinitions

APIDefs["C_Glue.IsFirstLoadThisSession"] = {
    key = "C_Glue.IsFirstLoadThisSession",
    name = "IsFirstLoadThisSession",
    category = "general",
    subcategory = "c_glue",
    funcPath = "C_Glue.IsFirstLoadThisSession",
    params = {  },
    returns = { { name = "IsFirstLoadThisSession", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["C_Glue.IsOnGlueScreen"] = {
    key = "C_Glue.IsOnGlueScreen",
    name = "IsOnGlueScreen",
    category = "general",
    subcategory = "c_glue",
    funcPath = "C_Glue.IsOnGlueScreen",
    params = {  },
    returns = { { name = "isOnGlueScreen", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
}
