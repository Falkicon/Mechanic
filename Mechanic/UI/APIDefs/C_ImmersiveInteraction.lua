-- Generated APIDefinitions for namespace: C_ImmersiveInteraction
local _, ns = ...
local APIDefs = ns.APIDefinitions

APIDefs["C_ImmersiveInteraction.HasImmersiveInteraction"] = {
    key = "C_ImmersiveInteraction.HasImmersiveInteraction",
    name = "HasImmersiveInteraction",
    category = "general",
    subcategory = "c_immersiveinteraction",
    func = _G["C_ImmersiveInteraction"] and _G["C_ImmersiveInteraction"]["HasImmersiveInteraction"],
    funcPath = "C_ImmersiveInteraction.HasImmersiveInteraction",
    params = {  },
    returns = { { name = "immersiveInteraction", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
}
