-- Generated APIDefinitions for namespace: C_ResearchInfo
local _, ns = ...
local APIDefs = ns.APIDefinitions

APIDefs["C_ResearchInfo.GetDigSitesForMap"] = {
    key = "C_ResearchInfo.GetDigSitesForMap",
    name = "GetDigSitesForMap",
    category = "combat_midnight",
    subcategory = "c_researchinfo",
    func = _G["C_ResearchInfo"] and _G["C_ResearchInfo"]["GetDigSitesForMap"],
    funcPath = "C_ResearchInfo.GetDigSitesForMap",
    params = { { name = "uiMapID", type = "number", default = nil } },
    returns = { { name = "digSites", type = "table", canBeSecret = false } },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}
