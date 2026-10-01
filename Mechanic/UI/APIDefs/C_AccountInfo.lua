-- Generated APIDefinitions for namespace: C_AccountInfo
local _, ns = ...
local APIDefs = ns.APIDefinitions

APIDefs["C_AccountInfo.GetIDFromBattleNetAccountGUID"] = {
    key = "C_AccountInfo.GetIDFromBattleNetAccountGUID",
    name = "GetIDFromBattleNetAccountGUID",
    category = "general",
    subcategory = "c_accountinfo",
    funcPath = "C_AccountInfo.GetIDFromBattleNetAccountGUID",
    params = { { name = "battleNetAccountGUID", type = "WOWGUID", default = nil } },
    returns = { { name = "battleNetAccountID", type = "number", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_AccountInfo.IsGUIDBattleNetAccountType"] = {
    key = "C_AccountInfo.IsGUIDBattleNetAccountType",
    name = "IsGUIDBattleNetAccountType",
    category = "general",
    subcategory = "c_accountinfo",
    funcPath = "C_AccountInfo.IsGUIDBattleNetAccountType",
    params = { { name = "guid", type = "WOWGUID", default = nil } },
    returns = { { name = "isBNet", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_AccountInfo.IsGUIDRelatedToLocalAccount"] = {
    key = "C_AccountInfo.IsGUIDRelatedToLocalAccount",
    name = "IsGUIDRelatedToLocalAccount",
    category = "general",
    subcategory = "c_accountinfo",
    funcPath = "C_AccountInfo.IsGUIDRelatedToLocalAccount",
    params = { { name = "guid", type = "WOWGUID", default = nil } },
    returns = { { name = "isLocalUser", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}
