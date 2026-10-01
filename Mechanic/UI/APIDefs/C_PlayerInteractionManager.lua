-- Generated APIDefinitions for namespace: C_PlayerInteractionManager
local _, ns = ...
local APIDefs = ns.APIDefinitions

APIDefs["C_PlayerInteractionManager.ClearInteraction"] = {
    key = "C_PlayerInteractionManager.ClearInteraction",
    name = "ClearInteraction",
    category = "unit",
    subcategory = "c_playerinteractionmanager",
    funcPath = "C_PlayerInteractionManager.ClearInteraction",
    params = { { name = "type", type = "PlayerInteractionType", default = nil } },
    returns = {  },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_PlayerInteractionManager.ConfirmationInteraction"] = {
    key = "C_PlayerInteractionManager.ConfirmationInteraction",
    name = "ConfirmationInteraction",
    category = "unit",
    subcategory = "c_playerinteractionmanager",
    funcPath = "C_PlayerInteractionManager.ConfirmationInteraction",
    params = { { name = "type", type = "PlayerInteractionType", default = nil } },
    returns = {  },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_PlayerInteractionManager.InteractUnit"] = {
    key = "C_PlayerInteractionManager.InteractUnit",
    name = "InteractUnit",
    category = "unit",
    subcategory = "c_playerinteractionmanager",
    funcPath = "C_PlayerInteractionManager.InteractUnit",
    params = { { name = "unit", type = "string", default = nil }, { name = "exactMatch", type = "bool", default = false }, { name = "looseTargeting", type = "bool", default = true } },
    returns = { { name = "success", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_PlayerInteractionManager.IsInteractingWithNpcOfType"] = {
    key = "C_PlayerInteractionManager.IsInteractingWithNpcOfType",
    name = "IsInteractingWithNpcOfType",
    category = "unit",
    subcategory = "c_playerinteractionmanager",
    funcPath = "C_PlayerInteractionManager.IsInteractingWithNpcOfType",
    params = { { name = "type", type = "PlayerInteractionType", default = nil } },
    returns = { { name = "interacting", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_PlayerInteractionManager.IsReplacingUnit"] = {
    key = "C_PlayerInteractionManager.IsReplacingUnit",
    name = "IsReplacingUnit",
    category = "unit",
    subcategory = "c_playerinteractionmanager",
    funcPath = "C_PlayerInteractionManager.IsReplacingUnit",
    params = {  },
    returns = { { name = "replacing", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["C_PlayerInteractionManager.IsValidNPCInteraction"] = {
    key = "C_PlayerInteractionManager.IsValidNPCInteraction",
    name = "IsValidNPCInteraction",
    category = "unit",
    subcategory = "c_playerinteractionmanager",
    funcPath = "C_PlayerInteractionManager.IsValidNPCInteraction",
    params = { { name = "type", type = "PlayerInteractionType", default = nil } },
    returns = { { name = "isValidInteraction", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_PlayerInteractionManager.ReopenInteraction"] = {
    key = "C_PlayerInteractionManager.ReopenInteraction",
    name = "ReopenInteraction",
    category = "unit",
    subcategory = "c_playerinteractionmanager",
    funcPath = "C_PlayerInteractionManager.ReopenInteraction",
    params = {  },
    returns = {  },
    midnightImpact = "NORMAL",
}
