-- Generated APIDefinitions for namespace: C_ActionBar
local _, ns = ...
local APIDefs = ns.APIDefinitions

APIDefs["C_ActionBar.EnableActionRangeCheck"] = {
    key = "C_ActionBar.EnableActionRangeCheck",
    name = "EnableActionRangeCheck",
    category = "combat_midnight",
    subcategory = "c_actionbar",
    func = _G["C_ActionBar"] and _G["C_ActionBar"]["EnableActionRangeCheck"],
    funcPath = "C_ActionBar.EnableActionRangeCheck",
    params = { { name = "actionID", type = "luaIndex", default = nil }, { name = "enable", type = "bool", default = nil } },
    returns = {  },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_ActionBar.FindAssistedCombatActionButtons"] = {
    key = "C_ActionBar.FindAssistedCombatActionButtons",
    name = "FindAssistedCombatActionButtons",
    category = "spell",
    subcategory = "c_actionbar",
    func = _G["C_ActionBar"] and _G["C_ActionBar"]["FindAssistedCombatActionButtons"],
    funcPath = "C_ActionBar.FindAssistedCombatActionButtons",
    params = {  },
    returns = { { name = "slots", type = "table", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["C_ActionBar.FindFlyoutActionButtons"] = {
    key = "C_ActionBar.FindFlyoutActionButtons",
    name = "FindFlyoutActionButtons",
    category = "combat_midnight",
    subcategory = "c_actionbar",
    func = _G["C_ActionBar"] and _G["C_ActionBar"]["FindFlyoutActionButtons"],
    funcPath = "C_ActionBar.FindFlyoutActionButtons",
    params = { { name = "flyoutID", type = "number", default = nil } },
    returns = { { name = "slots", type = "table", canBeSecret = false } },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_ActionBar.FindPetActionButtons"] = {
    key = "C_ActionBar.FindPetActionButtons",
    name = "FindPetActionButtons",
    category = "combat_midnight",
    subcategory = "c_actionbar",
    func = _G["C_ActionBar"] and _G["C_ActionBar"]["FindPetActionButtons"],
    funcPath = "C_ActionBar.FindPetActionButtons",
    params = { { name = "petActionID", type = "number", default = nil } },
    returns = { { name = "slots", type = "table", canBeSecret = false } },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_ActionBar.FindSpellActionButtons"] = {
    key = "C_ActionBar.FindSpellActionButtons",
    name = "FindSpellActionButtons",
    category = "combat_midnight",
    subcategory = "c_actionbar",
    func = _G["C_ActionBar"] and _G["C_ActionBar"]["FindSpellActionButtons"],
    funcPath = "C_ActionBar.FindSpellActionButtons",
    params = { { name = "spellID", type = "number", default = nil } },
    returns = { { name = "slots", type = "table", canBeSecret = false } },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenTainted",
}

APIDefs["C_ActionBar.ForceUpdateAction"] = {
    key = "C_ActionBar.ForceUpdateAction",
    name = "ForceUpdateAction",
    category = "combat_midnight",
    subcategory = "c_actionbar",
    func = _G["C_ActionBar"] and _G["C_ActionBar"]["ForceUpdateAction"],
    funcPath = "C_ActionBar.ForceUpdateAction",
    params = { { name = "slotID", type = "luaIndex", default = nil } },
    returns = {  },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_ActionBar.GetActionAutocast"] = {
    key = "C_ActionBar.GetActionAutocast",
    name = "GetActionAutocast",
    category = "combat_midnight",
    subcategory = "c_actionbar",
    func = _G["C_ActionBar"] and _G["C_ActionBar"]["GetActionAutocast"],
    funcPath = "C_ActionBar.GetActionAutocast",
    params = { { name = "actionID", type = "luaIndex", default = nil } },
    returns = { { name = "autocastAllowed", type = "bool", canBeSecret = false }, { name = "autocastEnabled", type = "bool", canBeSecret = false } },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_ActionBar.GetActionBarPage"] = {
    key = "C_ActionBar.GetActionBarPage",
    name = "GetActionBarPage",
    category = "spell",
    subcategory = "c_actionbar",
    func = _G["C_ActionBar"] and _G["C_ActionBar"]["GetActionBarPage"],
    funcPath = "C_ActionBar.GetActionBarPage",
    params = {  },
    returns = { { name = "currentPage", type = "luaIndex", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["C_ActionBar.GetActionChargeDuration"] = {
    key = "C_ActionBar.GetActionChargeDuration",
    name = "GetActionChargeDuration",
    category = "combat_midnight",
    subcategory = "c_actionbar",
    func = _G["C_ActionBar"] and _G["C_ActionBar"]["GetActionChargeDuration"],
    funcPath = "C_ActionBar.GetActionChargeDuration",
    params = { { name = "actionID", type = "luaIndex", default = nil } },
    returns = { { name = "duration", type = "LuaDurationObject", canBeSecret = false } },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_ActionBar.GetActionCharges"] = {
    key = "C_ActionBar.GetActionCharges",
    name = "GetActionCharges",
    category = "combat_midnight",
    subcategory = "c_actionbar",
    func = _G["C_ActionBar"] and _G["C_ActionBar"]["GetActionCharges"],
    funcPath = "C_ActionBar.GetActionCharges",
    params = { { name = "actionID", type = "luaIndex", default = nil } },
    returns = { { name = "chargeInfo", type = "ActionBarChargeInfo", canBeSecret = false } },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_ActionBar.GetActionCooldown"] = {
    key = "C_ActionBar.GetActionCooldown",
    name = "GetActionCooldown",
    category = "combat_midnight",
    subcategory = "c_actionbar",
    func = _G["C_ActionBar"] and _G["C_ActionBar"]["GetActionCooldown"],
    funcPath = "C_ActionBar.GetActionCooldown",
    params = { { name = "actionID", type = "luaIndex", default = nil } },
    returns = { { name = "cooldownInfo", type = "ActionBarCooldownInfo", canBeSecret = false } },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_ActionBar.GetActionCooldownDuration"] = {
    key = "C_ActionBar.GetActionCooldownDuration",
    name = "GetActionCooldownDuration",
    category = "combat_midnight",
    subcategory = "c_actionbar",
    func = _G["C_ActionBar"] and _G["C_ActionBar"]["GetActionCooldownDuration"],
    funcPath = "C_ActionBar.GetActionCooldownDuration",
    params = { { name = "actionID", type = "luaIndex", default = nil } },
    returns = { { name = "duration", type = "LuaDurationObject", canBeSecret = false } },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_ActionBar.GetActionCooldownRemaining"] = {
    key = "C_ActionBar.GetActionCooldownRemaining",
    name = "GetActionCooldownRemaining",
    category = "combat_midnight",
    subcategory = "c_actionbar",
    func = _G["C_ActionBar"] and _G["C_ActionBar"]["GetActionCooldownRemaining"],
    funcPath = "C_ActionBar.GetActionCooldownRemaining",
    params = { { name = "actionID", type = "luaIndex", default = nil } },
    returns = { { name = "remainingSeconds", type = "number", canBeSecret = false } },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_ActionBar.GetActionCooldownRemainingPercent"] = {
    key = "C_ActionBar.GetActionCooldownRemainingPercent",
    name = "GetActionCooldownRemainingPercent",
    category = "combat_midnight",
    subcategory = "c_actionbar",
    func = _G["C_ActionBar"] and _G["C_ActionBar"]["GetActionCooldownRemainingPercent"],
    funcPath = "C_ActionBar.GetActionCooldownRemainingPercent",
    params = { { name = "actionID", type = "luaIndex", default = nil }, { name = "curve", type = "LuaCurveObjectBase", default = nil } },
    returns = { { name = "result", type = "LuaCurveEvaluatedResult", canBeSecret = false } },
    midnightImpact = "CONDITIONAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted, SecretWhenCurveSecret",
}

APIDefs["C_ActionBar.GetActionDisplayCount"] = {
    key = "C_ActionBar.GetActionDisplayCount",
    name = "GetActionDisplayCount",
    category = "combat_midnight",
    subcategory = "c_actionbar",
    func = _G["C_ActionBar"] and _G["C_ActionBar"]["GetActionDisplayCount"],
    funcPath = "C_ActionBar.GetActionDisplayCount",
    params = { { name = "actionID", type = "luaIndex", default = nil }, { name = "maxDisplayCount", type = "number", default = 9999 }, { name = "replacementString", type = "cstring", default = "*" } },
    returns = { { name = "displayCount", type = "string", canBeSecret = false } },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_ActionBar.GetActionLossOfControlCooldown"] = {
    key = "C_ActionBar.GetActionLossOfControlCooldown",
    name = "GetActionLossOfControlCooldown",
    category = "combat_midnight",
    subcategory = "c_actionbar",
    func = _G["C_ActionBar"] and _G["C_ActionBar"]["GetActionLossOfControlCooldown"],
    funcPath = "C_ActionBar.GetActionLossOfControlCooldown",
    params = { { name = "actionID", type = "luaIndex", default = nil } },
    returns = { { name = "startTime", type = "number", canBeSecret = false }, { name = "duration", type = "number", canBeSecret = false } },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_ActionBar.GetActionLossOfControlCooldownDuration"] = {
    key = "C_ActionBar.GetActionLossOfControlCooldownDuration",
    name = "GetActionLossOfControlCooldownDuration",
    category = "combat_midnight",
    subcategory = "c_actionbar",
    func = _G["C_ActionBar"] and _G["C_ActionBar"]["GetActionLossOfControlCooldownDuration"],
    funcPath = "C_ActionBar.GetActionLossOfControlCooldownDuration",
    params = { { name = "actionID", type = "luaIndex", default = nil } },
    returns = { { name = "duration", type = "LuaDurationObject", canBeSecret = false } },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_ActionBar.GetActionText"] = {
    key = "C_ActionBar.GetActionText",
    name = "GetActionText",
    category = "combat_midnight",
    subcategory = "c_actionbar",
    func = _G["C_ActionBar"] and _G["C_ActionBar"]["GetActionText"],
    funcPath = "C_ActionBar.GetActionText",
    params = { { name = "actionID", type = "luaIndex", default = nil } },
    returns = { { name = "text", type = "string", canBeSecret = false } },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_ActionBar.GetActionTexture"] = {
    key = "C_ActionBar.GetActionTexture",
    name = "GetActionTexture",
    category = "combat_midnight",
    subcategory = "c_actionbar",
    func = _G["C_ActionBar"] and _G["C_ActionBar"]["GetActionTexture"],
    funcPath = "C_ActionBar.GetActionTexture",
    params = { { name = "actionID", type = "luaIndex", default = nil } },
    returns = { { name = "textureFileID", type = "fileID", canBeSecret = false } },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_ActionBar.GetActionUseCount"] = {
    key = "C_ActionBar.GetActionUseCount",
    name = "GetActionUseCount",
    category = "combat_midnight",
    subcategory = "c_actionbar",
    func = _G["C_ActionBar"] and _G["C_ActionBar"]["GetActionUseCount"],
    funcPath = "C_ActionBar.GetActionUseCount",
    params = { { name = "actionID", type = "luaIndex", default = nil } },
    returns = { { name = "count", type = "number", canBeSecret = false } },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_ActionBar.GetBonusBarIndex"] = {
    key = "C_ActionBar.GetBonusBarIndex",
    name = "GetBonusBarIndex",
    category = "spell",
    subcategory = "c_actionbar",
    func = _G["C_ActionBar"] and _G["C_ActionBar"]["GetBonusBarIndex"],
    funcPath = "C_ActionBar.GetBonusBarIndex",
    params = {  },
    returns = { { name = "bonusBarIndex", type = "luaIndex", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["C_ActionBar.GetBonusBarIndexForSlot"] = {
    key = "C_ActionBar.GetBonusBarIndexForSlot",
    name = "GetBonusBarIndexForSlot",
    category = "combat_midnight",
    subcategory = "c_actionbar",
    func = _G["C_ActionBar"] and _G["C_ActionBar"]["GetBonusBarIndexForSlot"],
    funcPath = "C_ActionBar.GetBonusBarIndexForSlot",
    params = { { name = "slotID", type = "luaIndex", default = nil } },
    returns = { { name = "bonusBarIndex", type = "luaIndex", canBeSecret = false } },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_ActionBar.GetBonusBarOffset"] = {
    key = "C_ActionBar.GetBonusBarOffset",
    name = "GetBonusBarOffset",
    category = "spell",
    subcategory = "c_actionbar",
    func = _G["C_ActionBar"] and _G["C_ActionBar"]["GetBonusBarOffset"],
    funcPath = "C_ActionBar.GetBonusBarOffset",
    params = {  },
    returns = { { name = "bonusBarOffset", type = "number", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["C_ActionBar.GetExtraBarIndex"] = {
    key = "C_ActionBar.GetExtraBarIndex",
    name = "GetExtraBarIndex",
    category = "spell",
    subcategory = "c_actionbar",
    func = _G["C_ActionBar"] and _G["C_ActionBar"]["GetExtraBarIndex"],
    funcPath = "C_ActionBar.GetExtraBarIndex",
    params = {  },
    returns = { { name = "extraBarIndex", type = "luaIndex", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["C_ActionBar.GetItemActionOnEquipSpellID"] = {
    key = "C_ActionBar.GetItemActionOnEquipSpellID",
    name = "GetItemActionOnEquipSpellID",
    category = "combat_midnight",
    subcategory = "c_actionbar",
    func = _G["C_ActionBar"] and _G["C_ActionBar"]["GetItemActionOnEquipSpellID"],
    funcPath = "C_ActionBar.GetItemActionOnEquipSpellID",
    params = { { name = "actionID", type = "luaIndex", default = nil } },
    returns = { { name = "onEquipSpellID", type = "number", canBeSecret = false } },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_ActionBar.GetMultiCastBarIndex"] = {
    key = "C_ActionBar.GetMultiCastBarIndex",
    name = "GetMultiCastBarIndex",
    category = "spell",
    subcategory = "c_actionbar",
    func = _G["C_ActionBar"] and _G["C_ActionBar"]["GetMultiCastBarIndex"],
    funcPath = "C_ActionBar.GetMultiCastBarIndex",
    params = {  },
    returns = { { name = "multiCastBarIndex", type = "luaIndex", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["C_ActionBar.GetOverrideBarIndex"] = {
    key = "C_ActionBar.GetOverrideBarIndex",
    name = "GetOverrideBarIndex",
    category = "spell",
    subcategory = "c_actionbar",
    func = _G["C_ActionBar"] and _G["C_ActionBar"]["GetOverrideBarIndex"],
    funcPath = "C_ActionBar.GetOverrideBarIndex",
    params = {  },
    returns = { { name = "overrideBarIndex", type = "luaIndex", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["C_ActionBar.GetOverrideBarSkin"] = {
    key = "C_ActionBar.GetOverrideBarSkin",
    name = "GetOverrideBarSkin",
    category = "spell",
    subcategory = "c_actionbar",
    func = _G["C_ActionBar"] and _G["C_ActionBar"]["GetOverrideBarSkin"],
    funcPath = "C_ActionBar.GetOverrideBarSkin",
    params = {  },
    returns = { { name = "textureFileID", type = "fileID", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["C_ActionBar.GetPetActionPetBarIndices"] = {
    key = "C_ActionBar.GetPetActionPetBarIndices",
    name = "GetPetActionPetBarIndices",
    category = "combat_midnight",
    subcategory = "c_actionbar",
    func = _G["C_ActionBar"] and _G["C_ActionBar"]["GetPetActionPetBarIndices"],
    funcPath = "C_ActionBar.GetPetActionPetBarIndices",
    params = { { name = "petActionID", type = "number", default = nil } },
    returns = { { name = "slots", type = "table", canBeSecret = false } },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_ActionBar.GetProfessionQuality"] = {
    key = "C_ActionBar.GetProfessionQuality",
    name = "GetProfessionQuality",
    category = "combat_midnight",
    subcategory = "c_actionbar",
    func = _G["C_ActionBar"] and _G["C_ActionBar"]["GetProfessionQuality"],
    funcPath = "C_ActionBar.GetProfessionQuality",
    params = { { name = "actionID", type = "luaIndex", default = nil } },
    returns = { { name = "quality", type = "number", canBeSecret = false } },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_ActionBar.GetProfessionQualityInfo"] = {
    key = "C_ActionBar.GetProfessionQualityInfo",
    name = "GetProfessionQualityInfo",
    category = "combat_midnight",
    subcategory = "c_actionbar",
    func = _G["C_ActionBar"] and _G["C_ActionBar"]["GetProfessionQualityInfo"],
    funcPath = "C_ActionBar.GetProfessionQualityInfo",
    params = { { name = "actionID", type = "luaIndex", default = nil } },
    returns = { { name = "info", type = "CraftingQualityInfo", canBeSecret = false } },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_ActionBar.GetSpell"] = {
    key = "C_ActionBar.GetSpell",
    name = "GetSpell",
    category = "combat_midnight",
    subcategory = "c_actionbar",
    func = _G["C_ActionBar"] and _G["C_ActionBar"]["GetSpell"],
    funcPath = "C_ActionBar.GetSpell",
    params = { { name = "actionID", type = "luaIndex", default = nil } },
    returns = { { name = "spellID", type = "number", canBeSecret = false } },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_ActionBar.GetTempShapeshiftBarIndex"] = {
    key = "C_ActionBar.GetTempShapeshiftBarIndex",
    name = "GetTempShapeshiftBarIndex",
    category = "spell",
    subcategory = "c_actionbar",
    func = _G["C_ActionBar"] and _G["C_ActionBar"]["GetTempShapeshiftBarIndex"],
    funcPath = "C_ActionBar.GetTempShapeshiftBarIndex",
    params = {  },
    returns = { { name = "tempShapeshiftBarIndex", type = "luaIndex", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["C_ActionBar.GetVehicleBarIndex"] = {
    key = "C_ActionBar.GetVehicleBarIndex",
    name = "GetVehicleBarIndex",
    category = "spell",
    subcategory = "c_actionbar",
    func = _G["C_ActionBar"] and _G["C_ActionBar"]["GetVehicleBarIndex"],
    funcPath = "C_ActionBar.GetVehicleBarIndex",
    params = {  },
    returns = { { name = "vehicleBarIndex", type = "luaIndex", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["C_ActionBar.HasAction"] = {
    key = "C_ActionBar.HasAction",
    name = "HasAction",
    category = "combat_midnight",
    subcategory = "c_actionbar",
    func = _G["C_ActionBar"] and _G["C_ActionBar"]["HasAction"],
    funcPath = "C_ActionBar.HasAction",
    params = { { name = "actionID", type = "luaIndex", default = nil } },
    returns = { { name = "hasAction", type = "bool", canBeSecret = false } },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_ActionBar.HasAssistedCombatActionButtons"] = {
    key = "C_ActionBar.HasAssistedCombatActionButtons",
    name = "HasAssistedCombatActionButtons",
    category = "spell",
    subcategory = "c_actionbar",
    func = _G["C_ActionBar"] and _G["C_ActionBar"]["HasAssistedCombatActionButtons"],
    funcPath = "C_ActionBar.HasAssistedCombatActionButtons",
    params = {  },
    returns = { { name = "hasButtons", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["C_ActionBar.HasBonusActionBar"] = {
    key = "C_ActionBar.HasBonusActionBar",
    name = "HasBonusActionBar",
    category = "spell",
    subcategory = "c_actionbar",
    func = _G["C_ActionBar"] and _G["C_ActionBar"]["HasBonusActionBar"],
    funcPath = "C_ActionBar.HasBonusActionBar",
    params = {  },
    returns = { { name = "hasBonusActionBar", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["C_ActionBar.HasExtraActionBar"] = {
    key = "C_ActionBar.HasExtraActionBar",
    name = "HasExtraActionBar",
    category = "spell",
    subcategory = "c_actionbar",
    func = _G["C_ActionBar"] and _G["C_ActionBar"]["HasExtraActionBar"],
    funcPath = "C_ActionBar.HasExtraActionBar",
    params = {  },
    returns = { { name = "hasExtraActionBar", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["C_ActionBar.HasFlyoutActionButtons"] = {
    key = "C_ActionBar.HasFlyoutActionButtons",
    name = "HasFlyoutActionButtons",
    category = "combat_midnight",
    subcategory = "c_actionbar",
    func = _G["C_ActionBar"] and _G["C_ActionBar"]["HasFlyoutActionButtons"],
    funcPath = "C_ActionBar.HasFlyoutActionButtons",
    params = { { name = "flyoutID", type = "number", default = nil } },
    returns = { { name = "hasFlyoutActionButtons", type = "bool", canBeSecret = false } },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_ActionBar.HasOverrideActionBar"] = {
    key = "C_ActionBar.HasOverrideActionBar",
    name = "HasOverrideActionBar",
    category = "spell",
    subcategory = "c_actionbar",
    func = _G["C_ActionBar"] and _G["C_ActionBar"]["HasOverrideActionBar"],
    funcPath = "C_ActionBar.HasOverrideActionBar",
    params = {  },
    returns = { { name = "hasOverrideActionBar", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["C_ActionBar.HasPetActionButtons"] = {
    key = "C_ActionBar.HasPetActionButtons",
    name = "HasPetActionButtons",
    category = "combat_midnight",
    subcategory = "c_actionbar",
    func = _G["C_ActionBar"] and _G["C_ActionBar"]["HasPetActionButtons"],
    funcPath = "C_ActionBar.HasPetActionButtons",
    params = { { name = "petActionID", type = "number", default = nil } },
    returns = { { name = "hasPetActionButtons", type = "bool", canBeSecret = false } },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_ActionBar.HasPetActionPetBarIndices"] = {
    key = "C_ActionBar.HasPetActionPetBarIndices",
    name = "HasPetActionPetBarIndices",
    category = "combat_midnight",
    subcategory = "c_actionbar",
    func = _G["C_ActionBar"] and _G["C_ActionBar"]["HasPetActionPetBarIndices"],
    funcPath = "C_ActionBar.HasPetActionPetBarIndices",
    params = { { name = "petActionID", type = "number", default = nil } },
    returns = { { name = "hasPetActionPetBarIndices", type = "bool", canBeSecret = false } },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_ActionBar.HasRangeRequirements"] = {
    key = "C_ActionBar.HasRangeRequirements",
    name = "HasRangeRequirements",
    category = "combat_midnight",
    subcategory = "c_actionbar",
    func = _G["C_ActionBar"] and _G["C_ActionBar"]["HasRangeRequirements"],
    funcPath = "C_ActionBar.HasRangeRequirements",
    params = { { name = "actionID", type = "luaIndex", default = nil } },
    returns = { { name = "hasRangeRequirements", type = "bool", canBeSecret = false } },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_ActionBar.HasSpellActionButtons"] = {
    key = "C_ActionBar.HasSpellActionButtons",
    name = "HasSpellActionButtons",
    category = "combat_midnight",
    subcategory = "c_actionbar",
    func = _G["C_ActionBar"] and _G["C_ActionBar"]["HasSpellActionButtons"],
    funcPath = "C_ActionBar.HasSpellActionButtons",
    params = { { name = "spellID", type = "number", default = nil } },
    returns = { { name = "hasSpellActionButtons", type = "bool", canBeSecret = false } },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenTainted",
}

APIDefs["C_ActionBar.HasTempShapeshiftActionBar"] = {
    key = "C_ActionBar.HasTempShapeshiftActionBar",
    name = "HasTempShapeshiftActionBar",
    category = "spell",
    subcategory = "c_actionbar",
    func = _G["C_ActionBar"] and _G["C_ActionBar"]["HasTempShapeshiftActionBar"],
    funcPath = "C_ActionBar.HasTempShapeshiftActionBar",
    params = {  },
    returns = { { name = "hasTempShapeshiftActionBar", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["C_ActionBar.HasVehicleActionBar"] = {
    key = "C_ActionBar.HasVehicleActionBar",
    name = "HasVehicleActionBar",
    category = "spell",
    subcategory = "c_actionbar",
    func = _G["C_ActionBar"] and _G["C_ActionBar"]["HasVehicleActionBar"],
    funcPath = "C_ActionBar.HasVehicleActionBar",
    params = {  },
    returns = { { name = "hasVehicleActionBar", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["C_ActionBar.IsActionInRange"] = {
    key = "C_ActionBar.IsActionInRange",
    name = "IsActionInRange",
    category = "combat_midnight",
    subcategory = "c_actionbar",
    func = _G["C_ActionBar"] and _G["C_ActionBar"]["IsActionInRange"],
    funcPath = "C_ActionBar.IsActionInRange",
    params = { { name = "actionID", type = "luaIndex", default = nil }, { name = "target", type = "UnitToken", default = "player" } },
    returns = { { name = "isInRange", type = "bool", canBeSecret = false } },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_ActionBar.IsAssistedCombatAction"] = {
    key = "C_ActionBar.IsAssistedCombatAction",
    name = "IsAssistedCombatAction",
    category = "combat_midnight",
    subcategory = "c_actionbar",
    func = _G["C_ActionBar"] and _G["C_ActionBar"]["IsAssistedCombatAction"],
    funcPath = "C_ActionBar.IsAssistedCombatAction",
    params = { { name = "slotID", type = "luaIndex", default = nil } },
    returns = { { name = "isAssistedCombatAction", type = "bool", canBeSecret = false } },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_ActionBar.IsAttackAction"] = {
    key = "C_ActionBar.IsAttackAction",
    name = "IsAttackAction",
    category = "combat_midnight",
    subcategory = "c_actionbar",
    func = _G["C_ActionBar"] and _G["C_ActionBar"]["IsAttackAction"],
    funcPath = "C_ActionBar.IsAttackAction",
    params = { { name = "actionID", type = "luaIndex", default = nil } },
    returns = { { name = "isAttackAction", type = "bool", canBeSecret = false } },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_ActionBar.IsAutoCastPetAction"] = {
    key = "C_ActionBar.IsAutoCastPetAction",
    name = "IsAutoCastPetAction",
    category = "combat_midnight",
    subcategory = "c_actionbar",
    func = _G["C_ActionBar"] and _G["C_ActionBar"]["IsAutoCastPetAction"],
    funcPath = "C_ActionBar.IsAutoCastPetAction",
    params = { { name = "slotID", type = "luaIndex", default = nil } },
    returns = { { name = "isAutoCastPetAction", type = "bool", canBeSecret = false } },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_ActionBar.IsAutoRepeatAction"] = {
    key = "C_ActionBar.IsAutoRepeatAction",
    name = "IsAutoRepeatAction",
    category = "combat_midnight",
    subcategory = "c_actionbar",
    func = _G["C_ActionBar"] and _G["C_ActionBar"]["IsAutoRepeatAction"],
    funcPath = "C_ActionBar.IsAutoRepeatAction",
    params = { { name = "actionID", type = "luaIndex", default = nil } },
    returns = { { name = "isAutoRepeatAction", type = "bool", canBeSecret = false } },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_ActionBar.IsConsumableAction"] = {
    key = "C_ActionBar.IsConsumableAction",
    name = "IsConsumableAction",
    category = "combat_midnight",
    subcategory = "c_actionbar",
    func = _G["C_ActionBar"] and _G["C_ActionBar"]["IsConsumableAction"],
    funcPath = "C_ActionBar.IsConsumableAction",
    params = { { name = "actionID", type = "luaIndex", default = nil } },
    returns = { { name = "isConsumableAction", type = "bool", canBeSecret = false } },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_ActionBar.IsCurrentAction"] = {
    key = "C_ActionBar.IsCurrentAction",
    name = "IsCurrentAction",
    category = "combat_midnight",
    subcategory = "c_actionbar",
    func = _G["C_ActionBar"] and _G["C_ActionBar"]["IsCurrentAction"],
    funcPath = "C_ActionBar.IsCurrentAction",
    params = { { name = "actionID", type = "luaIndex", default = nil } },
    returns = { { name = "isCurrentAction", type = "bool", canBeSecret = false } },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_ActionBar.IsEnabledAutoCastPetAction"] = {
    key = "C_ActionBar.IsEnabledAutoCastPetAction",
    name = "IsEnabledAutoCastPetAction",
    category = "combat_midnight",
    subcategory = "c_actionbar",
    func = _G["C_ActionBar"] and _G["C_ActionBar"]["IsEnabledAutoCastPetAction"],
    funcPath = "C_ActionBar.IsEnabledAutoCastPetAction",
    params = { { name = "slotID", type = "luaIndex", default = nil } },
    returns = { { name = "isEnabledAutoCastPetAction", type = "bool", canBeSecret = false } },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_ActionBar.IsEquippedAction"] = {
    key = "C_ActionBar.IsEquippedAction",
    name = "IsEquippedAction",
    category = "combat_midnight",
    subcategory = "c_actionbar",
    func = _G["C_ActionBar"] and _G["C_ActionBar"]["IsEquippedAction"],
    funcPath = "C_ActionBar.IsEquippedAction",
    params = { { name = "actionID", type = "luaIndex", default = nil } },
    returns = { { name = "isEquippedAction", type = "bool", canBeSecret = false } },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_ActionBar.IsEquippedGearOutfitAction"] = {
    key = "C_ActionBar.IsEquippedGearOutfitAction",
    name = "IsEquippedGearOutfitAction",
    category = "combat_midnight",
    subcategory = "c_actionbar",
    func = _G["C_ActionBar"] and _G["C_ActionBar"]["IsEquippedGearOutfitAction"],
    funcPath = "C_ActionBar.IsEquippedGearOutfitAction",
    params = { { name = "slotID", type = "luaIndex", default = nil } },
    returns = { { name = "isEquippedGearOutfitAction", type = "bool", canBeSecret = false } },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_ActionBar.IsHarmfulAction"] = {
    key = "C_ActionBar.IsHarmfulAction",
    name = "IsHarmfulAction",
    category = "combat_midnight",
    subcategory = "c_actionbar",
    func = _G["C_ActionBar"] and _G["C_ActionBar"]["IsHarmfulAction"],
    funcPath = "C_ActionBar.IsHarmfulAction",
    params = { { name = "actionID", type = "luaIndex", default = nil }, { name = "useNeutral", type = "bool", default = nil } },
    returns = { { name = "isHarmful", type = "bool", canBeSecret = false } },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_ActionBar.IsHelpfulAction"] = {
    key = "C_ActionBar.IsHelpfulAction",
    name = "IsHelpfulAction",
    category = "combat_midnight",
    subcategory = "c_actionbar",
    func = _G["C_ActionBar"] and _G["C_ActionBar"]["IsHelpfulAction"],
    funcPath = "C_ActionBar.IsHelpfulAction",
    params = { { name = "actionID", type = "luaIndex", default = nil }, { name = "useNeutral", type = "bool", default = nil } },
    returns = { { name = "isHelpful", type = "bool", canBeSecret = false } },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_ActionBar.IsInterruptAction"] = {
    key = "C_ActionBar.IsInterruptAction",
    name = "IsInterruptAction",
    category = "combat_midnight",
    subcategory = "c_actionbar",
    func = _G["C_ActionBar"] and _G["C_ActionBar"]["IsInterruptAction"],
    funcPath = "C_ActionBar.IsInterruptAction",
    params = { { name = "slotID", type = "luaIndex", default = nil } },
    returns = { { name = "isInterruptAction", type = "bool", canBeSecret = false } },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_ActionBar.IsItemAction"] = {
    key = "C_ActionBar.IsItemAction",
    name = "IsItemAction",
    category = "combat_midnight",
    subcategory = "c_actionbar",
    func = _G["C_ActionBar"] and _G["C_ActionBar"]["IsItemAction"],
    funcPath = "C_ActionBar.IsItemAction",
    params = { { name = "actionID", type = "luaIndex", default = nil } },
    returns = { { name = "isItemAction", type = "bool", canBeSecret = false } },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_ActionBar.IsOnBarOrSpecialBar"] = {
    key = "C_ActionBar.IsOnBarOrSpecialBar",
    name = "IsOnBarOrSpecialBar",
    category = "combat_midnight",
    subcategory = "c_actionbar",
    func = _G["C_ActionBar"] and _G["C_ActionBar"]["IsOnBarOrSpecialBar"],
    funcPath = "C_ActionBar.IsOnBarOrSpecialBar",
    params = { { name = "spellID", type = "number", default = nil } },
    returns = { { name = "isOnBarOrSpecialBar", type = "bool", canBeSecret = false } },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenTainted",
}

APIDefs["C_ActionBar.IsPossessBarVisible"] = {
    key = "C_ActionBar.IsPossessBarVisible",
    name = "IsPossessBarVisible",
    category = "spell",
    subcategory = "c_actionbar",
    func = _G["C_ActionBar"] and _G["C_ActionBar"]["IsPossessBarVisible"],
    funcPath = "C_ActionBar.IsPossessBarVisible",
    params = {  },
    returns = { { name = "isPossessBarVisible", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["C_ActionBar.IsStackableAction"] = {
    key = "C_ActionBar.IsStackableAction",
    name = "IsStackableAction",
    category = "combat_midnight",
    subcategory = "c_actionbar",
    func = _G["C_ActionBar"] and _G["C_ActionBar"]["IsStackableAction"],
    funcPath = "C_ActionBar.IsStackableAction",
    params = { { name = "actionID", type = "luaIndex", default = nil } },
    returns = { { name = "isStackableAction", type = "bool", canBeSecret = false } },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_ActionBar.IsUsableAction"] = {
    key = "C_ActionBar.IsUsableAction",
    name = "IsUsableAction",
    category = "combat_midnight",
    subcategory = "c_actionbar",
    func = _G["C_ActionBar"] and _G["C_ActionBar"]["IsUsableAction"],
    funcPath = "C_ActionBar.IsUsableAction",
    params = { { name = "actionID", type = "luaIndex", default = nil } },
    returns = { { name = "isUsable", type = "bool", canBeSecret = false }, { name = "isLackingResources", type = "bool", canBeSecret = false } },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_ActionBar.PutActionInSlot"] = {
    key = "C_ActionBar.PutActionInSlot",
    name = "PutActionInSlot",
    category = "combat_midnight",
    subcategory = "c_actionbar",
    func = _G["C_ActionBar"] and _G["C_ActionBar"]["PutActionInSlot"],
    funcPath = "C_ActionBar.PutActionInSlot",
    params = { { name = "slotID", type = "luaIndex", default = nil } },
    returns = {  },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_ActionBar.RegisterActionUIButton"] = {
    key = "C_ActionBar.RegisterActionUIButton",
    name = "RegisterActionUIButton",
    category = "combat_midnight",
    subcategory = "c_actionbar",
    func = _G["C_ActionBar"] and _G["C_ActionBar"]["RegisterActionUIButton"],
    funcPath = "C_ActionBar.RegisterActionUIButton",
    params = { { name = "checkboxFrame", type = "SimpleCheckbox", default = nil }, { name = "actionID", type = "luaIndex", default = nil }, { name = "cooldownFrame", type = "CooldownFrame", default = nil } },
    returns = {  },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_ActionBar.SetActionBarPage"] = {
    key = "C_ActionBar.SetActionBarPage",
    name = "SetActionBarPage",
    category = "combat_midnight",
    subcategory = "c_actionbar",
    func = _G["C_ActionBar"] and _G["C_ActionBar"]["SetActionBarPage"],
    funcPath = "C_ActionBar.SetActionBarPage",
    params = { { name = "pageIndex", type = "luaIndex", default = nil } },
    returns = {  },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_ActionBar.ShouldOverrideBarShowHealthBar"] = {
    key = "C_ActionBar.ShouldOverrideBarShowHealthBar",
    name = "ShouldOverrideBarShowHealthBar",
    category = "spell",
    subcategory = "c_actionbar",
    func = _G["C_ActionBar"] and _G["C_ActionBar"]["ShouldOverrideBarShowHealthBar"],
    funcPath = "C_ActionBar.ShouldOverrideBarShowHealthBar",
    params = {  },
    returns = { { name = "showHealthBar", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["C_ActionBar.ShouldOverrideBarShowManaBar"] = {
    key = "C_ActionBar.ShouldOverrideBarShowManaBar",
    name = "ShouldOverrideBarShowManaBar",
    category = "spell",
    subcategory = "c_actionbar",
    func = _G["C_ActionBar"] and _G["C_ActionBar"]["ShouldOverrideBarShowManaBar"],
    funcPath = "C_ActionBar.ShouldOverrideBarShowManaBar",
    params = {  },
    returns = { { name = "showManaBar", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["C_ActionBar.ToggleAutoCastPetAction"] = {
    key = "C_ActionBar.ToggleAutoCastPetAction",
    name = "ToggleAutoCastPetAction",
    category = "combat_midnight",
    subcategory = "c_actionbar",
    func = _G["C_ActionBar"] and _G["C_ActionBar"]["ToggleAutoCastPetAction"],
    funcPath = "C_ActionBar.ToggleAutoCastPetAction",
    params = { { name = "slotID", type = "luaIndex", default = nil } },
    returns = {  },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_ActionBar.UnregisterActionUIButton"] = {
    key = "C_ActionBar.UnregisterActionUIButton",
    name = "UnregisterActionUIButton",
    category = "combat_midnight",
    subcategory = "c_actionbar",
    func = _G["C_ActionBar"] and _G["C_ActionBar"]["UnregisterActionUIButton"],
    funcPath = "C_ActionBar.UnregisterActionUIButton",
    params = { { name = "checkboxFrame", type = "SimpleCheckbox", default = nil } },
    returns = {  },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}
