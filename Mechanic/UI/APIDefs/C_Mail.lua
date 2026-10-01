-- Generated APIDefinitions for namespace: C_Mail
local _, ns = ...
local APIDefs = ns.APIDefinitions

APIDefs["C_Mail.CanCheckInbox"] = {
    key = "C_Mail.CanCheckInbox",
    name = "CanCheckInbox",
    category = "social",
    subcategory = "c_mail",
    funcPath = "C_Mail.CanCheckInbox",
    params = {  },
    returns = { { name = "canCheckInbox", type = "bool", canBeSecret = false }, { name = "secondsUntilAllowed", type = "number", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["C_Mail.GetCraftingOrderMailInfo"] = {
    key = "C_Mail.GetCraftingOrderMailInfo",
    name = "GetCraftingOrderMailInfo",
    category = "social",
    subcategory = "c_mail",
    funcPath = "C_Mail.GetCraftingOrderMailInfo",
    params = { { name = "inboxIndex", type = "luaIndex", default = nil } },
    returns = { { name = "info", type = "CraftingOrderMailInfo", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Mail.HasInboxMoney"] = {
    key = "C_Mail.HasInboxMoney",
    name = "HasInboxMoney",
    category = "social",
    subcategory = "c_mail",
    funcPath = "C_Mail.HasInboxMoney",
    params = { { name = "inboxIndex", type = "luaIndex", default = nil } },
    returns = { { name = "inboxItemHasMoneyAttached", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Mail.IsCommandPending"] = {
    key = "C_Mail.IsCommandPending",
    name = "IsCommandPending",
    category = "social",
    subcategory = "c_mail",
    funcPath = "C_Mail.IsCommandPending",
    params = {  },
    returns = { { name = "isCommandPending", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["C_Mail.SetOpeningAll"] = {
    key = "C_Mail.SetOpeningAll",
    name = "SetOpeningAll",
    category = "social",
    subcategory = "c_mail",
    funcPath = "C_Mail.SetOpeningAll",
    params = { { name = "openingAll", type = "bool", default = nil } },
    returns = {  },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}
