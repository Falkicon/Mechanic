-- Generated APIDefinitions for namespace: C_ResearchInfo
local _, ns = ...
local APIDefs = ns.APIDefinitions

APIDefs["C_ResearchInfo.GetDigSitesForMap"] = {
    key = "C_ResearchInfo.GetDigSitesForMap",
    name = "GetDigSitesForMap",
    category = "general",
    subcategory = "c_researchinfo",
    funcPath = "C_ResearchInfo.GetDigSitesForMap",
    params = { { name = "uiMapID", type = "number", default = nil } },
    returns = { { name = "digSites", type = "table", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}
