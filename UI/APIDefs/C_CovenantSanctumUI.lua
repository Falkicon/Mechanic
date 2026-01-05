-- Generated APIDefinitions for namespace: C_CovenantSanctumUI
local _, ns = ...
local APIDefs = ns.APIDefinitions

APIDefs["C_CovenantSanctumUI.CanAccessReservoir"] = {
    key = "C_CovenantSanctumUI.CanAccessReservoir",
    name = "CanAccessReservoir",
    category = "general",
    subcategory = "c_covenantsanctumui",
    func = _G["C_CovenantSanctumUI"] and _G["C_CovenantSanctumUI"]["CanAccessReservoir"],
    funcPath = "C_CovenantSanctumUI.CanAccessReservoir",
    params = {  },
    returns = { { name = "canAccess", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["C_CovenantSanctumUI.CanDepositAnima"] = {
    key = "C_CovenantSanctumUI.CanDepositAnima",
    name = "CanDepositAnima",
    category = "general",
    subcategory = "c_covenantsanctumui",
    func = _G["C_CovenantSanctumUI"] and _G["C_CovenantSanctumUI"]["CanDepositAnima"],
    funcPath = "C_CovenantSanctumUI.CanDepositAnima",
    params = {  },
    returns = { { name = "canDeposit", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["C_CovenantSanctumUI.DepositAnima"] = {
    key = "C_CovenantSanctumUI.DepositAnima",
    name = "DepositAnima",
    category = "general",
    subcategory = "c_covenantsanctumui",
    func = _G["C_CovenantSanctumUI"] and _G["C_CovenantSanctumUI"]["DepositAnima"],
    funcPath = "C_CovenantSanctumUI.DepositAnima",
    params = {  },
    returns = {  },
    midnightImpact = "NORMAL",
}

APIDefs["C_CovenantSanctumUI.EndInteraction"] = {
    key = "C_CovenantSanctumUI.EndInteraction",
    name = "EndInteraction",
    category = "general",
    subcategory = "c_covenantsanctumui",
    func = _G["C_CovenantSanctumUI"] and _G["C_CovenantSanctumUI"]["EndInteraction"],
    funcPath = "C_CovenantSanctumUI.EndInteraction",
    params = {  },
    returns = {  },
    midnightImpact = "NORMAL",
}

APIDefs["C_CovenantSanctumUI.GetAnimaInfo"] = {
    key = "C_CovenantSanctumUI.GetAnimaInfo",
    name = "GetAnimaInfo",
    category = "general",
    subcategory = "c_covenantsanctumui",
    func = _G["C_CovenantSanctumUI"] and _G["C_CovenantSanctumUI"]["GetAnimaInfo"],
    funcPath = "C_CovenantSanctumUI.GetAnimaInfo",
    params = {  },
    returns = { { name = "currencyID", type = "number", canBeSecret = false }, { name = "maxDisplayableValue", type = "number", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["C_CovenantSanctumUI.GetCurrentTalentTreeID"] = {
    key = "C_CovenantSanctumUI.GetCurrentTalentTreeID",
    name = "GetCurrentTalentTreeID",
    category = "general",
    subcategory = "c_covenantsanctumui",
    func = _G["C_CovenantSanctumUI"] and _G["C_CovenantSanctumUI"]["GetCurrentTalentTreeID"],
    funcPath = "C_CovenantSanctumUI.GetCurrentTalentTreeID",
    params = {  },
    returns = { { name = "currentTalentTreeID", type = "number", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["C_CovenantSanctumUI.GetFeatures"] = {
    key = "C_CovenantSanctumUI.GetFeatures",
    name = "GetFeatures",
    category = "general",
    subcategory = "c_covenantsanctumui",
    func = _G["C_CovenantSanctumUI"] and _G["C_CovenantSanctumUI"]["GetFeatures"],
    funcPath = "C_CovenantSanctumUI.GetFeatures",
    params = {  },
    returns = { { name = "features", type = "table", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["C_CovenantSanctumUI.GetRenownLevel"] = {
    key = "C_CovenantSanctumUI.GetRenownLevel",
    name = "GetRenownLevel",
    category = "general",
    subcategory = "c_covenantsanctumui",
    func = _G["C_CovenantSanctumUI"] and _G["C_CovenantSanctumUI"]["GetRenownLevel"],
    funcPath = "C_CovenantSanctumUI.GetRenownLevel",
    params = {  },
    returns = { { name = "level", type = "number", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["C_CovenantSanctumUI.GetRenownLevels"] = {
    key = "C_CovenantSanctumUI.GetRenownLevels",
    name = "GetRenownLevels",
    category = "combat_midnight",
    subcategory = "c_covenantsanctumui",
    func = _G["C_CovenantSanctumUI"] and _G["C_CovenantSanctumUI"]["GetRenownLevels"],
    funcPath = "C_CovenantSanctumUI.GetRenownLevels",
    params = { { name = "covenantID", type = "number", default = nil } },
    returns = { { name = "levels", type = "table", canBeSecret = false } },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_CovenantSanctumUI.GetRenownRewardsForLevel"] = {
    key = "C_CovenantSanctumUI.GetRenownRewardsForLevel",
    name = "GetRenownRewardsForLevel",
    category = "combat_midnight",
    subcategory = "c_covenantsanctumui",
    func = _G["C_CovenantSanctumUI"] and _G["C_CovenantSanctumUI"]["GetRenownRewardsForLevel"],
    funcPath = "C_CovenantSanctumUI.GetRenownRewardsForLevel",
    params = { { name = "covenantID", type = "number", default = nil }, { name = "renownLevel", type = "number", default = nil } },
    returns = { { name = "rewards", type = "table", canBeSecret = false } },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_CovenantSanctumUI.GetSanctumType"] = {
    key = "C_CovenantSanctumUI.GetSanctumType",
    name = "GetSanctumType",
    category = "general",
    subcategory = "c_covenantsanctumui",
    func = _G["C_CovenantSanctumUI"] and _G["C_CovenantSanctumUI"]["GetSanctumType"],
    funcPath = "C_CovenantSanctumUI.GetSanctumType",
    params = {  },
    returns = { { name = "sanctumType", type = "GarrTalentFeatureSubtype", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["C_CovenantSanctumUI.GetSoulCurrencies"] = {
    key = "C_CovenantSanctumUI.GetSoulCurrencies",
    name = "GetSoulCurrencies",
    category = "general",
    subcategory = "c_covenantsanctumui",
    func = _G["C_CovenantSanctumUI"] and _G["C_CovenantSanctumUI"]["GetSoulCurrencies"],
    funcPath = "C_CovenantSanctumUI.GetSoulCurrencies",
    params = {  },
    returns = { { name = "currencyIDs", type = "table", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["C_CovenantSanctumUI.HasMaximumRenown"] = {
    key = "C_CovenantSanctumUI.HasMaximumRenown",
    name = "HasMaximumRenown",
    category = "general",
    subcategory = "c_covenantsanctumui",
    func = _G["C_CovenantSanctumUI"] and _G["C_CovenantSanctumUI"]["HasMaximumRenown"],
    funcPath = "C_CovenantSanctumUI.HasMaximumRenown",
    params = {  },
    returns = { { name = "hasMaxRenown", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["C_CovenantSanctumUI.IsPlayerInRenownCatchUpMode"] = {
    key = "C_CovenantSanctumUI.IsPlayerInRenownCatchUpMode",
    name = "IsPlayerInRenownCatchUpMode",
    category = "general",
    subcategory = "c_covenantsanctumui",
    func = _G["C_CovenantSanctumUI"] and _G["C_CovenantSanctumUI"]["IsPlayerInRenownCatchUpMode"],
    funcPath = "C_CovenantSanctumUI.IsPlayerInRenownCatchUpMode",
    params = {  },
    returns = { { name = "isInCatchUpMode", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["C_CovenantSanctumUI.IsWeeklyRenownCapped"] = {
    key = "C_CovenantSanctumUI.IsWeeklyRenownCapped",
    name = "IsWeeklyRenownCapped",
    category = "general",
    subcategory = "c_covenantsanctumui",
    func = _G["C_CovenantSanctumUI"] and _G["C_CovenantSanctumUI"]["IsWeeklyRenownCapped"],
    funcPath = "C_CovenantSanctumUI.IsWeeklyRenownCapped",
    params = {  },
    returns = { { name = "isWeeklyCapped", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["C_CovenantSanctumUI.RequestCatchUpState"] = {
    key = "C_CovenantSanctumUI.RequestCatchUpState",
    name = "RequestCatchUpState",
    category = "general",
    subcategory = "c_covenantsanctumui",
    func = _G["C_CovenantSanctumUI"] and _G["C_CovenantSanctumUI"]["RequestCatchUpState"],
    funcPath = "C_CovenantSanctumUI.RequestCatchUpState",
    params = {  },
    returns = {  },
    midnightImpact = "NORMAL",
}
