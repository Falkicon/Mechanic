-- Generated APIDefinitions for namespace: C_ExternalEventURL
local _, ns = ...
local APIDefs = ns.APIDefinitions

APIDefs["C_ExternalEventURL.HasURL"] = {
    key = "C_ExternalEventURL.HasURL",
    name = "HasURL",
    category = "general",
    subcategory = "c_externaleventurl",
    func = _G["C_ExternalEventURL"] and _G["C_ExternalEventURL"]["HasURL"],
    funcPath = "C_ExternalEventURL.HasURL",
    params = {  },
    returns = { { name = "hasURL", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["C_ExternalEventURL.IsNew"] = {
    key = "C_ExternalEventURL.IsNew",
    name = "IsNew",
    category = "general",
    subcategory = "c_externaleventurl",
    func = _G["C_ExternalEventURL"] and _G["C_ExternalEventURL"]["IsNew"],
    funcPath = "C_ExternalEventURL.IsNew",
    params = {  },
    returns = { { name = "isNew", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["C_ExternalEventURL.LaunchURL"] = {
    key = "C_ExternalEventURL.LaunchURL",
    name = "LaunchURL",
    category = "general",
    subcategory = "c_externaleventurl",
    func = _G["C_ExternalEventURL"] and _G["C_ExternalEventURL"]["LaunchURL"],
    funcPath = "C_ExternalEventURL.LaunchURL",
    params = {  },
    returns = {  },
    midnightImpact = "NORMAL",
}
