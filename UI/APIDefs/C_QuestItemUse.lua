-- Generated APIDefinitions for namespace: C_QuestItemUse
local _, ns = ...
local APIDefs = ns.APIDefinitions

APIDefs["C_QuestItemUse.CanUseQuestItemOnObject"] = {
    key = "C_QuestItemUse.CanUseQuestItemOnObject",
    name = "CanUseQuestItemOnObject",
    category = "combat_midnight",
    subcategory = "c_questitemuse",
    func = _G["C_QuestItemUse"] and _G["C_QuestItemUse"]["CanUseQuestItemOnObject"],
    funcPath = "C_QuestItemUse.CanUseQuestItemOnObject",
    params = { { name = "item", type = "ItemLocation", default = nil }, { name = "unit", type = "UnitToken", default = "player" }, { name = "checkRange", type = "bool", default = nil } },
    returns = { { name = "canUse", type = "bool", canBeSecret = false } },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}
