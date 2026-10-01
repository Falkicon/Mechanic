-- Generated APIDefinitions for namespace: C_ItemInteraction
local _, ns = ...
local APIDefs = ns.APIDefinitions

APIDefs["C_ItemInteraction.ClearPendingItem"] = {
    key = "C_ItemInteraction.ClearPendingItem",
    name = "ClearPendingItem",
    category = "item",
    subcategory = "c_iteminteraction",
    funcPath = "C_ItemInteraction.ClearPendingItem",
    params = {  },
    returns = {  },
    midnightImpact = "NORMAL",
}

APIDefs["C_ItemInteraction.CloseUI"] = {
    key = "C_ItemInteraction.CloseUI",
    name = "CloseUI",
    category = "item",
    subcategory = "c_iteminteraction",
    funcPath = "C_ItemInteraction.CloseUI",
    params = {  },
    returns = {  },
    midnightImpact = "NORMAL",
}

APIDefs["C_ItemInteraction.GetChargeInfo"] = {
    key = "C_ItemInteraction.GetChargeInfo",
    name = "GetChargeInfo",
    category = "item",
    subcategory = "c_iteminteraction",
    funcPath = "C_ItemInteraction.GetChargeInfo",
    params = {  },
    returns = { { name = "chargeInfo", type = "ItemInteractionChargeInfo", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["C_ItemInteraction.GetItemConversionCurrencyCost"] = {
    key = "C_ItemInteraction.GetItemConversionCurrencyCost",
    name = "GetItemConversionCurrencyCost",
    category = "item",
    subcategory = "c_iteminteraction",
    funcPath = "C_ItemInteraction.GetItemConversionCurrencyCost",
    params = { { name = "item", type = "ItemLocation", default = nil } },
    returns = { { name = "conversionCost", type = "ConversionCurrencyCost", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_ItemInteraction.GetItemInteractionInfo"] = {
    key = "C_ItemInteraction.GetItemInteractionInfo",
    name = "GetItemInteractionInfo",
    category = "item",
    subcategory = "c_iteminteraction",
    funcPath = "C_ItemInteraction.GetItemInteractionInfo",
    params = {  },
    returns = { { name = "info", type = "ItemInteractionFrameInfo", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["C_ItemInteraction.GetItemInteractionSpellId"] = {
    key = "C_ItemInteraction.GetItemInteractionSpellId",
    name = "GetItemInteractionSpellId",
    category = "item",
    subcategory = "c_iteminteraction",
    funcPath = "C_ItemInteraction.GetItemInteractionSpellId",
    params = {  },
    returns = { { name = "spellId", type = "number", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["C_ItemInteraction.InitializeFrame"] = {
    key = "C_ItemInteraction.InitializeFrame",
    name = "InitializeFrame",
    category = "item",
    subcategory = "c_iteminteraction",
    funcPath = "C_ItemInteraction.InitializeFrame",
    params = {  },
    returns = {  },
    midnightImpact = "NORMAL",
}

APIDefs["C_ItemInteraction.PerformItemInteraction"] = {
    key = "C_ItemInteraction.PerformItemInteraction",
    name = "PerformItemInteraction",
    category = "item",
    subcategory = "c_iteminteraction",
    funcPath = "C_ItemInteraction.PerformItemInteraction",
    params = {  },
    returns = {  },
    midnightImpact = "NORMAL",
}

APIDefs["C_ItemInteraction.Reset"] = {
    key = "C_ItemInteraction.Reset",
    name = "Reset",
    category = "item",
    subcategory = "c_iteminteraction",
    funcPath = "C_ItemInteraction.Reset",
    params = {  },
    returns = {  },
    midnightImpact = "NORMAL",
}

APIDefs["C_ItemInteraction.SetPendingItem"] = {
    key = "C_ItemInteraction.SetPendingItem",
    name = "SetPendingItem",
    category = "item",
    subcategory = "c_iteminteraction",
    funcPath = "C_ItemInteraction.SetPendingItem",
    params = { { name = "item", type = "ItemLocation", default = nil } },
    returns = { { name = "success", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}
