-- Generated APIDefinitions for namespace: C_Macro
local _, ns = ...
local APIDefs = ns.APIDefinitions

APIDefs["C_Macro.GetMacroName"] = {
    key = "C_Macro.GetMacroName",
    name = "GetMacroName",
    category = "general",
    subcategory = "c_macro",
    funcPath = "C_Macro.GetMacroName",
    params = { { name = "macroId", type = "luaIndex", default = nil } },
    returns = { { name = "name", type = "cstring", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Macro.GetSelectedMacroIcon"] = {
    key = "C_Macro.GetSelectedMacroIcon",
    name = "GetSelectedMacroIcon",
    category = "general",
    subcategory = "c_macro",
    funcPath = "C_Macro.GetSelectedMacroIcon",
    params = { { name = "macroId", type = "luaIndex", default = nil } },
    returns = { { name = "textureNum", type = "fileID", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Macro.RunMacroText"] = {
    key = "C_Macro.RunMacroText",
    name = "RunMacroText",
    category = "general",
    subcategory = "c_macro",
    funcPath = "C_Macro.RunMacroText",
    params = { { name = "text", type = "cstring", default = nil }, { name = "button", type = "cstring", default = nil } },
    returns = {  },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Macro.SetMacroExecuteLineCallback"] = {
    key = "C_Macro.SetMacroExecuteLineCallback",
    name = "SetMacroExecuteLineCallback",
    category = "general",
    subcategory = "c_macro",
    funcPath = "C_Macro.SetMacroExecuteLineCallback",
    params = { { name = "cb", type = "MacroExecuteLineCallback", default = nil } },
    returns = {  },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}
