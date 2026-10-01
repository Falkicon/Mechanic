-- Generated APIDefinitions for namespace: C_ClassColor
local _, ns = ...
local APIDefs = ns.APIDefinitions

APIDefs["C_ClassColor.GetClassColor"] = {
    key = "C_ClassColor.GetClassColor",
    name = "GetClassColor",
    category = "general",
    subcategory = "c_classcolor",
    funcPath = "C_ClassColor.GetClassColor",
    params = { { name = "className", type = "string", default = nil } },
    returns = { { name = "classColor", type = "colorRGB", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenTainted",
}
