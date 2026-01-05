-- Generated APIDefinitions for namespace: C_AnimaDiversion
local _, ns = ...
local APIDefs = ns.APIDefinitions

APIDefs["C_AnimaDiversion.CloseUI"] = {
    key = "C_AnimaDiversion.CloseUI",
    name = "CloseUI",
    category = "general",
    subcategory = "c_animadiversion",
    func = _G["C_AnimaDiversion"] and _G["C_AnimaDiversion"]["CloseUI"],
    funcPath = "C_AnimaDiversion.CloseUI",
    params = {  },
    returns = {  },
    midnightImpact = "NORMAL",
}

APIDefs["C_AnimaDiversion.GetAnimaDiversionNodes"] = {
    key = "C_AnimaDiversion.GetAnimaDiversionNodes",
    name = "GetAnimaDiversionNodes",
    category = "general",
    subcategory = "c_animadiversion",
    func = _G["C_AnimaDiversion"] and _G["C_AnimaDiversion"]["GetAnimaDiversionNodes"],
    funcPath = "C_AnimaDiversion.GetAnimaDiversionNodes",
    params = {  },
    returns = { { name = "animaNodes", type = "table", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["C_AnimaDiversion.GetOriginPosition"] = {
    key = "C_AnimaDiversion.GetOriginPosition",
    name = "GetOriginPosition",
    category = "general",
    subcategory = "c_animadiversion",
    func = _G["C_AnimaDiversion"] and _G["C_AnimaDiversion"]["GetOriginPosition"],
    funcPath = "C_AnimaDiversion.GetOriginPosition",
    params = {  },
    returns = { { name = "normalizedPosition", type = "vector2", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["C_AnimaDiversion.GetReinforceProgress"] = {
    key = "C_AnimaDiversion.GetReinforceProgress",
    name = "GetReinforceProgress",
    category = "general",
    subcategory = "c_animadiversion",
    func = _G["C_AnimaDiversion"] and _G["C_AnimaDiversion"]["GetReinforceProgress"],
    funcPath = "C_AnimaDiversion.GetReinforceProgress",
    params = {  },
    returns = { { name = "progress", type = "number", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["C_AnimaDiversion.GetTextureKit"] = {
    key = "C_AnimaDiversion.GetTextureKit",
    name = "GetTextureKit",
    category = "general",
    subcategory = "c_animadiversion",
    func = _G["C_AnimaDiversion"] and _G["C_AnimaDiversion"]["GetTextureKit"],
    funcPath = "C_AnimaDiversion.GetTextureKit",
    params = {  },
    returns = { { name = "textureKit", type = "textureKit", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["C_AnimaDiversion.OpenAnimaDiversionUI"] = {
    key = "C_AnimaDiversion.OpenAnimaDiversionUI",
    name = "OpenAnimaDiversionUI",
    category = "general",
    subcategory = "c_animadiversion",
    func = _G["C_AnimaDiversion"] and _G["C_AnimaDiversion"]["OpenAnimaDiversionUI"],
    funcPath = "C_AnimaDiversion.OpenAnimaDiversionUI",
    params = {  },
    returns = {  },
    midnightImpact = "NORMAL",
}

APIDefs["C_AnimaDiversion.SelectAnimaNode"] = {
    key = "C_AnimaDiversion.SelectAnimaNode",
    name = "SelectAnimaNode",
    category = "combat_midnight",
    subcategory = "c_animadiversion",
    func = _G["C_AnimaDiversion"] and _G["C_AnimaDiversion"]["SelectAnimaNode"],
    funcPath = "C_AnimaDiversion.SelectAnimaNode",
    params = { { name = "talentID", type = "number", default = nil }, { name = "temporary", type = "bool", default = nil } },
    returns = {  },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}
