-- Generated APIDefinitions for namespace: Global
local _, ns = ...
local APIDefs = ns.APIDefinitions

APIDefs["AbbreviateLargeNumbers"] = {
    key = "AbbreviateLargeNumbers",
    name = "AbbreviateLargeNumbers",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["AbbreviateLargeNumbers"],
    funcPath = "AbbreviateLargeNumbers",
    params = { { name = "number", type = "number", default = nil }, { name = "options", type = "NumberAbbrevOptions", default = nil } },
    returns = { { name = "result", type = "string", canBeSecret = false } },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenTainted",
}

APIDefs["AbbreviateNumbers"] = {
    key = "AbbreviateNumbers",
    name = "AbbreviateNumbers",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["AbbreviateNumbers"],
    funcPath = "AbbreviateNumbers",
    params = { { name = "number", type = "number", default = nil }, { name = "options", type = "NumberAbbrevOptions", default = nil } },
    returns = { { name = "result", type = "string", canBeSecret = false } },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenTainted",
}

APIDefs["AcceptAreaSpiritHeal"] = {
    key = "AcceptAreaSpiritHeal",
    name = "AcceptAreaSpiritHeal",
    category = "general",
    subcategory = "global",
    func = _G["AcceptAreaSpiritHeal"],
    funcPath = "AcceptAreaSpiritHeal",
    params = {  },
    returns = {  },
    midnightImpact = "NORMAL",
}

APIDefs["AcceptGuild"] = {
    key = "AcceptGuild",
    name = "AcceptGuild",
    category = "general",
    subcategory = "global",
    func = _G["AcceptGuild"],
    funcPath = "AcceptGuild",
    params = {  },
    returns = {  },
    midnightImpact = "NORMAL",
}

APIDefs["AcceptResurrect"] = {
    key = "AcceptResurrect",
    name = "AcceptResurrect",
    category = "general",
    subcategory = "global",
    func = _G["AcceptResurrect"],
    funcPath = "AcceptResurrect",
    params = {  },
    returns = {  },
    midnightImpact = "NORMAL",
}

APIDefs["AddCharacterLight"] = {
    key = "AddCharacterLight",
    name = "AddCharacterLight",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["AddCharacterLight"],
    funcPath = "AddCharacterLight",
    params = { { name = "index", type = "number", default = nil }, { name = "light", type = "ModelLight", default = nil } },
    returns = {  },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["AddLight"] = {
    key = "AddLight",
    name = "AddLight",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["AddLight"],
    funcPath = "AddLight",
    params = { { name = "index", type = "number", default = nil }, { name = "light", type = "ModelLight", default = nil } },
    returns = {  },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["AddMaskTexture"] = {
    key = "AddMaskTexture",
    name = "AddMaskTexture",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["AddMaskTexture"],
    funcPath = "AddMaskTexture",
    params = { { name = "mask", type = "SimpleMaskTexture", default = nil } },
    returns = {  },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["AddMessage"] = {
    key = "AddMessage",
    name = "AddMessage",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["AddMessage"],
    funcPath = "AddMessage",
    params = { { name = "text", type = "cstring", default = nil }, { name = "colorR", type = "number", default = nil }, { name = "colorG", type = "number", default = nil }, { name = "colorB", type = "number", default = nil }, { name = "a", type = "SingleColorValue", default = nil }, { name = "messageID", type = "number", default = nil } },
    returns = {  },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["AddPetLight"] = {
    key = "AddPetLight",
    name = "AddPetLight",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["AddPetLight"],
    funcPath = "AddPetLight",
    params = { { name = "index", type = "number", default = nil }, { name = "light", type = "ModelLight", default = nil } },
    returns = {  },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["AddPoint"] = {
    key = "AddPoint",
    name = "AddPoint",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["AddPoint"],
    funcPath = "AddPoint",
    params = { { name = "pointX", type = "number", default = nil }, { name = "pointY", type = "number", default = nil } },
    returns = {  },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["AddSourceLocationExclude"] = {
    key = "AddSourceLocationExclude",
    name = "AddSourceLocationExclude",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["AddSourceLocationExclude"],
    funcPath = "AddSourceLocationExclude",
    params = { { name = "fileName", type = "cstring", default = nil } },
    returns = {  },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["AddUnit"] = {
    key = "AddUnit",
    name = "AddUnit",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["AddUnit"],
    funcPath = "AddUnit",
    params = { { name = "unitTokenString", type = "cstring", default = nil }, { name = "asset", type = "TextureAssetDisk", default = nil }, { name = "width", type = "uiUnit", default = nil }, { name = "height", type = "uiUnit", default = nil }, { name = "r", type = "number", default = nil }, { name = "g", type = "number", default = nil }, { name = "b", type = "number", default = nil }, { name = "a", type = "number", default = nil }, { name = "sublayer", type = "number", default = nil }, { name = "showFacing", type = "bool", default = nil } },
    returns = {  },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["AdjustPointsOffset"] = {
    key = "AdjustPointsOffset",
    name = "AdjustPointsOffset",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["AdjustPointsOffset"],
    funcPath = "AdjustPointsOffset",
    params = { { name = "x", type = "uiUnit", default = nil }, { name = "y", type = "uiUnit", default = nil } },
    returns = {  },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["AdvanceTime"] = {
    key = "AdvanceTime",
    name = "AdvanceTime",
    category = "general",
    subcategory = "global",
    func = _G["AdvanceTime"],
    funcPath = "AdvanceTime",
    params = {  },
    returns = {  },
    midnightImpact = "NORMAL",
}

APIDefs["Ambiguate"] = {
    key = "Ambiguate",
    name = "Ambiguate",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["Ambiguate"],
    funcPath = "Ambiguate",
    params = { { name = "fullName", type = "cstring", default = nil }, { name = "context", type = "cstring", default = nil } },
    returns = { { name = "result", type = "string", canBeSecret = false } },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["ApplySnapshot"] = {
    key = "ApplySnapshot",
    name = "ApplySnapshot",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["ApplySnapshot"],
    funcPath = "ApplySnapshot",
    params = { { name = "texture", type = "SimpleTexture", default = nil }, { name = "snapshotID", type = "number", default = nil } },
    returns = { { name = "success", type = "bool", canBeSecret = false } },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["ApplySpellVisualKit"] = {
    key = "ApplySpellVisualKit",
    name = "ApplySpellVisualKit",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["ApplySpellVisualKit"],
    funcPath = "ApplySpellVisualKit",
    params = { { name = "spellVisualKitID", type = "number", default = nil }, { name = "oneShot", type = "bool", default = false } },
    returns = {  },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["AreClassRolesSoftSuggestions"] = {
    key = "AreClassRolesSoftSuggestions",
    name = "AreClassRolesSoftSuggestions",
    category = "general",
    subcategory = "global",
    func = _G["AreClassRolesSoftSuggestions"],
    funcPath = "AreClassRolesSoftSuggestions",
    params = {  },
    returns = { { name = "result", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["AreDangerousScriptsAllowed"] = {
    key = "AreDangerousScriptsAllowed",
    name = "AreDangerousScriptsAllowed",
    category = "general",
    subcategory = "global",
    func = _G["AreDangerousScriptsAllowed"],
    funcPath = "AreDangerousScriptsAllowed",
    params = {  },
    returns = { { name = "allowed", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["Assign"] = {
    key = "Assign",
    name = "Assign",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["Assign"],
    funcPath = "Assign",
    params = { { name = "other", type = "LuaDurationObject", default = nil } },
    returns = {  },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["AssistUnit"] = {
    key = "AssistUnit",
    name = "AssistUnit",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["AssistUnit"],
    funcPath = "AssistUnit",
    params = { { name = "name", type = "cstring", default = "" }, { name = "exactMatch", type = "bool", default = false } },
    returns = {  },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["AttachToMount"] = {
    key = "AttachToMount",
    name = "AttachToMount",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["AttachToMount"],
    funcPath = "AttachToMount",
    params = { { name = "rider", type = "ModelSceneFrameActor", default = nil }, { name = "animation", type = "AnimationDataEnum", default = nil }, { name = "spellKitVisualID", type = "number", default = nil } },
    returns = { { name = "success", type = "bool", canBeSecret = false } },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["AttackTarget"] = {
    key = "AttackTarget",
    name = "AttackTarget",
    category = "general",
    subcategory = "global",
    func = _G["AttackTarget"],
    funcPath = "AttackTarget",
    params = {  },
    returns = {  },
    midnightImpact = "NORMAL",
}

APIDefs["AutoEquipCursorItem"] = {
    key = "AutoEquipCursorItem",
    name = "AutoEquipCursorItem",
    category = "general",
    subcategory = "global",
    func = _G["AutoEquipCursorItem"],
    funcPath = "AutoEquipCursorItem",
    params = {  },
    returns = {  },
    midnightImpact = "NORMAL",
}

APIDefs["BeginTrade"] = {
    key = "BeginTrade",
    name = "BeginTrade",
    category = "general",
    subcategory = "global",
    func = _G["BeginTrade"],
    funcPath = "BeginTrade",
    params = {  },
    returns = {  },
    midnightImpact = "NORMAL",
}

APIDefs["BreakUpLargeNumbers"] = {
    key = "BreakUpLargeNumbers",
    name = "BreakUpLargeNumbers",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["BreakUpLargeNumbers"],
    funcPath = "BreakUpLargeNumbers",
    params = { { name = "largeNumber", type = "number", default = nil }, { name = "natural", type = "bool", default = false } },
    returns = { { name = "result", type = "string", canBeSecret = false } },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenTainted",
}

APIDefs["CalculateMountScale"] = {
    key = "CalculateMountScale",
    name = "CalculateMountScale",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["CalculateMountScale"],
    funcPath = "CalculateMountScale",
    params = { { name = "rider", type = "ModelSceneFrameActor", default = nil } },
    returns = { { name = "scale", type = "number", canBeSecret = false } },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["CalculateStringEditDistance"] = {
    key = "CalculateStringEditDistance",
    name = "CalculateStringEditDistance",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["CalculateStringEditDistance"],
    funcPath = "CalculateStringEditDistance",
    params = { { name = "firstString", type = "stringView", default = nil }, { name = "secondString", type = "stringView", default = nil } },
    returns = { { name = "distance", type = "number", canBeSecret = false } },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["CanBeRaidTarget"] = {
    key = "CanBeRaidTarget",
    name = "CanBeRaidTarget",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["CanBeRaidTarget"],
    funcPath = "CanBeRaidTarget",
    params = { { name = "target", type = "UnitToken", default = "player" } },
    returns = { { name = "result", type = "bool", canBeSecret = false } },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["CanChangePlayerDifficulty"] = {
    key = "CanChangePlayerDifficulty",
    name = "CanChangePlayerDifficulty",
    category = "general",
    subcategory = "global",
    func = _G["CanChangePlayerDifficulty"],
    funcPath = "CanChangePlayerDifficulty",
    params = {  },
    returns = { { name = "canChange", type = "bool", canBeSecret = false }, { name = "notOnCooldown", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["CanDualWield"] = {
    key = "CanDualWield",
    name = "CanDualWield",
    category = "general",
    subcategory = "global",
    func = _G["CanDualWield"],
    funcPath = "CanDualWield",
    params = {  },
    returns = { { name = "result", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["CanEjectPassengerFromSeat"] = {
    key = "CanEjectPassengerFromSeat",
    name = "CanEjectPassengerFromSeat",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["CanEjectPassengerFromSeat"],
    funcPath = "CanEjectPassengerFromSeat",
    params = { { name = "virtualSeatIndex", type = "luaIndex", default = nil } },
    returns = { { name = "result", type = "bool", canBeSecret = false } },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["CanInspect"] = {
    key = "CanInspect",
    name = "CanInspect",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["CanInspect"],
    funcPath = "CanInspect",
    params = { { name = "targetGUID", type = "UnitToken", default = "player" } },
    returns = { { name = "result", type = "bool", canBeSecret = false } },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["CanLootUnit"] = {
    key = "CanLootUnit",
    name = "CanLootUnit",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["CanLootUnit"],
    funcPath = "CanLootUnit",
    params = { { name = "targetUnit", type = "WOWGUID", default = nil } },
    returns = { { name = "hasLoot", type = "bool", canBeSecret = false }, { name = "canLoot", type = "bool", canBeSecret = false } },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["CanMapChangeDifficulty"] = {
    key = "CanMapChangeDifficulty",
    name = "CanMapChangeDifficulty",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["CanMapChangeDifficulty"],
    funcPath = "CanMapChangeDifficulty",
    params = { { name = "mapID", type = "number", default = nil } },
    returns = { { name = "canChange", type = "bool", canBeSecret = false } },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["CanMove"] = {
    key = "CanMove",
    name = "CanMove",
    category = "general",
    subcategory = "global",
    func = _G["CanMove"],
    funcPath = "CanMove",
    params = {  },
    returns = { { name = "moveRestriction", type = "HousingLayoutRestriction", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["CanRemove"] = {
    key = "CanRemove",
    name = "CanRemove",
    category = "general",
    subcategory = "global",
    func = _G["CanRemove"],
    funcPath = "CanRemove",
    params = {  },
    returns = { { name = "removalRestriction", type = "HousingLayoutRestriction", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["CanRotate"] = {
    key = "CanRotate",
    name = "CanRotate",
    category = "general",
    subcategory = "global",
    func = _G["CanRotate"],
    funcPath = "CanRotate",
    params = {  },
    returns = { { name = "rotateRestriction", type = "HousingLayoutRestriction", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["CanSaveTabardNow"] = {
    key = "CanSaveTabardNow",
    name = "CanSaveTabardNow",
    category = "general",
    subcategory = "global",
    func = _G["CanSaveTabardNow"],
    funcPath = "CanSaveTabardNow",
    params = {  },
    returns = { { name = "canSave", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["CanSetUnit"] = {
    key = "CanSetUnit",
    name = "CanSetUnit",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["CanSetUnit"],
    funcPath = "CanSetUnit",
    params = { { name = "unit", type = "UnitToken", default = "player" } },
    returns = {  },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["CanShowResetInstances"] = {
    key = "CanShowResetInstances",
    name = "CanShowResetInstances",
    category = "general",
    subcategory = "global",
    func = _G["CanShowResetInstances"],
    funcPath = "CanShowResetInstances",
    params = {  },
    returns = { { name = "result", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["CanShowSetRoleButton"] = {
    key = "CanShowSetRoleButton",
    name = "CanShowSetRoleButton",
    category = "general",
    subcategory = "global",
    func = _G["CanShowSetRoleButton"],
    funcPath = "CanShowSetRoleButton",
    params = {  },
    returns = { { name = "result", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["CanSwitchVehicleSeat"] = {
    key = "CanSwitchVehicleSeat",
    name = "CanSwitchVehicleSeat",
    category = "general",
    subcategory = "global",
    func = _G["CanSwitchVehicleSeat"],
    funcPath = "CanSwitchVehicleSeat",
    params = {  },
    returns = { { name = "result", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["CanUpgradeToCurrentExpansion"] = {
    key = "CanUpgradeToCurrentExpansion",
    name = "CanUpgradeToCurrentExpansion",
    category = "general",
    subcategory = "global",
    func = _G["CanUpgradeToCurrentExpansion"],
    funcPath = "CanUpgradeToCurrentExpansion",
    params = {  },
    returns = { { name = "canUpgradeExpansion", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["CancelAreaSpiritHeal"] = {
    key = "CancelAreaSpiritHeal",
    name = "CancelAreaSpiritHeal",
    category = "general",
    subcategory = "global",
    func = _G["CancelAreaSpiritHeal"],
    funcPath = "CancelAreaSpiritHeal",
    params = {  },
    returns = {  },
    midnightImpact = "NORMAL",
}

APIDefs["CancelLogout"] = {
    key = "CancelLogout",
    name = "CancelLogout",
    category = "general",
    subcategory = "global",
    func = _G["CancelLogout"],
    funcPath = "CancelLogout",
    params = {  },
    returns = {  },
    midnightImpact = "NORMAL",
}

APIDefs["CancelOpenCheckout"] = {
    key = "CancelOpenCheckout",
    name = "CancelOpenCheckout",
    category = "general",
    subcategory = "global",
    func = _G["CancelOpenCheckout"],
    funcPath = "CancelOpenCheckout",
    params = {  },
    returns = {  },
    midnightImpact = "NORMAL",
}

APIDefs["CancelPendingEquip"] = {
    key = "CancelPendingEquip",
    name = "CancelPendingEquip",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["CancelPendingEquip"],
    funcPath = "CancelPendingEquip",
    params = { { name = "index", type = "number", default = nil } },
    returns = {  },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["CancelPreloadingMovie"] = {
    key = "CancelPreloadingMovie",
    name = "CancelPreloadingMovie",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["CancelPreloadingMovie"],
    funcPath = "CancelPreloadingMovie",
    params = { { name = "movieId", type = "number", default = nil } },
    returns = {  },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["CancelTrade"] = {
    key = "CancelTrade",
    name = "CancelTrade",
    category = "general",
    subcategory = "global",
    func = _G["CancelTrade"],
    funcPath = "CancelTrade",
    params = {  },
    returns = {  },
    midnightImpact = "NORMAL",
}

APIDefs["CaseAccentInsensitiveParse"] = {
    key = "CaseAccentInsensitiveParse",
    name = "CaseAccentInsensitiveParse",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["CaseAccentInsensitiveParse"],
    funcPath = "CaseAccentInsensitiveParse",
    params = { { name = "name", type = "cstring", default = nil } },
    returns = { { name = "result", type = "string", canBeSecret = false } },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["CheckInteractDistance"] = {
    key = "CheckInteractDistance",
    name = "CheckInteractDistance",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["CheckInteractDistance"],
    funcPath = "CheckInteractDistance",
    params = { { name = "unitGUID", type = "UnitToken", default = "player" }, { name = "distIndex", type = "luaIndex", default = nil } },
    returns = { { name = "result", type = "bool", canBeSecret = false } },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["CheckTalentMasterDist"] = {
    key = "CheckTalentMasterDist",
    name = "CheckTalentMasterDist",
    category = "general",
    subcategory = "global",
    func = _G["CheckTalentMasterDist"],
    funcPath = "CheckTalentMasterDist",
    params = {  },
    returns = { { name = "result", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["CinematicFinished"] = {
    key = "CinematicFinished",
    name = "CinematicFinished",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["CinematicFinished"],
    funcPath = "CinematicFinished",
    params = { { name = "movieType", type = "CinematicType", default = nil }, { name = "userCanceled", type = "bool", default = false }, { name = "didError", type = "bool", default = false } },
    returns = {  },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["CinematicStarted"] = {
    key = "CinematicStarted",
    name = "CinematicStarted",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["CinematicStarted"],
    funcPath = "CinematicStarted",
    params = { { name = "movieType", type = "CinematicType", default = nil }, { name = "movieID", type = "number", default = nil }, { name = "canCancel", type = "bool", default = true } },
    returns = {  },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["ClassicExpansionAtLeast"] = {
    key = "ClassicExpansionAtLeast",
    name = "ClassicExpansionAtLeast",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["ClassicExpansionAtLeast"],
    funcPath = "ClassicExpansionAtLeast",
    params = { { name = "expansionLevel", type = "number", default = nil } },
    returns = { { name = "isAtLeast", type = "bool", canBeSecret = false } },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["ClassicExpansionAtMost"] = {
    key = "ClassicExpansionAtMost",
    name = "ClassicExpansionAtMost",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["ClassicExpansionAtMost"],
    funcPath = "ClassicExpansionAtMost",
    params = { { name = "expansionLevel", type = "number", default = nil } },
    returns = { { name = "isAtMost", type = "bool", canBeSecret = false } },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["Clear"] = {
    key = "Clear",
    name = "Clear",
    category = "general",
    subcategory = "global",
    func = _G["Clear"],
    funcPath = "Clear",
    params = {  },
    returns = {  },
    midnightImpact = "NORMAL",
}

APIDefs["ClearAllPoints"] = {
    key = "ClearAllPoints",
    name = "ClearAllPoints",
    category = "general",
    subcategory = "global",
    func = _G["ClearAllPoints"],
    funcPath = "ClearAllPoints",
    params = {  },
    returns = {  },
    midnightImpact = "NORMAL",
}

APIDefs["ClearColorWheelTexture"] = {
    key = "ClearColorWheelTexture",
    name = "ClearColorWheelTexture",
    category = "general",
    subcategory = "global",
    func = _G["ClearColorWheelTexture"],
    funcPath = "ClearColorWheelTexture",
    params = {  },
    returns = {  },
    midnightImpact = "NORMAL",
}

APIDefs["ClearCursor"] = {
    key = "ClearCursor",
    name = "ClearCursor",
    category = "general",
    subcategory = "global",
    func = _G["ClearCursor"],
    funcPath = "ClearCursor",
    params = {  },
    returns = {  },
    midnightImpact = "NORMAL",
}

APIDefs["ClearCursorHoveredItem"] = {
    key = "ClearCursorHoveredItem",
    name = "ClearCursorHoveredItem",
    category = "general",
    subcategory = "global",
    func = _G["ClearCursorHoveredItem"],
    funcPath = "ClearCursorHoveredItem",
    params = {  },
    returns = {  },
    midnightImpact = "NORMAL",
}

APIDefs["ClearFocus"] = {
    key = "ClearFocus",
    name = "ClearFocus",
    category = "general",
    subcategory = "global",
    func = _G["ClearFocus"],
    funcPath = "ClearFocus",
    params = {  },
    returns = {  },
    midnightImpact = "NORMAL",
}

APIDefs["ClearFog"] = {
    key = "ClearFog",
    name = "ClearFog",
    category = "general",
    subcategory = "global",
    func = _G["ClearFog"],
    funcPath = "ClearFog",
    params = {  },
    returns = {  },
    midnightImpact = "NORMAL",
}

APIDefs["ClearModel"] = {
    key = "ClearModel",
    name = "ClearModel",
    category = "general",
    subcategory = "global",
    func = _G["ClearModel"],
    funcPath = "ClearModel",
    params = {  },
    returns = {  },
    midnightImpact = "NORMAL",
}

APIDefs["ClearOutage"] = {
    key = "ClearOutage",
    name = "ClearOutage",
    category = "general",
    subcategory = "global",
    func = _G["ClearOutage"],
    funcPath = "ClearOutage",
    params = {  },
    returns = {  },
    midnightImpact = "NORMAL",
}

APIDefs["ClearPendingBindConversionItem"] = {
    key = "ClearPendingBindConversionItem",
    name = "ClearPendingBindConversionItem",
    category = "general",
    subcategory = "global",
    func = _G["ClearPendingBindConversionItem"],
    funcPath = "ClearPendingBindConversionItem",
    params = {  },
    returns = {  },
    midnightImpact = "NORMAL",
}

APIDefs["ClearPoint"] = {
    key = "ClearPoint",
    name = "ClearPoint",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["ClearPoint"],
    funcPath = "ClearPoint",
    params = { { name = "point", type = "FramePoint", default = nil } },
    returns = {  },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["ClearPoints"] = {
    key = "ClearPoints",
    name = "ClearPoints",
    category = "general",
    subcategory = "global",
    func = _G["ClearPoints"],
    funcPath = "ClearPoints",
    params = {  },
    returns = {  },
    midnightImpact = "NORMAL",
}

APIDefs["ClearPointsOffset"] = {
    key = "ClearPointsOffset",
    name = "ClearPointsOffset",
    category = "general",
    subcategory = "global",
    func = _G["ClearPointsOffset"],
    funcPath = "ClearPointsOffset",
    params = {  },
    returns = {  },
    midnightImpact = "NORMAL",
}

APIDefs["ClearRaidMarker"] = {
    key = "ClearRaidMarker",
    name = "ClearRaidMarker",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["ClearRaidMarker"],
    funcPath = "ClearRaidMarker",
    params = { { name = "raidMarkerIndex", type = "luaIndex", default = nil } },
    returns = {  },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["ClearTarget"] = {
    key = "ClearTarget",
    name = "ClearTarget",
    category = "general",
    subcategory = "global",
    func = _G["ClearTarget"],
    funcPath = "ClearTarget",
    params = {  },
    returns = { { name = "willMakeChange", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["ClearTransform"] = {
    key = "ClearTransform",
    name = "ClearTransform",
    category = "general",
    subcategory = "global",
    func = _G["ClearTransform"],
    funcPath = "ClearTransform",
    params = {  },
    returns = {  },
    midnightImpact = "NORMAL",
}

APIDefs["ClearUnits"] = {
    key = "ClearUnits",
    name = "ClearUnits",
    category = "general",
    subcategory = "global",
    func = _G["ClearUnits"],
    funcPath = "ClearUnits",
    params = {  },
    returns = {  },
    midnightImpact = "NORMAL",
}

APIDefs["CloseCheckout"] = {
    key = "CloseCheckout",
    name = "CloseCheckout",
    category = "general",
    subcategory = "global",
    func = _G["CloseCheckout"],
    funcPath = "CloseCheckout",
    params = {  },
    returns = {  },
    midnightImpact = "NORMAL",
}

APIDefs["ClosestGameObjectPosition"] = {
    key = "ClosestGameObjectPosition",
    name = "ClosestGameObjectPosition",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["ClosestGameObjectPosition"],
    funcPath = "ClosestGameObjectPosition",
    params = { { name = "gameObjectID", type = "number", default = nil } },
    returns = { { name = "xPos", type = "number", canBeSecret = true }, { name = "yPos", type = "number", canBeSecret = true }, { name = "distance", type = "number", canBeSecret = true } },
    midnightImpact = "HIGH",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted, SecretReturns",
}

APIDefs["ClosestUnitPosition"] = {
    key = "ClosestUnitPosition",
    name = "ClosestUnitPosition",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["ClosestUnitPosition"],
    funcPath = "ClosestUnitPosition",
    params = { { name = "creatureID", type = "number", default = nil } },
    returns = { { name = "xPos", type = "number", canBeSecret = true }, { name = "yPos", type = "number", canBeSecret = true }, { name = "distance", type = "number", canBeSecret = true } },
    midnightImpact = "HIGH",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted, SecretReturns",
}

APIDefs["ConfirmTalentWipe"] = {
    key = "ConfirmTalentWipe",
    name = "ConfirmTalentWipe",
    category = "general",
    subcategory = "global",
    func = _G["ConfirmTalentWipe"],
    funcPath = "ConfirmTalentWipe",
    params = {  },
    returns = {  },
    midnightImpact = "NORMAL",
}

APIDefs["ConsoleEcho"] = {
    key = "ConsoleEcho",
    name = "ConsoleEcho",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["ConsoleEcho"],
    funcPath = "ConsoleEcho",
    params = { { name = "command", type = "cstring", default = nil }, { name = "addToHistory", type = "bool", default = false }, { name = "prefix", type = "cstring", default = nil } },
    returns = { { name = "result", type = "bool", canBeSecret = false } },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["ConsoleExec"] = {
    key = "ConsoleExec",
    name = "ConsoleExec",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["ConsoleExec"],
    funcPath = "ConsoleExec",
    params = { { name = "command", type = "cstring", default = nil }, { name = "addToHistory", type = "bool", default = false } },
    returns = { { name = "result", type = "bool", canBeSecret = false } },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["ConsoleGetAllCommands"] = {
    key = "ConsoleGetAllCommands",
    name = "ConsoleGetAllCommands",
    category = "general",
    subcategory = "global",
    func = _G["ConsoleGetAllCommands"],
    funcPath = "ConsoleGetAllCommands",
    params = {  },
    returns = { { name = "commands", type = "table", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["ConsoleGetColorFromType"] = {
    key = "ConsoleGetColorFromType",
    name = "ConsoleGetColorFromType",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["ConsoleGetColorFromType"],
    funcPath = "ConsoleGetColorFromType",
    params = { { name = "colorType", type = "ConsoleColorType", default = nil } },
    returns = { { name = "color", type = "colorRGB", canBeSecret = false } },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["ConsoleGetFontHeight"] = {
    key = "ConsoleGetFontHeight",
    name = "ConsoleGetFontHeight",
    category = "general",
    subcategory = "global",
    func = _G["ConsoleGetFontHeight"],
    funcPath = "ConsoleGetFontHeight",
    params = {  },
    returns = { { name = "fontHeightInPixels", type = "number", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["ConsoleIsActive"] = {
    key = "ConsoleIsActive",
    name = "ConsoleIsActive",
    category = "general",
    subcategory = "global",
    func = _G["ConsoleIsActive"],
    funcPath = "ConsoleIsActive",
    params = {  },
    returns = { { name = "consoleIsActive", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["ConsolePrintAllMatchingCommands"] = {
    key = "ConsolePrintAllMatchingCommands",
    name = "ConsolePrintAllMatchingCommands",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["ConsolePrintAllMatchingCommands"],
    funcPath = "ConsolePrintAllMatchingCommands",
    params = { { name = "partialCommandText", type = "cstring", default = nil } },
    returns = {  },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["ConsoleSetFontHeight"] = {
    key = "ConsoleSetFontHeight",
    name = "ConsoleSetFontHeight",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["ConsoleSetFontHeight"],
    funcPath = "ConsoleSetFontHeight",
    params = { { name = "fontHeightInPixels", type = "number", default = nil } },
    returns = {  },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["ConvertItemToBindToAccount"] = {
    key = "ConvertItemToBindToAccount",
    name = "ConvertItemToBindToAccount",
    category = "general",
    subcategory = "global",
    func = _G["ConvertItemToBindToAccount"],
    funcPath = "ConvertItemToBindToAccount",
    params = {  },
    returns = {  },
    midnightImpact = "NORMAL",
}

APIDefs["Copy"] = {
    key = "Copy",
    name = "Copy",
    category = "general",
    subcategory = "global",
    func = _G["Copy"],
    funcPath = "Copy",
    params = {  },
    returns = { { name = "copy", type = "LuaDurationObject", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["CopyExternalLink"] = {
    key = "CopyExternalLink",
    name = "CopyExternalLink",
    category = "general",
    subcategory = "global",
    func = _G["CopyExternalLink"],
    funcPath = "CopyExternalLink",
    params = {  },
    returns = {  },
    midnightImpact = "NORMAL",
}

APIDefs["CopyFontObject"] = {
    key = "CopyFontObject",
    name = "CopyFontObject",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["CopyFontObject"],
    funcPath = "CopyFontObject",
    params = { { name = "sourceFont", type = "SimpleFont", default = nil } },
    returns = {  },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["CopyToClipboard"] = {
    key = "CopyToClipboard",
    name = "CopyToClipboard",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["CopyToClipboard"],
    funcPath = "CopyToClipboard",
    params = { { name = "text", type = "cstring", default = nil }, { name = "removeMarkup", type = "bool", default = false } },
    returns = { { name = "length", type = "number", canBeSecret = false } },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["CreateAbbreviateConfig"] = {
    key = "CreateAbbreviateConfig",
    name = "CreateAbbreviateConfig",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["CreateAbbreviateConfig"],
    funcPath = "CreateAbbreviateConfig",
    params = { { name = "data", type = "table", default = nil } },
    returns = { { name = "config", type = "AbbreviateConfig", canBeSecret = false } },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=NotAllowed",
}

APIDefs["CreateActor"] = {
    key = "CreateActor",
    name = "CreateActor",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["CreateActor"],
    funcPath = "CreateActor",
    params = { { name = "name", type = "cstring", default = nil }, { name = "template", type = "cstring", default = nil } },
    returns = {  },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["CreateAnimation"] = {
    key = "CreateAnimation",
    name = "CreateAnimation",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["CreateAnimation"],
    funcPath = "CreateAnimation",
    params = { { name = "animationType", type = "cstring", default = nil }, { name = "name", type = "cstring", default = nil }, { name = "templateName", type = "cstring", default = nil } },
    returns = { { name = "anim", type = "SimpleAnim", canBeSecret = false } },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=NotAllowed",
}

APIDefs["CreateAnimationGroup"] = {
    key = "CreateAnimationGroup",
    name = "CreateAnimationGroup",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["CreateAnimationGroup"],
    funcPath = "CreateAnimationGroup",
    params = { { name = "name", type = "cstring", default = nil }, { name = "templateName", type = "cstring", default = nil } },
    returns = { { name = "group", type = "SimpleAnimGroup", canBeSecret = false } },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=NotAllowed",
}

APIDefs["CreateControlPoint"] = {
    key = "CreateControlPoint",
    name = "CreateControlPoint",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["CreateControlPoint"],
    funcPath = "CreateControlPoint",
    params = { { name = "name", type = "cstring", default = nil }, { name = "templateName", type = "cstring", default = nil }, { name = "order", type = "number", default = nil } },
    returns = { { name = "point", type = "SimpleControlPoint", canBeSecret = false } },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=NotAllowed",
}

APIDefs["CreateFontFamily"] = {
    key = "CreateFontFamily",
    name = "CreateFontFamily",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["CreateFontFamily"],
    funcPath = "CreateFontFamily",
    params = { { name = "name", type = "cstring", default = nil }, { name = "members", type = "table", default = nil } },
    returns = { { name = "fontFamily", type = "SimpleFont", canBeSecret = false } },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["CreateFromMixins"] = {
    key = "CreateFromMixins",
    name = "CreateFromMixins",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["CreateFromMixins"],
    funcPath = "CreateFromMixins",
    params = { { name = "mixins", type = "LuaValueVariant", default = nil } },
    returns = { { name = "object", type = "LuaValueVariant", canBeSecret = false } },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["CreateSecureDelegate"] = {
    key = "CreateSecureDelegate",
    name = "CreateSecureDelegate",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["CreateSecureDelegate"],
    funcPath = "CreateSecureDelegate",
    params = { { name = "luaFunction", type = "LuaValueReference", default = nil } },
    returns = { { name = "secureDelegateFunction", type = "LuaValueReference", canBeSecret = false } },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["CreateUnitHealPredictionCalculator"] = {
    key = "CreateUnitHealPredictionCalculator",
    name = "CreateUnitHealPredictionCalculator",
    category = "general",
    subcategory = "global",
    func = _G["CreateUnitHealPredictionCalculator"],
    funcPath = "CreateUnitHealPredictionCalculator",
    params = {  },
    returns = { { name = "healPredictionCalculator", type = "UnitHealPredictionCalculator", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["CreateWindow"] = {
    key = "CreateWindow",
    name = "CreateWindow",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["CreateWindow"],
    funcPath = "CreateWindow",
    params = { { name = "popupStyle", type = "bool", default = true }, { name = "topMost", type = "bool", default = false } },
    returns = { { name = "window", type = "SimpleWindow", canBeSecret = false } },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["CursorHasItem"] = {
    key = "CursorHasItem",
    name = "CursorHasItem",
    category = "general",
    subcategory = "global",
    func = _G["CursorHasItem"],
    funcPath = "CursorHasItem",
    params = {  },
    returns = { { name = "result", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["CursorHasMacro"] = {
    key = "CursorHasMacro",
    name = "CursorHasMacro",
    category = "general",
    subcategory = "global",
    func = _G["CursorHasMacro"],
    funcPath = "CursorHasMacro",
    params = {  },
    returns = { { name = "result", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["CursorHasMoney"] = {
    key = "CursorHasMoney",
    name = "CursorHasMoney",
    category = "general",
    subcategory = "global",
    func = _G["CursorHasMoney"],
    funcPath = "CursorHasMoney",
    params = {  },
    returns = { { name = "result", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["CursorHasSpell"] = {
    key = "CursorHasSpell",
    name = "CursorHasSpell",
    category = "general",
    subcategory = "global",
    func = _G["CursorHasSpell"],
    funcPath = "CursorHasSpell",
    params = {  },
    returns = { { name = "result", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["CycleVariation"] = {
    key = "CycleVariation",
    name = "CycleVariation",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["CycleVariation"],
    funcPath = "CycleVariation",
    params = { { name = "variationIndex", type = "luaIndex", default = nil }, { name = "delta", type = "number", default = nil } },
    returns = {  },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["DeclineGuild"] = {
    key = "DeclineGuild",
    name = "DeclineGuild",
    category = "general",
    subcategory = "global",
    func = _G["DeclineGuild"],
    funcPath = "DeclineGuild",
    params = {  },
    returns = {  },
    midnightImpact = "NORMAL",
}

APIDefs["DeclineName"] = {
    key = "DeclineName",
    name = "DeclineName",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["DeclineName"],
    funcPath = "DeclineName",
    params = { { name = "name", type = "cstring", default = nil }, { name = "gender", type = "UnitSex", default = nil }, { name = "declensionSet", type = "luaIndex", default = nil } },
    returns = { { name = "declinedNames", type = "string", canBeSecret = false } },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["DeclineResurrect"] = {
    key = "DeclineResurrect",
    name = "DeclineResurrect",
    category = "general",
    subcategory = "global",
    func = _G["DeclineResurrect"],
    funcPath = "DeclineResurrect",
    params = {  },
    returns = {  },
    midnightImpact = "NORMAL",
}

APIDefs["DeleteCookies"] = {
    key = "DeleteCookies",
    name = "DeleteCookies",
    category = "general",
    subcategory = "global",
    func = _G["DeleteCookies"],
    funcPath = "DeleteCookies",
    params = {  },
    returns = {  },
    midnightImpact = "NORMAL",
}

APIDefs["DeleteCursorItem"] = {
    key = "DeleteCursorItem",
    name = "DeleteCursorItem",
    category = "general",
    subcategory = "global",
    func = _G["DeleteCursorItem"],
    funcPath = "DeleteCursorItem",
    params = {  },
    returns = {  },
    midnightImpact = "NORMAL",
}

APIDefs["DestroyTotem"] = {
    key = "DestroyTotem",
    name = "DestroyTotem",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["DestroyTotem"],
    funcPath = "DestroyTotem",
    params = { { name = "slot", type = "luaIndex", default = nil } },
    returns = {  },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["DetachFromMount"] = {
    key = "DetachFromMount",
    name = "DetachFromMount",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["DetachFromMount"],
    funcPath = "DetachFromMount",
    params = { { name = "rider", type = "ModelSceneFrameActor", default = nil } },
    returns = { { name = "success", type = "bool", canBeSecret = false } },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["Disable"] = {
    key = "Disable",
    name = "Disable",
    category = "general",
    subcategory = "global",
    func = _G["Disable"],
    funcPath = "Disable",
    params = {  },
    returns = {  },
    midnightImpact = "NORMAL",
}

APIDefs["Dismount"] = {
    key = "Dismount",
    name = "Dismount",
    category = "general",
    subcategory = "global",
    func = _G["Dismount"],
    funcPath = "Dismount",
    params = {  },
    returns = {  },
    midnightImpact = "NORMAL",
}

APIDefs["DoesCurrentLocaleSellExpansionLevels"] = {
    key = "DoesCurrentLocaleSellExpansionLevels",
    name = "DoesCurrentLocaleSellExpansionLevels",
    category = "general",
    subcategory = "global",
    func = _G["DoesCurrentLocaleSellExpansionLevels"],
    funcPath = "DoesCurrentLocaleSellExpansionLevels",
    params = {  },
    returns = { { name = "regionSellsExpansions", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["Drag"] = {
    key = "Drag",
    name = "Drag",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["Drag"],
    funcPath = "Drag",
    params = { { name = "isAccessible", type = "bool", default = nil } },
    returns = {  },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["DrawAll"] = {
    key = "DrawAll",
    name = "DrawAll",
    category = "general",
    subcategory = "global",
    func = _G["DrawAll"],
    funcPath = "DrawAll",
    params = {  },
    returns = {  },
    midnightImpact = "NORMAL",
}

APIDefs["DrawBlob"] = {
    key = "DrawBlob",
    name = "DrawBlob",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["DrawBlob"],
    funcPath = "DrawBlob",
    params = { { name = "questID", type = "number", default = nil }, { name = "draw", type = "bool", default = false } },
    returns = {  },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["DrawNone"] = {
    key = "DrawNone",
    name = "DrawNone",
    category = "general",
    subcategory = "global",
    func = _G["DrawNone"],
    funcPath = "DrawNone",
    params = {  },
    returns = {  },
    midnightImpact = "NORMAL",
}

APIDefs["Dress"] = {
    key = "Dress",
    name = "Dress",
    category = "general",
    subcategory = "global",
    func = _G["Dress"],
    funcPath = "Dress",
    params = {  },
    returns = {  },
    midnightImpact = "NORMAL",
}

APIDefs["DressPlayerSlot"] = {
    key = "DressPlayerSlot",
    name = "DressPlayerSlot",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["DressPlayerSlot"],
    funcPath = "DressPlayerSlot",
    params = { { name = "invSlot", type = "luaIndex", default = nil } },
    returns = {  },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["DropCursorMoney"] = {
    key = "DropCursorMoney",
    name = "DropCursorMoney",
    category = "general",
    subcategory = "global",
    func = _G["DropCursorMoney"],
    funcPath = "DropCursorMoney",
    params = {  },
    returns = {  },
    midnightImpact = "NORMAL",
}

APIDefs["EjectPassengerFromSeat"] = {
    key = "EjectPassengerFromSeat",
    name = "EjectPassengerFromSeat",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["EjectPassengerFromSeat"],
    funcPath = "EjectPassengerFromSeat",
    params = { { name = "virtualSeatIndex", type = "luaIndex", default = nil } },
    returns = {  },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["Enable"] = {
    key = "Enable",
    name = "Enable",
    category = "general",
    subcategory = "global",
    func = _G["Enable"],
    funcPath = "Enable",
    params = {  },
    returns = {  },
    midnightImpact = "NORMAL",
}

APIDefs["EnableMerging"] = {
    key = "EnableMerging",
    name = "EnableMerging",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["EnableMerging"],
    funcPath = "EnableMerging",
    params = { { name = "enable", type = "bool", default = false } },
    returns = {  },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["EnableSmoothing"] = {
    key = "EnableSmoothing",
    name = "EnableSmoothing",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["EnableSmoothing"],
    funcPath = "EnableSmoothing",
    params = { { name = "enable", type = "bool", default = false } },
    returns = {  },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["EnableSubtitles"] = {
    key = "EnableSubtitles",
    name = "EnableSubtitles",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["EnableSubtitles"],
    funcPath = "EnableSubtitles",
    params = { { name = "enable", type = "bool", default = nil } },
    returns = {  },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["EquipCursorItem"] = {
    key = "EquipCursorItem",
    name = "EquipCursorItem",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["EquipCursorItem"],
    funcPath = "EquipCursorItem",
    params = { { name = "slot", type = "luaIndex", default = nil } },
    returns = {  },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["EquipItem"] = {
    key = "EquipItem",
    name = "EquipItem",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["EquipItem"],
    funcPath = "EquipItem",
    params = { { name = "itemID", type = "number", default = nil } },
    returns = {  },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["EquipPendingItem"] = {
    key = "EquipPendingItem",
    name = "EquipPendingItem",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["EquipPendingItem"],
    funcPath = "EquipPendingItem",
    params = { { name = "index", type = "number", default = nil } },
    returns = {  },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["Evaluate"] = {
    key = "Evaluate",
    name = "Evaluate",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["Evaluate"],
    funcPath = "Evaluate",
    params = { { name = "x", type = "number", default = nil } },
    returns = { { name = "y", type = "number", canBeSecret = false } },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["EvaluateElapsedPercent"] = {
    key = "EvaluateElapsedPercent",
    name = "EvaluateElapsedPercent",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["EvaluateElapsedPercent"],
    funcPath = "EvaluateElapsedPercent",
    params = { { name = "curve", type = "LuaCurveObjectBase", default = nil }, { name = "modifier", type = "DurationTimeModifier", default = "RealTime" } },
    returns = { { name = "result", type = "LuaCurveEvaluatedResult", canBeSecret = false } },
    midnightImpact = "CONDITIONAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted, SecretWhenCurveSecret",
}

APIDefs["EvaluateRemainingPercent"] = {
    key = "EvaluateRemainingPercent",
    name = "EvaluateRemainingPercent",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["EvaluateRemainingPercent"],
    funcPath = "EvaluateRemainingPercent",
    params = { { name = "curve", type = "LuaCurveObjectBase", default = nil }, { name = "modifier", type = "DurationTimeModifier", default = "RealTime" } },
    returns = { { name = "result", type = "LuaCurveEvaluatedResult", canBeSecret = false } },
    midnightImpact = "CONDITIONAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted, SecretWhenCurveSecret",
}

APIDefs["EvaluateUnpacked"] = {
    key = "EvaluateUnpacked",
    name = "EvaluateUnpacked",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["EvaluateUnpacked"],
    funcPath = "EvaluateUnpacked",
    params = { { name = "x", type = "number", default = nil } },
    returns = { { name = "yR", type = "number", canBeSecret = false }, { name = "yG", type = "number", canBeSecret = false }, { name = "yB", type = "number", canBeSecret = false }, { name = "yA", type = "number", canBeSecret = false } },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["FinalizeUnits"] = {
    key = "FinalizeUnits",
    name = "FinalizeUnits",
    category = "general",
    subcategory = "global",
    func = _G["FinalizeUnits"],
    funcPath = "FinalizeUnits",
    params = {  },
    returns = {  },
    midnightImpact = "NORMAL",
}

APIDefs["Finish"] = {
    key = "Finish",
    name = "Finish",
    category = "general",
    subcategory = "global",
    func = _G["Finish"],
    funcPath = "Finish",
    params = {  },
    returns = {  },
    midnightImpact = "NORMAL",
}

APIDefs["FlashClientIcon"] = {
    key = "FlashClientIcon",
    name = "FlashClientIcon",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["FlashClientIcon"],
    funcPath = "FlashClientIcon",
    params = { { name = "briefly", type = "bool", default = false } },
    returns = {  },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["Flush"] = {
    key = "Flush",
    name = "Flush",
    category = "general",
    subcategory = "global",
    func = _G["Flush"],
    funcPath = "Flush",
    params = {  },
    returns = {  },
    midnightImpact = "NORMAL",
}

APIDefs["FocusUnit"] = {
    key = "FocusUnit",
    name = "FocusUnit",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["FocusUnit"],
    funcPath = "FocusUnit",
    params = { { name = "name", type = "cstring", default = "" } },
    returns = {  },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["FollowUnit"] = {
    key = "FollowUnit",
    name = "FollowUnit",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["FollowUnit"],
    funcPath = "FollowUnit",
    params = { { name = "name", type = "cstring", default = "0" }, { name = "exactMatch", type = "bool", default = false } },
    returns = {  },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["ForceLogout"] = {
    key = "ForceLogout",
    name = "ForceLogout",
    category = "general",
    subcategory = "global",
    func = _G["ForceLogout"],
    funcPath = "ForceLogout",
    params = {  },
    returns = {  },
    midnightImpact = "NORMAL",
}

APIDefs["ForceQuit"] = {
    key = "ForceQuit",
    name = "ForceQuit",
    category = "general",
    subcategory = "global",
    func = _G["ForceQuit"],
    funcPath = "ForceQuit",
    params = {  },
    returns = {  },
    midnightImpact = "NORMAL",
}

APIDefs["FreezeAnimation"] = {
    key = "FreezeAnimation",
    name = "FreezeAnimation",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["FreezeAnimation"],
    funcPath = "FreezeAnimation",
    params = { { name = "anim", type = "AnimationDataEnum", default = nil }, { name = "variation", type = "number", default = nil }, { name = "frame", type = "number", default = nil } },
    returns = {  },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["GetAbbreviateNumberData"] = {
    key = "GetAbbreviateNumberData",
    name = "GetAbbreviateNumberData",
    category = "general",
    subcategory = "global",
    func = _G["GetAbbreviateNumberData"],
    funcPath = "GetAbbreviateNumberData",
    params = {  },
    returns = { { name = "data", type = "table", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["GetAccountExpansionLevel"] = {
    key = "GetAccountExpansionLevel",
    name = "GetAccountExpansionLevel",
    category = "general",
    subcategory = "global",
    func = _G["GetAccountExpansionLevel"],
    funcPath = "GetAccountExpansionLevel",
    params = {  },
    returns = { { name = "expansionLevel", type = "number", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["GetActiveBoundingBox"] = {
    key = "GetActiveBoundingBox",
    name = "GetActiveBoundingBox",
    category = "general",
    subcategory = "global",
    func = _G["GetActiveBoundingBox"],
    funcPath = "GetActiveBoundingBox",
    params = {  },
    returns = { { name = "boxBottom", type = "vector3", canBeSecret = false }, { name = "boxTop", type = "vector3", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["GetActorAtIndex"] = {
    key = "GetActorAtIndex",
    name = "GetActorAtIndex",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["GetActorAtIndex"],
    funcPath = "GetActorAtIndex",
    params = { { name = "index", type = "luaIndex", default = nil } },
    returns = {  },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["GetAddOnCPUUsage"] = {
    key = "GetAddOnCPUUsage",
    name = "GetAddOnCPUUsage",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["GetAddOnCPUUsage"],
    funcPath = "GetAddOnCPUUsage",
    params = { { name = "name", type = "uiAddon", default = nil } },
    returns = { { name = "result", type = "number", canBeSecret = false } },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["GetAddOnMemoryUsage"] = {
    key = "GetAddOnMemoryUsage",
    name = "GetAddOnMemoryUsage",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["GetAddOnMemoryUsage"],
    funcPath = "GetAddOnMemoryUsage",
    params = { { name = "name", type = "uiAddon", default = nil } },
    returns = { { name = "result", type = "number", canBeSecret = false } },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["GetAllSearchItems"] = {
    key = "GetAllSearchItems",
    name = "GetAllSearchItems",
    category = "general",
    subcategory = "global",
    func = _G["GetAllSearchItems"],
    funcPath = "GetAllSearchItems",
    params = {  },
    returns = { { name = "matchingEntryIDs", type = "table", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["GetAllowLowLevelRaid"] = {
    key = "GetAllowLowLevelRaid",
    name = "GetAllowLowLevelRaid",
    category = "general",
    subcategory = "global",
    func = _G["GetAllowLowLevelRaid"],
    funcPath = "GetAllowLowLevelRaid",
    params = {  },
    returns = { { name = "result", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["GetAllowOverlappedModels"] = {
    key = "GetAllowOverlappedModels",
    name = "GetAllowOverlappedModels",
    category = "general",
    subcategory = "global",
    func = _G["GetAllowOverlappedModels"],
    funcPath = "GetAllowOverlappedModels",
    params = {  },
    returns = { { name = "allowOverlappedModels", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["GetAllowRecentAlliesSeeLocation"] = {
    key = "GetAllowRecentAlliesSeeLocation",
    name = "GetAllowRecentAlliesSeeLocation",
    category = "general",
    subcategory = "global",
    func = _G["GetAllowRecentAlliesSeeLocation"],
    funcPath = "GetAllowRecentAlliesSeeLocation",
    params = {  },
    returns = { { name = "allowRecentAlliesSeeLocation", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["GetAlpha"] = {
    key = "GetAlpha",
    name = "GetAlpha",
    category = "general",
    subcategory = "global",
    func = _G["GetAlpha"],
    funcPath = "GetAlpha",
    params = {  },
    returns = { { name = "alpha", type = "SingleColorValue", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["GetAnimation"] = {
    key = "GetAnimation",
    name = "GetAnimation",
    category = "general",
    subcategory = "global",
    func = _G["GetAnimation"],
    funcPath = "GetAnimation",
    params = {  },
    returns = { { name = "animation", type = "AnimationDataEnum", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["GetAnimationBlendOperation"] = {
    key = "GetAnimationBlendOperation",
    name = "GetAnimationBlendOperation",
    category = "general",
    subcategory = "global",
    func = _G["GetAnimationBlendOperation"],
    funcPath = "GetAnimationBlendOperation",
    params = {  },
    returns = { { name = "blendOp", type = "ModelBlendOperation", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["GetAnimationGroups"] = {
    key = "GetAnimationGroups",
    name = "GetAnimationGroups",
    category = "general",
    subcategory = "global",
    func = _G["GetAnimationGroups"],
    funcPath = "GetAnimationGroups",
    params = {  },
    returns = { { name = "groups", type = "SimpleAnimGroup", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["GetAnimationSpeedMultiplier"] = {
    key = "GetAnimationSpeedMultiplier",
    name = "GetAnimationSpeedMultiplier",
    category = "general",
    subcategory = "global",
    func = _G["GetAnimationSpeedMultiplier"],
    funcPath = "GetAnimationSpeedMultiplier",
    params = {  },
    returns = { { name = "animationSpeedMultiplier", type = "number", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["GetAnimationVariation"] = {
    key = "GetAnimationVariation",
    name = "GetAnimationVariation",
    category = "general",
    subcategory = "global",
    func = _G["GetAnimationVariation"],
    funcPath = "GetAnimationVariation",
    params = {  },
    returns = { { name = "variation", type = "number", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["GetAnimations"] = {
    key = "GetAnimations",
    name = "GetAnimations",
    category = "general",
    subcategory = "global",
    func = _G["GetAnimations"],
    funcPath = "GetAnimations",
    params = {  },
    returns = { { name = "anims", type = "SimpleAnim", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["GetAreaSpiritHealerTime"] = {
    key = "GetAreaSpiritHealerTime",
    name = "GetAreaSpiritHealerTime",
    category = "general",
    subcategory = "global",
    func = _G["GetAreaSpiritHealerTime"],
    funcPath = "GetAreaSpiritHealerTime",
    params = {  },
    returns = { { name = "result", type = "number", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["GetAreaText"] = {
    key = "GetAreaText",
    name = "GetAreaText",
    category = "general",
    subcategory = "global",
    func = _G["GetAreaText"],
    funcPath = "GetAreaText",
    params = {  },
    returns = { { name = "text", type = "cstring", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["GetAttackPowerForStat"] = {
    key = "GetAttackPowerForStat",
    name = "GetAttackPowerForStat",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["GetAttackPowerForStat"],
    funcPath = "GetAttackPowerForStat",
    params = { { name = "stat", type = "luaIndex", default = nil }, { name = "value", type = "number", default = nil } },
    returns = { { name = "result", type = "number", canBeSecret = false } },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["GetAutoDeclineGuildInvites"] = {
    key = "GetAutoDeclineGuildInvites",
    name = "GetAutoDeclineGuildInvites",
    category = "general",
    subcategory = "global",
    func = _G["GetAutoDeclineGuildInvites"],
    funcPath = "GetAutoDeclineGuildInvites",
    params = {  },
    returns = { { name = "result", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["GetAutoDeclineNeighborhoodInvites"] = {
    key = "GetAutoDeclineNeighborhoodInvites",
    name = "GetAutoDeclineNeighborhoodInvites",
    category = "general",
    subcategory = "global",
    func = _G["GetAutoDeclineNeighborhoodInvites"],
    funcPath = "GetAutoDeclineNeighborhoodInvites",
    params = {  },
    returns = { { name = "result", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["GetAutoDress"] = {
    key = "GetAutoDress",
    name = "GetAutoDress",
    category = "general",
    subcategory = "global",
    func = _G["GetAutoDress"],
    funcPath = "GetAutoDress",
    params = {  },
    returns = { { name = "autoDress", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["GetAvailableBandwidth"] = {
    key = "GetAvailableBandwidth",
    name = "GetAvailableBandwidth",
    category = "general",
    subcategory = "global",
    func = _G["GetAvailableBandwidth"],
    funcPath = "GetAvailableBandwidth",
    params = {  },
    returns = { { name = "result", type = "number", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["GetAvailableLocaleInfo"] = {
    key = "GetAvailableLocaleInfo",
    name = "GetAvailableLocaleInfo",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["GetAvailableLocaleInfo"],
    funcPath = "GetAvailableLocaleInfo",
    params = { { name = "ignoreLocaleRestrictions", type = "bool", default = false } },
    returns = { { name = "localeInfos", type = "table", canBeSecret = false } },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["GetAvailableLocales"] = {
    key = "GetAvailableLocales",
    name = "GetAvailableLocales",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["GetAvailableLocales"],
    funcPath = "GetAvailableLocales",
    params = { { name = "ignoreLocaleRestrictions", type = "bool", default = false } },
    returns = { { name = "localeName", type = "cstring", canBeSecret = false } },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["GetAvoidance"] = {
    key = "GetAvoidance",
    name = "GetAvoidance",
    category = "general",
    subcategory = "global",
    func = _G["GetAvoidance"],
    funcPath = "GetAvoidance",
    params = {  },
    returns = { { name = "result", type = "number", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["GetBackgroundLoadingStatus"] = {
    key = "GetBackgroundLoadingStatus",
    name = "GetBackgroundLoadingStatus",
    category = "general",
    subcategory = "global",
    func = _G["GetBackgroundLoadingStatus"],
    funcPath = "GetBackgroundLoadingStatus",
    params = {  },
    returns = { { name = "result", type = "number", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["GetBillingTimeRested"] = {
    key = "GetBillingTimeRested",
    name = "GetBillingTimeRested",
    category = "general",
    subcategory = "global",
    func = _G["GetBillingTimeRested"],
    funcPath = "GetBillingTimeRested",
    params = {  },
    returns = { { name = "billingTimeRested", type = "number", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["GetBindLocation"] = {
    key = "GetBindLocation",
    name = "GetBindLocation",
    category = "general",
    subcategory = "global",
    func = _G["GetBindLocation"],
    funcPath = "GetBindLocation",
    params = {  },
    returns = { { name = "result", type = "cstring", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["GetBlockChance"] = {
    key = "GetBlockChance",
    name = "GetBlockChance",
    category = "general",
    subcategory = "global",
    func = _G["GetBlockChance"],
    funcPath = "GetBlockChance",
    params = {  },
    returns = { { name = "result", type = "number", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["GetBuildInfo"] = {
    key = "GetBuildInfo",
    name = "GetBuildInfo",
    category = "general",
    subcategory = "global",
    func = _G["GetBuildInfo"],
    funcPath = "GetBuildInfo",
    params = {  },
    returns = { { name = "buildVersion", type = "cstring", canBeSecret = false }, { name = "buildNumber", type = "cstring", canBeSecret = false }, { name = "buildDate", type = "cstring", canBeSecret = false }, { name = "interfaceVersion", type = "number", canBeSecret = false }, { name = "localizedVersion", type = "cstring", canBeSecret = false }, { name = "buildInfo", type = "string", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["GetCallstackHeight"] = {
    key = "GetCallstackHeight",
    name = "GetCallstackHeight",
    category = "general",
    subcategory = "global",
    func = _G["GetCallstackHeight"],
    funcPath = "GetCallstackHeight",
    params = {  },
    returns = { { name = "height", type = "number", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["GetCameraDistance"] = {
    key = "GetCameraDistance",
    name = "GetCameraDistance",
    category = "general",
    subcategory = "global",
    func = _G["GetCameraDistance"],
    funcPath = "GetCameraDistance",
    params = {  },
    returns = { { name = "distance", type = "number", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["GetCameraFOVDefaults"] = {
    key = "GetCameraFOVDefaults",
    name = "GetCameraFOVDefaults",
    category = "general",
    subcategory = "global",
    func = _G["GetCameraFOVDefaults"],
    funcPath = "GetCameraFOVDefaults",
    params = {  },
    returns = { { name = "fieldOfViewDegreesDefault", type = "number", canBeSecret = false }, { name = "fieldOfViewDegreesPlayerMin", type = "number", canBeSecret = false }, { name = "fieldOfViewDegreesPlayerMax", type = "number", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["GetCameraFacing"] = {
    key = "GetCameraFacing",
    name = "GetCameraFacing",
    category = "general",
    subcategory = "global",
    func = _G["GetCameraFacing"],
    funcPath = "GetCameraFacing",
    params = {  },
    returns = { { name = "radians", type = "number", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["GetCameraFarClip"] = {
    key = "GetCameraFarClip",
    name = "GetCameraFarClip",
    category = "general",
    subcategory = "global",
    func = _G["GetCameraFarClip"],
    funcPath = "GetCameraFarClip",
    params = {  },
    returns = { { name = "farClip", type = "number", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["GetCameraFieldOfView"] = {
    key = "GetCameraFieldOfView",
    name = "GetCameraFieldOfView",
    category = "general",
    subcategory = "global",
    func = _G["GetCameraFieldOfView"],
    funcPath = "GetCameraFieldOfView",
    params = {  },
    returns = { { name = "fov", type = "number", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["GetCameraForward"] = {
    key = "GetCameraForward",
    name = "GetCameraForward",
    category = "general",
    subcategory = "global",
    func = _G["GetCameraForward"],
    funcPath = "GetCameraForward",
    params = {  },
    returns = { { name = "forwardX", type = "number", canBeSecret = false }, { name = "forwardY", type = "number", canBeSecret = false }, { name = "forwardZ", type = "number", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["GetCameraNearClip"] = {
    key = "GetCameraNearClip",
    name = "GetCameraNearClip",
    category = "general",
    subcategory = "global",
    func = _G["GetCameraNearClip"],
    funcPath = "GetCameraNearClip",
    params = {  },
    returns = { { name = "nearClip", type = "number", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["GetCameraPosition"] = {
    key = "GetCameraPosition",
    name = "GetCameraPosition",
    category = "general",
    subcategory = "global",
    func = _G["GetCameraPosition"],
    funcPath = "GetCameraPosition",
    params = {  },
    returns = { { name = "positionX", type = "number", canBeSecret = false }, { name = "positionY", type = "number", canBeSecret = false }, { name = "positionZ", type = "number", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["GetCameraRight"] = {
    key = "GetCameraRight",
    name = "GetCameraRight",
    category = "general",
    subcategory = "global",
    func = _G["GetCameraRight"],
    funcPath = "GetCameraRight",
    params = {  },
    returns = { { name = "rightX", type = "number", canBeSecret = false }, { name = "rightY", type = "number", canBeSecret = false }, { name = "rightZ", type = "number", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["GetCameraRoll"] = {
    key = "GetCameraRoll",
    name = "GetCameraRoll",
    category = "general",
    subcategory = "global",
    func = _G["GetCameraRoll"],
    funcPath = "GetCameraRoll",
    params = {  },
    returns = { { name = "radians", type = "number", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["GetCameraTarget"] = {
    key = "GetCameraTarget",
    name = "GetCameraTarget",
    category = "general",
    subcategory = "global",
    func = _G["GetCameraTarget"],
    funcPath = "GetCameraTarget",
    params = {  },
    returns = { { name = "targetX", type = "number", canBeSecret = false }, { name = "targetY", type = "number", canBeSecret = false }, { name = "targetZ", type = "number", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["GetCameraUp"] = {
    key = "GetCameraUp",
    name = "GetCameraUp",
    category = "general",
    subcategory = "global",
    func = _G["GetCameraUp"],
    funcPath = "GetCameraUp",
    params = {  },
    returns = { { name = "upX", type = "number", canBeSecret = false }, { name = "upY", type = "number", canBeSecret = false }, { name = "upZ", type = "number", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["GetCatalogSearchResults"] = {
    key = "GetCatalogSearchResults",
    name = "GetCatalogSearchResults",
    category = "general",
    subcategory = "global",
    func = _G["GetCatalogSearchResults"],
    funcPath = "GetCatalogSearchResults",
    params = {  },
    returns = { { name = "matchingEntryIDs", type = "table", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["GetCemeteryPreference"] = {
    key = "GetCemeteryPreference",
    name = "GetCemeteryPreference",
    category = "general",
    subcategory = "global",
    func = _G["GetCemeteryPreference"],
    funcPath = "GetCemeteryPreference",
    params = {  },
    returns = { { name = "result", type = "number", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["GetChecked"] = {
    key = "GetChecked",
    name = "GetChecked",
    category = "general",
    subcategory = "global",
    func = _G["GetChecked"],
    funcPath = "GetChecked",
    params = {  },
    returns = { { name = "checked", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["GetCheckedTexture"] = {
    key = "GetCheckedTexture",
    name = "GetCheckedTexture",
    category = "general",
    subcategory = "global",
    func = _G["GetCheckedTexture"],
    funcPath = "GetCheckedTexture",
    params = {  },
    returns = { { name = "texture", type = "SimpleTexture", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["GetClassicExpansionLevel"] = {
    key = "GetClassicExpansionLevel",
    name = "GetClassicExpansionLevel",
    category = "general",
    subcategory = "global",
    func = _G["GetClassicExpansionLevel"],
    funcPath = "GetClassicExpansionLevel",
    params = {  },
    returns = { { name = "expansionLevel", type = "number", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["GetClientDisplayExpansionLevel"] = {
    key = "GetClientDisplayExpansionLevel",
    name = "GetClientDisplayExpansionLevel",
    category = "general",
    subcategory = "global",
    func = _G["GetClientDisplayExpansionLevel"],
    funcPath = "GetClientDisplayExpansionLevel",
    params = {  },
    returns = { { name = "expansionLevel", type = "number", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["GetCollapsingStarCost"] = {
    key = "GetCollapsingStarCost",
    name = "GetCollapsingStarCost",
    category = "general",
    subcategory = "global",
    func = _G["GetCollapsingStarCost"],
    funcPath = "GetCollapsingStarCost",
    params = {  },
    returns = { { name = "cost", type = "number", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["GetColorAlpha"] = {
    key = "GetColorAlpha",
    name = "GetColorAlpha",
    category = "general",
    subcategory = "global",
    func = _G["GetColorAlpha"],
    funcPath = "GetColorAlpha",
    params = {  },
    returns = { { name = "alpha", type = "number", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["GetColorAlphaTexture"] = {
    key = "GetColorAlphaTexture",
    name = "GetColorAlphaTexture",
    category = "general",
    subcategory = "global",
    func = _G["GetColorAlphaTexture"],
    funcPath = "GetColorAlphaTexture",
    params = {  },
    returns = { { name = "texture", type = "SimpleTexture", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["GetColorAlphaThumbTexture"] = {
    key = "GetColorAlphaThumbTexture",
    name = "GetColorAlphaThumbTexture",
    category = "general",
    subcategory = "global",
    func = _G["GetColorAlphaThumbTexture"],
    funcPath = "GetColorAlphaThumbTexture",
    params = {  },
    returns = { { name = "texture", type = "SimpleTexture", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["GetColorHSV"] = {
    key = "GetColorHSV",
    name = "GetColorHSV",
    category = "general",
    subcategory = "global",
    func = _G["GetColorHSV"],
    funcPath = "GetColorHSV",
    params = {  },
    returns = { { name = "hsvX", type = "number", canBeSecret = false }, { name = "hsvY", type = "number", canBeSecret = false }, { name = "hsvZ", type = "number", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["GetColorRGB"] = {
    key = "GetColorRGB",
    name = "GetColorRGB",
    category = "general",
    subcategory = "global",
    func = _G["GetColorRGB"],
    funcPath = "GetColorRGB",
    params = {  },
    returns = { { name = "rgbR", type = "number", canBeSecret = false }, { name = "rgbG", type = "number", canBeSecret = false }, { name = "rgbB", type = "number", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["GetColorValueTexture"] = {
    key = "GetColorValueTexture",
    name = "GetColorValueTexture",
    category = "general",
    subcategory = "global",
    func = _G["GetColorValueTexture"],
    funcPath = "GetColorValueTexture",
    params = {  },
    returns = { { name = "texture", type = "SimpleTexture", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["GetColorValueThumbTexture"] = {
    key = "GetColorValueThumbTexture",
    name = "GetColorValueThumbTexture",
    category = "general",
    subcategory = "global",
    func = _G["GetColorValueThumbTexture"],
    funcPath = "GetColorValueThumbTexture",
    params = {  },
    returns = { { name = "texture", type = "SimpleTexture", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["GetColorWheelTexture"] = {
    key = "GetColorWheelTexture",
    name = "GetColorWheelTexture",
    category = "general",
    subcategory = "global",
    func = _G["GetColorWheelTexture"],
    funcPath = "GetColorWheelTexture",
    params = {  },
    returns = { { name = "texture", type = "SimpleTexture", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["GetColorWheelThumbTexture"] = {
    key = "GetColorWheelThumbTexture",
    name = "GetColorWheelThumbTexture",
    category = "general",
    subcategory = "global",
    func = _G["GetColorWheelThumbTexture"],
    funcPath = "GetColorWheelThumbTexture",
    params = {  },
    returns = { { name = "texture", type = "SimpleTexture", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["GetCombatRating"] = {
    key = "GetCombatRating",
    name = "GetCombatRating",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["GetCombatRating"],
    funcPath = "GetCombatRating",
    params = { { name = "ratingIndex", type = "luaIndex", default = nil } },
    returns = { { name = "result", type = "number", canBeSecret = false } },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["GetCombatRatingBonus"] = {
    key = "GetCombatRatingBonus",
    name = "GetCombatRatingBonus",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["GetCombatRatingBonus"],
    funcPath = "GetCombatRatingBonus",
    params = { { name = "ratingIndex", type = "luaIndex", default = nil } },
    returns = { { name = "result", type = "number", canBeSecret = false } },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["GetCombatRatingBonusForCombatRatingValue"] = {
    key = "GetCombatRatingBonusForCombatRatingValue",
    name = "GetCombatRatingBonusForCombatRatingValue",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["GetCombatRatingBonusForCombatRatingValue"],
    funcPath = "GetCombatRatingBonusForCombatRatingValue",
    params = { { name = "ratingIndex", type = "luaIndex", default = nil }, { name = "value", type = "number", default = nil } },
    returns = { { name = "result", type = "number", canBeSecret = false } },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["GetComboPoints"] = {
    key = "GetComboPoints",
    name = "GetComboPoints",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["GetComboPoints"],
    funcPath = "GetComboPoints",
    params = { { name = "unit", type = "UnitToken", default = "player" }, { name = "target", type = "UnitToken", default = "player" } },
    returns = { { name = "result", type = "number", canBeSecret = false } },
    midnightImpact = "CONDITIONAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted, SecretWhenUnitComboPointsRestricted",
}

APIDefs["GetControlPoints"] = {
    key = "GetControlPoints",
    name = "GetControlPoints",
    category = "general",
    subcategory = "global",
    func = _G["GetControlPoints"],
    funcPath = "GetControlPoints",
    params = {  },
    returns = { { name = "points", type = "SimpleControlPoint", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["GetCorpseRecoveryDelay"] = {
    key = "GetCorpseRecoveryDelay",
    name = "GetCorpseRecoveryDelay",
    category = "general",
    subcategory = "global",
    func = _G["GetCorpseRecoveryDelay"],
    funcPath = "GetCorpseRecoveryDelay",
    params = {  },
    returns = { { name = "result", type = "number", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["GetCorruption"] = {
    key = "GetCorruption",
    name = "GetCorruption",
    category = "general",
    subcategory = "global",
    func = _G["GetCorruption"],
    funcPath = "GetCorruption",
    params = {  },
    returns = { { name = "result", type = "number", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["GetCorruptionResistance"] = {
    key = "GetCorruptionResistance",
    name = "GetCorruptionResistance",
    category = "general",
    subcategory = "global",
    func = _G["GetCorruptionResistance"],
    funcPath = "GetCorruptionResistance",
    params = {  },
    returns = { { name = "result", type = "number", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["GetCritChance"] = {
    key = "GetCritChance",
    name = "GetCritChance",
    category = "general",
    subcategory = "global",
    func = _G["GetCritChance"],
    funcPath = "GetCritChance",
    params = {  },
    returns = { { name = "result", type = "number", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["GetCritChanceProvidesParryEffect"] = {
    key = "GetCritChanceProvidesParryEffect",
    name = "GetCritChanceProvidesParryEffect",
    category = "general",
    subcategory = "global",
    func = _G["GetCritChanceProvidesParryEffect"],
    funcPath = "GetCritChanceProvidesParryEffect",
    params = {  },
    returns = { { name = "result", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["GetCurrentEventID"] = {
    key = "GetCurrentEventID",
    name = "GetCurrentEventID",
    category = "general",
    subcategory = "global",
    func = _G["GetCurrentEventID"],
    funcPath = "GetCurrentEventID",
    params = {  },
    returns = { { name = "eventID", type = "number", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["GetCurrentRegion"] = {
    key = "GetCurrentRegion",
    name = "GetCurrentRegion",
    category = "general",
    subcategory = "global",
    func = _G["GetCurrentRegion"],
    funcPath = "GetCurrentRegion",
    params = {  },
    returns = { { name = "region", type = "number", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["GetCurrentRegionName"] = {
    key = "GetCurrentRegionName",
    name = "GetCurrentRegionName",
    category = "general",
    subcategory = "global",
    func = _G["GetCurrentRegionName"],
    funcPath = "GetCurrentRegionName",
    params = {  },
    returns = { { name = "regionName", type = "cstring", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["GetCurrentTitle"] = {
    key = "GetCurrentTitle",
    name = "GetCurrentTitle",
    category = "general",
    subcategory = "global",
    func = _G["GetCurrentTitle"],
    funcPath = "GetCurrentTitle",
    params = {  },
    returns = { { name = "result", type = "number", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["GetCursorDelta"] = {
    key = "GetCursorDelta",
    name = "GetCursorDelta",
    category = "general",
    subcategory = "global",
    func = _G["GetCursorDelta"],
    funcPath = "GetCursorDelta",
    params = {  },
    returns = { { name = "deltaX", type = "number", canBeSecret = false }, { name = "deltaY", type = "number", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["GetCursorInfo"] = {
    key = "GetCursorInfo",
    name = "GetCursorInfo",
    category = "general",
    subcategory = "global",
    func = _G["GetCursorInfo"],
    funcPath = "GetCursorInfo",
    params = {  },
    returns = {  },
    midnightImpact = "NORMAL",
}

APIDefs["GetCursorMoney"] = {
    key = "GetCursorMoney",
    name = "GetCursorMoney",
    category = "general",
    subcategory = "global",
    func = _G["GetCursorMoney"],
    funcPath = "GetCursorMoney",
    params = {  },
    returns = { { name = "amount", type = "number", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["GetCursorPosition"] = {
    key = "GetCursorPosition",
    name = "GetCursorPosition",
    category = "general",
    subcategory = "global",
    func = _G["GetCursorPosition"],
    funcPath = "GetCursorPosition",
    params = {  },
    returns = { { name = "posX", type = "number", canBeSecret = false }, { name = "posY", type = "number", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["GetCurveType"] = {
    key = "GetCurveType",
    name = "GetCurveType",
    category = "general",
    subcategory = "global",
    func = _G["GetCurveType"],
    funcPath = "GetCurveType",
    params = {  },
    returns = { { name = "curveType", type = "CurveType", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["GetDamageAbsorbClampMode"] = {
    key = "GetDamageAbsorbClampMode",
    name = "GetDamageAbsorbClampMode",
    category = "general",
    subcategory = "global",
    func = _G["GetDamageAbsorbClampMode"],
    funcPath = "GetDamageAbsorbClampMode",
    params = {  },
    returns = { { name = "damageAbsorbClampMode", type = "UnitDamageAbsorbClampMode", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["GetDamageAbsorbs"] = {
    key = "GetDamageAbsorbs",
    name = "GetDamageAbsorbs",
    category = "general",
    subcategory = "global",
    func = _G["GetDamageAbsorbs"],
    funcPath = "GetDamageAbsorbs",
    params = {  },
    returns = { { name = "amount", type = "number", canBeSecret = false }, { name = "clamped", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["GetDefaultScale"] = {
    key = "GetDefaultScale",
    name = "GetDefaultScale",
    category = "general",
    subcategory = "global",
    func = _G["GetDefaultScale"],
    funcPath = "GetDefaultScale",
    params = {  },
    returns = { { name = "scale", type = "number", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["GetDegrees"] = {
    key = "GetDegrees",
    name = "GetDegrees",
    category = "general",
    subcategory = "global",
    func = _G["GetDegrees"],
    funcPath = "GetDegrees",
    params = {  },
    returns = { { name = "angle", type = "number", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["GetDesaturation"] = {
    key = "GetDesaturation",
    name = "GetDesaturation",
    category = "general",
    subcategory = "global",
    func = _G["GetDesaturation"],
    funcPath = "GetDesaturation",
    params = {  },
    returns = { { name = "strength", type = "number", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["GetDifficultyInfo"] = {
    key = "GetDifficultyInfo",
    name = "GetDifficultyInfo",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["GetDifficultyInfo"],
    funcPath = "GetDifficultyInfo",
    params = { { name = "difficultyID", type = "number", default = nil } },
    returns = { { name = "name", type = "cstring", canBeSecret = false }, { name = "instanceType", type = "cstring", canBeSecret = false }, { name = "isHeroic", type = "bool", canBeSecret = false }, { name = "isChallengeMode", type = "bool", canBeSecret = false }, { name = "displayHeroic", type = "bool", canBeSecret = false }, { name = "displayMythic", type = "bool", canBeSecret = false }, { name = "toggleDifficultyID", type = "number", canBeSecret = false }, { name = "isLFR", type = "bool", canBeSecret = false }, { name = "minPlayers", type = "number", canBeSecret = false }, { name = "maxPlayers", type = "number", canBeSecret = false }, { name = "isUserSelectable", type = "bool", canBeSecret = false } },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["GetDisabledCheckedTexture"] = {
    key = "GetDisabledCheckedTexture",
    name = "GetDisabledCheckedTexture",
    category = "general",
    subcategory = "global",
    func = _G["GetDisabledCheckedTexture"],
    funcPath = "GetDisabledCheckedTexture",
    params = {  },
    returns = { { name = "texture", type = "SimpleTexture", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["GetDisplayInfo"] = {
    key = "GetDisplayInfo",
    name = "GetDisplayInfo",
    category = "general",
    subcategory = "global",
    func = _G["GetDisplayInfo"],
    funcPath = "GetDisplayInfo",
    params = {  },
    returns = { { name = "displayID", type = "number", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["GetDoBlend"] = {
    key = "GetDoBlend",
    name = "GetDoBlend",
    category = "general",
    subcategory = "global",
    func = _G["GetDoBlend"],
    funcPath = "GetDoBlend",
    params = {  },
    returns = { { name = "doBlend", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["GetDodgeChance"] = {
    key = "GetDodgeChance",
    name = "GetDodgeChance",
    category = "general",
    subcategory = "global",
    func = _G["GetDodgeChance"],
    funcPath = "GetDodgeChance",
    params = {  },
    returns = { { name = "result", type = "number", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["GetDodgeChanceFromAttribute"] = {
    key = "GetDodgeChanceFromAttribute",
    name = "GetDodgeChanceFromAttribute",
    category = "general",
    subcategory = "global",
    func = _G["GetDodgeChanceFromAttribute"],
    funcPath = "GetDodgeChanceFromAttribute",
    params = {  },
    returns = { { name = "result", type = "number", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["GetDoorConnectionInfo"] = {
    key = "GetDoorConnectionInfo",
    name = "GetDoorConnectionInfo",
    category = "general",
    subcategory = "global",
    func = _G["GetDoorConnectionInfo"],
    funcPath = "GetDoorConnectionInfo",
    params = {  },
    returns = { { name = "connectionInfo", type = "DoorConnectionInfo", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["GetDownloadedPercentage"] = {
    key = "GetDownloadedPercentage",
    name = "GetDownloadedPercentage",
    category = "general",
    subcategory = "global",
    func = _G["GetDownloadedPercentage"],
    funcPath = "GetDownloadedPercentage",
    params = {  },
    returns = { { name = "result", type = "number", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["GetDrawLayer"] = {
    key = "GetDrawLayer",
    name = "GetDrawLayer",
    category = "general",
    subcategory = "global",
    func = _G["GetDrawLayer"],
    funcPath = "GetDrawLayer",
    params = {  },
    returns = { { name = "layer", type = "DrawLayer", canBeSecret = false }, { name = "sublevel", type = "number", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["GetDungeonDifficultyID"] = {
    key = "GetDungeonDifficultyID",
    name = "GetDungeonDifficultyID",
    category = "general",
    subcategory = "global",
    func = _G["GetDungeonDifficultyID"],
    funcPath = "GetDungeonDifficultyID",
    params = {  },
    returns = { { name = "result", type = "number", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["GetDuration"] = {
    key = "GetDuration",
    name = "GetDuration",
    category = "general",
    subcategory = "global",
    func = _G["GetDuration"],
    funcPath = "GetDuration",
    params = {  },
    returns = { { name = "durationSec", type = "number", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["GetEditorModeContext"] = {
    key = "GetEditorModeContext",
    name = "GetEditorModeContext",
    category = "general",
    subcategory = "global",
    func = _G["GetEditorModeContext"],
    funcPath = "GetEditorModeContext",
    params = {  },
    returns = { { name = "editorModeContext", type = "HouseEditorMode", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["GetElapsed"] = {
    key = "GetElapsed",
    name = "GetElapsed",
    category = "general",
    subcategory = "global",
    func = _G["GetElapsed"],
    funcPath = "GetElapsed",
    params = {  },
    returns = { { name = "elapsedSec", type = "number", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["GetElapsedDuration"] = {
    key = "GetElapsedDuration",
    name = "GetElapsedDuration",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["GetElapsedDuration"],
    funcPath = "GetElapsedDuration",
    params = { { name = "modifier", type = "DurationTimeModifier", default = "RealTime" } },
    returns = { { name = "elapsedDuration", type = "DurationSeconds", canBeSecret = false } },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["GetElapsedPercent"] = {
    key = "GetElapsedPercent",
    name = "GetElapsedPercent",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["GetElapsedPercent"],
    funcPath = "GetElapsedPercent",
    params = { { name = "modifier", type = "DurationTimeModifier", default = "RealTime" } },
    returns = { { name = "elapsedPercent", type = "number", canBeSecret = false } },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["GetEndColor"] = {
    key = "GetEndColor",
    name = "GetEndColor",
    category = "general",
    subcategory = "global",
    func = _G["GetEndColor"],
    funcPath = "GetEndColor",
    params = {  },
    returns = { { name = "color", type = "colorRGBA", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["GetEndDelay"] = {
    key = "GetEndDelay",
    name = "GetEndDelay",
    category = "general",
    subcategory = "global",
    func = _G["GetEndDelay"],
    funcPath = "GetEndDelay",
    params = {  },
    returns = { { name = "delaySec", type = "number", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["GetEndPoint"] = {
    key = "GetEndPoint",
    name = "GetEndPoint",
    category = "general",
    subcategory = "global",
    func = _G["GetEndPoint"],
    funcPath = "GetEndPoint",
    params = {  },
    returns = { { name = "relativePoint", type = "FramePoint", canBeSecret = false }, { name = "relativeTo", type = "ScriptRegion", canBeSecret = false }, { name = "offsetX", type = "uiUnit", canBeSecret = false }, { name = "offsetY", type = "uiUnit", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["GetEndTime"] = {
    key = "GetEndTime",
    name = "GetEndTime",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["GetEndTime"],
    funcPath = "GetEndTime",
    params = { { name = "modifier", type = "DurationTimeModifier", default = "RealTime" } },
    returns = { { name = "endTime", type = "FrameTime", canBeSecret = false } },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["GetErrorCallstackHeight"] = {
    key = "GetErrorCallstackHeight",
    name = "GetErrorCallstackHeight",
    category = "general",
    subcategory = "global",
    func = _G["GetErrorCallstackHeight"],
    funcPath = "GetErrorCallstackHeight",
    params = {  },
    returns = { { name = "height", type = "number", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["GetEventTime"] = {
    key = "GetEventTime",
    name = "GetEventTime",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["GetEventTime"],
    funcPath = "GetEventTime",
    params = { { name = "eventProfileIndex", type = "number", default = nil } },
    returns = { { name = "totalElapsedTime", type = "number", canBeSecret = false }, { name = "numExecutedHandlers", type = "number", canBeSecret = false }, { name = "slowestHandlerName", type = "cstring", canBeSecret = false }, { name = "slowestHandlerTime", type = "number", canBeSecret = false } },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["GetExpansionDisplayInfo"] = {
    key = "GetExpansionDisplayInfo",
    name = "GetExpansionDisplayInfo",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["GetExpansionDisplayInfo"],
    funcPath = "GetExpansionDisplayInfo",
    params = { { name = "expansionLevel", type = "number", default = nil }, { name = "desiredReleaseType", type = "ReleaseType", default = nil } },
    returns = { { name = "info", type = "ExpansionDisplayInfo", canBeSecret = false } },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["GetExpansionForLevel"] = {
    key = "GetExpansionForLevel",
    name = "GetExpansionForLevel",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["GetExpansionForLevel"],
    funcPath = "GetExpansionForLevel",
    params = { { name = "playerLevel", type = "number", default = nil } },
    returns = { { name = "expansionLevel", type = "number", canBeSecret = false } },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["GetExpansionLevel"] = {
    key = "GetExpansionLevel",
    name = "GetExpansionLevel",
    category = "general",
    subcategory = "global",
    func = _G["GetExpansionLevel"],
    funcPath = "GetExpansionLevel",
    params = {  },
    returns = { { name = "expansionLevel", type = "number", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["GetExpansionTrialInfo"] = {
    key = "GetExpansionTrialInfo",
    name = "GetExpansionTrialInfo",
    category = "general",
    subcategory = "global",
    func = _G["GetExpansionTrialInfo"],
    funcPath = "GetExpansionTrialInfo",
    params = {  },
    returns = { { name = "isExpansionTrialAccount", type = "bool", canBeSecret = false }, { name = "expansionTrialRemainingSeconds", type = "time_t", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["GetExpertise"] = {
    key = "GetExpertise",
    name = "GetExpertise",
    category = "general",
    subcategory = "global",
    func = _G["GetExpertise"],
    funcPath = "GetExpertise",
    params = {  },
    returns = { { name = "mainhandExpertise", type = "number", canBeSecret = false }, { name = "offhandExpertise", type = "number", canBeSecret = false }, { name = "rangedExpertise", type = "number", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["GetExpertisePercent"] = {
    key = "GetExpertisePercent",
    name = "GetExpertisePercent",
    category = "general",
    subcategory = "global",
    func = _G["GetExpertisePercent"],
    funcPath = "GetExpertisePercent",
    params = {  },
    returns = { { name = "mainhandExpertisePercent", type = "number", canBeSecret = false }, { name = "offhandExpertisePercent", type = "number", canBeSecret = false }, { name = "rangedExpertisePercent", type = "number", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["GetFacing"] = {
    key = "GetFacing",
    name = "GetFacing",
    category = "general",
    subcategory = "global",
    func = _G["GetFacing"],
    funcPath = "GetFacing",
    params = {  },
    returns = { { name = "facing", type = "number", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["GetFadeDuration"] = {
    key = "GetFadeDuration",
    name = "GetFadeDuration",
    category = "general",
    subcategory = "global",
    func = _G["GetFadeDuration"],
    funcPath = "GetFadeDuration",
    params = {  },
    returns = { { name = "fadeDurationSeconds", type = "number", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["GetFadePower"] = {
    key = "GetFadePower",
    name = "GetFadePower",
    category = "general",
    subcategory = "global",
    func = _G["GetFadePower"],
    funcPath = "GetFadePower",
    params = {  },
    returns = { { name = "fadePower", type = "number", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["GetFading"] = {
    key = "GetFading",
    name = "GetFading",
    category = "general",
    subcategory = "global",
    func = _G["GetFading"],
    funcPath = "GetFading",
    params = {  },
    returns = { { name = "isFading", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["GetFileIDFromPath"] = {
    key = "GetFileIDFromPath",
    name = "GetFileIDFromPath",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["GetFileIDFromPath"],
    funcPath = "GetFileIDFromPath",
    params = { { name = "filePath", type = "cstring", default = nil } },
    returns = { { name = "fileID", type = "fileID", canBeSecret = false } },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["GetFileStreamingStatus"] = {
    key = "GetFileStreamingStatus",
    name = "GetFileStreamingStatus",
    category = "general",
    subcategory = "global",
    func = _G["GetFileStreamingStatus"],
    funcPath = "GetFileStreamingStatus",
    params = {  },
    returns = { { name = "result", type = "number", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["GetFilterTagStatus"] = {
    key = "GetFilterTagStatus",
    name = "GetFilterTagStatus",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["GetFilterTagStatus"],
    funcPath = "GetFilterTagStatus",
    params = { { name = "groupID", type = "number", default = nil }, { name = "tagID", type = "number", default = nil } },
    returns = { { name = "active", type = "bool", canBeSecret = false } },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["GetFilteredCategoryID"] = {
    key = "GetFilteredCategoryID",
    name = "GetFilteredCategoryID",
    category = "general",
    subcategory = "global",
    func = _G["GetFilteredCategoryID"],
    funcPath = "GetFilteredCategoryID",
    params = {  },
    returns = { { name = "categoryID", type = "number", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["GetFilteredSubcategoryID"] = {
    key = "GetFilteredSubcategoryID",
    name = "GetFilteredSubcategoryID",
    category = "general",
    subcategory = "global",
    func = _G["GetFilteredSubcategoryID"],
    funcPath = "GetFilteredSubcategoryID",
    params = {  },
    returns = { { name = "subcategoryID", type = "number", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["GetFlipBookColumns"] = {
    key = "GetFlipBookColumns",
    name = "GetFlipBookColumns",
    category = "general",
    subcategory = "global",
    func = _G["GetFlipBookColumns"],
    funcPath = "GetFlipBookColumns",
    params = {  },
    returns = { { name = "columns", type = "number", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["GetFlipBookFrameHeight"] = {
    key = "GetFlipBookFrameHeight",
    name = "GetFlipBookFrameHeight",
    category = "general",
    subcategory = "global",
    func = _G["GetFlipBookFrameHeight"],
    funcPath = "GetFlipBookFrameHeight",
    params = {  },
    returns = { { name = "height", type = "number", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["GetFlipBookFrameWidth"] = {
    key = "GetFlipBookFrameWidth",
    name = "GetFlipBookFrameWidth",
    category = "general",
    subcategory = "global",
    func = _G["GetFlipBookFrameWidth"],
    funcPath = "GetFlipBookFrameWidth",
    params = {  },
    returns = { { name = "width", type = "number", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["GetFlipBookFrames"] = {
    key = "GetFlipBookFrames",
    name = "GetFlipBookFrames",
    category = "general",
    subcategory = "global",
    func = _G["GetFlipBookFrames"],
    funcPath = "GetFlipBookFrames",
    params = {  },
    returns = { { name = "frames", type = "number", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["GetFlipBookRows"] = {
    key = "GetFlipBookRows",
    name = "GetFlipBookRows",
    category = "general",
    subcategory = "global",
    func = _G["GetFlipBookRows"],
    funcPath = "GetFlipBookRows",
    params = {  },
    returns = { { name = "rows", type = "number", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["GetFogColor"] = {
    key = "GetFogColor",
    name = "GetFogColor",
    category = "general",
    subcategory = "global",
    func = _G["GetFogColor"],
    funcPath = "GetFogColor",
    params = {  },
    returns = { { name = "colorR", type = "number", canBeSecret = false }, { name = "colorG", type = "number", canBeSecret = false }, { name = "colorB", type = "number", canBeSecret = false }, { name = "colorA", type = "number", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["GetFogFar"] = {
    key = "GetFogFar",
    name = "GetFogFar",
    category = "general",
    subcategory = "global",
    func = _G["GetFogFar"],
    funcPath = "GetFogFar",
    params = {  },
    returns = { { name = "fogFar", type = "number", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["GetFogNear"] = {
    key = "GetFogNear",
    name = "GetFogNear",
    category = "general",
    subcategory = "global",
    func = _G["GetFogNear"],
    funcPath = "GetFogNear",
    params = {  },
    returns = { { name = "fogNear", type = "number", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["GetFogOfWarBackgroundAtlas"] = {
    key = "GetFogOfWarBackgroundAtlas",
    name = "GetFogOfWarBackgroundAtlas",
    category = "general",
    subcategory = "global",
    func = _G["GetFogOfWarBackgroundAtlas"],
    funcPath = "GetFogOfWarBackgroundAtlas",
    params = {  },
    returns = { { name = "atlas", type = "textureAtlas", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["GetFogOfWarBackgroundTexture"] = {
    key = "GetFogOfWarBackgroundTexture",
    name = "GetFogOfWarBackgroundTexture",
    category = "general",
    subcategory = "global",
    func = _G["GetFogOfWarBackgroundTexture"],
    funcPath = "GetFogOfWarBackgroundTexture",
    params = {  },
    returns = { { name = "asset", type = "FileAsset", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["GetFogOfWarMaskAtlas"] = {
    key = "GetFogOfWarMaskAtlas",
    name = "GetFogOfWarMaskAtlas",
    category = "general",
    subcategory = "global",
    func = _G["GetFogOfWarMaskAtlas"],
    funcPath = "GetFogOfWarMaskAtlas",
    params = {  },
    returns = { { name = "atlas", type = "textureAtlas", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["GetFogOfWarMaskTexture"] = {
    key = "GetFogOfWarMaskTexture",
    name = "GetFogOfWarMaskTexture",
    category = "general",
    subcategory = "global",
    func = _G["GetFogOfWarMaskTexture"],
    funcPath = "GetFogOfWarMaskTexture",
    params = {  },
    returns = { { name = "asset", type = "FileAsset", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["GetFont"] = {
    key = "GetFont",
    name = "GetFont",
    category = "general",
    subcategory = "global",
    func = _G["GetFont"],
    funcPath = "GetFont",
    params = {  },
    returns = { { name = "fontFile", type = "cstring", canBeSecret = false }, { name = "height", type = "uiFontHeight", canBeSecret = false }, { name = "flags", type = "TBFFlags", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["GetFontHeight"] = {
    key = "GetFontHeight",
    name = "GetFontHeight",
    category = "general",
    subcategory = "global",
    func = _G["GetFontHeight"],
    funcPath = "GetFontHeight",
    params = {  },
    returns = { { name = "height", type = "number", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["GetFontInfo"] = {
    key = "GetFontInfo",
    name = "GetFontInfo",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["GetFontInfo"],
    funcPath = "GetFontInfo",
    params = { { name = "fontObject", type = "SimpleFont", default = nil } },
    returns = { { name = "info", type = "FontScriptInfo", canBeSecret = false } },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["GetFontObject"] = {
    key = "GetFontObject",
    name = "GetFontObject",
    category = "general",
    subcategory = "global",
    func = _G["GetFontObject"],
    funcPath = "GetFontObject",
    params = {  },
    returns = { { name = "font", type = "SimpleFont", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["GetFontObjectForAlphabet"] = {
    key = "GetFontObjectForAlphabet",
    name = "GetFontObjectForAlphabet",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["GetFontObjectForAlphabet"],
    funcPath = "GetFontObjectForAlphabet",
    params = { { name = "alphabet", type = "FontAlphabet", default = nil } },
    returns = { { name = "font", type = "SimpleFont", canBeSecret = false } },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["GetFontStringByID"] = {
    key = "GetFontStringByID",
    name = "GetFontStringByID",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["GetFontStringByID"],
    funcPath = "GetFontStringByID",
    params = { { name = "messageID", type = "number", default = nil } },
    returns = { { name = "fontString", type = "SimpleFontString", canBeSecret = false } },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["GetFonts"] = {
    key = "GetFonts",
    name = "GetFonts",
    category = "general",
    subcategory = "global",
    func = _G["GetFonts"],
    funcPath = "GetFonts",
    params = {  },
    returns = { { name = "fontNames", type = "table", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["GetFrameCPUUsage"] = {
    key = "GetFrameCPUUsage",
    name = "GetFrameCPUUsage",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["GetFrameCPUUsage"],
    funcPath = "GetFrameCPUUsage",
    params = { { name = "frame", type = "SimpleFrame", default = nil }, { name = "includeChildren", type = "bool", default = false } },
    returns = { { name = "call_time", type = "number", canBeSecret = false }, { name = "call_count", type = "number", canBeSecret = false } },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["GetFramerate"] = {
    key = "GetFramerate",
    name = "GetFramerate",
    category = "general",
    subcategory = "global",
    func = _G["GetFramerate"],
    funcPath = "GetFramerate",
    params = {  },
    returns = { { name = "framerate", type = "number", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["GetFromAlpha"] = {
    key = "GetFromAlpha",
    name = "GetFromAlpha",
    category = "general",
    subcategory = "global",
    func = _G["GetFromAlpha"],
    funcPath = "GetFromAlpha",
    params = {  },
    returns = { { name = "normalizedAlpha", type = "number", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["GetGameMessageInfo"] = {
    key = "GetGameMessageInfo",
    name = "GetGameMessageInfo",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["GetGameMessageInfo"],
    funcPath = "GetGameMessageInfo",
    params = { { name = "gameErrorIndex", type = "luaIndex", default = nil } },
    returns = { { name = "errorName", type = "cstring", canBeSecret = false }, { name = "soundKitID", type = "number", canBeSecret = false }, { name = "voiceID", type = "number", canBeSecret = false } },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["GetGameTime"] = {
    key = "GetGameTime",
    name = "GetGameTime",
    category = "general",
    subcategory = "global",
    func = _G["GetGameTime"],
    funcPath = "GetGameTime",
    params = {  },
    returns = { { name = "hour", type = "number", canBeSecret = false }, { name = "minute", type = "number", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["GetHaste"] = {
    key = "GetHaste",
    name = "GetHaste",
    category = "general",
    subcategory = "global",
    func = _G["GetHaste"],
    funcPath = "GetHaste",
    params = {  },
    returns = { { name = "result", type = "number", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["GetHealAbsorbClampMode"] = {
    key = "GetHealAbsorbClampMode",
    name = "GetHealAbsorbClampMode",
    category = "general",
    subcategory = "global",
    func = _G["GetHealAbsorbClampMode"],
    funcPath = "GetHealAbsorbClampMode",
    params = {  },
    returns = { { name = "healAbsorbClampMode", type = "UnitHealAbsorbClampMode", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["GetHealAbsorbMode"] = {
    key = "GetHealAbsorbMode",
    name = "GetHealAbsorbMode",
    category = "general",
    subcategory = "global",
    func = _G["GetHealAbsorbMode"],
    funcPath = "GetHealAbsorbMode",
    params = {  },
    returns = { { name = "healAbsorbMode", type = "UnitHealAbsorbMode", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["GetHealAbsorbs"] = {
    key = "GetHealAbsorbs",
    name = "GetHealAbsorbs",
    category = "general",
    subcategory = "global",
    func = _G["GetHealAbsorbs"],
    funcPath = "GetHealAbsorbs",
    params = {  },
    returns = { { name = "amount", type = "number", canBeSecret = false }, { name = "clamped", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["GetHitModifier"] = {
    key = "GetHitModifier",
    name = "GetHitModifier",
    category = "general",
    subcategory = "global",
    func = _G["GetHitModifier"],
    funcPath = "GetHitModifier",
    params = {  },
    returns = { { name = "result", type = "number", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["GetHitRectThickness"] = {
    key = "GetHitRectThickness",
    name = "GetHitRectThickness",
    category = "general",
    subcategory = "global",
    func = _G["GetHitRectThickness"],
    funcPath = "GetHitRectThickness",
    params = {  },
    returns = { { name = "thickness", type = "uiUnit", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["GetIncomingHealClampMode"] = {
    key = "GetIncomingHealClampMode",
    name = "GetIncomingHealClampMode",
    category = "general",
    subcategory = "global",
    func = _G["GetIncomingHealClampMode"],
    funcPath = "GetIncomingHealClampMode",
    params = {  },
    returns = { { name = "incomingHealClampMode", type = "UnitIncomingHealClampMode", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["GetIncomingHealOverflowPercent"] = {
    key = "GetIncomingHealOverflowPercent",
    name = "GetIncomingHealOverflowPercent",
    category = "general",
    subcategory = "global",
    func = _G["GetIncomingHealOverflowPercent"],
    funcPath = "GetIncomingHealOverflowPercent",
    params = {  },
    returns = { { name = "incomingHealOverflowPercent", type = "number", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["GetIncomingHeals"] = {
    key = "GetIncomingHeals",
    name = "GetIncomingHeals",
    category = "general",
    subcategory = "global",
    func = _G["GetIncomingHeals"],
    funcPath = "GetIncomingHeals",
    params = {  },
    returns = { { name = "amount", type = "number", canBeSecret = false }, { name = "amountFromHealer", type = "number", canBeSecret = false }, { name = "amountFromOthers", type = "number", canBeSecret = false }, { name = "clamped", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["GetIndentedWordWrap"] = {
    key = "GetIndentedWordWrap",
    name = "GetIndentedWordWrap",
    category = "general",
    subcategory = "global",
    func = _G["GetIndentedWordWrap"],
    funcPath = "GetIndentedWordWrap",
    params = {  },
    returns = { { name = "wordWrap", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["GetInsertMode"] = {
    key = "GetInsertMode",
    name = "GetInsertMode",
    category = "general",
    subcategory = "global",
    func = _G["GetInsertMode"],
    funcPath = "GetInsertMode",
    params = {  },
    returns = { { name = "mode", type = "InsertMode", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["GetInstanceBootTimeRemaining"] = {
    key = "GetInstanceBootTimeRemaining",
    name = "GetInstanceBootTimeRemaining",
    category = "general",
    subcategory = "global",
    func = _G["GetInstanceBootTimeRemaining"],
    funcPath = "GetInstanceBootTimeRemaining",
    params = {  },
    returns = { { name = "result", type = "number", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["GetInstanceInfo"] = {
    key = "GetInstanceInfo",
    name = "GetInstanceInfo",
    category = "general",
    subcategory = "global",
    func = _G["GetInstanceInfo"],
    funcPath = "GetInstanceInfo",
    params = {  },
    returns = { { name = "name", type = "cstring", canBeSecret = false }, { name = "instanceType", type = "cstring", canBeSecret = false }, { name = "difficultyID", type = "number", canBeSecret = false }, { name = "difficultyName", type = "cstring", canBeSecret = false }, { name = "maxPlayers", type = "number", canBeSecret = false }, { name = "dynamicDifficulty", type = "number", canBeSecret = false }, { name = "isDynamic", type = "bool", canBeSecret = false }, { name = "instanceID", type = "number", canBeSecret = false }, { name = "instanceGroupSize", type = "number", canBeSecret = false }, { name = "lfgDungeonID", type = "number", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["GetInstanceLockTimeRemaining"] = {
    key = "GetInstanceLockTimeRemaining",
    name = "GetInstanceLockTimeRemaining",
    category = "general",
    subcategory = "global",
    func = _G["GetInstanceLockTimeRemaining"],
    funcPath = "GetInstanceLockTimeRemaining",
    params = {  },
    returns = { { name = "timeLeft", type = "number", canBeSecret = false }, { name = "extending", type = "bool", canBeSecret = false }, { name = "encountersTotal", type = "number", canBeSecret = false }, { name = "encountersCompleted", type = "number", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["GetInstanceLockTimeRemainingEncounter"] = {
    key = "GetInstanceLockTimeRemainingEncounter",
    name = "GetInstanceLockTimeRemainingEncounter",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["GetInstanceLockTimeRemainingEncounter"],
    funcPath = "GetInstanceLockTimeRemainingEncounter",
    params = { { name = "encounterIndex", type = "luaIndex", default = nil } },
    returns = { { name = "encounterName", type = "cstring", canBeSecret = false }, { name = "texture", type = "cstring", canBeSecret = false }, { name = "isKilled", type = "bool", canBeSecret = false }, { name = "ineligible", type = "bool", canBeSecret = false } },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["GetItemTransmogInfo"] = {
    key = "GetItemTransmogInfo",
    name = "GetItemTransmogInfo",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["GetItemTransmogInfo"],
    funcPath = "GetItemTransmogInfo",
    params = { { name = "inventorySlots", type = "number", default = nil } },
    returns = { { name = "itemTransmogInfo", type = "ItemTransmogInfo", canBeSecret = false } },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["GetItemTransmogInfoList"] = {
    key = "GetItemTransmogInfoList",
    name = "GetItemTransmogInfoList",
    category = "general",
    subcategory = "global",
    func = _G["GetItemTransmogInfoList"],
    funcPath = "GetItemTransmogInfoList",
    params = {  },
    returns = { { name = "infoList", type = "table", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["GetJailersTowerLevel"] = {
    key = "GetJailersTowerLevel",
    name = "GetJailersTowerLevel",
    category = "general",
    subcategory = "global",
    func = _G["GetJailersTowerLevel"],
    funcPath = "GetJailersTowerLevel",
    params = {  },
    returns = { { name = "result", type = "number", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["GetJustifyH"] = {
    key = "GetJustifyH",
    name = "GetJustifyH",
    category = "general",
    subcategory = "global",
    func = _G["GetJustifyH"],
    funcPath = "GetJustifyH",
    params = {  },
    returns = { { name = "justifyH", type = "JustifyHorizontal", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["GetJustifyV"] = {
    key = "GetJustifyV",
    name = "GetJustifyV",
    category = "general",
    subcategory = "global",
    func = _G["GetJustifyV"],
    funcPath = "GetJustifyV",
    params = {  },
    returns = { { name = "justifyV", type = "JustifyVertical", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["GetKeepModelOnHide"] = {
    key = "GetKeepModelOnHide",
    name = "GetKeepModelOnHide",
    category = "general",
    subcategory = "global",
    func = _G["GetKeepModelOnHide"],
    funcPath = "GetKeepModelOnHide",
    params = {  },
    returns = { { name = "keepModelOnHide", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["GetLegacyRaidDifficultyID"] = {
    key = "GetLegacyRaidDifficultyID",
    name = "GetLegacyRaidDifficultyID",
    category = "general",
    subcategory = "global",
    func = _G["GetLegacyRaidDifficultyID"],
    funcPath = "GetLegacyRaidDifficultyID",
    params = {  },
    returns = { { name = "result", type = "number", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["GetLifesteal"] = {
    key = "GetLifesteal",
    name = "GetLifesteal",
    category = "general",
    subcategory = "global",
    func = _G["GetLifesteal"],
    funcPath = "GetLifesteal",
    params = {  },
    returns = { { name = "result", type = "number", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["GetLight"] = {
    key = "GetLight",
    name = "GetLight",
    category = "general",
    subcategory = "global",
    func = _G["GetLight"],
    funcPath = "GetLight",
    params = {  },
    returns = { { name = "enabled", type = "bool", canBeSecret = false }, { name = "light", type = "ModelLight", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["GetLightAmbientColor"] = {
    key = "GetLightAmbientColor",
    name = "GetLightAmbientColor",
    category = "general",
    subcategory = "global",
    func = _G["GetLightAmbientColor"],
    funcPath = "GetLightAmbientColor",
    params = {  },
    returns = { { name = "colorR", type = "number", canBeSecret = false }, { name = "colorG", type = "number", canBeSecret = false }, { name = "colorB", type = "number", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["GetLightDiffuseColor"] = {
    key = "GetLightDiffuseColor",
    name = "GetLightDiffuseColor",
    category = "general",
    subcategory = "global",
    func = _G["GetLightDiffuseColor"],
    funcPath = "GetLightDiffuseColor",
    params = {  },
    returns = { { name = "colorR", type = "number", canBeSecret = false }, { name = "colorG", type = "number", canBeSecret = false }, { name = "colorB", type = "number", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["GetLightDirection"] = {
    key = "GetLightDirection",
    name = "GetLightDirection",
    category = "general",
    subcategory = "global",
    func = _G["GetLightDirection"],
    funcPath = "GetLightDirection",
    params = {  },
    returns = { { name = "directionX", type = "number", canBeSecret = false }, { name = "directionY", type = "number", canBeSecret = false }, { name = "directionZ", type = "number", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["GetLightPosition"] = {
    key = "GetLightPosition",
    name = "GetLightPosition",
    category = "general",
    subcategory = "global",
    func = _G["GetLightPosition"],
    funcPath = "GetLightPosition",
    params = {  },
    returns = { { name = "positionX", type = "number", canBeSecret = false }, { name = "positionY", type = "number", canBeSecret = false }, { name = "positionZ", type = "number", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["GetLightType"] = {
    key = "GetLightType",
    name = "GetLightType",
    category = "general",
    subcategory = "global",
    func = _G["GetLightType"],
    funcPath = "GetLightType",
    params = {  },
    returns = { { name = "lightType", type = "ModelLightType", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["GetLocalGameTime"] = {
    key = "GetLocalGameTime",
    name = "GetLocalGameTime",
    category = "general",
    subcategory = "global",
    func = _G["GetLocalGameTime"],
    funcPath = "GetLocalGameTime",
    params = {  },
    returns = { { name = "hour", type = "number", canBeSecret = false }, { name = "minute", type = "number", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["GetLocale"] = {
    key = "GetLocale",
    name = "GetLocale",
    category = "general",
    subcategory = "global",
    func = _G["GetLocale"],
    funcPath = "GetLocale",
    params = {  },
    returns = { { name = "localeName", type = "cstring", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["GetLoopState"] = {
    key = "GetLoopState",
    name = "GetLoopState",
    category = "general",
    subcategory = "global",
    func = _G["GetLoopState"],
    funcPath = "GetLoopState",
    params = {  },
    returns = { { name = "loopState", type = "cstring", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["GetLooping"] = {
    key = "GetLooping",
    name = "GetLooping",
    category = "general",
    subcategory = "global",
    func = _G["GetLooping"],
    funcPath = "GetLooping",
    params = {  },
    returns = { { name = "loopType", type = "LoopType", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["GetLootSpecialization"] = {
    key = "GetLootSpecialization",
    name = "GetLootSpecialization",
    category = "general",
    subcategory = "global",
    func = _G["GetLootSpecialization"],
    funcPath = "GetLootSpecialization",
    params = {  },
    returns = { { name = "specializationID", type = "number", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["GetLowerBackgroundFileName"] = {
    key = "GetLowerBackgroundFileName",
    name = "GetLowerBackgroundFileName",
    category = "general",
    subcategory = "global",
    func = _G["GetLowerBackgroundFileName"],
    funcPath = "GetLowerBackgroundFileName",
    params = {  },
    returns = { { name = "file", type = "fileID", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["GetLowerBorderFile"] = {
    key = "GetLowerBorderFile",
    name = "GetLowerBorderFile",
    category = "general",
    subcategory = "global",
    func = _G["GetLowerBorderFile"],
    funcPath = "GetLowerBorderFile",
    params = {  },
    returns = { { name = "file", type = "fileID", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["GetLowerEmblemFile"] = {
    key = "GetLowerEmblemFile",
    name = "GetLowerEmblemFile",
    category = "general",
    subcategory = "global",
    func = _G["GetLowerEmblemFile"],
    funcPath = "GetLowerEmblemFile",
    params = {  },
    returns = { { name = "file", type = "fileID", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["GetLowerEmblemTexture"] = {
    key = "GetLowerEmblemTexture",
    name = "GetLowerEmblemTexture",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["GetLowerEmblemTexture"],
    funcPath = "GetLowerEmblemTexture",
    params = { { name = "texture", type = "SimpleTexture", default = nil } },
    returns = {  },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["GetManaRegen"] = {
    key = "GetManaRegen",
    name = "GetManaRegen",
    category = "general",
    subcategory = "global",
    func = _G["GetManaRegen"],
    funcPath = "GetManaRegen",
    params = {  },
    returns = { { name = "baseManaRegen", type = "number", canBeSecret = false }, { name = "castingManaRegen", type = "number", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["GetMapID"] = {
    key = "GetMapID",
    name = "GetMapID",
    category = "general",
    subcategory = "global",
    func = _G["GetMapID"],
    funcPath = "GetMapID",
    params = {  },
    returns = { { name = "uiMapID", type = "number", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["GetMaskScalar"] = {
    key = "GetMaskScalar",
    name = "GetMaskScalar",
    category = "general",
    subcategory = "global",
    func = _G["GetMaskScalar"],
    funcPath = "GetMaskScalar",
    params = {  },
    returns = { { name = "scalar", type = "number", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["GetMaskTexture"] = {
    key = "GetMaskTexture",
    name = "GetMaskTexture",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["GetMaskTexture"],
    funcPath = "GetMaskTexture",
    params = { { name = "index", type = "luaIndex", default = nil } },
    returns = { { name = "mask", type = "SimpleMaskTexture", canBeSecret = false } },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["GetMastery"] = {
    key = "GetMastery",
    name = "GetMastery",
    category = "general",
    subcategory = "global",
    func = _G["GetMastery"],
    funcPath = "GetMastery",
    params = {  },
    returns = { { name = "result", type = "number", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["GetMasteryEffect"] = {
    key = "GetMasteryEffect",
    name = "GetMasteryEffect",
    category = "general",
    subcategory = "global",
    func = _G["GetMasteryEffect"],
    funcPath = "GetMasteryEffect",
    params = {  },
    returns = { { name = "masteryEffect", type = "number", canBeSecret = false }, { name = "bonusCoefficient", type = "number", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["GetMaxBoundingBox"] = {
    key = "GetMaxBoundingBox",
    name = "GetMaxBoundingBox",
    category = "general",
    subcategory = "global",
    func = _G["GetMaxBoundingBox"],
    funcPath = "GetMaxBoundingBox",
    params = {  },
    returns = { { name = "boxBottom", type = "vector3", canBeSecret = false }, { name = "boxTop", type = "vector3", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["GetMaxCharacterSlotCount"] = {
    key = "GetMaxCharacterSlotCount",
    name = "GetMaxCharacterSlotCount",
    category = "general",
    subcategory = "global",
    func = _G["GetMaxCharacterSlotCount"],
    funcPath = "GetMaxCharacterSlotCount",
    params = {  },
    returns = { { name = "maxCharacterSlotCount", type = "number", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["GetMaxCombatRatingBonus"] = {
    key = "GetMaxCombatRatingBonus",
    name = "GetMaxCombatRatingBonus",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["GetMaxCombatRatingBonus"],
    funcPath = "GetMaxCombatRatingBonus",
    params = { { name = "ratingIndex", type = "luaIndex", default = nil } },
    returns = { { name = "result", type = "number", canBeSecret = false } },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["GetMaxControlPointOrder"] = {
    key = "GetMaxControlPointOrder",
    name = "GetMaxControlPointOrder",
    category = "general",
    subcategory = "global",
    func = _G["GetMaxControlPointOrder"],
    funcPath = "GetMaxControlPointOrder",
    params = {  },
    returns = { { name = "maxOrder", type = "number", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["GetMaxLevelForExpansionLevel"] = {
    key = "GetMaxLevelForExpansionLevel",
    name = "GetMaxLevelForExpansionLevel",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["GetMaxLevelForExpansionLevel"],
    funcPath = "GetMaxLevelForExpansionLevel",
    params = { { name = "expansionLevel", type = "number", default = nil } },
    returns = { { name = "maxLevel", type = "number", canBeSecret = false } },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["GetMaxLevelForLatestExpansion"] = {
    key = "GetMaxLevelForLatestExpansion",
    name = "GetMaxLevelForLatestExpansion",
    category = "general",
    subcategory = "global",
    func = _G["GetMaxLevelForLatestExpansion"],
    funcPath = "GetMaxLevelForLatestExpansion",
    params = {  },
    returns = { { name = "maxLevel", type = "number", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["GetMaxLevelForPlayerExpansion"] = {
    key = "GetMaxLevelForPlayerExpansion",
    name = "GetMaxLevelForPlayerExpansion",
    category = "general",
    subcategory = "global",
    func = _G["GetMaxLevelForPlayerExpansion"],
    funcPath = "GetMaxLevelForPlayerExpansion",
    params = {  },
    returns = { { name = "maxLevel", type = "number", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["GetMaxPlayerLevel"] = {
    key = "GetMaxPlayerLevel",
    name = "GetMaxPlayerLevel",
    category = "general",
    subcategory = "global",
    func = _G["GetMaxPlayerLevel"],
    funcPath = "GetMaxPlayerLevel",
    params = {  },
    returns = { { name = "maxPlayerLevel", type = "number", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["GetMaxSnapshots"] = {
    key = "GetMaxSnapshots",
    name = "GetMaxSnapshots",
    category = "general",
    subcategory = "global",
    func = _G["GetMaxSnapshots"],
    funcPath = "GetMaxSnapshots",
    params = {  },
    returns = { { name = "maxSnapshots", type = "number", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["GetMaximumExpansionLevel"] = {
    key = "GetMaximumExpansionLevel",
    name = "GetMaximumExpansionLevel",
    category = "general",
    subcategory = "global",
    func = _G["GetMaximumExpansionLevel"],
    funcPath = "GetMaximumExpansionLevel",
    params = {  },
    returns = { { name = "expansionLevel", type = "number", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["GetMeleeHaste"] = {
    key = "GetMeleeHaste",
    name = "GetMeleeHaste",
    category = "general",
    subcategory = "global",
    func = _G["GetMeleeHaste"],
    funcPath = "GetMeleeHaste",
    params = {  },
    returns = { { name = "result", type = "number", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["GetMinMaxValues"] = {
    key = "GetMinMaxValues",
    name = "GetMinMaxValues",
    category = "general",
    subcategory = "global",
    func = _G["GetMinMaxValues"],
    funcPath = "GetMinMaxValues",
    params = {  },
    returns = { { name = "minValue", type = "number", canBeSecret = false }, { name = "maxValue", type = "number", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["GetMinimapZoneText"] = {
    key = "GetMinimapZoneText",
    name = "GetMinimapZoneText",
    category = "general",
    subcategory = "global",
    func = _G["GetMinimapZoneText"],
    funcPath = "GetMinimapZoneText",
    params = {  },
    returns = { { name = "text", type = "cstring", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["GetMinimumExpansionLevel"] = {
    key = "GetMinimumExpansionLevel",
    name = "GetMinimumExpansionLevel",
    category = "general",
    subcategory = "global",
    func = _G["GetMinimumExpansionLevel"],
    funcPath = "GetMinimumExpansionLevel",
    params = {  },
    returns = { { name = "expansionLevel", type = "number", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["GetMirrorTimerInfo"] = {
    key = "GetMirrorTimerInfo",
    name = "GetMirrorTimerInfo",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["GetMirrorTimerInfo"],
    funcPath = "GetMirrorTimerInfo",
    params = { { name = "timerIndex", type = "luaIndex", default = nil } },
    returns = { { name = "name", type = "cstring", canBeSecret = false }, { name = "startValue", type = "number", canBeSecret = false }, { name = "maxValue", type = "number", canBeSecret = false }, { name = "scale", type = "number", canBeSecret = false }, { name = "paused", type = "number", canBeSecret = false }, { name = "label", type = "cstring", canBeSecret = false }, { name = "spellID", type = "number", canBeSecret = false } },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["GetMirrorTimerProgress"] = {
    key = "GetMirrorTimerProgress",
    name = "GetMirrorTimerProgress",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["GetMirrorTimerProgress"],
    funcPath = "GetMirrorTimerProgress",
    params = { { name = "timerName", type = "cstring", default = nil } },
    returns = { { name = "progress", type = "number", canBeSecret = false } },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["GetModRate"] = {
    key = "GetModRate",
    name = "GetModRate",
    category = "general",
    subcategory = "global",
    func = _G["GetModRate"],
    funcPath = "GetModRate",
    params = {  },
    returns = { { name = "modRate", type = "number", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["GetModResilienceDamageReduction"] = {
    key = "GetModResilienceDamageReduction",
    name = "GetModResilienceDamageReduction",
    category = "general",
    subcategory = "global",
    func = _G["GetModResilienceDamageReduction"],
    funcPath = "GetModResilienceDamageReduction",
    params = {  },
    returns = { { name = "result", type = "number", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["GetModelAlpha"] = {
    key = "GetModelAlpha",
    name = "GetModelAlpha",
    category = "general",
    subcategory = "global",
    func = _G["GetModelAlpha"],
    funcPath = "GetModelAlpha",
    params = {  },
    returns = { { name = "alpha", type = "number", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["GetModelDrawLayer"] = {
    key = "GetModelDrawLayer",
    name = "GetModelDrawLayer",
    category = "general",
    subcategory = "global",
    func = _G["GetModelDrawLayer"],
    funcPath = "GetModelDrawLayer",
    params = {  },
    returns = { { name = "layer", type = "DrawLayer", canBeSecret = false }, { name = "sublayer", type = "number", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["GetModelFileID"] = {
    key = "GetModelFileID",
    name = "GetModelFileID",
    category = "general",
    subcategory = "global",
    func = _G["GetModelFileID"],
    funcPath = "GetModelFileID",
    params = {  },
    returns = { { name = "modelFileID", type = "fileID", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["GetModelPath"] = {
    key = "GetModelPath",
    name = "GetModelPath",
    category = "general",
    subcategory = "global",
    func = _G["GetModelPath"],
    funcPath = "GetModelPath",
    params = {  },
    returns = { { name = "path", type = "string", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["GetModelScale"] = {
    key = "GetModelScale",
    name = "GetModelScale",
    category = "general",
    subcategory = "global",
    func = _G["GetModelScale"],
    funcPath = "GetModelScale",
    params = {  },
    returns = { { name = "scale", type = "number", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["GetModelUnitGUID"] = {
    key = "GetModelUnitGUID",
    name = "GetModelUnitGUID",
    category = "general",
    subcategory = "global",
    func = _G["GetModelUnitGUID"],
    funcPath = "GetModelUnitGUID",
    params = {  },
    returns = { { name = "guid", type = "WOWGUID", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["GetMoney"] = {
    key = "GetMoney",
    name = "GetMoney",
    category = "general",
    subcategory = "global",
    func = _G["GetMoney"],
    funcPath = "GetMoney",
    params = {  },
    returns = { { name = "result", type = "number", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["GetMouseButtonClicked"] = {
    key = "GetMouseButtonClicked",
    name = "GetMouseButtonClicked",
    category = "general",
    subcategory = "global",
    func = _G["GetMouseButtonClicked"],
    funcPath = "GetMouseButtonClicked",
    params = {  },
    returns = { { name = "buttonName", type = "cstring", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["GetMouseButtonName"] = {
    key = "GetMouseButtonName",
    name = "GetMouseButtonName",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["GetMouseButtonName"],
    funcPath = "GetMouseButtonName",
    params = { { name = "button", type = "mouseButton", default = nil } },
    returns = { { name = "buttonName", type = "cstring", canBeSecret = false } },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["GetMouseFoci"] = {
    key = "GetMouseFoci",
    name = "GetMouseFoci",
    category = "general",
    subcategory = "global",
    func = _G["GetMouseFoci"],
    funcPath = "GetMouseFoci",
    params = {  },
    returns = { { name = "region", type = "table", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["GetMouseOverUnits"] = {
    key = "GetMouseOverUnits",
    name = "GetMouseOverUnits",
    category = "general",
    subcategory = "global",
    func = _G["GetMouseOverUnits"],
    funcPath = "GetMouseOverUnits",
    params = {  },
    returns = { { name = "units", type = "string", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["GetMovieDownloadProgress"] = {
    key = "GetMovieDownloadProgress",
    name = "GetMovieDownloadProgress",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["GetMovieDownloadProgress"],
    funcPath = "GetMovieDownloadProgress",
    params = { { name = "movieId", type = "number", default = nil } },
    returns = { { name = "inProgress", type = "bool", canBeSecret = false }, { name = "downloaded", type = "BigUInteger", canBeSecret = false }, { name = "total", type = "BigUInteger", canBeSecret = false } },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["GetNativeRealmID"] = {
    key = "GetNativeRealmID",
    name = "GetNativeRealmID",
    category = "general",
    subcategory = "global",
    func = _G["GetNativeRealmID"],
    funcPath = "GetNativeRealmID",
    params = {  },
    returns = { { name = "nativeRealmID", type = "number", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["GetNegativeCorruptionEffectInfo"] = {
    key = "GetNegativeCorruptionEffectInfo",
    name = "GetNegativeCorruptionEffectInfo",
    category = "general",
    subcategory = "global",
    func = _G["GetNegativeCorruptionEffectInfo"],
    funcPath = "GetNegativeCorruptionEffectInfo",
    params = {  },
    returns = { { name = "corruptionEffects", type = "table", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["GetNetIpTypes"] = {
    key = "GetNetIpTypes",
    name = "GetNetIpTypes",
    category = "general",
    subcategory = "global",
    func = _G["GetNetIpTypes"],
    funcPath = "GetNetIpTypes",
    params = {  },
    returns = { { name = "ipTypes", type = "ConnectionIptype", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["GetNetStats"] = {
    key = "GetNetStats",
    name = "GetNetStats",
    category = "general",
    subcategory = "global",
    func = _G["GetNetStats"],
    funcPath = "GetNetStats",
    params = {  },
    returns = { { name = "in", type = "number", canBeSecret = false }, { name = "out", type = "number", canBeSecret = false }, { name = "latencyList", type = "number", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["GetNormalizedRealmName"] = {
    key = "GetNormalizedRealmName",
    name = "GetNormalizedRealmName",
    category = "general",
    subcategory = "global",
    func = _G["GetNormalizedRealmName"],
    funcPath = "GetNormalizedRealmName",
    params = {  },
    returns = { { name = "result", type = "cstring", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["GetNumActors"] = {
    key = "GetNumActors",
    name = "GetNumActors",
    category = "general",
    subcategory = "global",
    func = _G["GetNumActors"],
    funcPath = "GetNumActors",
    params = {  },
    returns = { { name = "numActors", type = "number", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["GetNumDeclensionSets"] = {
    key = "GetNumDeclensionSets",
    name = "GetNumDeclensionSets",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["GetNumDeclensionSets"],
    funcPath = "GetNumDeclensionSets",
    params = { { name = "name", type = "cstring", default = nil }, { name = "gender", type = "UnitSex", default = nil } },
    returns = { { name = "numDeclensionSets", type = "number", canBeSecret = false } },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["GetNumExpansions"] = {
    key = "GetNumExpansions",
    name = "GetNumExpansions",
    category = "general",
    subcategory = "global",
    func = _G["GetNumExpansions"],
    funcPath = "GetNumExpansions",
    params = {  },
    returns = { { name = "numExpansions", type = "number", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["GetNumMaskTextures"] = {
    key = "GetNumMaskTextures",
    name = "GetNumMaskTextures",
    category = "general",
    subcategory = "global",
    func = _G["GetNumMaskTextures"],
    funcPath = "GetNumMaskTextures",
    params = {  },
    returns = { { name = "count", type = "size", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["GetNumPoints"] = {
    key = "GetNumPoints",
    name = "GetNumPoints",
    category = "general",
    subcategory = "global",
    func = _G["GetNumPoints"],
    funcPath = "GetNumPoints",
    params = {  },
    returns = { { name = "numPoints", type = "number", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["GetNumSearchItems"] = {
    key = "GetNumSearchItems",
    name = "GetNumSearchItems",
    category = "general",
    subcategory = "global",
    func = _G["GetNumSearchItems"],
    funcPath = "GetNumSearchItems",
    params = {  },
    returns = { { name = "numSearchItems", type = "number", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["GetNumTitles"] = {
    key = "GetNumTitles",
    name = "GetNumTitles",
    category = "general",
    subcategory = "global",
    func = _G["GetNumTitles"],
    funcPath = "GetNumTitles",
    params = {  },
    returns = { { name = "result", type = "number", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["GetNumTooltips"] = {
    key = "GetNumTooltips",
    name = "GetNumTooltips",
    category = "general",
    subcategory = "global",
    func = _G["GetNumTooltips"],
    funcPath = "GetNumTooltips",
    params = {  },
    returns = { { name = "numObjectives", type = "number", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["GetOSLocale"] = {
    key = "GetOSLocale",
    name = "GetOSLocale",
    category = "general",
    subcategory = "global",
    func = _G["GetOSLocale"],
    funcPath = "GetOSLocale",
    params = {  },
    returns = { { name = "localeName", type = "cstring", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["GetObeyHideInTransmogFlag"] = {
    key = "GetObeyHideInTransmogFlag",
    name = "GetObeyHideInTransmogFlag",
    category = "general",
    subcategory = "global",
    func = _G["GetObeyHideInTransmogFlag"],
    funcPath = "GetObeyHideInTransmogFlag",
    params = {  },
    returns = { { name = "obey", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["GetObeyStepOnDrag"] = {
    key = "GetObeyStepOnDrag",
    name = "GetObeyStepOnDrag",
    category = "general",
    subcategory = "global",
    func = _G["GetObeyStepOnDrag"],
    funcPath = "GetObeyStepOnDrag",
    params = {  },
    returns = { { name = "isObeyStepOnDrag", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["GetOffset"] = {
    key = "GetOffset",
    name = "GetOffset",
    category = "general",
    subcategory = "global",
    func = _G["GetOffset"],
    funcPath = "GetOffset",
    params = {  },
    returns = { { name = "offsetX", type = "uiUnit", canBeSecret = false }, { name = "offsetY", type = "uiUnit", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["GetOrder"] = {
    key = "GetOrder",
    name = "GetOrder",
    category = "general",
    subcategory = "global",
    func = _G["GetOrder"],
    funcPath = "GetOrder",
    params = {  },
    returns = { { name = "order", type = "number", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["GetOrientation"] = {
    key = "GetOrientation",
    name = "GetOrientation",
    category = "general",
    subcategory = "global",
    func = _G["GetOrientation"],
    funcPath = "GetOrientation",
    params = {  },
    returns = { { name = "orientation", type = "Orientation", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["GetOrigin"] = {
    key = "GetOrigin",
    name = "GetOrigin",
    category = "general",
    subcategory = "global",
    func = _G["GetOrigin"],
    funcPath = "GetOrigin",
    params = {  },
    returns = { { name = "point", type = "FramePoint", canBeSecret = false }, { name = "originX", type = "number", canBeSecret = false }, { name = "originY", type = "number", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["GetOverrideAPBySpellPower"] = {
    key = "GetOverrideAPBySpellPower",
    name = "GetOverrideAPBySpellPower",
    category = "general",
    subcategory = "global",
    func = _G["GetOverrideAPBySpellPower"],
    funcPath = "GetOverrideAPBySpellPower",
    params = {  },
    returns = { { name = "result", type = "number", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["GetOverrideSpellPowerByAP"] = {
    key = "GetOverrideSpellPowerByAP",
    name = "GetOverrideSpellPowerByAP",
    category = "general",
    subcategory = "global",
    func = _G["GetOverrideSpellPowerByAP"],
    funcPath = "GetOverrideSpellPowerByAP",
    params = {  },
    returns = { { name = "result", type = "number", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["GetPVPDesired"] = {
    key = "GetPVPDesired",
    name = "GetPVPDesired",
    category = "general",
    subcategory = "global",
    func = _G["GetPVPDesired"],
    funcPath = "GetPVPDesired",
    params = {  },
    returns = { { name = "result", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["GetPVPGearStatRules"] = {
    key = "GetPVPGearStatRules",
    name = "GetPVPGearStatRules",
    category = "general",
    subcategory = "global",
    func = _G["GetPVPGearStatRules"],
    funcPath = "GetPVPGearStatRules",
    params = {  },
    returns = { { name = "result", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["GetPVPLifetimeStats"] = {
    key = "GetPVPLifetimeStats",
    name = "GetPVPLifetimeStats",
    category = "general",
    subcategory = "global",
    func = _G["GetPVPLifetimeStats"],
    funcPath = "GetPVPLifetimeStats",
    params = {  },
    returns = { { name = "lifetimeHonorableKills", type = "number", canBeSecret = false }, { name = "lifetimeMaxPVPRank", type = "PvPRanks", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["GetPVPSessionStats"] = {
    key = "GetPVPSessionStats",
    name = "GetPVPSessionStats",
    category = "general",
    subcategory = "global",
    func = _G["GetPVPSessionStats"],
    funcPath = "GetPVPSessionStats",
    params = {  },
    returns = { { name = "honorableKills", type = "number", canBeSecret = false }, { name = "dishonorableKills", type = "number", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["GetPVPTimer"] = {
    key = "GetPVPTimer",
    name = "GetPVPTimer",
    category = "general",
    subcategory = "global",
    func = _G["GetPVPTimer"],
    funcPath = "GetPVPTimer",
    params = {  },
    returns = { { name = "result", type = "number", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["GetPVPYesterdayStats"] = {
    key = "GetPVPYesterdayStats",
    name = "GetPVPYesterdayStats",
    category = "general",
    subcategory = "global",
    func = _G["GetPVPYesterdayStats"],
    funcPath = "GetPVPYesterdayStats",
    params = {  },
    returns = { { name = "honorableKills", type = "number", canBeSecret = false }, { name = "dishonorableKills", type = "number", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["GetParryChance"] = {
    key = "GetParryChance",
    name = "GetParryChance",
    category = "general",
    subcategory = "global",
    func = _G["GetParryChance"],
    funcPath = "GetParryChance",
    params = {  },
    returns = { { name = "result", type = "number", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["GetParryChanceFromAttribute"] = {
    key = "GetParryChanceFromAttribute",
    name = "GetParryChanceFromAttribute",
    category = "general",
    subcategory = "global",
    func = _G["GetParryChanceFromAttribute"],
    funcPath = "GetParryChanceFromAttribute",
    params = {  },
    returns = { { name = "result", type = "number", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["GetParticleOverrideScale"] = {
    key = "GetParticleOverrideScale",
    name = "GetParticleOverrideScale",
    category = "general",
    subcategory = "global",
    func = _G["GetParticleOverrideScale"],
    funcPath = "GetParticleOverrideScale",
    params = {  },
    returns = { { name = "scale", type = "number", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["GetPaused"] = {
    key = "GetPaused",
    name = "GetPaused",
    category = "general",
    subcategory = "global",
    func = _G["GetPaused"],
    funcPath = "GetPaused",
    params = {  },
    returns = { { name = "paused", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["GetPetMeleeHaste"] = {
    key = "GetPetMeleeHaste",
    name = "GetPetMeleeHaste",
    category = "general",
    subcategory = "global",
    func = _G["GetPetMeleeHaste"],
    funcPath = "GetPetMeleeHaste",
    params = {  },
    returns = { { name = "result", type = "number", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["GetPetSpellBonusDamage"] = {
    key = "GetPetSpellBonusDamage",
    name = "GetPetSpellBonusDamage",
    category = "general",
    subcategory = "global",
    func = _G["GetPetSpellBonusDamage"],
    funcPath = "GetPetSpellBonusDamage",
    params = {  },
    returns = { { name = "result", type = "number", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["GetPhysicalScreenSize"] = {
    key = "GetPhysicalScreenSize",
    name = "GetPhysicalScreenSize",
    category = "general",
    subcategory = "global",
    func = _G["GetPhysicalScreenSize"],
    funcPath = "GetPhysicalScreenSize",
    params = {  },
    returns = { { name = "sizeX", type = "number", canBeSecret = false }, { name = "sizeY", type = "number", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["GetPinType"] = {
    key = "GetPinType",
    name = "GetPinType",
    category = "general",
    subcategory = "global",
    func = _G["GetPinType"],
    funcPath = "GetPinType",
    params = {  },
    returns = { { name = "type", type = "HousingLayoutPinType", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["GetPingPosition"] = {
    key = "GetPingPosition",
    name = "GetPingPosition",
    category = "general",
    subcategory = "global",
    func = _G["GetPingPosition"],
    funcPath = "GetPingPosition",
    params = {  },
    returns = { { name = "positionX", type = "number", canBeSecret = false }, { name = "positionY", type = "number", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["GetPitch"] = {
    key = "GetPitch",
    name = "GetPitch",
    category = "general",
    subcategory = "global",
    func = _G["GetPitch"],
    funcPath = "GetPitch",
    params = {  },
    returns = { { name = "pitch", type = "number", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["GetPlayerFacing"] = {
    key = "GetPlayerFacing",
    name = "GetPlayerFacing",
    category = "general",
    subcategory = "global",
    func = _G["GetPlayerFacing"],
    funcPath = "GetPlayerFacing",
    params = {  },
    returns = { { name = "result", type = "number", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["GetPlayerInfoByGUID"] = {
    key = "GetPlayerInfoByGUID",
    name = "GetPlayerInfoByGUID",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["GetPlayerInfoByGUID"],
    funcPath = "GetPlayerInfoByGUID",
    params = { { name = "guid", type = "WOWGUID", default = nil } },
    returns = { { name = "localizedClass", type = "cstring", canBeSecret = false }, { name = "englishClass", type = "cstring", canBeSecret = false }, { name = "localizedRace", type = "cstring", canBeSecret = false }, { name = "englishRace", type = "cstring", canBeSecret = false }, { name = "sex", type = "number", canBeSecret = false }, { name = "name", type = "cstring", canBeSecret = false }, { name = "realmName", type = "cstring", canBeSecret = false } },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenTainted",
}

APIDefs["GetPlayerPingScale"] = {
    key = "GetPlayerPingScale",
    name = "GetPlayerPingScale",
    category = "general",
    subcategory = "global",
    func = _G["GetPlayerPingScale"],
    funcPath = "GetPlayerPingScale",
    params = {  },
    returns = { { name = "scale", type = "number", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["GetPoint"] = {
    key = "GetPoint",
    name = "GetPoint",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["GetPoint"],
    funcPath = "GetPoint",
    params = { { name = "anchorIndex", type = "luaIndex", default = 0 }, { name = "resolveCollapsed", type = "bool", default = false } },
    returns = { { name = "point", type = "FramePoint", canBeSecret = false }, { name = "relativeTo", type = "ScriptRegion", canBeSecret = false }, { name = "relativePoint", type = "FramePoint", canBeSecret = false }, { name = "offsetX", type = "uiUnit", canBeSecret = false }, { name = "offsetY", type = "uiUnit", canBeSecret = false } },
    midnightImpact = "CONDITIONAL",
    midnightNote = "Secret behavior: SecretWhenAnchoringSecret, SecretArguments=AllowedWhenUntainted",
}

APIDefs["GetPointByName"] = {
    key = "GetPointByName",
    name = "GetPointByName",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["GetPointByName"],
    funcPath = "GetPointByName",
    params = { { name = "point", type = "FramePoint", default = nil }, { name = "resolveCollapsed", type = "bool", default = false } },
    returns = { { name = "point", type = "FramePoint", canBeSecret = false }, { name = "relativeTo", type = "ScriptRegion", canBeSecret = false }, { name = "relativePoint", type = "FramePoint", canBeSecret = false }, { name = "offsetX", type = "uiUnit", canBeSecret = false }, { name = "offsetY", type = "uiUnit", canBeSecret = false } },
    midnightImpact = "CONDITIONAL",
    midnightNote = "Secret behavior: SecretWhenAnchoringSecret, SecretArguments=AllowedWhenUntainted",
}

APIDefs["GetPointCount"] = {
    key = "GetPointCount",
    name = "GetPointCount",
    category = "general",
    subcategory = "global",
    func = _G["GetPointCount"],
    funcPath = "GetPointCount",
    params = {  },
    returns = { { name = "count", type = "size", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["GetPoints"] = {
    key = "GetPoints",
    name = "GetPoints",
    category = "general",
    subcategory = "global",
    func = _G["GetPoints"],
    funcPath = "GetPoints",
    params = {  },
    returns = { { name = "point", type = "table", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["GetPosition"] = {
    key = "GetPosition",
    name = "GetPosition",
    category = "general",
    subcategory = "global",
    func = _G["GetPosition"],
    funcPath = "GetPosition",
    params = {  },
    returns = { { name = "positionX", type = "number", canBeSecret = false }, { name = "positionY", type = "number", canBeSecret = false }, { name = "positionZ", type = "number", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["GetPowerRegen"] = {
    key = "GetPowerRegen",
    name = "GetPowerRegen",
    category = "general",
    subcategory = "global",
    func = _G["GetPowerRegen"],
    funcPath = "GetPowerRegen",
    params = {  },
    returns = { { name = "basePowerRegen", type = "number", canBeSecret = false }, { name = "castingPowerRegen", type = "number", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["GetPowerRegenForPowerType"] = {
    key = "GetPowerRegenForPowerType",
    name = "GetPowerRegenForPowerType",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["GetPowerRegenForPowerType"],
    funcPath = "GetPowerRegenForPowerType",
    params = { { name = "powerType", type = "number", default = nil } },
    returns = { { name = "basePowerRegen", type = "number", canBeSecret = false }, { name = "castingPowerRegen", type = "number", canBeSecret = false } },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["GetPredictedValues"] = {
    key = "GetPredictedValues",
    name = "GetPredictedValues",
    category = "general",
    subcategory = "global",
    func = _G["GetPredictedValues"],
    funcPath = "GetPredictedValues",
    params = {  },
    returns = { { name = "predictedValues", type = "UnitHealPredictionValues", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["GetProgress"] = {
    key = "GetProgress",
    name = "GetProgress",
    category = "general",
    subcategory = "global",
    func = _G["GetProgress"],
    funcPath = "GetProgress",
    params = {  },
    returns = { { name = "progress", type = "number", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["GetPvpPowerDamage"] = {
    key = "GetPvpPowerDamage",
    name = "GetPvpPowerDamage",
    category = "general",
    subcategory = "global",
    func = _G["GetPvpPowerDamage"],
    funcPath = "GetPvpPowerDamage",
    params = {  },
    returns = { { name = "result", type = "number", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["GetPvpPowerHealing"] = {
    key = "GetPvpPowerHealing",
    name = "GetPvpPowerHealing",
    category = "general",
    subcategory = "global",
    func = _G["GetPvpPowerHealing"],
    funcPath = "GetPvpPowerHealing",
    params = {  },
    returns = { { name = "result", type = "number", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["GetRadians"] = {
    key = "GetRadians",
    name = "GetRadians",
    category = "general",
    subcategory = "global",
    func = _G["GetRadians"],
    funcPath = "GetRadians",
    params = {  },
    returns = { { name = "angle", type = "number", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["GetRaidDifficultyID"] = {
    key = "GetRaidDifficultyID",
    name = "GetRaidDifficultyID",
    category = "general",
    subcategory = "global",
    func = _G["GetRaidDifficultyID"],
    funcPath = "GetRaidDifficultyID",
    params = {  },
    returns = { { name = "result", type = "number", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["GetRaidTargetIndex"] = {
    key = "GetRaidTargetIndex",
    name = "GetRaidTargetIndex",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["GetRaidTargetIndex"],
    funcPath = "GetRaidTargetIndex",
    params = { { name = "target", type = "UnitToken", default = "player" } },
    returns = { { name = "result", type = "luaIndex", canBeSecret = true } },
    midnightImpact = "HIGH",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted, SecretReturns",
}

APIDefs["GetRangedCritChance"] = {
    key = "GetRangedCritChance",
    name = "GetRangedCritChance",
    category = "general",
    subcategory = "global",
    func = _G["GetRangedCritChance"],
    funcPath = "GetRangedCritChance",
    params = {  },
    returns = { { name = "result", type = "number", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["GetRangedHaste"] = {
    key = "GetRangedHaste",
    name = "GetRangedHaste",
    category = "general",
    subcategory = "global",
    func = _G["GetRangedHaste"],
    funcPath = "GetRangedHaste",
    params = {  },
    returns = { { name = "result", type = "number", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["GetRealZoneText"] = {
    key = "GetRealZoneText",
    name = "GetRealZoneText",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["GetRealZoneText"],
    funcPath = "GetRealZoneText",
    params = { { name = "mapID", type = "number", default = nil } },
    returns = { { name = "text", type = "cstring", canBeSecret = false } },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["GetRealmID"] = {
    key = "GetRealmID",
    name = "GetRealmID",
    category = "general",
    subcategory = "global",
    func = _G["GetRealmID"],
    funcPath = "GetRealmID",
    params = {  },
    returns = { { name = "realmID", type = "number", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["GetRealmName"] = {
    key = "GetRealmName",
    name = "GetRealmName",
    category = "general",
    subcategory = "global",
    func = _G["GetRealmName"],
    funcPath = "GetRealmName",
    params = {  },
    returns = { { name = "realmName", type = "cstring", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["GetRegionParent"] = {
    key = "GetRegionParent",
    name = "GetRegionParent",
    category = "general",
    subcategory = "global",
    func = _G["GetRegionParent"],
    funcPath = "GetRegionParent",
    params = {  },
    returns = { { name = "region", type = "CScriptObject", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["GetReleaseTimeRemaining"] = {
    key = "GetReleaseTimeRemaining",
    name = "GetReleaseTimeRemaining",
    category = "general",
    subcategory = "global",
    func = _G["GetReleaseTimeRemaining"],
    funcPath = "GetReleaseTimeRemaining",
    params = {  },
    returns = { { name = "result", type = "number", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["GetRemainingDuration"] = {
    key = "GetRemainingDuration",
    name = "GetRemainingDuration",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["GetRemainingDuration"],
    funcPath = "GetRemainingDuration",
    params = { { name = "modifier", type = "DurationTimeModifier", default = "RealTime" } },
    returns = { { name = "remainingDuration", type = "DurationSeconds", canBeSecret = false } },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["GetRemainingPercent"] = {
    key = "GetRemainingPercent",
    name = "GetRemainingPercent",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["GetRemainingPercent"],
    funcPath = "GetRemainingPercent",
    params = { { name = "modifier", type = "DurationTimeModifier", default = "RealTime" } },
    returns = { { name = "remainingPercent", type = "number", canBeSecret = false } },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["GetResSicknessDuration"] = {
    key = "GetResSicknessDuration",
    name = "GetResSicknessDuration",
    category = "general",
    subcategory = "global",
    func = _G["GetResSicknessDuration"],
    funcPath = "GetResSicknessDuration",
    params = {  },
    returns = { { name = "result", type = "string", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["GetRestState"] = {
    key = "GetRestState",
    name = "GetRestState",
    category = "general",
    subcategory = "global",
    func = _G["GetRestState"],
    funcPath = "GetRestState",
    params = {  },
    returns = { { name = "exhaustionID", type = "number", canBeSecret = false }, { name = "name", type = "cstring", canBeSecret = false }, { name = "factor", type = "number", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["GetRestrictedAccountData"] = {
    key = "GetRestrictedAccountData",
    name = "GetRestrictedAccountData",
    category = "general",
    subcategory = "global",
    func = _G["GetRestrictedAccountData"],
    funcPath = "GetRestrictedAccountData",
    params = {  },
    returns = { { name = "maxLevel", type = "number", canBeSecret = false }, { name = "maxMoney", type = "WOWMONEY", canBeSecret = false }, { name = "professionCap", type = "number", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["GetRoll"] = {
    key = "GetRoll",
    name = "GetRoll",
    category = "general",
    subcategory = "global",
    func = _G["GetRoll"],
    funcPath = "GetRoll",
    params = {  },
    returns = { { name = "roll", type = "number", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["GetRoomGUID"] = {
    key = "GetRoomGUID",
    name = "GetRoomGUID",
    category = "general",
    subcategory = "global",
    func = _G["GetRoomGUID"],
    funcPath = "GetRoomGUID",
    params = {  },
    returns = { { name = "roomGUID", type = "WOWGUID", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["GetRoomName"] = {
    key = "GetRoomName",
    name = "GetRoomName",
    category = "general",
    subcategory = "global",
    func = _G["GetRoomName"],
    funcPath = "GetRoomName",
    params = {  },
    returns = { { name = "name", type = "cstring", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["GetRuneCooldown"] = {
    key = "GetRuneCooldown",
    name = "GetRuneCooldown",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["GetRuneCooldown"],
    funcPath = "GetRuneCooldown",
    params = { { name = "runeIndex", type = "luaIndex", default = nil } },
    returns = { { name = "startTime", type = "number", canBeSecret = false }, { name = "duration", type = "number", canBeSecret = false }, { name = "isRuneReady", type = "bool", canBeSecret = false } },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["GetRuneCount"] = {
    key = "GetRuneCount",
    name = "GetRuneCount",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["GetRuneCount"],
    funcPath = "GetRuneCount",
    params = { { name = "runeIndex", type = "luaIndex", default = nil } },
    returns = { { name = "result", type = "number", canBeSecret = false } },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["GetScale"] = {
    key = "GetScale",
    name = "GetScale",
    category = "general",
    subcategory = "global",
    func = _G["GetScale"],
    funcPath = "GetScale",
    params = {  },
    returns = { { name = "scaleX", type = "number", canBeSecret = false }, { name = "scaleY", type = "number", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["GetScaleFrom"] = {
    key = "GetScaleFrom",
    name = "GetScaleFrom",
    category = "general",
    subcategory = "global",
    func = _G["GetScaleFrom"],
    funcPath = "GetScaleFrom",
    params = {  },
    returns = { { name = "scaleX", type = "number", canBeSecret = false }, { name = "scaleY", type = "number", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["GetScaleTo"] = {
    key = "GetScaleTo",
    name = "GetScaleTo",
    category = "general",
    subcategory = "global",
    func = _G["GetScaleTo"],
    funcPath = "GetScaleTo",
    params = {  },
    returns = { { name = "scaleX", type = "number", canBeSecret = false }, { name = "scaleY", type = "number", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["GetScenarioTooltipText"] = {
    key = "GetScenarioTooltipText",
    name = "GetScenarioTooltipText",
    category = "general",
    subcategory = "global",
    func = _G["GetScenarioTooltipText"],
    funcPath = "GetScenarioTooltipText",
    params = {  },
    returns = { { name = "tooltipText", type = "cstring", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["GetScreenDPIScale"] = {
    key = "GetScreenDPIScale",
    name = "GetScreenDPIScale",
    category = "general",
    subcategory = "global",
    func = _G["GetScreenDPIScale"],
    funcPath = "GetScreenDPIScale",
    params = {  },
    returns = { { name = "scale", type = "number", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["GetScreenHeight"] = {
    key = "GetScreenHeight",
    name = "GetScreenHeight",
    category = "general",
    subcategory = "global",
    func = _G["GetScreenHeight"],
    funcPath = "GetScreenHeight",
    params = {  },
    returns = { { name = "height", type = "number", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["GetScreenWidth"] = {
    key = "GetScreenWidth",
    name = "GetScreenWidth",
    category = "general",
    subcategory = "global",
    func = _G["GetScreenWidth"],
    funcPath = "GetScreenWidth",
    params = {  },
    returns = { { name = "width", type = "number", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["GetScript"] = {
    key = "GetScript",
    name = "GetScript",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["GetScript"],
    funcPath = "GetScript",
    params = { { name = "scriptTypeName", type = "cstring", default = nil }, { name = "bindingType", type = "number", default = nil } },
    returns = { { name = "script", type = "luaFunction", canBeSecret = false } },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["GetSearchCount"] = {
    key = "GetSearchCount",
    name = "GetSearchCount",
    category = "general",
    subcategory = "global",
    func = _G["GetSearchCount"],
    funcPath = "GetSearchCount",
    params = {  },
    returns = { { name = "searchCount", type = "number", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["GetSearchText"] = {
    key = "GetSearchText",
    name = "GetSearchText",
    category = "general",
    subcategory = "global",
    func = _G["GetSearchText"],
    funcPath = "GetSearchText",
    params = {  },
    returns = { { name = "searchText", type = "string", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["GetSecondsUntilParentalControlsKick"] = {
    key = "GetSecondsUntilParentalControlsKick",
    name = "GetSecondsUntilParentalControlsKick",
    category = "general",
    subcategory = "global",
    func = _G["GetSecondsUntilParentalControlsKick"],
    funcPath = "GetSecondsUntilParentalControlsKick",
    params = {  },
    returns = { { name = "remaining", type = "number", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["GetServerExpansionLevel"] = {
    key = "GetServerExpansionLevel",
    name = "GetServerExpansionLevel",
    category = "general",
    subcategory = "global",
    func = _G["GetServerExpansionLevel"],
    funcPath = "GetServerExpansionLevel",
    params = {  },
    returns = { { name = "serverExpansionLevel", type = "number", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["GetServerTime"] = {
    key = "GetServerTime",
    name = "GetServerTime",
    category = "general",
    subcategory = "global",
    func = _G["GetServerTime"],
    funcPath = "GetServerTime",
    params = {  },
    returns = { { name = "time", type = "number", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["GetSessionTime"] = {
    key = "GetSessionTime",
    name = "GetSessionTime",
    category = "general",
    subcategory = "global",
    func = _G["GetSessionTime"],
    funcPath = "GetSessionTime",
    params = {  },
    returns = { { name = "time", type = "number", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["GetShadowColor"] = {
    key = "GetShadowColor",
    name = "GetShadowColor",
    category = "general",
    subcategory = "global",
    func = _G["GetShadowColor"],
    funcPath = "GetShadowColor",
    params = {  },
    returns = { { name = "colorR", type = "number", canBeSecret = false }, { name = "colorG", type = "number", canBeSecret = false }, { name = "colorB", type = "number", canBeSecret = false }, { name = "colorA", type = "number", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["GetShadowEffect"] = {
    key = "GetShadowEffect",
    name = "GetShadowEffect",
    category = "general",
    subcategory = "global",
    func = _G["GetShadowEffect"],
    funcPath = "GetShadowEffect",
    params = {  },
    returns = { { name = "strength", type = "number", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["GetShadowOffset"] = {
    key = "GetShadowOffset",
    name = "GetShadowOffset",
    category = "general",
    subcategory = "global",
    func = _G["GetShadowOffset"],
    funcPath = "GetShadowOffset",
    params = {  },
    returns = { { name = "offsetX", type = "number", canBeSecret = false }, { name = "offsetY", type = "number", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["GetSheathState"] = {
    key = "GetSheathState",
    name = "GetSheathState",
    category = "general",
    subcategory = "global",
    func = _G["GetSheathState"],
    funcPath = "GetSheathState",
    params = {  },
    returns = { { name = "result", type = "number", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["GetSheathed"] = {
    key = "GetSheathed",
    name = "GetSheathed",
    category = "general",
    subcategory = "global",
    func = _G["GetSheathed"],
    funcPath = "GetSheathed",
    params = {  },
    returns = { { name = "sheathed", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["GetShieldBlock"] = {
    key = "GetShieldBlock",
    name = "GetShieldBlock",
    category = "general",
    subcategory = "global",
    func = _G["GetShieldBlock"],
    funcPath = "GetShieldBlock",
    params = {  },
    returns = { { name = "result", type = "number", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["GetSmoothProgress"] = {
    key = "GetSmoothProgress",
    name = "GetSmoothProgress",
    category = "general",
    subcategory = "global",
    func = _G["GetSmoothProgress"],
    funcPath = "GetSmoothProgress",
    params = {  },
    returns = { { name = "progress", type = "number", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["GetSmoothing"] = {
    key = "GetSmoothing",
    name = "GetSmoothing",
    category = "general",
    subcategory = "global",
    func = _G["GetSmoothing"],
    funcPath = "GetSmoothing",
    params = {  },
    returns = { { name = "weights", type = "SmoothingType", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["GetSortType"] = {
    key = "GetSortType",
    name = "GetSortType",
    category = "general",
    subcategory = "global",
    func = _G["GetSortType"],
    funcPath = "GetSortType",
    params = {  },
    returns = { { name = "sortType", type = "HousingCatalogSortType", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["GetSourceLocation"] = {
    key = "GetSourceLocation",
    name = "GetSourceLocation",
    category = "general",
    subcategory = "global",
    func = _G["GetSourceLocation"],
    funcPath = "GetSourceLocation",
    params = {  },
    returns = { { name = "location", type = "string", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["GetSpacing"] = {
    key = "GetSpacing",
    name = "GetSpacing",
    category = "general",
    subcategory = "global",
    func = _G["GetSpacing"],
    funcPath = "GetSpacing",
    params = {  },
    returns = { { name = "spacing", type = "uiUnit", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["GetSpecializationInfoForClassID"] = {
    key = "GetSpecializationInfoForClassID",
    name = "GetSpecializationInfoForClassID",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["GetSpecializationInfoForClassID"],
    funcPath = "GetSpecializationInfoForClassID",
    params = { { name = "classID", type = "number", default = nil }, { name = "index", type = "luaIndex", default = nil }, { name = "gender", type = "UnitSex", default = nil } },
    returns = { { name = "id", type = "number", canBeSecret = false }, { name = "name", type = "cstring", canBeSecret = false }, { name = "description", type = "string", canBeSecret = false }, { name = "icon", type = "fileID", canBeSecret = false }, { name = "role", type = "cstring", canBeSecret = false }, { name = "recommended", type = "bool", canBeSecret = false }, { name = "allowedForBoost", type = "bool", canBeSecret = false }, { name = "masterySpell1", type = "number", canBeSecret = false }, { name = "masterySpell2", type = "number", canBeSecret = false } },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["GetSpecializationInfoForSpecID"] = {
    key = "GetSpecializationInfoForSpecID",
    name = "GetSpecializationInfoForSpecID",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["GetSpecializationInfoForSpecID"],
    funcPath = "GetSpecializationInfoForSpecID",
    params = { { name = "specID", type = "number", default = nil }, { name = "gender", type = "UnitSex", default = nil } },
    returns = { { name = "id", type = "number", canBeSecret = false }, { name = "name", type = "cstring", canBeSecret = false }, { name = "description", type = "string", canBeSecret = false }, { name = "icon", type = "fileID", canBeSecret = false }, { name = "role", type = "cstring", canBeSecret = false }, { name = "recommended", type = "bool", canBeSecret = false }, { name = "allowedForBoost", type = "bool", canBeSecret = false }, { name = "masterySpell1", type = "number", canBeSecret = false }, { name = "masterySpell2", type = "number", canBeSecret = false } },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["GetSpecializationNameForSpecID"] = {
    key = "GetSpecializationNameForSpecID",
    name = "GetSpecializationNameForSpecID",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["GetSpecializationNameForSpecID"],
    funcPath = "GetSpecializationNameForSpecID",
    params = { { name = "specID", type = "number", default = nil }, { name = "gender", type = "UnitSex", default = nil } },
    returns = { { name = "name", type = "cstring", canBeSecret = false } },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["GetSpeed"] = {
    key = "GetSpeed",
    name = "GetSpeed",
    category = "general",
    subcategory = "global",
    func = _G["GetSpeed"],
    funcPath = "GetSpeed",
    params = {  },
    returns = { { name = "result", type = "number", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["GetSpellBonusDamage"] = {
    key = "GetSpellBonusDamage",
    name = "GetSpellBonusDamage",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["GetSpellBonusDamage"],
    funcPath = "GetSpellBonusDamage",
    params = { { name = "school", type = "luaIndex", default = nil } },
    returns = { { name = "result", type = "number", canBeSecret = false } },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["GetSpellBonusHealing"] = {
    key = "GetSpellBonusHealing",
    name = "GetSpellBonusHealing",
    category = "general",
    subcategory = "global",
    func = _G["GetSpellBonusHealing"],
    funcPath = "GetSpellBonusHealing",
    params = {  },
    returns = { { name = "result", type = "number", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["GetSpellCritChance"] = {
    key = "GetSpellCritChance",
    name = "GetSpellCritChance",
    category = "general",
    subcategory = "global",
    func = _G["GetSpellCritChance"],
    funcPath = "GetSpellCritChance",
    params = {  },
    returns = { { name = "result", type = "number", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["GetSpellHitModifier"] = {
    key = "GetSpellHitModifier",
    name = "GetSpellHitModifier",
    category = "general",
    subcategory = "global",
    func = _G["GetSpellHitModifier"],
    funcPath = "GetSpellHitModifier",
    params = {  },
    returns = { { name = "result", type = "number", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["GetSpellPenetration"] = {
    key = "GetSpellPenetration",
    name = "GetSpellPenetration",
    category = "general",
    subcategory = "global",
    func = _G["GetSpellPenetration"],
    funcPath = "GetSpellPenetration",
    params = {  },
    returns = { { name = "result", type = "number", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["GetSpellVisualKit"] = {
    key = "GetSpellVisualKit",
    name = "GetSpellVisualKit",
    category = "general",
    subcategory = "global",
    func = _G["GetSpellVisualKit"],
    funcPath = "GetSpellVisualKit",
    params = {  },
    returns = { { name = "spellVisualKitID", type = "number", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["GetStartColor"] = {
    key = "GetStartColor",
    name = "GetStartColor",
    category = "general",
    subcategory = "global",
    func = _G["GetStartColor"],
    funcPath = "GetStartColor",
    params = {  },
    returns = { { name = "color", type = "colorRGBA", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["GetStartDelay"] = {
    key = "GetStartDelay",
    name = "GetStartDelay",
    category = "general",
    subcategory = "global",
    func = _G["GetStartDelay"],
    funcPath = "GetStartDelay",
    params = {  },
    returns = { { name = "delaySec", type = "number", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["GetStartPoint"] = {
    key = "GetStartPoint",
    name = "GetStartPoint",
    category = "general",
    subcategory = "global",
    func = _G["GetStartPoint"],
    funcPath = "GetStartPoint",
    params = {  },
    returns = { { name = "relativePoint", type = "FramePoint", canBeSecret = false }, { name = "relativeTo", type = "ScriptRegion", canBeSecret = false }, { name = "offsetX", type = "uiUnit", canBeSecret = false }, { name = "offsetY", type = "uiUnit", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["GetStartTime"] = {
    key = "GetStartTime",
    name = "GetStartTime",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["GetStartTime"],
    funcPath = "GetStartTime",
    params = { { name = "modifier", type = "DurationTimeModifier", default = "RealTime" } },
    returns = { { name = "startTime", type = "FrameTime", canBeSecret = false } },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["GetStepsPerPage"] = {
    key = "GetStepsPerPage",
    name = "GetStepsPerPage",
    category = "general",
    subcategory = "global",
    func = _G["GetStepsPerPage"],
    funcPath = "GetStepsPerPage",
    params = {  },
    returns = { { name = "stepsPerPage", type = "number", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["GetSturdiness"] = {
    key = "GetSturdiness",
    name = "GetSturdiness",
    category = "general",
    subcategory = "global",
    func = _G["GetSturdiness"],
    funcPath = "GetSturdiness",
    params = {  },
    returns = { { name = "result", type = "number", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["GetSubZoneText"] = {
    key = "GetSubZoneText",
    name = "GetSubZoneText",
    category = "general",
    subcategory = "global",
    func = _G["GetSubZoneText"],
    funcPath = "GetSubZoneText",
    params = {  },
    returns = { { name = "text", type = "cstring", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["GetTarget"] = {
    key = "GetTarget",
    name = "GetTarget",
    category = "general",
    subcategory = "global",
    func = _G["GetTarget"],
    funcPath = "GetTarget",
    params = {  },
    returns = { { name = "target", type = "CScriptObject", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["GetTaxiBenchmarkMode"] = {
    key = "GetTaxiBenchmarkMode",
    name = "GetTaxiBenchmarkMode",
    category = "general",
    subcategory = "global",
    func = _G["GetTaxiBenchmarkMode"],
    funcPath = "GetTaxiBenchmarkMode",
    params = {  },
    returns = { { name = "result", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["GetTextColor"] = {
    key = "GetTextColor",
    name = "GetTextColor",
    category = "general",
    subcategory = "global",
    func = _G["GetTextColor"],
    funcPath = "GetTextColor",
    params = {  },
    returns = { { name = "colorR", type = "number", canBeSecret = false }, { name = "colorG", type = "number", canBeSecret = false }, { name = "colorB", type = "number", canBeSecret = false }, { name = "colorA", type = "number", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["GetThickness"] = {
    key = "GetThickness",
    name = "GetThickness",
    category = "general",
    subcategory = "global",
    func = _G["GetThickness"],
    funcPath = "GetThickness",
    params = {  },
    returns = { { name = "thickness", type = "uiUnit", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["GetThreatStatusColor"] = {
    key = "GetThreatStatusColor",
    name = "GetThreatStatusColor",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["GetThreatStatusColor"],
    funcPath = "GetThreatStatusColor",
    params = { { name = "gameErrorIndex", type = "number", default = nil } },
    returns = { { name = "colorR", type = "number", canBeSecret = false }, { name = "colorG", type = "number", canBeSecret = false }, { name = "colorB", type = "number", canBeSecret = false } },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["GetThumbTexture"] = {
    key = "GetThumbTexture",
    name = "GetThumbTexture",
    category = "general",
    subcategory = "global",
    func = _G["GetThumbTexture"],
    funcPath = "GetThumbTexture",
    params = {  },
    returns = { { name = "texture", type = "SimpleTexture", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["GetTickTime"] = {
    key = "GetTickTime",
    name = "GetTickTime",
    category = "general",
    subcategory = "global",
    func = _G["GetTickTime"],
    funcPath = "GetTickTime",
    params = {  },
    returns = { { name = "time", type = "number", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["GetTime"] = {
    key = "GetTime",
    name = "GetTime",
    category = "general",
    subcategory = "global",
    func = _G["GetTime"],
    funcPath = "GetTime",
    params = {  },
    returns = { { name = "time", type = "number", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["GetTimePreciseSec"] = {
    key = "GetTimePreciseSec",
    name = "GetTimePreciseSec",
    category = "general",
    subcategory = "global",
    func = _G["GetTimePreciseSec"],
    funcPath = "GetTimePreciseSec",
    params = {  },
    returns = { { name = "time", type = "number", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["GetTimeVisible"] = {
    key = "GetTimeVisible",
    name = "GetTimeVisible",
    category = "general",
    subcategory = "global",
    func = _G["GetTimeVisible"],
    funcPath = "GetTimeVisible",
    params = {  },
    returns = { { name = "timeVisibleSeconds", type = "number", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["GetTitleName"] = {
    key = "GetTitleName",
    name = "GetTitleName",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["GetTitleName"],
    funcPath = "GetTitleName",
    params = { { name = "titleMaskID", type = "number", default = nil } },
    returns = { { name = "titleString", type = "string", canBeSecret = false }, { name = "playerTitle", type = "bool", canBeSecret = false } },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["GetToAlpha"] = {
    key = "GetToAlpha",
    name = "GetToAlpha",
    category = "general",
    subcategory = "global",
    func = _G["GetToAlpha"],
    funcPath = "GetToAlpha",
    params = {  },
    returns = { { name = "normalizedAlpha", type = "number", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["GetTooltipIndex"] = {
    key = "GetTooltipIndex",
    name = "GetTooltipIndex",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["GetTooltipIndex"],
    funcPath = "GetTooltipIndex",
    params = { { name = "index", type = "luaIndex", default = nil } },
    returns = { { name = "objectiveIndex", type = "number", canBeSecret = false } },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["GetTotalDuration"] = {
    key = "GetTotalDuration",
    name = "GetTotalDuration",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["GetTotalDuration"],
    funcPath = "GetTotalDuration",
    params = { { name = "modifier", type = "DurationTimeModifier", default = "RealTime" } },
    returns = { { name = "totalDuration", type = "DurationSeconds", canBeSecret = false } },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["GetTotemCannotDismiss"] = {
    key = "GetTotemCannotDismiss",
    name = "GetTotemCannotDismiss",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["GetTotemCannotDismiss"],
    funcPath = "GetTotemCannotDismiss",
    params = { { name = "slot", type = "luaIndex", default = nil } },
    returns = { { name = "cannotDismiss", type = "bool", canBeSecret = false } },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["GetTotemInfo"] = {
    key = "GetTotemInfo",
    name = "GetTotemInfo",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["GetTotemInfo"],
    funcPath = "GetTotemInfo",
    params = { { name = "slot", type = "luaIndex", default = nil } },
    returns = { { name = "haveTotem", type = "bool", canBeSecret = false }, { name = "totemName", type = "cstring", canBeSecret = false }, { name = "startTime", type = "number", canBeSecret = false }, { name = "duration", type = "number", canBeSecret = false }, { name = "icon", type = "fileID", canBeSecret = false }, { name = "modRate", type = "number", canBeSecret = false }, { name = "spellID", type = "number", canBeSecret = false } },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["GetTotemTimeLeft"] = {
    key = "GetTotemTimeLeft",
    name = "GetTotemTimeLeft",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["GetTotemTimeLeft"],
    funcPath = "GetTotemTimeLeft",
    params = { { name = "slot", type = "luaIndex", default = nil } },
    returns = { { name = "timeLeft", type = "number", canBeSecret = false } },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["GetType"] = {
    key = "GetType",
    name = "GetType",
    category = "general",
    subcategory = "global",
    func = _G["GetType"],
    funcPath = "GetType",
    params = {  },
    returns = { { name = "curveType", type = "LuaCurveType", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["GetUICameraInfo"] = {
    key = "GetUICameraInfo",
    name = "GetUICameraInfo",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["GetUICameraInfo"],
    funcPath = "GetUICameraInfo",
    params = { { name = "uiCameraID", type = "number", default = nil } },
    returns = { { name = "posX", type = "number", canBeSecret = false }, { name = "posY", type = "number", canBeSecret = false }, { name = "posZ", type = "number", canBeSecret = false }, { name = "lookAtX", type = "number", canBeSecret = false }, { name = "lookAtY", type = "number", canBeSecret = false }, { name = "lookAtZ", type = "number", canBeSecret = false }, { name = "animID", type = "number", canBeSecret = false }, { name = "animVariation", type = "number", canBeSecret = false }, { name = "animFrame", type = "number", canBeSecret = false }, { name = "useModelCenter", type = "bool", canBeSecret = false } },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["GetUiMapID"] = {
    key = "GetUiMapID",
    name = "GetUiMapID",
    category = "general",
    subcategory = "global",
    func = _G["GetUiMapID"],
    funcPath = "GetUiMapID",
    params = {  },
    returns = { { name = "mapID", type = "number", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["GetUnitChargedPowerPoints"] = {
    key = "GetUnitChargedPowerPoints",
    name = "GetUnitChargedPowerPoints",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["GetUnitChargedPowerPoints"],
    funcPath = "GetUnitChargedPowerPoints",
    params = { { name = "unit", type = "UnitToken", default = "player" } },
    returns = { { name = "pointIndices", type = "table", canBeSecret = false } },
    midnightImpact = "CONDITIONAL",
    midnightNote = "Secret behavior: SecretWhenUnitChargedPowerPointsRestricted, SecretArguments=AllowedWhenUntainted",
}

APIDefs["GetUnitEmpowerHoldAtMaxTime"] = {
    key = "GetUnitEmpowerHoldAtMaxTime",
    name = "GetUnitEmpowerHoldAtMaxTime",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["GetUnitEmpowerHoldAtMaxTime"],
    funcPath = "GetUnitEmpowerHoldAtMaxTime",
    params = { { name = "unit", type = "UnitToken", default = "player" } },
    returns = { { name = "holdAtMaxTime", type = "number", canBeSecret = false } },
    midnightImpact = "CONDITIONAL",
    midnightNote = "Secret behavior: SecretWhenUnitSpellCastingRestricted, SecretArguments=AllowedWhenUntainted",
}

APIDefs["GetUnitEmpowerMinHoldTime"] = {
    key = "GetUnitEmpowerMinHoldTime",
    name = "GetUnitEmpowerMinHoldTime",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["GetUnitEmpowerMinHoldTime"],
    funcPath = "GetUnitEmpowerMinHoldTime",
    params = { { name = "unit", type = "UnitToken", default = "player" } },
    returns = { { name = "minHoldTime", type = "number", canBeSecret = false } },
    midnightImpact = "CONDITIONAL",
    midnightNote = "Secret behavior: SecretWhenUnitSpellCastingRestricted, SecretArguments=AllowedWhenUntainted",
}

APIDefs["GetUnitEmpowerStageDuration"] = {
    key = "GetUnitEmpowerStageDuration",
    name = "GetUnitEmpowerStageDuration",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["GetUnitEmpowerStageDuration"],
    funcPath = "GetUnitEmpowerStageDuration",
    params = { { name = "unit", type = "UnitToken", default = "player" }, { name = "index", type = "number", default = nil } },
    returns = { { name = "duration", type = "number", canBeSecret = false } },
    midnightImpact = "CONDITIONAL",
    midnightNote = "Secret behavior: SecretWhenUnitSpellCastingRestricted, SecretArguments=AllowedWhenUntainted",
}

APIDefs["GetUnitHealthModifier"] = {
    key = "GetUnitHealthModifier",
    name = "GetUnitHealthModifier",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["GetUnitHealthModifier"],
    funcPath = "GetUnitHealthModifier",
    params = { { name = "unit", type = "UnitToken", default = "player" } },
    returns = { { name = "result", type = "number", canBeSecret = false } },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["GetUnitMaxHealthModifier"] = {
    key = "GetUnitMaxHealthModifier",
    name = "GetUnitMaxHealthModifier",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["GetUnitMaxHealthModifier"],
    funcPath = "GetUnitMaxHealthModifier",
    params = { { name = "unit", type = "UnitToken", default = "player" } },
    returns = { { name = "result", type = "number", canBeSecret = false } },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["GetUnitPowerBarInfo"] = {
    key = "GetUnitPowerBarInfo",
    name = "GetUnitPowerBarInfo",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["GetUnitPowerBarInfo"],
    funcPath = "GetUnitPowerBarInfo",
    params = { { name = "unitToken", type = "UnitToken", default = "player" } },
    returns = { { name = "info", type = "UnitPowerBarInfo", canBeSecret = false } },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["GetUnitPowerBarInfoByID"] = {
    key = "GetUnitPowerBarInfoByID",
    name = "GetUnitPowerBarInfoByID",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["GetUnitPowerBarInfoByID"],
    funcPath = "GetUnitPowerBarInfoByID",
    params = { { name = "barID", type = "number", default = nil } },
    returns = { { name = "info", type = "UnitPowerBarInfo", canBeSecret = false } },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["GetUnitPowerBarStrings"] = {
    key = "GetUnitPowerBarStrings",
    name = "GetUnitPowerBarStrings",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["GetUnitPowerBarStrings"],
    funcPath = "GetUnitPowerBarStrings",
    params = { { name = "unitToken", type = "UnitToken", default = "player" } },
    returns = { { name = "name", type = "cstring", canBeSecret = false }, { name = "tooltip", type = "cstring", canBeSecret = false }, { name = "cost", type = "cstring", canBeSecret = false } },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["GetUnitPowerBarStringsByID"] = {
    key = "GetUnitPowerBarStringsByID",
    name = "GetUnitPowerBarStringsByID",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["GetUnitPowerBarStringsByID"],
    funcPath = "GetUnitPowerBarStringsByID",
    params = { { name = "barID", type = "number", default = nil } },
    returns = { { name = "name", type = "cstring", canBeSecret = false }, { name = "tooltip", type = "cstring", canBeSecret = false }, { name = "cost", type = "cstring", canBeSecret = false } },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["GetUnitPowerBarTextureInfo"] = {
    key = "GetUnitPowerBarTextureInfo",
    name = "GetUnitPowerBarTextureInfo",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["GetUnitPowerBarTextureInfo"],
    funcPath = "GetUnitPowerBarTextureInfo",
    params = { { name = "unitToken", type = "UnitToken", default = "player" }, { name = "textureIndex", type = "luaIndex", default = nil }, { name = "timerIndex", type = "luaIndex", default = nil } },
    returns = { { name = "texture", type = "fileID", canBeSecret = false }, { name = "colorR", type = "number", canBeSecret = false }, { name = "colorG", type = "number", canBeSecret = false }, { name = "colorB", type = "number", canBeSecret = false }, { name = "colorA", type = "number", canBeSecret = false } },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["GetUnitPowerBarTextureInfoByID"] = {
    key = "GetUnitPowerBarTextureInfoByID",
    name = "GetUnitPowerBarTextureInfoByID",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["GetUnitPowerBarTextureInfoByID"],
    funcPath = "GetUnitPowerBarTextureInfoByID",
    params = { { name = "barID", type = "number", default = nil }, { name = "textureIndex", type = "luaIndex", default = nil } },
    returns = { { name = "texture", type = "fileID", canBeSecret = false }, { name = "colorR", type = "number", canBeSecret = false }, { name = "colorG", type = "number", canBeSecret = false }, { name = "colorB", type = "number", canBeSecret = false }, { name = "colorA", type = "number", canBeSecret = false } },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["GetUnitPowerModifier"] = {
    key = "GetUnitPowerModifier",
    name = "GetUnitPowerModifier",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["GetUnitPowerModifier"],
    funcPath = "GetUnitPowerModifier",
    params = { { name = "unit", type = "UnitToken", default = "player" } },
    returns = { { name = "result", type = "number", canBeSecret = false } },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["GetUnitSpeed"] = {
    key = "GetUnitSpeed",
    name = "GetUnitSpeed",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["GetUnitSpeed"],
    funcPath = "GetUnitSpeed",
    params = { { name = "unit", type = "UnitToken", default = "player" } },
    returns = { { name = "currentSpeed", type = "number", canBeSecret = false }, { name = "runSpeed", type = "number", canBeSecret = false }, { name = "flightSpeed", type = "number", canBeSecret = false }, { name = "swimSpeed", type = "number", canBeSecret = false } },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["GetUnitTotalModifiedMaxHealthPercent"] = {
    key = "GetUnitTotalModifiedMaxHealthPercent",
    name = "GetUnitTotalModifiedMaxHealthPercent",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["GetUnitTotalModifiedMaxHealthPercent"],
    funcPath = "GetUnitTotalModifiedMaxHealthPercent",
    params = { { name = "unit", type = "UnitToken", default = "player" } },
    returns = { { name = "result", type = "number", canBeSecret = false } },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["GetUpgradeExpansionLevel"] = {
    key = "GetUpgradeExpansionLevel",
    name = "GetUpgradeExpansionLevel",
    category = "general",
    subcategory = "global",
    func = _G["GetUpgradeExpansionLevel"],
    funcPath = "GetUpgradeExpansionLevel",
    params = {  },
    returns = { { name = "upgradeExpansionLevel", type = "number", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["GetUpperBackgroundFileName"] = {
    key = "GetUpperBackgroundFileName",
    name = "GetUpperBackgroundFileName",
    category = "general",
    subcategory = "global",
    func = _G["GetUpperBackgroundFileName"],
    funcPath = "GetUpperBackgroundFileName",
    params = {  },
    returns = { { name = "file", type = "fileID", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["GetUpperBorderFile"] = {
    key = "GetUpperBorderFile",
    name = "GetUpperBorderFile",
    category = "general",
    subcategory = "global",
    func = _G["GetUpperBorderFile"],
    funcPath = "GetUpperBorderFile",
    params = {  },
    returns = { { name = "file", type = "fileID", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["GetUpperEmblemFile"] = {
    key = "GetUpperEmblemFile",
    name = "GetUpperEmblemFile",
    category = "general",
    subcategory = "global",
    func = _G["GetUpperEmblemFile"],
    funcPath = "GetUpperEmblemFile",
    params = {  },
    returns = { { name = "file", type = "fileID", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["GetUpperEmblemTexture"] = {
    key = "GetUpperEmblemTexture",
    name = "GetUpperEmblemTexture",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["GetUpperEmblemTexture"],
    funcPath = "GetUpperEmblemTexture",
    params = { { name = "texture", type = "SimpleTexture", default = nil } },
    returns = {  },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["GetUseTransmogChoices"] = {
    key = "GetUseTransmogChoices",
    name = "GetUseTransmogChoices",
    category = "general",
    subcategory = "global",
    func = _G["GetUseTransmogChoices"],
    funcPath = "GetUseTransmogChoices",
    params = {  },
    returns = { { name = "use", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["GetUseTransmogSkin"] = {
    key = "GetUseTransmogSkin",
    name = "GetUseTransmogSkin",
    category = "general",
    subcategory = "global",
    func = _G["GetUseTransmogSkin"],
    funcPath = "GetUseTransmogSkin",
    params = {  },
    returns = { { name = "use", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["GetValue"] = {
    key = "GetValue",
    name = "GetValue",
    category = "general",
    subcategory = "global",
    func = _G["GetValue"],
    funcPath = "GetValue",
    params = {  },
    returns = { { name = "value", type = "number", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["GetValueStep"] = {
    key = "GetValueStep",
    name = "GetValueStep",
    category = "general",
    subcategory = "global",
    func = _G["GetValueStep"],
    funcPath = "GetValueStep",
    params = {  },
    returns = { { name = "valueStep", type = "number", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["GetVehicleUIIndicator"] = {
    key = "GetVehicleUIIndicator",
    name = "GetVehicleUIIndicator",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["GetVehicleUIIndicator"],
    funcPath = "GetVehicleUIIndicator",
    params = { { name = "vehicleIndicatorID", type = "number", default = nil } },
    returns = { { name = "backgroundTextureID", type = "fileID", canBeSecret = false }, { name = "numSeatIndicators", type = "number", canBeSecret = false } },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["GetVehicleUIIndicatorSeat"] = {
    key = "GetVehicleUIIndicatorSeat",
    name = "GetVehicleUIIndicatorSeat",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["GetVehicleUIIndicatorSeat"],
    funcPath = "GetVehicleUIIndicatorSeat",
    params = { { name = "vehicleIndicatorID", type = "number", default = nil }, { name = "indicatorSeatIndex", type = "luaIndex", default = nil } },
    returns = { { name = "virtualSeatIndex", type = "number", canBeSecret = false }, { name = "xPos", type = "number", canBeSecret = false }, { name = "yPos", type = "number", canBeSecret = false } },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["GetVersatilityBonus"] = {
    key = "GetVersatilityBonus",
    name = "GetVersatilityBonus",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["GetVersatilityBonus"],
    funcPath = "GetVersatilityBonus",
    params = { { name = "combatRating", type = "luaIndex", default = nil } },
    returns = { { name = "result", type = "number", canBeSecret = false } },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["GetViewInsets"] = {
    key = "GetViewInsets",
    name = "GetViewInsets",
    category = "general",
    subcategory = "global",
    func = _G["GetViewInsets"],
    funcPath = "GetViewInsets",
    params = {  },
    returns = { { name = "left", type = "uiUnit", canBeSecret = false }, { name = "right", type = "uiUnit", canBeSecret = false }, { name = "top", type = "uiUnit", canBeSecret = false }, { name = "bottom", type = "uiUnit", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["GetViewTranslation"] = {
    key = "GetViewTranslation",
    name = "GetViewTranslation",
    category = "general",
    subcategory = "global",
    func = _G["GetViewTranslation"],
    funcPath = "GetViewTranslation",
    params = {  },
    returns = { { name = "x", type = "uiUnit", canBeSecret = false }, { name = "y", type = "uiUnit", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["GetWorldScale"] = {
    key = "GetWorldScale",
    name = "GetWorldScale",
    category = "general",
    subcategory = "global",
    func = _G["GetWorldScale"],
    funcPath = "GetWorldScale",
    params = {  },
    returns = { { name = "worldScale", type = "number", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["GetXPExhaustion"] = {
    key = "GetXPExhaustion",
    name = "GetXPExhaustion",
    category = "general",
    subcategory = "global",
    func = _G["GetXPExhaustion"],
    funcPath = "GetXPExhaustion",
    params = {  },
    returns = { { name = "result", type = "number", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["GetYaw"] = {
    key = "GetYaw",
    name = "GetYaw",
    category = "general",
    subcategory = "global",
    func = _G["GetYaw"],
    funcPath = "GetYaw",
    params = {  },
    returns = { { name = "yaw", type = "number", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["GetZoneText"] = {
    key = "GetZoneText",
    name = "GetZoneText",
    category = "general",
    subcategory = "global",
    func = _G["GetZoneText"],
    funcPath = "GetZoneText",
    params = {  },
    returns = { { name = "text", type = "cstring", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["GetZoom"] = {
    key = "GetZoom",
    name = "GetZoom",
    category = "general",
    subcategory = "global",
    func = _G["GetZoom"],
    funcPath = "GetZoom",
    params = {  },
    returns = { { name = "zoomFactor", type = "number", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["GetZoomLevels"] = {
    key = "GetZoomLevels",
    name = "GetZoomLevels",
    category = "general",
    subcategory = "global",
    func = _G["GetZoomLevels"],
    funcPath = "GetZoomLevels",
    params = {  },
    returns = { { name = "zoomLevels", type = "number", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["HasAPEffectsSpellPower"] = {
    key = "HasAPEffectsSpellPower",
    name = "HasAPEffectsSpellPower",
    category = "general",
    subcategory = "global",
    func = _G["HasAPEffectsSpellPower"],
    funcPath = "HasAPEffectsSpellPower",
    params = {  },
    returns = { { name = "result", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["HasAnimation"] = {
    key = "HasAnimation",
    name = "HasAnimation",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["HasAnimation"],
    funcPath = "HasAnimation",
    params = { { name = "anim", type = "AnimationDataEnum", default = nil } },
    returns = { { name = "hasAnimation", type = "bool", canBeSecret = false } },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["HasAttachedFixture"] = {
    key = "HasAttachedFixture",
    name = "HasAttachedFixture",
    category = "general",
    subcategory = "global",
    func = _G["HasAttachedFixture"],
    funcPath = "HasAttachedFixture",
    params = {  },
    returns = { { name = "hasAttachedFixture", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["HasAttachmentPoints"] = {
    key = "HasAttachmentPoints",
    name = "HasAttachmentPoints",
    category = "general",
    subcategory = "global",
    func = _G["HasAttachmentPoints"],
    funcPath = "HasAttachmentPoints",
    params = {  },
    returns = { { name = "hasAttachmentPoints", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["HasCustomCamera"] = {
    key = "HasCustomCamera",
    name = "HasCustomCamera",
    category = "general",
    subcategory = "global",
    func = _G["HasCustomCamera"],
    funcPath = "HasCustomCamera",
    params = {  },
    returns = { { name = "hasCustomCamera", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["HasDualWieldPenalty"] = {
    key = "HasDualWieldPenalty",
    name = "HasDualWieldPenalty",
    category = "general",
    subcategory = "global",
    func = _G["HasDualWieldPenalty"],
    funcPath = "HasDualWieldPenalty",
    params = {  },
    returns = { { name = "result", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["HasFullControl"] = {
    key = "HasFullControl",
    name = "HasFullControl",
    category = "general",
    subcategory = "global",
    func = _G["HasFullControl"],
    funcPath = "HasFullControl",
    params = {  },
    returns = { { name = "result", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["HasIgnoreDualWieldWeapon"] = {
    key = "HasIgnoreDualWieldWeapon",
    name = "HasIgnoreDualWieldWeapon",
    category = "general",
    subcategory = "global",
    func = _G["HasIgnoreDualWieldWeapon"],
    funcPath = "HasIgnoreDualWieldWeapon",
    params = {  },
    returns = { { name = "result", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["HasKey"] = {
    key = "HasKey",
    name = "HasKey",
    category = "general",
    subcategory = "global",
    func = _G["HasKey"],
    funcPath = "HasKey",
    params = {  },
    returns = { { name = "hasKey", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["HasLootSpecializations"] = {
    key = "HasLootSpecializations",
    name = "HasLootSpecializations",
    category = "general",
    subcategory = "global",
    func = _G["HasLootSpecializations"],
    funcPath = "HasLootSpecializations",
    params = {  },
    returns = { { name = "hasLootSpecializations", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["HasMessageByID"] = {
    key = "HasMessageByID",
    name = "HasMessageByID",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["HasMessageByID"],
    funcPath = "HasMessageByID",
    params = { { name = "messageID", type = "number", default = nil } },
    returns = { { name = "hasMessage", type = "bool", canBeSecret = false } },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["HasNoReleaseAura"] = {
    key = "HasNoReleaseAura",
    name = "HasNoReleaseAura",
    category = "general",
    subcategory = "global",
    func = _G["HasNoReleaseAura"],
    funcPath = "HasNoReleaseAura",
    params = {  },
    returns = { { name = "hasCannotReleaseEffect", type = "bool", canBeSecret = false }, { name = "longestDuration", type = "number", canBeSecret = false }, { name = "hasUntilCancelledDuration", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["HasSPEffectsAttackPower"] = {
    key = "HasSPEffectsAttackPower",
    name = "HasSPEffectsAttackPower",
    category = "general",
    subcategory = "global",
    func = _G["HasSPEffectsAttackPower"],
    funcPath = "HasSPEffectsAttackPower",
    params = {  },
    returns = { { name = "result", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["HasScript"] = {
    key = "HasScript",
    name = "HasScript",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["HasScript"],
    funcPath = "HasScript",
    params = { { name = "scriptName", type = "cstring", default = nil } },
    returns = { { name = "hasScript", type = "bool", canBeSecret = false } },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["HasSecretValues"] = {
    key = "HasSecretValues",
    name = "HasSecretValues",
    category = "general",
    subcategory = "global",
    func = _G["HasSecretValues"],
    funcPath = "HasSecretValues",
    params = {  },
    returns = { { name = "hasSecretValues", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["Hide"] = {
    key = "Hide",
    name = "Hide",
    category = "general",
    subcategory = "global",
    func = _G["Hide"],
    funcPath = "Hide",
    params = {  },
    returns = {  },
    midnightImpact = "NORMAL",
}

APIDefs["HookScript"] = {
    key = "HookScript",
    name = "HookScript",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["HookScript"],
    funcPath = "HookScript",
    params = { { name = "scriptTypeName", type = "cstring", default = nil }, { name = "script", type = "luaFunction", default = nil }, { name = "bindingType", type = "number", default = nil } },
    returns = {  },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["InCinematic"] = {
    key = "InCinematic",
    name = "InCinematic",
    category = "general",
    subcategory = "global",
    func = _G["InCinematic"],
    funcPath = "InCinematic",
    params = {  },
    returns = { { name = "inCinematic", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["InitializeCamera"] = {
    key = "InitializeCamera",
    name = "InitializeCamera",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["InitializeCamera"],
    funcPath = "InitializeCamera",
    params = { { name = "scaleFactor", type = "number", default = 0 } },
    returns = {  },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["InitializePanCamera"] = {
    key = "InitializePanCamera",
    name = "InitializePanCamera",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["InitializePanCamera"],
    funcPath = "InitializePanCamera",
    params = { { name = "scaleFactor", type = "number", default = 0 } },
    returns = {  },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["InitializeTabardColors"] = {
    key = "InitializeTabardColors",
    name = "InitializeTabardColors",
    category = "general",
    subcategory = "global",
    func = _G["InitializeTabardColors"],
    funcPath = "InitializeTabardColors",
    params = {  },
    returns = {  },
    midnightImpact = "NORMAL",
}

APIDefs["InitiateRolePoll"] = {
    key = "InitiateRolePoll",
    name = "InitiateRolePoll",
    category = "general",
    subcategory = "global",
    func = _G["InitiateRolePoll"],
    funcPath = "InitiateRolePoll",
    params = {  },
    returns = { { name = "result", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["InitiateTrade"] = {
    key = "InitiateTrade",
    name = "InitiateTrade",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["InitiateTrade"],
    funcPath = "InitiateTrade",
    params = { { name = "guid", type = "UnitToken", default = "player" } },
    returns = {  },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["Is64BitClient"] = {
    key = "Is64BitClient",
    name = "Is64BitClient",
    category = "general",
    subcategory = "global",
    func = _G["Is64BitClient"],
    funcPath = "Is64BitClient",
    params = {  },
    returns = { { name = "is64Bit", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["IsAccountSecured"] = {
    key = "IsAccountSecured",
    name = "IsAccountSecured",
    category = "general",
    subcategory = "global",
    func = _G["IsAccountSecured"],
    funcPath = "IsAccountSecured",
    params = {  },
    returns = { { name = "result", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["IsAdvancedFlyableArea"] = {
    key = "IsAdvancedFlyableArea",
    name = "IsAdvancedFlyableArea",
    category = "general",
    subcategory = "global",
    func = _G["IsAdvancedFlyableArea"],
    funcPath = "IsAdvancedFlyableArea",
    params = {  },
    returns = { { name = "result", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["IsAllowedIndoorsActive"] = {
    key = "IsAllowedIndoorsActive",
    name = "IsAllowedIndoorsActive",
    category = "general",
    subcategory = "global",
    func = _G["IsAllowedIndoorsActive"],
    funcPath = "IsAllowedIndoorsActive",
    params = {  },
    returns = { { name = "isActive", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["IsAllowedOutdoorsActive"] = {
    key = "IsAllowedOutdoorsActive",
    name = "IsAllowedOutdoorsActive",
    category = "general",
    subcategory = "global",
    func = _G["IsAllowedOutdoorsActive"],
    funcPath = "IsAllowedOutdoorsActive",
    params = {  },
    returns = { { name = "isActive", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["IsAltKeyDown"] = {
    key = "IsAltKeyDown",
    name = "IsAltKeyDown",
    category = "general",
    subcategory = "global",
    func = _G["IsAltKeyDown"],
    funcPath = "IsAltKeyDown",
    params = {  },
    returns = { { name = "down", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["IsAnyPartOfRoomSelected"] = {
    key = "IsAnyPartOfRoomSelected",
    name = "IsAnyPartOfRoomSelected",
    category = "general",
    subcategory = "global",
    func = _G["IsAnyPartOfRoomSelected"],
    funcPath = "IsAnyPartOfRoomSelected",
    params = {  },
    returns = { { name = "isSelected", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["IsBetaBuild"] = {
    key = "IsBetaBuild",
    name = "IsBetaBuild",
    category = "general",
    subcategory = "global",
    func = _G["IsBetaBuild"],
    funcPath = "IsBetaBuild",
    params = {  },
    returns = { { name = "isBetaBuild", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["IsCemeterySelectionAvailable"] = {
    key = "IsCemeterySelectionAvailable",
    name = "IsCemeterySelectionAvailable",
    category = "general",
    subcategory = "global",
    func = _G["IsCemeterySelectionAvailable"],
    funcPath = "IsCemeterySelectionAvailable",
    params = {  },
    returns = { { name = "result", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["IsCharacterNewlyBoosted"] = {
    key = "IsCharacterNewlyBoosted",
    name = "IsCharacterNewlyBoosted",
    category = "general",
    subcategory = "global",
    func = _G["IsCharacterNewlyBoosted"],
    funcPath = "IsCharacterNewlyBoosted",
    params = {  },
    returns = { { name = "newlyBoosted", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["IsCollectedActive"] = {
    key = "IsCollectedActive",
    name = "IsCollectedActive",
    category = "general",
    subcategory = "global",
    func = _G["IsCollectedActive"],
    funcPath = "IsCollectedActive",
    params = {  },
    returns = { { name = "isActive", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["IsControlKeyDown"] = {
    key = "IsControlKeyDown",
    name = "IsControlKeyDown",
    category = "general",
    subcategory = "global",
    func = _G["IsControlKeyDown"],
    funcPath = "IsControlKeyDown",
    params = {  },
    returns = { { name = "down", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["IsCpuBound"] = {
    key = "IsCpuBound",
    name = "IsCpuBound",
    category = "general",
    subcategory = "global",
    func = _G["IsCpuBound"],
    funcPath = "IsCpuBound",
    params = {  },
    returns = { { name = "isCpuBound", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["IsCustomizableOnlyActive"] = {
    key = "IsCustomizableOnlyActive",
    name = "IsCustomizableOnlyActive",
    category = "general",
    subcategory = "global",
    func = _G["IsCustomizableOnlyActive"],
    funcPath = "IsCustomizableOnlyActive",
    params = {  },
    returns = { { name = "isActive", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["IsDebugBuild"] = {
    key = "IsDebugBuild",
    name = "IsDebugBuild",
    category = "general",
    subcategory = "global",
    func = _G["IsDebugBuild"],
    funcPath = "IsDebugBuild",
    params = {  },
    returns = { { name = "isDebugBuild", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["IsDelaying"] = {
    key = "IsDelaying",
    name = "IsDelaying",
    category = "general",
    subcategory = "global",
    func = _G["IsDelaying"],
    funcPath = "IsDelaying",
    params = {  },
    returns = { { name = "isDelaying", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["IsDemonHunterAvailable"] = {
    key = "IsDemonHunterAvailable",
    name = "IsDemonHunterAvailable",
    category = "general",
    subcategory = "global",
    func = _G["IsDemonHunterAvailable"],
    funcPath = "IsDemonHunterAvailable",
    params = {  },
    returns = { { name = "available", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["IsDone"] = {
    key = "IsDone",
    name = "IsDone",
    category = "general",
    subcategory = "global",
    func = _G["IsDone"],
    funcPath = "IsDone",
    params = {  },
    returns = { { name = "isDone", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["IsDraggingThumb"] = {
    key = "IsDraggingThumb",
    name = "IsDraggingThumb",
    category = "general",
    subcategory = "global",
    func = _G["IsDraggingThumb"],
    funcPath = "IsDraggingThumb",
    params = {  },
    returns = { { name = "isDraggingThumb", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["IsDrivableArea"] = {
    key = "IsDrivableArea",
    name = "IsDrivableArea",
    category = "general",
    subcategory = "global",
    func = _G["IsDrivableArea"],
    funcPath = "IsDrivableArea",
    params = {  },
    returns = { { name = "result", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["IsDualWielding"] = {
    key = "IsDualWielding",
    name = "IsDualWielding",
    category = "general",
    subcategory = "global",
    func = _G["IsDualWielding"],
    funcPath = "IsDualWielding",
    params = {  },
    returns = { { name = "result", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["IsEnabled"] = {
    key = "IsEnabled",
    name = "IsEnabled",
    category = "general",
    subcategory = "global",
    func = _G["IsEnabled"],
    funcPath = "IsEnabled",
    params = {  },
    returns = { { name = "enabled", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["IsEuropeanNumbers"] = {
    key = "IsEuropeanNumbers",
    name = "IsEuropeanNumbers",
    category = "general",
    subcategory = "global",
    func = _G["IsEuropeanNumbers"],
    funcPath = "IsEuropeanNumbers",
    params = {  },
    returns = { { name = "enabled", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["IsExpansionTrial"] = {
    key = "IsExpansionTrial",
    name = "IsExpansionTrial",
    category = "general",
    subcategory = "global",
    func = _G["IsExpansionTrial"],
    funcPath = "IsExpansionTrial",
    params = {  },
    returns = { { name = "isExpansionTrialAccount", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["IsFalling"] = {
    key = "IsFalling",
    name = "IsFalling",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["IsFalling"],
    funcPath = "IsFalling",
    params = { { name = "unit", type = "UnitToken", default = "player" } },
    returns = { { name = "result", type = "bool", canBeSecret = false } },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["IsFirstAcquisitionBonusOnlyActive"] = {
    key = "IsFirstAcquisitionBonusOnlyActive",
    name = "IsFirstAcquisitionBonusOnlyActive",
    category = "general",
    subcategory = "global",
    func = _G["IsFirstAcquisitionBonusOnlyActive"],
    funcPath = "IsFirstAcquisitionBonusOnlyActive",
    params = {  },
    returns = { { name = "isActive", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["IsFlyableArea"] = {
    key = "IsFlyableArea",
    name = "IsFlyableArea",
    category = "general",
    subcategory = "global",
    func = _G["IsFlyableArea"],
    funcPath = "IsFlyableArea",
    params = {  },
    returns = { { name = "result", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["IsFlying"] = {
    key = "IsFlying",
    name = "IsFlying",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["IsFlying"],
    funcPath = "IsFlying",
    params = { { name = "unit", type = "UnitToken", default = "player" } },
    returns = { { name = "result", type = "bool", canBeSecret = false } },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["IsGeoReady"] = {
    key = "IsGeoReady",
    name = "IsGeoReady",
    category = "general",
    subcategory = "global",
    func = _G["IsGeoReady"],
    funcPath = "IsGeoReady",
    params = {  },
    returns = { { name = "isReady", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["IsGuildLeader"] = {
    key = "IsGuildLeader",
    name = "IsGuildLeader",
    category = "general",
    subcategory = "global",
    func = _G["IsGuildLeader"],
    funcPath = "IsGuildLeader",
    params = {  },
    returns = { { name = "result", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["IsGuildTabard"] = {
    key = "IsGuildTabard",
    name = "IsGuildTabard",
    category = "general",
    subcategory = "global",
    func = _G["IsGuildTabard"],
    funcPath = "IsGuildTabard",
    params = {  },
    returns = { { name = "isGuildTabard", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["IsInGuild"] = {
    key = "IsInGuild",
    name = "IsInGuild",
    category = "general",
    subcategory = "global",
    func = _G["IsInGuild"],
    funcPath = "IsInGuild",
    params = {  },
    returns = { { name = "result", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["IsInInstance"] = {
    key = "IsInInstance",
    name = "IsInInstance",
    category = "general",
    subcategory = "global",
    func = _G["IsInInstance"],
    funcPath = "IsInInstance",
    params = {  },
    returns = { { name = "isInInstance", type = "bool", canBeSecret = false }, { name = "instanceType", type = "cstring", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["IsInJailersTower"] = {
    key = "IsInJailersTower",
    name = "IsInJailersTower",
    category = "general",
    subcategory = "global",
    func = _G["IsInJailersTower"],
    funcPath = "IsInJailersTower",
    params = {  },
    returns = { { name = "result", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["IsIndoors"] = {
    key = "IsIndoors",
    name = "IsIndoors",
    category = "general",
    subcategory = "global",
    func = _G["IsIndoors"],
    funcPath = "IsIndoors",
    params = {  },
    returns = { { name = "result", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["IsInsane"] = {
    key = "IsInsane",
    name = "IsInsane",
    category = "general",
    subcategory = "global",
    func = _G["IsInsane"],
    funcPath = "IsInsane",
    params = {  },
    returns = { { name = "result", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["IsItemPreferredArmorType"] = {
    key = "IsItemPreferredArmorType",
    name = "IsItemPreferredArmorType",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["IsItemPreferredArmorType"],
    funcPath = "IsItemPreferredArmorType",
    params = { { name = "itemLocation", type = "ItemLocation", default = nil } },
    returns = { { name = "isItemPreferredArmorType", type = "bool", canBeSecret = false } },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["IsJailersTowerLayerTimeLocked"] = {
    key = "IsJailersTowerLayerTimeLocked",
    name = "IsJailersTowerLayerTimeLocked",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["IsJailersTowerLayerTimeLocked"],
    funcPath = "IsJailersTowerLayerTimeLocked",
    params = { { name = "layerLevel", type = "number", default = nil } },
    returns = { { name = "result", type = "cstring", canBeSecret = false } },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["IsKeyDown"] = {
    key = "IsKeyDown",
    name = "IsKeyDown",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["IsKeyDown"],
    funcPath = "IsKeyDown",
    params = { { name = "keyOrMouseName", type = "cstring", default = nil }, { name = "excludeBindingState", type = "bool", default = false } },
    returns = { { name = "down", type = "bool", canBeSecret = false } },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["IsLeftAltKeyDown"] = {
    key = "IsLeftAltKeyDown",
    name = "IsLeftAltKeyDown",
    category = "general",
    subcategory = "global",
    func = _G["IsLeftAltKeyDown"],
    funcPath = "IsLeftAltKeyDown",
    params = {  },
    returns = { { name = "down", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["IsLeftControlKeyDown"] = {
    key = "IsLeftControlKeyDown",
    name = "IsLeftControlKeyDown",
    category = "general",
    subcategory = "global",
    func = _G["IsLeftControlKeyDown"],
    funcPath = "IsLeftControlKeyDown",
    params = {  },
    returns = { { name = "down", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["IsLeftMetaKeyDown"] = {
    key = "IsLeftMetaKeyDown",
    name = "IsLeftMetaKeyDown",
    category = "general",
    subcategory = "global",
    func = _G["IsLeftMetaKeyDown"],
    funcPath = "IsLeftMetaKeyDown",
    params = {  },
    returns = { { name = "down", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["IsLeftShiftKeyDown"] = {
    key = "IsLeftShiftKeyDown",
    name = "IsLeftShiftKeyDown",
    category = "general",
    subcategory = "global",
    func = _G["IsLeftShiftKeyDown"],
    funcPath = "IsLeftShiftKeyDown",
    params = {  },
    returns = { { name = "down", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["IsLegacyDifficulty"] = {
    key = "IsLegacyDifficulty",
    name = "IsLegacyDifficulty",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["IsLegacyDifficulty"],
    funcPath = "IsLegacyDifficulty",
    params = { { name = "difficultyID", type = "number", default = nil } },
    returns = { { name = "result", type = "bool", canBeSecret = false } },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["IsLightVisible"] = {
    key = "IsLightVisible",
    name = "IsLightVisible",
    category = "general",
    subcategory = "global",
    func = _G["IsLightVisible"],
    funcPath = "IsLightVisible",
    params = {  },
    returns = { { name = "isVisible", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["IsLinuxClient"] = {
    key = "IsLinuxClient",
    name = "IsLinuxClient",
    category = "general",
    subcategory = "global",
    func = _G["IsLinuxClient"],
    funcPath = "IsLinuxClient",
    params = {  },
    returns = { { name = "isLinux", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["IsLoaded"] = {
    key = "IsLoaded",
    name = "IsLoaded",
    category = "general",
    subcategory = "global",
    func = _G["IsLoaded"],
    funcPath = "IsLoaded",
    params = {  },
    returns = { { name = "isLoaded", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["IsLoggedIn"] = {
    key = "IsLoggedIn",
    name = "IsLoggedIn",
    category = "general",
    subcategory = "global",
    func = _G["IsLoggedIn"],
    funcPath = "IsLoggedIn",
    params = {  },
    returns = { { name = "result", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["IsMacClient"] = {
    key = "IsMacClient",
    name = "IsMacClient",
    category = "general",
    subcategory = "global",
    func = _G["IsMacClient"],
    funcPath = "IsMacClient",
    params = {  },
    returns = { { name = "isMac", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["IsMetaKeyDown"] = {
    key = "IsMetaKeyDown",
    name = "IsMetaKeyDown",
    category = "general",
    subcategory = "global",
    func = _G["IsMetaKeyDown"],
    funcPath = "IsMetaKeyDown",
    params = {  },
    returns = { { name = "down", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["IsModifierKeyDown"] = {
    key = "IsModifierKeyDown",
    name = "IsModifierKeyDown",
    category = "general",
    subcategory = "global",
    func = _G["IsModifierKeyDown"],
    funcPath = "IsModifierKeyDown",
    params = {  },
    returns = { { name = "down", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["IsMounted"] = {
    key = "IsMounted",
    name = "IsMounted",
    category = "general",
    subcategory = "global",
    func = _G["IsMounted"],
    funcPath = "IsMounted",
    params = {  },
    returns = { { name = "result", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["IsMouseButtonDown"] = {
    key = "IsMouseButtonDown",
    name = "IsMouseButtonDown",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["IsMouseButtonDown"],
    funcPath = "IsMouseButtonDown",
    params = { { name = "button", type = "mouseButton", default = nil } },
    returns = { { name = "down", type = "bool", canBeSecret = false } },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["IsMovieLocal"] = {
    key = "IsMovieLocal",
    name = "IsMovieLocal",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["IsMovieLocal"],
    funcPath = "IsMovieLocal",
    params = { { name = "movieId", type = "number", default = nil } },
    returns = { { name = "isLocal", type = "bool", canBeSecret = false } },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["IsMoviePlayable"] = {
    key = "IsMoviePlayable",
    name = "IsMoviePlayable",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["IsMoviePlayable"],
    funcPath = "IsMoviePlayable",
    params = { { name = "movieId", type = "number", default = nil } },
    returns = { { name = "isPlayable", type = "bool", canBeSecret = false } },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["IsMovieReadable"] = {
    key = "IsMovieReadable",
    name = "IsMovieReadable",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["IsMovieReadable"],
    funcPath = "IsMovieReadable",
    params = { { name = "movieId", type = "number", default = nil } },
    returns = { { name = "readable", type = "bool", canBeSecret = false } },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["IsOccupiedDoor"] = {
    key = "IsOccupiedDoor",
    name = "IsOccupiedDoor",
    category = "general",
    subcategory = "global",
    func = _G["IsOccupiedDoor"],
    funcPath = "IsOccupiedDoor",
    params = {  },
    returns = { { name = "isOccupied", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["IsOnGroundFloorInJailersTower"] = {
    key = "IsOnGroundFloorInJailersTower",
    name = "IsOnGroundFloorInJailersTower",
    category = "general",
    subcategory = "global",
    func = _G["IsOnGroundFloorInJailersTower"],
    funcPath = "IsOnGroundFloorInJailersTower",
    params = {  },
    returns = { { name = "result", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["IsOnTournamentRealm"] = {
    key = "IsOnTournamentRealm",
    name = "IsOnTournamentRealm",
    category = "general",
    subcategory = "global",
    func = _G["IsOnTournamentRealm"],
    funcPath = "IsOnTournamentRealm",
    params = {  },
    returns = { { name = "result", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["IsOutOfBounds"] = {
    key = "IsOutOfBounds",
    name = "IsOutOfBounds",
    category = "general",
    subcategory = "global",
    func = _G["IsOutOfBounds"],
    funcPath = "IsOutOfBounds",
    params = {  },
    returns = { { name = "result", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["IsOutdoors"] = {
    key = "IsOutdoors",
    name = "IsOutdoors",
    category = "general",
    subcategory = "global",
    func = _G["IsOutdoors"],
    funcPath = "IsOutdoors",
    params = {  },
    returns = { { name = "result", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["IsOwnedOnlyActive"] = {
    key = "IsOwnedOnlyActive",
    name = "IsOwnedOnlyActive",
    category = "general",
    subcategory = "global",
    func = _G["IsOwnedOnlyActive"],
    funcPath = "IsOwnedOnlyActive",
    params = {  },
    returns = { { name = "isActive", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["IsPVPTimerRunning"] = {
    key = "IsPVPTimerRunning",
    name = "IsPVPTimerRunning",
    category = "general",
    subcategory = "global",
    func = _G["IsPVPTimerRunning"],
    funcPath = "IsPVPTimerRunning",
    params = {  },
    returns = { { name = "result", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["IsPaused"] = {
    key = "IsPaused",
    name = "IsPaused",
    category = "general",
    subcategory = "global",
    func = _G["IsPaused"],
    funcPath = "IsPaused",
    params = {  },
    returns = { { name = "isPaused", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["IsPendingFinish"] = {
    key = "IsPendingFinish",
    name = "IsPendingFinish",
    category = "general",
    subcategory = "global",
    func = _G["IsPendingFinish"],
    funcPath = "IsPendingFinish",
    params = {  },
    returns = { { name = "isPendingFinish", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["IsPlayerInGuildFromGUID"] = {
    key = "IsPlayerInGuildFromGUID",
    name = "IsPlayerInGuildFromGUID",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["IsPlayerInGuildFromGUID"],
    funcPath = "IsPlayerInGuildFromGUID",
    params = { { name = "playerGUID", type = "WOWGUID", default = nil } },
    returns = { { name = "IsInGuild", type = "bool", canBeSecret = false } },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["IsPlayerInWorld"] = {
    key = "IsPlayerInWorld",
    name = "IsPlayerInWorld",
    category = "general",
    subcategory = "global",
    func = _G["IsPlayerInWorld"],
    funcPath = "IsPlayerInWorld",
    params = {  },
    returns = { { name = "result", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["IsPlayerMoving"] = {
    key = "IsPlayerMoving",
    name = "IsPlayerMoving",
    category = "general",
    subcategory = "global",
    func = _G["IsPlayerMoving"],
    funcPath = "IsPlayerMoving",
    params = {  },
    returns = { { name = "result", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["IsPlaying"] = {
    key = "IsPlaying",
    name = "IsPlaying",
    category = "general",
    subcategory = "global",
    func = _G["IsPlaying"],
    funcPath = "IsPlaying",
    params = {  },
    returns = { { name = "isPlaying", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["IsPreferringModelCollisionBounds"] = {
    key = "IsPreferringModelCollisionBounds",
    name = "IsPreferringModelCollisionBounds",
    category = "general",
    subcategory = "global",
    func = _G["IsPreferringModelCollisionBounds"],
    funcPath = "IsPreferringModelCollisionBounds",
    params = {  },
    returns = { { name = "preferringCollisionBounds", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["IsPublicBuild"] = {
    key = "IsPublicBuild",
    name = "IsPublicBuild",
    category = "general",
    subcategory = "global",
    func = _G["IsPublicBuild"],
    funcPath = "IsPublicBuild",
    params = {  },
    returns = { { name = "isPublicBuild", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["IsPublicTestClient"] = {
    key = "IsPublicTestClient",
    name = "IsPublicTestClient",
    category = "general",
    subcategory = "global",
    func = _G["IsPublicTestClient"],
    funcPath = "IsPublicTestClient",
    params = {  },
    returns = { { name = "isPublicTestClient", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["IsRaidMarkerActive"] = {
    key = "IsRaidMarkerActive",
    name = "IsRaidMarkerActive",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["IsRaidMarkerActive"],
    funcPath = "IsRaidMarkerActive",
    params = { { name = "index", type = "luaIndex", default = nil } },
    returns = { { name = "result", type = "bool", canBeSecret = false } },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["IsRaidMarkerSystemEnabled"] = {
    key = "IsRaidMarkerSystemEnabled",
    name = "IsRaidMarkerSystemEnabled",
    category = "general",
    subcategory = "global",
    func = _G["IsRaidMarkerSystemEnabled"],
    funcPath = "IsRaidMarkerSystemEnabled",
    params = {  },
    returns = { { name = "enabled", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["IsRangedWeapon"] = {
    key = "IsRangedWeapon",
    name = "IsRangedWeapon",
    category = "general",
    subcategory = "global",
    func = _G["IsRangedWeapon"],
    funcPath = "IsRangedWeapon",
    params = {  },
    returns = { { name = "result", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["IsResting"] = {
    key = "IsResting",
    name = "IsResting",
    category = "general",
    subcategory = "global",
    func = _G["IsResting"],
    funcPath = "IsResting",
    params = {  },
    returns = { { name = "result", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["IsRestrictedAccount"] = {
    key = "IsRestrictedAccount",
    name = "IsRestrictedAccount",
    category = "general",
    subcategory = "global",
    func = _G["IsRestrictedAccount"],
    funcPath = "IsRestrictedAccount",
    params = {  },
    returns = { { name = "result", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["IsReverse"] = {
    key = "IsReverse",
    name = "IsReverse",
    category = "general",
    subcategory = "global",
    func = _G["IsReverse"],
    funcPath = "IsReverse",
    params = {  },
    returns = { { name = "isReverse", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["IsRightAltKeyDown"] = {
    key = "IsRightAltKeyDown",
    name = "IsRightAltKeyDown",
    category = "general",
    subcategory = "global",
    func = _G["IsRightAltKeyDown"],
    funcPath = "IsRightAltKeyDown",
    params = {  },
    returns = { { name = "down", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["IsRightControlKeyDown"] = {
    key = "IsRightControlKeyDown",
    name = "IsRightControlKeyDown",
    category = "general",
    subcategory = "global",
    func = _G["IsRightControlKeyDown"],
    funcPath = "IsRightControlKeyDown",
    params = {  },
    returns = { { name = "down", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["IsRightMetaKeyDown"] = {
    key = "IsRightMetaKeyDown",
    name = "IsRightMetaKeyDown",
    category = "general",
    subcategory = "global",
    func = _G["IsRightMetaKeyDown"],
    funcPath = "IsRightMetaKeyDown",
    params = {  },
    returns = { { name = "down", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["IsRightShiftKeyDown"] = {
    key = "IsRightShiftKeyDown",
    name = "IsRightShiftKeyDown",
    category = "general",
    subcategory = "global",
    func = _G["IsRightShiftKeyDown"],
    funcPath = "IsRightShiftKeyDown",
    params = {  },
    returns = { { name = "down", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["IsSearchInProgress"] = {
    key = "IsSearchInProgress",
    name = "IsSearchInProgress",
    category = "general",
    subcategory = "global",
    func = _G["IsSearchInProgress"],
    funcPath = "IsSearchInProgress",
    params = {  },
    returns = { { name = "isSearchInProgress", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["IsSelected"] = {
    key = "IsSelected",
    name = "IsSelected",
    category = "general",
    subcategory = "global",
    func = _G["IsSelected"],
    funcPath = "IsSelected",
    params = {  },
    returns = { { name = "isSelected", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["IsSetToFinalAlpha"] = {
    key = "IsSetToFinalAlpha",
    name = "IsSetToFinalAlpha",
    category = "general",
    subcategory = "global",
    func = _G["IsSetToFinalAlpha"],
    funcPath = "IsSetToFinalAlpha",
    params = {  },
    returns = { { name = "isSetToFinalAlpha", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["IsShiftKeyDown"] = {
    key = "IsShiftKeyDown",
    name = "IsShiftKeyDown",
    category = "general",
    subcategory = "global",
    func = _G["IsShiftKeyDown"],
    funcPath = "IsShiftKeyDown",
    params = {  },
    returns = { { name = "down", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["IsShown"] = {
    key = "IsShown",
    name = "IsShown",
    category = "general",
    subcategory = "global",
    func = _G["IsShown"],
    funcPath = "IsShown",
    params = {  },
    returns = { { name = "isShown", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["IsSlotAllowed"] = {
    key = "IsSlotAllowed",
    name = "IsSlotAllowed",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["IsSlotAllowed"],
    funcPath = "IsSlotAllowed",
    params = { { name = "inventorySlots", type = "number", default = nil } },
    returns = { { name = "allowed", type = "bool", canBeSecret = false } },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["IsSlotVisible"] = {
    key = "IsSlotVisible",
    name = "IsSlotVisible",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["IsSlotVisible"],
    funcPath = "IsSlotVisible",
    params = { { name = "inventorySlots", type = "number", default = nil } },
    returns = { { name = "visible", type = "bool", canBeSecret = false } },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["IsSnapshotValid"] = {
    key = "IsSnapshotValid",
    name = "IsSnapshotValid",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["IsSnapshotValid"],
    funcPath = "IsSnapshotValid",
    params = { { name = "snapshotID", type = "number", default = nil } },
    returns = { { name = "isValid", type = "bool", canBeSecret = false } },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["IsStealthed"] = {
    key = "IsStealthed",
    name = "IsStealthed",
    category = "general",
    subcategory = "global",
    func = _G["IsStealthed"],
    funcPath = "IsStealthed",
    params = {  },
    returns = { { name = "result", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["IsStopped"] = {
    key = "IsStopped",
    name = "IsStopped",
    category = "general",
    subcategory = "global",
    func = _G["IsStopped"],
    funcPath = "IsStopped",
    params = {  },
    returns = { { name = "isStopped", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["IsSubmerged"] = {
    key = "IsSubmerged",
    name = "IsSubmerged",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["IsSubmerged"],
    funcPath = "IsSubmerged",
    params = { { name = "unit", type = "UnitToken", default = "player" } },
    returns = { { name = "result", type = "bool", canBeSecret = false } },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["IsSwimming"] = {
    key = "IsSwimming",
    name = "IsSwimming",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["IsSwimming"],
    funcPath = "IsSwimming",
    params = { { name = "unit", type = "UnitToken", default = "player" } },
    returns = { { name = "result", type = "bool", canBeSecret = false } },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["IsTargetLoose"] = {
    key = "IsTargetLoose",
    name = "IsTargetLoose",
    category = "general",
    subcategory = "global",
    func = _G["IsTargetLoose"],
    funcPath = "IsTargetLoose",
    params = {  },
    returns = { { name = "isTargetLoose", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["IsTestBuild"] = {
    key = "IsTestBuild",
    name = "IsTestBuild",
    category = "general",
    subcategory = "global",
    func = _G["IsTestBuild"],
    funcPath = "IsTestBuild",
    params = {  },
    returns = { { name = "isTestBuild", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["IsThreatWarningEnabled"] = {
    key = "IsThreatWarningEnabled",
    name = "IsThreatWarningEnabled",
    category = "general",
    subcategory = "global",
    func = _G["IsThreatWarningEnabled"],
    funcPath = "IsThreatWarningEnabled",
    params = {  },
    returns = { { name = "result", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["IsTitleKnown"] = {
    key = "IsTitleKnown",
    name = "IsTitleKnown",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["IsTitleKnown"],
    funcPath = "IsTitleKnown",
    params = { { name = "titleMaskID", type = "number", default = nil } },
    returns = { { name = "result", type = "bool", canBeSecret = false } },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["IsTrialAccount"] = {
    key = "IsTrialAccount",
    name = "IsTrialAccount",
    category = "general",
    subcategory = "global",
    func = _G["IsTrialAccount"],
    funcPath = "IsTrialAccount",
    params = {  },
    returns = { { name = "isTrialAccount", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["IsUncollectedActive"] = {
    key = "IsUncollectedActive",
    name = "IsUncollectedActive",
    category = "general",
    subcategory = "global",
    func = _G["IsUncollectedActive"],
    funcPath = "IsUncollectedActive",
    params = {  },
    returns = { { name = "isActive", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["IsUnitModelReadyForUI"] = {
    key = "IsUnitModelReadyForUI",
    name = "IsUnitModelReadyForUI",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["IsUnitModelReadyForUI"],
    funcPath = "IsUnitModelReadyForUI",
    params = { { name = "unitToken", type = "UnitToken", default = "player" } },
    returns = { { name = "isReady", type = "bool", canBeSecret = false } },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["IsUsingCenterForOrigin"] = {
    key = "IsUsingCenterForOrigin",
    name = "IsUsingCenterForOrigin",
    category = "general",
    subcategory = "global",
    func = _G["IsUsingCenterForOrigin"],
    funcPath = "IsUsingCenterForOrigin",
    params = {  },
    returns = { { name = "x", type = "bool", canBeSecret = false }, { name = "y", type = "bool", canBeSecret = false }, { name = "z", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["IsUsingFixedTimeStep"] = {
    key = "IsUsingFixedTimeStep",
    name = "IsUsingFixedTimeStep",
    category = "general",
    subcategory = "global",
    func = _G["IsUsingFixedTimeStep"],
    funcPath = "IsUsingFixedTimeStep",
    params = {  },
    returns = { { name = "isUsingFixedTimeStep", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["IsUsingGamepad"] = {
    key = "IsUsingGamepad",
    name = "IsUsingGamepad",
    category = "general",
    subcategory = "global",
    func = _G["IsUsingGamepad"],
    funcPath = "IsUsingGamepad",
    params = {  },
    returns = { { name = "down", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["IsUsingModelCenterToTransform"] = {
    key = "IsUsingModelCenterToTransform",
    name = "IsUsingModelCenterToTransform",
    category = "general",
    subcategory = "global",
    func = _G["IsUsingModelCenterToTransform"],
    funcPath = "IsUsingModelCenterToTransform",
    params = {  },
    returns = { { name = "useCenter", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["IsUsingMouse"] = {
    key = "IsUsingMouse",
    name = "IsUsingMouse",
    category = "general",
    subcategory = "global",
    func = _G["IsUsingMouse"],
    funcPath = "IsUsingMouse",
    params = {  },
    returns = { { name = "down", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["IsValid"] = {
    key = "IsValid",
    name = "IsValid",
    category = "general",
    subcategory = "global",
    func = _G["IsValid"],
    funcPath = "IsValid",
    params = {  },
    returns = { { name = "isValid", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["IsValidForSelectedFloorplan"] = {
    key = "IsValidForSelectedFloorplan",
    name = "IsValidForSelectedFloorplan",
    category = "general",
    subcategory = "global",
    func = _G["IsValidForSelectedFloorplan"],
    funcPath = "IsValidForSelectedFloorplan",
    params = {  },
    returns = { { name = "isValid", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["IsVeteranTrialAccount"] = {
    key = "IsVeteranTrialAccount",
    name = "IsVeteranTrialAccount",
    category = "general",
    subcategory = "global",
    func = _G["IsVeteranTrialAccount"],
    funcPath = "IsVeteranTrialAccount",
    params = {  },
    returns = { { name = "isVeteranTrialAccount", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["IsVisible"] = {
    key = "IsVisible",
    name = "IsVisible",
    category = "general",
    subcategory = "global",
    func = _G["IsVisible"],
    funcPath = "IsVisible",
    params = {  },
    returns = { { name = "isVisible", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["IsWindowsClient"] = {
    key = "IsWindowsClient",
    name = "IsWindowsClient",
    category = "general",
    subcategory = "global",
    func = _G["IsWindowsClient"],
    funcPath = "IsWindowsClient",
    params = {  },
    returns = { { name = "isWindows", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["IsXPUserDisabled"] = {
    key = "IsXPUserDisabled",
    name = "IsXPUserDisabled",
    category = "general",
    subcategory = "global",
    func = _G["IsXPUserDisabled"],
    funcPath = "IsXPUserDisabled",
    params = {  },
    returns = { { name = "result", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["IsZero"] = {
    key = "IsZero",
    name = "IsZero",
    category = "general",
    subcategory = "global",
    func = _G["IsZero"],
    funcPath = "IsZero",
    params = {  },
    returns = { { name = "isZero", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["LaunchURL"] = {
    key = "LaunchURL",
    name = "LaunchURL",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["LaunchURL"],
    funcPath = "LaunchURL",
    params = { { name = "url", type = "cstring", default = nil } },
    returns = {  },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["LoadURLIndex"] = {
    key = "LoadURLIndex",
    name = "LoadURLIndex",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["LoadURLIndex"],
    funcPath = "LoadURLIndex",
    params = { { name = "index", type = "number", default = nil }, { name = "param", type = "number", default = nil } },
    returns = {  },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["LocalizedClassList"] = {
    key = "LocalizedClassList",
    name = "LocalizedClassList",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["LocalizedClassList"],
    funcPath = "LocalizedClassList",
    params = { { name = "isFemale", type = "bool", default = false } },
    returns = { { name = "result", type = "LuaValueVariant", canBeSecret = false } },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["Logout"] = {
    key = "Logout",
    name = "Logout",
    category = "general",
    subcategory = "global",
    func = _G["Logout"],
    funcPath = "Logout",
    params = {  },
    returns = {  },
    midnightImpact = "NORMAL",
}

APIDefs["MakeCurrentCameraCustom"] = {
    key = "MakeCurrentCameraCustom",
    name = "MakeCurrentCameraCustom",
    category = "general",
    subcategory = "global",
    func = _G["MakeCurrentCameraCustom"],
    funcPath = "MakeCurrentCameraCustom",
    params = {  },
    returns = {  },
    midnightImpact = "NORMAL",
}

APIDefs["Mixin"] = {
    key = "Mixin",
    name = "Mixin",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["Mixin"],
    funcPath = "Mixin",
    params = { { name = "object", type = "LuaValueVariant", default = nil }, { name = "mixins", type = "LuaValueVariant", default = nil } },
    returns = { { name = "outObject", type = "LuaValueVariant", canBeSecret = false } },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["MouseOverrideCinematicDisable"] = {
    key = "MouseOverrideCinematicDisable",
    name = "MouseOverrideCinematicDisable",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["MouseOverrideCinematicDisable"],
    funcPath = "MouseOverrideCinematicDisable",
    params = { { name = "doOverride", type = "bool", default = false } },
    returns = {  },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["NavigateBack"] = {
    key = "NavigateBack",
    name = "NavigateBack",
    category = "general",
    subcategory = "global",
    func = _G["NavigateBack"],
    funcPath = "NavigateBack",
    params = {  },
    returns = {  },
    midnightImpact = "NORMAL",
}

APIDefs["NavigateForward"] = {
    key = "NavigateForward",
    name = "NavigateForward",
    category = "general",
    subcategory = "global",
    func = _G["NavigateForward"],
    funcPath = "NavigateForward",
    params = {  },
    returns = {  },
    midnightImpact = "NORMAL",
}

APIDefs["NavigateHome"] = {
    key = "NavigateHome",
    name = "NavigateHome",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["NavigateHome"],
    funcPath = "NavigateHome",
    params = { { name = "urlType", type = "cstring", default = nil } },
    returns = {  },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["NavigateReload"] = {
    key = "NavigateReload",
    name = "NavigateReload",
    category = "general",
    subcategory = "global",
    func = _G["NavigateReload"],
    funcPath = "NavigateReload",
    params = {  },
    returns = {  },
    midnightImpact = "NORMAL",
}

APIDefs["NavigateStop"] = {
    key = "NavigateStop",
    name = "NavigateStop",
    category = "general",
    subcategory = "global",
    func = _G["NavigateStop"],
    funcPath = "NavigateStop",
    params = {  },
    returns = {  },
    midnightImpact = "NORMAL",
}

APIDefs["NoPlayTime"] = {
    key = "NoPlayTime",
    name = "NoPlayTime",
    category = "general",
    subcategory = "global",
    func = _G["NoPlayTime"],
    funcPath = "NoPlayTime",
    params = {  },
    returns = { { name = "result", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["NotWhileDeadError"] = {
    key = "NotWhileDeadError",
    name = "NotWhileDeadError",
    category = "general",
    subcategory = "global",
    func = _G["NotWhileDeadError"],
    funcPath = "NotWhileDeadError",
    params = {  },
    returns = {  },
    midnightImpact = "NORMAL",
}

APIDefs["NotifyInspect"] = {
    key = "NotifyInspect",
    name = "NotifyInspect",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["NotifyInspect"],
    funcPath = "NotifyInspect",
    params = { { name = "targetGUID", type = "UnitToken", default = "player" } },
    returns = {  },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["OpenCheckout"] = {
    key = "OpenCheckout",
    name = "OpenCheckout",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["OpenCheckout"],
    funcPath = "OpenCheckout",
    params = { { name = "checkoutID", type = "number", default = nil } },
    returns = { { name = "wasOpened", type = "bool", canBeSecret = false } },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["OpenExternalLink"] = {
    key = "OpenExternalLink",
    name = "OpenExternalLink",
    category = "general",
    subcategory = "global",
    func = _G["OpenExternalLink"],
    funcPath = "OpenExternalLink",
    params = {  },
    returns = {  },
    midnightImpact = "NORMAL",
}

APIDefs["OpenTicket"] = {
    key = "OpenTicket",
    name = "OpenTicket",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["OpenTicket"],
    funcPath = "OpenTicket",
    params = { { name = "index", type = "number", default = nil } },
    returns = {  },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["OpeningCinematic"] = {
    key = "OpeningCinematic",
    name = "OpeningCinematic",
    category = "general",
    subcategory = "global",
    func = _G["OpeningCinematic"],
    funcPath = "OpeningCinematic",
    params = {  },
    returns = {  },
    midnightImpact = "NORMAL",
}

APIDefs["OutageDetected"] = {
    key = "OutageDetected",
    name = "OutageDetected",
    category = "general",
    subcategory = "global",
    func = _G["OutageDetected"],
    funcPath = "OutageDetected",
    params = {  },
    returns = {  },
    midnightImpact = "NORMAL",
}

APIDefs["PartialPlayTime"] = {
    key = "PartialPlayTime",
    name = "PartialPlayTime",
    category = "general",
    subcategory = "global",
    func = _G["PartialPlayTime"],
    funcPath = "PartialPlayTime",
    params = {  },
    returns = { { name = "result", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["Pause"] = {
    key = "Pause",
    name = "Pause",
    category = "general",
    subcategory = "global",
    func = _G["Pause"],
    funcPath = "Pause",
    params = {  },
    returns = {  },
    midnightImpact = "NORMAL",
}

APIDefs["PickupPlayerMoney"] = {
    key = "PickupPlayerMoney",
    name = "PickupPlayerMoney",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["PickupPlayerMoney"],
    funcPath = "PickupPlayerMoney",
    params = { { name = "amount", type = "WOWMONEY", default = nil } },
    returns = {  },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["PingLocation"] = {
    key = "PingLocation",
    name = "PingLocation",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["PingLocation"],
    funcPath = "PingLocation",
    params = { { name = "locationX", type = "number", default = nil }, { name = "locationY", type = "number", default = nil } },
    returns = {  },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["PlaceRaidMarker"] = {
    key = "PlaceRaidMarker",
    name = "PlaceRaidMarker",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["PlaceRaidMarker"],
    funcPath = "PlaceRaidMarker",
    params = { { name = "index", type = "luaIndex", default = nil }, { name = "token", type = "cstring", default = nil } },
    returns = {  },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["Play"] = {
    key = "Play",
    name = "Play",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["Play"],
    funcPath = "Play",
    params = { { name = "reverse", type = "bool", default = false }, { name = "offset", type = "number", default = 0 } },
    returns = {  },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["PlayAnimKit"] = {
    key = "PlayAnimKit",
    name = "PlayAnimKit",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["PlayAnimKit"],
    funcPath = "PlayAnimKit",
    params = { { name = "animKit", type = "number", default = nil }, { name = "loop", type = "bool", default = false } },
    returns = {  },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["PlayAnimationKit"] = {
    key = "PlayAnimationKit",
    name = "PlayAnimationKit",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["PlayAnimationKit"],
    funcPath = "PlayAnimationKit",
    params = { { name = "animationKit", type = "number", default = nil }, { name = "isLooping", type = "bool", default = false } },
    returns = {  },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["PlayerCanTeleport"] = {
    key = "PlayerCanTeleport",
    name = "PlayerCanTeleport",
    category = "general",
    subcategory = "global",
    func = _G["PlayerCanTeleport"],
    funcPath = "PlayerCanTeleport",
    params = {  },
    returns = { { name = "result", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["PlayerEffectiveAttackPower"] = {
    key = "PlayerEffectiveAttackPower",
    name = "PlayerEffectiveAttackPower",
    category = "general",
    subcategory = "global",
    func = _G["PlayerEffectiveAttackPower"],
    funcPath = "PlayerEffectiveAttackPower",
    params = {  },
    returns = { { name = "mainHandAttackPower", type = "number", canBeSecret = false }, { name = "offHandAttackPower", type = "number", canBeSecret = false }, { name = "rangedAttackPower", type = "number", canBeSecret = false }, { name = "baseAttackPower", type = "number", canBeSecret = false }, { name = "baseRangedAttackPower", type = "number", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["PlayerGetTimerunningSeasonID"] = {
    key = "PlayerGetTimerunningSeasonID",
    name = "PlayerGetTimerunningSeasonID",
    category = "general",
    subcategory = "global",
    func = _G["PlayerGetTimerunningSeasonID"],
    funcPath = "PlayerGetTimerunningSeasonID",
    params = {  },
    returns = { { name = "timerunningSeasonID", type = "number", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["PlayerIsInCombat"] = {
    key = "PlayerIsInCombat",
    name = "PlayerIsInCombat",
    category = "general",
    subcategory = "global",
    func = _G["PlayerIsInCombat"],
    funcPath = "PlayerIsInCombat",
    params = {  },
    returns = { { name = "playerIsInCombat", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["PlayerIsPVPInactive"] = {
    key = "PlayerIsPVPInactive",
    name = "PlayerIsPVPInactive",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["PlayerIsPVPInactive"],
    funcPath = "PlayerIsPVPInactive",
    params = { { name = "unit", type = "UnitToken", default = "player" } },
    returns = { { name = "result", type = "bool", canBeSecret = false } },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["PlayerIsTimerunning"] = {
    key = "PlayerIsTimerunning",
    name = "PlayerIsTimerunning",
    category = "general",
    subcategory = "global",
    func = _G["PlayerIsTimerunning"],
    funcPath = "PlayerIsTimerunning",
    params = {  },
    returns = { { name = "playerIsTimerunning", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["PlayerVehicleHasComboPoints"] = {
    key = "PlayerVehicleHasComboPoints",
    name = "PlayerVehicleHasComboPoints",
    category = "general",
    subcategory = "global",
    func = _G["PlayerVehicleHasComboPoints"],
    funcPath = "PlayerVehicleHasComboPoints",
    params = {  },
    returns = { { name = "vehicleHasComboPoints", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["PortGraveyard"] = {
    key = "PortGraveyard",
    name = "PortGraveyard",
    category = "general",
    subcategory = "global",
    func = _G["PortGraveyard"],
    funcPath = "PortGraveyard",
    params = {  },
    returns = {  },
    midnightImpact = "NORMAL",
}

APIDefs["PreloadMovie"] = {
    key = "PreloadMovie",
    name = "PreloadMovie",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["PreloadMovie"],
    funcPath = "PreloadMovie",
    params = { { name = "movieId", type = "number", default = nil } },
    returns = {  },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["Project3DPointTo2D"] = {
    key = "Project3DPointTo2D",
    name = "Project3DPointTo2D",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["Project3DPointTo2D"],
    funcPath = "Project3DPointTo2D",
    params = { { name = "pointX", type = "number", default = nil }, { name = "pointY", type = "number", default = nil }, { name = "pointZ", type = "number", default = nil } },
    returns = { { name = "point2DX", type = "number", canBeSecret = false }, { name = "point2DY", type = "number", canBeSecret = false }, { name = "depth", type = "number", canBeSecret = false } },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["Quit"] = {
    key = "Quit",
    name = "Quit",
    category = "general",
    subcategory = "global",
    func = _G["Quit"],
    funcPath = "Quit",
    params = {  },
    returns = {  },
    midnightImpact = "NORMAL",
}

APIDefs["RandomRoll"] = {
    key = "RandomRoll",
    name = "RandomRoll",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["RandomRoll"],
    funcPath = "RandomRoll",
    params = { { name = "min", type = "number", default = nil }, { name = "max", type = "number", default = nil } },
    returns = {  },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["RefreshCamera"] = {
    key = "RefreshCamera",
    name = "RefreshCamera",
    category = "general",
    subcategory = "global",
    func = _G["RefreshCamera"],
    funcPath = "RefreshCamera",
    params = {  },
    returns = {  },
    midnightImpact = "NORMAL",
}

APIDefs["RefreshUnit"] = {
    key = "RefreshUnit",
    name = "RefreshUnit",
    category = "general",
    subcategory = "global",
    func = _G["RefreshUnit"],
    funcPath = "RefreshUnit",
    params = {  },
    returns = {  },
    midnightImpact = "NORMAL",
}

APIDefs["RegisterEventCallback"] = {
    key = "RegisterEventCallback",
    name = "RegisterEventCallback",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["RegisterEventCallback"],
    funcPath = "RegisterEventCallback",
    params = { { name = "eventName", type = "cstring", default = nil }, { name = "callback", type = "EventCallbackType", default = nil } },
    returns = {  },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["RegisterUnitEventCallback"] = {
    key = "RegisterUnitEventCallback",
    name = "RegisterUnitEventCallback",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["RegisterUnitEventCallback"],
    funcPath = "RegisterUnitEventCallback",
    params = { { name = "eventName", type = "cstring", default = nil }, { name = "callback", type = "EventCallbackType", default = nil }, { name = "unit", type = "UnitToken", default = "player" } },
    returns = {  },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["ReleaseFrontEndCharacterDisplays"] = {
    key = "ReleaseFrontEndCharacterDisplays",
    name = "ReleaseFrontEndCharacterDisplays",
    category = "general",
    subcategory = "global",
    func = _G["ReleaseFrontEndCharacterDisplays"],
    funcPath = "ReleaseFrontEndCharacterDisplays",
    params = {  },
    returns = { { name = "success", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["RemoveAnimations"] = {
    key = "RemoveAnimations",
    name = "RemoveAnimations",
    category = "general",
    subcategory = "global",
    func = _G["RemoveAnimations"],
    funcPath = "RemoveAnimations",
    params = {  },
    returns = {  },
    midnightImpact = "NORMAL",
}

APIDefs["RemoveMaskTexture"] = {
    key = "RemoveMaskTexture",
    name = "RemoveMaskTexture",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["RemoveMaskTexture"],
    funcPath = "RemoveMaskTexture",
    params = { { name = "mask", type = "SimpleMaskTexture", default = nil } },
    returns = {  },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["RemovePoint"] = {
    key = "RemovePoint",
    name = "RemovePoint",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["RemovePoint"],
    funcPath = "RemovePoint",
    params = { { name = "index", type = "luaIndex", default = nil } },
    returns = {  },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["RemoveRaidTargets"] = {
    key = "RemoveRaidTargets",
    name = "RemoveRaidTargets",
    category = "general",
    subcategory = "global",
    func = _G["RemoveRaidTargets"],
    funcPath = "RemoveRaidTargets",
    params = {  },
    returns = {  },
    midnightImpact = "NORMAL",
}

APIDefs["ReplaceIconTexture"] = {
    key = "ReplaceIconTexture",
    name = "ReplaceIconTexture",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["ReplaceIconTexture"],
    funcPath = "ReplaceIconTexture",
    params = { { name = "asset", type = "FileAsset", default = nil } },
    returns = {  },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["RepopMe"] = {
    key = "RepopMe",
    name = "RepopMe",
    category = "general",
    subcategory = "global",
    func = _G["RepopMe"],
    funcPath = "RepopMe",
    params = {  },
    returns = {  },
    midnightImpact = "NORMAL",
}

APIDefs["ReportBug"] = {
    key = "ReportBug",
    name = "ReportBug",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["ReportBug"],
    funcPath = "ReportBug",
    params = { { name = "description", type = "cstring", default = nil } },
    returns = {  },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["ReportPlayerIsPVPAFK"] = {
    key = "ReportPlayerIsPVPAFK",
    name = "ReportPlayerIsPVPAFK",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["ReportPlayerIsPVPAFK"],
    funcPath = "ReportPlayerIsPVPAFK",
    params = { { name = "unit", type = "UnitToken", default = "player" } },
    returns = {  },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["ReportSuggestion"] = {
    key = "ReportSuggestion",
    name = "ReportSuggestion",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["ReportSuggestion"],
    funcPath = "ReportSuggestion",
    params = { { name = "description", type = "cstring", default = nil } },
    returns = {  },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["RequestTimePlayed"] = {
    key = "RequestTimePlayed",
    name = "RequestTimePlayed",
    category = "general",
    subcategory = "global",
    func = _G["RequestTimePlayed"],
    funcPath = "RequestTimePlayed",
    params = {  },
    returns = {  },
    midnightImpact = "NORMAL",
}

APIDefs["Reset"] = {
    key = "Reset",
    name = "Reset",
    category = "general",
    subcategory = "global",
    func = _G["Reset"],
    funcPath = "Reset",
    params = {  },
    returns = {  },
    midnightImpact = "NORMAL",
}

APIDefs["ResetCPUUsage"] = {
    key = "ResetCPUUsage",
    name = "ResetCPUUsage",
    category = "general",
    subcategory = "global",
    func = _G["ResetCPUUsage"],
    funcPath = "ResetCPUUsage",
    params = {  },
    returns = {  },
    midnightImpact = "NORMAL",
}

APIDefs["ResetCursor"] = {
    key = "ResetCursor",
    name = "ResetCursor",
    category = "general",
    subcategory = "global",
    func = _G["ResetCursor"],
    funcPath = "ResetCursor",
    params = {  },
    returns = {  },
    midnightImpact = "NORMAL",
}

APIDefs["ResetInstances"] = {
    key = "ResetInstances",
    name = "ResetInstances",
    category = "general",
    subcategory = "global",
    func = _G["ResetInstances"],
    funcPath = "ResetInstances",
    params = {  },
    returns = {  },
    midnightImpact = "NORMAL",
}

APIDefs["ResetLights"] = {
    key = "ResetLights",
    name = "ResetLights",
    category = "general",
    subcategory = "global",
    func = _G["ResetLights"],
    funcPath = "ResetLights",
    params = {  },
    returns = {  },
    midnightImpact = "NORMAL",
}

APIDefs["ResetMessageFadeByID"] = {
    key = "ResetMessageFadeByID",
    name = "ResetMessageFadeByID",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["ResetMessageFadeByID"],
    funcPath = "ResetMessageFadeByID",
    params = { { name = "messageID", type = "number", default = nil } },
    returns = {  },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["ResetNextHandSlot"] = {
    key = "ResetNextHandSlot",
    name = "ResetNextHandSlot",
    category = "general",
    subcategory = "global",
    func = _G["ResetNextHandSlot"],
    funcPath = "ResetNextHandSlot",
    params = {  },
    returns = {  },
    midnightImpact = "NORMAL",
}

APIDefs["ResistancePercent"] = {
    key = "ResistancePercent",
    name = "ResistancePercent",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["ResistancePercent"],
    funcPath = "ResistancePercent",
    params = { { name = "resistance", type = "number", default = nil }, { name = "casterLevel", type = "number", default = nil } },
    returns = { { name = "result", type = "number", canBeSecret = false } },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["RespondInstanceLock"] = {
    key = "RespondInstanceLock",
    name = "RespondInstanceLock",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["RespondInstanceLock"],
    funcPath = "RespondInstanceLock",
    params = { { name = "acceptLock", type = "bool", default = nil } },
    returns = {  },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["Restart"] = {
    key = "Restart",
    name = "Restart",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["Restart"],
    funcPath = "Restart",
    params = { { name = "reverse", type = "bool", default = false }, { name = "offset", type = "number", default = 0 } },
    returns = {  },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["RestartGx"] = {
    key = "RestartGx",
    name = "RestartGx",
    category = "general",
    subcategory = "global",
    func = _G["RestartGx"],
    funcPath = "RestartGx",
    params = {  },
    returns = {  },
    midnightImpact = "NORMAL",
}

APIDefs["ResurrectGetOfferer"] = {
    key = "ResurrectGetOfferer",
    name = "ResurrectGetOfferer",
    category = "general",
    subcategory = "global",
    func = _G["ResurrectGetOfferer"],
    funcPath = "ResurrectGetOfferer",
    params = {  },
    returns = { { name = "name", type = "cstring", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["ResurrectHasSickness"] = {
    key = "ResurrectHasSickness",
    name = "ResurrectHasSickness",
    category = "general",
    subcategory = "global",
    func = _G["ResurrectHasSickness"],
    funcPath = "ResurrectHasSickness",
    params = {  },
    returns = { { name = "result", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["ResurrectHasTimer"] = {
    key = "ResurrectHasTimer",
    name = "ResurrectHasTimer",
    category = "general",
    subcategory = "global",
    func = _G["ResurrectHasTimer"],
    funcPath = "ResurrectHasTimer",
    params = {  },
    returns = { { name = "result", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["RetrieveCorpse"] = {
    key = "RetrieveCorpse",
    name = "RetrieveCorpse",
    category = "general",
    subcategory = "global",
    func = _G["RetrieveCorpse"],
    funcPath = "RetrieveCorpse",
    params = {  },
    returns = {  },
    midnightImpact = "NORMAL",
}

APIDefs["RunScript"] = {
    key = "RunScript",
    name = "RunScript",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["RunScript"],
    funcPath = "RunScript",
    params = { { name = "text", type = "cstring", default = nil } },
    returns = {  },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["RunSearch"] = {
    key = "RunSearch",
    name = "RunSearch",
    category = "general",
    subcategory = "global",
    func = _G["RunSearch"],
    funcPath = "RunSearch",
    params = {  },
    returns = {  },
    midnightImpact = "NORMAL",
}

APIDefs["Save"] = {
    key = "Save",
    name = "Save",
    category = "general",
    subcategory = "global",
    func = _G["Save"],
    funcPath = "Save",
    params = {  },
    returns = {  },
    midnightImpact = "NORMAL",
}

APIDefs["Screenshot"] = {
    key = "Screenshot",
    name = "Screenshot",
    category = "general",
    subcategory = "global",
    func = _G["Screenshot"],
    funcPath = "Screenshot",
    params = {  },
    returns = {  },
    midnightImpact = "NORMAL",
}

APIDefs["Select"] = {
    key = "Select",
    name = "Select",
    category = "general",
    subcategory = "global",
    func = _G["Select"],
    funcPath = "Select",
    params = {  },
    returns = {  },
    midnightImpact = "NORMAL",
}

APIDefs["SelectedRealmName"] = {
    key = "SelectedRealmName",
    name = "SelectedRealmName",
    category = "general",
    subcategory = "global",
    func = _G["SelectedRealmName"],
    funcPath = "SelectedRealmName",
    params = {  },
    returns = { { name = "selectedRealmName", type = "cstring", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["SellCursorItem"] = {
    key = "SellCursorItem",
    name = "SellCursorItem",
    category = "general",
    subcategory = "global",
    func = _G["SellCursorItem"],
    funcPath = "SellCursorItem",
    params = {  },
    returns = {  },
    midnightImpact = "NORMAL",
}

APIDefs["SendSubscriptionInterstitialResponse"] = {
    key = "SendSubscriptionInterstitialResponse",
    name = "SendSubscriptionInterstitialResponse",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["SendSubscriptionInterstitialResponse"],
    funcPath = "SendSubscriptionInterstitialResponse",
    params = { { name = "response", type = "SubscriptionInterstitialResponseType", default = nil } },
    returns = {  },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["SetAbbreviateNumberData"] = {
    key = "SetAbbreviateNumberData",
    name = "SetAbbreviateNumberData",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["SetAbbreviateNumberData"],
    funcPath = "SetAbbreviateNumberData",
    params = { { name = "data", type = "table", default = nil } },
    returns = {  },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=NotAllowed",
}

APIDefs["SetAllInFilterTagGroup"] = {
    key = "SetAllInFilterTagGroup",
    name = "SetAllInFilterTagGroup",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["SetAllInFilterTagGroup"],
    funcPath = "SetAllInFilterTagGroup",
    params = { { name = "groupID", type = "number", default = nil }, { name = "active", type = "bool", default = nil } },
    returns = {  },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["SetAllPoints"] = {
    key = "SetAllPoints",
    name = "SetAllPoints",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["SetAllPoints"],
    funcPath = "SetAllPoints",
    params = { { name = "relativeTo", type = "ScriptRegion", default = nil }, { name = "doResize", type = "bool", default = true } },
    returns = {  },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["SetAllowDangerousScripts"] = {
    key = "SetAllowDangerousScripts",
    name = "SetAllowDangerousScripts",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["SetAllowDangerousScripts"],
    funcPath = "SetAllowDangerousScripts",
    params = { { name = "allowed", type = "bool", default = false } },
    returns = {  },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["SetAllowLowLevelRaid"] = {
    key = "SetAllowLowLevelRaid",
    name = "SetAllowLowLevelRaid",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["SetAllowLowLevelRaid"],
    funcPath = "SetAllowLowLevelRaid",
    params = { { name = "allow", type = "bool", default = false } },
    returns = {  },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["SetAllowOverlappedModels"] = {
    key = "SetAllowOverlappedModels",
    name = "SetAllowOverlappedModels",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["SetAllowOverlappedModels"],
    funcPath = "SetAllowOverlappedModels",
    params = { { name = "allowOverlappedModels", type = "bool", default = nil } },
    returns = {  },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["SetAllowRecentAlliesSeeLocation"] = {
    key = "SetAllowRecentAlliesSeeLocation",
    name = "SetAllowRecentAlliesSeeLocation",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["SetAllowRecentAlliesSeeLocation"],
    funcPath = "SetAllowRecentAlliesSeeLocation",
    params = { { name = "allowRecentAlliesSeeLocation", type = "bool", default = nil } },
    returns = {  },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["SetAllowedIndoors"] = {
    key = "SetAllowedIndoors",
    name = "SetAllowedIndoors",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["SetAllowedIndoors"],
    funcPath = "SetAllowedIndoors",
    params = { { name = "isActive", type = "bool", default = nil } },
    returns = {  },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["SetAllowedOutdoors"] = {
    key = "SetAllowedOutdoors",
    name = "SetAllowedOutdoors",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["SetAllowedOutdoors"],
    funcPath = "SetAllowedOutdoors",
    params = { { name = "isActive", type = "bool", default = nil } },
    returns = {  },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["SetAlpha"] = {
    key = "SetAlpha",
    name = "SetAlpha",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["SetAlpha"],
    funcPath = "SetAlpha",
    params = { { name = "alpha", type = "SingleColorValue", default = nil } },
    returns = {  },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["SetAnimOffset"] = {
    key = "SetAnimOffset",
    name = "SetAnimOffset",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["SetAnimOffset"],
    funcPath = "SetAnimOffset",
    params = { { name = "offset", type = "number", default = nil } },
    returns = {  },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["SetAnimation"] = {
    key = "SetAnimation",
    name = "SetAnimation",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["SetAnimation"],
    funcPath = "SetAnimation",
    params = { { name = "animation", type = "AnimationDataEnum", default = nil }, { name = "variation", type = "number", default = nil }, { name = "animSpeed", type = "number", default = 1 }, { name = "animOffsetSeconds", type = "number", default = 0 } },
    returns = {  },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["SetAnimationBlendOperation"] = {
    key = "SetAnimationBlendOperation",
    name = "SetAnimationBlendOperation",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["SetAnimationBlendOperation"],
    funcPath = "SetAnimationBlendOperation",
    params = { { name = "blendOp", type = "ModelBlendOperation", default = nil } },
    returns = {  },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["SetAnimationSpeedMultiplier"] = {
    key = "SetAnimationSpeedMultiplier",
    name = "SetAnimationSpeedMultiplier",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["SetAnimationSpeedMultiplier"],
    funcPath = "SetAnimationSpeedMultiplier",
    params = { { name = "animationSpeedMultiplier", type = "number", default = nil } },
    returns = {  },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["SetArchBlobInsideAlpha"] = {
    key = "SetArchBlobInsideAlpha",
    name = "SetArchBlobInsideAlpha",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["SetArchBlobInsideAlpha"],
    funcPath = "SetArchBlobInsideAlpha",
    params = { { name = "alpha", type = "number", default = nil } },
    returns = {  },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["SetArchBlobInsideTexture"] = {
    key = "SetArchBlobInsideTexture",
    name = "SetArchBlobInsideTexture",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["SetArchBlobInsideTexture"],
    funcPath = "SetArchBlobInsideTexture",
    params = { { name = "asset", type = "TextureAsset", default = nil } },
    returns = {  },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["SetArchBlobOutsideAlpha"] = {
    key = "SetArchBlobOutsideAlpha",
    name = "SetArchBlobOutsideAlpha",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["SetArchBlobOutsideAlpha"],
    funcPath = "SetArchBlobOutsideAlpha",
    params = { { name = "alpha", type = "number", default = nil } },
    returns = {  },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["SetArchBlobOutsideTexture"] = {
    key = "SetArchBlobOutsideTexture",
    name = "SetArchBlobOutsideTexture",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["SetArchBlobOutsideTexture"],
    funcPath = "SetArchBlobOutsideTexture",
    params = { { name = "asset", type = "TextureAsset", default = nil } },
    returns = {  },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["SetArchBlobRingAlpha"] = {
    key = "SetArchBlobRingAlpha",
    name = "SetArchBlobRingAlpha",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["SetArchBlobRingAlpha"],
    funcPath = "SetArchBlobRingAlpha",
    params = { { name = "alpha", type = "number", default = nil } },
    returns = {  },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["SetArchBlobRingScalar"] = {
    key = "SetArchBlobRingScalar",
    name = "SetArchBlobRingScalar",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["SetArchBlobRingScalar"],
    funcPath = "SetArchBlobRingScalar",
    params = { { name = "scalar", type = "number", default = nil } },
    returns = {  },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["SetArchBlobRingTexture"] = {
    key = "SetArchBlobRingTexture",
    name = "SetArchBlobRingTexture",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["SetArchBlobRingTexture"],
    funcPath = "SetArchBlobRingTexture",
    params = { { name = "asset", type = "TextureAsset", default = nil } },
    returns = {  },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["SetAutoDeclineGuildInvites"] = {
    key = "SetAutoDeclineGuildInvites",
    name = "SetAutoDeclineGuildInvites",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["SetAutoDeclineGuildInvites"],
    funcPath = "SetAutoDeclineGuildInvites",
    params = { { name = "allow", type = "bool", default = false } },
    returns = {  },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["SetAutoDeclineNeighborhoodInvites"] = {
    key = "SetAutoDeclineNeighborhoodInvites",
    name = "SetAutoDeclineNeighborhoodInvites",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["SetAutoDeclineNeighborhoodInvites"],
    funcPath = "SetAutoDeclineNeighborhoodInvites",
    params = { { name = "allow", type = "bool", default = false } },
    returns = {  },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["SetAutoDress"] = {
    key = "SetAutoDress",
    name = "SetAutoDress",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["SetAutoDress"],
    funcPath = "SetAutoDress",
    params = { { name = "autoDress", type = "bool", default = nil } },
    returns = {  },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["SetAutoUpdateOnParamChanges"] = {
    key = "SetAutoUpdateOnParamChanges",
    name = "SetAutoUpdateOnParamChanges",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["SetAutoUpdateOnParamChanges"],
    funcPath = "SetAutoUpdateOnParamChanges",
    params = { { name = "autoUpdateActive", type = "bool", default = nil } },
    returns = {  },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["SetBarberShopAlternateForm"] = {
    key = "SetBarberShopAlternateForm",
    name = "SetBarberShopAlternateForm",
    category = "general",
    subcategory = "global",
    func = _G["SetBarberShopAlternateForm"],
    funcPath = "SetBarberShopAlternateForm",
    params = {  },
    returns = {  },
    midnightImpact = "NORMAL",
}

APIDefs["SetBlipTexture"] = {
    key = "SetBlipTexture",
    name = "SetBlipTexture",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["SetBlipTexture"],
    funcPath = "SetBlipTexture",
    params = { { name = "asset", type = "TextureAsset", default = nil } },
    returns = {  },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["SetBorderAlpha"] = {
    key = "SetBorderAlpha",
    name = "SetBorderAlpha",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["SetBorderAlpha"],
    funcPath = "SetBorderAlpha",
    params = { { name = "alpha", type = "number", default = nil } },
    returns = {  },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["SetBorderScalar"] = {
    key = "SetBorderScalar",
    name = "SetBorderScalar",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["SetBorderScalar"],
    funcPath = "SetBorderScalar",
    params = { { name = "scalar", type = "number", default = nil } },
    returns = {  },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["SetBorderTexture"] = {
    key = "SetBorderTexture",
    name = "SetBorderTexture",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["SetBorderTexture"],
    funcPath = "SetBorderTexture",
    params = { { name = "asset", type = "FileAsset", default = nil } },
    returns = {  },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["SetCamDistanceScale"] = {
    key = "SetCamDistanceScale",
    name = "SetCamDistanceScale",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["SetCamDistanceScale"],
    funcPath = "SetCamDistanceScale",
    params = { { name = "scale", type = "number", default = nil } },
    returns = {  },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["SetCamera"] = {
    key = "SetCamera",
    name = "SetCamera",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["SetCamera"],
    funcPath = "SetCamera",
    params = { { name = "cameraIndex", type = "number", default = nil } },
    returns = {  },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["SetCameraDistance"] = {
    key = "SetCameraDistance",
    name = "SetCameraDistance",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["SetCameraDistance"],
    funcPath = "SetCameraDistance",
    params = { { name = "distance", type = "number", default = nil } },
    returns = {  },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["SetCameraFacing"] = {
    key = "SetCameraFacing",
    name = "SetCameraFacing",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["SetCameraFacing"],
    funcPath = "SetCameraFacing",
    params = { { name = "radians", type = "number", default = nil } },
    returns = {  },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["SetCameraFarClip"] = {
    key = "SetCameraFarClip",
    name = "SetCameraFarClip",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["SetCameraFarClip"],
    funcPath = "SetCameraFarClip",
    params = { { name = "farClip", type = "number", default = nil } },
    returns = {  },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["SetCameraFieldOfView"] = {
    key = "SetCameraFieldOfView",
    name = "SetCameraFieldOfView",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["SetCameraFieldOfView"],
    funcPath = "SetCameraFieldOfView",
    params = { { name = "fov", type = "number", default = nil } },
    returns = {  },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["SetCameraNearClip"] = {
    key = "SetCameraNearClip",
    name = "SetCameraNearClip",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["SetCameraNearClip"],
    funcPath = "SetCameraNearClip",
    params = { { name = "nearClip", type = "number", default = nil } },
    returns = {  },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["SetCameraOrientationByAxisVectors"] = {
    key = "SetCameraOrientationByAxisVectors",
    name = "SetCameraOrientationByAxisVectors",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["SetCameraOrientationByAxisVectors"],
    funcPath = "SetCameraOrientationByAxisVectors",
    params = { { name = "forwardX", type = "number", default = nil }, { name = "forwardY", type = "number", default = nil }, { name = "forwardZ", type = "number", default = nil }, { name = "rightX", type = "number", default = nil }, { name = "rightY", type = "number", default = nil }, { name = "rightZ", type = "number", default = nil }, { name = "upX", type = "number", default = nil }, { name = "upY", type = "number", default = nil }, { name = "upZ", type = "number", default = nil } },
    returns = {  },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["SetCameraOrientationByYawPitchRoll"] = {
    key = "SetCameraOrientationByYawPitchRoll",
    name = "SetCameraOrientationByYawPitchRoll",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["SetCameraOrientationByYawPitchRoll"],
    funcPath = "SetCameraOrientationByYawPitchRoll",
    params = { { name = "yaw", type = "number", default = nil }, { name = "pitch", type = "number", default = nil }, { name = "roll", type = "number", default = nil } },
    returns = {  },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["SetCameraPosition"] = {
    key = "SetCameraPosition",
    name = "SetCameraPosition",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["SetCameraPosition"],
    funcPath = "SetCameraPosition",
    params = { { name = "positionX", type = "number", default = nil }, { name = "positionY", type = "number", default = nil }, { name = "positionZ", type = "number", default = nil } },
    returns = {  },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["SetCameraRoll"] = {
    key = "SetCameraRoll",
    name = "SetCameraRoll",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["SetCameraRoll"],
    funcPath = "SetCameraRoll",
    params = { { name = "radians", type = "number", default = nil } },
    returns = {  },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["SetCameraTarget"] = {
    key = "SetCameraTarget",
    name = "SetCameraTarget",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["SetCameraTarget"],
    funcPath = "SetCameraTarget",
    params = { { name = "targetX", type = "number", default = nil }, { name = "targetY", type = "number", default = nil }, { name = "targetZ", type = "number", default = nil } },
    returns = {  },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["SetCemeteryPreference"] = {
    key = "SetCemeteryPreference",
    name = "SetCemeteryPreference",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["SetCemeteryPreference"],
    funcPath = "SetCemeteryPreference",
    params = { { name = "cemetaryID", type = "number", default = nil } },
    returns = {  },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["SetChecked"] = {
    key = "SetChecked",
    name = "SetChecked",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["SetChecked"],
    funcPath = "SetChecked",
    params = { { name = "checked", type = "bool", default = false } },
    returns = {  },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["SetCheckedTexture"] = {
    key = "SetCheckedTexture",
    name = "SetCheckedTexture",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["SetCheckedTexture"],
    funcPath = "SetCheckedTexture",
    params = { { name = "asset", type = "TextureAsset", default = nil } },
    returns = {  },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["SetChildKey"] = {
    key = "SetChildKey",
    name = "SetChildKey",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["SetChildKey"],
    funcPath = "SetChildKey",
    params = { { name = "childKey", type = "cstring", default = nil } },
    returns = { { name = "success", type = "bool", canBeSecret = false } },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["SetCollected"] = {
    key = "SetCollected",
    name = "SetCollected",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["SetCollected"],
    funcPath = "SetCollected",
    params = { { name = "isActive", type = "bool", default = nil } },
    returns = {  },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["SetColorAlpha"] = {
    key = "SetColorAlpha",
    name = "SetColorAlpha",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["SetColorAlpha"],
    funcPath = "SetColorAlpha",
    params = { { name = "alpha", type = "number", default = nil } },
    returns = {  },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=NotAllowed",
}

APIDefs["SetColorAlphaTexture"] = {
    key = "SetColorAlphaTexture",
    name = "SetColorAlphaTexture",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["SetColorAlphaTexture"],
    funcPath = "SetColorAlphaTexture",
    params = { { name = "texture", type = "SimpleTexture", default = nil } },
    returns = {  },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["SetColorAlphaThumbTexture"] = {
    key = "SetColorAlphaThumbTexture",
    name = "SetColorAlphaThumbTexture",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["SetColorAlphaThumbTexture"],
    funcPath = "SetColorAlphaThumbTexture",
    params = { { name = "texture", type = "TextureAsset", default = nil } },
    returns = {  },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["SetColorHSV"] = {
    key = "SetColorHSV",
    name = "SetColorHSV",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["SetColorHSV"],
    funcPath = "SetColorHSV",
    params = { { name = "hsvX", type = "number", default = nil }, { name = "hsvY", type = "number", default = nil }, { name = "hsvZ", type = "number", default = nil } },
    returns = {  },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=NotAllowed",
}

APIDefs["SetColorRGB"] = {
    key = "SetColorRGB",
    name = "SetColorRGB",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["SetColorRGB"],
    funcPath = "SetColorRGB",
    params = { { name = "rgbR", type = "number", default = nil }, { name = "rgbG", type = "number", default = nil }, { name = "rgbB", type = "number", default = nil } },
    returns = {  },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=NotAllowed",
}

APIDefs["SetColorValueTexture"] = {
    key = "SetColorValueTexture",
    name = "SetColorValueTexture",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["SetColorValueTexture"],
    funcPath = "SetColorValueTexture",
    params = { { name = "texture", type = "SimpleTexture", default = nil } },
    returns = {  },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["SetColorValueThumbTexture"] = {
    key = "SetColorValueThumbTexture",
    name = "SetColorValueThumbTexture",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["SetColorValueThumbTexture"],
    funcPath = "SetColorValueThumbTexture",
    params = { { name = "texture", type = "TextureAsset", default = nil } },
    returns = {  },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["SetColorWheelTexture"] = {
    key = "SetColorWheelTexture",
    name = "SetColorWheelTexture",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["SetColorWheelTexture"],
    funcPath = "SetColorWheelTexture",
    params = { { name = "texture", type = "SimpleTexture", default = nil } },
    returns = {  },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["SetColorWheelThumbTexture"] = {
    key = "SetColorWheelThumbTexture",
    name = "SetColorWheelThumbTexture",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["SetColorWheelThumbTexture"],
    funcPath = "SetColorWheelThumbTexture",
    params = { { name = "texture", type = "TextureAsset", default = nil } },
    returns = {  },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["SetConsoleKey"] = {
    key = "SetConsoleKey",
    name = "SetConsoleKey",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["SetConsoleKey"],
    funcPath = "SetConsoleKey",
    params = { { name = "keystring", type = "cstring", default = nil } },
    returns = {  },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["SetCorpsePOIArrowTexture"] = {
    key = "SetCorpsePOIArrowTexture",
    name = "SetCorpsePOIArrowTexture",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["SetCorpsePOIArrowTexture"],
    funcPath = "SetCorpsePOIArrowTexture",
    params = { { name = "asset", type = "TextureAsset", default = nil } },
    returns = {  },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["SetCreature"] = {
    key = "SetCreature",
    name = "SetCreature",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["SetCreature"],
    funcPath = "SetCreature",
    params = { { name = "creatureID", type = "number", default = nil }, { name = "displayID", type = "number", default = 0 } },
    returns = {  },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["SetCreatureData"] = {
    key = "SetCreatureData",
    name = "SetCreatureData",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["SetCreatureData"],
    funcPath = "SetCreatureData",
    params = { { name = "creatureID", type = "number", default = nil } },
    returns = {  },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["SetCurrentTitle"] = {
    key = "SetCurrentTitle",
    name = "SetCurrentTitle",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["SetCurrentTitle"],
    funcPath = "SetCurrentTitle",
    params = { { name = "titleMaskID", type = "number", default = nil } },
    returns = {  },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["SetCursor"] = {
    key = "SetCursor",
    name = "SetCursor",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["SetCursor"],
    funcPath = "SetCursor",
    params = { { name = "name", type = "cstring", default = nil } },
    returns = { { name = "result", type = "bool", canBeSecret = false } },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["SetCursorByMode"] = {
    key = "SetCursorByMode",
    name = "SetCursorByMode",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["SetCursorByMode"],
    funcPath = "SetCursorByMode",
    params = { { name = "mode", type = "Cursormode", default = nil } },
    returns = { { name = "result", type = "bool", canBeSecret = false } },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["SetCursorHoveredItem"] = {
    key = "SetCursorHoveredItem",
    name = "SetCursorHoveredItem",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["SetCursorHoveredItem"],
    funcPath = "SetCursorHoveredItem",
    params = { { name = "item", type = "ItemLocation", default = nil } },
    returns = {  },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["SetCursorHoveredItemTradeItem"] = {
    key = "SetCursorHoveredItemTradeItem",
    name = "SetCursorHoveredItemTradeItem",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["SetCursorHoveredItemTradeItem"],
    funcPath = "SetCursorHoveredItemTradeItem",
    params = { { name = "enabled", type = "bool", default = nil } },
    returns = {  },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["SetCursorPosition"] = {
    key = "SetCursorPosition",
    name = "SetCursorPosition",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["SetCursorPosition"],
    funcPath = "SetCursorPosition",
    params = { { name = "xPosition", type = "uiUnit", default = nil }, { name = "yPosition", type = "uiUnit", default = nil } },
    returns = {  },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["SetCursorVirtualItem"] = {
    key = "SetCursorVirtualItem",
    name = "SetCursorVirtualItem",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["SetCursorVirtualItem"],
    funcPath = "SetCursorVirtualItem",
    params = { { name = "itemInfo", type = "ItemInfo", default = nil }, { name = "cursorType", type = "UICursorType", default = nil } },
    returns = {  },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["SetCurveType"] = {
    key = "SetCurveType",
    name = "SetCurveType",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["SetCurveType"],
    funcPath = "SetCurveType",
    params = { { name = "curveType", type = "CurveType", default = nil } },
    returns = {  },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["SetCustomCamera"] = {
    key = "SetCustomCamera",
    name = "SetCustomCamera",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["SetCustomCamera"],
    funcPath = "SetCustomCamera",
    params = { { name = "cameraIndex", type = "number", default = nil } },
    returns = {  },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["SetCustomizableOnly"] = {
    key = "SetCustomizableOnly",
    name = "SetCustomizableOnly",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["SetCustomizableOnly"],
    funcPath = "SetCustomizableOnly",
    params = { { name = "isActive", type = "bool", default = nil } },
    returns = {  },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["SetDamageAbsorbClampMode"] = {
    key = "SetDamageAbsorbClampMode",
    name = "SetDamageAbsorbClampMode",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["SetDamageAbsorbClampMode"],
    funcPath = "SetDamageAbsorbClampMode",
    params = { { name = "damageAbsorbClampMode", type = "UnitDamageAbsorbClampMode", default = nil } },
    returns = {  },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=NotAllowed",
}

APIDefs["SetDegrees"] = {
    key = "SetDegrees",
    name = "SetDegrees",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["SetDegrees"],
    funcPath = "SetDegrees",
    params = { { name = "angle", type = "number", default = nil } },
    returns = {  },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["SetDesaturation"] = {
    key = "SetDesaturation",
    name = "SetDesaturation",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["SetDesaturation"],
    funcPath = "SetDesaturation",
    params = { { name = "strength", type = "number", default = nil } },
    returns = {  },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["SetDisabledCheckedTexture"] = {
    key = "SetDisabledCheckedTexture",
    name = "SetDisabledCheckedTexture",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["SetDisabledCheckedTexture"],
    funcPath = "SetDisabledCheckedTexture",
    params = { { name = "asset", type = "TextureAsset", default = nil } },
    returns = {  },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["SetDisplayInfo"] = {
    key = "SetDisplayInfo",
    name = "SetDisplayInfo",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["SetDisplayInfo"],
    funcPath = "SetDisplayInfo",
    params = { { name = "displayID", type = "number", default = nil }, { name = "mountDisplayID", type = "number", default = nil } },
    returns = {  },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["SetDoBlend"] = {
    key = "SetDoBlend",
    name = "SetDoBlend",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["SetDoBlend"],
    funcPath = "SetDoBlend",
    params = { { name = "doBlend", type = "bool", default = false } },
    returns = {  },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["SetDrawLayer"] = {
    key = "SetDrawLayer",
    name = "SetDrawLayer",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["SetDrawLayer"],
    funcPath = "SetDrawLayer",
    params = { { name = "layer", type = "DrawLayer", default = nil } },
    returns = {  },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["SetDungeonDifficultyID"] = {
    key = "SetDungeonDifficultyID",
    name = "SetDungeonDifficultyID",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["SetDungeonDifficultyID"],
    funcPath = "SetDungeonDifficultyID",
    params = { { name = "difficultyID", type = "number", default = nil } },
    returns = {  },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["SetDuration"] = {
    key = "SetDuration",
    name = "SetDuration",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["SetDuration"],
    funcPath = "SetDuration",
    params = { { name = "durationSec", type = "number", default = nil }, { name = "recomputeGroupDuration", type = "bool", default = true } },
    returns = {  },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["SetEditorModeContext"] = {
    key = "SetEditorModeContext",
    name = "SetEditorModeContext",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["SetEditorModeContext"],
    funcPath = "SetEditorModeContext",
    params = { { name = "editorModeContext", type = "HouseEditorMode", default = nil } },
    returns = {  },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["SetEnabled"] = {
    key = "SetEnabled",
    name = "SetEnabled",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["SetEnabled"],
    funcPath = "SetEnabled",
    params = { { name = "enabled", type = "bool", default = nil } },
    returns = {  },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["SetEndColor"] = {
    key = "SetEndColor",
    name = "SetEndColor",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["SetEndColor"],
    funcPath = "SetEndColor",
    params = { { name = "color", type = "colorRGBA", default = nil } },
    returns = {  },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenTainted",
}

APIDefs["SetEndDelay"] = {
    key = "SetEndDelay",
    name = "SetEndDelay",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["SetEndDelay"],
    funcPath = "SetEndDelay",
    params = { { name = "delaySec", type = "number", default = nil }, { name = "recomputeGroupDuration", type = "bool", default = true } },
    returns = {  },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=NotAllowed",
}

APIDefs["SetEndPoint"] = {
    key = "SetEndPoint",
    name = "SetEndPoint",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["SetEndPoint"],
    funcPath = "SetEndPoint",
    params = { { name = "relativePoint", type = "FramePoint", default = nil }, { name = "relativeTo", type = "ScriptRegion", default = nil }, { name = "offsetX", type = "uiUnit", default = 0 }, { name = "offsetY", type = "uiUnit", default = 0 } },
    returns = {  },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["SetErrorCallstackHeight"] = {
    key = "SetErrorCallstackHeight",
    name = "SetErrorCallstackHeight",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["SetErrorCallstackHeight"],
    funcPath = "SetErrorCallstackHeight",
    params = { { name = "height", type = "number", default = nil } },
    returns = {  },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["SetEuropeanNumbers"] = {
    key = "SetEuropeanNumbers",
    name = "SetEuropeanNumbers",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["SetEuropeanNumbers"],
    funcPath = "SetEuropeanNumbers",
    params = { { name = "enabled", type = "bool", default = nil } },
    returns = {  },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["SetFacing"] = {
    key = "SetFacing",
    name = "SetFacing",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["SetFacing"],
    funcPath = "SetFacing",
    params = { { name = "facing", type = "number", default = nil } },
    returns = {  },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["SetFacingLeft"] = {
    key = "SetFacingLeft",
    name = "SetFacingLeft",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["SetFacingLeft"],
    funcPath = "SetFacingLeft",
    params = { { name = "isFacingLeft", type = "bool", default = false } },
    returns = {  },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["SetFadeDuration"] = {
    key = "SetFadeDuration",
    name = "SetFadeDuration",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["SetFadeDuration"],
    funcPath = "SetFadeDuration",
    params = { { name = "fadeDurationSeconds", type = "number", default = nil } },
    returns = {  },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["SetFadePower"] = {
    key = "SetFadePower",
    name = "SetFadePower",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["SetFadePower"],
    funcPath = "SetFadePower",
    params = { { name = "fadePower", type = "number", default = nil } },
    returns = {  },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["SetFadeTimes"] = {
    key = "SetFadeTimes",
    name = "SetFadeTimes",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["SetFadeTimes"],
    funcPath = "SetFadeTimes",
    params = { { name = "fadeInSeconds", type = "number", default = nil }, { name = "fadeOutSeconds", type = "number", default = nil } },
    returns = {  },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["SetFading"] = {
    key = "SetFading",
    name = "SetFading",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["SetFading"],
    funcPath = "SetFading",
    params = { { name = "fading", type = "bool", default = nil } },
    returns = {  },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["SetFillAlpha"] = {
    key = "SetFillAlpha",
    name = "SetFillAlpha",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["SetFillAlpha"],
    funcPath = "SetFillAlpha",
    params = { { name = "alpha", type = "number", default = nil } },
    returns = {  },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["SetFillTexture"] = {
    key = "SetFillTexture",
    name = "SetFillTexture",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["SetFillTexture"],
    funcPath = "SetFillTexture",
    params = { { name = "asset", type = "FileAsset", default = nil } },
    returns = {  },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["SetFilterTagStatus"] = {
    key = "SetFilterTagStatus",
    name = "SetFilterTagStatus",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["SetFilterTagStatus"],
    funcPath = "SetFilterTagStatus",
    params = { { name = "groupID", type = "number", default = nil }, { name = "tagID", type = "number", default = nil }, { name = "active", type = "bool", default = nil } },
    returns = {  },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["SetFilteredCategoryID"] = {
    key = "SetFilteredCategoryID",
    name = "SetFilteredCategoryID",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["SetFilteredCategoryID"],
    funcPath = "SetFilteredCategoryID",
    params = { { name = "categoryID", type = "number", default = nil } },
    returns = {  },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["SetFilteredSubcategoryID"] = {
    key = "SetFilteredSubcategoryID",
    name = "SetFilteredSubcategoryID",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["SetFilteredSubcategoryID"],
    funcPath = "SetFilteredSubcategoryID",
    params = { { name = "subcategoryID", type = "number", default = nil } },
    returns = {  },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["SetFirstAcquisitionBonusOnly"] = {
    key = "SetFirstAcquisitionBonusOnly",
    name = "SetFirstAcquisitionBonusOnly",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["SetFirstAcquisitionBonusOnly"],
    funcPath = "SetFirstAcquisitionBonusOnly",
    params = { { name = "isActive", type = "bool", default = nil } },
    returns = {  },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["SetFlipBookColumns"] = {
    key = "SetFlipBookColumns",
    name = "SetFlipBookColumns",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["SetFlipBookColumns"],
    funcPath = "SetFlipBookColumns",
    params = { { name = "columns", type = "number", default = nil } },
    returns = {  },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["SetFlipBookFrameHeight"] = {
    key = "SetFlipBookFrameHeight",
    name = "SetFlipBookFrameHeight",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["SetFlipBookFrameHeight"],
    funcPath = "SetFlipBookFrameHeight",
    params = { { name = "height", type = "number", default = nil } },
    returns = {  },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["SetFlipBookFrameWidth"] = {
    key = "SetFlipBookFrameWidth",
    name = "SetFlipBookFrameWidth",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["SetFlipBookFrameWidth"],
    funcPath = "SetFlipBookFrameWidth",
    params = { { name = "width", type = "number", default = nil } },
    returns = {  },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["SetFlipBookFrames"] = {
    key = "SetFlipBookFrames",
    name = "SetFlipBookFrames",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["SetFlipBookFrames"],
    funcPath = "SetFlipBookFrames",
    params = { { name = "frames", type = "number", default = nil } },
    returns = {  },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["SetFlipBookRows"] = {
    key = "SetFlipBookRows",
    name = "SetFlipBookRows",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["SetFlipBookRows"],
    funcPath = "SetFlipBookRows",
    params = { { name = "rows", type = "number", default = nil } },
    returns = {  },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["SetFocus"] = {
    key = "SetFocus",
    name = "SetFocus",
    category = "general",
    subcategory = "global",
    func = _G["SetFocus"],
    funcPath = "SetFocus",
    params = {  },
    returns = {  },
    midnightImpact = "NORMAL",
}

APIDefs["SetFogColor"] = {
    key = "SetFogColor",
    name = "SetFogColor",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["SetFogColor"],
    funcPath = "SetFogColor",
    params = { { name = "colorR", type = "number", default = nil }, { name = "colorG", type = "number", default = nil }, { name = "colorB", type = "number", default = nil }, { name = "a", type = "SingleColorValue", default = nil } },
    returns = {  },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["SetFogFar"] = {
    key = "SetFogFar",
    name = "SetFogFar",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["SetFogFar"],
    funcPath = "SetFogFar",
    params = { { name = "fogFar", type = "number", default = nil } },
    returns = {  },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["SetFogNear"] = {
    key = "SetFogNear",
    name = "SetFogNear",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["SetFogNear"],
    funcPath = "SetFogNear",
    params = { { name = "fogNear", type = "number", default = nil } },
    returns = {  },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["SetFogOfWarBackgroundAtlas"] = {
    key = "SetFogOfWarBackgroundAtlas",
    name = "SetFogOfWarBackgroundAtlas",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["SetFogOfWarBackgroundAtlas"],
    funcPath = "SetFogOfWarBackgroundAtlas",
    params = { { name = "atlas", type = "textureAtlas", default = nil } },
    returns = {  },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["SetFogOfWarBackgroundTexture"] = {
    key = "SetFogOfWarBackgroundTexture",
    name = "SetFogOfWarBackgroundTexture",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["SetFogOfWarBackgroundTexture"],
    funcPath = "SetFogOfWarBackgroundTexture",
    params = { { name = "asset", type = "FileAsset", default = nil }, { name = "horizontalTile", type = "bool", default = nil }, { name = "verticalTile", type = "bool", default = nil } },
    returns = {  },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["SetFogOfWarMaskAtlas"] = {
    key = "SetFogOfWarMaskAtlas",
    name = "SetFogOfWarMaskAtlas",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["SetFogOfWarMaskAtlas"],
    funcPath = "SetFogOfWarMaskAtlas",
    params = { { name = "atlas", type = "textureAtlas", default = nil } },
    returns = {  },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["SetFogOfWarMaskTexture"] = {
    key = "SetFogOfWarMaskTexture",
    name = "SetFogOfWarMaskTexture",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["SetFogOfWarMaskTexture"],
    funcPath = "SetFogOfWarMaskTexture",
    params = { { name = "asset", type = "FileAsset", default = nil } },
    returns = {  },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["SetFont"] = {
    key = "SetFont",
    name = "SetFont",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["SetFont"],
    funcPath = "SetFont",
    params = { { name = "fontFile", type = "cstring", default = nil }, { name = "height", type = "uiFontHeight", default = nil }, { name = "flags", type = "TBFFlags", default = nil } },
    returns = {  },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["SetFontHeight"] = {
    key = "SetFontHeight",
    name = "SetFontHeight",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["SetFontHeight"],
    funcPath = "SetFontHeight",
    params = { { name = "height", type = "number", default = nil } },
    returns = {  },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["SetFontObject"] = {
    key = "SetFontObject",
    name = "SetFontObject",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["SetFontObject"],
    funcPath = "SetFontObject",
    params = { { name = "font", type = "SimpleFont", default = nil } },
    returns = {  },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["SetFromAlpha"] = {
    key = "SetFromAlpha",
    name = "SetFromAlpha",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["SetFromAlpha"],
    funcPath = "SetFromAlpha",
    params = { { name = "normalizedAlpha", type = "number", default = nil } },
    returns = {  },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=NotAllowed",
}

APIDefs["SetFrontEndLobbyModelFromDefaultCharacterDisplay"] = {
    key = "SetFrontEndLobbyModelFromDefaultCharacterDisplay",
    name = "SetFrontEndLobbyModelFromDefaultCharacterDisplay",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["SetFrontEndLobbyModelFromDefaultCharacterDisplay"],
    funcPath = "SetFrontEndLobbyModelFromDefaultCharacterDisplay",
    params = { { name = "characterIndex", type = "number", default = nil } },
    returns = { { name = "success", type = "bool", canBeSecret = false } },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["SetGlow"] = {
    key = "SetGlow",
    name = "SetGlow",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["SetGlow"],
    funcPath = "SetGlow",
    params = { { name = "glow", type = "number", default = nil } },
    returns = {  },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["SetGradientMask"] = {
    key = "SetGradientMask",
    name = "SetGradientMask",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["SetGradientMask"],
    funcPath = "SetGradientMask",
    params = { { name = "grad0", type = "number", default = nil }, { name = "grad1", type = "number", default = nil }, { name = "grad2", type = "number", default = nil }, { name = "grad3", type = "number", default = nil } },
    returns = {  },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["SetHealAbsorbClampMode"] = {
    key = "SetHealAbsorbClampMode",
    name = "SetHealAbsorbClampMode",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["SetHealAbsorbClampMode"],
    funcPath = "SetHealAbsorbClampMode",
    params = { { name = "healAbsorbClampMode", type = "UnitHealAbsorbClampMode", default = nil } },
    returns = {  },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=NotAllowed",
}

APIDefs["SetHealAbsorbMode"] = {
    key = "SetHealAbsorbMode",
    name = "SetHealAbsorbMode",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["SetHealAbsorbMode"],
    funcPath = "SetHealAbsorbMode",
    params = { { name = "healAbsorbMode", type = "UnitHealAbsorbMode", default = nil } },
    returns = {  },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=NotAllowed",
}

APIDefs["SetHeight"] = {
    key = "SetHeight",
    name = "SetHeight",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["SetHeight"],
    funcPath = "SetHeight",
    params = { { name = "height", type = "uiUnit", default = nil } },
    returns = {  },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["SetHeightFactor"] = {
    key = "SetHeightFactor",
    name = "SetHeightFactor",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["SetHeightFactor"],
    funcPath = "SetHeightFactor",
    params = { { name = "factor", type = "number", default = nil } },
    returns = {  },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["SetHitRectThickness"] = {
    key = "SetHitRectThickness",
    name = "SetHitRectThickness",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["SetHitRectThickness"],
    funcPath = "SetHitRectThickness",
    params = { { name = "thickness", type = "uiUnit", default = nil } },
    returns = {  },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["SetIconTexture"] = {
    key = "SetIconTexture",
    name = "SetIconTexture",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["SetIconTexture"],
    funcPath = "SetIconTexture",
    params = { { name = "asset", type = "TextureAsset", default = nil } },
    returns = {  },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["SetInWorldUIVisibility"] = {
    key = "SetInWorldUIVisibility",
    name = "SetInWorldUIVisibility",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["SetInWorldUIVisibility"],
    funcPath = "SetInWorldUIVisibility",
    params = { { name = "visible", type = "bool", default = nil } },
    returns = {  },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["SetIncomingHealClampMode"] = {
    key = "SetIncomingHealClampMode",
    name = "SetIncomingHealClampMode",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["SetIncomingHealClampMode"],
    funcPath = "SetIncomingHealClampMode",
    params = { { name = "incomingHealClampMode", type = "UnitIncomingHealClampMode", default = nil } },
    returns = {  },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=NotAllowed",
}

APIDefs["SetIncomingHealOverflowPercent"] = {
    key = "SetIncomingHealOverflowPercent",
    name = "SetIncomingHealOverflowPercent",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["SetIncomingHealOverflowPercent"],
    funcPath = "SetIncomingHealOverflowPercent",
    params = { { name = "incomingHealOverflowPercent", type = "number", default = nil } },
    returns = {  },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=NotAllowed",
}

APIDefs["SetIndentedWordWrap"] = {
    key = "SetIndentedWordWrap",
    name = "SetIndentedWordWrap",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["SetIndentedWordWrap"],
    funcPath = "SetIndentedWordWrap",
    params = { { name = "wordWrap", type = "bool", default = nil } },
    returns = {  },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["SetInsertMode"] = {
    key = "SetInsertMode",
    name = "SetInsertMode",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["SetInsertMode"],
    funcPath = "SetInsertMode",
    params = { { name = "mode", type = "InsertMode", default = nil } },
    returns = {  },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["SetItem"] = {
    key = "SetItem",
    name = "SetItem",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["SetItem"],
    funcPath = "SetItem",
    params = { { name = "itemID", type = "number", default = nil }, { name = "appearanceModID", type = "number", default = nil }, { name = "itemVisualID", type = "number", default = nil } },
    returns = {  },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["SetItemAppearance"] = {
    key = "SetItemAppearance",
    name = "SetItemAppearance",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["SetItemAppearance"],
    funcPath = "SetItemAppearance",
    params = { { name = "itemAppearanceID", type = "number", default = nil }, { name = "itemVisualID", type = "number", default = nil }, { name = "itemSubclass", type = "ItemWeaponSubclass", default = nil } },
    returns = {  },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["SetItemTransmogInfo"] = {
    key = "SetItemTransmogInfo",
    name = "SetItemTransmogInfo",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["SetItemTransmogInfo"],
    funcPath = "SetItemTransmogInfo",
    params = { { name = "transmogInfo", type = "ItemTransmogInfo", default = nil }, { name = "inventorySlots", type = "number", default = nil }, { name = "ignoreChildItems", type = "bool", default = false } },
    returns = { { name = "result", type = "ItemTryOnReason", canBeSecret = false } },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["SetJumpInfo"] = {
    key = "SetJumpInfo",
    name = "SetJumpInfo",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["SetJumpInfo"],
    funcPath = "SetJumpInfo",
    params = { { name = "jumpLength", type = "number", default = nil }, { name = "jumpHeight", type = "number", default = nil } },
    returns = {  },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["SetJustifyH"] = {
    key = "SetJustifyH",
    name = "SetJustifyH",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["SetJustifyH"],
    funcPath = "SetJustifyH",
    params = { { name = "justifyH", type = "JustifyHorizontal", default = nil } },
    returns = {  },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["SetJustifyV"] = {
    key = "SetJustifyV",
    name = "SetJustifyV",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["SetJustifyV"],
    funcPath = "SetJustifyV",
    params = { { name = "justifyV", type = "JustifyVertical", default = nil } },
    returns = {  },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["SetKeepModelOnHide"] = {
    key = "SetKeepModelOnHide",
    name = "SetKeepModelOnHide",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["SetKeepModelOnHide"],
    funcPath = "SetKeepModelOnHide",
    params = { { name = "keepModelOnHide", type = "bool", default = nil } },
    returns = {  },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["SetLegacyRaidDifficultyID"] = {
    key = "SetLegacyRaidDifficultyID",
    name = "SetLegacyRaidDifficultyID",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["SetLegacyRaidDifficultyID"],
    funcPath = "SetLegacyRaidDifficultyID",
    params = { { name = "difficultyID", type = "number", default = nil }, { name = "force", type = "bool", default = false } },
    returns = {  },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["SetLight"] = {
    key = "SetLight",
    name = "SetLight",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["SetLight"],
    funcPath = "SetLight",
    params = { { name = "enabled", type = "bool", default = nil }, { name = "light", type = "ModelLight", default = nil } },
    returns = {  },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["SetLightAmbientColor"] = {
    key = "SetLightAmbientColor",
    name = "SetLightAmbientColor",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["SetLightAmbientColor"],
    funcPath = "SetLightAmbientColor",
    params = { { name = "colorR", type = "number", default = nil }, { name = "colorG", type = "number", default = nil }, { name = "colorB", type = "number", default = nil } },
    returns = {  },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["SetLightDiffuseColor"] = {
    key = "SetLightDiffuseColor",
    name = "SetLightDiffuseColor",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["SetLightDiffuseColor"],
    funcPath = "SetLightDiffuseColor",
    params = { { name = "colorR", type = "number", default = nil }, { name = "colorG", type = "number", default = nil }, { name = "colorB", type = "number", default = nil } },
    returns = {  },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["SetLightDirection"] = {
    key = "SetLightDirection",
    name = "SetLightDirection",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["SetLightDirection"],
    funcPath = "SetLightDirection",
    params = { { name = "directionX", type = "number", default = nil }, { name = "directionY", type = "number", default = nil }, { name = "directionZ", type = "number", default = nil } },
    returns = {  },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["SetLightPosition"] = {
    key = "SetLightPosition",
    name = "SetLightPosition",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["SetLightPosition"],
    funcPath = "SetLightPosition",
    params = { { name = "positionX", type = "number", default = nil }, { name = "positionY", type = "number", default = nil }, { name = "positionZ", type = "number", default = nil } },
    returns = {  },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["SetLightType"] = {
    key = "SetLightType",
    name = "SetLightType",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["SetLightType"],
    funcPath = "SetLightType",
    params = { { name = "lightType", type = "ModelLightType", default = nil } },
    returns = {  },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["SetLightVisible"] = {
    key = "SetLightVisible",
    name = "SetLightVisible",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["SetLightVisible"],
    funcPath = "SetLightVisible",
    params = { { name = "visible", type = "bool", default = false } },
    returns = {  },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["SetLooping"] = {
    key = "SetLooping",
    name = "SetLooping",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["SetLooping"],
    funcPath = "SetLooping",
    params = { { name = "loopType", type = "LoopType", default = nil } },
    returns = {  },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=NotAllowed",
}

APIDefs["SetLootSpecialization"] = {
    key = "SetLootSpecialization",
    name = "SetLootSpecialization",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["SetLootSpecialization"],
    funcPath = "SetLootSpecialization",
    params = { { name = "specializationID", type = "number", default = nil } },
    returns = {  },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["SetMapID"] = {
    key = "SetMapID",
    name = "SetMapID",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["SetMapID"],
    funcPath = "SetMapID",
    params = { { name = "uiMapID", type = "number", default = nil } },
    returns = {  },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["SetMaskScalar"] = {
    key = "SetMaskScalar",
    name = "SetMaskScalar",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["SetMaskScalar"],
    funcPath = "SetMaskScalar",
    params = { { name = "scalar", type = "number", default = nil } },
    returns = {  },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["SetMaskTexture"] = {
    key = "SetMaskTexture",
    name = "SetMaskTexture",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["SetMaskTexture"],
    funcPath = "SetMaskTexture",
    params = { { name = "asset", type = "TextureAsset", default = nil } },
    returns = {  },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["SetMaxSnapshots"] = {
    key = "SetMaxSnapshots",
    name = "SetMaxSnapshots",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["SetMaxSnapshots"],
    funcPath = "SetMaxSnapshots",
    params = { { name = "maxSnapshots", type = "number", default = nil } },
    returns = {  },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["SetMergeThreshold"] = {
    key = "SetMergeThreshold",
    name = "SetMergeThreshold",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["SetMergeThreshold"],
    funcPath = "SetMergeThreshold",
    params = { { name = "threshold", type = "number", default = nil } },
    returns = {  },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["SetMinMaxValues"] = {
    key = "SetMinMaxValues",
    name = "SetMinMaxValues",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["SetMinMaxValues"],
    funcPath = "SetMinMaxValues",
    params = { { name = "minValue", type = "number", default = nil }, { name = "maxValue", type = "number", default = nil } },
    returns = {  },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["SetModel"] = {
    key = "SetModel",
    name = "SetModel",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["SetModel"],
    funcPath = "SetModel",
    params = { { name = "asset", type = "ModelAsset", default = nil }, { name = "noMip", type = "bool", default = false } },
    returns = {  },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["SetModelAlpha"] = {
    key = "SetModelAlpha",
    name = "SetModelAlpha",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["SetModelAlpha"],
    funcPath = "SetModelAlpha",
    params = { { name = "alpha", type = "number", default = nil } },
    returns = {  },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["SetModelByCreatureDisplayID"] = {
    key = "SetModelByCreatureDisplayID",
    name = "SetModelByCreatureDisplayID",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["SetModelByCreatureDisplayID"],
    funcPath = "SetModelByCreatureDisplayID",
    params = { { name = "creatureDisplayID", type = "number", default = nil }, { name = "useActivePlayerCustomizations", type = "bool", default = false } },
    returns = { { name = "success", type = "bool", canBeSecret = false } },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["SetModelByFileID"] = {
    key = "SetModelByFileID",
    name = "SetModelByFileID",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["SetModelByFileID"],
    funcPath = "SetModelByFileID",
    params = { { name = "asset", type = "FileAsset", default = nil }, { name = "useMips", type = "bool", default = false } },
    returns = { { name = "success", type = "bool", canBeSecret = false } },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["SetModelByHyperlink"] = {
    key = "SetModelByHyperlink",
    name = "SetModelByHyperlink",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["SetModelByHyperlink"],
    funcPath = "SetModelByHyperlink",
    params = { { name = "link", type = "cstring", default = nil } },
    returns = { { name = "success", type = "bool", canBeSecret = false } },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["SetModelByPath"] = {
    key = "SetModelByPath",
    name = "SetModelByPath",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["SetModelByPath"],
    funcPath = "SetModelByPath",
    params = { { name = "asset", type = "FileAsset", default = nil }, { name = "useMips", type = "bool", default = false } },
    returns = { { name = "success", type = "bool", canBeSecret = false } },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["SetModelByUnit"] = {
    key = "SetModelByUnit",
    name = "SetModelByUnit",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["SetModelByUnit"],
    funcPath = "SetModelByUnit",
    params = { { name = "unit", type = "UnitToken", default = "player" }, { name = "sheatheWeapons", type = "bool", default = false }, { name = "autoDress", type = "bool", default = true }, { name = "hideWeapons", type = "bool", default = false }, { name = "usePlayerNativeForm", type = "bool", default = true }, { name = "holdBowString", type = "bool", default = false }, { name = "customRaceID", type = "number", default = nil } },
    returns = { { name = "success", type = "bool", canBeSecret = false } },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["SetModelDrawLayer"] = {
    key = "SetModelDrawLayer",
    name = "SetModelDrawLayer",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["SetModelDrawLayer"],
    funcPath = "SetModelDrawLayer",
    params = { { name = "layer", type = "DrawLayer", default = nil } },
    returns = {  },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["SetModelScale"] = {
    key = "SetModelScale",
    name = "SetModelScale",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["SetModelScale"],
    funcPath = "SetModelScale",
    params = { { name = "scale", type = "number", default = nil } },
    returns = {  },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["SetNumSplinePoints"] = {
    key = "SetNumSplinePoints",
    name = "SetNumSplinePoints",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["SetNumSplinePoints"],
    funcPath = "SetNumSplinePoints",
    params = { { name = "numSplinePoints", type = "number", default = nil } },
    returns = {  },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["SetObeyHideInTransmogFlag"] = {
    key = "SetObeyHideInTransmogFlag",
    name = "SetObeyHideInTransmogFlag",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["SetObeyHideInTransmogFlag"],
    funcPath = "SetObeyHideInTransmogFlag",
    params = { { name = "obey", type = "bool", default = nil } },
    returns = {  },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["SetObeyStepOnDrag"] = {
    key = "SetObeyStepOnDrag",
    name = "SetObeyStepOnDrag",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["SetObeyStepOnDrag"],
    funcPath = "SetObeyStepOnDrag",
    params = { { name = "obeyStepOnDrag", type = "bool", default = nil } },
    returns = {  },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["SetOffset"] = {
    key = "SetOffset",
    name = "SetOffset",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["SetOffset"],
    funcPath = "SetOffset",
    params = { { name = "offsetX", type = "uiUnit", default = nil }, { name = "offsetY", type = "uiUnit", default = nil } },
    returns = {  },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["SetOrder"] = {
    key = "SetOrder",
    name = "SetOrder",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["SetOrder"],
    funcPath = "SetOrder",
    params = { { name = "order", type = "number", default = nil } },
    returns = {  },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["SetOrientation"] = {
    key = "SetOrientation",
    name = "SetOrientation",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["SetOrientation"],
    funcPath = "SetOrientation",
    params = { { name = "orientation", type = "Orientation", default = nil } },
    returns = {  },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["SetOrigin"] = {
    key = "SetOrigin",
    name = "SetOrigin",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["SetOrigin"],
    funcPath = "SetOrigin",
    params = { { name = "point", type = "FramePoint", default = nil }, { name = "originX", type = "number", default = nil }, { name = "originY", type = "number", default = nil } },
    returns = {  },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["SetOwnedOnly"] = {
    key = "SetOwnedOnly",
    name = "SetOwnedOnly",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["SetOwnedOnly"],
    funcPath = "SetOwnedOnly",
    params = { { name = "isActive", type = "bool", default = nil } },
    returns = {  },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["SetPOIArrowTexture"] = {
    key = "SetPOIArrowTexture",
    name = "SetPOIArrowTexture",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["SetPOIArrowTexture"],
    funcPath = "SetPOIArrowTexture",
    params = { { name = "asset", type = "TextureAsset", default = nil } },
    returns = {  },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["SetPanDistance"] = {
    key = "SetPanDistance",
    name = "SetPanDistance",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["SetPanDistance"],
    funcPath = "SetPanDistance",
    params = { { name = "scale", type = "number", default = nil } },
    returns = {  },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["SetParent"] = {
    key = "SetParent",
    name = "SetParent",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["SetParent"],
    funcPath = "SetParent",
    params = { { name = "parent", type = "SimplePathAnim", default = nil }, { name = "order", type = "number", default = nil } },
    returns = {  },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["SetParticleOverrideScale"] = {
    key = "SetParticleOverrideScale",
    name = "SetParticleOverrideScale",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["SetParticleOverrideScale"],
    funcPath = "SetParticleOverrideScale",
    params = { { name = "scale", type = "number", default = nil } },
    returns = {  },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["SetParticlesEnabled"] = {
    key = "SetParticlesEnabled",
    name = "SetParticlesEnabled",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["SetParticlesEnabled"],
    funcPath = "SetParticlesEnabled",
    params = { { name = "enabled", type = "bool", default = nil } },
    returns = {  },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["SetPaused"] = {
    key = "SetPaused",
    name = "SetPaused",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["SetPaused"],
    funcPath = "SetPaused",
    params = { { name = "paused", type = "bool", default = nil } },
    returns = {  },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["SetPitch"] = {
    key = "SetPitch",
    name = "SetPitch",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["SetPitch"],
    funcPath = "SetPitch",
    params = { { name = "pitch", type = "number", default = nil } },
    returns = {  },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["SetPlayerModelFromGlues"] = {
    key = "SetPlayerModelFromGlues",
    name = "SetPlayerModelFromGlues",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["SetPlayerModelFromGlues"],
    funcPath = "SetPlayerModelFromGlues",
    params = { { name = "characterIndex", type = "number", default = nil }, { name = "sheatheWeapons", type = "bool", default = false }, { name = "autoDress", type = "bool", default = true }, { name = "hideWeapons", type = "bool", default = false }, { name = "usePlayerNativeForm", type = "bool", default = true }, { name = "customRaceID", type = "number", default = nil } },
    returns = { { name = "success", type = "bool", canBeSecret = false } },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["SetPlayerPingScale"] = {
    key = "SetPlayerPingScale",
    name = "SetPlayerPingScale",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["SetPlayerPingScale"],
    funcPath = "SetPlayerPingScale",
    params = { { name = "scale", type = "number", default = nil } },
    returns = {  },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["SetPlayerPingTexture"] = {
    key = "SetPlayerPingTexture",
    name = "SetPlayerPingTexture",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["SetPlayerPingTexture"],
    funcPath = "SetPlayerPingTexture",
    params = { { name = "textureType", type = "PingTextureType", default = nil }, { name = "asset", type = "FileAsset", default = nil }, { name = "width", type = "uiUnit", default = 0 }, { name = "height", type = "uiUnit", default = 0 } },
    returns = {  },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["SetPlayerTexture"] = {
    key = "SetPlayerTexture",
    name = "SetPlayerTexture",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["SetPlayerTexture"],
    funcPath = "SetPlayerTexture",
    params = { { name = "asset", type = "TextureAsset", default = nil } },
    returns = {  },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["SetPlaying"] = {
    key = "SetPlaying",
    name = "SetPlaying",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["SetPlaying"],
    funcPath = "SetPlaying",
    params = { { name = "play", type = "bool", default = nil } },
    returns = {  },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["SetPoint"] = {
    key = "SetPoint",
    name = "SetPoint",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["SetPoint"],
    funcPath = "SetPoint",
    params = { { name = "point", type = "FramePoint", default = nil }, { name = "relativeTo", type = "ScriptRegion", default = nil }, { name = "relativePoint", type = "FramePoint", default = nil }, { name = "offsetX", type = "uiUnit", default = nil }, { name = "offsetY", type = "uiUnit", default = nil } },
    returns = {  },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["SetPoints"] = {
    key = "SetPoints",
    name = "SetPoints",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["SetPoints"],
    funcPath = "SetPoints",
    params = { { name = "point", type = "table", default = nil } },
    returns = {  },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["SetPointsOffset"] = {
    key = "SetPointsOffset",
    name = "SetPointsOffset",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["SetPointsOffset"],
    funcPath = "SetPointsOffset",
    params = { { name = "x", type = "uiUnit", default = nil }, { name = "y", type = "uiUnit", default = nil } },
    returns = {  },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["SetPortraitTexture"] = {
    key = "SetPortraitTexture",
    name = "SetPortraitTexture",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["SetPortraitTexture"],
    funcPath = "SetPortraitTexture",
    params = { { name = "textureObject", type = "SimpleTexture", default = nil }, { name = "unitToken", type = "UnitToken", default = "player" }, { name = "disableMasking", type = "bool", default = false } },
    returns = {  },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["SetPortraitTextureFromCreatureDisplayID"] = {
    key = "SetPortraitTextureFromCreatureDisplayID",
    name = "SetPortraitTextureFromCreatureDisplayID",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["SetPortraitTextureFromCreatureDisplayID"],
    funcPath = "SetPortraitTextureFromCreatureDisplayID",
    params = { { name = "textureObject", type = "SimpleTexture", default = nil }, { name = "creatureDisplayID", type = "number", default = nil } },
    returns = {  },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["SetPortraitZoom"] = {
    key = "SetPortraitZoom",
    name = "SetPortraitZoom",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["SetPortraitZoom"],
    funcPath = "SetPortraitZoom",
    params = { { name = "zoom", type = "number", default = nil } },
    returns = {  },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["SetPosition"] = {
    key = "SetPosition",
    name = "SetPosition",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["SetPosition"],
    funcPath = "SetPosition",
    params = { { name = "positionX", type = "number", default = nil }, { name = "positionY", type = "number", default = nil }, { name = "positionZ", type = "number", default = nil } },
    returns = {  },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["SetPredictedValues"] = {
    key = "SetPredictedValues",
    name = "SetPredictedValues",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["SetPredictedValues"],
    funcPath = "SetPredictedValues",
    params = { { name = "predictedValues", type = "UnitHealPredictionValues", default = nil } },
    returns = {  },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["SetPreferModelCollisionBounds"] = {
    key = "SetPreferModelCollisionBounds",
    name = "SetPreferModelCollisionBounds",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["SetPreferModelCollisionBounds"],
    funcPath = "SetPreferModelCollisionBounds",
    params = { { name = "preferCollisionBounds", type = "bool", default = nil } },
    returns = {  },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["SetQuestBlobInsideAlpha"] = {
    key = "SetQuestBlobInsideAlpha",
    name = "SetQuestBlobInsideAlpha",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["SetQuestBlobInsideAlpha"],
    funcPath = "SetQuestBlobInsideAlpha",
    params = { { name = "alpha", type = "number", default = nil } },
    returns = {  },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["SetQuestBlobInsideTexture"] = {
    key = "SetQuestBlobInsideTexture",
    name = "SetQuestBlobInsideTexture",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["SetQuestBlobInsideTexture"],
    funcPath = "SetQuestBlobInsideTexture",
    params = { { name = "asset", type = "TextureAsset", default = nil } },
    returns = {  },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["SetQuestBlobOutsideAlpha"] = {
    key = "SetQuestBlobOutsideAlpha",
    name = "SetQuestBlobOutsideAlpha",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["SetQuestBlobOutsideAlpha"],
    funcPath = "SetQuestBlobOutsideAlpha",
    params = { { name = "alpha", type = "number", default = nil } },
    returns = {  },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["SetQuestBlobOutsideTexture"] = {
    key = "SetQuestBlobOutsideTexture",
    name = "SetQuestBlobOutsideTexture",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["SetQuestBlobOutsideTexture"],
    funcPath = "SetQuestBlobOutsideTexture",
    params = { { name = "asset", type = "TextureAsset", default = nil } },
    returns = {  },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["SetQuestBlobRingAlpha"] = {
    key = "SetQuestBlobRingAlpha",
    name = "SetQuestBlobRingAlpha",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["SetQuestBlobRingAlpha"],
    funcPath = "SetQuestBlobRingAlpha",
    params = { { name = "alpha", type = "number", default = nil } },
    returns = {  },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["SetQuestBlobRingScalar"] = {
    key = "SetQuestBlobRingScalar",
    name = "SetQuestBlobRingScalar",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["SetQuestBlobRingScalar"],
    funcPath = "SetQuestBlobRingScalar",
    params = { { name = "scalar", type = "number", default = nil } },
    returns = {  },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["SetQuestBlobRingTexture"] = {
    key = "SetQuestBlobRingTexture",
    name = "SetQuestBlobRingTexture",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["SetQuestBlobRingTexture"],
    funcPath = "SetQuestBlobRingTexture",
    params = { { name = "asset", type = "TextureAsset", default = nil } },
    returns = {  },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["SetRadians"] = {
    key = "SetRadians",
    name = "SetRadians",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["SetRadians"],
    funcPath = "SetRadians",
    params = { { name = "angle", type = "number", default = nil } },
    returns = {  },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["SetRaidDifficultyID"] = {
    key = "SetRaidDifficultyID",
    name = "SetRaidDifficultyID",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["SetRaidDifficultyID"],
    funcPath = "SetRaidDifficultyID",
    params = { { name = "difficultyID", type = "number", default = nil }, { name = "force", type = "bool", default = false } },
    returns = {  },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["SetRaidTarget"] = {
    key = "SetRaidTarget",
    name = "SetRaidTarget",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["SetRaidTarget"],
    funcPath = "SetRaidTarget",
    params = { { name = "target", type = "UnitToken", default = "player" }, { name = "userIndex", type = "luaIndex", default = nil } },
    returns = {  },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["SetResultsUpdatedCallback"] = {
    key = "SetResultsUpdatedCallback",
    name = "SetResultsUpdatedCallback",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["SetResultsUpdatedCallback"],
    funcPath = "SetResultsUpdatedCallback",
    params = { { name = "callback", type = "HousingCatalogSearchResultsUpdatedCallback", default = nil } },
    returns = {  },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["SetRoll"] = {
    key = "SetRoll",
    name = "SetRoll",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["SetRoll"],
    funcPath = "SetRoll",
    params = { { name = "roll", type = "number", default = nil } },
    returns = {  },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["SetRotation"] = {
    key = "SetRotation",
    name = "SetRotation",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["SetRotation"],
    funcPath = "SetRotation",
    params = { { name = "radians", type = "number", default = nil }, { name = "animate", type = "bool", default = true } },
    returns = {  },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["SetScale"] = {
    key = "SetScale",
    name = "SetScale",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["SetScale"],
    funcPath = "SetScale",
    params = { { name = "scaleX", type = "number", default = nil }, { name = "scaleY", type = "number", default = nil } },
    returns = {  },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["SetScaleFrom"] = {
    key = "SetScaleFrom",
    name = "SetScaleFrom",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["SetScaleFrom"],
    funcPath = "SetScaleFrom",
    params = { { name = "scaleX", type = "number", default = nil }, { name = "scaleY", type = "number", default = nil } },
    returns = {  },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["SetScaleTo"] = {
    key = "SetScaleTo",
    name = "SetScaleTo",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["SetScaleTo"],
    funcPath = "SetScaleTo",
    params = { { name = "scaleX", type = "number", default = nil }, { name = "scaleY", type = "number", default = nil } },
    returns = {  },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["SetScript"] = {
    key = "SetScript",
    name = "SetScript",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["SetScript"],
    funcPath = "SetScript",
    params = { { name = "scriptTypeName", type = "cstring", default = nil }, { name = "script", type = "luaFunction", default = nil } },
    returns = {  },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["SetSearchText"] = {
    key = "SetSearchText",
    name = "SetSearchText",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["SetSearchText"],
    funcPath = "SetSearchText",
    params = { { name = "searchText", type = "string", default = nil } },
    returns = {  },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["SetSequence"] = {
    key = "SetSequence",
    name = "SetSequence",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["SetSequence"],
    funcPath = "SetSequence",
    params = { { name = "sequence", type = "number", default = nil } },
    returns = {  },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["SetSequenceTime"] = {
    key = "SetSequenceTime",
    name = "SetSequenceTime",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["SetSequenceTime"],
    funcPath = "SetSequenceTime",
    params = { { name = "sequence", type = "number", default = nil }, { name = "timeOffset", type = "number", default = nil } },
    returns = {  },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["SetShadowColor"] = {
    key = "SetShadowColor",
    name = "SetShadowColor",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["SetShadowColor"],
    funcPath = "SetShadowColor",
    params = { { name = "colorR", type = "number", default = nil }, { name = "colorG", type = "number", default = nil }, { name = "colorB", type = "number", default = nil }, { name = "a", type = "SingleColorValue", default = nil } },
    returns = {  },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["SetShadowEffect"] = {
    key = "SetShadowEffect",
    name = "SetShadowEffect",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["SetShadowEffect"],
    funcPath = "SetShadowEffect",
    params = { { name = "strength", type = "number", default = nil } },
    returns = {  },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["SetShadowOffset"] = {
    key = "SetShadowOffset",
    name = "SetShadowOffset",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["SetShadowOffset"],
    funcPath = "SetShadowOffset",
    params = { { name = "offsetX", type = "number", default = nil }, { name = "offsetY", type = "number", default = nil } },
    returns = {  },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["SetSheathed"] = {
    key = "SetSheathed",
    name = "SetSheathed",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["SetSheathed"],
    funcPath = "SetSheathed",
    params = { { name = "sheathed", type = "bool", default = nil }, { name = "hidden", type = "bool", default = false } },
    returns = {  },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["SetShown"] = {
    key = "SetShown",
    name = "SetShown",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["SetShown"],
    funcPath = "SetShown",
    params = { { name = "show", type = "bool", default = false } },
    returns = {  },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["SetSize"] = {
    key = "SetSize",
    name = "SetSize",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["SetSize"],
    funcPath = "SetSize",
    params = { { name = "x", type = "uiUnit", default = nil }, { name = "y", type = "uiUnit", default = nil } },
    returns = {  },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["SetSmoothProgress"] = {
    key = "SetSmoothProgress",
    name = "SetSmoothProgress",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["SetSmoothProgress"],
    funcPath = "SetSmoothProgress",
    params = { { name = "durationSec", type = "number", default = nil } },
    returns = {  },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=NotAllowed",
}

APIDefs["SetSmoothing"] = {
    key = "SetSmoothing",
    name = "SetSmoothing",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["SetSmoothing"],
    funcPath = "SetSmoothing",
    params = { { name = "weights", type = "SmoothingType", default = nil } },
    returns = {  },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["SetSortType"] = {
    key = "SetSortType",
    name = "SetSortType",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["SetSortType"],
    funcPath = "SetSortType",
    params = { { name = "sortType", type = "HousingCatalogSortType", default = nil } },
    returns = {  },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["SetSpacing"] = {
    key = "SetSpacing",
    name = "SetSpacing",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["SetSpacing"],
    funcPath = "SetSpacing",
    params = { { name = "spacing", type = "uiUnit", default = nil } },
    returns = {  },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["SetSpellVisualKit"] = {
    key = "SetSpellVisualKit",
    name = "SetSpellVisualKit",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["SetSpellVisualKit"],
    funcPath = "SetSpellVisualKit",
    params = { { name = "spellVisualKitID", type = "number", default = 0 }, { name = "oneShot", type = "bool", default = false } },
    returns = {  },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["SetStartColor"] = {
    key = "SetStartColor",
    name = "SetStartColor",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["SetStartColor"],
    funcPath = "SetStartColor",
    params = { { name = "color", type = "colorRGBA", default = nil } },
    returns = {  },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenTainted",
}

APIDefs["SetStartDelay"] = {
    key = "SetStartDelay",
    name = "SetStartDelay",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["SetStartDelay"],
    funcPath = "SetStartDelay",
    params = { { name = "delaySec", type = "number", default = nil }, { name = "recomputeGroupDuration", type = "bool", default = true } },
    returns = {  },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["SetStartPoint"] = {
    key = "SetStartPoint",
    name = "SetStartPoint",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["SetStartPoint"],
    funcPath = "SetStartPoint",
    params = { { name = "relativePoint", type = "FramePoint", default = nil }, { name = "relativeTo", type = "ScriptRegion", default = nil }, { name = "offsetX", type = "uiUnit", default = 0 }, { name = "offsetY", type = "uiUnit", default = 0 } },
    returns = {  },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["SetStaticPOIArrowTexture"] = {
    key = "SetStaticPOIArrowTexture",
    name = "SetStaticPOIArrowTexture",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["SetStaticPOIArrowTexture"],
    funcPath = "SetStaticPOIArrowTexture",
    params = { { name = "asset", type = "TextureAsset", default = nil } },
    returns = {  },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["SetStepsPerPage"] = {
    key = "SetStepsPerPage",
    name = "SetStepsPerPage",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["SetStepsPerPage"],
    funcPath = "SetStepsPerPage",
    params = { { name = "stepsPerPage", type = "number", default = nil } },
    returns = {  },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["SetTableSecurityOption"] = {
    key = "SetTableSecurityOption",
    name = "SetTableSecurityOption",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["SetTableSecurityOption"],
    funcPath = "SetTableSecurityOption",
    params = { { name = "table", type = "LuaValueVariant", default = nil }, { name = "option", type = "TableSecurityOption", default = nil } },
    returns = {  },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["SetTarget"] = {
    key = "SetTarget",
    name = "SetTarget",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["SetTarget"],
    funcPath = "SetTarget",
    params = { { name = "target", type = "CScriptObject", default = nil } },
    returns = { { name = "success", type = "bool", canBeSecret = false } },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["SetTargetDistance"] = {
    key = "SetTargetDistance",
    name = "SetTargetDistance",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["SetTargetDistance"],
    funcPath = "SetTargetDistance",
    params = { { name = "scale", type = "number", default = nil } },
    returns = {  },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["SetTargetKey"] = {
    key = "SetTargetKey",
    name = "SetTargetKey",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["SetTargetKey"],
    funcPath = "SetTargetKey",
    params = { { name = "key", type = "cstring", default = nil } },
    returns = { { name = "success", type = "bool", canBeSecret = false } },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["SetTargetName"] = {
    key = "SetTargetName",
    name = "SetTargetName",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["SetTargetName"],
    funcPath = "SetTargetName",
    params = { { name = "name", type = "cstring", default = nil } },
    returns = { { name = "success", type = "bool", canBeSecret = false } },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["SetTargetParent"] = {
    key = "SetTargetParent",
    name = "SetTargetParent",
    category = "general",
    subcategory = "global",
    func = _G["SetTargetParent"],
    funcPath = "SetTargetParent",
    params = {  },
    returns = { { name = "success", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["SetTaskBlobInsideAlpha"] = {
    key = "SetTaskBlobInsideAlpha",
    name = "SetTaskBlobInsideAlpha",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["SetTaskBlobInsideAlpha"],
    funcPath = "SetTaskBlobInsideAlpha",
    params = { { name = "alpha", type = "number", default = nil } },
    returns = {  },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["SetTaskBlobInsideTexture"] = {
    key = "SetTaskBlobInsideTexture",
    name = "SetTaskBlobInsideTexture",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["SetTaskBlobInsideTexture"],
    funcPath = "SetTaskBlobInsideTexture",
    params = { { name = "asset", type = "TextureAsset", default = nil } },
    returns = {  },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["SetTaskBlobOutsideAlpha"] = {
    key = "SetTaskBlobOutsideAlpha",
    name = "SetTaskBlobOutsideAlpha",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["SetTaskBlobOutsideAlpha"],
    funcPath = "SetTaskBlobOutsideAlpha",
    params = { { name = "alpha", type = "number", default = nil } },
    returns = {  },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["SetTaskBlobOutsideTexture"] = {
    key = "SetTaskBlobOutsideTexture",
    name = "SetTaskBlobOutsideTexture",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["SetTaskBlobOutsideTexture"],
    funcPath = "SetTaskBlobOutsideTexture",
    params = { { name = "asset", type = "TextureAsset", default = nil } },
    returns = {  },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["SetTaskBlobRingAlpha"] = {
    key = "SetTaskBlobRingAlpha",
    name = "SetTaskBlobRingAlpha",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["SetTaskBlobRingAlpha"],
    funcPath = "SetTaskBlobRingAlpha",
    params = { { name = "alpha", type = "number", default = nil } },
    returns = {  },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["SetTaskBlobRingScalar"] = {
    key = "SetTaskBlobRingScalar",
    name = "SetTaskBlobRingScalar",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["SetTaskBlobRingScalar"],
    funcPath = "SetTaskBlobRingScalar",
    params = { { name = "scalar", type = "number", default = nil } },
    returns = {  },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["SetTaskBlobRingTexture"] = {
    key = "SetTaskBlobRingTexture",
    name = "SetTaskBlobRingTexture",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["SetTaskBlobRingTexture"],
    funcPath = "SetTaskBlobRingTexture",
    params = { { name = "asset", type = "TextureAsset", default = nil } },
    returns = {  },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["SetTaxiBenchmarkMode"] = {
    key = "SetTaxiBenchmarkMode",
    name = "SetTaxiBenchmarkMode",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["SetTaxiBenchmarkMode"],
    funcPath = "SetTaxiBenchmarkMode",
    params = { { name = "enable", type = "bool", default = false } },
    returns = {  },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["SetTextColor"] = {
    key = "SetTextColor",
    name = "SetTextColor",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["SetTextColor"],
    funcPath = "SetTextColor",
    params = { { name = "colorR", type = "number", default = nil }, { name = "colorG", type = "number", default = nil }, { name = "colorB", type = "number", default = nil }, { name = "a", type = "SingleColorValue", default = nil } },
    returns = {  },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["SetThickness"] = {
    key = "SetThickness",
    name = "SetThickness",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["SetThickness"],
    funcPath = "SetThickness",
    params = { { name = "thickness", type = "uiUnit", default = nil } },
    returns = {  },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["SetThumbTexture"] = {
    key = "SetThumbTexture",
    name = "SetThumbTexture",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["SetThumbTexture"],
    funcPath = "SetThumbTexture",
    params = { { name = "asset", type = "TextureAsset", default = nil } },
    returns = {  },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["SetTimeFromEnd"] = {
    key = "SetTimeFromEnd",
    name = "SetTimeFromEnd",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["SetTimeFromEnd"],
    funcPath = "SetTimeFromEnd",
    params = { { name = "endTime", type = "FrameTime", default = nil }, { name = "duration", type = "DurationSeconds", default = nil }, { name = "modRate", type = "number", default = 1 } },
    returns = {  },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["SetTimeFromStart"] = {
    key = "SetTimeFromStart",
    name = "SetTimeFromStart",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["SetTimeFromStart"],
    funcPath = "SetTimeFromStart",
    params = { { name = "startTime", type = "FrameTime", default = nil }, { name = "duration", type = "DurationSeconds", default = nil }, { name = "modRate", type = "number", default = 1 } },
    returns = {  },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["SetTimeSpan"] = {
    key = "SetTimeSpan",
    name = "SetTimeSpan",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["SetTimeSpan"],
    funcPath = "SetTimeSpan",
    params = { { name = "startTime", type = "FrameTime", default = nil }, { name = "endTime", type = "FrameTime", default = nil } },
    returns = {  },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["SetTimeVisible"] = {
    key = "SetTimeVisible",
    name = "SetTimeVisible",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["SetTimeVisible"],
    funcPath = "SetTimeVisible",
    params = { { name = "timeVisibleSeconds", type = "number", default = nil } },
    returns = {  },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["SetToAlpha"] = {
    key = "SetToAlpha",
    name = "SetToAlpha",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["SetToAlpha"],
    funcPath = "SetToAlpha",
    params = { { name = "normalizedAlpha", type = "number", default = nil } },
    returns = {  },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=NotAllowed",
}

APIDefs["SetToDefaults"] = {
    key = "SetToDefaults",
    name = "SetToDefaults",
    category = "general",
    subcategory = "global",
    func = _G["SetToDefaults"],
    funcPath = "SetToDefaults",
    params = {  },
    returns = {  },
    midnightImpact = "NORMAL",
}

APIDefs["SetToFinalAlpha"] = {
    key = "SetToFinalAlpha",
    name = "SetToFinalAlpha",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["SetToFinalAlpha"],
    funcPath = "SetToFinalAlpha",
    params = { { name = "setToFinalAlpha", type = "bool", default = nil } },
    returns = {  },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["SetTransform"] = {
    key = "SetTransform",
    name = "SetTransform",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["SetTransform"],
    funcPath = "SetTransform",
    params = { { name = "translation", type = "vector3", default = nil }, { name = "rotation", type = "vector3", default = nil }, { name = "scale", type = "number", default = nil } },
    returns = {  },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["SetType"] = {
    key = "SetType",
    name = "SetType",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["SetType"],
    funcPath = "SetType",
    params = { { name = "type", type = "LuaCurveType", default = nil } },
    returns = {  },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["SetUIVisibility"] = {
    key = "SetUIVisibility",
    name = "SetUIVisibility",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["SetUIVisibility"],
    funcPath = "SetUIVisibility",
    params = { { name = "visible", type = "bool", default = nil } },
    returns = {  },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["SetUiMapID"] = {
    key = "SetUiMapID",
    name = "SetUiMapID",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["SetUiMapID"],
    funcPath = "SetUiMapID",
    params = { { name = "mapID", type = "number", default = nil } },
    returns = {  },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["SetUncollected"] = {
    key = "SetUncollected",
    name = "SetUncollected",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["SetUncollected"],
    funcPath = "SetUncollected",
    params = { { name = "isActive", type = "bool", default = nil } },
    returns = {  },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["SetUnit"] = {
    key = "SetUnit",
    name = "SetUnit",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["SetUnit"],
    funcPath = "SetUnit",
    params = { { name = "unit", type = "UnitToken", default = "player" }, { name = "blend", type = "bool", default = true }, { name = "useNativeForm", type = "bool", default = nil } },
    returns = { { name = "success", type = "bool", canBeSecret = false } },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["SetUnitColor"] = {
    key = "SetUnitColor",
    name = "SetUnitColor",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["SetUnitColor"],
    funcPath = "SetUnitColor",
    params = { { name = "unit", type = "string", default = nil }, { name = "colorR", type = "number", default = nil }, { name = "colorG", type = "number", default = nil }, { name = "colorB", type = "number", default = nil }, { name = "colorA", type = "number", default = nil } },
    returns = {  },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["SetUnitCursorTexture"] = {
    key = "SetUnitCursorTexture",
    name = "SetUnitCursorTexture",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["SetUnitCursorTexture"],
    funcPath = "SetUnitCursorTexture",
    params = { { name = "textureObject", type = "SimpleTexture", default = nil }, { name = "unit", type = "UnitToken", default = "player" }, { name = "style", type = "CursorStyle", default = nil }, { name = "includeLowPriority", type = "bool", default = nil } },
    returns = { { name = "hasCursor", type = "bool", canBeSecret = false } },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["SetUpdateCallback"] = {
    key = "SetUpdateCallback",
    name = "SetUpdateCallback",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["SetUpdateCallback"],
    funcPath = "SetUpdateCallback",
    params = { { name = "cb", type = "PinUpdatedCallback", default = nil } },
    returns = {  },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["SetUseCenterForOrigin"] = {
    key = "SetUseCenterForOrigin",
    name = "SetUseCenterForOrigin",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["SetUseCenterForOrigin"],
    funcPath = "SetUseCenterForOrigin",
    params = { { name = "x", type = "bool", default = false }, { name = "y", type = "bool", default = false }, { name = "z", type = "bool", default = false } },
    returns = {  },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["SetUseTransmogChoices"] = {
    key = "SetUseTransmogChoices",
    name = "SetUseTransmogChoices",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["SetUseTransmogChoices"],
    funcPath = "SetUseTransmogChoices",
    params = { { name = "use", type = "bool", default = nil } },
    returns = {  },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["SetUseTransmogSkin"] = {
    key = "SetUseTransmogSkin",
    name = "SetUseTransmogSkin",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["SetUseTransmogSkin"],
    funcPath = "SetUseTransmogSkin",
    params = { { name = "use", type = "bool", default = nil } },
    returns = {  },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["SetValue"] = {
    key = "SetValue",
    name = "SetValue",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["SetValue"],
    funcPath = "SetValue",
    params = { { name = "value", type = "number", default = nil }, { name = "treatAsMouseEvent", type = "bool", default = false } },
    returns = {  },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["SetValueStep"] = {
    key = "SetValueStep",
    name = "SetValueStep",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["SetValueStep"],
    funcPath = "SetValueStep",
    params = { { name = "valueStep", type = "number", default = nil } },
    returns = {  },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["SetViewInsets"] = {
    key = "SetViewInsets",
    name = "SetViewInsets",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["SetViewInsets"],
    funcPath = "SetViewInsets",
    params = { { name = "left", type = "uiUnit", default = nil }, { name = "right", type = "uiUnit", default = nil }, { name = "top", type = "uiUnit", default = nil }, { name = "bottom", type = "uiUnit", default = nil } },
    returns = {  },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["SetViewTranslation"] = {
    key = "SetViewTranslation",
    name = "SetViewTranslation",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["SetViewTranslation"],
    funcPath = "SetViewTranslation",
    params = { { name = "x", type = "uiUnit", default = nil }, { name = "y", type = "uiUnit", default = nil } },
    returns = {  },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["SetWidth"] = {
    key = "SetWidth",
    name = "SetWidth",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["SetWidth"],
    funcPath = "SetWidth",
    params = { { name = "width", type = "uiUnit", default = nil } },
    returns = {  },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["SetYaw"] = {
    key = "SetYaw",
    name = "SetYaw",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["SetYaw"],
    funcPath = "SetYaw",
    params = { { name = "yaw", type = "number", default = nil } },
    returns = {  },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["SetZoom"] = {
    key = "SetZoom",
    name = "SetZoom",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["SetZoom"],
    funcPath = "SetZoom",
    params = { { name = "zoom", type = "number", default = nil } },
    returns = {  },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["ShouldShowExpansionUpgradeBanner"] = {
    key = "ShouldShowExpansionUpgradeBanner",
    name = "ShouldShowExpansionUpgradeBanner",
    category = "general",
    subcategory = "global",
    func = _G["ShouldShowExpansionUpgradeBanner"],
    funcPath = "ShouldShowExpansionUpgradeBanner",
    params = {  },
    returns = { { name = "showUpgradeBanner", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["ShouldShowIslandsWeeklyPOI"] = {
    key = "ShouldShowIslandsWeeklyPOI",
    name = "ShouldShowIslandsWeeklyPOI",
    category = "general",
    subcategory = "global",
    func = _G["ShouldShowIslandsWeeklyPOI"],
    funcPath = "ShouldShowIslandsWeeklyPOI",
    params = {  },
    returns = { { name = "result", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["ShouldShowSpecialSplashScreen"] = {
    key = "ShouldShowSpecialSplashScreen",
    name = "ShouldShowSpecialSplashScreen",
    category = "general",
    subcategory = "global",
    func = _G["ShouldShowSpecialSplashScreen"],
    funcPath = "ShouldShowSpecialSplashScreen",
    params = {  },
    returns = { { name = "result", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["Show"] = {
    key = "Show",
    name = "Show",
    category = "general",
    subcategory = "global",
    func = _G["Show"],
    funcPath = "Show",
    params = {  },
    returns = {  },
    midnightImpact = "NORMAL",
}

APIDefs["ShowCloak"] = {
    key = "ShowCloak",
    name = "ShowCloak",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["ShowCloak"],
    funcPath = "ShowCloak",
    params = { { name = "show", type = "bool", default = nil } },
    returns = {  },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["ShowHelm"] = {
    key = "ShowHelm",
    name = "ShowHelm",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["ShowHelm"],
    funcPath = "ShowHelm",
    params = { { name = "show", type = "bool", default = nil } },
    returns = {  },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["ShowingCloak"] = {
    key = "ShowingCloak",
    name = "ShowingCloak",
    category = "general",
    subcategory = "global",
    func = _G["ShowingCloak"],
    funcPath = "ShowingCloak",
    params = {  },
    returns = { { name = "result", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["ShowingHelm"] = {
    key = "ShowingHelm",
    name = "ShowingHelm",
    category = "general",
    subcategory = "global",
    func = _G["ShowingHelm"],
    funcPath = "ShowingHelm",
    params = {  },
    returns = { { name = "result", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["SimulateMouseClick"] = {
    key = "SimulateMouseClick",
    name = "SimulateMouseClick",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["SimulateMouseClick"],
    funcPath = "SimulateMouseClick",
    params = { { name = "button", type = "mouseButton", default = nil } },
    returns = {  },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["SimulateMouseDown"] = {
    key = "SimulateMouseDown",
    name = "SimulateMouseDown",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["SimulateMouseDown"],
    funcPath = "SimulateMouseDown",
    params = { { name = "button", type = "mouseButton", default = nil } },
    returns = {  },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["SimulateMouseUp"] = {
    key = "SimulateMouseUp",
    name = "SimulateMouseUp",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["SimulateMouseUp"],
    funcPath = "SimulateMouseUp",
    params = { { name = "button", type = "mouseButton", default = nil } },
    returns = {  },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["SimulateMouseWheel"] = {
    key = "SimulateMouseWheel",
    name = "SimulateMouseWheel",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["SimulateMouseWheel"],
    funcPath = "SimulateMouseWheel",
    params = { { name = "delta", type = "number", default = nil } },
    returns = {  },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["SitStandOrDescendStart"] = {
    key = "SitStandOrDescendStart",
    name = "SitStandOrDescendStart",
    category = "general",
    subcategory = "global",
    func = _G["SitStandOrDescendStart"],
    funcPath = "SitStandOrDescendStart",
    params = {  },
    returns = {  },
    midnightImpact = "NORMAL",
}

APIDefs["SplashFrameCanBeShown"] = {
    key = "SplashFrameCanBeShown",
    name = "SplashFrameCanBeShown",
    category = "general",
    subcategory = "global",
    func = _G["SplashFrameCanBeShown"],
    funcPath = "SplashFrameCanBeShown",
    params = {  },
    returns = { { name = "result", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["StartAttack"] = {
    key = "StartAttack",
    name = "StartAttack",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["StartAttack"],
    funcPath = "StartAttack",
    params = { { name = "name", type = "cstring", default = "0" }, { name = "exactMatch", type = "bool", default = false } },
    returns = {  },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["StartMovie"] = {
    key = "StartMovie",
    name = "StartMovie",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["StartMovie"],
    funcPath = "StartMovie",
    params = { { name = "movieID", type = "number", default = nil }, { name = "looping", type = "bool", default = false } },
    returns = { { name = "success", type = "bool", canBeSecret = false }, { name = "returnCode", type = "number", canBeSecret = false } },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["StartMovieByName"] = {
    key = "StartMovieByName",
    name = "StartMovieByName",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["StartMovieByName"],
    funcPath = "StartMovieByName",
    params = { { name = "movieName", type = "cstring", default = nil }, { name = "looping", type = "bool", default = false }, { name = "resolution", type = "number", default = 0 } },
    returns = { { name = "success", type = "bool", canBeSecret = false }, { name = "returnCode", type = "number", canBeSecret = false } },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["StartPan"] = {
    key = "StartPan",
    name = "StartPan",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["StartPan"],
    funcPath = "StartPan",
    params = { { name = "panType", type = "luaIndex", default = nil }, { name = "durationSeconds", type = "number", default = nil }, { name = "doFade", type = "bool", default = false }, { name = "visKitID", type = "number", default = 0 }, { name = "startPositionScale", type = "number", default = 0 }, { name = "speedMultiplier", type = "number", default = 1 } },
    returns = {  },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["StartPlayerPing"] = {
    key = "StartPlayerPing",
    name = "StartPlayerPing",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["StartPlayerPing"],
    funcPath = "StartPlayerPing",
    params = { { name = "duration", type = "number", default = 0 }, { name = "fadeDuration", type = "number", default = 0 } },
    returns = {  },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["Stop"] = {
    key = "Stop",
    name = "Stop",
    category = "general",
    subcategory = "global",
    func = _G["Stop"],
    funcPath = "Stop",
    params = {  },
    returns = {  },
    midnightImpact = "NORMAL",
}

APIDefs["StopAnimKit"] = {
    key = "StopAnimKit",
    name = "StopAnimKit",
    category = "general",
    subcategory = "global",
    func = _G["StopAnimKit"],
    funcPath = "StopAnimKit",
    params = {  },
    returns = {  },
    midnightImpact = "NORMAL",
}

APIDefs["StopAnimating"] = {
    key = "StopAnimating",
    name = "StopAnimating",
    category = "general",
    subcategory = "global",
    func = _G["StopAnimating"],
    funcPath = "StopAnimating",
    params = {  },
    returns = {  },
    midnightImpact = "NORMAL",
}

APIDefs["StopAnimationKit"] = {
    key = "StopAnimationKit",
    name = "StopAnimationKit",
    category = "general",
    subcategory = "global",
    func = _G["StopAnimationKit"],
    funcPath = "StopAnimationKit",
    params = {  },
    returns = {  },
    midnightImpact = "NORMAL",
}

APIDefs["StopAttack"] = {
    key = "StopAttack",
    name = "StopAttack",
    category = "general",
    subcategory = "global",
    func = _G["StopAttack"],
    funcPath = "StopAttack",
    params = {  },
    returns = {  },
    midnightImpact = "NORMAL",
}

APIDefs["StopCinematic"] = {
    key = "StopCinematic",
    name = "StopCinematic",
    category = "general",
    subcategory = "global",
    func = _G["StopCinematic"],
    funcPath = "StopCinematic",
    params = {  },
    returns = {  },
    midnightImpact = "NORMAL",
}

APIDefs["StopMovie"] = {
    key = "StopMovie",
    name = "StopMovie",
    category = "general",
    subcategory = "global",
    func = _G["StopMovie"],
    funcPath = "StopMovie",
    params = {  },
    returns = {  },
    midnightImpact = "NORMAL",
}

APIDefs["StopPan"] = {
    key = "StopPan",
    name = "StopPan",
    category = "general",
    subcategory = "global",
    func = _G["StopPan"],
    funcPath = "StopPan",
    params = {  },
    returns = {  },
    midnightImpact = "NORMAL",
}

APIDefs["StopPlayerPing"] = {
    key = "StopPlayerPing",
    name = "StopPlayerPing",
    category = "general",
    subcategory = "global",
    func = _G["StopPlayerPing"],
    funcPath = "StopPlayerPing",
    params = {  },
    returns = {  },
    midnightImpact = "NORMAL",
}

APIDefs["Stuck"] = {
    key = "Stuck",
    name = "Stuck",
    category = "general",
    subcategory = "global",
    func = _G["Stuck"],
    funcPath = "Stuck",
    params = {  },
    returns = {  },
    midnightImpact = "NORMAL",
}

APIDefs["SupportsClipCursor"] = {
    key = "SupportsClipCursor",
    name = "SupportsClipCursor",
    category = "general",
    subcategory = "global",
    func = _G["SupportsClipCursor"],
    funcPath = "SupportsClipCursor",
    params = {  },
    returns = { { name = "supportsClipCursor", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["TakeActor"] = {
    key = "TakeActor",
    name = "TakeActor",
    category = "general",
    subcategory = "global",
    func = _G["TakeActor"],
    funcPath = "TakeActor",
    params = {  },
    returns = {  },
    midnightImpact = "NORMAL",
}

APIDefs["TakeSnapshot"] = {
    key = "TakeSnapshot",
    name = "TakeSnapshot",
    category = "general",
    subcategory = "global",
    func = _G["TakeSnapshot"],
    funcPath = "TakeSnapshot",
    params = {  },
    returns = { { name = "snapshotID", type = "number", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["TargetDirectionEnemy"] = {
    key = "TargetDirectionEnemy",
    name = "TargetDirectionEnemy",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["TargetDirectionEnemy"],
    funcPath = "TargetDirectionEnemy",
    params = { { name = "facing", type = "number", default = nil }, { name = "coneAngle", type = "number", default = nil } },
    returns = {  },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["TargetDirectionFinished"] = {
    key = "TargetDirectionFinished",
    name = "TargetDirectionFinished",
    category = "general",
    subcategory = "global",
    func = _G["TargetDirectionFinished"],
    funcPath = "TargetDirectionFinished",
    params = {  },
    returns = {  },
    midnightImpact = "NORMAL",
}

APIDefs["TargetDirectionFriend"] = {
    key = "TargetDirectionFriend",
    name = "TargetDirectionFriend",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["TargetDirectionFriend"],
    funcPath = "TargetDirectionFriend",
    params = { { name = "facing", type = "number", default = nil }, { name = "coneAngle", type = "number", default = nil } },
    returns = {  },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["TargetLastEnemy"] = {
    key = "TargetLastEnemy",
    name = "TargetLastEnemy",
    category = "general",
    subcategory = "global",
    func = _G["TargetLastEnemy"],
    funcPath = "TargetLastEnemy",
    params = {  },
    returns = {  },
    midnightImpact = "NORMAL",
}

APIDefs["TargetLastFriend"] = {
    key = "TargetLastFriend",
    name = "TargetLastFriend",
    category = "general",
    subcategory = "global",
    func = _G["TargetLastFriend"],
    funcPath = "TargetLastFriend",
    params = {  },
    returns = {  },
    midnightImpact = "NORMAL",
}

APIDefs["TargetLastTarget"] = {
    key = "TargetLastTarget",
    name = "TargetLastTarget",
    category = "general",
    subcategory = "global",
    func = _G["TargetLastTarget"],
    funcPath = "TargetLastTarget",
    params = {  },
    returns = {  },
    midnightImpact = "NORMAL",
}

APIDefs["TargetNearest"] = {
    key = "TargetNearest",
    name = "TargetNearest",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["TargetNearest"],
    funcPath = "TargetNearest",
    params = { { name = "reverse", type = "bool", default = false } },
    returns = {  },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["TargetNearestEnemy"] = {
    key = "TargetNearestEnemy",
    name = "TargetNearestEnemy",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["TargetNearestEnemy"],
    funcPath = "TargetNearestEnemy",
    params = { { name = "reverse", type = "bool", default = false } },
    returns = {  },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["TargetNearestEnemyPlayer"] = {
    key = "TargetNearestEnemyPlayer",
    name = "TargetNearestEnemyPlayer",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["TargetNearestEnemyPlayer"],
    funcPath = "TargetNearestEnemyPlayer",
    params = { { name = "reverse", type = "bool", default = false } },
    returns = {  },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["TargetNearestFriend"] = {
    key = "TargetNearestFriend",
    name = "TargetNearestFriend",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["TargetNearestFriend"],
    funcPath = "TargetNearestFriend",
    params = { { name = "reverse", type = "bool", default = false } },
    returns = {  },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["TargetNearestFriendPlayer"] = {
    key = "TargetNearestFriendPlayer",
    name = "TargetNearestFriendPlayer",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["TargetNearestFriendPlayer"],
    funcPath = "TargetNearestFriendPlayer",
    params = { { name = "reverse", type = "bool", default = false } },
    returns = {  },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["TargetNearestPartyMember"] = {
    key = "TargetNearestPartyMember",
    name = "TargetNearestPartyMember",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["TargetNearestPartyMember"],
    funcPath = "TargetNearestPartyMember",
    params = { { name = "reverse", type = "bool", default = false } },
    returns = {  },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["TargetNearestRaidMember"] = {
    key = "TargetNearestRaidMember",
    name = "TargetNearestRaidMember",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["TargetNearestRaidMember"],
    funcPath = "TargetNearestRaidMember",
    params = { { name = "reverse", type = "bool", default = false } },
    returns = {  },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["TargetPriorityHighlightEnd"] = {
    key = "TargetPriorityHighlightEnd",
    name = "TargetPriorityHighlightEnd",
    category = "general",
    subcategory = "global",
    func = _G["TargetPriorityHighlightEnd"],
    funcPath = "TargetPriorityHighlightEnd",
    params = {  },
    returns = {  },
    midnightImpact = "NORMAL",
}

APIDefs["TargetPriorityHighlightStart"] = {
    key = "TargetPriorityHighlightStart",
    name = "TargetPriorityHighlightStart",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["TargetPriorityHighlightStart"],
    funcPath = "TargetPriorityHighlightStart",
    params = { { name = "useStartDelay", type = "bool", default = false } },
    returns = {  },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["TargetToggle"] = {
    key = "TargetToggle",
    name = "TargetToggle",
    category = "general",
    subcategory = "global",
    func = _G["TargetToggle"],
    funcPath = "TargetToggle",
    params = {  },
    returns = {  },
    midnightImpact = "NORMAL",
}

APIDefs["TargetTotem"] = {
    key = "TargetTotem",
    name = "TargetTotem",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["TargetTotem"],
    funcPath = "TargetTotem",
    params = { { name = "slot", type = "luaIndex", default = nil } },
    returns = {  },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["TargetUnit"] = {
    key = "TargetUnit",
    name = "TargetUnit",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["TargetUnit"],
    funcPath = "TargetUnit",
    params = { { name = "name", type = "cstring", default = "" }, { name = "exactMatch", type = "bool", default = false } },
    returns = {  },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["TestPrintToFile"] = {
    key = "TestPrintToFile",
    name = "TestPrintToFile",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["TestPrintToFile"],
    funcPath = "TestPrintToFile",
    params = { { name = "snapshotID", type = "number", default = nil }, { name = "filename", type = "cstring", default = nil } },
    returns = { { name = "success", type = "bool", canBeSecret = false } },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["TimeoutResurrect"] = {
    key = "TimeoutResurrect",
    name = "TimeoutResurrect",
    category = "general",
    subcategory = "global",
    func = _G["TimeoutResurrect"],
    funcPath = "TimeoutResurrect",
    params = {  },
    returns = {  },
    midnightImpact = "NORMAL",
}

APIDefs["ToggleAllowedIndoors"] = {
    key = "ToggleAllowedIndoors",
    name = "ToggleAllowedIndoors",
    category = "general",
    subcategory = "global",
    func = _G["ToggleAllowedIndoors"],
    funcPath = "ToggleAllowedIndoors",
    params = {  },
    returns = {  },
    midnightImpact = "NORMAL",
}

APIDefs["ToggleAllowedOutdoors"] = {
    key = "ToggleAllowedOutdoors",
    name = "ToggleAllowedOutdoors",
    category = "general",
    subcategory = "global",
    func = _G["ToggleAllowedOutdoors"],
    funcPath = "ToggleAllowedOutdoors",
    params = {  },
    returns = {  },
    midnightImpact = "NORMAL",
}

APIDefs["ToggleAnimKitDisplay"] = {
    key = "ToggleAnimKitDisplay",
    name = "ToggleAnimKitDisplay",
    category = "general",
    subcategory = "global",
    func = _G["ToggleAnimKitDisplay"],
    funcPath = "ToggleAnimKitDisplay",
    params = {  },
    returns = {  },
    midnightImpact = "NORMAL",
}

APIDefs["ToggleCollected"] = {
    key = "ToggleCollected",
    name = "ToggleCollected",
    category = "general",
    subcategory = "global",
    func = _G["ToggleCollected"],
    funcPath = "ToggleCollected",
    params = {  },
    returns = {  },
    midnightImpact = "NORMAL",
}

APIDefs["ToggleCollision"] = {
    key = "ToggleCollision",
    name = "ToggleCollision",
    category = "general",
    subcategory = "global",
    func = _G["ToggleCollision"],
    funcPath = "ToggleCollision",
    params = {  },
    returns = {  },
    midnightImpact = "NORMAL",
}

APIDefs["ToggleCollisionDisplay"] = {
    key = "ToggleCollisionDisplay",
    name = "ToggleCollisionDisplay",
    category = "general",
    subcategory = "global",
    func = _G["ToggleCollisionDisplay"],
    funcPath = "ToggleCollisionDisplay",
    params = {  },
    returns = {  },
    midnightImpact = "NORMAL",
}

APIDefs["ToggleCustomizableOnly"] = {
    key = "ToggleCustomizableOnly",
    name = "ToggleCustomizableOnly",
    category = "general",
    subcategory = "global",
    func = _G["ToggleCustomizableOnly"],
    funcPath = "ToggleCustomizableOnly",
    params = {  },
    returns = {  },
    midnightImpact = "NORMAL",
}

APIDefs["ToggleDebugAIDisplay"] = {
    key = "ToggleDebugAIDisplay",
    name = "ToggleDebugAIDisplay",
    category = "general",
    subcategory = "global",
    func = _G["ToggleDebugAIDisplay"],
    funcPath = "ToggleDebugAIDisplay",
    params = {  },
    returns = {  },
    midnightImpact = "NORMAL",
}

APIDefs["ToggleFilterTag"] = {
    key = "ToggleFilterTag",
    name = "ToggleFilterTag",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["ToggleFilterTag"],
    funcPath = "ToggleFilterTag",
    params = { { name = "groupID", type = "number", default = nil }, { name = "tagID", type = "number", default = nil } },
    returns = {  },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["ToggleFirstAcquisitionBonusOnly"] = {
    key = "ToggleFirstAcquisitionBonusOnly",
    name = "ToggleFirstAcquisitionBonusOnly",
    category = "general",
    subcategory = "global",
    func = _G["ToggleFirstAcquisitionBonusOnly"],
    funcPath = "ToggleFirstAcquisitionBonusOnly",
    params = {  },
    returns = {  },
    midnightImpact = "NORMAL",
}

APIDefs["ToggleGravity"] = {
    key = "ToggleGravity",
    name = "ToggleGravity",
    category = "general",
    subcategory = "global",
    func = _G["ToggleGravity"],
    funcPath = "ToggleGravity",
    params = {  },
    returns = {  },
    midnightImpact = "NORMAL",
}

APIDefs["ToggleOwnedOnly"] = {
    key = "ToggleOwnedOnly",
    name = "ToggleOwnedOnly",
    category = "general",
    subcategory = "global",
    func = _G["ToggleOwnedOnly"],
    funcPath = "ToggleOwnedOnly",
    params = {  },
    returns = {  },
    midnightImpact = "NORMAL",
}

APIDefs["TogglePlayerBounds"] = {
    key = "TogglePlayerBounds",
    name = "TogglePlayerBounds",
    category = "general",
    subcategory = "global",
    func = _G["TogglePlayerBounds"],
    funcPath = "TogglePlayerBounds",
    params = {  },
    returns = {  },
    midnightImpact = "NORMAL",
}

APIDefs["TogglePortals"] = {
    key = "TogglePortals",
    name = "TogglePortals",
    category = "general",
    subcategory = "global",
    func = _G["TogglePortals"],
    funcPath = "TogglePortals",
    params = {  },
    returns = {  },
    midnightImpact = "NORMAL",
}

APIDefs["ToggleSelfHighlight"] = {
    key = "ToggleSelfHighlight",
    name = "ToggleSelfHighlight",
    category = "general",
    subcategory = "global",
    func = _G["ToggleSelfHighlight"],
    funcPath = "ToggleSelfHighlight",
    params = {  },
    returns = { { name = "enabled", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["ToggleSheath"] = {
    key = "ToggleSheath",
    name = "ToggleSheath",
    category = "general",
    subcategory = "global",
    func = _G["ToggleSheath"],
    funcPath = "ToggleSheath",
    params = {  },
    returns = {  },
    midnightImpact = "NORMAL",
}

APIDefs["ToggleTris"] = {
    key = "ToggleTris",
    name = "ToggleTris",
    category = "general",
    subcategory = "global",
    func = _G["ToggleTris"],
    funcPath = "ToggleTris",
    params = {  },
    returns = {  },
    midnightImpact = "NORMAL",
}

APIDefs["ToggleUncollected"] = {
    key = "ToggleUncollected",
    name = "ToggleUncollected",
    category = "general",
    subcategory = "global",
    func = _G["ToggleUncollected"],
    funcPath = "ToggleUncollected",
    params = {  },
    returns = {  },
    midnightImpact = "NORMAL",
}

APIDefs["TransformCameraSpaceToModelSpace"] = {
    key = "TransformCameraSpaceToModelSpace",
    name = "TransformCameraSpaceToModelSpace",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["TransformCameraSpaceToModelSpace"],
    funcPath = "TransformCameraSpaceToModelSpace",
    params = { { name = "cameraPosition", type = "vector3", default = nil } },
    returns = { { name = "modelPosition", type = "vector3", canBeSecret = false } },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["TryOn"] = {
    key = "TryOn",
    name = "TryOn",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["TryOn"],
    funcPath = "TryOn",
    params = { { name = "itemLinkOrItemModifiedAppearanceID", type = "cstring", default = nil }, { name = "handSlotName", type = "cstring", default = nil }, { name = "spellEnchantmentID", type = "number", default = 0 } },
    returns = { { name = "reason", type = "ItemTryOnReason", canBeSecret = false } },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["Undress"] = {
    key = "Undress",
    name = "Undress",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["Undress"],
    funcPath = "Undress",
    params = { { name = "includeWeapons", type = "bool", default = true } },
    returns = {  },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["UndressSlot"] = {
    key = "UndressSlot",
    name = "UndressSlot",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["UndressSlot"],
    funcPath = "UndressSlot",
    params = { { name = "inventorySlots", type = "number", default = nil } },
    returns = {  },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["UnequipItems"] = {
    key = "UnequipItems",
    name = "UnequipItems",
    category = "general",
    subcategory = "global",
    func = _G["UnequipItems"],
    funcPath = "UnequipItems",
    params = {  },
    returns = {  },
    midnightImpact = "NORMAL",
}

APIDefs["UnitAffectingCombat"] = {
    key = "UnitAffectingCombat",
    name = "UnitAffectingCombat",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["UnitAffectingCombat"],
    funcPath = "UnitAffectingCombat",
    params = { { name = "unit", type = "UnitToken", default = "player" } },
    returns = { { name = "result", type = "bool", canBeSecret = false } },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["UnitAlliedRaceInfo"] = {
    key = "UnitAlliedRaceInfo",
    name = "UnitAlliedRaceInfo",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["UnitAlliedRaceInfo"],
    funcPath = "UnitAlliedRaceInfo",
    params = { { name = "unit", type = "UnitToken", default = "player" } },
    returns = { { name = "isAlliedRace", type = "bool", canBeSecret = false }, { name = "hasHeritageArmorUnlocked", type = "bool", canBeSecret = false } },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["UnitArmor"] = {
    key = "UnitArmor",
    name = "UnitArmor",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["UnitArmor"],
    funcPath = "UnitArmor",
    params = { { name = "unit", type = "UnitToken", default = "player" } },
    returns = { { name = "base", type = "number", canBeSecret = false }, { name = "effective", type = "number", canBeSecret = false }, { name = "real", type = "number", canBeSecret = false }, { name = "bonus", type = "number", canBeSecret = false } },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["UnitAttackPower"] = {
    key = "UnitAttackPower",
    name = "UnitAttackPower",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["UnitAttackPower"],
    funcPath = "UnitAttackPower",
    params = { { name = "unit", type = "UnitToken", default = "player" } },
    returns = { { name = "attackPower", type = "number", canBeSecret = false }, { name = "posBuff", type = "number", canBeSecret = false }, { name = "negBuff", type = "number", canBeSecret = false } },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["UnitAttackSpeed"] = {
    key = "UnitAttackSpeed",
    name = "UnitAttackSpeed",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["UnitAttackSpeed"],
    funcPath = "UnitAttackSpeed",
    params = { { name = "unit", type = "UnitToken", default = "player" } },
    returns = { { name = "attackSpeed", type = "number", canBeSecret = false }, { name = "offhandAttackSpeed", type = "number", canBeSecret = false } },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["UnitBattlePetLevel"] = {
    key = "UnitBattlePetLevel",
    name = "UnitBattlePetLevel",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["UnitBattlePetLevel"],
    funcPath = "UnitBattlePetLevel",
    params = { { name = "unit", type = "UnitToken", default = "player" } },
    returns = { { name = "result", type = "number", canBeSecret = false } },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["UnitBattlePetSpeciesID"] = {
    key = "UnitBattlePetSpeciesID",
    name = "UnitBattlePetSpeciesID",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["UnitBattlePetSpeciesID"],
    funcPath = "UnitBattlePetSpeciesID",
    params = { { name = "unit", type = "UnitToken", default = "player" } },
    returns = { { name = "result", type = "number", canBeSecret = false } },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["UnitBattlePetType"] = {
    key = "UnitBattlePetType",
    name = "UnitBattlePetType",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["UnitBattlePetType"],
    funcPath = "UnitBattlePetType",
    params = { { name = "unit", type = "UnitToken", default = "player" } },
    returns = { { name = "result", type = "number", canBeSecret = false } },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["UnitCanAssist"] = {
    key = "UnitCanAssist",
    name = "UnitCanAssist",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["UnitCanAssist"],
    funcPath = "UnitCanAssist",
    params = { { name = "unit", type = "UnitToken", default = "player" }, { name = "target", type = "UnitToken", default = "player" } },
    returns = { { name = "result", type = "bool", canBeSecret = false } },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["UnitCanAttack"] = {
    key = "UnitCanAttack",
    name = "UnitCanAttack",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["UnitCanAttack"],
    funcPath = "UnitCanAttack",
    params = { { name = "unit", type = "UnitToken", default = "player" }, { name = "target", type = "UnitToken", default = "player" } },
    returns = { { name = "result", type = "bool", canBeSecret = false } },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["UnitCanCooperate"] = {
    key = "UnitCanCooperate",
    name = "UnitCanCooperate",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["UnitCanCooperate"],
    funcPath = "UnitCanCooperate",
    params = { { name = "unit", type = "UnitToken", default = "player" }, { name = "target", type = "UnitToken", default = "player" } },
    returns = { { name = "result", type = "bool", canBeSecret = false } },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["UnitCanPetBattle"] = {
    key = "UnitCanPetBattle",
    name = "UnitCanPetBattle",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["UnitCanPetBattle"],
    funcPath = "UnitCanPetBattle",
    params = { { name = "unit", type = "UnitToken", default = "player" }, { name = "target", type = "UnitToken", default = "player" } },
    returns = { { name = "result", type = "bool", canBeSecret = false } },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["UnitCastingDuration"] = {
    key = "UnitCastingDuration",
    name = "UnitCastingDuration",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["UnitCastingDuration"],
    funcPath = "UnitCastingDuration",
    params = { { name = "unit", type = "UnitToken", default = "player" } },
    returns = { { name = "duration", type = "LuaDurationObject", canBeSecret = true } },
    midnightImpact = "HIGH",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted, SecretReturns",
}

APIDefs["UnitCastingInfo"] = {
    key = "UnitCastingInfo",
    name = "UnitCastingInfo",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["UnitCastingInfo"],
    funcPath = "UnitCastingInfo",
    params = { { name = "unit", type = "UnitToken", default = "player" } },
    returns = { { name = "name", type = "cstring", canBeSecret = false }, { name = "displayName", type = "string", canBeSecret = false }, { name = "textureID", type = "fileID", canBeSecret = false }, { name = "startTimeMs", type = "number", canBeSecret = false }, { name = "endTimeMs", type = "number", canBeSecret = false }, { name = "isTradeskill", type = "bool", canBeSecret = false }, { name = "castID", type = "WOWGUID", canBeSecret = false }, { name = "notInterruptible", type = "bool", canBeSecret = false }, { name = "castingSpellID", type = "number", canBeSecret = false } },
    midnightImpact = "CONDITIONAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted, SecretWhenUnitCastingInfoRestricted",
}

APIDefs["UnitChannelDuration"] = {
    key = "UnitChannelDuration",
    name = "UnitChannelDuration",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["UnitChannelDuration"],
    funcPath = "UnitChannelDuration",
    params = { { name = "unit", type = "UnitToken", default = "player" } },
    returns = { { name = "duration", type = "LuaDurationObject", canBeSecret = false } },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["UnitChannelInfo"] = {
    key = "UnitChannelInfo",
    name = "UnitChannelInfo",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["UnitChannelInfo"],
    funcPath = "UnitChannelInfo",
    params = { { name = "unit", type = "UnitToken", default = "player" } },
    returns = { { name = "name", type = "cstring", canBeSecret = false }, { name = "displayName", type = "cstring", canBeSecret = false }, { name = "textureID", type = "fileID", canBeSecret = false }, { name = "startTimeMs", type = "number", canBeSecret = false }, { name = "endTimeMs", type = "number", canBeSecret = false }, { name = "isTradeskill", type = "bool", canBeSecret = false }, { name = "notInterruptible", type = "bool", canBeSecret = false }, { name = "spellID", type = "number", canBeSecret = false }, { name = "isEmpowered", type = "bool", canBeSecret = false }, { name = "numEmpowerStages", type = "number", canBeSecret = false } },
    midnightImpact = "CONDITIONAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted, SecretWhenUnitChannelInfoRestricted",
}

APIDefs["UnitChromieTimeID"] = {
    key = "UnitChromieTimeID",
    name = "UnitChromieTimeID",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["UnitChromieTimeID"],
    funcPath = "UnitChromieTimeID",
    params = { { name = "unit", type = "UnitToken", default = "player" } },
    returns = { { name = "ID", type = "number", canBeSecret = false } },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["UnitClass"] = {
    key = "UnitClass",
    name = "UnitClass",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["UnitClass"],
    funcPath = "UnitClass",
    params = { { name = "unit", type = "UnitToken", default = "player" } },
    returns = { { name = "className", type = "cstring", canBeSecret = false }, { name = "classFilename", type = "cstring", canBeSecret = false }, { name = "classID", type = "number", canBeSecret = false } },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["UnitClassBase"] = {
    key = "UnitClassBase",
    name = "UnitClassBase",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["UnitClassBase"],
    funcPath = "UnitClassBase",
    params = { { name = "unit", type = "UnitToken", default = "player" } },
    returns = { { name = "classFilename", type = "cstring", canBeSecret = false }, { name = "classID", type = "number", canBeSecret = false } },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["UnitClassFromGUID"] = {
    key = "UnitClassFromGUID",
    name = "UnitClassFromGUID",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["UnitClassFromGUID"],
    funcPath = "UnitClassFromGUID",
    params = { { name = "unitGUID", type = "WOWGUID", default = nil } },
    returns = { { name = "className", type = "cstring", canBeSecret = false }, { name = "classFilename", type = "cstring", canBeSecret = false }, { name = "classID", type = "number", canBeSecret = false } },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["UnitClassification"] = {
    key = "UnitClassification",
    name = "UnitClassification",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["UnitClassification"],
    funcPath = "UnitClassification",
    params = { { name = "unit", type = "UnitToken", default = "player" } },
    returns = { { name = "result", type = "cstring", canBeSecret = false } },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["UnitControllingVehicle"] = {
    key = "UnitControllingVehicle",
    name = "UnitControllingVehicle",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["UnitControllingVehicle"],
    funcPath = "UnitControllingVehicle",
    params = { { name = "unit", type = "UnitToken", default = "player" } },
    returns = { { name = "result", type = "bool", canBeSecret = false } },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["UnitCreatureFamily"] = {
    key = "UnitCreatureFamily",
    name = "UnitCreatureFamily",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["UnitCreatureFamily"],
    funcPath = "UnitCreatureFamily",
    params = { { name = "unit", type = "UnitToken", default = "player" } },
    returns = { { name = "name", type = "cstring", canBeSecret = false }, { name = "id", type = "number", canBeSecret = false } },
    midnightImpact = "CONDITIONAL",
    midnightNote = "Secret behavior: SecretWhenUnitIdentityRestricted, SecretArguments=AllowedWhenUntainted",
}

APIDefs["UnitCreatureID"] = {
    key = "UnitCreatureID",
    name = "UnitCreatureID",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["UnitCreatureID"],
    funcPath = "UnitCreatureID",
    params = { { name = "unit", type = "UnitToken", default = "player" } },
    returns = { { name = "creatureID", type = "number", canBeSecret = false } },
    midnightImpact = "CONDITIONAL",
    midnightNote = "Secret behavior: SecretWhenUnitIdentityRestricted, SecretArguments=AllowedWhenUntainted",
}

APIDefs["UnitCreatureType"] = {
    key = "UnitCreatureType",
    name = "UnitCreatureType",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["UnitCreatureType"],
    funcPath = "UnitCreatureType",
    params = { { name = "unit", type = "UnitToken", default = "player" } },
    returns = { { name = "name", type = "cstring", canBeSecret = false }, { name = "id", type = "number", canBeSecret = false } },
    midnightImpact = "CONDITIONAL",
    midnightNote = "Secret behavior: SecretWhenUnitIdentityRestricted, SecretArguments=AllowedWhenUntainted",
}

APIDefs["UnitDamage"] = {
    key = "UnitDamage",
    name = "UnitDamage",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["UnitDamage"],
    funcPath = "UnitDamage",
    params = { { name = "unit", type = "UnitToken", default = "player" } },
    returns = { { name = "minDamage", type = "number", canBeSecret = false }, { name = "maxDamage", type = "number", canBeSecret = false }, { name = "offhandMinDamage", type = "number", canBeSecret = false }, { name = "offhandMaxDamage", type = "number", canBeSecret = false }, { name = "posBuff", type = "number", canBeSecret = false }, { name = "negBuff", type = "number", canBeSecret = false }, { name = "percent", type = "number", canBeSecret = false } },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["UnitDetailedThreatSituation"] = {
    key = "UnitDetailedThreatSituation",
    name = "UnitDetailedThreatSituation",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["UnitDetailedThreatSituation"],
    funcPath = "UnitDetailedThreatSituation",
    params = { { name = "unit", type = "UnitToken", default = "player" }, { name = "mobGUID", type = "UnitToken", default = "player" } },
    returns = { { name = "isTanking", type = "bool", canBeSecret = false }, { name = "status", type = "number", canBeSecret = false }, { name = "scaledPercentage", type = "number", canBeSecret = false }, { name = "rawPercentage", type = "number", canBeSecret = false }, { name = "rawThreat", type = "number", canBeSecret = false } },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["UnitDistanceSquared"] = {
    key = "UnitDistanceSquared",
    name = "UnitDistanceSquared",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["UnitDistanceSquared"],
    funcPath = "UnitDistanceSquared",
    params = { { name = "unit", type = "UnitToken", default = "player" } },
    returns = { { name = "distance", type = "number", canBeSecret = false }, { name = "checkedDistance", type = "bool", canBeSecret = false } },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["UnitEffectiveLevel"] = {
    key = "UnitEffectiveLevel",
    name = "UnitEffectiveLevel",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["UnitEffectiveLevel"],
    funcPath = "UnitEffectiveLevel",
    params = { { name = "name", type = "cstring", default = nil } },
    returns = { { name = "result", type = "number", canBeSecret = false } },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["UnitExists"] = {
    key = "UnitExists",
    name = "UnitExists",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["UnitExists"],
    funcPath = "UnitExists",
    params = { { name = "unit", type = "UnitToken", default = "player" } },
    returns = { { name = "result", type = "bool", canBeSecret = false } },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["UnitFactionGroup"] = {
    key = "UnitFactionGroup",
    name = "UnitFactionGroup",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["UnitFactionGroup"],
    funcPath = "UnitFactionGroup",
    params = { { name = "unitName", type = "cstring", default = nil }, { name = "checkDisplayRace", type = "bool", default = false } },
    returns = { { name = "factionGroupTag", type = "cstring", canBeSecret = false }, { name = "localized", type = "cstring", canBeSecret = false } },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["UnitFullName"] = {
    key = "UnitFullName",
    name = "UnitFullName",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["UnitFullName"],
    funcPath = "UnitFullName",
    params = { { name = "unit", type = "UnitToken", default = "player" } },
    returns = { { name = "unitName", type = "cstring", canBeSecret = false }, { name = "unitServer", type = "cstring", canBeSecret = false } },
    midnightImpact = "CONDITIONAL",
    midnightNote = "Secret behavior: SecretWhenUnitIdentityRestricted, SecretArguments=AllowedWhenUntainted",
}

APIDefs["UnitGUID"] = {
    key = "UnitGUID",
    name = "UnitGUID",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["UnitGUID"],
    funcPath = "UnitGUID",
    params = { { name = "unit", type = "UnitToken", default = "player" } },
    returns = { { name = "result", type = "WOWGUID", canBeSecret = false } },
    midnightImpact = "CONDITIONAL",
    midnightNote = "Secret behavior: SecretWhenUnitIdentityRestricted, SecretArguments=AllowedWhenUntainted",
}

APIDefs["UnitGetAvailableRoles"] = {
    key = "UnitGetAvailableRoles",
    name = "UnitGetAvailableRoles",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["UnitGetAvailableRoles"],
    funcPath = "UnitGetAvailableRoles",
    params = { { name = "unit", type = "UnitToken", default = "player" } },
    returns = { { name = "tank", type = "bool", canBeSecret = false }, { name = "healer", type = "bool", canBeSecret = false }, { name = "dps", type = "bool", canBeSecret = false } },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["UnitGetDetailedHealPrediction"] = {
    key = "UnitGetDetailedHealPrediction",
    name = "UnitGetDetailedHealPrediction",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["UnitGetDetailedHealPrediction"],
    funcPath = "UnitGetDetailedHealPrediction",
    params = { { name = "unit", type = "UnitToken", default = "player" }, { name = "healerUnit", type = "UnitToken", default = "player" }, { name = "healPredictionCalculator", type = "UnitHealPredictionCalculator", default = nil } },
    returns = {  },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["UnitGetIncomingHeals"] = {
    key = "UnitGetIncomingHeals",
    name = "UnitGetIncomingHeals",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["UnitGetIncomingHeals"],
    funcPath = "UnitGetIncomingHeals",
    params = { { name = "unit", type = "UnitToken", default = "player" }, { name = "healerGUID", type = "UnitToken", default = "player" } },
    returns = { { name = "result", type = "number", canBeSecret = true } },
    midnightImpact = "HIGH",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted, SecretReturns",
}

APIDefs["UnitGetTotalAbsorbs"] = {
    key = "UnitGetTotalAbsorbs",
    name = "UnitGetTotalAbsorbs",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["UnitGetTotalAbsorbs"],
    funcPath = "UnitGetTotalAbsorbs",
    params = { { name = "unit", type = "UnitToken", default = "player" } },
    returns = { { name = "result", type = "number", canBeSecret = true } },
    midnightImpact = "HIGH",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted, SecretReturns",
}

APIDefs["UnitGetTotalHealAbsorbs"] = {
    key = "UnitGetTotalHealAbsorbs",
    name = "UnitGetTotalHealAbsorbs",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["UnitGetTotalHealAbsorbs"],
    funcPath = "UnitGetTotalHealAbsorbs",
    params = { { name = "unit", type = "UnitToken", default = "player" } },
    returns = { { name = "result", type = "number", canBeSecret = true } },
    midnightImpact = "HIGH",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted, SecretReturns",
}

APIDefs["UnitGroupRolesAssigned"] = {
    key = "UnitGroupRolesAssigned",
    name = "UnitGroupRolesAssigned",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["UnitGroupRolesAssigned"],
    funcPath = "UnitGroupRolesAssigned",
    params = { { name = "unit", type = "UnitToken", default = "player" } },
    returns = { { name = "result", type = "cstring", canBeSecret = false } },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["UnitGroupRolesAssignedEnum"] = {
    key = "UnitGroupRolesAssignedEnum",
    name = "UnitGroupRolesAssignedEnum",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["UnitGroupRolesAssignedEnum"],
    funcPath = "UnitGroupRolesAssignedEnum",
    params = { { name = "unit", type = "UnitToken", default = "player" } },
    returns = { { name = "result", type = "number", canBeSecret = false } },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["UnitHPPerStamina"] = {
    key = "UnitHPPerStamina",
    name = "UnitHPPerStamina",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["UnitHPPerStamina"],
    funcPath = "UnitHPPerStamina",
    params = { { name = "unit", type = "UnitToken", default = "player" } },
    returns = { { name = "result", type = "number", canBeSecret = false } },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["UnitHasRelicSlot"] = {
    key = "UnitHasRelicSlot",
    name = "UnitHasRelicSlot",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["UnitHasRelicSlot"],
    funcPath = "UnitHasRelicSlot",
    params = { { name = "unit", type = "UnitToken", default = "player" } },
    returns = { { name = "result", type = "bool", canBeSecret = false } },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["UnitHasVehiclePlayerFrameUI"] = {
    key = "UnitHasVehiclePlayerFrameUI",
    name = "UnitHasVehiclePlayerFrameUI",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["UnitHasVehiclePlayerFrameUI"],
    funcPath = "UnitHasVehiclePlayerFrameUI",
    params = { { name = "unit", type = "UnitToken", default = "player" } },
    returns = { { name = "result", type = "bool", canBeSecret = false } },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["UnitHasVehicleUI"] = {
    key = "UnitHasVehicleUI",
    name = "UnitHasVehicleUI",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["UnitHasVehicleUI"],
    funcPath = "UnitHasVehicleUI",
    params = { { name = "unit", type = "UnitToken", default = "player" } },
    returns = { { name = "result", type = "bool", canBeSecret = false } },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["UnitHealth"] = {
    key = "UnitHealth",
    name = "UnitHealth",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["UnitHealth"],
    funcPath = "UnitHealth",
    params = { { name = "unit", type = "UnitToken", default = "player" }, { name = "usePredicted", type = "bool", default = true } },
    returns = { { name = "result", type = "number", canBeSecret = true } },
    midnightImpact = "HIGH",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted, SecretReturns",
}

APIDefs["UnitHealthMax"] = {
    key = "UnitHealthMax",
    name = "UnitHealthMax",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["UnitHealthMax"],
    funcPath = "UnitHealthMax",
    params = { { name = "unit", type = "UnitToken", default = "player" } },
    returns = { { name = "result", type = "number", canBeSecret = false } },
    midnightImpact = "CONDITIONAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted, SecretWhenUnitHealthMaxRestricted",
}

APIDefs["UnitHealthMissing"] = {
    key = "UnitHealthMissing",
    name = "UnitHealthMissing",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["UnitHealthMissing"],
    funcPath = "UnitHealthMissing",
    params = { { name = "unit", type = "UnitToken", default = "player" }, { name = "usePredicted", type = "bool", default = true } },
    returns = { { name = "result", type = "number", canBeSecret = true } },
    midnightImpact = "HIGH",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted, SecretReturns",
}

APIDefs["UnitHealthPercent"] = {
    key = "UnitHealthPercent",
    name = "UnitHealthPercent",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["UnitHealthPercent"],
    funcPath = "UnitHealthPercent",
    params = { { name = "unit", type = "UnitToken", default = "player" }, { name = "usePredicted", type = "bool", default = true }, { name = "curve", type = "LuaCurveObjectBase", default = nil } },
    returns = { { name = "result", type = "LuaCurveEvaluatedResult", canBeSecret = true } },
    midnightImpact = "HIGH",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted, SecretReturns, SecretWhenCurveSecret",
}

APIDefs["UnitHonor"] = {
    key = "UnitHonor",
    name = "UnitHonor",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["UnitHonor"],
    funcPath = "UnitHonor",
    params = { { name = "unit", type = "UnitToken", default = "player" } },
    returns = { { name = "result", type = "number", canBeSecret = false } },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["UnitHonorLevel"] = {
    key = "UnitHonorLevel",
    name = "UnitHonorLevel",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["UnitHonorLevel"],
    funcPath = "UnitHonorLevel",
    params = { { name = "unit", type = "UnitToken", default = "player" } },
    returns = { { name = "result", type = "number", canBeSecret = false } },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["UnitHonorMax"] = {
    key = "UnitHonorMax",
    name = "UnitHonorMax",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["UnitHonorMax"],
    funcPath = "UnitHonorMax",
    params = { { name = "unit", type = "UnitToken", default = "player" } },
    returns = { { name = "result", type = "number", canBeSecret = false } },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["UnitInAnyGroup"] = {
    key = "UnitInAnyGroup",
    name = "UnitInAnyGroup",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["UnitInAnyGroup"],
    funcPath = "UnitInAnyGroup",
    params = { { name = "unit", type = "UnitToken", default = "player" }, { name = "partyIndex", type = "luaIndex", default = nil } },
    returns = { { name = "result", type = "bool", canBeSecret = false } },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["UnitInBattleground"] = {
    key = "UnitInBattleground",
    name = "UnitInBattleground",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["UnitInBattleground"],
    funcPath = "UnitInBattleground",
    params = { { name = "unit", type = "UnitToken", default = "player" }, { name = "partyIndex", type = "luaIndex", default = nil } },
    returns = { { name = "result", type = "luaIndex", canBeSecret = false } },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["UnitInOtherParty"] = {
    key = "UnitInOtherParty",
    name = "UnitInOtherParty",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["UnitInOtherParty"],
    funcPath = "UnitInOtherParty",
    params = { { name = "unit", type = "UnitToken", default = "player" } },
    returns = { { name = "inOtherParty", type = "bool", canBeSecret = false } },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["UnitInParty"] = {
    key = "UnitInParty",
    name = "UnitInParty",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["UnitInParty"],
    funcPath = "UnitInParty",
    params = { { name = "unit", type = "UnitToken", default = "player" }, { name = "partyIndex", type = "luaIndex", default = nil } },
    returns = { { name = "result", type = "bool", canBeSecret = false } },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["UnitInPartyIsAI"] = {
    key = "UnitInPartyIsAI",
    name = "UnitInPartyIsAI",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["UnitInPartyIsAI"],
    funcPath = "UnitInPartyIsAI",
    params = { { name = "unit", type = "UnitToken", default = "player" } },
    returns = { { name = "result", type = "bool", canBeSecret = false } },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["UnitInPartyShard"] = {
    key = "UnitInPartyShard",
    name = "UnitInPartyShard",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["UnitInPartyShard"],
    funcPath = "UnitInPartyShard",
    params = { { name = "unit", type = "UnitToken", default = "player" } },
    returns = { { name = "inPartyShard", type = "bool", canBeSecret = false } },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["UnitInRaid"] = {
    key = "UnitInRaid",
    name = "UnitInRaid",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["UnitInRaid"],
    funcPath = "UnitInRaid",
    params = { { name = "unit", type = "UnitToken", default = "player" }, { name = "partyIndex", type = "luaIndex", default = nil } },
    returns = { { name = "result", type = "luaIndex", canBeSecret = false } },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["UnitInRange"] = {
    key = "UnitInRange",
    name = "UnitInRange",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["UnitInRange"],
    funcPath = "UnitInRange",
    params = { { name = "unit", type = "UnitToken", default = "player" } },
    returns = { { name = "inRange", type = "bool", canBeSecret = true }, { name = "checkedRange", type = "bool", canBeSecret = true } },
    midnightImpact = "HIGH",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted, SecretReturns",
}

APIDefs["UnitInSubgroup"] = {
    key = "UnitInSubgroup",
    name = "UnitInSubgroup",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["UnitInSubgroup"],
    funcPath = "UnitInSubgroup",
    params = { { name = "unit", type = "UnitToken", default = "player" }, { name = "partyIndex", type = "luaIndex", default = nil } },
    returns = { { name = "result", type = "bool", canBeSecret = false } },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["UnitInVehicle"] = {
    key = "UnitInVehicle",
    name = "UnitInVehicle",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["UnitInVehicle"],
    funcPath = "UnitInVehicle",
    params = { { name = "unit", type = "UnitToken", default = "player" } },
    returns = { { name = "result", type = "bool", canBeSecret = false } },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["UnitInVehicleControlSeat"] = {
    key = "UnitInVehicleControlSeat",
    name = "UnitInVehicleControlSeat",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["UnitInVehicleControlSeat"],
    funcPath = "UnitInVehicleControlSeat",
    params = { { name = "unit", type = "UnitToken", default = "player" } },
    returns = { { name = "result", type = "bool", canBeSecret = false } },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["UnitInVehicleHidesPetFrame"] = {
    key = "UnitInVehicleHidesPetFrame",
    name = "UnitInVehicleHidesPetFrame",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["UnitInVehicleHidesPetFrame"],
    funcPath = "UnitInVehicleHidesPetFrame",
    params = { { name = "unit", type = "UnitToken", default = "player" } },
    returns = { { name = "result", type = "bool", canBeSecret = false } },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["UnitIsAFK"] = {
    key = "UnitIsAFK",
    name = "UnitIsAFK",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["UnitIsAFK"],
    funcPath = "UnitIsAFK",
    params = { { name = "unit", type = "UnitToken", default = "player" } },
    returns = { { name = "result", type = "bool", canBeSecret = false } },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["UnitIsBattlePet"] = {
    key = "UnitIsBattlePet",
    name = "UnitIsBattlePet",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["UnitIsBattlePet"],
    funcPath = "UnitIsBattlePet",
    params = { { name = "unit", type = "UnitToken", default = "player" } },
    returns = { { name = "result", type = "bool", canBeSecret = false } },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["UnitIsBattlePetCompanion"] = {
    key = "UnitIsBattlePetCompanion",
    name = "UnitIsBattlePetCompanion",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["UnitIsBattlePetCompanion"],
    funcPath = "UnitIsBattlePetCompanion",
    params = { { name = "unit", type = "UnitToken", default = "player" } },
    returns = { { name = "result", type = "bool", canBeSecret = false } },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["UnitIsBossMob"] = {
    key = "UnitIsBossMob",
    name = "UnitIsBossMob",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["UnitIsBossMob"],
    funcPath = "UnitIsBossMob",
    params = { { name = "unit", type = "UnitToken", default = "player" } },
    returns = { { name = "result", type = "bool", canBeSecret = false } },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["UnitIsCharmed"] = {
    key = "UnitIsCharmed",
    name = "UnitIsCharmed",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["UnitIsCharmed"],
    funcPath = "UnitIsCharmed",
    params = { { name = "unit", type = "UnitToken", default = "player" } },
    returns = { { name = "result", type = "bool", canBeSecret = false } },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["UnitIsConnected"] = {
    key = "UnitIsConnected",
    name = "UnitIsConnected",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["UnitIsConnected"],
    funcPath = "UnitIsConnected",
    params = { { name = "unit", type = "UnitToken", default = "player" } },
    returns = { { name = "isConnected", type = "bool", canBeSecret = false } },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["UnitIsControlling"] = {
    key = "UnitIsControlling",
    name = "UnitIsControlling",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["UnitIsControlling"],
    funcPath = "UnitIsControlling",
    params = { { name = "unit", type = "UnitToken", default = "player" } },
    returns = { { name = "result", type = "bool", canBeSecret = false } },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["UnitIsCorpse"] = {
    key = "UnitIsCorpse",
    name = "UnitIsCorpse",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["UnitIsCorpse"],
    funcPath = "UnitIsCorpse",
    params = { { name = "unit", type = "UnitToken", default = "player" } },
    returns = { { name = "result", type = "bool", canBeSecret = false } },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["UnitIsDND"] = {
    key = "UnitIsDND",
    name = "UnitIsDND",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["UnitIsDND"],
    funcPath = "UnitIsDND",
    params = { { name = "unit", type = "UnitToken", default = "player" } },
    returns = { { name = "result", type = "bool", canBeSecret = false } },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["UnitIsDead"] = {
    key = "UnitIsDead",
    name = "UnitIsDead",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["UnitIsDead"],
    funcPath = "UnitIsDead",
    params = { { name = "unit", type = "UnitToken", default = "player" } },
    returns = { { name = "result", type = "bool", canBeSecret = false } },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["UnitIsDeadOrGhost"] = {
    key = "UnitIsDeadOrGhost",
    name = "UnitIsDeadOrGhost",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["UnitIsDeadOrGhost"],
    funcPath = "UnitIsDeadOrGhost",
    params = { { name = "unit", type = "UnitToken", default = "player" } },
    returns = { { name = "result", type = "bool", canBeSecret = false } },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["UnitIsEnemy"] = {
    key = "UnitIsEnemy",
    name = "UnitIsEnemy",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["UnitIsEnemy"],
    funcPath = "UnitIsEnemy",
    params = { { name = "unit", type = "UnitToken", default = "player" }, { name = "target", type = "UnitToken", default = "player" } },
    returns = { { name = "result", type = "bool", canBeSecret = false } },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["UnitIsFeignDeath"] = {
    key = "UnitIsFeignDeath",
    name = "UnitIsFeignDeath",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["UnitIsFeignDeath"],
    funcPath = "UnitIsFeignDeath",
    params = { { name = "unit", type = "UnitToken", default = "player" } },
    returns = { { name = "result", type = "bool", canBeSecret = false } },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["UnitIsFriend"] = {
    key = "UnitIsFriend",
    name = "UnitIsFriend",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["UnitIsFriend"],
    funcPath = "UnitIsFriend",
    params = { { name = "unit", type = "UnitToken", default = "player" }, { name = "target", type = "UnitToken", default = "player" } },
    returns = { { name = "result", type = "bool", canBeSecret = false } },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["UnitIsGameObject"] = {
    key = "UnitIsGameObject",
    name = "UnitIsGameObject",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["UnitIsGameObject"],
    funcPath = "UnitIsGameObject",
    params = { { name = "unit", type = "UnitToken", default = "player" } },
    returns = { { name = "result", type = "bool", canBeSecret = false } },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["UnitIsGhost"] = {
    key = "UnitIsGhost",
    name = "UnitIsGhost",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["UnitIsGhost"],
    funcPath = "UnitIsGhost",
    params = { { name = "unit", type = "UnitToken", default = "player" } },
    returns = { { name = "result", type = "bool", canBeSecret = false } },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["UnitIsGroupAssistant"] = {
    key = "UnitIsGroupAssistant",
    name = "UnitIsGroupAssistant",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["UnitIsGroupAssistant"],
    funcPath = "UnitIsGroupAssistant",
    params = { { name = "unit", type = "UnitToken", default = "player" } },
    returns = { { name = "isAssistant", type = "bool", canBeSecret = false } },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["UnitIsGroupLeader"] = {
    key = "UnitIsGroupLeader",
    name = "UnitIsGroupLeader",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["UnitIsGroupLeader"],
    funcPath = "UnitIsGroupLeader",
    params = { { name = "unit", type = "UnitToken", default = "player" }, { name = "partyCategory", type = "luaIndex", default = nil } },
    returns = { { name = "isLeader", type = "bool", canBeSecret = false } },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["UnitIsHumanPlayer"] = {
    key = "UnitIsHumanPlayer",
    name = "UnitIsHumanPlayer",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["UnitIsHumanPlayer"],
    funcPath = "UnitIsHumanPlayer",
    params = { { name = "unit", type = "UnitToken", default = "player" }, { name = "partyIndex", type = "luaIndex", default = nil } },
    returns = { { name = "result", type = "bool", canBeSecret = false } },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["UnitIsInMyGuild"] = {
    key = "UnitIsInMyGuild",
    name = "UnitIsInMyGuild",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["UnitIsInMyGuild"],
    funcPath = "UnitIsInMyGuild",
    params = { { name = "unit", type = "cstring", default = nil } },
    returns = { { name = "result", type = "bool", canBeSecret = false } },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["UnitIsInteractable"] = {
    key = "UnitIsInteractable",
    name = "UnitIsInteractable",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["UnitIsInteractable"],
    funcPath = "UnitIsInteractable",
    params = { { name = "unit", type = "UnitToken", default = "player" } },
    returns = { { name = "result", type = "bool", canBeSecret = false } },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["UnitIsLieutenant"] = {
    key = "UnitIsLieutenant",
    name = "UnitIsLieutenant",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["UnitIsLieutenant"],
    funcPath = "UnitIsLieutenant",
    params = { { name = "unit", type = "UnitToken", default = "player" } },
    returns = { { name = "result", type = "bool", canBeSecret = false } },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["UnitIsMercenary"] = {
    key = "UnitIsMercenary",
    name = "UnitIsMercenary",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["UnitIsMercenary"],
    funcPath = "UnitIsMercenary",
    params = { { name = "name", type = "cstring", default = nil } },
    returns = { { name = "result", type = "bool", canBeSecret = false } },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["UnitIsMinion"] = {
    key = "UnitIsMinion",
    name = "UnitIsMinion",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["UnitIsMinion"],
    funcPath = "UnitIsMinion",
    params = { { name = "unit", type = "UnitToken", default = "player" } },
    returns = { { name = "result", type = "bool", canBeSecret = false } },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["UnitIsNPCAsPlayer"] = {
    key = "UnitIsNPCAsPlayer",
    name = "UnitIsNPCAsPlayer",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["UnitIsNPCAsPlayer"],
    funcPath = "UnitIsNPCAsPlayer",
    params = { { name = "unit", type = "UnitToken", default = "player" } },
    returns = { { name = "result", type = "bool", canBeSecret = false } },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["UnitIsOtherPlayersBattlePet"] = {
    key = "UnitIsOtherPlayersBattlePet",
    name = "UnitIsOtherPlayersBattlePet",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["UnitIsOtherPlayersBattlePet"],
    funcPath = "UnitIsOtherPlayersBattlePet",
    params = { { name = "unit", type = "UnitToken", default = "player" } },
    returns = { { name = "result", type = "bool", canBeSecret = false } },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["UnitIsOtherPlayersPet"] = {
    key = "UnitIsOtherPlayersPet",
    name = "UnitIsOtherPlayersPet",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["UnitIsOtherPlayersPet"],
    funcPath = "UnitIsOtherPlayersPet",
    params = { { name = "unit", type = "UnitToken", default = "player" } },
    returns = { { name = "result", type = "bool", canBeSecret = false } },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["UnitIsOwnerOrControllerOfUnit"] = {
    key = "UnitIsOwnerOrControllerOfUnit",
    name = "UnitIsOwnerOrControllerOfUnit",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["UnitIsOwnerOrControllerOfUnit"],
    funcPath = "UnitIsOwnerOrControllerOfUnit",
    params = { { name = "controllingUnit", type = "UnitToken", default = "player" }, { name = "controlledUnit", type = "UnitToken", default = "player" } },
    returns = { { name = "unitIsOwnerOrControllerOfUnit", type = "bool", canBeSecret = false } },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["UnitIsPVP"] = {
    key = "UnitIsPVP",
    name = "UnitIsPVP",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["UnitIsPVP"],
    funcPath = "UnitIsPVP",
    params = { { name = "unit", type = "UnitToken", default = "player" } },
    returns = { { name = "result", type = "bool", canBeSecret = false } },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["UnitIsPVPFreeForAll"] = {
    key = "UnitIsPVPFreeForAll",
    name = "UnitIsPVPFreeForAll",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["UnitIsPVPFreeForAll"],
    funcPath = "UnitIsPVPFreeForAll",
    params = { { name = "unit", type = "UnitToken", default = "player" } },
    returns = { { name = "result", type = "bool", canBeSecret = false } },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["UnitIsPVPSanctuary"] = {
    key = "UnitIsPVPSanctuary",
    name = "UnitIsPVPSanctuary",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["UnitIsPVPSanctuary"],
    funcPath = "UnitIsPVPSanctuary",
    params = { { name = "unit", type = "UnitToken", default = "player" } },
    returns = { { name = "result", type = "bool", canBeSecret = false } },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["UnitIsPlayer"] = {
    key = "UnitIsPlayer",
    name = "UnitIsPlayer",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["UnitIsPlayer"],
    funcPath = "UnitIsPlayer",
    params = { { name = "unit", type = "UnitToken", default = "player" }, { name = "partyIndex", type = "luaIndex", default = nil } },
    returns = { { name = "result", type = "bool", canBeSecret = false } },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["UnitIsPossessed"] = {
    key = "UnitIsPossessed",
    name = "UnitIsPossessed",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["UnitIsPossessed"],
    funcPath = "UnitIsPossessed",
    params = { { name = "unit", type = "UnitToken", default = "player" } },
    returns = { { name = "result", type = "bool", canBeSecret = false } },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["UnitIsQuestBoss"] = {
    key = "UnitIsQuestBoss",
    name = "UnitIsQuestBoss",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["UnitIsQuestBoss"],
    funcPath = "UnitIsQuestBoss",
    params = { { name = "unit", type = "UnitToken", default = "player" } },
    returns = { { name = "result", type = "bool", canBeSecret = false } },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["UnitIsRaidOfficer"] = {
    key = "UnitIsRaidOfficer",
    name = "UnitIsRaidOfficer",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["UnitIsRaidOfficer"],
    funcPath = "UnitIsRaidOfficer",
    params = { { name = "unit", type = "UnitToken", default = "player" } },
    returns = { { name = "result", type = "bool", canBeSecret = false } },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["UnitIsSameServer"] = {
    key = "UnitIsSameServer",
    name = "UnitIsSameServer",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["UnitIsSameServer"],
    funcPath = "UnitIsSameServer",
    params = { { name = "unitName", type = "cstring", default = nil } },
    returns = { { name = "result", type = "bool", canBeSecret = false } },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["UnitIsSpellTarget"] = {
    key = "UnitIsSpellTarget",
    name = "UnitIsSpellTarget",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["UnitIsSpellTarget"],
    funcPath = "UnitIsSpellTarget",
    params = { { name = "unit", type = "UnitToken", default = "player" }, { name = "target", type = "UnitToken", default = "player" } },
    returns = { { name = "result", type = "bool", canBeSecret = true } },
    midnightImpact = "HIGH",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted, SecretReturns",
}

APIDefs["UnitIsTapDenied"] = {
    key = "UnitIsTapDenied",
    name = "UnitIsTapDenied",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["UnitIsTapDenied"],
    funcPath = "UnitIsTapDenied",
    params = { { name = "unit", type = "UnitToken", default = "player" } },
    returns = { { name = "result", type = "bool", canBeSecret = false } },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["UnitIsTrivial"] = {
    key = "UnitIsTrivial",
    name = "UnitIsTrivial",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["UnitIsTrivial"],
    funcPath = "UnitIsTrivial",
    params = { { name = "unit", type = "UnitToken", default = "player" } },
    returns = { { name = "result", type = "bool", canBeSecret = false } },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["UnitIsUnconscious"] = {
    key = "UnitIsUnconscious",
    name = "UnitIsUnconscious",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["UnitIsUnconscious"],
    funcPath = "UnitIsUnconscious",
    params = { { name = "unit", type = "UnitToken", default = "player" } },
    returns = { { name = "result", type = "bool", canBeSecret = false } },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["UnitIsUnit"] = {
    key = "UnitIsUnit",
    name = "UnitIsUnit",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["UnitIsUnit"],
    funcPath = "UnitIsUnit",
    params = { { name = "unit1", type = "UnitToken", default = "player" }, { name = "unit2", type = "UnitToken", default = "player" } },
    returns = { { name = "result", type = "bool", canBeSecret = false } },
    midnightImpact = "CONDITIONAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted, SecretWhenUnitComparisonRestricted",
}

APIDefs["UnitIsVisible"] = {
    key = "UnitIsVisible",
    name = "UnitIsVisible",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["UnitIsVisible"],
    funcPath = "UnitIsVisible",
    params = { { name = "unit", type = "UnitToken", default = "player" } },
    returns = { { name = "result", type = "bool", canBeSecret = false } },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["UnitIsWildBattlePet"] = {
    key = "UnitIsWildBattlePet",
    name = "UnitIsWildBattlePet",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["UnitIsWildBattlePet"],
    funcPath = "UnitIsWildBattlePet",
    params = { { name = "unit", type = "UnitToken", default = "player" } },
    returns = { { name = "result", type = "bool", canBeSecret = false } },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["UnitLeadsAnyGroup"] = {
    key = "UnitLeadsAnyGroup",
    name = "UnitLeadsAnyGroup",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["UnitLeadsAnyGroup"],
    funcPath = "UnitLeadsAnyGroup",
    params = { { name = "unit", type = "UnitToken", default = "player" } },
    returns = { { name = "isLeader", type = "bool", canBeSecret = false } },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["UnitLevel"] = {
    key = "UnitLevel",
    name = "UnitLevel",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["UnitLevel"],
    funcPath = "UnitLevel",
    params = { { name = "name", type = "cstring", default = nil } },
    returns = { { name = "result", type = "number", canBeSecret = false } },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["UnitName"] = {
    key = "UnitName",
    name = "UnitName",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["UnitName"],
    funcPath = "UnitName",
    params = { { name = "unit", type = "UnitToken", default = "player" } },
    returns = { { name = "unitName", type = "cstring", canBeSecret = false }, { name = "unitServer", type = "cstring", canBeSecret = false } },
    midnightImpact = "CONDITIONAL",
    midnightNote = "Secret behavior: SecretWhenUnitIdentityRestricted, SecretArguments=AllowedWhenTainted",
}

APIDefs["UnitNameFromGUID"] = {
    key = "UnitNameFromGUID",
    name = "UnitNameFromGUID",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["UnitNameFromGUID"],
    funcPath = "UnitNameFromGUID",
    params = { { name = "unitGUID", type = "WOWGUID", default = nil } },
    returns = { { name = "unitName", type = "cstring", canBeSecret = false }, { name = "unitServer", type = "cstring", canBeSecret = false } },
    midnightImpact = "CONDITIONAL",
    midnightNote = "Secret behavior: SecretWhenUnitIdentityRestricted, SecretArguments=AllowedWhenTainted",
}

APIDefs["UnitNameUnmodified"] = {
    key = "UnitNameUnmodified",
    name = "UnitNameUnmodified",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["UnitNameUnmodified"],
    funcPath = "UnitNameUnmodified",
    params = { { name = "unit", type = "UnitToken", default = "player" } },
    returns = { { name = "unitName", type = "cstring", canBeSecret = false }, { name = "unitServer", type = "cstring", canBeSecret = false } },
    midnightImpact = "CONDITIONAL",
    midnightNote = "Secret behavior: SecretWhenUnitIdentityRestricted, SecretArguments=AllowedWhenUntainted",
}

APIDefs["UnitNameplateShowsWidgetsOnly"] = {
    key = "UnitNameplateShowsWidgetsOnly",
    name = "UnitNameplateShowsWidgetsOnly",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["UnitNameplateShowsWidgetsOnly"],
    funcPath = "UnitNameplateShowsWidgetsOnly",
    params = { { name = "unit", type = "UnitToken", default = "player" } },
    returns = { { name = "nameplateShowsWidgetsOnly", type = "bool", canBeSecret = false } },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["UnitNumPowerBarTimers"] = {
    key = "UnitNumPowerBarTimers",
    name = "UnitNumPowerBarTimers",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["UnitNumPowerBarTimers"],
    funcPath = "UnitNumPowerBarTimers",
    params = { { name = "unit", type = "UnitToken", default = "player" } },
    returns = { { name = "result", type = "number", canBeSecret = false } },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["UnitOnTaxi"] = {
    key = "UnitOnTaxi",
    name = "UnitOnTaxi",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["UnitOnTaxi"],
    funcPath = "UnitOnTaxi",
    params = { { name = "unit", type = "UnitToken", default = "player" } },
    returns = { { name = "result", type = "bool", canBeSecret = false } },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["UnitOwnerGUID"] = {
    key = "UnitOwnerGUID",
    name = "UnitOwnerGUID",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["UnitOwnerGUID"],
    funcPath = "UnitOwnerGUID",
    params = { { name = "unit", type = "UnitToken", default = "player" } },
    returns = { { name = "ownerGUID", type = "WOWGUID", canBeSecret = false } },
    midnightImpact = "CONDITIONAL",
    midnightNote = "Secret behavior: SecretWhenUnitIdentityRestricted, SecretArguments=AllowedWhenUntainted",
}

APIDefs["UnitPVPName"] = {
    key = "UnitPVPName",
    name = "UnitPVPName",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["UnitPVPName"],
    funcPath = "UnitPVPName",
    params = { { name = "unit", type = "UnitToken", default = "player" } },
    returns = { { name = "result", type = "string", canBeSecret = false } },
    midnightImpact = "CONDITIONAL",
    midnightNote = "Secret behavior: SecretWhenUnitIdentityRestricted, SecretArguments=AllowedWhenUntainted",
}

APIDefs["UnitPartialPower"] = {
    key = "UnitPartialPower",
    name = "UnitPartialPower",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["UnitPartialPower"],
    funcPath = "UnitPartialPower",
    params = { { name = "unitToken", type = "UnitToken", default = "player" }, { name = "powerType", type = "PowerType", default = nil }, { name = "unmodified", type = "bool", default = false } },
    returns = { { name = "partialPower", type = "number", canBeSecret = false } },
    midnightImpact = "CONDITIONAL",
    midnightNote = "Secret behavior: SecretWhenUnitPowerRestricted, SecretArguments=AllowedWhenUntainted",
}

APIDefs["UnitPercentHealthFromGUID"] = {
    key = "UnitPercentHealthFromGUID",
    name = "UnitPercentHealthFromGUID",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["UnitPercentHealthFromGUID"],
    funcPath = "UnitPercentHealthFromGUID",
    params = { { name = "unitGUID", type = "WOWGUID", default = nil } },
    returns = { { name = "percentHealth", type = "number", canBeSecret = true } },
    midnightImpact = "HIGH",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenTainted, SecretReturns",
}

APIDefs["UnitPhaseReason"] = {
    key = "UnitPhaseReason",
    name = "UnitPhaseReason",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["UnitPhaseReason"],
    funcPath = "UnitPhaseReason",
    params = { { name = "unit", type = "UnitToken", default = "player" } },
    returns = { { name = "reason", type = "PhaseReason", canBeSecret = false } },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["UnitPlayerControlled"] = {
    key = "UnitPlayerControlled",
    name = "UnitPlayerControlled",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["UnitPlayerControlled"],
    funcPath = "UnitPlayerControlled",
    params = { { name = "unit", type = "UnitToken", default = "player" } },
    returns = { { name = "result", type = "bool", canBeSecret = false } },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["UnitPlayerOrPetInParty"] = {
    key = "UnitPlayerOrPetInParty",
    name = "UnitPlayerOrPetInParty",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["UnitPlayerOrPetInParty"],
    funcPath = "UnitPlayerOrPetInParty",
    params = { { name = "unit", type = "UnitToken", default = "player" }, { name = "partyIndex", type = "luaIndex", default = nil } },
    returns = { { name = "result", type = "bool", canBeSecret = false } },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["UnitPlayerOrPetInRaid"] = {
    key = "UnitPlayerOrPetInRaid",
    name = "UnitPlayerOrPetInRaid",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["UnitPlayerOrPetInRaid"],
    funcPath = "UnitPlayerOrPetInRaid",
    params = { { name = "unit", type = "UnitToken", default = "player" }, { name = "partyIndex", type = "luaIndex", default = nil } },
    returns = { { name = "result", type = "bool", canBeSecret = false } },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["UnitPosition"] = {
    key = "UnitPosition",
    name = "UnitPosition",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["UnitPosition"],
    funcPath = "UnitPosition",
    params = { { name = "unit", type = "UnitToken", default = "player" } },
    returns = { { name = "positionX", type = "number", canBeSecret = false }, { name = "positionY", type = "number", canBeSecret = false }, { name = "positionZ", type = "number", canBeSecret = false }, { name = "mapID", type = "number", canBeSecret = false } },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["UnitPower"] = {
    key = "UnitPower",
    name = "UnitPower",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["UnitPower"],
    funcPath = "UnitPower",
    params = { { name = "unitToken", type = "UnitToken", default = "player" }, { name = "powerType", type = "PowerType", default = nil }, { name = "unmodified", type = "bool", default = false } },
    returns = { { name = "power", type = "number", canBeSecret = false } },
    midnightImpact = "CONDITIONAL",
    midnightNote = "Secret behavior: SecretWhenUnitPowerRestricted, SecretArguments=AllowedWhenUntainted",
}

APIDefs["UnitPowerBarID"] = {
    key = "UnitPowerBarID",
    name = "UnitPowerBarID",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["UnitPowerBarID"],
    funcPath = "UnitPowerBarID",
    params = { { name = "unitToken", type = "UnitToken", default = "player" } },
    returns = { { name = "barID", type = "number", canBeSecret = false } },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["UnitPowerBarTimerInfo"] = {
    key = "UnitPowerBarTimerInfo",
    name = "UnitPowerBarTimerInfo",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["UnitPowerBarTimerInfo"],
    funcPath = "UnitPowerBarTimerInfo",
    params = { { name = "unit", type = "UnitToken", default = "player" }, { name = "index", type = "luaIndex", default = 0 } },
    returns = { { name = "duration", type = "number", canBeSecret = true }, { name = "expiration", type = "number", canBeSecret = true }, { name = "barID", type = "number", canBeSecret = true }, { name = "auraID", type = "number", canBeSecret = true } },
    midnightImpact = "HIGH",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted, SecretReturns",
}

APIDefs["UnitPowerDisplayMod"] = {
    key = "UnitPowerDisplayMod",
    name = "UnitPowerDisplayMod",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["UnitPowerDisplayMod"],
    funcPath = "UnitPowerDisplayMod",
    params = { { name = "powerType", type = "PowerType", default = nil } },
    returns = { { name = "displayMod", type = "number", canBeSecret = false } },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["UnitPowerMax"] = {
    key = "UnitPowerMax",
    name = "UnitPowerMax",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["UnitPowerMax"],
    funcPath = "UnitPowerMax",
    params = { { name = "unitToken", type = "UnitToken", default = "player" }, { name = "powerType", type = "PowerType", default = nil }, { name = "unmodified", type = "bool", default = false } },
    returns = { { name = "maxPower", type = "number", canBeSecret = false } },
    midnightImpact = "CONDITIONAL",
    midnightNote = "Secret behavior: SecretWhenUnitPowerMaxRestricted, SecretArguments=AllowedWhenUntainted",
}

APIDefs["UnitPowerMissing"] = {
    key = "UnitPowerMissing",
    name = "UnitPowerMissing",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["UnitPowerMissing"],
    funcPath = "UnitPowerMissing",
    params = { { name = "unitToken", type = "UnitToken", default = "player" }, { name = "powerType", type = "PowerType", default = nil }, { name = "unmodified", type = "bool", default = false } },
    returns = { { name = "result", type = "number", canBeSecret = false } },
    midnightImpact = "CONDITIONAL",
    midnightNote = "Secret behavior: SecretWhenUnitPowerRestricted, SecretArguments=AllowedWhenUntainted",
}

APIDefs["UnitPowerPercent"] = {
    key = "UnitPowerPercent",
    name = "UnitPowerPercent",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["UnitPowerPercent"],
    funcPath = "UnitPowerPercent",
    params = { { name = "unitToken", type = "UnitToken", default = "player" }, { name = "powerType", type = "PowerType", default = nil }, { name = "unmodified", type = "bool", default = false }, { name = "curve", type = "LuaCurveObjectBase", default = nil } },
    returns = { { name = "result", type = "LuaCurveEvaluatedResult", canBeSecret = false } },
    midnightImpact = "CONDITIONAL",
    midnightNote = "Secret behavior: SecretWhenUnitPowerRestricted, SecretArguments=AllowedWhenUntainted, SecretWhenCurveSecret",
}

APIDefs["UnitPowerType"] = {
    key = "UnitPowerType",
    name = "UnitPowerType",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["UnitPowerType"],
    funcPath = "UnitPowerType",
    params = { { name = "unit", type = "UnitToken", default = "player" }, { name = "index", type = "number", default = 0 } },
    returns = { { name = "powerType", type = "PowerType", canBeSecret = false }, { name = "powerTypeToken", type = "string", canBeSecret = false }, { name = "rgbX", type = "number", canBeSecret = false }, { name = "rgbY", type = "number", canBeSecret = false }, { name = "rgbZ", type = "number", canBeSecret = false } },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["UnitPvpClassification"] = {
    key = "UnitPvpClassification",
    name = "UnitPvpClassification",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["UnitPvpClassification"],
    funcPath = "UnitPvpClassification",
    params = { { name = "unit", type = "UnitToken", default = "player" } },
    returns = { { name = "classification", type = "PvPUnitClassification", canBeSecret = false } },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["UnitQuestTrivialLevelRange"] = {
    key = "UnitQuestTrivialLevelRange",
    name = "UnitQuestTrivialLevelRange",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["UnitQuestTrivialLevelRange"],
    funcPath = "UnitQuestTrivialLevelRange",
    params = { { name = "unit", type = "UnitToken", default = "player" } },
    returns = { { name = "levelRange", type = "number", canBeSecret = false } },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["UnitQuestTrivialLevelRangeScaling"] = {
    key = "UnitQuestTrivialLevelRangeScaling",
    name = "UnitQuestTrivialLevelRangeScaling",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["UnitQuestTrivialLevelRangeScaling"],
    funcPath = "UnitQuestTrivialLevelRangeScaling",
    params = { { name = "unit", type = "UnitToken", default = "player" } },
    returns = { { name = "levelRange", type = "number", canBeSecret = false } },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["UnitRace"] = {
    key = "UnitRace",
    name = "UnitRace",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["UnitRace"],
    funcPath = "UnitRace",
    params = { { name = "name", type = "cstring", default = nil } },
    returns = { { name = "localizedRaceName", type = "cstring", canBeSecret = false }, { name = "englishRaceName", type = "cstring", canBeSecret = false }, { name = "raceID", type = "number", canBeSecret = false } },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["UnitRangedAttackPower"] = {
    key = "UnitRangedAttackPower",
    name = "UnitRangedAttackPower",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["UnitRangedAttackPower"],
    funcPath = "UnitRangedAttackPower",
    params = { { name = "unit", type = "UnitToken", default = "player" } },
    returns = { { name = "attackPower", type = "number", canBeSecret = false }, { name = "posBuff", type = "number", canBeSecret = false }, { name = "negBuff", type = "number", canBeSecret = false } },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["UnitRangedDamage"] = {
    key = "UnitRangedDamage",
    name = "UnitRangedDamage",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["UnitRangedDamage"],
    funcPath = "UnitRangedDamage",
    params = { { name = "unit", type = "UnitToken", default = "player" } },
    returns = { { name = "speed", type = "number", canBeSecret = false }, { name = "minDamage", type = "number", canBeSecret = false }, { name = "maxDamage", type = "number", canBeSecret = false }, { name = "posBuff", type = "number", canBeSecret = false }, { name = "negBuff", type = "number", canBeSecret = false }, { name = "percent", type = "number", canBeSecret = false } },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["UnitReaction"] = {
    key = "UnitReaction",
    name = "UnitReaction",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["UnitReaction"],
    funcPath = "UnitReaction",
    params = { { name = "unit", type = "UnitToken", default = "player" }, { name = "target", type = "UnitToken", default = "player" } },
    returns = { { name = "result", type = "luaIndex", canBeSecret = false } },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["UnitRealmRelationship"] = {
    key = "UnitRealmRelationship",
    name = "UnitRealmRelationship",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["UnitRealmRelationship"],
    funcPath = "UnitRealmRelationship",
    params = { { name = "unit", type = "UnitToken", default = "player" } },
    returns = { { name = "realmRelationship", type = "luaIndex", canBeSecret = false } },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["UnitSelectionColor"] = {
    key = "UnitSelectionColor",
    name = "UnitSelectionColor",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["UnitSelectionColor"],
    funcPath = "UnitSelectionColor",
    params = { { name = "unit", type = "UnitToken", default = "player" }, { name = "useExtendedColors", type = "bool", default = false } },
    returns = { { name = "resultR", type = "number", canBeSecret = false }, { name = "resultG", type = "number", canBeSecret = false }, { name = "resultB", type = "number", canBeSecret = false }, { name = "resultA", type = "number", canBeSecret = false } },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["UnitSelectionType"] = {
    key = "UnitSelectionType",
    name = "UnitSelectionType",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["UnitSelectionType"],
    funcPath = "UnitSelectionType",
    params = { { name = "unit", type = "UnitToken", default = "player" }, { name = "useExtendedColors", type = "bool", default = false } },
    returns = { { name = "result", type = "number", canBeSecret = false } },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["UnitSetRole"] = {
    key = "UnitSetRole",
    name = "UnitSetRole",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["UnitSetRole"],
    funcPath = "UnitSetRole",
    params = { { name = "unit", type = "UnitToken", default = "player" }, { name = "roleStr", type = "cstring", default = nil } },
    returns = { { name = "result", type = "bool", canBeSecret = false } },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["UnitSetRoleEnum"] = {
    key = "UnitSetRoleEnum",
    name = "UnitSetRoleEnum",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["UnitSetRoleEnum"],
    funcPath = "UnitSetRoleEnum",
    params = { { name = "unit", type = "UnitToken", default = "player" }, { name = "role", type = "LFGRole", default = nil } },
    returns = { { name = "result", type = "bool", canBeSecret = false } },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["UnitSex"] = {
    key = "UnitSex",
    name = "UnitSex",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["UnitSex"],
    funcPath = "UnitSex",
    params = { { name = "unit", type = "UnitToken", default = "player" } },
    returns = { { name = "sex", type = "number", canBeSecret = false } },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["UnitSexBase"] = {
    key = "UnitSexBase",
    name = "UnitSexBase",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["UnitSexBase"],
    funcPath = "UnitSexBase",
    params = { { name = "unit", type = "UnitToken", default = "player" } },
    returns = { { name = "sex", type = "UnitSex", canBeSecret = false } },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["UnitShouldDisplayName"] = {
    key = "UnitShouldDisplayName",
    name = "UnitShouldDisplayName",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["UnitShouldDisplayName"],
    funcPath = "UnitShouldDisplayName",
    params = { { name = "unit", type = "UnitToken", default = "player" } },
    returns = { { name = "result", type = "bool", canBeSecret = false } },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["UnitShouldDisplaySpellTargetName"] = {
    key = "UnitShouldDisplaySpellTargetName",
    name = "UnitShouldDisplaySpellTargetName",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["UnitShouldDisplaySpellTargetName"],
    funcPath = "UnitShouldDisplaySpellTargetName",
    params = { { name = "unit", type = "UnitToken", default = "player" } },
    returns = { { name = "result", type = "bool", canBeSecret = false } },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["UnitSpellHaste"] = {
    key = "UnitSpellHaste",
    name = "UnitSpellHaste",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["UnitSpellHaste"],
    funcPath = "UnitSpellHaste",
    params = { { name = "unit", type = "UnitToken", default = "player" } },
    returns = { { name = "result", type = "number", canBeSecret = false } },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["UnitSpellTargetClass"] = {
    key = "UnitSpellTargetClass",
    name = "UnitSpellTargetClass",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["UnitSpellTargetClass"],
    funcPath = "UnitSpellTargetClass",
    params = { { name = "unit", type = "UnitToken", default = "player" } },
    returns = { { name = "classFilename", type = "cstring", canBeSecret = true } },
    midnightImpact = "HIGH",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted, SecretReturns",
}

APIDefs["UnitSpellTargetName"] = {
    key = "UnitSpellTargetName",
    name = "UnitSpellTargetName",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["UnitSpellTargetName"],
    funcPath = "UnitSpellTargetName",
    params = { { name = "unit", type = "UnitToken", default = "player" } },
    returns = { { name = "targetName", type = "cstring", canBeSecret = true } },
    midnightImpact = "HIGH",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted, SecretReturns",
}

APIDefs["UnitStagger"] = {
    key = "UnitStagger",
    name = "UnitStagger",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["UnitStagger"],
    funcPath = "UnitStagger",
    params = { { name = "unit", type = "UnitToken", default = "player" } },
    returns = { { name = "result", type = "number", canBeSecret = false } },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["UnitStat"] = {
    key = "UnitStat",
    name = "UnitStat",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["UnitStat"],
    funcPath = "UnitStat",
    params = { { name = "unit", type = "UnitToken", default = "player" }, { name = "index", type = "luaIndex", default = nil } },
    returns = { { name = "currentStat", type = "number", canBeSecret = false }, { name = "effectiveStat", type = "number", canBeSecret = false }, { name = "statPositiveBuff", type = "number", canBeSecret = false }, { name = "statNegativeBuff", type = "number", canBeSecret = false } },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["UnitSwitchToVehicleSeat"] = {
    key = "UnitSwitchToVehicleSeat",
    name = "UnitSwitchToVehicleSeat",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["UnitSwitchToVehicleSeat"],
    funcPath = "UnitSwitchToVehicleSeat",
    params = { { name = "unit", type = "UnitToken", default = "player" }, { name = "virtualSeatIndex", type = "luaIndex", default = nil } },
    returns = {  },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["UnitTargetsVehicleInRaidUI"] = {
    key = "UnitTargetsVehicleInRaidUI",
    name = "UnitTargetsVehicleInRaidUI",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["UnitTargetsVehicleInRaidUI"],
    funcPath = "UnitTargetsVehicleInRaidUI",
    params = { { name = "unit", type = "UnitToken", default = "player" } },
    returns = { { name = "result", type = "bool", canBeSecret = false } },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["UnitThreatLeadSituation"] = {
    key = "UnitThreatLeadSituation",
    name = "UnitThreatLeadSituation",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["UnitThreatLeadSituation"],
    funcPath = "UnitThreatLeadSituation",
    params = { { name = "unit", type = "UnitToken", default = "player" }, { name = "mobGUID", type = "UnitToken", default = "player" } },
    returns = { { name = "result", type = "number", canBeSecret = false } },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["UnitThreatPercentageOfLead"] = {
    key = "UnitThreatPercentageOfLead",
    name = "UnitThreatPercentageOfLead",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["UnitThreatPercentageOfLead"],
    funcPath = "UnitThreatPercentageOfLead",
    params = { { name = "unit", type = "UnitToken", default = "player" }, { name = "mobGUID", type = "UnitToken", default = "player" } },
    returns = { { name = "result", type = "number", canBeSecret = false } },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["UnitThreatSituation"] = {
    key = "UnitThreatSituation",
    name = "UnitThreatSituation",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["UnitThreatSituation"],
    funcPath = "UnitThreatSituation",
    params = { { name = "unit", type = "UnitToken", default = "player" }, { name = "mobGUID", type = "UnitToken", default = "player" } },
    returns = { { name = "result", type = "number", canBeSecret = false } },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["UnitTokenFromGUID"] = {
    key = "UnitTokenFromGUID",
    name = "UnitTokenFromGUID",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["UnitTokenFromGUID"],
    funcPath = "UnitTokenFromGUID",
    params = { { name = "unitGUID", type = "WOWGUID", default = nil } },
    returns = { { name = "unitToken", type = "string", canBeSecret = false } },
    midnightImpact = "CONDITIONAL",
    midnightNote = "Secret behavior: SecretWhenUnitIdentityRestricted, SecretArguments=AllowedWhenTainted",
}

APIDefs["UnitTreatAsPlayerForDisplay"] = {
    key = "UnitTreatAsPlayerForDisplay",
    name = "UnitTreatAsPlayerForDisplay",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["UnitTreatAsPlayerForDisplay"],
    funcPath = "UnitTreatAsPlayerForDisplay",
    params = { { name = "unit", type = "UnitToken", default = "player" } },
    returns = { { name = "treatAsPlayer", type = "bool", canBeSecret = false } },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["UnitTrialBankedLevels"] = {
    key = "UnitTrialBankedLevels",
    name = "UnitTrialBankedLevels",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["UnitTrialBankedLevels"],
    funcPath = "UnitTrialBankedLevels",
    params = { { name = "unit", type = "UnitToken", default = "player" } },
    returns = { { name = "bankedLevels", type = "number", canBeSecret = false }, { name = "xpIntoCurrentLevel", type = "number", canBeSecret = false }, { name = "xpForNextLevel", type = "number", canBeSecret = false } },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["UnitTrialXP"] = {
    key = "UnitTrialXP",
    name = "UnitTrialXP",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["UnitTrialXP"],
    funcPath = "UnitTrialXP",
    params = { { name = "unit", type = "UnitToken", default = "player" } },
    returns = { { name = "result", type = "number", canBeSecret = false } },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["UnitUsingVehicle"] = {
    key = "UnitUsingVehicle",
    name = "UnitUsingVehicle",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["UnitUsingVehicle"],
    funcPath = "UnitUsingVehicle",
    params = { { name = "unit", type = "UnitToken", default = "player" } },
    returns = { { name = "result", type = "bool", canBeSecret = false } },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["UnitVehicleSeatCount"] = {
    key = "UnitVehicleSeatCount",
    name = "UnitVehicleSeatCount",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["UnitVehicleSeatCount"],
    funcPath = "UnitVehicleSeatCount",
    params = { { name = "unit", type = "UnitToken", default = "player" } },
    returns = { { name = "result", type = "number", canBeSecret = false } },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["UnitVehicleSeatInfo"] = {
    key = "UnitVehicleSeatInfo",
    name = "UnitVehicleSeatInfo",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["UnitVehicleSeatInfo"],
    funcPath = "UnitVehicleSeatInfo",
    params = { { name = "unit", type = "UnitToken", default = "player" }, { name = "virtualSeatIndex", type = "luaIndex", default = nil } },
    returns = { { name = "controlType", type = "cstring", canBeSecret = false }, { name = "occupantName", type = "cstring", canBeSecret = false }, { name = "serverName", type = "cstring", canBeSecret = false }, { name = "ejectable", type = "bool", canBeSecret = false }, { name = "canSwitchSeats", type = "bool", canBeSecret = false } },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["UnitVehicleSkin"] = {
    key = "UnitVehicleSkin",
    name = "UnitVehicleSkin",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["UnitVehicleSkin"],
    funcPath = "UnitVehicleSkin",
    params = { { name = "unit", type = "UnitToken", default = "player" } },
    returns = { { name = "result", type = "fileID", canBeSecret = false } },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["UnitWeaponAttackPower"] = {
    key = "UnitWeaponAttackPower",
    name = "UnitWeaponAttackPower",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["UnitWeaponAttackPower"],
    funcPath = "UnitWeaponAttackPower",
    params = { { name = "unit", type = "UnitToken", default = "player" } },
    returns = { { name = "mainHandWeaponAttackPower", type = "number", canBeSecret = false }, { name = "offHandWeaponAttackPower", type = "number", canBeSecret = false }, { name = "rangedWeaponAttackPower", type = "number", canBeSecret = false } },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["UnitWidgetSet"] = {
    key = "UnitWidgetSet",
    name = "UnitWidgetSet",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["UnitWidgetSet"],
    funcPath = "UnitWidgetSet",
    params = { { name = "unit", type = "UnitToken", default = "player" } },
    returns = { { name = "uiWidgetSet", type = "number", canBeSecret = false } },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["UnitXP"] = {
    key = "UnitXP",
    name = "UnitXP",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["UnitXP"],
    funcPath = "UnitXP",
    params = { { name = "unit", type = "UnitToken", default = "player" } },
    returns = { { name = "result", type = "number", canBeSecret = false } },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["UnitXPMax"] = {
    key = "UnitXPMax",
    name = "UnitXPMax",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["UnitXPMax"],
    funcPath = "UnitXPMax",
    params = { { name = "unit", type = "UnitToken", default = "player" } },
    returns = { { name = "result", type = "number", canBeSecret = false } },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["UnregisterEventCallback"] = {
    key = "UnregisterEventCallback",
    name = "UnregisterEventCallback",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["UnregisterEventCallback"],
    funcPath = "UnregisterEventCallback",
    params = { { name = "eventName", type = "cstring", default = nil }, { name = "callback", type = "EventCallbackType", default = nil } },
    returns = {  },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["UnregisterUnitEventCallback"] = {
    key = "UnregisterUnitEventCallback",
    name = "UnregisterUnitEventCallback",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["UnregisterUnitEventCallback"],
    funcPath = "UnregisterUnitEventCallback",
    params = { { name = "eventName", type = "cstring", default = nil }, { name = "callback", type = "EventCallbackType", default = nil }, { name = "unit", type = "UnitToken", default = "player" } },
    returns = {  },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["UpdateAddOnCPUUsage"] = {
    key = "UpdateAddOnCPUUsage",
    name = "UpdateAddOnCPUUsage",
    category = "general",
    subcategory = "global",
    func = _G["UpdateAddOnCPUUsage"],
    funcPath = "UpdateAddOnCPUUsage",
    params = {  },
    returns = {  },
    midnightImpact = "NORMAL",
}

APIDefs["UpdateAddOnMemoryUsage"] = {
    key = "UpdateAddOnMemoryUsage",
    name = "UpdateAddOnMemoryUsage",
    category = "general",
    subcategory = "global",
    func = _G["UpdateAddOnMemoryUsage"],
    funcPath = "UpdateAddOnMemoryUsage",
    params = {  },
    returns = {  },
    midnightImpact = "NORMAL",
}

APIDefs["UpdateBlips"] = {
    key = "UpdateBlips",
    name = "UpdateBlips",
    category = "general",
    subcategory = "global",
    func = _G["UpdateBlips"],
    funcPath = "UpdateBlips",
    params = {  },
    returns = {  },
    midnightImpact = "NORMAL",
}

APIDefs["UpdateMouseOverTooltip"] = {
    key = "UpdateMouseOverTooltip",
    name = "UpdateMouseOverTooltip",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["UpdateMouseOverTooltip"],
    funcPath = "UpdateMouseOverTooltip",
    params = { { name = "x", type = "number", default = nil }, { name = "y", type = "number", default = nil } },
    returns = { { name = "hasTooltip", type = "bool", canBeSecret = false } },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["UpdateWindow"] = {
    key = "UpdateWindow",
    name = "UpdateWindow",
    category = "general",
    subcategory = "global",
    func = _G["UpdateWindow"],
    funcPath = "UpdateWindow",
    params = {  },
    returns = {  },
    midnightImpact = "NORMAL",
}

APIDefs["UseModelCenterToTransform"] = {
    key = "UseModelCenterToTransform",
    name = "UseModelCenterToTransform",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["UseModelCenterToTransform"],
    funcPath = "UseModelCenterToTransform",
    params = { { name = "useCenter", type = "bool", default = nil } },
    returns = {  },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["UsesNPOT"] = {
    key = "UsesNPOT",
    name = "UsesNPOT",
    category = "general",
    subcategory = "global",
    func = _G["UsesNPOT"],
    funcPath = "UsesNPOT",
    params = {  },
    returns = { { name = "usesNPOT", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["WorldLootObjectExists"] = {
    key = "WorldLootObjectExists",
    name = "WorldLootObjectExists",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["WorldLootObjectExists"],
    funcPath = "WorldLootObjectExists",
    params = { { name = "unit", type = "UnitToken", default = "player" } },
    returns = { { name = "result", type = "bool", canBeSecret = false } },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["ZeroCachedCenterXY"] = {
    key = "ZeroCachedCenterXY",
    name = "ZeroCachedCenterXY",
    category = "general",
    subcategory = "global",
    func = _G["ZeroCachedCenterXY"],
    funcPath = "ZeroCachedCenterXY",
    params = {  },
    returns = {  },
    midnightImpact = "NORMAL",
}

APIDefs["canaccessallvalues"] = {
    key = "canaccessallvalues",
    name = "canaccessallvalues",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["canaccessallvalues"],
    funcPath = "canaccessallvalues",
    params = { { name = "values", type = "LuaValueReference", default = nil } },
    returns = { { name = "canAccessAllValues", type = "bool", canBeSecret = false } },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["canaccesssecrets"] = {
    key = "canaccesssecrets",
    name = "canaccesssecrets",
    category = "general",
    subcategory = "global",
    func = _G["canaccesssecrets"],
    funcPath = "canaccesssecrets",
    params = {  },
    returns = { { name = "canAccessSecrets", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["canaccesstable"] = {
    key = "canaccesstable",
    name = "canaccesstable",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["canaccesstable"],
    funcPath = "canaccesstable",
    params = { { name = "table", type = "LuaValueReference", default = nil } },
    returns = { { name = "canAccessTable", type = "bool", canBeSecret = false } },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["canaccessvalue"] = {
    key = "canaccessvalue",
    name = "canaccessvalue",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["canaccessvalue"],
    funcPath = "canaccessvalue",
    params = { { name = "value", type = "LuaValueReference", default = nil } },
    returns = { { name = "canAccessValue", type = "bool", canBeSecret = false } },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["debugprofilestart"] = {
    key = "debugprofilestart",
    name = "debugprofilestart",
    category = "general",
    subcategory = "global",
    func = _G["debugprofilestart"],
    funcPath = "debugprofilestart",
    params = {  },
    returns = {  },
    midnightImpact = "NORMAL",
}

APIDefs["debugprofilestop"] = {
    key = "debugprofilestop",
    name = "debugprofilestop",
    category = "general",
    subcategory = "global",
    func = _G["debugprofilestop"],
    funcPath = "debugprofilestop",
    params = {  },
    returns = { { name = "elapsedMilliseconds", type = "number", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["dropsecretaccess"] = {
    key = "dropsecretaccess",
    name = "dropsecretaccess",
    category = "general",
    subcategory = "global",
    func = _G["dropsecretaccess"],
    funcPath = "dropsecretaccess",
    params = {  },
    returns = {  },
    midnightImpact = "NORMAL",
}

APIDefs["hasanysecretvalues"] = {
    key = "hasanysecretvalues",
    name = "hasanysecretvalues",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["hasanysecretvalues"],
    funcPath = "hasanysecretvalues",
    params = { { name = "values", type = "LuaValueReference", default = nil } },
    returns = { { name = "isAnyValueSecret", type = "bool", canBeSecret = false } },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["issecrettable"] = {
    key = "issecrettable",
    name = "issecrettable",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["issecrettable"],
    funcPath = "issecrettable",
    params = { { name = "table", type = "LuaValueReference", default = nil } },
    returns = { { name = "isSecretOrContentsSecret", type = "bool", canBeSecret = false } },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["issecretvalue"] = {
    key = "issecretvalue",
    name = "issecretvalue",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["issecretvalue"],
    funcPath = "issecretvalue",
    params = { { name = "value", type = "LuaValueReference", default = nil } },
    returns = { { name = "isSecret", type = "bool", canBeSecret = false } },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["mapvalues"] = {
    key = "mapvalues",
    name = "mapvalues",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["mapvalues"],
    funcPath = "mapvalues",
    params = { { name = "func", type = "LuaValueReference", default = nil }, { name = "values", type = "LuaValueReference", default = nil } },
    returns = { { name = "mapped", type = "LuaValueReference", canBeSecret = false } },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["scrub"] = {
    key = "scrub",
    name = "scrub",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["scrub"],
    funcPath = "scrub",
    params = { { name = "values", type = "LuaValueReference", default = nil } },
    returns = { { name = "scrubbed", type = "LuaValueReference", canBeSecret = false } },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["scrubsecretvalues"] = {
    key = "scrubsecretvalues",
    name = "scrubsecretvalues",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["scrubsecretvalues"],
    funcPath = "scrubsecretvalues",
    params = { { name = "values", type = "LuaValueReference", default = nil } },
    returns = { { name = "scrubbed", type = "LuaValueReference", canBeSecret = false } },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["secretunwrap"] = {
    key = "secretunwrap",
    name = "secretunwrap",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["secretunwrap"],
    funcPath = "secretunwrap",
    params = { { name = "values", type = "LuaValueReference", default = nil } },
    returns = { { name = "unwrapped", type = "LuaValueReference", canBeSecret = false } },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["secretwrap"] = {
    key = "secretwrap",
    name = "secretwrap",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["secretwrap"],
    funcPath = "secretwrap",
    params = { { name = "values", type = "LuaValueReference", default = nil } },
    returns = { { name = "wrapped", type = "LuaValueReference", canBeSecret = false } },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}
