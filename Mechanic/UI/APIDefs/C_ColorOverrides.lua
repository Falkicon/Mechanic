-- Generated APIDefinitions for namespace: C_ColorOverrides
local _, ns = ...
local APIDefs = ns.APIDefinitions

APIDefs["C_ColorOverrides.ClearColorOverrides"] = {
    key = "C_ColorOverrides.ClearColorOverrides",
    name = "ClearColorOverrides",
    category = "general",
    subcategory = "c_coloroverrides",
    funcPath = "C_ColorOverrides.ClearColorOverrides",
    params = {  },
    returns = {  },
    midnightImpact = "NORMAL",
}

APIDefs["C_ColorOverrides.GetColorForQuality"] = {
    key = "C_ColorOverrides.GetColorForQuality",
    name = "GetColorForQuality",
    category = "general",
    subcategory = "c_coloroverrides",
    funcPath = "C_ColorOverrides.GetColorForQuality",
    params = { { name = "quality", type = "ItemQuality", default = nil } },
    returns = { { name = "color", type = "colorRGBA", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_ColorOverrides.GetColorOverrideInfo"] = {
    key = "C_ColorOverrides.GetColorOverrideInfo",
    name = "GetColorOverrideInfo",
    category = "general",
    subcategory = "c_coloroverrides",
    funcPath = "C_ColorOverrides.GetColorOverrideInfo",
    params = { { name = "overrideType", type = "ColorOverride", default = nil } },
    returns = { { name = "overrideInfo", type = "ColorOverrideInfo", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_ColorOverrides.GetDefaultColorForQuality"] = {
    key = "C_ColorOverrides.GetDefaultColorForQuality",
    name = "GetDefaultColorForQuality",
    category = "general",
    subcategory = "c_coloroverrides",
    funcPath = "C_ColorOverrides.GetDefaultColorForQuality",
    params = { { name = "quality", type = "ItemQuality", default = nil } },
    returns = { { name = "color", type = "colorRGBA", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_ColorOverrides.RemoveColorOverride"] = {
    key = "C_ColorOverrides.RemoveColorOverride",
    name = "RemoveColorOverride",
    category = "general",
    subcategory = "c_coloroverrides",
    funcPath = "C_ColorOverrides.RemoveColorOverride",
    params = { { name = "overrideType", type = "ColorOverride", default = nil } },
    returns = {  },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_ColorOverrides.SetColorOverride"] = {
    key = "C_ColorOverrides.SetColorOverride",
    name = "SetColorOverride",
    category = "general",
    subcategory = "c_coloroverrides",
    funcPath = "C_ColorOverrides.SetColorOverride",
    params = { { name = "overrideType", type = "ColorOverride", default = nil }, { name = "color", type = "colorRGBA", default = nil } },
    returns = {  },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}
