-- Generated APIDefinitions for namespace: table
local _, ns = ...
local APIDefs = ns.APIDefinitions

APIDefs["table.count"] = {
    key = "table.count",
    name = "count",
    category = "general",
    subcategory = "table",
    funcPath = "table.count",
    params = { { name = "table", type = "LuaValueReference", default = nil } },
    returns = { { name = "numTableNodes", type = "number", canBeSecret = false }, { name = "numArrayNodes", type = "number", canBeSecret = false }, { name = "maxArrayIndex", type = "number", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["table.create"] = {
    key = "table.create",
    name = "create",
    category = "general",
    subcategory = "table",
    funcPath = "table.create",
    params = { { name = "arraySizeHint", type = "number", default = nil }, { name = "nodeSizeHint", type = "number", default = 0 } },
    returns = { { name = "table", type = "LuaValueReference", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}
