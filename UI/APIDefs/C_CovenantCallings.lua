-- Generated APIDefinitions for namespace: C_CovenantCallings
local _, ns = ...
local APIDefs = ns.APIDefinitions

APIDefs["C_CovenantCallings.AreCallingsUnlocked"] = {
    key = "C_CovenantCallings.AreCallingsUnlocked",
    name = "AreCallingsUnlocked",
    category = "general",
    subcategory = "c_covenantcallings",
    func = _G["C_CovenantCallings"] and _G["C_CovenantCallings"]["AreCallingsUnlocked"],
    funcPath = "C_CovenantCallings.AreCallingsUnlocked",
    params = {  },
    returns = { { name = "unlocked", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["C_CovenantCallings.RequestCallings"] = {
    key = "C_CovenantCallings.RequestCallings",
    name = "RequestCallings",
    category = "general",
    subcategory = "c_covenantcallings",
    func = _G["C_CovenantCallings"] and _G["C_CovenantCallings"]["RequestCallings"],
    funcPath = "C_CovenantCallings.RequestCallings",
    params = {  },
    returns = {  },
    midnightImpact = "NORMAL",
}
