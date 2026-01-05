-- Generated APIDefinitions for namespace: C_LoreText
local _, ns = ...
local APIDefs = ns.APIDefinitions

APIDefs["C_LoreText.RequestLoreTextForCampaignID"] = {
    key = "C_LoreText.RequestLoreTextForCampaignID",
    name = "RequestLoreTextForCampaignID",
    category = "combat_midnight",
    subcategory = "c_loretext",
    func = _G["C_LoreText"] and _G["C_LoreText"]["RequestLoreTextForCampaignID"],
    funcPath = "C_LoreText.RequestLoreTextForCampaignID",
    params = { { name = "campaignID", type = "number", default = nil } },
    returns = {  },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}
