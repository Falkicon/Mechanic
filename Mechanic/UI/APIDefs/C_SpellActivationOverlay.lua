-- Generated APIDefinitions for namespace: C_SpellActivationOverlay
local _, ns = ...
local APIDefs = ns.APIDefinitions

APIDefs["C_SpellActivationOverlay.IsSpellOverlayed"] = {
    key = "C_SpellActivationOverlay.IsSpellOverlayed",
    name = "IsSpellOverlayed",
    category = "combat_midnight",
    subcategory = "c_spellactivationoverlay",
    func = _G["C_SpellActivationOverlay"] and _G["C_SpellActivationOverlay"]["IsSpellOverlayed"],
    funcPath = "C_SpellActivationOverlay.IsSpellOverlayed",
    params = { { name = "spellID", type = "number", default = nil } },
    returns = { { name = "isSpellOverlayed", type = "bool", canBeSecret = false } },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}
