-- Generated APIDefinitions for namespace: C_WorldLootObject
local _, ns = ...
local APIDefs = ns.APIDefinitions

APIDefs["C_WorldLootObject.DoesSlotMatchInventoryType"] = {
    key = "C_WorldLootObject.DoesSlotMatchInventoryType",
    name = "DoesSlotMatchInventoryType",
    category = "combat_midnight",
    subcategory = "c_worldlootobject",
    func = _G["C_WorldLootObject"] and _G["C_WorldLootObject"]["DoesSlotMatchInventoryType"],
    funcPath = "C_WorldLootObject.DoesSlotMatchInventoryType",
    params = { { name = "slot", type = "number", default = nil }, { name = "inventoryType", type = "InventoryType", default = nil } },
    returns = { { name = "matches", type = "bool", canBeSecret = false } },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_WorldLootObject.GetWorldLootObjectDistanceSquared"] = {
    key = "C_WorldLootObject.GetWorldLootObjectDistanceSquared",
    name = "GetWorldLootObjectDistanceSquared",
    category = "combat_midnight",
    subcategory = "c_worldlootobject",
    func = _G["C_WorldLootObject"] and _G["C_WorldLootObject"]["GetWorldLootObjectDistanceSquared"],
    funcPath = "C_WorldLootObject.GetWorldLootObjectDistanceSquared",
    params = { { name = "unitToken", type = "UnitToken", default = "player" } },
    returns = { { name = "distanceSquared", type = "number", canBeSecret = false } },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_WorldLootObject.GetWorldLootObjectInfo"] = {
    key = "C_WorldLootObject.GetWorldLootObjectInfo",
    name = "GetWorldLootObjectInfo",
    category = "combat_midnight",
    subcategory = "c_worldlootobject",
    func = _G["C_WorldLootObject"] and _G["C_WorldLootObject"]["GetWorldLootObjectInfo"],
    funcPath = "C_WorldLootObject.GetWorldLootObjectInfo",
    params = { { name = "unitToken", type = "UnitToken", default = "player" } },
    returns = { { name = "info", type = "WorldLootObjectInfo", canBeSecret = false } },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_WorldLootObject.GetWorldLootObjectInfoByGUID"] = {
    key = "C_WorldLootObject.GetWorldLootObjectInfoByGUID",
    name = "GetWorldLootObjectInfoByGUID",
    category = "combat_midnight",
    subcategory = "c_worldlootobject",
    func = _G["C_WorldLootObject"] and _G["C_WorldLootObject"]["GetWorldLootObjectInfoByGUID"],
    funcPath = "C_WorldLootObject.GetWorldLootObjectInfoByGUID",
    params = { { name = "objectGUID", type = "WOWGUID", default = nil } },
    returns = { { name = "info", type = "WorldLootObjectInfo", canBeSecret = false } },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_WorldLootObject.IsWorldLootObject"] = {
    key = "C_WorldLootObject.IsWorldLootObject",
    name = "IsWorldLootObject",
    category = "combat_midnight",
    subcategory = "c_worldlootobject",
    func = _G["C_WorldLootObject"] and _G["C_WorldLootObject"]["IsWorldLootObject"],
    funcPath = "C_WorldLootObject.IsWorldLootObject",
    params = { { name = "unitToken", type = "UnitToken", default = "player" } },
    returns = { { name = "isWorldLootObject", type = "bool", canBeSecret = false } },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_WorldLootObject.IsWorldLootObjectByGUID"] = {
    key = "C_WorldLootObject.IsWorldLootObjectByGUID",
    name = "IsWorldLootObjectByGUID",
    category = "combat_midnight",
    subcategory = "c_worldlootobject",
    func = _G["C_WorldLootObject"] and _G["C_WorldLootObject"]["IsWorldLootObjectByGUID"],
    funcPath = "C_WorldLootObject.IsWorldLootObjectByGUID",
    params = { { name = "guid", type = "WOWGUID", default = nil } },
    returns = { { name = "isWorldLootObject", type = "bool", canBeSecret = false } },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_WorldLootObject.IsWorldLootObjectInRange"] = {
    key = "C_WorldLootObject.IsWorldLootObjectInRange",
    name = "IsWorldLootObjectInRange",
    category = "combat_midnight",
    subcategory = "c_worldlootobject",
    func = _G["C_WorldLootObject"] and _G["C_WorldLootObject"]["IsWorldLootObjectInRange"],
    funcPath = "C_WorldLootObject.IsWorldLootObjectInRange",
    params = { { name = "unitToken", type = "UnitToken", default = "player" } },
    returns = { { name = "isWorldLootObjectInRange", type = "bool", canBeSecret = false } },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_WorldLootObject.OnWorldLootObjectClick"] = {
    key = "C_WorldLootObject.OnWorldLootObjectClick",
    name = "OnWorldLootObjectClick",
    category = "combat_midnight",
    subcategory = "c_worldlootobject",
    func = _G["C_WorldLootObject"] and _G["C_WorldLootObject"]["OnWorldLootObjectClick"],
    funcPath = "C_WorldLootObject.OnWorldLootObjectClick",
    params = { { name = "unitToken", type = "UnitToken", default = "player" }, { name = "isLeftClick", type = "bool", default = nil } },
    returns = {  },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}
