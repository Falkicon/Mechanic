-- Generated APIDefinitions for namespace: C_ItemSocketInfo
local _, ns = ...
local APIDefs = ns.APIDefinitions

APIDefs["C_ItemSocketInfo.AcceptSockets"] = {
    key = "C_ItemSocketInfo.AcceptSockets",
    name = "AcceptSockets",
    category = "item",
    subcategory = "c_itemsocketinfo",
    func = _G["C_ItemSocketInfo"] and _G["C_ItemSocketInfo"]["AcceptSockets"],
    funcPath = "C_ItemSocketInfo.AcceptSockets",
    params = {  },
    returns = {  },
    midnightImpact = "NORMAL",
}

APIDefs["C_ItemSocketInfo.ClickSocketButton"] = {
    key = "C_ItemSocketInfo.ClickSocketButton",
    name = "ClickSocketButton",
    category = "combat_midnight",
    subcategory = "c_itemsocketinfo",
    func = _G["C_ItemSocketInfo"] and _G["C_ItemSocketInfo"]["ClickSocketButton"],
    funcPath = "C_ItemSocketInfo.ClickSocketButton",
    params = { { name = "index", type = "luaIndex", default = nil } },
    returns = {  },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_ItemSocketInfo.CloseSocketInfo"] = {
    key = "C_ItemSocketInfo.CloseSocketInfo",
    name = "CloseSocketInfo",
    category = "item",
    subcategory = "c_itemsocketinfo",
    func = _G["C_ItemSocketInfo"] and _G["C_ItemSocketInfo"]["CloseSocketInfo"],
    funcPath = "C_ItemSocketInfo.CloseSocketInfo",
    params = {  },
    returns = {  },
    midnightImpact = "NORMAL",
}

APIDefs["C_ItemSocketInfo.CompleteSocketing"] = {
    key = "C_ItemSocketInfo.CompleteSocketing",
    name = "CompleteSocketing",
    category = "item",
    subcategory = "c_itemsocketinfo",
    func = _G["C_ItemSocketInfo"] and _G["C_ItemSocketInfo"]["CompleteSocketing"],
    funcPath = "C_ItemSocketInfo.CompleteSocketing",
    params = {  },
    returns = {  },
    midnightImpact = "NORMAL",
}

