-- Generated APIDefinitions for namespace: C_AccountInfo
local _, ns = ...
local APIDefs = ns.APIDefinitions

APIDefs["C_AccountInfo.GetIDFromBattleNetAccountGUID"] = {
    key = "C_AccountInfo.GetIDFromBattleNetAccountGUID",
    name = "GetIDFromBattleNetAccountGUID",
    category = "combat_midnight",
    subcategory = "c_accountinfo",
    func = _G["C_AccountInfo"] and _G["C_AccountInfo"]["GetIDFromBattleNetAccountGUID"],
    funcPath = "C_AccountInfo.GetIDFromBattleNetAccountGUID",
    params = { { name = "battleNetAccountGUID", type = "WOWGUID", default = nil } },
    returns = { { name = "battleNetAccountID", type = "number", canBeSecret = false } },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_AccountInfo.IsGUIDBattleNetAccountType"] = {
    key = "C_AccountInfo.IsGUIDBattleNetAccountType",
    name = "IsGUIDBattleNetAccountType",
    category = "combat_midnight",
    subcategory = "c_accountinfo",
    func = _G["C_AccountInfo"] and _G["C_AccountInfo"]["IsGUIDBattleNetAccountType"],
    funcPath = "C_AccountInfo.IsGUIDBattleNetAccountType",
    params = { { name = "guid", type = "WOWGUID", default = nil } },
    returns = { { name = "isBNet", type = "bool", canBeSecret = false } },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_AccountInfo.IsGUIDRelatedToLocalAccount"] = {
    key = "C_AccountInfo.IsGUIDRelatedToLocalAccount",
    name = "IsGUIDRelatedToLocalAccount",
    category = "combat_midnight",
    subcategory = "c_accountinfo",
    func = _G["C_AccountInfo"] and _G["C_AccountInfo"]["IsGUIDRelatedToLocalAccount"],
    funcPath = "C_AccountInfo.IsGUIDRelatedToLocalAccount",
    params = { { name = "guid", type = "WOWGUID", default = nil } },
    returns = { { name = "isLocalUser", type = "bool", canBeSecret = false } },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}
