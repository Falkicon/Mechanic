-- Generated APIDefinitions for namespace: C_ScriptedAnimations
local _, ns = ...
local APIDefs = ns.APIDefinitions

APIDefs["C_ScriptedAnimations.GetAllScriptedAnimationEffects"] = {
    key = "C_ScriptedAnimations.GetAllScriptedAnimationEffects",
    name = "GetAllScriptedAnimationEffects",
    category = "general",
    subcategory = "c_scriptedanimations",
    func = _G["C_ScriptedAnimations"] and _G["C_ScriptedAnimations"]["GetAllScriptedAnimationEffects"],
    funcPath = "C_ScriptedAnimations.GetAllScriptedAnimationEffects",
    params = {  },
    returns = { { name = "scriptedAnimationEffects", type = "table", canBeSecret = false } },
    midnightImpact = "NORMAL",
}
