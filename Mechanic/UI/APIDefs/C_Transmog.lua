-- Generated APIDefinitions for namespace: C_Transmog
local _, ns = ...
local APIDefs = ns.APIDefinitions

APIDefs["C_Transmog.CanHaveSecondaryAppearanceForSlotID"] = {
    key = "C_Transmog.CanHaveSecondaryAppearanceForSlotID",
    name = "CanHaveSecondaryAppearanceForSlotID",
    category = "general",
    subcategory = "c_transmog",
    funcPath = "C_Transmog.CanHaveSecondaryAppearanceForSlotID",
    params = { { name = "slotID", type = "luaIndex", default = nil } },
    returns = { { name = "canHaveSecondaryAppearance", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Transmog.ExtractTransmogIDList"] = {
    key = "C_Transmog.ExtractTransmogIDList",
    name = "ExtractTransmogIDList",
    category = "general",
    subcategory = "c_transmog",
    funcPath = "C_Transmog.ExtractTransmogIDList",
    params = { { name = "input", type = "cstring", default = nil } },
    returns = { { name = "transmogIDList", type = "table", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Transmog.GetAllSetAppearancesByID"] = {
    key = "C_Transmog.GetAllSetAppearancesByID",
    name = "GetAllSetAppearancesByID",
    category = "general",
    subcategory = "c_transmog",
    funcPath = "C_Transmog.GetAllSetAppearancesByID",
    params = { { name = "setID", type = "number", default = nil } },
    returns = { { name = "setItems", type = "table", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Transmog.GetItemIDForSource"] = {
    key = "C_Transmog.GetItemIDForSource",
    name = "GetItemIDForSource",
    category = "general",
    subcategory = "c_transmog",
    funcPath = "C_Transmog.GetItemIDForSource",
    params = { { name = "itemModifiedAppearanceID", type = "number", default = nil } },
    returns = { { name = "itemID", type = "number", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Transmog.GetSlotEffectiveCategory"] = {
    key = "C_Transmog.GetSlotEffectiveCategory",
    name = "GetSlotEffectiveCategory",
    category = "general",
    subcategory = "c_transmog",
    funcPath = "C_Transmog.GetSlotEffectiveCategory",
    params = { { name = "transmogLocation", type = "TransmogLocation", default = nil } },
    returns = { { name = "categoryID", type = "TransmogCollectionType", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Transmog.GetSlotForInventoryType"] = {
    key = "C_Transmog.GetSlotForInventoryType",
    name = "GetSlotForInventoryType",
    category = "general",
    subcategory = "c_transmog",
    funcPath = "C_Transmog.GetSlotForInventoryType",
    params = { { name = "inventoryType", type = "luaIndex", default = nil } },
    returns = { { name = "slot", type = "luaIndex", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Transmog.GetSlotVisualInfo"] = {
    key = "C_Transmog.GetSlotVisualInfo",
    name = "GetSlotVisualInfo",
    category = "general",
    subcategory = "c_transmog",
    funcPath = "C_Transmog.GetSlotVisualInfo",
    params = { { name = "transmogLocation", type = "TransmogLocation", default = nil } },
    returns = { { name = "slotVisualInfo", type = "TransmogSlotVisualInfo", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Transmog.IsAtTransmogNPC"] = {
    key = "C_Transmog.IsAtTransmogNPC",
    name = "IsAtTransmogNPC",
    category = "general",
    subcategory = "c_transmog",
    funcPath = "C_Transmog.IsAtTransmogNPC",
    params = {  },
    returns = { { name = "isAtNPC", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
}
