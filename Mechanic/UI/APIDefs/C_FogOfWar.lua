-- Generated APIDefinitions for namespace: C_FogOfWar
local _, ns = ...
local APIDefs = ns.APIDefinitions

APIDefs["C_FogOfWar.GetFogOfWarForMap"] = {
    key = "C_FogOfWar.GetFogOfWarForMap",
    name = "GetFogOfWarForMap",
    category = "combat_midnight",
    subcategory = "c_fogofwar",
    func = _G["C_FogOfWar"] and _G["C_FogOfWar"]["GetFogOfWarForMap"],
    funcPath = "C_FogOfWar.GetFogOfWarForMap",
    params = { { name = "uiMapID", type = "number", default = nil } },
    returns = { { name = "fogOfWarID", type = "number", canBeSecret = false } },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_FogOfWar.GetFogOfWarInfo"] = {
    key = "C_FogOfWar.GetFogOfWarInfo",
    name = "GetFogOfWarInfo",
    category = "combat_midnight",
    subcategory = "c_fogofwar",
    func = _G["C_FogOfWar"] and _G["C_FogOfWar"]["GetFogOfWarInfo"],
    funcPath = "C_FogOfWar.GetFogOfWarInfo",
    params = { { name = "fogOfWarID", type = "number", default = nil } },
    returns = { { name = "fogOfWarInfo", type = "FogOfWarInfo", canBeSecret = false } },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}
