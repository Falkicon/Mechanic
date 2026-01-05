-- Generated APIDefinitions for namespace: C_SummonInfo
local _, ns = ...
local APIDefs = ns.APIDefinitions

APIDefs["C_SummonInfo.CancelSummon"] = {
    key = "C_SummonInfo.CancelSummon",
    name = "CancelSummon",
    category = "general",
    subcategory = "c_summoninfo",
    func = _G["C_SummonInfo"] and _G["C_SummonInfo"]["CancelSummon"],
    funcPath = "C_SummonInfo.CancelSummon",
    params = {  },
    returns = {  },
    midnightImpact = "NORMAL",
}

APIDefs["C_SummonInfo.ConfirmSummon"] = {
    key = "C_SummonInfo.ConfirmSummon",
    name = "ConfirmSummon",
    category = "general",
    subcategory = "c_summoninfo",
    func = _G["C_SummonInfo"] and _G["C_SummonInfo"]["ConfirmSummon"],
    funcPath = "C_SummonInfo.ConfirmSummon",
    params = {  },
    returns = {  },
    midnightImpact = "NORMAL",
}

APIDefs["C_SummonInfo.GetSummonConfirmAreaName"] = {
    key = "C_SummonInfo.GetSummonConfirmAreaName",
    name = "GetSummonConfirmAreaName",
    category = "general",
    subcategory = "c_summoninfo",
    func = _G["C_SummonInfo"] and _G["C_SummonInfo"]["GetSummonConfirmAreaName"],
    funcPath = "C_SummonInfo.GetSummonConfirmAreaName",
    params = {  },
    returns = { { name = "areaName", type = "string", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["C_SummonInfo.GetSummonConfirmSummoner"] = {
    key = "C_SummonInfo.GetSummonConfirmSummoner",
    name = "GetSummonConfirmSummoner",
    category = "general",
    subcategory = "c_summoninfo",
    func = _G["C_SummonInfo"] and _G["C_SummonInfo"]["GetSummonConfirmSummoner"],
    funcPath = "C_SummonInfo.GetSummonConfirmSummoner",
    params = {  },
    returns = { { name = "summoner", type = "string", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["C_SummonInfo.GetSummonConfirmTimeLeft"] = {
    key = "C_SummonInfo.GetSummonConfirmTimeLeft",
    name = "GetSummonConfirmTimeLeft",
    category = "general",
    subcategory = "c_summoninfo",
    func = _G["C_SummonInfo"] and _G["C_SummonInfo"]["GetSummonConfirmTimeLeft"],
    funcPath = "C_SummonInfo.GetSummonConfirmTimeLeft",
    params = {  },
    returns = { { name = "timeLeft", type = "number", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["C_SummonInfo.GetSummonReason"] = {
    key = "C_SummonInfo.GetSummonReason",
    name = "GetSummonReason",
    category = "general",
    subcategory = "c_summoninfo",
    func = _G["C_SummonInfo"] and _G["C_SummonInfo"]["GetSummonReason"],
    funcPath = "C_SummonInfo.GetSummonReason",
    params = {  },
    returns = { { name = "summonReason", type = "number", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["C_SummonInfo.IsSummonSkippingStartExperience"] = {
    key = "C_SummonInfo.IsSummonSkippingStartExperience",
    name = "IsSummonSkippingStartExperience",
    category = "general",
    subcategory = "c_summoninfo",
    func = _G["C_SummonInfo"] and _G["C_SummonInfo"]["IsSummonSkippingStartExperience"],
    funcPath = "C_SummonInfo.IsSummonSkippingStartExperience",
    params = {  },
    returns = { { name = "isSummonSkippingStartExperience", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
}
