-- Generated APIDefinitions for namespace: C_XMLUtil
local _, ns = ...
local APIDefs = ns.APIDefinitions

APIDefs["C_XMLUtil.GetTemplateInfo"] = {
    key = "C_XMLUtil.GetTemplateInfo",
    name = "GetTemplateInfo",
    category = "combat_midnight",
    subcategory = "c_xmlutil",
    func = _G["C_XMLUtil"] and _G["C_XMLUtil"]["GetTemplateInfo"],
    funcPath = "C_XMLUtil.GetTemplateInfo",
    params = { { name = "name", type = "cstring", default = nil } },
    returns = { { name = "info", type = "XMLTemplateInfo", canBeSecret = false } },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_XMLUtil.GetTemplates"] = {
    key = "C_XMLUtil.GetTemplates",
    name = "GetTemplates",
    category = "general",
    subcategory = "c_xmlutil",
    func = _G["C_XMLUtil"] and _G["C_XMLUtil"]["GetTemplates"],
    funcPath = "C_XMLUtil.GetTemplates",
    params = {  },
    returns = { { name = "templates", type = "table", canBeSecret = false } },
    midnightImpact = "NORMAL",
}
