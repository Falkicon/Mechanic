-- Generated APIDefinitions for namespace: C_PaperDollInfo
local _, ns = ...
local APIDefs = ns.APIDefinitions

APIDefs["C_PaperDollInfo.CanAutoEquipCursorItem"] = {
    key = "C_PaperDollInfo.CanAutoEquipCursorItem",
    name = "CanAutoEquipCursorItem",
    category = "general",
    subcategory = "c_paperdollinfo",
    func = _G["C_PaperDollInfo"] and _G["C_PaperDollInfo"]["CanAutoEquipCursorItem"],
    funcPath = "C_PaperDollInfo.CanAutoEquipCursorItem",
    params = {  },
    returns = { { name = "canAutoEquip", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["C_PaperDollInfo.CanCursorCanGoInSlot"] = {
    key = "C_PaperDollInfo.CanCursorCanGoInSlot",
    name = "CanCursorCanGoInSlot",
    category = "combat_midnight",
    subcategory = "c_paperdollinfo",
    func = _G["C_PaperDollInfo"] and _G["C_PaperDollInfo"]["CanCursorCanGoInSlot"],
    funcPath = "C_PaperDollInfo.CanCursorCanGoInSlot",
    params = { { name = "slotIndex", type = "luaIndex", default = nil } },
    returns = { { name = "canOccupySlot", type = "bool", canBeSecret = false } },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_PaperDollInfo.GetArmorEffectiveness"] = {
    key = "C_PaperDollInfo.GetArmorEffectiveness",
    name = "GetArmorEffectiveness",
    category = "combat_midnight",
    subcategory = "c_paperdollinfo",
    func = _G["C_PaperDollInfo"] and _G["C_PaperDollInfo"]["GetArmorEffectiveness"],
    funcPath = "C_PaperDollInfo.GetArmorEffectiveness",
    params = { { name = "armor", type = "number", default = nil }, { name = "attackerLevel", type = "number", default = nil } },
    returns = { { name = "effectiveness", type = "number", canBeSecret = false } },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_PaperDollInfo.GetArmorEffectivenessAgainstTarget"] = {
    key = "C_PaperDollInfo.GetArmorEffectivenessAgainstTarget",
    name = "GetArmorEffectivenessAgainstTarget",
    category = "combat_midnight",
    subcategory = "c_paperdollinfo",
    func = _G["C_PaperDollInfo"] and _G["C_PaperDollInfo"]["GetArmorEffectivenessAgainstTarget"],
    funcPath = "C_PaperDollInfo.GetArmorEffectivenessAgainstTarget",
    params = { { name = "armor", type = "number", default = nil } },
    returns = { { name = "effectiveness", type = "number", canBeSecret = false } },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_PaperDollInfo.GetInspectAzeriteItemEmpoweredChoices"] = {
    key = "C_PaperDollInfo.GetInspectAzeriteItemEmpoweredChoices",
    name = "GetInspectAzeriteItemEmpoweredChoices",
    category = "combat_midnight",
    subcategory = "c_paperdollinfo",
    func = _G["C_PaperDollInfo"] and _G["C_PaperDollInfo"]["GetInspectAzeriteItemEmpoweredChoices"],
    funcPath = "C_PaperDollInfo.GetInspectAzeriteItemEmpoweredChoices",
    params = { { name = "unit", type = "UnitToken", default = "player" }, { name = "equipmentSlotIndex", type = "luaIndex", default = nil } },
    returns = { { name = "azeritePowerIDs", type = "table", canBeSecret = false } },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_PaperDollInfo.GetInspectGuildInfo"] = {
    key = "C_PaperDollInfo.GetInspectGuildInfo",
    name = "GetInspectGuildInfo",
    category = "combat_midnight",
    subcategory = "c_paperdollinfo",
    func = _G["C_PaperDollInfo"] and _G["C_PaperDollInfo"]["GetInspectGuildInfo"],
    funcPath = "C_PaperDollInfo.GetInspectGuildInfo",
    params = { { name = "unitString", type = "string", default = nil } },
    returns = { { name = "achievementPoints", type = "number", canBeSecret = false }, { name = "numMembers", type = "number", canBeSecret = false }, { name = "guildName", type = "string", canBeSecret = false }, { name = "realmName", type = "string", canBeSecret = false } },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_PaperDollInfo.GetInspectItemLevel"] = {
    key = "C_PaperDollInfo.GetInspectItemLevel",
    name = "GetInspectItemLevel",
    category = "combat_midnight",
    subcategory = "c_paperdollinfo",
    func = _G["C_PaperDollInfo"] and _G["C_PaperDollInfo"]["GetInspectItemLevel"],
    funcPath = "C_PaperDollInfo.GetInspectItemLevel",
    params = { { name = "unit", type = "UnitToken", default = "player" } },
    returns = { { name = "equippedItemLevel", type = "number", canBeSecret = false } },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_PaperDollInfo.GetInspectRatedBGBlitzData"] = {
    key = "C_PaperDollInfo.GetInspectRatedBGBlitzData",
    name = "GetInspectRatedBGBlitzData",
    category = "general",
    subcategory = "c_paperdollinfo",
    func = _G["C_PaperDollInfo"] and _G["C_PaperDollInfo"]["GetInspectRatedBGBlitzData"],
    funcPath = "C_PaperDollInfo.GetInspectRatedBGBlitzData",
    params = {  },
    returns = { { name = "ratedBGBlitzData", type = "InspectPVPData", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["C_PaperDollInfo.GetInspectRatedBGData"] = {
    key = "C_PaperDollInfo.GetInspectRatedBGData",
    name = "GetInspectRatedBGData",
    category = "general",
    subcategory = "c_paperdollinfo",
    func = _G["C_PaperDollInfo"] and _G["C_PaperDollInfo"]["GetInspectRatedBGData"],
    funcPath = "C_PaperDollInfo.GetInspectRatedBGData",
    params = {  },
    returns = { { name = "ratedBGData", type = "InspectRatedBGData", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["C_PaperDollInfo.GetInspectRatedSoloShuffleData"] = {
    key = "C_PaperDollInfo.GetInspectRatedSoloShuffleData",
    name = "GetInspectRatedSoloShuffleData",
    category = "general",
    subcategory = "c_paperdollinfo",
    func = _G["C_PaperDollInfo"] and _G["C_PaperDollInfo"]["GetInspectRatedSoloShuffleData"],
    funcPath = "C_PaperDollInfo.GetInspectRatedSoloShuffleData",
    params = {  },
    returns = { { name = "ratedSoloShuffleData", type = "InspectPVPData", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["C_PaperDollInfo.GetMinItemLevel"] = {
    key = "C_PaperDollInfo.GetMinItemLevel",
    name = "GetMinItemLevel",
    category = "general",
    subcategory = "c_paperdollinfo",
    func = _G["C_PaperDollInfo"] and _G["C_PaperDollInfo"]["GetMinItemLevel"],
    funcPath = "C_PaperDollInfo.GetMinItemLevel",
    params = {  },
    returns = { { name = "minItemLevel", type = "number", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["C_PaperDollInfo.GetStaggerPercentage"] = {
    key = "C_PaperDollInfo.GetStaggerPercentage",
    name = "GetStaggerPercentage",
    category = "combat_midnight",
    subcategory = "c_paperdollinfo",
    func = _G["C_PaperDollInfo"] and _G["C_PaperDollInfo"]["GetStaggerPercentage"],
    funcPath = "C_PaperDollInfo.GetStaggerPercentage",
    params = { { name = "unit", type = "UnitToken", default = "player" } },
    returns = { { name = "stagger", type = "number", canBeSecret = false }, { name = "staggerAgainstTarget", type = "number", canBeSecret = false } },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_PaperDollInfo.IsInventorySlotEnabled"] = {
    key = "C_PaperDollInfo.IsInventorySlotEnabled",
    name = "IsInventorySlotEnabled",
    category = "combat_midnight",
    subcategory = "c_paperdollinfo",
    func = _G["C_PaperDollInfo"] and _G["C_PaperDollInfo"]["IsInventorySlotEnabled"],
    funcPath = "C_PaperDollInfo.IsInventorySlotEnabled",
    params = { { name = "slotName", type = "stringView", default = nil } },
    returns = { { name = "isEnabled", type = "bool", canBeSecret = false } },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_PaperDollInfo.IsRangedSlotShown"] = {
    key = "C_PaperDollInfo.IsRangedSlotShown",
    name = "IsRangedSlotShown",
    category = "general",
    subcategory = "c_paperdollinfo",
    func = _G["C_PaperDollInfo"] and _G["C_PaperDollInfo"]["IsRangedSlotShown"],
    funcPath = "C_PaperDollInfo.IsRangedSlotShown",
    params = {  },
    returns = { { name = "isShown", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["C_PaperDollInfo.OffhandHasShield"] = {
    key = "C_PaperDollInfo.OffhandHasShield",
    name = "OffhandHasShield",
    category = "general",
    subcategory = "c_paperdollinfo",
    func = _G["C_PaperDollInfo"] and _G["C_PaperDollInfo"]["OffhandHasShield"],
    funcPath = "C_PaperDollInfo.OffhandHasShield",
    params = {  },
    returns = { { name = "offhandHasShield", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["C_PaperDollInfo.OffhandHasWeapon"] = {
    key = "C_PaperDollInfo.OffhandHasWeapon",
    name = "OffhandHasWeapon",
    category = "general",
    subcategory = "c_paperdollinfo",
    func = _G["C_PaperDollInfo"] and _G["C_PaperDollInfo"]["OffhandHasWeapon"],
    funcPath = "C_PaperDollInfo.OffhandHasWeapon",
    params = {  },
    returns = { { name = "offhandHasWeapon", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
}
