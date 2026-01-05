-- Generated APIDefinitions for namespace: C_SocialRestrictions
local _, ns = ...
local APIDefs = ns.APIDefinitions

APIDefs["C_SocialRestrictions.AcknowledgeRegionalChatDisabled"] = {
    key = "C_SocialRestrictions.AcknowledgeRegionalChatDisabled",
    name = "AcknowledgeRegionalChatDisabled",
    category = "general",
    subcategory = "c_socialrestrictions",
    func = _G["C_SocialRestrictions"] and _G["C_SocialRestrictions"]["AcknowledgeRegionalChatDisabled"],
    funcPath = "C_SocialRestrictions.AcknowledgeRegionalChatDisabled",
    params = {  },
    returns = {  },
    midnightImpact = "NORMAL",
}

APIDefs["C_SocialRestrictions.CanReceiveChat"] = {
    key = "C_SocialRestrictions.CanReceiveChat",
    name = "CanReceiveChat",
    category = "general",
    subcategory = "c_socialrestrictions",
    func = _G["C_SocialRestrictions"] and _G["C_SocialRestrictions"]["CanReceiveChat"],
    funcPath = "C_SocialRestrictions.CanReceiveChat",
    params = {  },
    returns = { { name = "canReceiveChat", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["C_SocialRestrictions.CanSendChat"] = {
    key = "C_SocialRestrictions.CanSendChat",
    name = "CanSendChat",
    category = "general",
    subcategory = "c_socialrestrictions",
    func = _G["C_SocialRestrictions"] and _G["C_SocialRestrictions"]["CanSendChat"],
    funcPath = "C_SocialRestrictions.CanSendChat",
    params = {  },
    returns = { { name = "canSendChat", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["C_SocialRestrictions.IsChatDisabled"] = {
    key = "C_SocialRestrictions.IsChatDisabled",
    name = "IsChatDisabled",
    category = "general",
    subcategory = "c_socialrestrictions",
    func = _G["C_SocialRestrictions"] and _G["C_SocialRestrictions"]["IsChatDisabled"],
    funcPath = "C_SocialRestrictions.IsChatDisabled",
    params = {  },
    returns = { { name = "disabled", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["C_SocialRestrictions.IsMuted"] = {
    key = "C_SocialRestrictions.IsMuted",
    name = "IsMuted",
    category = "general",
    subcategory = "c_socialrestrictions",
    func = _G["C_SocialRestrictions"] and _G["C_SocialRestrictions"]["IsMuted"],
    funcPath = "C_SocialRestrictions.IsMuted",
    params = {  },
    returns = { { name = "isMuted", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["C_SocialRestrictions.IsSilenced"] = {
    key = "C_SocialRestrictions.IsSilenced",
    name = "IsSilenced",
    category = "general",
    subcategory = "c_socialrestrictions",
    func = _G["C_SocialRestrictions"] and _G["C_SocialRestrictions"]["IsSilenced"],
    funcPath = "C_SocialRestrictions.IsSilenced",
    params = {  },
    returns = { { name = "isSilenced", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["C_SocialRestrictions.IsSquelched"] = {
    key = "C_SocialRestrictions.IsSquelched",
    name = "IsSquelched",
    category = "general",
    subcategory = "c_socialrestrictions",
    func = _G["C_SocialRestrictions"] and _G["C_SocialRestrictions"]["IsSquelched"],
    funcPath = "C_SocialRestrictions.IsSquelched",
    params = {  },
    returns = { { name = "isSquelched", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["C_SocialRestrictions.SetChatDisabled"] = {
    key = "C_SocialRestrictions.SetChatDisabled",
    name = "SetChatDisabled",
    category = "combat_midnight",
    subcategory = "c_socialrestrictions",
    func = _G["C_SocialRestrictions"] and _G["C_SocialRestrictions"]["SetChatDisabled"],
    funcPath = "C_SocialRestrictions.SetChatDisabled",
    params = { { name = "disabled", type = "bool", default = nil } },
    returns = {  },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}
