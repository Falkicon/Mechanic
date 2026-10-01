-- Generated APIDefinitions for namespace: C_SpellActivationOverlay
local _, ns = ...
local APIDefs = ns.APIDefinitions

APIDefs["C_SpellActivationOverlay.IsSpellOverlayed"] = {
    key = "C_SpellActivationOverlay.IsSpellOverlayed",
    name = "IsSpellOverlayed",
    category = "spell",
    subcategory = "c_spellactivationoverlay",
    funcPath = "C_SpellActivationOverlay.IsSpellOverlayed",
    params = { { name = "spellID", type = "number", default = nil } },
    returns = { { name = "isSpellOverlayed", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}