APIDefs["C_ItemSocketInfo.GetCurrUIType"] = {
    key = "C_ItemSocketInfo.GetCurrUIType",
    name = "GetCurrUIType",
    category = "item",
    subcategory = "c_itemsocketinfo",
    func = _G["C_ItemSocketInfo"] and _G["C_ItemSocketInfo"]["GetCurrUIType"],
    funcPath = "C_ItemSocketInfo.GetCurrUIType",
    params = {  },
    returns = { { name = "uiType", type = "ItemSocketInfoUIType", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["C_ItemSocketInfo.GetExistingSocketInfo"] = {
    key = "C_ItemSocketInfo.GetExistingSocketInfo",
    name = "GetExistingSocketInfo",
    category = "combat_midnight",
    subcategory = "c_itemsocketinfo",
    func = _G["C_ItemSocketInfo"] and _G["C_ItemSocketInfo"]["GetExistingSocketInfo"],
    funcPath = "C_ItemSocketInfo.GetExistingSocketInfo",
    params = { { name = "index", type = "luaIndex", default = nil } },
    returns = { { name = "name", type = "string", canBeSecret = false }, { name = "icon", type = "fileID", canBeSecret = false }, { name = "gemMatchesSocket", type = "bool", canBeSecret = false } },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_ItemSocketInfo.GetExistingSocketLink"] = {
    key = "C_ItemSocketInfo.GetExistingSocketLink",
    name = "GetExistingSocketLink",
    category = "combat_midnight",
    subcategory = "c_itemsocketinfo",
    func = _G["C_ItemSocketInfo"] and _G["C_ItemSocketInfo"]["GetExistingSocketLink"],
    funcPath = "C_ItemSocketInfo.GetExistingSocketLink",
    params = { { name = "index", type = "luaIndex", default = nil } },
    returns = { { name = "existingSocketLink", type = "string", canBeSecret = false } },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_ItemSocketInfo.GetNewSocketInfo"] = {
    key = "C_ItemSocketInfo.GetNewSocketInfo",
    name = "GetNewSocketInfo",
    category = "combat_midnight",
    subcategory = "c_itemsocketinfo",
    func = _G["C_ItemSocketInfo"] and _G["C_ItemSocketInfo"]["GetNewSocketInfo"],
    funcPath = "C_ItemSocketInfo.GetNewSocketInfo",
    params = { { name = "index", type = "luaIndex", default = nil } },
    returns = { { name = "name", type = "string", canBeSecret = false }, { name = "icon", type = "fileID", canBeSecret = false }, { name = "gemMatchesSocket", type = "bool", canBeSecret = false } },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_ItemSocketInfo.GetNewSocketLink"] = {
    key = "C_ItemSocketInfo.GetNewSocketLink",
    name = "GetNewSocketLink",
    category = "combat_midnight",
    subcategory = "c_itemsocketinfo",
    func = _G["C_ItemSocketInfo"] and _G["C_ItemSocketInfo"]["GetNewSocketLink"],
    funcPath = "C_ItemSocketInfo.GetNewSocketLink",
    params = { { name = "index", type = "luaIndex", default = nil } },
    returns = { { name = "newSocketLink", type = "string", canBeSecret = false } },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_ItemSocketInfo.GetNumSockets"] = {
    key = "C_ItemSocketInfo.GetNumSockets",
    name = "GetNumSockets",
    category = "item",
    subcategory = "c_itemsocketinfo",
    func = _G["C_ItemSocketInfo"] and _G["C_ItemSocketInfo"]["GetNumSockets"],
    funcPath = "C_ItemSocketInfo.GetNumSockets",
    params = {  },
    returns = { { name = "numSockets", type = "number", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["C_ItemSocketInfo.GetSocketItemBoundTradeable"] = {
    key = "C_ItemSocketInfo.GetSocketItemBoundTradeable",
    name = "GetSocketItemBoundTradeable",
    category = "item",
    subcategory = "c_itemsocketinfo",
    func = _G["C_ItemSocketInfo"] and _G["C_ItemSocketInfo"]["GetSocketItemBoundTradeable"],
    funcPath = "C_ItemSocketInfo.GetSocketItemBoundTradeable",
    params = {  },
    returns = { { name = "socketItemTradeable", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["C_ItemSocketInfo.GetSocketItemInfo"] = {
    key = "C_ItemSocketInfo.GetSocketItemInfo",
    name = "GetSocketItemInfo",
    category = "item",
    subcategory = "c_itemsocketinfo",
    func = _G["C_ItemSocketInfo"] and _G["C_ItemSocketInfo"]["GetSocketItemInfo"],
    funcPath = "C_ItemSocketInfo.GetSocketItemInfo",
    params = {  },
    returns = { { name = "name", type = "string", canBeSecret = false }, { name = "icon", type = "fileID", canBeSecret = false }, { name = "quality", type = "ItemQuality", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["C_ItemSocketInfo.GetSocketItemRefundable"] = {
    key = "C_ItemSocketInfo.GetSocketItemRefundable",
    name = "GetSocketItemRefundable",
    category = "item",
    subcategory = "c_itemsocketinfo",
    func = _G["C_ItemSocketInfo"] and _G["C_ItemSocketInfo"]["GetSocketItemRefundable"],
    funcPath = "C_ItemSocketInfo.GetSocketItemRefundable",
    params = {  },
    returns = { { name = "socketItemRefundable", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["C_ItemSocketInfo.GetSocketTypes"] = {
    key = "C_ItemSocketInfo.GetSocketTypes",
    name = "GetSocketTypes",
    category = "combat_midnight",
    subcategory = "c_itemsocketinfo",
    func = _G["C_ItemSocketInfo"] and _G["C_ItemSocketInfo"]["GetSocketTypes"],
    funcPath = "C_ItemSocketInfo.GetSocketTypes",
    params = { { name = "index", type = "luaIndex", default = nil } },
    returns = { { name = "socketType", type = "string", canBeSecret = false } },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_ItemSocketInfo.HasBoundGemProposed"] = {
    key = "C_ItemSocketInfo.HasBoundGemProposed",
    name = "HasBoundGemProposed",
    category = "item",
    subcategory = "c_itemsocketinfo",
    func = _G["C_ItemSocketInfo"] and _G["C_ItemSocketInfo"]["HasBoundGemProposed"],
    funcPath = "C_ItemSocketInfo.HasBoundGemProposed",
    params = {  },
    returns = { { name = "hasBoundGemProposed", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["C_ItemSocketInfo.IsArtifactRelicItem"] = {
    key = "C_ItemSocketInfo.IsArtifactRelicItem",
    name = "IsArtifactRelicItem",
    category = "combat_midnight",
    subcategory = "c_itemsocketinfo",
    func = _G["C_ItemSocketInfo"] and _G["C_ItemSocketInfo"]["IsArtifactRelicItem"],
    funcPath = "C_ItemSocketInfo.IsArtifactRelicItem",
    params = { { name = "info", type = "ItemInfo", default = nil } },
    returns = { { name = "isArtifactRelicItem", type = "bool", canBeSecret = false } },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}
