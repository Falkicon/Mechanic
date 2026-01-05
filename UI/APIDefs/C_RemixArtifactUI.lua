-- Generated APIDefinitions for namespace: C_RemixArtifactUI
local _, ns = ...
local APIDefs = ns.APIDefinitions

APIDefs["C_RemixArtifactUI.ClearRemixArtifactItem"] = {
    key = "C_RemixArtifactUI.ClearRemixArtifactItem",
    name = "ClearRemixArtifactItem",
    category = "general",
    subcategory = "c_remixartifactui",
    func = _G["C_RemixArtifactUI"] and _G["C_RemixArtifactUI"]["ClearRemixArtifactItem"],
    funcPath = "C_RemixArtifactUI.ClearRemixArtifactItem",
    params = {  },
    returns = {  },
    midnightImpact = "NORMAL",
}

APIDefs["C_RemixArtifactUI.GetAppearanceInfoByID"] = {
    key = "C_RemixArtifactUI.GetAppearanceInfoByID",
    name = "GetAppearanceInfoByID",
    category = "combat_midnight",
    subcategory = "c_remixartifactui",
    func = _G["C_RemixArtifactUI"] and _G["C_RemixArtifactUI"]["GetAppearanceInfoByID"],
    funcPath = "C_RemixArtifactUI.GetAppearanceInfoByID",
    params = { { name = "artifactAppearanceID", type = "number", default = nil } },
    returns = { { name = "uiCameraID", type = "number", canBeSecret = false }, { name = "altHandUICameraID", type = "number", canBeSecret = false } },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_RemixArtifactUI.GetArtifactArtInfo"] = {
    key = "C_RemixArtifactUI.GetArtifactArtInfo",
    name = "GetArtifactArtInfo",
    category = "general",
    subcategory = "c_remixartifactui",
    func = _G["C_RemixArtifactUI"] and _G["C_RemixArtifactUI"]["GetArtifactArtInfo"],
    funcPath = "C_RemixArtifactUI.GetArtifactArtInfo",
    params = {  },
    returns = { { name = "artifactArtInfo", type = "RemixArtifactArtInfo", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["C_RemixArtifactUI.GetArtifactItemInfo"] = {
    key = "C_RemixArtifactUI.GetArtifactItemInfo",
    name = "GetArtifactItemInfo",
    category = "general",
    subcategory = "c_remixartifactui",
    func = _G["C_RemixArtifactUI"] and _G["C_RemixArtifactUI"]["GetArtifactItemInfo"],
    funcPath = "C_RemixArtifactUI.GetArtifactItemInfo",
    params = {  },
    returns = { { name = "itemID", type = "number", canBeSecret = false }, { name = "altItemID", type = "number", canBeSecret = false }, { name = "artifactAppearanceID", type = "number", canBeSecret = false }, { name = "appearanceModID", type = "number", canBeSecret = false }, { name = "itemAppearanceID", type = "number", canBeSecret = false }, { name = "altItemAppearanceID", type = "number", canBeSecret = false }, { name = "altOnTop", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["C_RemixArtifactUI.GetCurrArtifactItemID"] = {
    key = "C_RemixArtifactUI.GetCurrArtifactItemID",
    name = "GetCurrArtifactItemID",
    category = "general",
    subcategory = "c_remixartifactui",
    func = _G["C_RemixArtifactUI"] and _G["C_RemixArtifactUI"]["GetCurrArtifactItemID"],
    funcPath = "C_RemixArtifactUI.GetCurrArtifactItemID",
    params = {  },
    returns = { { name = "reqitemID", type = "number", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["C_RemixArtifactUI.GetCurrItemSpecIndex"] = {
    key = "C_RemixArtifactUI.GetCurrItemSpecIndex",
    name = "GetCurrItemSpecIndex",
    category = "general",
    subcategory = "c_remixartifactui",
    func = _G["C_RemixArtifactUI"] and _G["C_RemixArtifactUI"]["GetCurrItemSpecIndex"],
    funcPath = "C_RemixArtifactUI.GetCurrItemSpecIndex",
    params = {  },
    returns = { { name = "specIndex", type = "luaIndex", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["C_RemixArtifactUI.GetCurrTraitTreeID"] = {
    key = "C_RemixArtifactUI.GetCurrTraitTreeID",
    name = "GetCurrTraitTreeID",
    category = "general",
    subcategory = "c_remixartifactui",
    func = _G["C_RemixArtifactUI"] and _G["C_RemixArtifactUI"]["GetCurrTraitTreeID"],
    funcPath = "C_RemixArtifactUI.GetCurrTraitTreeID",
    params = {  },
    returns = { { name = "traitTreeID", type = "number", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["C_RemixArtifactUI.ItemInSlotIsRemixArtifact"] = {
    key = "C_RemixArtifactUI.ItemInSlotIsRemixArtifact",
    name = "ItemInSlotIsRemixArtifact",
    category = "combat_midnight",
    subcategory = "c_remixartifactui",
    func = _G["C_RemixArtifactUI"] and _G["C_RemixArtifactUI"]["ItemInSlotIsRemixArtifact"],
    funcPath = "C_RemixArtifactUI.ItemInSlotIsRemixArtifact",
    params = { { name = "invSlot", type = "luaIndex", default = nil } },
    returns = { { name = "isRemixArtifact", type = "bool", canBeSecret = false } },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}
