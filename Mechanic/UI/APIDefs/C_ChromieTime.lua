-- Generated APIDefinitions for namespace: C_ChromieTime
local _, ns = ...
local APIDefs = ns.APIDefinitions

APIDefs["C_ChromieTime.CloseUI"] = {
    key = "C_ChromieTime.CloseUI",
    name = "CloseUI",
    category = "general",
    subcategory = "c_chromietime",
    funcPath = "C_ChromieTime.CloseUI",
    params = {  },
    returns = {  },
    midnightImpact = "NORMAL",
}

APIDefs["C_ChromieTime.GetChromieTimeExpansionOption"] = {
    key = "C_ChromieTime.GetChromieTimeExpansionOption",
    name = "GetChromieTimeExpansionOption",
    category = "general",
    subcategory = "c_chromietime",
    funcPath = "C_ChromieTime.GetChromieTimeExpansionOption",
    params = { { name = "expansionRecID", type = "number", default = nil } },
    returns = { { name = "info", type = "ChromieTimeExpansionInfo", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_ChromieTime.GetChromieTimeExpansionOptions"] = {
    key = "C_ChromieTime.GetChromieTimeExpansionOptions",
    name = "GetChromieTimeExpansionOptions",
    category = "general",
    subcategory = "c_chromietime",
    funcPath = "C_ChromieTime.GetChromieTimeExpansionOptions",
    params = {  },
    returns = { { name = "expansionOptions", type = "table", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["C_ChromieTime.SelectChromieTimeOption"] = {
    key = "C_ChromieTime.SelectChromieTimeOption",
    name = "SelectChromieTimeOption",
    category = "general",
    subcategory = "c_chromietime",
    funcPath = "C_ChromieTime.SelectChromieTimeOption",
    params = { { name = "chromieTimeExpansionInfoId", type = "number", default = nil } },
    returns = {  },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}
