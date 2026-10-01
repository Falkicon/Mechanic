-- Generated APIDefinitions for namespace: C_IncomingSummon
local _, ns = ...
local APIDefs = ns.APIDefinitions

APIDefs["C_IncomingSummon.HasIncomingSummon"] = {
    key = "C_IncomingSummon.HasIncomingSummon",
    name = "HasIncomingSummon",
    category = "general",
    subcategory = "c_incomingsummon",
    funcPath = "C_IncomingSummon.HasIncomingSummon",
    params = { { name = "unit", type = "UnitToken", default = "player" } },
    returns = { { name = "summon", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_IncomingSummon.IncomingSummonStatus"] = {
    key = "C_IncomingSummon.IncomingSummonStatus",
    name = "IncomingSummonStatus",
    category = "general",
    subcategory = "c_incomingsummon",
    funcPath = "C_IncomingSummon.IncomingSummonStatus",
    params = { { name = "unit", type = "UnitToken", default = "player" } },
    returns = { { name = "status", type = "SummonStatus", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}
