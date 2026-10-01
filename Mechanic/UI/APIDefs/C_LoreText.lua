-- Generated APIDefinitions for namespace: C_LoreText
local _, ns = ...
local APIDefs = ns.APIDefinitions

APIDefs["C_LoreText.RequestLoreTextForCampaignID"] = {
    key = "C_LoreText.RequestLoreTextForCampaignID",
    name = "RequestLoreTextForCampaignID",
    category = "general",
    subcategory = "c_loretext",
    funcPath = "C_LoreText.RequestLoreTextForCampaignID",
    params = { { name = "campaignID", type = "number", default = nil } },
    returns = {  },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}
