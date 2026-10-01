-- Generated APIDefinitions for namespace: C_GuildBank
local _, ns = ...
local APIDefs = ns.APIDefinitions

APIDefs["C_GuildBank.IsGuildBankEnabled"] = {
    key = "C_GuildBank.IsGuildBankEnabled",
    name = "IsGuildBankEnabled",
    category = "item",
    subcategory = "c_guildbank",
    funcPath = "C_GuildBank.IsGuildBankEnabled",
    params = {  },
    returns = { { name = "enabled", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
}
