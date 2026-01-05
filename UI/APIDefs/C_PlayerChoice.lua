-- Generated APIDefinitions for namespace: C_PlayerChoice
local _, ns = ...
local APIDefs = ns.APIDefinitions

APIDefs["C_PlayerChoice.GetCurrentPlayerChoiceInfo"] = {
    key = "C_PlayerChoice.GetCurrentPlayerChoiceInfo",
    name = "GetCurrentPlayerChoiceInfo",
    category = "unit",
    subcategory = "c_playerchoice",
    func = _G["C_PlayerChoice"] and _G["C_PlayerChoice"]["GetCurrentPlayerChoiceInfo"],
    funcPath = "C_PlayerChoice.GetCurrentPlayerChoiceInfo",
    params = {  },
    returns = { { name = "choiceInfo", type = "PlayerChoiceInfo", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["C_PlayerChoice.GetNumRerolls"] = {
    key = "C_PlayerChoice.GetNumRerolls",
    name = "GetNumRerolls",
    category = "unit",
    subcategory = "c_playerchoice",
    func = _G["C_PlayerChoice"] and _G["C_PlayerChoice"]["GetNumRerolls"],
    funcPath = "C_PlayerChoice.GetNumRerolls",
    params = {  },
    returns = { { name = "numRerolls", type = "number", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["C_PlayerChoice.GetRemainingTime"] = {
    key = "C_PlayerChoice.GetRemainingTime",
    name = "GetRemainingTime",
    category = "unit",
    subcategory = "c_playerchoice",
    func = _G["C_PlayerChoice"] and _G["C_PlayerChoice"]["GetRemainingTime"],
    funcPath = "C_PlayerChoice.GetRemainingTime",
    params = {  },
    returns = { { name = "remainingTime", type = "number", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["C_PlayerChoice.IsWaitingForPlayerChoiceResponse"] = {
    key = "C_PlayerChoice.IsWaitingForPlayerChoiceResponse",
    name = "IsWaitingForPlayerChoiceResponse",
    category = "unit",
    subcategory = "c_playerchoice",
    func = _G["C_PlayerChoice"] and _G["C_PlayerChoice"]["IsWaitingForPlayerChoiceResponse"],
    funcPath = "C_PlayerChoice.IsWaitingForPlayerChoiceResponse",
    params = {  },
    returns = { { name = "isWaitingForResponse", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["C_PlayerChoice.OnUIClosed"] = {
    key = "C_PlayerChoice.OnUIClosed",
    name = "OnUIClosed",
    category = "unit",
    subcategory = "c_playerchoice",
    func = _G["C_PlayerChoice"] and _G["C_PlayerChoice"]["OnUIClosed"],
    funcPath = "C_PlayerChoice.OnUIClosed",
    params = {  },
    returns = {  },
    midnightImpact = "NORMAL",
}

APIDefs["C_PlayerChoice.RequestRerollPlayerChoice"] = {
    key = "C_PlayerChoice.RequestRerollPlayerChoice",
    name = "RequestRerollPlayerChoice",
    category = "unit",
    subcategory = "c_playerchoice",
    func = _G["C_PlayerChoice"] and _G["C_PlayerChoice"]["RequestRerollPlayerChoice"],
    funcPath = "C_PlayerChoice.RequestRerollPlayerChoice",
    params = {  },
    returns = {  },
    midnightImpact = "NORMAL",
}

APIDefs["C_PlayerChoice.SendPlayerChoiceResponse"] = {
    key = "C_PlayerChoice.SendPlayerChoiceResponse",
    name = "SendPlayerChoiceResponse",
    category = "combat_midnight",
    subcategory = "c_playerchoice",
    func = _G["C_PlayerChoice"] and _G["C_PlayerChoice"]["SendPlayerChoiceResponse"],
    funcPath = "C_PlayerChoice.SendPlayerChoiceResponse",
    params = { { name = "responseID", type = "number", default = nil } },
    returns = {  },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}
