-- Generated APIDefinitions for namespace: C_Macro
local _, ns = ...
local APIDefs = ns.APIDefinitions

APIDefs["C_Macro.GetMacroName"] = {
    key = "C_Macro.GetMacroName",
    name = "GetMacroName",
    category = "combat_midnight",
    subcategory = "c_macro",
    func = _G["C_Macro"] and _G["C_Macro"]["GetMacroName"],
    funcPath = "C_Macro.GetMacroName",
    params = { { name = "macroId", type = "luaIndex", default = nil } },
    returns = { { name = "name", type = "cstring", canBeSecret = false } },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Macro.GetSelectedMacroIcon"] = {
    key = "C_Macro.GetSelectedMacroIcon",
    name = "GetSelectedMacroIcon",
    category = "combat_midnight",
    subcategory = "c_macro",
    func = _G["C_Macro"] and _G["C_Macro"]["GetSelectedMacroIcon"],
    funcPath = "C_Macro.GetSelectedMacroIcon",
    params = { { name = "macroId", type = "luaIndex", default = nil } },
    returns = { { name = "textureNum", type = "fileID", canBeSecret = false } },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Macro.RunMacroText"] = {
    key = "C_Macro.RunMacroText",
    name = "RunMacroText",
    category = "combat_midnight",
    subcategory = "c_macro",
    func = _G["C_Macro"] and _G["C_Macro"]["RunMacroText"],
    funcPath = "C_Macro.RunMacroText",
    params = { { name = "text", type = "cstring", default = nil }, { name = "button", type = "cstring", default = nil } },
    returns = {  },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Macro.SetMacroExecuteLineCallback"] = {
    key = "C_Macro.SetMacroExecuteLineCallback",
    name = "SetMacroExecuteLineCallback",
    category = "combat_midnight",
    subcategory = "c_macro",
    func = _G["C_Macro"] and _G["C_Macro"]["SetMacroExecuteLineCallback"],
    funcPath = "C_Macro.SetMacroExecuteLineCallback",
    params = { { name = "cb", type = "MacroExecuteLineCallback", default = nil } },
    returns = {  },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}
