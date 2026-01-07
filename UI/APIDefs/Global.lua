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

APIDefs["AbortDrag"] = {
    key = "AbortDrag",
    name = "AbortDrag",
    category = "general",
    subcategory = "global",
    func = _G["AbortDrag"],
    funcPath = "AbortDrag",
    params = {  },
    returns = {  },
    midnightImpact = "NORMAL",
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

APIDefs["AddHistoryLine"] = {
    key = "AddHistoryLine",
    name = "AddHistoryLine",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["AddHistoryLine"],
    funcPath = "AddHistoryLine",
    params = { { name = "text", type = "cstring", default = nil } },
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

APIDefs["CalculateScreenAreaFromCharacterSpan"] = {
    key = "CalculateScreenAreaFromCharacterSpan",
    name = "CalculateScreenAreaFromCharacterSpan",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["CalculateScreenAreaFromCharacterSpan"],
    funcPath = "CalculateScreenAreaFromCharacterSpan",
    params = { { name = "leftIndex", type = "luaIndex", default = nil }, { name = "rightIndex", type = "luaIndex", default = nil } },
    returns = { { name = "areas", type = "table", canBeSecret = false } },
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

APIDefs["CanChangeAttribute"] = {
    key = "CanChangeAttribute",
    name = "CanChangeAttribute",
    category = "general",
    subcategory = "global",
    func = _G["CanChangeAttribute"],
    funcPath = "CanChangeAttribute",
    params = { { name = "canChangeAttributes", type = "bool", default = nil } },
    returns = { { name = "canChangeAttributes", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
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

APIDefs["CanChangeProtectedState"] = {
    key = "CanChangeProtectedState",
    name = "CanChangeProtectedState",
    category = "general",
    subcategory = "global",
    func = _G["CanChangeProtectedState"],
    funcPath = "CanChangeProtectedState",
    params = { { name = "canChange", type = "bool", default = nil } },
    returns = { { name = "canChange", type = "bool", canBeSecret = false } },
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
    params = { { name = "moveRestriction", type = "HousingLayoutRestriction", default = nil } },
    returns = { { name = "moveRestriction", type = "HousingLayoutRestriction", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["CanNonSpaceWrap"] = {
    key = "CanNonSpaceWrap",
    name = "CanNonSpaceWrap",
    category = "general",
    subcategory = "global",
    func = _G["CanNonSpaceWrap"],
    funcPath = "CanNonSpaceWrap",
    params = { { name = "wrap", type = "bool", default = nil } },
    returns = { { name = "wrap", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["CanPropagateMouseClicks"] = {
    key = "CanPropagateMouseClicks",
    name = "CanPropagateMouseClicks",
    category = "general",
    subcategory = "global",
    func = _G["CanPropagateMouseClicks"],
    funcPath = "CanPropagateMouseClicks",
    params = { { name = "canPropagate", type = "bool", default = nil } },
    returns = { { name = "canPropagate", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["CanPropagateMouseMotion"] = {
    key = "CanPropagateMouseMotion",
    name = "CanPropagateMouseMotion",
    category = "general",
    subcategory = "global",
    func = _G["CanPropagateMouseMotion"],
    funcPath = "CanPropagateMouseMotion",
    params = { { name = "canPropagate", type = "bool", default = nil } },
    returns = { { name = "canPropagate", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["CanRemove"] = {
    key = "CanRemove",
    name = "CanRemove",
    category = "general",
    subcategory = "global",
    func = _G["CanRemove"],
    funcPath = "CanRemove",
    params = { { name = "removalRestriction", type = "HousingLayoutRestriction", default = nil } },
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
    params = { { name = "rotateRestriction", type = "HousingLayoutRestriction", default = nil } },
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
    params = { { name = "canSave", type = "bool", default = nil } },
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

APIDefs["CanWordWrap"] = {
    key = "CanWordWrap",
    name = "CanWordWrap",
    category = "general",
    subcategory = "global",
    func = _G["CanWordWrap"],
    funcPath = "CanWordWrap",
    params = { { name = "wrap", type = "bool", default = nil } },
    returns = { { name = "wrap", type = "bool", canBeSecret = false } },
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

APIDefs["ClearAlphaGradient"] = {
    key = "ClearAlphaGradient",
    name = "ClearAlphaGradient",
    category = "general",
    subcategory = "global",
    func = _G["ClearAlphaGradient"],
    funcPath = "ClearAlphaGradient",
    params = {  },
    returns = {  },
    midnightImpact = "NORMAL",
}

APIDefs["ClearAttribute"] = {
    key = "ClearAttribute",
    name = "ClearAttribute",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["ClearAttribute"],
    funcPath = "ClearAttribute",
    params = { { name = "attributeName", type = "cstring", default = nil } },
    returns = { { name = "cleared", type = "bool", canBeSecret = false } },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=NotAllowed",
}

APIDefs["ClearAttributes"] = {
    key = "ClearAttributes",
    name = "ClearAttributes",
    category = "general",
    subcategory = "global",
    func = _G["ClearAttributes"],
    funcPath = "ClearAttributes",
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

APIDefs["ClearDisabledTexture"] = {
    key = "ClearDisabledTexture",
    name = "ClearDisabledTexture",
    category = "general",
    subcategory = "global",
    func = _G["ClearDisabledTexture"],
    funcPath = "ClearDisabledTexture",
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

APIDefs["ClearHighlightText"] = {
    key = "ClearHighlightText",
    name = "ClearHighlightText",
    category = "general",
    subcategory = "global",
    func = _G["ClearHighlightText"],
    funcPath = "ClearHighlightText",
    params = {  },
    returns = {  },
    midnightImpact = "NORMAL",
}

APIDefs["ClearHighlightTexture"] = {
    key = "ClearHighlightTexture",
    name = "ClearHighlightTexture",
    category = "general",
    subcategory = "global",
    func = _G["ClearHighlightTexture"],
    funcPath = "ClearHighlightTexture",
    params = {  },
    returns = {  },
    midnightImpact = "NORMAL",
}

APIDefs["ClearHistory"] = {
    key = "ClearHistory",
    name = "ClearHistory",
    category = "general",
    subcategory = "global",
    func = _G["ClearHistory"],
    funcPath = "ClearHistory",
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

APIDefs["ClearNormalTexture"] = {
    key = "ClearNormalTexture",
    name = "ClearNormalTexture",
    category = "general",
    subcategory = "global",
    func = _G["ClearNormalTexture"],
    funcPath = "ClearNormalTexture",
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

APIDefs["ClearParentKey"] = {
    key = "ClearParentKey",
    name = "ClearParentKey",
    category = "general",
    subcategory = "global",
    func = _G["ClearParentKey"],
    funcPath = "ClearParentKey",
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

APIDefs["ClearPushedTexture"] = {
    key = "ClearPushedTexture",
    name = "ClearPushedTexture",
    category = "general",
    subcategory = "global",
    func = _G["ClearPushedTexture"],
    funcPath = "ClearPushedTexture",
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

APIDefs["ClearScripts"] = {
    key = "ClearScripts",
    name = "ClearScripts",
    category = "general",
    subcategory = "global",
    func = _G["ClearScripts"],
    funcPath = "ClearScripts",
    params = {  },
    returns = {  },
    midnightImpact = "NORMAL",
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

APIDefs["ClearTextureSlice"] = {
    key = "ClearTextureSlice",
    name = "ClearTextureSlice",
    category = "general",
    subcategory = "global",
    func = _G["ClearTextureSlice"],
    funcPath = "ClearTextureSlice",
    params = {  },
    returns = {  },
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

APIDefs["ClearVertexOffsets"] = {
    key = "ClearVertexOffsets",
    name = "ClearVertexOffsets",
    category = "general",
    subcategory = "global",
    func = _G["ClearVertexOffsets"],
    funcPath = "ClearVertexOffsets",
    params = {  },
    returns = {  },
    midnightImpact = "NORMAL",
}

APIDefs["Click"] = {
    key = "Click",
    name = "Click",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["Click"],
    funcPath = "Click",
    params = { { name = "button", type = "cstring", default = "LeftButton" }, { name = "isDown", type = "bool", default = false } },
    returns = {  },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=NotAllowed",
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

APIDefs["CollapsesLayout"] = {
    key = "CollapsesLayout",
    name = "CollapsesLayout",
    category = "general",
    subcategory = "global",
    func = _G["CollapsesLayout"],
    funcPath = "CollapsesLayout",
    params = { { name = "collapsesLayout", type = "bool", default = nil } },
    returns = { { name = "collapsesLayout", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
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
    params = { { name = "copy", type = "LuaDurationObject", default = nil } },
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

APIDefs["CreateFontString"] = {
    key = "CreateFontString",
    name = "CreateFontString",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["CreateFontString"],
    funcPath = "CreateFontString",
    params = { { name = "name", type = "cstring", default = nil }, { name = "drawLayer", type = "DrawLayer", default = nil }, { name = "templateName", type = "cstring", default = nil } },
    returns = { { name = "line", type = "SimpleFontString", canBeSecret = false } },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=NotAllowed",
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

APIDefs["CreateLine"] = {
    key = "CreateLine",
    name = "CreateLine",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["CreateLine"],
    funcPath = "CreateLine",
    params = { { name = "name", type = "cstring", default = nil }, { name = "drawLayer", type = "DrawLayer", default = nil }, { name = "templateName", type = "cstring", default = nil }, { name = "subLevel", type = "number", default = nil } },
    returns = { { name = "line", type = "SimpleLine", canBeSecret = false } },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=NotAllowed",
}

APIDefs["CreateMaskTexture"] = {
    key = "CreateMaskTexture",
    name = "CreateMaskTexture",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["CreateMaskTexture"],
    funcPath = "CreateMaskTexture",
    params = { { name = "name", type = "cstring", default = nil }, { name = "drawLayer", type = "DrawLayer", default = nil }, { name = "templateName", type = "cstring", default = nil }, { name = "subLevel", type = "number", default = nil } },
    returns = { { name = "maskTexture", type = "SimpleMaskTexture", canBeSecret = false } },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=NotAllowed",
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

APIDefs["CreateTexture"] = {
    key = "CreateTexture",
    name = "CreateTexture",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["CreateTexture"],
    funcPath = "CreateTexture",
    params = { { name = "name", type = "cstring", default = nil }, { name = "drawLayer", type = "DrawLayer", default = nil }, { name = "templateName", type = "cstring", default = nil }, { name = "subLevel", type = "number", default = nil } },
    returns = { { name = "texture", type = "SimpleTexture", canBeSecret = false } },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=NotAllowed",
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

APIDefs["DesaturateHierarchy"] = {
    key = "DesaturateHierarchy",
    name = "DesaturateHierarchy",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["DesaturateHierarchy"],
    funcPath = "DesaturateHierarchy",
    params = { { name = "desaturation", type = "number", default = nil }, { name = "excludeRoot", type = "bool", default = false } },
    returns = {  },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=NotAllowed",
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

APIDefs["DisableDrawLayer"] = {
    key = "DisableDrawLayer",
    name = "DisableDrawLayer",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["DisableDrawLayer"],
    funcPath = "DisableDrawLayer",
    params = { { name = "layer", type = "DrawLayer", default = nil } },
    returns = {  },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
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

APIDefs["DoesClipChildren"] = {
    key = "DoesClipChildren",
    name = "DoesClipChildren",
    category = "general",
    subcategory = "global",
    func = _G["DoesClipChildren"],
    funcPath = "DoesClipChildren",
    params = { { name = "clipsChildren", type = "bool", default = nil } },
    returns = { { name = "clipsChildren", type = "bool", canBeSecret = false } },
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

APIDefs["DoesHyperlinkPropagateToParent"] = {
    key = "DoesHyperlinkPropagateToParent",
    name = "DoesHyperlinkPropagateToParent",
    category = "general",
    subcategory = "global",
    func = _G["DoesHyperlinkPropagateToParent"],
    funcPath = "DoesHyperlinkPropagateToParent",
    params = { { name = "canPropagate", type = "bool", default = nil } },
    returns = { { name = "canPropagate", type = "bool", canBeSecret = false } },
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

APIDefs["EnableDrawLayer"] = {
    key = "EnableDrawLayer",
    name = "EnableDrawLayer",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["EnableDrawLayer"],
    funcPath = "EnableDrawLayer",
    params = { { name = "layer", type = "DrawLayer", default = nil } },
    returns = {  },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["EnableGamePadButton"] = {
    key = "EnableGamePadButton",
    name = "EnableGamePadButton",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["EnableGamePadButton"],
    funcPath = "EnableGamePadButton",
    params = { { name = "enable", type = "bool", default = false } },
    returns = {  },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=NotAllowed",
}

APIDefs["EnableGamePadStick"] = {
    key = "EnableGamePadStick",
    name = "EnableGamePadStick",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["EnableGamePadStick"],
    funcPath = "EnableGamePadStick",
    params = { { name = "enable", type = "bool", default = false } },
    returns = {  },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=NotAllowed",
}

APIDefs["EnableKeyboard"] = {
    key = "EnableKeyboard",
    name = "EnableKeyboard",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["EnableKeyboard"],
    funcPath = "EnableKeyboard",
    params = { { name = "enable", type = "bool", default = false } },
    returns = {  },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=NotAllowed",
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

APIDefs["EnableMouse"] = {
    key = "EnableMouse",
    name = "EnableMouse",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["EnableMouse"],
    funcPath = "EnableMouse",
    params = { { name = "enable", type = "bool", default = false } },
    returns = {  },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=NotAllowed",
}

APIDefs["EnableMouseMotion"] = {
    key = "EnableMouseMotion",
    name = "EnableMouseMotion",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["EnableMouseMotion"],
    funcPath = "EnableMouseMotion",
    params = { { name = "enable", type = "bool", default = false } },
    returns = {  },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=NotAllowed",
}

APIDefs["EnableMouseWheel"] = {
    key = "EnableMouseWheel",
    name = "EnableMouseWheel",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["EnableMouseWheel"],
    funcPath = "EnableMouseWheel",
    params = { { name = "enable", type = "bool", default = false } },
    returns = {  },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=NotAllowed",
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

APIDefs["ExecuteAttribute"] = {
    key = "ExecuteAttribute",
    name = "ExecuteAttribute",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["ExecuteAttribute"],
    funcPath = "ExecuteAttribute",
    params = { { name = "attributeName", type = "cstring", default = nil }, { name = "arguments", type = "cstring", default = nil } },
    returns = { { name = "success", type = "bool", canBeSecret = false }, { name = "returns", type = "cstring", canBeSecret = false } },
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

APIDefs["FindCharacterIndexAtCoordinate"] = {
    key = "FindCharacterIndexAtCoordinate",
    name = "FindCharacterIndexAtCoordinate",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["FindCharacterIndexAtCoordinate"],
    funcPath = "FindCharacterIndexAtCoordinate",
    params = { { name = "x", type = "uiUnit", default = nil }, { name = "y", type = "uiUnit", default = nil } },
    returns = { { name = "characterIndex", type = "luaIndex", canBeSecret = false }, { name = "inside", type = "bool", canBeSecret = false } },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
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
    params = { { name = "data", type = "table", default = nil } },
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
    params = { { name = "boxBottom", type = "vector3", default = nil }, { name = "boxTop", type = "vector3", default = nil } },
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
    params = { { name = "matchingEntryIDs", type = "table", default = nil } },
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
    params = { { name = "allowOverlappedModels", type = "bool", default = nil } },
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
    params = { { name = "alpha", type = "SingleColorValue", default = nil } },
    returns = { { name = "alpha", type = "SingleColorValue", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["GetAlphaGradient"] = {
    key = "GetAlphaGradient",
    name = "GetAlphaGradient",
    category = "general",
    subcategory = "global",
    func = _G["GetAlphaGradient"],
    funcPath = "GetAlphaGradient",
    params = { { name = "start", type = "number", default = nil }, { name = "length", type = "number", default = nil } },
    returns = { { name = "start", type = "number", canBeSecret = false }, { name = "length", type = "number", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["GetAltArrowKeyMode"] = {
    key = "GetAltArrowKeyMode",
    name = "GetAltArrowKeyMode",
    category = "general",
    subcategory = "global",
    func = _G["GetAltArrowKeyMode"],
    funcPath = "GetAltArrowKeyMode",
    params = { { name = "altMode", type = "bool", default = nil } },
    returns = { { name = "altMode", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["GetAnimation"] = {
    key = "GetAnimation",
    name = "GetAnimation",
    category = "general",
    subcategory = "global",
    func = _G["GetAnimation"],
    funcPath = "GetAnimation",
    params = { { name = "animation", type = "AnimationDataEnum", default = nil } },
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
    params = { { name = "blendOp", type = "ModelBlendOperation", default = nil } },
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
    params = { { name = "groups", type = "SimpleAnimGroup", default = nil } },
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
    params = { { name = "animationSpeedMultiplier", type = "number", default = nil } },
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
    params = { { name = "variation", type = "number", default = nil } },
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
    params = { { name = "anims", type = "SimpleAnim", default = nil } },
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

APIDefs["GetAtlas"] = {
    key = "GetAtlas",
    name = "GetAtlas",
    category = "general",
    subcategory = "global",
    func = _G["GetAtlas"],
    funcPath = "GetAtlas",
    params = { { name = "atlas", type = "textureAtlas", default = nil } },
    returns = { { name = "atlas", type = "textureAtlas", canBeSecret = false } },
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

APIDefs["GetAttribute"] = {
    key = "GetAttribute",
    name = "GetAttribute",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["GetAttribute"],
    funcPath = "GetAttribute",
    params = { { name = "attributeName", type = "cstring", default = nil } },
    returns = { { name = "value", type = "cstring", canBeSecret = false } },
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
    params = { { name = "autoDress", type = "bool", default = nil } },
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

APIDefs["GetBlendMode"] = {
    key = "GetBlendMode",
    name = "GetBlendMode",
    category = "general",
    subcategory = "global",
    func = _G["GetBlendMode"],
    funcPath = "GetBlendMode",
    params = { { name = "blendMode", type = "BlendMode", default = nil } },
    returns = { { name = "blendMode", type = "BlendMode", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["GetBlinkSpeed"] = {
    key = "GetBlinkSpeed",
    name = "GetBlinkSpeed",
    category = "general",
    subcategory = "global",
    func = _G["GetBlinkSpeed"],
    funcPath = "GetBlinkSpeed",
    params = { { name = "cursorBlinkSpeedSec", type = "number", default = nil } },
    returns = { { name = "cursorBlinkSpeedSec", type = "number", canBeSecret = false } },
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

APIDefs["GetBottom"] = {
    key = "GetBottom",
    name = "GetBottom",
    category = "general",
    subcategory = "global",
    func = _G["GetBottom"],
    funcPath = "GetBottom",
    params = { { name = "bottom", type = "uiUnit", default = nil } },
    returns = { { name = "bottom", type = "uiUnit", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["GetBoundsRect"] = {
    key = "GetBoundsRect",
    name = "GetBoundsRect",
    category = "general",
    subcategory = "global",
    func = _G["GetBoundsRect"],
    funcPath = "GetBoundsRect",
    params = { { name = "left", type = "uiUnit", default = nil }, { name = "bottom", type = "uiUnit", default = nil }, { name = "width", type = "uiUnit", default = nil }, { name = "height", type = "uiUnit", default = nil } },
    returns = { { name = "left", type = "uiUnit", canBeSecret = false }, { name = "bottom", type = "uiUnit", canBeSecret = false }, { name = "width", type = "uiUnit", canBeSecret = false }, { name = "height", type = "uiUnit", canBeSecret = false } },
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

APIDefs["GetButtonState"] = {
    key = "GetButtonState",
    name = "GetButtonState",
    category = "general",
    subcategory = "global",
    func = _G["GetButtonState"],
    funcPath = "GetButtonState",
    params = { { name = "buttonState", type = "SimpleButtonStateToken", default = nil } },
    returns = { { name = "buttonState", type = "SimpleButtonStateToken", canBeSecret = false } },
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
    params = { { name = "distance", type = "number", default = nil } },
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
    params = { { name = "radians", type = "number", default = nil } },
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
    params = { { name = "farClip", type = "number", default = nil } },
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
    params = { { name = "fov", type = "number", default = nil } },
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
    params = { { name = "forwardX", type = "number", default = nil }, { name = "forwardY", type = "number", default = nil }, { name = "forwardZ", type = "number", default = nil } },
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
    params = { { name = "nearClip", type = "number", default = nil } },
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
    params = { { name = "positionX", type = "number", default = nil }, { name = "positionY", type = "number", default = nil }, { name = "positionZ", type = "number", default = nil } },
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
    params = { { name = "rightX", type = "number", default = nil }, { name = "rightY", type = "number", default = nil }, { name = "rightZ", type = "number", default = nil } },
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
    params = { { name = "radians", type = "number", default = nil } },
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
    params = { { name = "targetX", type = "number", default = nil }, { name = "targetY", type = "number", default = nil }, { name = "targetZ", type = "number", default = nil } },
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
    params = { { name = "upX", type = "number", default = nil }, { name = "upY", type = "number", default = nil }, { name = "upZ", type = "number", default = nil } },
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
    params = { { name = "matchingEntryIDs", type = "table", default = nil } },
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

APIDefs["GetCenter"] = {
    key = "GetCenter",
    name = "GetCenter",
    category = "general",
    subcategory = "global",
    func = _G["GetCenter"],
    funcPath = "GetCenter",
    params = { { name = "x", type = "uiUnit", default = nil }, { name = "y", type = "uiUnit", default = nil } },
    returns = { { name = "x", type = "uiUnit", canBeSecret = false }, { name = "y", type = "uiUnit", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["GetChecked"] = {
    key = "GetChecked",
    name = "GetChecked",
    category = "general",
    subcategory = "global",
    func = _G["GetChecked"],
    funcPath = "GetChecked",
    params = { { name = "checked", type = "bool", default = nil } },
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
    params = { { name = "texture", type = "SimpleTexture", default = nil } },
    returns = { { name = "texture", type = "SimpleTexture", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["GetChildren"] = {
    key = "GetChildren",
    name = "GetChildren",
    category = "general",
    subcategory = "global",
    func = _G["GetChildren"],
    funcPath = "GetChildren",
    params = { { name = "children", type = "SimpleFrame", default = nil } },
    returns = { { name = "children", type = "SimpleFrame", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["GetClampRectInsets"] = {
    key = "GetClampRectInsets",
    name = "GetClampRectInsets",
    category = "general",
    subcategory = "global",
    func = _G["GetClampRectInsets"],
    funcPath = "GetClampRectInsets",
    params = { { name = "left", type = "uiUnit", default = nil }, { name = "right", type = "uiUnit", default = nil }, { name = "top", type = "uiUnit", default = nil }, { name = "bottom", type = "uiUnit", default = nil } },
    returns = { { name = "left", type = "uiUnit", canBeSecret = false }, { name = "right", type = "uiUnit", canBeSecret = false }, { name = "top", type = "uiUnit", canBeSecret = false }, { name = "bottom", type = "uiUnit", canBeSecret = false } },
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
    params = { { name = "alpha", type = "number", default = nil } },
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
    params = { { name = "texture", type = "SimpleTexture", default = nil } },
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
    params = { { name = "texture", type = "SimpleTexture", default = nil } },
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
    params = { { name = "hsvX", type = "number", default = nil }, { name = "hsvY", type = "number", default = nil }, { name = "hsvZ", type = "number", default = nil } },
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
    params = { { name = "rgbR", type = "number", default = nil }, { name = "rgbG", type = "number", default = nil }, { name = "rgbB", type = "number", default = nil } },
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
    params = { { name = "texture", type = "SimpleTexture", default = nil } },
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
    params = { { name = "texture", type = "SimpleTexture", default = nil } },
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
    params = { { name = "texture", type = "SimpleTexture", default = nil } },
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
    params = { { name = "texture", type = "SimpleTexture", default = nil } },
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
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["GetContentHeight"] = {
    key = "GetContentHeight",
    name = "GetContentHeight",
    category = "general",
    subcategory = "global",
    func = _G["GetContentHeight"],
    funcPath = "GetContentHeight",
    params = { { name = "height", type = "uiUnit", default = nil } },
    returns = { { name = "height", type = "uiUnit", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["GetControlPoints"] = {
    key = "GetControlPoints",
    name = "GetControlPoints",
    category = "general",
    subcategory = "global",
    func = _G["GetControlPoints"],
    funcPath = "GetControlPoints",
    params = { { name = "points", type = "SimpleControlPoint", default = nil } },
    returns = { { name = "points", type = "SimpleControlPoint", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["GetCooldownDisplayDuration"] = {
    key = "GetCooldownDisplayDuration",
    name = "GetCooldownDisplayDuration",
    category = "general",
    subcategory = "global",
    func = _G["GetCooldownDisplayDuration"],
    funcPath = "GetCooldownDisplayDuration",
    params = { { name = "duration", type = "number", default = nil } },
    returns = { { name = "duration", type = "number", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["GetCooldownDuration"] = {
    key = "GetCooldownDuration",
    name = "GetCooldownDuration",
    category = "general",
    subcategory = "global",
    func = _G["GetCooldownDuration"],
    funcPath = "GetCooldownDuration",
    params = { { name = "duration", type = "number", default = nil } },
    returns = { { name = "duration", type = "number", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["GetCooldownTimes"] = {
    key = "GetCooldownTimes",
    name = "GetCooldownTimes",
    category = "general",
    subcategory = "global",
    func = _G["GetCooldownTimes"],
    funcPath = "GetCooldownTimes",
    params = { { name = "start", type = "number", default = nil }, { name = "duration", type = "number", default = nil } },
    returns = { { name = "start", type = "number", canBeSecret = false }, { name = "duration", type = "number", canBeSecret = false } },
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

APIDefs["GetCountdownFontString"] = {
    key = "GetCountdownFontString",
    name = "GetCountdownFontString",
    category = "general",
    subcategory = "global",
    func = _G["GetCountdownFontString"],
    funcPath = "GetCountdownFontString",
    params = { { name = "countdownString", type = "SimpleFontString", default = nil } },
    returns = { { name = "countdownString", type = "SimpleFontString", canBeSecret = false } },
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
    params = { { name = "cursorPosition", type = "number", default = nil } },
    returns = { { name = "cursorPosition", type = "number", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["GetCurveType"] = {
    key = "GetCurveType",
    name = "GetCurveType",
    category = "general",
    subcategory = "global",
    func = _G["GetCurveType"],
    funcPath = "GetCurveType",
    params = { { name = "curveType", type = "CurveType", default = nil } },
    returns = { { name = "curveType", type = "CurveType", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["GetDebugName"] = {
    key = "GetDebugName",
    name = "GetDebugName",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["GetDebugName"],
    funcPath = "GetDebugName",
    params = { { name = "preferParentKey", type = "bool", default = false } },
    returns = { { name = "debugName", type = "string", canBeSecret = false } },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
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
    params = { { name = "angle", type = "number", default = nil } },
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
    params = { { name = "desaturation", type = "normalizedValue", default = nil } },
    returns = { { name = "desaturation", type = "normalizedValue", canBeSecret = false } },
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
    params = { { name = "texture", type = "SimpleTexture", default = nil } },
    returns = { { name = "texture", type = "SimpleTexture", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["GetDisabledFontObject"] = {
    key = "GetDisabledFontObject",
    name = "GetDisabledFontObject",
    category = "general",
    subcategory = "global",
    func = _G["GetDisabledFontObject"],
    funcPath = "GetDisabledFontObject",
    params = { { name = "font", type = "SimpleFont", default = nil } },
    returns = { { name = "font", type = "SimpleFont", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["GetDisabledTexture"] = {
    key = "GetDisabledTexture",
    name = "GetDisabledTexture",
    category = "general",
    subcategory = "global",
    func = _G["GetDisabledTexture"],
    funcPath = "GetDisabledTexture",
    params = { { name = "texture", type = "SimpleTexture", default = nil } },
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
    params = { { name = "displayID", type = "number", default = nil } },
    returns = { { name = "displayID", type = "number", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["GetDisplayText"] = {
    key = "GetDisplayText",
    name = "GetDisplayText",
    category = "general",
    subcategory = "global",
    func = _G["GetDisplayText"],
    funcPath = "GetDisplayText",
    params = { { name = "displayText", type = "string", default = nil } },
    returns = { { name = "displayText", type = "string", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["GetDoBlend"] = {
    key = "GetDoBlend",
    name = "GetDoBlend",
    category = "general",
    subcategory = "global",
    func = _G["GetDoBlend"],
    funcPath = "GetDoBlend",
    params = { { name = "doBlend", type = "bool", default = nil } },
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

APIDefs["GetDontSavePosition"] = {
    key = "GetDontSavePosition",
    name = "GetDontSavePosition",
    category = "general",
    subcategory = "global",
    func = _G["GetDontSavePosition"],
    funcPath = "GetDontSavePosition",
    params = { { name = "dontSave", type = "bool", default = nil } },
    returns = { { name = "dontSave", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["GetDoorConnectionInfo"] = {
    key = "GetDoorConnectionInfo",
    name = "GetDoorConnectionInfo",
    category = "general",
    subcategory = "global",
    func = _G["GetDoorConnectionInfo"],
    funcPath = "GetDoorConnectionInfo",
    params = { { name = "connectionInfo", type = "DoorConnectionInfo", default = nil } },
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

APIDefs["GetDrawBling"] = {
    key = "GetDrawBling",
    name = "GetDrawBling",
    category = "general",
    subcategory = "global",
    func = _G["GetDrawBling"],
    funcPath = "GetDrawBling",
    params = { { name = "drawBling", type = "bool", default = nil } },
    returns = { { name = "drawBling", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["GetDrawEdge"] = {
    key = "GetDrawEdge",
    name = "GetDrawEdge",
    category = "general",
    subcategory = "global",
    func = _G["GetDrawEdge"],
    funcPath = "GetDrawEdge",
    params = { { name = "drawEdge", type = "bool", default = nil } },
    returns = { { name = "drawEdge", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["GetDrawLayer"] = {
    key = "GetDrawLayer",
    name = "GetDrawLayer",
    category = "general",
    subcategory = "global",
    func = _G["GetDrawLayer"],
    funcPath = "GetDrawLayer",
    params = { { name = "layer", type = "DrawLayer", default = nil }, { name = "sublayer", type = "number", default = nil } },
    returns = { { name = "layer", type = "DrawLayer", canBeSecret = false }, { name = "sublayer", type = "number", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["GetDrawSwipe"] = {
    key = "GetDrawSwipe",
    name = "GetDrawSwipe",
    category = "general",
    subcategory = "global",
    func = _G["GetDrawSwipe"],
    funcPath = "GetDrawSwipe",
    params = { { name = "drawSwipe", type = "bool", default = nil } },
    returns = { { name = "drawSwipe", type = "bool", canBeSecret = false } },
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
    params = { { name = "durationSec", type = "number", default = nil } },
    returns = { { name = "durationSec", type = "number", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["GetEdgeScale"] = {
    key = "GetEdgeScale",
    name = "GetEdgeScale",
    category = "general",
    subcategory = "global",
    func = _G["GetEdgeScale"],
    funcPath = "GetEdgeScale",
    params = { { name = "edgeScale", type = "number", default = nil } },
    returns = { { name = "edgeScale", type = "number", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["GetEditorModeContext"] = {
    key = "GetEditorModeContext",
    name = "GetEditorModeContext",
    category = "general",
    subcategory = "global",
    func = _G["GetEditorModeContext"],
    funcPath = "GetEditorModeContext",
    params = { { name = "editorModeContext", type = "HouseEditorMode", default = nil } },
    returns = { { name = "editorModeContext", type = "HouseEditorMode", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["GetEffectiveAlpha"] = {
    key = "GetEffectiveAlpha",
    name = "GetEffectiveAlpha",
    category = "general",
    subcategory = "global",
    func = _G["GetEffectiveAlpha"],
    funcPath = "GetEffectiveAlpha",
    params = { { name = "effectiveAlpha", type = "SingleColorValue", default = nil } },
    returns = { { name = "effectiveAlpha", type = "SingleColorValue", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["GetEffectiveScale"] = {
    key = "GetEffectiveScale",
    name = "GetEffectiveScale",
    category = "general",
    subcategory = "global",
    func = _G["GetEffectiveScale"],
    funcPath = "GetEffectiveScale",
    params = { { name = "effectiveScale", type = "number", default = nil } },
    returns = { { name = "effectiveScale", type = "number", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["GetEffectivelyFlattensRenderLayers"] = {
    key = "GetEffectivelyFlattensRenderLayers",
    name = "GetEffectivelyFlattensRenderLayers",
    category = "general",
    subcategory = "global",
    func = _G["GetEffectivelyFlattensRenderLayers"],
    funcPath = "GetEffectivelyFlattensRenderLayers",
    params = { { name = "flatten", type = "bool", default = nil } },
    returns = { { name = "flatten", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["GetElapsed"] = {
    key = "GetElapsed",
    name = "GetElapsed",
    category = "general",
    subcategory = "global",
    func = _G["GetElapsed"],
    funcPath = "GetElapsed",
    params = { { name = "elapsedSec", type = "number", default = nil } },
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
    params = { { name = "color", type = "colorRGBA", default = nil } },
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
    params = { { name = "delaySec", type = "number", default = nil } },
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
    params = { { name = "relativePoint", type = "FramePoint", default = nil }, { name = "relativeTo", type = "ScriptRegion", default = nil }, { name = "offsetX", type = "uiUnit", default = nil }, { name = "offsetY", type = "uiUnit", default = nil } },
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
    params = { { name = "facing", type = "number", default = nil } },
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
    params = { { name = "fadeDurationSeconds", type = "number", default = nil } },
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
    params = { { name = "fadePower", type = "number", default = nil } },
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
    params = { { name = "isFading", type = "bool", default = nil } },
    returns = { { name = "isFading", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["GetFieldSize"] = {
    key = "GetFieldSize",
    name = "GetFieldSize",
    category = "general",
    subcategory = "global",
    func = _G["GetFieldSize"],
    funcPath = "GetFieldSize",
    params = { { name = "fieldSize", type = "number", default = nil } },
    returns = { { name = "fieldSize", type = "number", canBeSecret = false } },
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

APIDefs["GetFillStyle"] = {
    key = "GetFillStyle",
    name = "GetFillStyle",
    category = "general",
    subcategory = "global",
    func = _G["GetFillStyle"],
    funcPath = "GetFillStyle",
    params = { { name = "fillStyle", type = "StatusBarFillStyle", default = nil } },
    returns = { { name = "fillStyle", type = "StatusBarFillStyle", canBeSecret = false } },
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
    params = { { name = "categoryID", type = "number", default = nil } },
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
    params = { { name = "subcategoryID", type = "number", default = nil } },
    returns = { { name = "subcategoryID", type = "number", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["GetFlattensRenderLayers"] = {
    key = "GetFlattensRenderLayers",
    name = "GetFlattensRenderLayers",
    category = "general",
    subcategory = "global",
    func = _G["GetFlattensRenderLayers"],
    funcPath = "GetFlattensRenderLayers",
    params = { { name = "flatten", type = "bool", default = nil } },
    returns = { { name = "flatten", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["GetFlipBookColumns"] = {
    key = "GetFlipBookColumns",
    name = "GetFlipBookColumns",
    category = "general",
    subcategory = "global",
    func = _G["GetFlipBookColumns"],
    funcPath = "GetFlipBookColumns",
    params = { { name = "columns", type = "number", default = nil } },
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
    params = { { name = "height", type = "number", default = nil } },
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
    params = { { name = "width", type = "number", default = nil } },
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
    params = { { name = "frames", type = "number", default = nil } },
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
    params = { { name = "rows", type = "number", default = nil } },
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
    params = { { name = "colorR", type = "number", default = nil }, { name = "colorG", type = "number", default = nil }, { name = "colorB", type = "number", default = nil }, { name = "colorA", type = "number", default = nil } },
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
    params = { { name = "fogFar", type = "number", default = nil } },
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
    params = { { name = "fogNear", type = "number", default = nil } },
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
    params = { { name = "atlas", type = "textureAtlas", default = nil } },
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
    params = { { name = "asset", type = "FileAsset", default = nil } },
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
    params = { { name = "atlas", type = "textureAtlas", default = nil } },
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
    params = { { name = "asset", type = "FileAsset", default = nil } },
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
    params = { { name = "fontFile", type = "cstring", default = nil }, { name = "height", type = "uiFontHeight", default = nil }, { name = "flags", type = "TBFFlags", default = nil } },
    returns = { { name = "fontFile", type = "cstring", canBeSecret = false }, { name = "height", type = "uiFontHeight", canBeSecret = false }, { name = "flags", type = "TBFFlags", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["GetFontHeight"] = {
    key = "GetFontHeight",
    name = "GetFontHeight",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["GetFontHeight"],
    funcPath = "GetFontHeight",
    params = { { name = "calculated", type = "bool", default = true } },
    returns = { { name = "height", type = "uiUnit", canBeSecret = false } },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
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
    params = { { name = "font", type = "SimpleFont", default = nil } },
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

APIDefs["GetFontString"] = {
    key = "GetFontString",
    name = "GetFontString",
    category = "general",
    subcategory = "global",
    func = _G["GetFontString"],
    funcPath = "GetFontString",
    params = { { name = "fontString", type = "SimpleFontString", default = nil } },
    returns = { { name = "fontString", type = "SimpleFontString", canBeSecret = false } },
    midnightImpact = "NORMAL",
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

APIDefs["GetFrameLevel"] = {
    key = "GetFrameLevel",
    name = "GetFrameLevel",
    category = "general",
    subcategory = "global",
    func = _G["GetFrameLevel"],
    funcPath = "GetFrameLevel",
    params = { { name = "frameLevel", type = "number", default = nil } },
    returns = { { name = "frameLevel", type = "number", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["GetFrameStrata"] = {
    key = "GetFrameStrata",
    name = "GetFrameStrata",
    category = "general",
    subcategory = "global",
    func = _G["GetFrameStrata"],
    funcPath = "GetFrameStrata",
    params = { { name = "strata", type = "FrameStrata", default = nil } },
    returns = { { name = "strata", type = "FrameStrata", canBeSecret = false } },
    midnightImpact = "NORMAL",
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
    params = { { name = "normalizedAlpha", type = "number", default = nil } },
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

APIDefs["GetHeight"] = {
    key = "GetHeight",
    name = "GetHeight",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["GetHeight"],
    funcPath = "GetHeight",
    params = { { name = "ignoreRect", type = "bool", default = false } },
    returns = { { name = "height", type = "uiUnit", canBeSecret = false } },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["GetHideCountdownNumbers"] = {
    key = "GetHideCountdownNumbers",
    name = "GetHideCountdownNumbers",
    category = "general",
    subcategory = "global",
    func = _G["GetHideCountdownNumbers"],
    funcPath = "GetHideCountdownNumbers",
    params = { { name = "hideNumbers", type = "bool", default = nil } },
    returns = { { name = "hideNumbers", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["GetHighestFrameLevel"] = {
    key = "GetHighestFrameLevel",
    name = "GetHighestFrameLevel",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["GetHighestFrameLevel"],
    funcPath = "GetHighestFrameLevel",
    params = { { name = "iterateAllChildren", type = "bool", default = false } },
    returns = { { name = "frameLevel", type = "number", canBeSecret = false } },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["GetHighlightColor"] = {
    key = "GetHighlightColor",
    name = "GetHighlightColor",
    category = "general",
    subcategory = "global",
    func = _G["GetHighlightColor"],
    funcPath = "GetHighlightColor",
    params = { { name = "colorR", type = "number", default = nil }, { name = "colorG", type = "number", default = nil }, { name = "colorB", type = "number", default = nil }, { name = "colorA", type = "number", default = nil } },
    returns = { { name = "colorR", type = "number", canBeSecret = false }, { name = "colorG", type = "number", canBeSecret = false }, { name = "colorB", type = "number", canBeSecret = false }, { name = "colorA", type = "number", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["GetHighlightFontObject"] = {
    key = "GetHighlightFontObject",
    name = "GetHighlightFontObject",
    category = "general",
    subcategory = "global",
    func = _G["GetHighlightFontObject"],
    funcPath = "GetHighlightFontObject",
    params = { { name = "font", type = "SimpleFont", default = nil } },
    returns = { { name = "font", type = "SimpleFont", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["GetHighlightTexture"] = {
    key = "GetHighlightTexture",
    name = "GetHighlightTexture",
    category = "general",
    subcategory = "global",
    func = _G["GetHighlightTexture"],
    funcPath = "GetHighlightTexture",
    params = { { name = "texture", type = "SimpleTexture", default = nil } },
    returns = { { name = "texture", type = "SimpleTexture", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["GetHistoryLines"] = {
    key = "GetHistoryLines",
    name = "GetHistoryLines",
    category = "general",
    subcategory = "global",
    func = _G["GetHistoryLines"],
    funcPath = "GetHistoryLines",
    params = { { name = "numHistoryLines", type = "number", default = nil } },
    returns = { { name = "numHistoryLines", type = "number", canBeSecret = false } },
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

APIDefs["GetHitRectInsets"] = {
    key = "GetHitRectInsets",
    name = "GetHitRectInsets",
    category = "general",
    subcategory = "global",
    func = _G["GetHitRectInsets"],
    funcPath = "GetHitRectInsets",
    params = { { name = "left", type = "uiUnit", default = nil }, { name = "right", type = "uiUnit", default = nil }, { name = "top", type = "uiUnit", default = nil }, { name = "bottom", type = "uiUnit", default = nil } },
    returns = { { name = "left", type = "uiUnit", canBeSecret = false }, { name = "right", type = "uiUnit", canBeSecret = false }, { name = "top", type = "uiUnit", canBeSecret = false }, { name = "bottom", type = "uiUnit", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["GetHitRectThickness"] = {
    key = "GetHitRectThickness",
    name = "GetHitRectThickness",
    category = "general",
    subcategory = "global",
    func = _G["GetHitRectThickness"],
    funcPath = "GetHitRectThickness",
    params = { { name = "thickness", type = "uiUnit", default = nil } },
    returns = { { name = "thickness", type = "uiUnit", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["GetHorizTile"] = {
    key = "GetHorizTile",
    name = "GetHorizTile",
    category = "general",
    subcategory = "global",
    func = _G["GetHorizTile"],
    funcPath = "GetHorizTile",
    params = { { name = "tiling", type = "bool", default = nil } },
    returns = { { name = "tiling", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["GetHorizontalScroll"] = {
    key = "GetHorizontalScroll",
    name = "GetHorizontalScroll",
    category = "general",
    subcategory = "global",
    func = _G["GetHorizontalScroll"],
    funcPath = "GetHorizontalScroll",
    params = { { name = "offset", type = "uiUnit", default = nil } },
    returns = { { name = "offset", type = "uiUnit", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["GetHorizontalScrollRange"] = {
    key = "GetHorizontalScrollRange",
    name = "GetHorizontalScrollRange",
    category = "general",
    subcategory = "global",
    func = _G["GetHorizontalScrollRange"],
    funcPath = "GetHorizontalScrollRange",
    params = { { name = "range", type = "uiUnit", default = nil } },
    returns = { { name = "range", type = "uiUnit", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["GetHyperlinkFormat"] = {
    key = "GetHyperlinkFormat",
    name = "GetHyperlinkFormat",
    category = "general",
    subcategory = "global",
    func = _G["GetHyperlinkFormat"],
    funcPath = "GetHyperlinkFormat",
    params = { { name = "format", type = "cstring", default = nil } },
    returns = { { name = "format", type = "cstring", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["GetHyperlinksEnabled"] = {
    key = "GetHyperlinksEnabled",
    name = "GetHyperlinksEnabled",
    category = "general",
    subcategory = "global",
    func = _G["GetHyperlinksEnabled"],
    funcPath = "GetHyperlinksEnabled",
    params = { { name = "enabled", type = "bool", default = nil } },
    returns = { { name = "enabled", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["GetID"] = {
    key = "GetID",
    name = "GetID",
    category = "general",
    subcategory = "global",
    func = _G["GetID"],
    funcPath = "GetID",
    params = { { name = "id", type = "number", default = nil } },
    returns = { { name = "id", type = "number", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["GetIndentedWordWrap"] = {
    key = "GetIndentedWordWrap",
    name = "GetIndentedWordWrap",
    category = "general",
    subcategory = "global",
    func = _G["GetIndentedWordWrap"],
    funcPath = "GetIndentedWordWrap",
    params = { { name = "wordWrap", type = "bool", default = nil } },
    returns = { { name = "wordWrap", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["GetInputLanguage"] = {
    key = "GetInputLanguage",
    name = "GetInputLanguage",
    category = "general",
    subcategory = "global",
    func = _G["GetInputLanguage"],
    funcPath = "GetInputLanguage",
    params = { { name = "language", type = "cstring", default = nil } },
    returns = { { name = "language", type = "cstring", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["GetInsertMode"] = {
    key = "GetInsertMode",
    name = "GetInsertMode",
    category = "general",
    subcategory = "global",
    func = _G["GetInsertMode"],
    funcPath = "GetInsertMode",
    params = { { name = "mode", type = "InsertMode", default = nil } },
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

APIDefs["GetInterpolatedValue"] = {
    key = "GetInterpolatedValue",
    name = "GetInterpolatedValue",
    category = "general",
    subcategory = "global",
    func = _G["GetInterpolatedValue"],
    funcPath = "GetInterpolatedValue",
    params = { { name = "value", type = "number", default = nil } },
    returns = { { name = "value", type = "number", canBeSecret = false } },
    midnightImpact = "NORMAL",
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
    params = { { name = "infoList", type = "table", default = nil } },
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
    params = { { name = "justifyH", type = "JustifyHorizontal", default = nil } },
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
    params = { { name = "justifyV", type = "JustifyVertical", default = nil } },
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
    params = { { name = "keepModelOnHide", type = "bool", default = nil } },
    returns = { { name = "keepModelOnHide", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["GetLeft"] = {
    key = "GetLeft",
    name = "GetLeft",
    category = "general",
    subcategory = "global",
    func = _G["GetLeft"],
    funcPath = "GetLeft",
    params = { { name = "left", type = "uiUnit", default = nil } },
    returns = { { name = "left", type = "uiUnit", canBeSecret = false } },
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
    params = { { name = "enabled", type = "bool", default = nil }, { name = "light", type = "ModelLight", default = nil } },
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
    params = { { name = "colorR", type = "number", default = nil }, { name = "colorG", type = "number", default = nil }, { name = "colorB", type = "number", default = nil } },
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
    params = { { name = "colorR", type = "number", default = nil }, { name = "colorG", type = "number", default = nil }, { name = "colorB", type = "number", default = nil } },
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
    params = { { name = "directionX", type = "number", default = nil }, { name = "directionY", type = "number", default = nil }, { name = "directionZ", type = "number", default = nil } },
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
    params = { { name = "positionX", type = "number", default = nil }, { name = "positionY", type = "number", default = nil }, { name = "positionZ", type = "number", default = nil } },
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
    params = { { name = "lightType", type = "ModelLightType", default = nil } },
    returns = { { name = "lightType", type = "ModelLightType", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["GetLineHeight"] = {
    key = "GetLineHeight",
    name = "GetLineHeight",
    category = "general",
    subcategory = "global",
    func = _G["GetLineHeight"],
    funcPath = "GetLineHeight",
    params = { { name = "lineHeight", type = "uiUnit", default = nil } },
    returns = { { name = "lineHeight", type = "uiUnit", canBeSecret = false } },
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
    params = { { name = "loopState", type = "cstring", default = nil } },
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
    params = { { name = "loopType", type = "LoopType", default = nil } },
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
    params = { { name = "file", type = "fileID", default = nil } },
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
    params = { { name = "file", type = "fileID", default = nil } },
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
    params = { { name = "file", type = "fileID", default = nil } },
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
    params = { { name = "uiMapID", type = "number", default = nil } },
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
    params = { { name = "scalar", type = "number", default = nil } },
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
    params = { { name = "boxBottom", type = "vector3", default = nil }, { name = "boxTop", type = "vector3", default = nil } },
    returns = { { name = "boxBottom", type = "vector3", canBeSecret = false }, { name = "boxTop", type = "vector3", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["GetMaxBytes"] = {
    key = "GetMaxBytes",
    name = "GetMaxBytes",
    category = "general",
    subcategory = "global",
    func = _G["GetMaxBytes"],
    funcPath = "GetMaxBytes",
    params = { { name = "maxBytes", type = "number", default = nil } },
    returns = { { name = "maxBytes", type = "number", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["GetMaxCharacterSlotCount"] = {
    key = "GetMaxCharacterSlotCount",
    name = "GetMaxCharacterSlotCount",
    category = "general",
    subcategory = "global",
    func = _G["GetMaxCharacterSlotCount"],
    funcPath = "GetMaxCharacterSlotCount",
    params = { { name = "maxCharacterSlotCount", type = "number", default = nil } },
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
    params = { { name = "maxOrder", type = "number", default = nil } },
    returns = { { name = "maxOrder", type = "number", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["GetMaxLetters"] = {
    key = "GetMaxLetters",
    name = "GetMaxLetters",
    category = "general",
    subcategory = "global",
    func = _G["GetMaxLetters"],
    funcPath = "GetMaxLetters",
    params = { { name = "maxLetters", type = "number", default = nil } },
    returns = { { name = "maxLetters", type = "number", canBeSecret = false } },
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

APIDefs["GetMaxLines"] = {
    key = "GetMaxLines",
    name = "GetMaxLines",
    category = "general",
    subcategory = "global",
    func = _G["GetMaxLines"],
    funcPath = "GetMaxLines",
    params = { { name = "maxLines", type = "number", default = nil } },
    returns = { { name = "maxLines", type = "number", canBeSecret = false } },
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
    params = { { name = "maxSnapshots", type = "number", default = nil } },
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
    params = { { name = "minValue", type = "number", default = nil }, { name = "maxValue", type = "number", default = nil } },
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

APIDefs["GetMinimumCountdownDuration"] = {
    key = "GetMinimumCountdownDuration",
    name = "GetMinimumCountdownDuration",
    category = "general",
    subcategory = "global",
    func = _G["GetMinimumCountdownDuration"],
    funcPath = "GetMinimumCountdownDuration",
    params = { { name = "milliseconds", type = "number", default = nil } },
    returns = { { name = "milliseconds", type = "number", canBeSecret = false } },
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

APIDefs["GetMinimumWidth"] = {
    key = "GetMinimumWidth",
    name = "GetMinimumWidth",
    category = "general",
    subcategory = "global",
    func = _G["GetMinimumWidth"],
    funcPath = "GetMinimumWidth",
    params = { { name = "width", type = "number", default = nil }, { name = "forced", type = "bool", default = nil } },
    returns = { { name = "width", type = "number", canBeSecret = false }, { name = "forced", type = "bool", canBeSecret = false } },
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
    params = { { name = "modRate", type = "number", default = nil } },
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
    params = { { name = "alpha", type = "number", default = nil } },
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
    params = { { name = "layer", type = "DrawLayer", default = nil }, { name = "sublayer", type = "number", default = nil } },
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
    params = { { name = "modelFileID", type = "fileID", default = nil } },
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
    params = { { name = "path", type = "string", default = nil } },
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
    params = { { name = "scale", type = "number", default = nil } },
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
    params = { { name = "guid", type = "WOWGUID", default = nil } },
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

APIDefs["GetMotionScriptsWhileDisabled"] = {
    key = "GetMotionScriptsWhileDisabled",
    name = "GetMotionScriptsWhileDisabled",
    category = "general",
    subcategory = "global",
    func = _G["GetMotionScriptsWhileDisabled"],
    funcPath = "GetMotionScriptsWhileDisabled",
    params = { { name = "motionScriptsWhileDisabled", type = "bool", default = nil } },
    returns = { { name = "motionScriptsWhileDisabled", type = "bool", canBeSecret = false } },
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
    params = { { name = "units", type = "string", default = nil } },
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

APIDefs["GetName"] = {
    key = "GetName",
    name = "GetName",
    category = "general",
    subcategory = "global",
    func = _G["GetName"],
    funcPath = "GetName",
    params = { { name = "name", type = "cstring", default = nil } },
    returns = { { name = "name", type = "cstring", canBeSecret = false } },
    midnightImpact = "NORMAL",
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

APIDefs["GetNormalFontObject"] = {
    key = "GetNormalFontObject",
    name = "GetNormalFontObject",
    category = "general",
    subcategory = "global",
    func = _G["GetNormalFontObject"],
    funcPath = "GetNormalFontObject",
    params = { { name = "font", type = "SimpleFont", default = nil } },
    returns = { { name = "font", type = "SimpleFont", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["GetNormalTexture"] = {
    key = "GetNormalTexture",
    name = "GetNormalTexture",
    category = "general",
    subcategory = "global",
    func = _G["GetNormalTexture"],
    funcPath = "GetNormalTexture",
    params = { { name = "texture", type = "SimpleTexture", default = nil } },
    returns = { { name = "texture", type = "SimpleTexture", canBeSecret = false } },
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
    params = { { name = "numActors", type = "number", default = nil } },
    returns = { { name = "numActors", type = "number", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["GetNumChildren"] = {
    key = "GetNumChildren",
    name = "GetNumChildren",
    category = "general",
    subcategory = "global",
    func = _G["GetNumChildren"],
    funcPath = "GetNumChildren",
    params = { { name = "numChildren", type = "number", default = nil } },
    returns = { { name = "numChildren", type = "number", canBeSecret = false } },
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

APIDefs["GetNumLetters"] = {
    key = "GetNumLetters",
    name = "GetNumLetters",
    category = "general",
    subcategory = "global",
    func = _G["GetNumLetters"],
    funcPath = "GetNumLetters",
    params = { { name = "numLetters", type = "number", default = nil } },
    returns = { { name = "numLetters", type = "number", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["GetNumLines"] = {
    key = "GetNumLines",
    name = "GetNumLines",
    category = "general",
    subcategory = "global",
    func = _G["GetNumLines"],
    funcPath = "GetNumLines",
    params = { { name = "numLines", type = "number", default = nil } },
    returns = { { name = "numLines", type = "number", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["GetNumMaskTextures"] = {
    key = "GetNumMaskTextures",
    name = "GetNumMaskTextures",
    category = "general",
    subcategory = "global",
    func = _G["GetNumMaskTextures"],
    funcPath = "GetNumMaskTextures",
    params = { { name = "count", type = "size", default = nil } },
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
    params = { { name = "numPoints", type = "number", default = nil } },
    returns = { { name = "numPoints", type = "number", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["GetNumRegions"] = {
    key = "GetNumRegions",
    name = "GetNumRegions",
    category = "general",
    subcategory = "global",
    func = _G["GetNumRegions"],
    funcPath = "GetNumRegions",
    params = { { name = "numRegions", type = "number", default = nil } },
    returns = { { name = "numRegions", type = "number", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["GetNumSearchItems"] = {
    key = "GetNumSearchItems",
    name = "GetNumSearchItems",
    category = "general",
    subcategory = "global",
    func = _G["GetNumSearchItems"],
    funcPath = "GetNumSearchItems",
    params = { { name = "numSearchItems", type = "number", default = nil } },
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
    params = { { name = "numObjectives", type = "number", default = nil } },
    returns = { { name = "numObjectives", type = "number", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["GetNumber"] = {
    key = "GetNumber",
    name = "GetNumber",
    category = "general",
    subcategory = "global",
    func = _G["GetNumber"],
    funcPath = "GetNumber",
    params = { { name = "number", type = "number", default = nil } },
    returns = { { name = "number", type = "number", canBeSecret = false } },
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
    params = { { name = "obey", type = "bool", default = nil } },
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
    params = { { name = "isObeyStepOnDrag", type = "bool", default = nil } },
    returns = { { name = "isObeyStepOnDrag", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["GetObjectType"] = {
    key = "GetObjectType",
    name = "GetObjectType",
    category = "general",
    subcategory = "global",
    func = _G["GetObjectType"],
    funcPath = "GetObjectType",
    params = { { name = "objectType", type = "cstring", default = nil } },
    returns = { { name = "objectType", type = "cstring", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["GetOffset"] = {
    key = "GetOffset",
    name = "GetOffset",
    category = "general",
    subcategory = "global",
    func = _G["GetOffset"],
    funcPath = "GetOffset",
    params = { { name = "offsetX", type = "uiUnit", default = nil }, { name = "offsetY", type = "uiUnit", default = nil } },
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
    params = { { name = "order", type = "number", default = nil } },
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
    params = { { name = "orientation", type = "Orientation", default = nil } },
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
    params = { { name = "point", type = "FramePoint", default = nil }, { name = "originX", type = "number", default = nil }, { name = "originY", type = "number", default = nil } },
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

APIDefs["GetPadding"] = {
    key = "GetPadding",
    name = "GetPadding",
    category = "general",
    subcategory = "global",
    func = _G["GetPadding"],
    funcPath = "GetPadding",
    params = { { name = "right", type = "number", default = nil }, { name = "bottom", type = "number", default = nil }, { name = "left", type = "number", default = nil }, { name = "top", type = "number", default = nil } },
    returns = { { name = "right", type = "number", canBeSecret = false }, { name = "bottom", type = "number", canBeSecret = false }, { name = "left", type = "number", canBeSecret = false }, { name = "top", type = "number", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["GetParent"] = {
    key = "GetParent",
    name = "GetParent",
    category = "general",
    subcategory = "global",
    func = _G["GetParent"],
    funcPath = "GetParent",
    params = { { name = "parent", type = "CScriptObject", default = nil } },
    returns = { { name = "parent", type = "CScriptObject", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["GetParentKey"] = {
    key = "GetParentKey",
    name = "GetParentKey",
    category = "general",
    subcategory = "global",
    func = _G["GetParentKey"],
    funcPath = "GetParentKey",
    params = { { name = "parentKey", type = "cstring", default = nil } },
    returns = { { name = "parentKey", type = "cstring", canBeSecret = false } },
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
    params = { { name = "scale", type = "number", default = nil } },
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
    params = { { name = "paused", type = "bool", default = nil } },
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
    params = { { name = "type", type = "HousingLayoutPinType", default = nil } },
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
    params = { { name = "positionX", type = "number", default = nil }, { name = "positionY", type = "number", default = nil } },
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
    params = { { name = "pitch", type = "number", default = nil } },
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
    params = { { name = "scale", type = "number", default = nil } },
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
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
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
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["GetPointCount"] = {
    key = "GetPointCount",
    name = "GetPointCount",
    category = "general",
    subcategory = "global",
    func = _G["GetPointCount"],
    funcPath = "GetPointCount",
    params = { { name = "count", type = "size", default = nil } },
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
    params = { { name = "point", type = "table", default = nil } },
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
    params = { { name = "positionX", type = "number", default = nil }, { name = "positionY", type = "number", default = nil }, { name = "positionZ", type = "number", default = nil } },
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

APIDefs["GetProgress"] = {
    key = "GetProgress",
    name = "GetProgress",
    category = "general",
    subcategory = "global",
    func = _G["GetProgress"],
    funcPath = "GetProgress",
    params = { { name = "progress", type = "number", default = nil } },
    returns = { { name = "progress", type = "number", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["GetPropagateKeyboardInput"] = {
    key = "GetPropagateKeyboardInput",
    name = "GetPropagateKeyboardInput",
    category = "general",
    subcategory = "global",
    func = _G["GetPropagateKeyboardInput"],
    funcPath = "GetPropagateKeyboardInput",
    params = { { name = "propagate", type = "bool", default = nil } },
    returns = { { name = "propagate", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["GetPushedTextOffset"] = {
    key = "GetPushedTextOffset",
    name = "GetPushedTextOffset",
    category = "general",
    subcategory = "global",
    func = _G["GetPushedTextOffset"],
    funcPath = "GetPushedTextOffset",
    params = { { name = "offsetX", type = "uiUnit", default = nil }, { name = "offsetY", type = "uiUnit", default = nil } },
    returns = { { name = "offsetX", type = "uiUnit", canBeSecret = false }, { name = "offsetY", type = "uiUnit", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["GetPushedTexture"] = {
    key = "GetPushedTexture",
    name = "GetPushedTexture",
    category = "general",
    subcategory = "global",
    func = _G["GetPushedTexture"],
    funcPath = "GetPushedTexture",
    params = { { name = "texture", type = "SimpleTexture", default = nil } },
    returns = { { name = "texture", type = "SimpleTexture", canBeSecret = false } },
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
    params = { { name = "angle", type = "number", default = nil } },
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

APIDefs["GetRaisedFrameLevel"] = {
    key = "GetRaisedFrameLevel",
    name = "GetRaisedFrameLevel",
    category = "general",
    subcategory = "global",
    func = _G["GetRaisedFrameLevel"],
    funcPath = "GetRaisedFrameLevel",
    params = { { name = "frameLevel", type = "number", default = nil } },
    returns = { { name = "frameLevel", type = "number", canBeSecret = false } },
    midnightImpact = "NORMAL",
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

APIDefs["GetRect"] = {
    key = "GetRect",
    name = "GetRect",
    category = "general",
    subcategory = "global",
    func = _G["GetRect"],
    funcPath = "GetRect",
    params = { { name = "left", type = "uiUnit", default = nil }, { name = "bottom", type = "uiUnit", default = nil }, { name = "width", type = "uiUnit", default = nil }, { name = "height", type = "uiUnit", default = nil } },
    returns = { { name = "left", type = "uiUnit", canBeSecret = false }, { name = "bottom", type = "uiUnit", canBeSecret = false }, { name = "width", type = "uiUnit", canBeSecret = false }, { name = "height", type = "uiUnit", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["GetRegionParent"] = {
    key = "GetRegionParent",
    name = "GetRegionParent",
    category = "general",
    subcategory = "global",
    func = _G["GetRegionParent"],
    funcPath = "GetRegionParent",
    params = { { name = "region", type = "CScriptObject", default = nil } },
    returns = { { name = "region", type = "CScriptObject", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["GetRegions"] = {
    key = "GetRegions",
    name = "GetRegions",
    category = "general",
    subcategory = "global",
    func = _G["GetRegions"],
    funcPath = "GetRegions",
    params = { { name = "regions", type = "SimpleRegion", default = nil } },
    returns = { { name = "regions", type = "SimpleRegion", canBeSecret = false } },
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

APIDefs["GetResizeBounds"] = {
    key = "GetResizeBounds",
    name = "GetResizeBounds",
    category = "general",
    subcategory = "global",
    func = _G["GetResizeBounds"],
    funcPath = "GetResizeBounds",
    params = { { name = "minWidth", type = "uiUnit", default = nil }, { name = "minHeight", type = "uiUnit", default = nil }, { name = "maxWidth", type = "uiUnit", default = nil }, { name = "maxHeight", type = "uiUnit", default = nil } },
    returns = { { name = "minWidth", type = "uiUnit", canBeSecret = false }, { name = "minHeight", type = "uiUnit", canBeSecret = false }, { name = "maxWidth", type = "uiUnit", canBeSecret = false }, { name = "maxHeight", type = "uiUnit", canBeSecret = false } },
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

APIDefs["GetReverse"] = {
    key = "GetReverse",
    name = "GetReverse",
    category = "general",
    subcategory = "global",
    func = _G["GetReverse"],
    funcPath = "GetReverse",
    params = { { name = "reverse", type = "bool", default = nil } },
    returns = { { name = "reverse", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["GetReverseFill"] = {
    key = "GetReverseFill",
    name = "GetReverseFill",
    category = "general",
    subcategory = "global",
    func = _G["GetReverseFill"],
    funcPath = "GetReverseFill",
    params = { { name = "isReverseFill", type = "bool", default = nil } },
    returns = { { name = "isReverseFill", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["GetRight"] = {
    key = "GetRight",
    name = "GetRight",
    category = "general",
    subcategory = "global",
    func = _G["GetRight"],
    funcPath = "GetRight",
    params = { { name = "right", type = "uiUnit", default = nil } },
    returns = { { name = "right", type = "uiUnit", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["GetRoll"] = {
    key = "GetRoll",
    name = "GetRoll",
    category = "general",
    subcategory = "global",
    func = _G["GetRoll"],
    funcPath = "GetRoll",
    params = { { name = "roll", type = "number", default = nil } },
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
    params = { { name = "roomGUID", type = "WOWGUID", default = nil } },
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
    params = { { name = "name", type = "cstring", default = nil } },
    returns = { { name = "name", type = "cstring", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["GetRotatesTexture"] = {
    key = "GetRotatesTexture",
    name = "GetRotatesTexture",
    category = "general",
    subcategory = "global",
    func = _G["GetRotatesTexture"],
    funcPath = "GetRotatesTexture",
    params = { { name = "rotatesTexture", type = "bool", default = nil } },
    returns = { { name = "rotatesTexture", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["GetRotation"] = {
    key = "GetRotation",
    name = "GetRotation",
    category = "general",
    subcategory = "global",
    func = _G["GetRotation"],
    funcPath = "GetRotation",
    params = { { name = "radians", type = "number", default = nil }, { name = "normalizedRotationPoint", type = "vector2", default = nil } },
    returns = { { name = "radians", type = "number", canBeSecret = false }, { name = "normalizedRotationPoint", type = "vector2", canBeSecret = false } },
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
    params = { { name = "scale", type = "number", default = nil } },
    returns = { { name = "scale", type = "number", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["GetScaleAnimationMode"] = {
    key = "GetScaleAnimationMode",
    name = "GetScaleAnimationMode",
    category = "general",
    subcategory = "global",
    func = _G["GetScaleAnimationMode"],
    funcPath = "GetScaleAnimationMode",
    params = { { name = "scaleAnimationMode", type = "FontStringScaleAnimationMode", default = nil } },
    returns = { { name = "scaleAnimationMode", type = "FontStringScaleAnimationMode", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["GetScaleFrom"] = {
    key = "GetScaleFrom",
    name = "GetScaleFrom",
    category = "general",
    subcategory = "global",
    func = _G["GetScaleFrom"],
    funcPath = "GetScaleFrom",
    params = { { name = "scaleX", type = "number", default = nil }, { name = "scaleY", type = "number", default = nil } },
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
    params = { { name = "scaleX", type = "number", default = nil }, { name = "scaleY", type = "number", default = nil } },
    returns = { { name = "scaleX", type = "number", canBeSecret = false }, { name = "scaleY", type = "number", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["GetScaledRect"] = {
    key = "GetScaledRect",
    name = "GetScaledRect",
    category = "general",
    subcategory = "global",
    func = _G["GetScaledRect"],
    funcPath = "GetScaledRect",
    params = { { name = "left", type = "uiUnit", default = nil }, { name = "bottom", type = "uiUnit", default = nil }, { name = "width", type = "uiUnit", default = nil }, { name = "height", type = "uiUnit", default = nil } },
    returns = { { name = "left", type = "uiUnit", canBeSecret = false }, { name = "bottom", type = "uiUnit", canBeSecret = false }, { name = "width", type = "uiUnit", canBeSecret = false }, { name = "height", type = "uiUnit", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["GetScenarioTooltipText"] = {
    key = "GetScenarioTooltipText",
    name = "GetScenarioTooltipText",
    category = "general",
    subcategory = "global",
    func = _G["GetScenarioTooltipText"],
    funcPath = "GetScenarioTooltipText",
    params = { { name = "tooltipText", type = "cstring", default = nil } },
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

APIDefs["GetScrollChild"] = {
    key = "GetScrollChild",
    name = "GetScrollChild",
    category = "general",
    subcategory = "global",
    func = _G["GetScrollChild"],
    funcPath = "GetScrollChild",
    params = { { name = "scrollChild", type = "SimpleFrame", default = nil } },
    returns = { { name = "scrollChild", type = "SimpleFrame", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["GetSearchCount"] = {
    key = "GetSearchCount",
    name = "GetSearchCount",
    category = "general",
    subcategory = "global",
    func = _G["GetSearchCount"],
    funcPath = "GetSearchCount",
    params = { { name = "searchCount", type = "number", default = nil } },
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
    params = { { name = "searchText", type = "string", default = nil } },
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
    params = { { name = "colorR", type = "number", default = nil }, { name = "colorG", type = "number", default = nil }, { name = "colorB", type = "number", default = nil }, { name = "colorA", type = "number", default = nil } },
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
    params = { { name = "strength", type = "number", default = nil } },
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
    params = { { name = "offsetX", type = "number", default = nil }, { name = "offsetY", type = "number", default = nil } },
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
    params = { { name = "sheathed", type = "bool", default = nil } },
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

APIDefs["GetSize"] = {
    key = "GetSize",
    name = "GetSize",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["GetSize"],
    funcPath = "GetSize",
    params = { { name = "ignoreRect", type = "bool", default = false } },
    returns = { { name = "width", type = "uiUnit", canBeSecret = false }, { name = "height", type = "uiUnit", canBeSecret = false } },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["GetSmoothProgress"] = {
    key = "GetSmoothProgress",
    name = "GetSmoothProgress",
    category = "general",
    subcategory = "global",
    func = _G["GetSmoothProgress"],
    funcPath = "GetSmoothProgress",
    params = { { name = "progress", type = "number", default = nil } },
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
    params = { { name = "weights", type = "SmoothingType", default = nil } },
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
    params = { { name = "sortType", type = "HousingCatalogSortType", default = nil } },
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
    params = { { name = "location", type = "string", default = nil } },
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
    params = { { name = "spacing", type = "uiUnit", default = nil } },
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
    params = { { name = "spellVisualKitID", type = "number", default = nil } },
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
    params = { { name = "color", type = "colorRGBA", default = nil } },
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
    params = { { name = "delaySec", type = "number", default = nil } },
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
    params = { { name = "relativePoint", type = "FramePoint", default = nil }, { name = "relativeTo", type = "ScriptRegion", default = nil }, { name = "offsetX", type = "uiUnit", default = nil }, { name = "offsetY", type = "uiUnit", default = nil } },
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

APIDefs["GetStatusBarColor"] = {
    key = "GetStatusBarColor",
    name = "GetStatusBarColor",
    category = "general",
    subcategory = "global",
    func = _G["GetStatusBarColor"],
    funcPath = "GetStatusBarColor",
    params = { { name = "colorR", type = "number", default = nil }, { name = "colorG", type = "number", default = nil }, { name = "colorB", type = "number", default = nil }, { name = "colorA", type = "number", default = nil } },
    returns = { { name = "colorR", type = "number", canBeSecret = false }, { name = "colorG", type = "number", canBeSecret = false }, { name = "colorB", type = "number", canBeSecret = false }, { name = "colorA", type = "number", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["GetStatusBarDesaturation"] = {
    key = "GetStatusBarDesaturation",
    name = "GetStatusBarDesaturation",
    category = "general",
    subcategory = "global",
    func = _G["GetStatusBarDesaturation"],
    funcPath = "GetStatusBarDesaturation",
    params = { { name = "desaturation", type = "normalizedValue", default = nil } },
    returns = { { name = "desaturation", type = "normalizedValue", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["GetStatusBarTexture"] = {
    key = "GetStatusBarTexture",
    name = "GetStatusBarTexture",
    category = "general",
    subcategory = "global",
    func = _G["GetStatusBarTexture"],
    funcPath = "GetStatusBarTexture",
    params = { { name = "texture", type = "SimpleTexture", default = nil } },
    returns = { { name = "texture", type = "SimpleTexture", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["GetStepsPerPage"] = {
    key = "GetStepsPerPage",
    name = "GetStepsPerPage",
    category = "general",
    subcategory = "global",
    func = _G["GetStepsPerPage"],
    funcPath = "GetStepsPerPage",
    params = { { name = "stepsPerPage", type = "number", default = nil } },
    returns = { { name = "stepsPerPage", type = "number", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["GetStringHeight"] = {
    key = "GetStringHeight",
    name = "GetStringHeight",
    category = "general",
    subcategory = "global",
    func = _G["GetStringHeight"],
    funcPath = "GetStringHeight",
    params = { { name = "height", type = "uiUnit", default = nil } },
    returns = { { name = "height", type = "uiUnit", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["GetStringWidth"] = {
    key = "GetStringWidth",
    name = "GetStringWidth",
    category = "general",
    subcategory = "global",
    func = _G["GetStringWidth"],
    funcPath = "GetStringWidth",
    params = { { name = "width", type = "uiUnit", default = nil } },
    returns = { { name = "width", type = "uiUnit", canBeSecret = false } },
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
    params = { { name = "target", type = "CScriptObject", default = nil } },
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

APIDefs["GetTexCoord"] = {
    key = "GetTexCoord",
    name = "GetTexCoord",
    category = "general",
    subcategory = "global",
    func = _G["GetTexCoord"],
    funcPath = "GetTexCoord",
    params = { { name = "ulX", type = "number", default = nil }, { name = "ulY", type = "number", default = nil }, { name = "llX", type = "number", default = nil }, { name = "llY", type = "number", default = nil }, { name = "urX", type = "number", default = nil }, { name = "urY", type = "number", default = nil }, { name = "lrX", type = "number", default = nil }, { name = "lrY", type = "number", default = nil } },
    returns = { { name = "ulX", type = "number", canBeSecret = false }, { name = "ulY", type = "number", canBeSecret = false }, { name = "llX", type = "number", canBeSecret = false }, { name = "llY", type = "number", canBeSecret = false }, { name = "urX", type = "number", canBeSecret = false }, { name = "urY", type = "number", canBeSecret = false }, { name = "lrX", type = "number", canBeSecret = false }, { name = "lrY", type = "number", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["GetTexelSnappingBias"] = {
    key = "GetTexelSnappingBias",
    name = "GetTexelSnappingBias",
    category = "general",
    subcategory = "global",
    func = _G["GetTexelSnappingBias"],
    funcPath = "GetTexelSnappingBias",
    params = { { name = "bias", type = "normalizedValue", default = nil } },
    returns = { { name = "bias", type = "normalizedValue", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["GetText"] = {
    key = "GetText",
    name = "GetText",
    category = "general",
    subcategory = "global",
    func = _G["GetText"],
    funcPath = "GetText",
    params = { { name = "text", type = "cstring", default = nil } },
    returns = { { name = "text", type = "cstring", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["GetTextColor"] = {
    key = "GetTextColor",
    name = "GetTextColor",
    category = "general",
    subcategory = "global",
    func = _G["GetTextColor"],
    funcPath = "GetTextColor",
    params = { { name = "colorR", type = "number", default = nil }, { name = "colorG", type = "number", default = nil }, { name = "colorB", type = "number", default = nil }, { name = "colorA", type = "number", default = nil } },
    returns = { { name = "colorR", type = "number", canBeSecret = false }, { name = "colorG", type = "number", canBeSecret = false }, { name = "colorB", type = "number", canBeSecret = false }, { name = "colorA", type = "number", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["GetTextData"] = {
    key = "GetTextData",
    name = "GetTextData",
    category = "general",
    subcategory = "global",
    func = _G["GetTextData"],
    funcPath = "GetTextData",
    params = { { name = "content", type = "table", default = nil } },
    returns = { { name = "content", type = "table", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["GetTextHeight"] = {
    key = "GetTextHeight",
    name = "GetTextHeight",
    category = "general",
    subcategory = "global",
    func = _G["GetTextHeight"],
    funcPath = "GetTextHeight",
    params = { { name = "height", type = "uiUnit", default = nil } },
    returns = { { name = "height", type = "uiUnit", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["GetTextInsets"] = {
    key = "GetTextInsets",
    name = "GetTextInsets",
    category = "general",
    subcategory = "global",
    func = _G["GetTextInsets"],
    funcPath = "GetTextInsets",
    params = { { name = "left", type = "uiUnit", default = nil }, { name = "right", type = "uiUnit", default = nil }, { name = "top", type = "uiUnit", default = nil }, { name = "bottom", type = "uiUnit", default = nil } },
    returns = { { name = "left", type = "uiUnit", canBeSecret = false }, { name = "right", type = "uiUnit", canBeSecret = false }, { name = "top", type = "uiUnit", canBeSecret = false }, { name = "bottom", type = "uiUnit", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["GetTextScale"] = {
    key = "GetTextScale",
    name = "GetTextScale",
    category = "general",
    subcategory = "global",
    func = _G["GetTextScale"],
    funcPath = "GetTextScale",
    params = { { name = "textScale", type = "number", default = nil } },
    returns = { { name = "textScale", type = "number", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["GetTextWidth"] = {
    key = "GetTextWidth",
    name = "GetTextWidth",
    category = "general",
    subcategory = "global",
    func = _G["GetTextWidth"],
    funcPath = "GetTextWidth",
    params = { { name = "width", type = "uiUnit", default = nil } },
    returns = { { name = "width", type = "uiUnit", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["GetTexture"] = {
    key = "GetTexture",
    name = "GetTexture",
    category = "general",
    subcategory = "global",
    func = _G["GetTexture"],
    funcPath = "GetTexture",
    params = { { name = "textureFile", type = "cstring", default = nil } },
    returns = { { name = "textureFile", type = "cstring", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["GetTextureFileID"] = {
    key = "GetTextureFileID",
    name = "GetTextureFileID",
    category = "general",
    subcategory = "global",
    func = _G["GetTextureFileID"],
    funcPath = "GetTextureFileID",
    params = { { name = "textureFile", type = "fileID", default = nil } },
    returns = { { name = "textureFile", type = "fileID", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["GetTextureFilePath"] = {
    key = "GetTextureFilePath",
    name = "GetTextureFilePath",
    category = "general",
    subcategory = "global",
    func = _G["GetTextureFilePath"],
    funcPath = "GetTextureFilePath",
    params = { { name = "textureFile", type = "cstring", default = nil } },
    returns = { { name = "textureFile", type = "cstring", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["GetTextureSliceMargins"] = {
    key = "GetTextureSliceMargins",
    name = "GetTextureSliceMargins",
    category = "general",
    subcategory = "global",
    func = _G["GetTextureSliceMargins"],
    funcPath = "GetTextureSliceMargins",
    params = { { name = "left", type = "number", default = nil }, { name = "top", type = "number", default = nil }, { name = "right", type = "number", default = nil }, { name = "bottom", type = "number", default = nil } },
    returns = { { name = "left", type = "number", canBeSecret = false }, { name = "top", type = "number", canBeSecret = false }, { name = "right", type = "number", canBeSecret = false }, { name = "bottom", type = "number", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["GetTextureSliceMode"] = {
    key = "GetTextureSliceMode",
    name = "GetTextureSliceMode",
    category = "general",
    subcategory = "global",
    func = _G["GetTextureSliceMode"],
    funcPath = "GetTextureSliceMode",
    params = { { name = "sliceMode", type = "UITextureSliceMode", default = nil } },
    returns = { { name = "sliceMode", type = "UITextureSliceMode", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["GetThickness"] = {
    key = "GetThickness",
    name = "GetThickness",
    category = "general",
    subcategory = "global",
    func = _G["GetThickness"],
    funcPath = "GetThickness",
    params = { { name = "thickness", type = "uiUnit", default = nil } },
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
    params = { { name = "texture", type = "SimpleTexture", default = nil } },
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
    params = { { name = "timeVisibleSeconds", type = "number", default = nil } },
    returns = { { name = "timeVisibleSeconds", type = "number", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["GetTimerDuration"] = {
    key = "GetTimerDuration",
    name = "GetTimerDuration",
    category = "general",
    subcategory = "global",
    func = _G["GetTimerDuration"],
    funcPath = "GetTimerDuration",
    params = { { name = "duration", type = "LuaDurationObject", default = nil } },
    returns = { { name = "duration", type = "LuaDurationObject", canBeSecret = false } },
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
    params = { { name = "normalizedAlpha", type = "number", default = nil } },
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

APIDefs["GetTop"] = {
    key = "GetTop",
    name = "GetTop",
    category = "general",
    subcategory = "global",
    func = _G["GetTop"],
    funcPath = "GetTop",
    params = { { name = "top", type = "uiUnit", default = nil } },
    returns = { { name = "top", type = "uiUnit", canBeSecret = false } },
    midnightImpact = "NORMAL",
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
    params = { { name = "curveType", type = "LuaCurveType", default = nil } },
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

APIDefs["GetUTF8CursorPosition"] = {
    key = "GetUTF8CursorPosition",
    name = "GetUTF8CursorPosition",
    category = "general",
    subcategory = "global",
    func = _G["GetUTF8CursorPosition"],
    funcPath = "GetUTF8CursorPosition",
    params = { { name = "cursorPosition", type = "number", default = nil } },
    returns = { { name = "cursorPosition", type = "number", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["GetUiMapID"] = {
    key = "GetUiMapID",
    name = "GetUiMapID",
    category = "general",
    subcategory = "global",
    func = _G["GetUiMapID"],
    funcPath = "GetUiMapID",
    params = { { name = "mapID", type = "number", default = nil } },
    returns = { { name = "mapID", type = "number", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["GetUnboundedStringWidth"] = {
    key = "GetUnboundedStringWidth",
    name = "GetUnboundedStringWidth",
    category = "general",
    subcategory = "global",
    func = _G["GetUnboundedStringWidth"],
    funcPath = "GetUnboundedStringWidth",
    params = { { name = "width", type = "uiUnit", default = nil } },
    returns = { { name = "width", type = "uiUnit", canBeSecret = false } },
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
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
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
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
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
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
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
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
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
    params = { { name = "file", type = "fileID", default = nil } },
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
    params = { { name = "file", type = "fileID", default = nil } },
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
    params = { { name = "file", type = "fileID", default = nil } },
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

APIDefs["GetUseAuraDisplayTime"] = {
    key = "GetUseAuraDisplayTime",
    name = "GetUseAuraDisplayTime",
    category = "general",
    subcategory = "global",
    func = _G["GetUseAuraDisplayTime"],
    funcPath = "GetUseAuraDisplayTime",
    params = { { name = "useAuraDisplayTime", type = "bool", default = nil } },
    returns = { { name = "useAuraDisplayTime", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["GetUseTransmogChoices"] = {
    key = "GetUseTransmogChoices",
    name = "GetUseTransmogChoices",
    category = "general",
    subcategory = "global",
    func = _G["GetUseTransmogChoices"],
    funcPath = "GetUseTransmogChoices",
    params = { { name = "use", type = "bool", default = nil } },
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
    params = { { name = "use", type = "bool", default = nil } },
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
    params = { { name = "value", type = "number", default = nil } },
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
    params = { { name = "valueStep", type = "number", default = nil } },
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

APIDefs["GetVertTile"] = {
    key = "GetVertTile",
    name = "GetVertTile",
    category = "general",
    subcategory = "global",
    func = _G["GetVertTile"],
    funcPath = "GetVertTile",
    params = { { name = "tiling", type = "bool", default = nil } },
    returns = { { name = "tiling", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["GetVertexColor"] = {
    key = "GetVertexColor",
    name = "GetVertexColor",
    category = "general",
    subcategory = "global",
    func = _G["GetVertexColor"],
    funcPath = "GetVertexColor",
    params = { { name = "colorR", type = "number", default = nil }, { name = "colorG", type = "number", default = nil }, { name = "colorB", type = "number", default = nil }, { name = "colorA", type = "number", default = nil } },
    returns = { { name = "colorR", type = "number", canBeSecret = false }, { name = "colorG", type = "number", canBeSecret = false }, { name = "colorB", type = "number", canBeSecret = false }, { name = "colorA", type = "number", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["GetVertexOffset"] = {
    key = "GetVertexOffset",
    name = "GetVertexOffset",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["GetVertexOffset"],
    funcPath = "GetVertexOffset",
    params = { { name = "vertexIndex", type = "luaIndex", default = nil } },
    returns = { { name = "offsetX", type = "uiUnit", canBeSecret = false }, { name = "offsetY", type = "uiUnit", canBeSecret = false } },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["GetVerticalScroll"] = {
    key = "GetVerticalScroll",
    name = "GetVerticalScroll",
    category = "general",
    subcategory = "global",
    func = _G["GetVerticalScroll"],
    funcPath = "GetVerticalScroll",
    params = { { name = "offset", type = "uiUnit", default = nil } },
    returns = { { name = "offset", type = "uiUnit", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["GetVerticalScrollRange"] = {
    key = "GetVerticalScrollRange",
    name = "GetVerticalScrollRange",
    category = "general",
    subcategory = "global",
    func = _G["GetVerticalScrollRange"],
    funcPath = "GetVerticalScrollRange",
    params = { { name = "range", type = "uiUnit", default = nil } },
    returns = { { name = "range", type = "uiUnit", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["GetViewInsets"] = {
    key = "GetViewInsets",
    name = "GetViewInsets",
    category = "general",
    subcategory = "global",
    func = _G["GetViewInsets"],
    funcPath = "GetViewInsets",
    params = { { name = "left", type = "uiUnit", default = nil }, { name = "right", type = "uiUnit", default = nil }, { name = "top", type = "uiUnit", default = nil }, { name = "bottom", type = "uiUnit", default = nil } },
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
    params = { { name = "x", type = "uiUnit", default = nil }, { name = "y", type = "uiUnit", default = nil } },
    returns = { { name = "x", type = "uiUnit", canBeSecret = false }, { name = "y", type = "uiUnit", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["GetVisibleTextByteLimit"] = {
    key = "GetVisibleTextByteLimit",
    name = "GetVisibleTextByteLimit",
    category = "general",
    subcategory = "global",
    func = _G["GetVisibleTextByteLimit"],
    funcPath = "GetVisibleTextByteLimit",
    params = { { name = "maxVisibleBytes", type = "number", default = nil } },
    returns = { { name = "maxVisibleBytes", type = "number", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["GetWidth"] = {
    key = "GetWidth",
    name = "GetWidth",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["GetWidth"],
    funcPath = "GetWidth",
    params = { { name = "ignoreRect", type = "bool", default = false } },
    returns = { { name = "width", type = "uiUnit", canBeSecret = false } },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["GetWindow"] = {
    key = "GetWindow",
    name = "GetWindow",
    category = "general",
    subcategory = "global",
    func = _G["GetWindow"],
    funcPath = "GetWindow",
    params = { { name = "window", type = "SimpleWindow", default = nil } },
    returns = { { name = "window", type = "SimpleWindow", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["GetWorldScale"] = {
    key = "GetWorldScale",
    name = "GetWorldScale",
    category = "general",
    subcategory = "global",
    func = _G["GetWorldScale"],
    funcPath = "GetWorldScale",
    params = { { name = "worldScale", type = "number", default = nil } },
    returns = { { name = "worldScale", type = "number", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["GetWrappedWidth"] = {
    key = "GetWrappedWidth",
    name = "GetWrappedWidth",
    category = "general",
    subcategory = "global",
    func = _G["GetWrappedWidth"],
    funcPath = "GetWrappedWidth",
    params = { { name = "width", type = "uiUnit", default = nil } },
    returns = { { name = "width", type = "uiUnit", canBeSecret = false } },
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
    params = { { name = "yaw", type = "number", default = nil } },
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
    params = { { name = "zoomFactor", type = "number", default = nil } },
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
    params = { { name = "zoomLevels", type = "number", default = nil } },
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

APIDefs["HasAlphaGradient"] = {
    key = "HasAlphaGradient",
    name = "HasAlphaGradient",
    category = "general",
    subcategory = "global",
    func = _G["HasAlphaGradient"],
    funcPath = "HasAlphaGradient",
    params = { { name = "hasAlphaGradient", type = "bool", default = nil } },
    returns = { { name = "hasAlphaGradient", type = "bool", canBeSecret = false } },
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

APIDefs["HasAnySecretAspect"] = {
    key = "HasAnySecretAspect",
    name = "HasAnySecretAspect",
    category = "general",
    subcategory = "global",
    func = _G["HasAnySecretAspect"],
    funcPath = "HasAnySecretAspect",
    params = { { name = "hasSecretAspect", type = "bool", default = nil } },
    returns = { { name = "hasSecretAspect", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["HasAttachedFixture"] = {
    key = "HasAttachedFixture",
    name = "HasAttachedFixture",
    category = "general",
    subcategory = "global",
    func = _G["HasAttachedFixture"],
    funcPath = "HasAttachedFixture",
    params = { { name = "hasAttachedFixture", type = "bool", default = nil } },
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
    params = { { name = "hasAttachmentPoints", type = "bool", default = nil } },
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
    params = { { name = "hasCustomCamera", type = "bool", default = nil } },
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

APIDefs["HasFixedFrameLevel"] = {
    key = "HasFixedFrameLevel",
    name = "HasFixedFrameLevel",
    category = "general",
    subcategory = "global",
    func = _G["HasFixedFrameLevel"],
    funcPath = "HasFixedFrameLevel",
    params = { { name = "isFixed", type = "bool", default = nil } },
    returns = { { name = "isFixed", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["HasFixedFrameStrata"] = {
    key = "HasFixedFrameStrata",
    name = "HasFixedFrameStrata",
    category = "general",
    subcategory = "global",
    func = _G["HasFixedFrameStrata"],
    funcPath = "HasFixedFrameStrata",
    params = { { name = "isFixed", type = "bool", default = nil } },
    returns = { { name = "isFixed", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["HasFocus"] = {
    key = "HasFocus",
    name = "HasFocus",
    category = "general",
    subcategory = "global",
    func = _G["HasFocus"],
    funcPath = "HasFocus",
    params = { { name = "hasFocus", type = "bool", default = nil } },
    returns = { { name = "hasFocus", type = "bool", canBeSecret = false } },
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

APIDefs["HasSecretAspect"] = {
    key = "HasSecretAspect",
    name = "HasSecretAspect",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["HasSecretAspect"],
    funcPath = "HasSecretAspect",
    params = { { name = "aspect", type = "SecretAspect", default = nil } },
    returns = { { name = "hasSecretAspect", type = "bool", canBeSecret = false } },
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
    params = { { name = "hasSecretValues", type = "bool", default = nil } },
    returns = { { name = "hasSecretValues", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["HasText"] = {
    key = "HasText",
    name = "HasText",
    category = "general",
    subcategory = "global",
    func = _G["HasText"],
    funcPath = "HasText",
    params = { { name = "hasText", type = "bool", default = nil } },
    returns = { { name = "hasText", type = "bool", canBeSecret = false } },
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

APIDefs["HighlightText"] = {
    key = "HighlightText",
    name = "HighlightText",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["HighlightText"],
    funcPath = "HighlightText",
    params = { { name = "start", type = "number", default = 0 }, { name = "stop", type = "number", default = nil } },
    returns = {  },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
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

APIDefs["Insert"] = {
    key = "Insert",
    name = "Insert",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["Insert"],
    funcPath = "Insert",
    params = { { name = "text", type = "cstring", default = nil } },
    returns = {  },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["InterceptStartDrag"] = {
    key = "InterceptStartDrag",
    name = "InterceptStartDrag",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["InterceptStartDrag"],
    funcPath = "InterceptStartDrag",
    params = { { name = "delegate", type = "SimpleFrame", default = nil } },
    returns = { { name = "success", type = "bool", canBeSecret = false } },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["Intersects"] = {
    key = "Intersects",
    name = "Intersects",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["Intersects"],
    funcPath = "Intersects",
    params = { { name = "region", type = "ScriptRegion", default = nil } },
    returns = { { name = "intersects", type = "bool", canBeSecret = false } },
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
    params = { { name = "isActive", type = "bool", default = nil } },
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
    params = { { name = "isActive", type = "bool", default = nil } },
    returns = { { name = "isActive", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["IsAlphabeticOnly"] = {
    key = "IsAlphabeticOnly",
    name = "IsAlphabeticOnly",
    category = "general",
    subcategory = "global",
    func = _G["IsAlphabeticOnly"],
    funcPath = "IsAlphabeticOnly",
    params = { { name = "enabled", type = "bool", default = nil } },
    returns = { { name = "enabled", type = "bool", canBeSecret = false } },
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

APIDefs["IsAnchoringRestricted"] = {
    key = "IsAnchoringRestricted",
    name = "IsAnchoringRestricted",
    category = "general",
    subcategory = "global",
    func = _G["IsAnchoringRestricted"],
    funcPath = "IsAnchoringRestricted",
    params = { { name = "isRestricted", type = "bool", default = nil } },
    returns = { { name = "isRestricted", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["IsAnchoringSecret"] = {
    key = "IsAnchoringSecret",
    name = "IsAnchoringSecret",
    category = "general",
    subcategory = "global",
    func = _G["IsAnchoringSecret"],
    funcPath = "IsAnchoringSecret",
    params = { { name = "isSecret", type = "bool", default = nil } },
    returns = { { name = "isSecret", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["IsAnyPartOfRoomSelected"] = {
    key = "IsAnyPartOfRoomSelected",
    name = "IsAnyPartOfRoomSelected",
    category = "general",
    subcategory = "global",
    func = _G["IsAnyPartOfRoomSelected"],
    funcPath = "IsAnyPartOfRoomSelected",
    params = { { name = "isSelected", type = "bool", default = nil } },
    returns = { { name = "isSelected", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["IsAutoFocus"] = {
    key = "IsAutoFocus",
    name = "IsAutoFocus",
    category = "general",
    subcategory = "global",
    func = _G["IsAutoFocus"],
    funcPath = "IsAutoFocus",
    params = { { name = "autoFocus", type = "bool", default = nil } },
    returns = { { name = "autoFocus", type = "bool", canBeSecret = false } },
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

APIDefs["IsBlockingLoadRequested"] = {
    key = "IsBlockingLoadRequested",
    name = "IsBlockingLoadRequested",
    category = "general",
    subcategory = "global",
    func = _G["IsBlockingLoadRequested"],
    funcPath = "IsBlockingLoadRequested",
    params = { { name = "blocking", type = "bool", default = nil } },
    returns = { { name = "blocking", type = "bool", canBeSecret = false } },
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

APIDefs["IsClampedToScreen"] = {
    key = "IsClampedToScreen",
    name = "IsClampedToScreen",
    category = "general",
    subcategory = "global",
    func = _G["IsClampedToScreen"],
    funcPath = "IsClampedToScreen",
    params = { { name = "clampedToScreen", type = "bool", default = nil } },
    returns = { { name = "clampedToScreen", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["IsCollapsed"] = {
    key = "IsCollapsed",
    name = "IsCollapsed",
    category = "general",
    subcategory = "global",
    func = _G["IsCollapsed"],
    funcPath = "IsCollapsed",
    params = { { name = "isCollapsed", type = "bool", default = nil } },
    returns = { { name = "isCollapsed", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["IsCollectedActive"] = {
    key = "IsCollectedActive",
    name = "IsCollectedActive",
    category = "general",
    subcategory = "global",
    func = _G["IsCollectedActive"],
    funcPath = "IsCollectedActive",
    params = { { name = "isActive", type = "bool", default = nil } },
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

APIDefs["IsCountInvisibleLetters"] = {
    key = "IsCountInvisibleLetters",
    name = "IsCountInvisibleLetters",
    category = "general",
    subcategory = "global",
    func = _G["IsCountInvisibleLetters"],
    funcPath = "IsCountInvisibleLetters",
    params = { { name = "countInvisibleLetters", type = "bool", default = nil } },
    returns = { { name = "countInvisibleLetters", type = "bool", canBeSecret = false } },
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
    params = { { name = "isActive", type = "bool", default = nil } },
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
    params = { { name = "isDelaying", type = "bool", default = nil } },
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

APIDefs["IsDesaturated"] = {
    key = "IsDesaturated",
    name = "IsDesaturated",
    category = "general",
    subcategory = "global",
    func = _G["IsDesaturated"],
    funcPath = "IsDesaturated",
    params = { { name = "desaturated", type = "bool", default = nil } },
    returns = { { name = "desaturated", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["IsDone"] = {
    key = "IsDone",
    name = "IsDone",
    category = "general",
    subcategory = "global",
    func = _G["IsDone"],
    funcPath = "IsDone",
    params = { { name = "isDone", type = "bool", default = nil } },
    returns = { { name = "isDone", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["IsDragging"] = {
    key = "IsDragging",
    name = "IsDragging",
    category = "general",
    subcategory = "global",
    func = _G["IsDragging"],
    funcPath = "IsDragging",
    params = { { name = "isDragging", type = "bool", default = nil } },
    returns = { { name = "isDragging", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["IsDraggingThumb"] = {
    key = "IsDraggingThumb",
    name = "IsDraggingThumb",
    category = "general",
    subcategory = "global",
    func = _G["IsDraggingThumb"],
    funcPath = "IsDraggingThumb",
    params = { { name = "isDraggingThumb", type = "bool", default = nil } },
    returns = { { name = "isDraggingThumb", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["IsDrawLayerEnabled"] = {
    key = "IsDrawLayerEnabled",
    name = "IsDrawLayerEnabled",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["IsDrawLayerEnabled"],
    funcPath = "IsDrawLayerEnabled",
    params = { { name = "layer", type = "DrawLayer", default = nil } },
    returns = { { name = "isEnabled", type = "bool", canBeSecret = false } },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
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
    params = { { name = "enabled", type = "bool", default = nil } },
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

APIDefs["IsEventRegistered"] = {
    key = "IsEventRegistered",
    name = "IsEventRegistered",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["IsEventRegistered"],
    funcPath = "IsEventRegistered",
    params = { { name = "eventName", type = "cstring", default = nil } },
    returns = { { name = "isRegistered", type = "bool", canBeSecret = false }, { name = "units", type = "string", canBeSecret = false } },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
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
    params = { { name = "isActive", type = "bool", default = nil } },
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

APIDefs["IsForbidden"] = {
    key = "IsForbidden",
    name = "IsForbidden",
    category = "general",
    subcategory = "global",
    func = _G["IsForbidden"],
    funcPath = "IsForbidden",
    params = { { name = "isForbidden", type = "bool", default = nil } },
    returns = { { name = "isForbidden", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["IsFrameBuffer"] = {
    key = "IsFrameBuffer",
    name = "IsFrameBuffer",
    category = "general",
    subcategory = "global",
    func = _G["IsFrameBuffer"],
    funcPath = "IsFrameBuffer",
    params = { { name = "isFrameBuffer", type = "bool", default = nil } },
    returns = { { name = "isFrameBuffer", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["IsGamePadButtonEnabled"] = {
    key = "IsGamePadButtonEnabled",
    name = "IsGamePadButtonEnabled",
    category = "general",
    subcategory = "global",
    func = _G["IsGamePadButtonEnabled"],
    funcPath = "IsGamePadButtonEnabled",
    params = { { name = "enabled", type = "bool", default = nil } },
    returns = { { name = "enabled", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["IsGamePadStickEnabled"] = {
    key = "IsGamePadStickEnabled",
    name = "IsGamePadStickEnabled",
    category = "general",
    subcategory = "global",
    func = _G["IsGamePadStickEnabled"],
    funcPath = "IsGamePadStickEnabled",
    params = { { name = "enabled", type = "bool", default = nil } },
    returns = { { name = "enabled", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["IsGeoReady"] = {
    key = "IsGeoReady",
    name = "IsGeoReady",
    category = "general",
    subcategory = "global",
    func = _G["IsGeoReady"],
    funcPath = "IsGeoReady",
    params = { { name = "isReady", type = "bool", default = nil } },
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
    params = { { name = "isGuildTabard", type = "bool", default = nil } },
    returns = { { name = "isGuildTabard", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["IsHighlightLocked"] = {
    key = "IsHighlightLocked",
    name = "IsHighlightLocked",
    category = "general",
    subcategory = "global",
    func = _G["IsHighlightLocked"],
    funcPath = "IsHighlightLocked",
    params = { { name = "locked", type = "bool", default = nil } },
    returns = { { name = "locked", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["IsIgnoringChildrenForBounds"] = {
    key = "IsIgnoringChildrenForBounds",
    name = "IsIgnoringChildrenForBounds",
    category = "general",
    subcategory = "global",
    func = _G["IsIgnoringChildrenForBounds"],
    funcPath = "IsIgnoringChildrenForBounds",
    params = { { name = "ignore", type = "bool", default = nil } },
    returns = { { name = "ignore", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["IsIgnoringParentAlpha"] = {
    key = "IsIgnoringParentAlpha",
    name = "IsIgnoringParentAlpha",
    category = "general",
    subcategory = "global",
    func = _G["IsIgnoringParentAlpha"],
    funcPath = "IsIgnoringParentAlpha",
    params = { { name = "isIgnoring", type = "bool", default = nil } },
    returns = { { name = "isIgnoring", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["IsIgnoringParentScale"] = {
    key = "IsIgnoringParentScale",
    name = "IsIgnoringParentScale",
    category = "general",
    subcategory = "global",
    func = _G["IsIgnoringParentScale"],
    funcPath = "IsIgnoringParentScale",
    params = { { name = "isIgnoring", type = "bool", default = nil } },
    returns = { { name = "isIgnoring", type = "bool", canBeSecret = false } },
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

APIDefs["IsInIMECompositionMode"] = {
    key = "IsInIMECompositionMode",
    name = "IsInIMECompositionMode",
    category = "general",
    subcategory = "global",
    func = _G["IsInIMECompositionMode"],
    funcPath = "IsInIMECompositionMode",
    params = { { name = "isInIMECompositionMode", type = "bool", default = nil } },
    returns = { { name = "isInIMECompositionMode", type = "bool", canBeSecret = false } },
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

APIDefs["IsInterpolating"] = {
    key = "IsInterpolating",
    name = "IsInterpolating",
    category = "general",
    subcategory = "global",
    func = _G["IsInterpolating"],
    funcPath = "IsInterpolating",
    params = { { name = "isInterpolating", type = "bool", default = nil } },
    returns = { { name = "isInterpolating", type = "bool", canBeSecret = false } },
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

APIDefs["IsKeyboardEnabled"] = {
    key = "IsKeyboardEnabled",
    name = "IsKeyboardEnabled",
    category = "general",
    subcategory = "global",
    func = _G["IsKeyboardEnabled"],
    funcPath = "IsKeyboardEnabled",
    params = { { name = "enabled", type = "bool", default = nil } },
    returns = { { name = "enabled", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
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
    params = { { name = "isVisible", type = "bool", default = nil } },
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
    params = { { name = "isLoaded", type = "bool", default = nil } },
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

APIDefs["IsMouseClickEnabled"] = {
    key = "IsMouseClickEnabled",
    name = "IsMouseClickEnabled",
    category = "general",
    subcategory = "global",
    func = _G["IsMouseClickEnabled"],
    funcPath = "IsMouseClickEnabled",
    params = { { name = "enabled", type = "bool", default = nil } },
    returns = { { name = "enabled", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["IsMouseEnabled"] = {
    key = "IsMouseEnabled",
    name = "IsMouseEnabled",
    category = "general",
    subcategory = "global",
    func = _G["IsMouseEnabled"],
    funcPath = "IsMouseEnabled",
    params = { { name = "enabled", type = "bool", default = nil } },
    returns = { { name = "enabled", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["IsMouseMotionEnabled"] = {
    key = "IsMouseMotionEnabled",
    name = "IsMouseMotionEnabled",
    category = "general",
    subcategory = "global",
    func = _G["IsMouseMotionEnabled"],
    funcPath = "IsMouseMotionEnabled",
    params = { { name = "enabled", type = "bool", default = nil } },
    returns = { { name = "enabled", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["IsMouseMotionFocus"] = {
    key = "IsMouseMotionFocus",
    name = "IsMouseMotionFocus",
    category = "general",
    subcategory = "global",
    func = _G["IsMouseMotionFocus"],
    funcPath = "IsMouseMotionFocus",
    params = { { name = "isMouseMotionFocus", type = "bool", default = nil } },
    returns = { { name = "isMouseMotionFocus", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["IsMouseOver"] = {
    key = "IsMouseOver",
    name = "IsMouseOver",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["IsMouseOver"],
    funcPath = "IsMouseOver",
    params = { { name = "offsetTop", type = "uiUnit", default = 0 }, { name = "offsetBottom", type = "uiUnit", default = 0 }, { name = "offsetLeft", type = "uiUnit", default = 0 }, { name = "offsetRight", type = "uiUnit", default = 0 } },
    returns = { { name = "isMouseOver", type = "bool", canBeSecret = false } },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["IsMouseWheelEnabled"] = {
    key = "IsMouseWheelEnabled",
    name = "IsMouseWheelEnabled",
    category = "general",
    subcategory = "global",
    func = _G["IsMouseWheelEnabled"],
    funcPath = "IsMouseWheelEnabled",
    params = { { name = "enabled", type = "bool", default = nil } },
    returns = { { name = "enabled", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["IsMovable"] = {
    key = "IsMovable",
    name = "IsMovable",
    category = "general",
    subcategory = "global",
    func = _G["IsMovable"],
    funcPath = "IsMovable",
    params = { { name = "isMovable", type = "bool", default = nil } },
    returns = { { name = "isMovable", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
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

APIDefs["IsMultiLine"] = {
    key = "IsMultiLine",
    name = "IsMultiLine",
    category = "general",
    subcategory = "global",
    func = _G["IsMultiLine"],
    funcPath = "IsMultiLine",
    params = { { name = "multiline", type = "bool", default = nil } },
    returns = { { name = "multiline", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["IsNumeric"] = {
    key = "IsNumeric",
    name = "IsNumeric",
    category = "general",
    subcategory = "global",
    func = _G["IsNumeric"],
    funcPath = "IsNumeric",
    params = { { name = "isNumeric", type = "bool", default = nil } },
    returns = { { name = "isNumeric", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["IsNumericFullRange"] = {
    key = "IsNumericFullRange",
    name = "IsNumericFullRange",
    category = "general",
    subcategory = "global",
    func = _G["IsNumericFullRange"],
    funcPath = "IsNumericFullRange",
    params = { { name = "isNumeric", type = "bool", default = nil } },
    returns = { { name = "isNumeric", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["IsObjectLoaded"] = {
    key = "IsObjectLoaded",
    name = "IsObjectLoaded",
    category = "general",
    subcategory = "global",
    func = _G["IsObjectLoaded"],
    funcPath = "IsObjectLoaded",
    params = { { name = "isLoaded", type = "bool", default = nil } },
    returns = { { name = "isLoaded", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["IsObjectType"] = {
    key = "IsObjectType",
    name = "IsObjectType",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["IsObjectType"],
    funcPath = "IsObjectType",
    params = { { name = "objectType", type = "cstring", default = nil } },
    returns = { { name = "isType", type = "bool", canBeSecret = false } },
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
    params = { { name = "isOccupied", type = "bool", default = nil } },
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
    params = { { name = "isActive", type = "bool", default = nil } },
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

APIDefs["IsPassword"] = {
    key = "IsPassword",
    name = "IsPassword",
    category = "general",
    subcategory = "global",
    func = _G["IsPassword"],
    funcPath = "IsPassword",
    params = { { name = "isPassword", type = "bool", default = nil } },
    returns = { { name = "isPassword", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["IsPaused"] = {
    key = "IsPaused",
    name = "IsPaused",
    category = "general",
    subcategory = "global",
    func = _G["IsPaused"],
    funcPath = "IsPaused",
    params = { { name = "isPaused", type = "bool", default = nil } },
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
    params = { { name = "isPendingFinish", type = "bool", default = nil } },
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
    params = { { name = "isPlaying", type = "bool", default = nil } },
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
    params = { { name = "preferringCollisionBounds", type = "bool", default = nil } },
    returns = { { name = "preferringCollisionBounds", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["IsPreventingSecretValues"] = {
    key = "IsPreventingSecretValues",
    name = "IsPreventingSecretValues",
    category = "general",
    subcategory = "global",
    func = _G["IsPreventingSecretValues"],
    funcPath = "IsPreventingSecretValues",
    params = { { name = "isPreventingSecretValues", type = "bool", default = nil } },
    returns = { { name = "isPreventingSecretValues", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["IsProtected"] = {
    key = "IsProtected",
    name = "IsProtected",
    category = "general",
    subcategory = "global",
    func = _G["IsProtected"],
    funcPath = "IsProtected",
    params = { { name = "isProtected", type = "bool", default = nil }, { name = "isProtectedExplicitly", type = "bool", default = nil } },
    returns = { { name = "isProtected", type = "bool", canBeSecret = false }, { name = "isProtectedExplicitly", type = "bool", canBeSecret = false } },
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

APIDefs["IsRectValid"] = {
    key = "IsRectValid",
    name = "IsRectValid",
    category = "general",
    subcategory = "global",
    func = _G["IsRectValid"],
    funcPath = "IsRectValid",
    params = { { name = "isValid", type = "bool", default = nil } },
    returns = { { name = "isValid", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["IsResizable"] = {
    key = "IsResizable",
    name = "IsResizable",
    category = "general",
    subcategory = "global",
    func = _G["IsResizable"],
    funcPath = "IsResizable",
    params = { { name = "resizable", type = "bool", default = nil } },
    returns = { { name = "resizable", type = "bool", canBeSecret = false } },
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
    params = { { name = "isReverse", type = "bool", default = nil } },
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
    params = { { name = "isSearchInProgress", type = "bool", default = nil } },
    returns = { { name = "isSearchInProgress", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["IsSecureText"] = {
    key = "IsSecureText",
    name = "IsSecureText",
    category = "general",
    subcategory = "global",
    func = _G["IsSecureText"],
    funcPath = "IsSecureText",
    params = { { name = "isSecure", type = "bool", default = nil } },
    returns = { { name = "isSecure", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["IsSelected"] = {
    key = "IsSelected",
    name = "IsSelected",
    category = "general",
    subcategory = "global",
    func = _G["IsSelected"],
    funcPath = "IsSelected",
    params = { { name = "isSelected", type = "bool", default = nil } },
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
    params = { { name = "isSetToFinalAlpha", type = "bool", default = nil } },
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
    params = { { name = "isShown", type = "bool", default = nil } },
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

APIDefs["IsSnappingToPixelGrid"] = {
    key = "IsSnappingToPixelGrid",
    name = "IsSnappingToPixelGrid",
    category = "general",
    subcategory = "global",
    func = _G["IsSnappingToPixelGrid"],
    funcPath = "IsSnappingToPixelGrid",
    params = { { name = "snap", type = "bool", default = nil } },
    returns = { { name = "snap", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
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

APIDefs["IsStatusBarDesaturated"] = {
    key = "IsStatusBarDesaturated",
    name = "IsStatusBarDesaturated",
    category = "general",
    subcategory = "global",
    func = _G["IsStatusBarDesaturated"],
    funcPath = "IsStatusBarDesaturated",
    params = { { name = "desaturated", type = "bool", default = nil } },
    returns = { { name = "desaturated", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
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
    params = { { name = "isStopped", type = "bool", default = nil } },
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

APIDefs["IsToplevel"] = {
    key = "IsToplevel",
    name = "IsToplevel",
    category = "general",
    subcategory = "global",
    func = _G["IsToplevel"],
    funcPath = "IsToplevel",
    params = { { name = "isTopLevel", type = "bool", default = nil } },
    returns = { { name = "isTopLevel", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
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

APIDefs["IsTruncated"] = {
    key = "IsTruncated",
    name = "IsTruncated",
    category = "general",
    subcategory = "global",
    func = _G["IsTruncated"],
    funcPath = "IsTruncated",
    params = { { name = "isTruncated", type = "bool", default = nil } },
    returns = { { name = "isTruncated", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["IsUncollectedActive"] = {
    key = "IsUncollectedActive",
    name = "IsUncollectedActive",
    category = "general",
    subcategory = "global",
    func = _G["IsUncollectedActive"],
    funcPath = "IsUncollectedActive",
    params = { { name = "isActive", type = "bool", default = nil } },
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

APIDefs["IsUserPlaced"] = {
    key = "IsUserPlaced",
    name = "IsUserPlaced",
    category = "general",
    subcategory = "global",
    func = _G["IsUserPlaced"],
    funcPath = "IsUserPlaced",
    params = { { name = "isUserPlaced", type = "bool", default = nil } },
    returns = { { name = "isUserPlaced", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["IsUsingCenterForOrigin"] = {
    key = "IsUsingCenterForOrigin",
    name = "IsUsingCenterForOrigin",
    category = "general",
    subcategory = "global",
    func = _G["IsUsingCenterForOrigin"],
    funcPath = "IsUsingCenterForOrigin",
    params = { { name = "x", type = "bool", default = nil }, { name = "y", type = "bool", default = nil }, { name = "z", type = "bool", default = nil } },
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
    params = { { name = "useCenter", type = "bool", default = nil } },
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

APIDefs["IsUsingParentLevel"] = {
    key = "IsUsingParentLevel",
    name = "IsUsingParentLevel",
    category = "general",
    subcategory = "global",
    func = _G["IsUsingParentLevel"],
    funcPath = "IsUsingParentLevel",
    params = { { name = "usingParentLevel", type = "bool", default = nil } },
    returns = { { name = "usingParentLevel", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["IsValid"] = {
    key = "IsValid",
    name = "IsValid",
    category = "general",
    subcategory = "global",
    func = _G["IsValid"],
    funcPath = "IsValid",
    params = { { name = "isValid", type = "bool", default = nil } },
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
    params = { { name = "isValid", type = "bool", default = nil } },
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
    params = { { name = "isVisible", type = "bool", default = nil } },
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
    params = { { name = "isZero", type = "bool", default = nil } },
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

APIDefs["LockHighlight"] = {
    key = "LockHighlight",
    name = "LockHighlight",
    category = "general",
    subcategory = "global",
    func = _G["LockHighlight"],
    funcPath = "LockHighlight",
    params = {  },
    returns = {  },
    midnightImpact = "NORMAL",
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

APIDefs["Lower"] = {
    key = "Lower",
    name = "Lower",
    category = "general",
    subcategory = "global",
    func = _G["Lower"],
    funcPath = "Lower",
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

APIDefs["OnColorsUpdated"] = {
    key = "OnColorsUpdated",
    name = "OnColorsUpdated",
    category = "general",
    subcategory = "global",
    func = _G["OnColorsUpdated"],
    funcPath = "OnColorsUpdated",
    params = {  },
    returns = {  },
    midnightImpact = "NORMAL",
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

APIDefs["Raise"] = {
    key = "Raise",
    name = "Raise",
    category = "general",
    subcategory = "global",
    func = _G["Raise"],
    funcPath = "Raise",
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

APIDefs["RegisterAllEvents"] = {
    key = "RegisterAllEvents",
    name = "RegisterAllEvents",
    category = "general",
    subcategory = "global",
    func = _G["RegisterAllEvents"],
    funcPath = "RegisterAllEvents",
    params = {  },
    returns = {  },
    midnightImpact = "NORMAL",
}

APIDefs["RegisterEvent"] = {
    key = "RegisterEvent",
    name = "RegisterEvent",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["RegisterEvent"],
    funcPath = "RegisterEvent",
    params = { { name = "eventName", type = "cstring", default = nil } },
    returns = { { name = "registered", type = "bool", canBeSecret = false } },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["RegisterEventCallback"] = {
    key = "RegisterEventCallback",
    name = "RegisterEventCallback",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["RegisterEventCallback"],
    funcPath = "RegisterEventCallback",
    params = { { name = "eventName", type = "cstring", default = nil }, { name = "cb", type = "FrameEventCallbackType", default = nil } },
    returns = { { name = "registered", type = "bool", canBeSecret = false } },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["RegisterForClicks"] = {
    key = "RegisterForClicks",
    name = "RegisterForClicks",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["RegisterForClicks"],
    funcPath = "RegisterForClicks",
    params = { { name = "buttons", type = "ClickButton", default = nil } },
    returns = {  },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=NotAllowed",
}

APIDefs["RegisterForDrag"] = {
    key = "RegisterForDrag",
    name = "RegisterForDrag",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["RegisterForDrag"],
    funcPath = "RegisterForDrag",
    params = { { name = "buttons", type = "MouseButton", default = nil } },
    returns = {  },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["RegisterForMouse"] = {
    key = "RegisterForMouse",
    name = "RegisterForMouse",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["RegisterForMouse"],
    funcPath = "RegisterForMouse",
    params = { { name = "buttons", type = "ClickButton", default = nil } },
    returns = {  },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=NotAllowed",
}

APIDefs["RegisterUnitEvent"] = {
    key = "RegisterUnitEvent",
    name = "RegisterUnitEvent",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["RegisterUnitEvent"],
    funcPath = "RegisterUnitEvent",
    params = { { name = "eventName", type = "cstring", default = nil }, { name = "units", type = "string", default = nil } },
    returns = { { name = "registered", type = "bool", canBeSecret = false } },
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
    params = { { name = "eventName", type = "cstring", default = nil }, { name = "cb", type = "FrameEventCallbackType", default = nil }, { name = "units", type = "string", default = nil } },
    returns = { { name = "registered", type = "bool", canBeSecret = false } },
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
    params = { { name = "success", type = "bool", default = nil } },
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

APIDefs["ResetInputMode"] = {
    key = "ResetInputMode",
    name = "ResetInputMode",
    category = "general",
    subcategory = "global",
    func = _G["ResetInputMode"],
    funcPath = "ResetInputMode",
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

APIDefs["ResetTexCoord"] = {
    key = "ResetTexCoord",
    name = "ResetTexCoord",
    category = "general",
    subcategory = "global",
    func = _G["ResetTexCoord"],
    funcPath = "ResetTexCoord",
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

APIDefs["Resume"] = {
    key = "Resume",
    name = "Resume",
    category = "general",
    subcategory = "global",
    func = _G["Resume"],
    funcPath = "Resume",
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

APIDefs["RotateTextures"] = {
    key = "RotateTextures",
    name = "RotateTextures",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["RotateTextures"],
    funcPath = "RotateTextures",
    params = { { name = "radians", type = "number", default = nil }, { name = "x", type = "number", default = nil }, { name = "y", type = "number", default = nil } },
    returns = {  },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
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
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenTainted",
}

APIDefs["SetAlphaFromBoolean"] = {
    key = "SetAlphaFromBoolean",
    name = "SetAlphaFromBoolean",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["SetAlphaFromBoolean"],
    funcPath = "SetAlphaFromBoolean",
    params = { { name = "value", type = "bool", default = nil }, { name = "alphaIfTrue", type = "SingleColorValue", default = 255 }, { name = "alphaIfFalse", type = "SingleColorValue", default = 0 } },
    returns = {  },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenTainted",
}

APIDefs["SetAlphaGradient"] = {
    key = "SetAlphaGradient",
    name = "SetAlphaGradient",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["SetAlphaGradient"],
    funcPath = "SetAlphaGradient",
    params = { { name = "index", type = "number", default = nil }, { name = "gradient", type = "vector2", default = nil } },
    returns = {  },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["SetAlphabeticOnly"] = {
    key = "SetAlphabeticOnly",
    name = "SetAlphabeticOnly",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["SetAlphabeticOnly"],
    funcPath = "SetAlphabeticOnly",
    params = { { name = "enabled", type = "bool", default = false } },
    returns = {  },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["SetAltArrowKeyMode"] = {
    key = "SetAltArrowKeyMode",
    name = "SetAltArrowKeyMode",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["SetAltArrowKeyMode"],
    funcPath = "SetAltArrowKeyMode",
    params = { { name = "altMode", type = "bool", default = false } },
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

APIDefs["SetAtlas"] = {
    key = "SetAtlas",
    name = "SetAtlas",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["SetAtlas"],
    funcPath = "SetAtlas",
    params = { { name = "atlas", type = "textureAtlas", default = nil }, { name = "useAtlasSize", type = "bool", default = false }, { name = "filterMode", type = "FilterMode", default = nil }, { name = "resetTexCoords", type = "bool", default = nil }, { name = "wrapModeHorizontal", type = "cstring", default = nil }, { name = "wrapModeVertical", type = "cstring", default = nil } },
    returns = {  },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenTainted",
}

APIDefs["SetAttribute"] = {
    key = "SetAttribute",
    name = "SetAttribute",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["SetAttribute"],
    funcPath = "SetAttribute",
    params = { { name = "attributeName", type = "cstring", default = nil }, { name = "value", type = "cstring", default = nil } },
    returns = {  },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["SetAttributeNoHandler"] = {
    key = "SetAttributeNoHandler",
    name = "SetAttributeNoHandler",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["SetAttributeNoHandler"],
    funcPath = "SetAttributeNoHandler",
    params = { { name = "attributeName", type = "cstring", default = nil }, { name = "value", type = "cstring", default = nil } },
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

APIDefs["SetAutoFocus"] = {
    key = "SetAutoFocus",
    name = "SetAutoFocus",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["SetAutoFocus"],
    funcPath = "SetAutoFocus",
    params = { { name = "autoFocus", type = "bool", default = false } },
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

APIDefs["SetBlendMode"] = {
    key = "SetBlendMode",
    name = "SetBlendMode",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["SetBlendMode"],
    funcPath = "SetBlendMode",
    params = { { name = "blendMode", type = "BlendMode", default = nil } },
    returns = {  },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["SetBlingTexture"] = {
    key = "SetBlingTexture",
    name = "SetBlingTexture",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["SetBlingTexture"],
    funcPath = "SetBlingTexture",
    params = { { name = "texture", type = "FileAsset", default = nil }, { name = "colorR", type = "number", default = nil }, { name = "colorG", type = "number", default = nil }, { name = "colorB", type = "number", default = nil }, { name = "colorA", type = "number", default = nil } },
    returns = {  },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["SetBlinkSpeed"] = {
    key = "SetBlinkSpeed",
    name = "SetBlinkSpeed",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["SetBlinkSpeed"],
    funcPath = "SetBlinkSpeed",
    params = { { name = "cursorBlinkSpeedSec", type = "number", default = nil } },
    returns = {  },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
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

APIDefs["SetBlockingLoadsRequested"] = {
    key = "SetBlockingLoadsRequested",
    name = "SetBlockingLoadsRequested",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["SetBlockingLoadsRequested"],
    funcPath = "SetBlockingLoadsRequested",
    params = { { name = "blocking", type = "bool", default = false } },
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

APIDefs["SetButtonState"] = {
    key = "SetButtonState",
    name = "SetButtonState",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["SetButtonState"],
    funcPath = "SetButtonState",
    params = { { name = "buttonState", type = "SimpleButtonStateToken", default = nil }, { name = "lock", type = "bool", default = false } },
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

APIDefs["SetClampRectInsets"] = {
    key = "SetClampRectInsets",
    name = "SetClampRectInsets",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["SetClampRectInsets"],
    funcPath = "SetClampRectInsets",
    params = { { name = "left", type = "uiUnit", default = nil }, { name = "right", type = "uiUnit", default = nil }, { name = "top", type = "uiUnit", default = nil }, { name = "bottom", type = "uiUnit", default = nil } },
    returns = {  },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["SetClampedToScreen"] = {
    key = "SetClampedToScreen",
    name = "SetClampedToScreen",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["SetClampedToScreen"],
    funcPath = "SetClampedToScreen",
    params = { { name = "clampedToScreen", type = "bool", default = nil } },
    returns = {  },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=NotAllowed",
}

APIDefs["SetClipsChildren"] = {
    key = "SetClipsChildren",
    name = "SetClipsChildren",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["SetClipsChildren"],
    funcPath = "SetClipsChildren",
    params = { { name = "clipsChildren", type = "bool", default = nil } },
    returns = {  },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["SetCollapsesLayout"] = {
    key = "SetCollapsesLayout",
    name = "SetCollapsesLayout",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["SetCollapsesLayout"],
    funcPath = "SetCollapsesLayout",
    params = { { name = "collapsesLayout", type = "bool", default = nil } },
    returns = {  },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=NotAllowed",
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

APIDefs["SetColorFill"] = {
    key = "SetColorFill",
    name = "SetColorFill",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["SetColorFill"],
    funcPath = "SetColorFill",
    params = { { name = "colorR", type = "number", default = nil }, { name = "colorG", type = "number", default = nil }, { name = "colorB", type = "number", default = nil }, { name = "a", type = "SingleColorValue", default = nil } },
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

APIDefs["SetColorTexture"] = {
    key = "SetColorTexture",
    name = "SetColorTexture",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["SetColorTexture"],
    funcPath = "SetColorTexture",
    params = { { name = "colorR", type = "number", default = nil }, { name = "colorG", type = "number", default = nil }, { name = "colorB", type = "number", default = nil }, { name = "a", type = "SingleColorValue", default = nil } },
    returns = {  },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenTainted",
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

APIDefs["SetCooldown"] = {
    key = "SetCooldown",
    name = "SetCooldown",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["SetCooldown"],
    funcPath = "SetCooldown",
    params = { { name = "start", type = "DurationSeconds", default = nil }, { name = "duration", type = "DurationSeconds", default = nil }, { name = "modRate", type = "number", default = 1 } },
    returns = {  },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenTainted",
}

APIDefs["SetCooldownDuration"] = {
    key = "SetCooldownDuration",
    name = "SetCooldownDuration",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["SetCooldownDuration"],
    funcPath = "SetCooldownDuration",
    params = { { name = "duration", type = "DurationSeconds", default = nil }, { name = "modRate", type = "number", default = 1 } },
    returns = {  },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenTainted",
}

APIDefs["SetCooldownFromDurationObject"] = {
    key = "SetCooldownFromDurationObject",
    name = "SetCooldownFromDurationObject",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["SetCooldownFromDurationObject"],
    funcPath = "SetCooldownFromDurationObject",
    params = { { name = "duration", type = "LuaDurationObject", default = nil }, { name = "clearIfZero", type = "bool", default = true } },
    returns = {  },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["SetCooldownFromExpirationTime"] = {
    key = "SetCooldownFromExpirationTime",
    name = "SetCooldownFromExpirationTime",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["SetCooldownFromExpirationTime"],
    funcPath = "SetCooldownFromExpirationTime",
    params = { { name = "expirationTime", type = "DurationSeconds", default = nil }, { name = "duration", type = "DurationSeconds", default = nil }, { name = "modRate", type = "number", default = 1 } },
    returns = {  },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenTainted",
}

APIDefs["SetCooldownUNIX"] = {
    key = "SetCooldownUNIX",
    name = "SetCooldownUNIX",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["SetCooldownUNIX"],
    funcPath = "SetCooldownUNIX",
    params = { { name = "start", type = "number", default = nil }, { name = "duration", type = "number", default = nil }, { name = "modRate", type = "number", default = 1 } },
    returns = {  },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenTainted",
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

APIDefs["SetCountInvisibleLetters"] = {
    key = "SetCountInvisibleLetters",
    name = "SetCountInvisibleLetters",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["SetCountInvisibleLetters"],
    funcPath = "SetCountInvisibleLetters",
    params = { { name = "countInvisibleLetters", type = "bool", default = false } },
    returns = {  },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["SetCountdownAbbrevThreshold"] = {
    key = "SetCountdownAbbrevThreshold",
    name = "SetCountdownAbbrevThreshold",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["SetCountdownAbbrevThreshold"],
    funcPath = "SetCountdownAbbrevThreshold",
    params = { { name = "seconds", type = "number", default = nil } },
    returns = {  },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["SetCountdownFont"] = {
    key = "SetCountdownFont",
    name = "SetCountdownFont",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["SetCountdownFont"],
    funcPath = "SetCountdownFont",
    params = { { name = "fontName", type = "cstring", default = nil } },
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
    params = { { name = "cursorPosition", type = "number", default = nil } },
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

APIDefs["SetDesaturated"] = {
    key = "SetDesaturated",
    name = "SetDesaturated",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["SetDesaturated"],
    funcPath = "SetDesaturated",
    params = { { name = "desaturated", type = "bool", default = false } },
    returns = {  },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenTainted",
}

APIDefs["SetDesaturation"] = {
    key = "SetDesaturation",
    name = "SetDesaturation",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["SetDesaturation"],
    funcPath = "SetDesaturation",
    params = { { name = "desaturation", type = "normalizedValue", default = nil } },
    returns = {  },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenTainted",
}

APIDefs["SetDisabledAtlas"] = {
    key = "SetDisabledAtlas",
    name = "SetDisabledAtlas",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["SetDisabledAtlas"],
    funcPath = "SetDisabledAtlas",
    params = { { name = "atlas", type = "textureAtlas", default = nil } },
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

APIDefs["SetDisabledFontObject"] = {
    key = "SetDisabledFontObject",
    name = "SetDisabledFontObject",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["SetDisabledFontObject"],
    funcPath = "SetDisabledFontObject",
    params = { { name = "font", type = "SimpleFont", default = nil } },
    returns = {  },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["SetDisabledTexture"] = {
    key = "SetDisabledTexture",
    name = "SetDisabledTexture",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["SetDisabledTexture"],
    funcPath = "SetDisabledTexture",
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

APIDefs["SetDontSavePosition"] = {
    key = "SetDontSavePosition",
    name = "SetDontSavePosition",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["SetDontSavePosition"],
    funcPath = "SetDontSavePosition",
    params = { { name = "dontSave", type = "bool", default = nil } },
    returns = {  },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["SetDrawBling"] = {
    key = "SetDrawBling",
    name = "SetDrawBling",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["SetDrawBling"],
    funcPath = "SetDrawBling",
    params = { { name = "drawBling", type = "bool", default = false } },
    returns = {  },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["SetDrawEdge"] = {
    key = "SetDrawEdge",
    name = "SetDrawEdge",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["SetDrawEdge"],
    funcPath = "SetDrawEdge",
    params = { { name = "drawEdge", type = "bool", default = false } },
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
    params = { { name = "layer", type = "DrawLayer", default = nil }, { name = "sublevel", type = "number", default = 0 } },
    returns = {  },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["SetDrawLayerEnabled"] = {
    key = "SetDrawLayerEnabled",
    name = "SetDrawLayerEnabled",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["SetDrawLayerEnabled"],
    funcPath = "SetDrawLayerEnabled",
    params = { { name = "layer", type = "DrawLayer", default = nil }, { name = "isEnabled", type = "bool", default = false } },
    returns = {  },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["SetDrawSwipe"] = {
    key = "SetDrawSwipe",
    name = "SetDrawSwipe",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["SetDrawSwipe"],
    funcPath = "SetDrawSwipe",
    params = { { name = "drawSwipe", type = "bool", default = false } },
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

APIDefs["SetEdgeColor"] = {
    key = "SetEdgeColor",
    name = "SetEdgeColor",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["SetEdgeColor"],
    funcPath = "SetEdgeColor",
    params = { { name = "colorR", type = "number", default = nil }, { name = "colorG", type = "number", default = nil }, { name = "colorB", type = "number", default = nil }, { name = "a", type = "SingleColorValue", default = nil } },
    returns = {  },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["SetEdgeScale"] = {
    key = "SetEdgeScale",
    name = "SetEdgeScale",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["SetEdgeScale"],
    funcPath = "SetEdgeScale",
    params = { { name = "scale", type = "number", default = nil } },
    returns = {  },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["SetEdgeTexture"] = {
    key = "SetEdgeTexture",
    name = "SetEdgeTexture",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["SetEdgeTexture"],
    funcPath = "SetEdgeTexture",
    params = { { name = "texture", type = "FileAsset", default = nil }, { name = "colorR", type = "number", default = nil }, { name = "colorG", type = "number", default = nil }, { name = "colorB", type = "number", default = nil }, { name = "colorA", type = "number", default = nil } },
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

APIDefs["SetFillStyle"] = {
    key = "SetFillStyle",
    name = "SetFillStyle",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["SetFillStyle"],
    funcPath = "SetFillStyle",
    params = { { name = "fillStyle", type = "StatusBarFillStyle", default = nil } },
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

APIDefs["SetFixedColor"] = {
    key = "SetFixedColor",
    name = "SetFixedColor",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["SetFixedColor"],
    funcPath = "SetFixedColor",
    params = { { name = "fixedColor", type = "bool", default = nil } },
    returns = {  },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["SetFixedFrameLevel"] = {
    key = "SetFixedFrameLevel",
    name = "SetFixedFrameLevel",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["SetFixedFrameLevel"],
    funcPath = "SetFixedFrameLevel",
    params = { { name = "isFixed", type = "bool", default = nil } },
    returns = {  },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["SetFixedFrameStrata"] = {
    key = "SetFixedFrameStrata",
    name = "SetFixedFrameStrata",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["SetFixedFrameStrata"],
    funcPath = "SetFixedFrameStrata",
    params = { { name = "isFixed", type = "bool", default = nil } },
    returns = {  },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["SetFlattensRenderLayers"] = {
    key = "SetFlattensRenderLayers",
    name = "SetFlattensRenderLayers",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["SetFlattensRenderLayers"],
    funcPath = "SetFlattensRenderLayers",
    params = { { name = "flatten", type = "bool", default = nil } },
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
    params = { { name = "height", type = "uiUnit", default = nil } },
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

APIDefs["SetFontString"] = {
    key = "SetFontString",
    name = "SetFontString",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["SetFontString"],
    funcPath = "SetFontString",
    params = { { name = "fontString", type = "SimpleFontString", default = nil } },
    returns = {  },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["SetForbidden"] = {
    key = "SetForbidden",
    name = "SetForbidden",
    category = "general",
    subcategory = "global",
    func = _G["SetForbidden"],
    funcPath = "SetForbidden",
    params = {  },
    returns = {  },
    midnightImpact = "NORMAL",
}

APIDefs["SetFormattedText"] = {
    key = "SetFormattedText",
    name = "SetFormattedText",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["SetFormattedText"],
    funcPath = "SetFormattedText",
    params = { { name = "text", type = "cstring", default = nil } },
    returns = {  },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenTainted",
}

APIDefs["SetFrameLevel"] = {
    key = "SetFrameLevel",
    name = "SetFrameLevel",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["SetFrameLevel"],
    funcPath = "SetFrameLevel",
    params = { { name = "frameLevel", type = "number", default = nil } },
    returns = {  },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["SetFrameStrata"] = {
    key = "SetFrameStrata",
    name = "SetFrameStrata",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["SetFrameStrata"],
    funcPath = "SetFrameStrata",
    params = { { name = "strata", type = "FrameStrata", default = nil } },
    returns = {  },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=NotAllowed",
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

APIDefs["SetGradient"] = {
    key = "SetGradient",
    name = "SetGradient",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["SetGradient"],
    funcPath = "SetGradient",
    params = { { name = "orientation", type = "Orientation", default = nil }, { name = "minColor", type = "colorRGBA", default = nil }, { name = "maxColor", type = "colorRGBA", default = nil } },
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

APIDefs["SetHideCountdownNumbers"] = {
    key = "SetHideCountdownNumbers",
    name = "SetHideCountdownNumbers",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["SetHideCountdownNumbers"],
    funcPath = "SetHideCountdownNumbers",
    params = { { name = "hideNumbers", type = "bool", default = false } },
    returns = {  },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["SetHighlightAtlas"] = {
    key = "SetHighlightAtlas",
    name = "SetHighlightAtlas",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["SetHighlightAtlas"],
    funcPath = "SetHighlightAtlas",
    params = { { name = "atlas", type = "textureAtlas", default = nil }, { name = "blendMode", type = "BlendMode", default = nil } },
    returns = {  },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["SetHighlightColor"] = {
    key = "SetHighlightColor",
    name = "SetHighlightColor",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["SetHighlightColor"],
    funcPath = "SetHighlightColor",
    params = { { name = "colorR", type = "number", default = nil }, { name = "colorG", type = "number", default = nil }, { name = "colorB", type = "number", default = nil }, { name = "a", type = "SingleColorValue", default = nil } },
    returns = {  },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["SetHighlightFontObject"] = {
    key = "SetHighlightFontObject",
    name = "SetHighlightFontObject",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["SetHighlightFontObject"],
    funcPath = "SetHighlightFontObject",
    params = { { name = "font", type = "SimpleFont", default = nil } },
    returns = {  },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["SetHighlightLocked"] = {
    key = "SetHighlightLocked",
    name = "SetHighlightLocked",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["SetHighlightLocked"],
    funcPath = "SetHighlightLocked",
    params = { { name = "locked", type = "bool", default = nil } },
    returns = {  },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["SetHighlightTexture"] = {
    key = "SetHighlightTexture",
    name = "SetHighlightTexture",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["SetHighlightTexture"],
    funcPath = "SetHighlightTexture",
    params = { { name = "asset", type = "TextureAsset", default = nil }, { name = "blendMode", type = "BlendMode", default = nil } },
    returns = {  },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["SetHistoryLines"] = {
    key = "SetHistoryLines",
    name = "SetHistoryLines",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["SetHistoryLines"],
    funcPath = "SetHistoryLines",
    params = { { name = "numHistoryLines", type = "number", default = nil } },
    returns = {  },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["SetHitRectInsets"] = {
    key = "SetHitRectInsets",
    name = "SetHitRectInsets",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["SetHitRectInsets"],
    funcPath = "SetHitRectInsets",
    params = { { name = "left", type = "uiUnit", default = nil }, { name = "right", type = "uiUnit", default = nil }, { name = "top", type = "uiUnit", default = nil }, { name = "bottom", type = "uiUnit", default = nil } },
    returns = {  },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=NotAllowed",
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

APIDefs["SetHorizTile"] = {
    key = "SetHorizTile",
    name = "SetHorizTile",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["SetHorizTile"],
    funcPath = "SetHorizTile",
    params = { { name = "tiling", type = "bool", default = false } },
    returns = {  },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["SetHorizontalScroll"] = {
    key = "SetHorizontalScroll",
    name = "SetHorizontalScroll",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["SetHorizontalScroll"],
    funcPath = "SetHorizontalScroll",
    params = { { name = "offset", type = "uiUnit", default = nil } },
    returns = {  },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=NotAllowed",
}

APIDefs["SetHyperlinkFormat"] = {
    key = "SetHyperlinkFormat",
    name = "SetHyperlinkFormat",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["SetHyperlinkFormat"],
    funcPath = "SetHyperlinkFormat",
    params = { { name = "format", type = "cstring", default = nil } },
    returns = {  },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["SetHyperlinkPropagateToParent"] = {
    key = "SetHyperlinkPropagateToParent",
    name = "SetHyperlinkPropagateToParent",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["SetHyperlinkPropagateToParent"],
    funcPath = "SetHyperlinkPropagateToParent",
    params = { { name = "canPropagate", type = "bool", default = nil } },
    returns = {  },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["SetHyperlinksEnabled"] = {
    key = "SetHyperlinksEnabled",
    name = "SetHyperlinksEnabled",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["SetHyperlinksEnabled"],
    funcPath = "SetHyperlinksEnabled",
    params = { { name = "enabled", type = "bool", default = false } },
    returns = {  },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=NotAllowed",
}

APIDefs["SetID"] = {
    key = "SetID",
    name = "SetID",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["SetID"],
    funcPath = "SetID",
    params = { { name = "id", type = "number", default = nil } },
    returns = {  },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenTainted",
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

APIDefs["SetIgnoreParentAlpha"] = {
    key = "SetIgnoreParentAlpha",
    name = "SetIgnoreParentAlpha",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["SetIgnoreParentAlpha"],
    funcPath = "SetIgnoreParentAlpha",
    params = { { name = "ignore", type = "bool", default = nil } },
    returns = {  },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["SetIgnoreParentScale"] = {
    key = "SetIgnoreParentScale",
    name = "SetIgnoreParentScale",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["SetIgnoreParentScale"],
    funcPath = "SetIgnoreParentScale",
    params = { { name = "ignore", type = "bool", default = nil } },
    returns = {  },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=NotAllowed",
}

APIDefs["SetIgnoringChildrenForBounds"] = {
    key = "SetIgnoringChildrenForBounds",
    name = "SetIgnoringChildrenForBounds",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["SetIgnoringChildrenForBounds"],
    funcPath = "SetIgnoringChildrenForBounds",
    params = { { name = "ignore", type = "bool", default = nil } },
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

APIDefs["SetIsFrameBuffer"] = {
    key = "SetIsFrameBuffer",
    name = "SetIsFrameBuffer",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["SetIsFrameBuffer"],
    funcPath = "SetIsFrameBuffer",
    params = { { name = "isFrameBuffer", type = "bool", default = nil } },
    returns = {  },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=NotAllowed",
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

APIDefs["SetMask"] = {
    key = "SetMask",
    name = "SetMask",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["SetMask"],
    funcPath = "SetMask",
    params = { { name = "file", type = "cstring", default = nil } },
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

APIDefs["SetMaxBytes"] = {
    key = "SetMaxBytes",
    name = "SetMaxBytes",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["SetMaxBytes"],
    funcPath = "SetMaxBytes",
    params = { { name = "maxBytes", type = "number", default = nil } },
    returns = {  },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["SetMaxLetters"] = {
    key = "SetMaxLetters",
    name = "SetMaxLetters",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["SetMaxLetters"],
    funcPath = "SetMaxLetters",
    params = { { name = "maxLetters", type = "number", default = nil } },
    returns = {  },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["SetMaxLines"] = {
    key = "SetMaxLines",
    name = "SetMaxLines",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["SetMaxLines"],
    funcPath = "SetMaxLines",
    params = { { name = "maxLines", type = "number", default = nil } },
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
    params = { { name = "minValue", type = "number", default = nil }, { name = "maxValue", type = "number", default = nil }, { name = "interpolation", type = "StatusBarInterpolation", default = "Immediate" } },
    returns = {  },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenTainted",
}

APIDefs["SetMinimumCountdownDuration"] = {
    key = "SetMinimumCountdownDuration",
    name = "SetMinimumCountdownDuration",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["SetMinimumCountdownDuration"],
    funcPath = "SetMinimumCountdownDuration",
    params = { { name = "milliseconds", type = "number", default = nil } },
    returns = {  },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["SetMinimumWidth"] = {
    key = "SetMinimumWidth",
    name = "SetMinimumWidth",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["SetMinimumWidth"],
    funcPath = "SetMinimumWidth",
    params = { { name = "width", type = "number", default = nil }, { name = "force", type = "bool", default = false } },
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

APIDefs["SetMotionScriptsWhileDisabled"] = {
    key = "SetMotionScriptsWhileDisabled",
    name = "SetMotionScriptsWhileDisabled",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["SetMotionScriptsWhileDisabled"],
    funcPath = "SetMotionScriptsWhileDisabled",
    params = { { name = "motionScriptsWhileDisabled", type = "bool", default = nil } },
    returns = {  },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["SetMouseClickEnabled"] = {
    key = "SetMouseClickEnabled",
    name = "SetMouseClickEnabled",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["SetMouseClickEnabled"],
    funcPath = "SetMouseClickEnabled",
    params = { { name = "enabled", type = "bool", default = false } },
    returns = {  },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=NotAllowed",
}

APIDefs["SetMouseMotionEnabled"] = {
    key = "SetMouseMotionEnabled",
    name = "SetMouseMotionEnabled",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["SetMouseMotionEnabled"],
    funcPath = "SetMouseMotionEnabled",
    params = { { name = "enabled", type = "bool", default = false } },
    returns = {  },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=NotAllowed",
}

APIDefs["SetMovable"] = {
    key = "SetMovable",
    name = "SetMovable",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["SetMovable"],
    funcPath = "SetMovable",
    params = { { name = "movable", type = "bool", default = nil } },
    returns = {  },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["SetMultiLine"] = {
    key = "SetMultiLine",
    name = "SetMultiLine",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["SetMultiLine"],
    funcPath = "SetMultiLine",
    params = { { name = "multiline", type = "bool", default = false } },
    returns = {  },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["SetNonSpaceWrap"] = {
    key = "SetNonSpaceWrap",
    name = "SetNonSpaceWrap",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["SetNonSpaceWrap"],
    funcPath = "SetNonSpaceWrap",
    params = { { name = "wrap", type = "bool", default = nil } },
    returns = {  },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["SetNormalAtlas"] = {
    key = "SetNormalAtlas",
    name = "SetNormalAtlas",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["SetNormalAtlas"],
    funcPath = "SetNormalAtlas",
    params = { { name = "atlas", type = "textureAtlas", default = nil } },
    returns = {  },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["SetNormalFontObject"] = {
    key = "SetNormalFontObject",
    name = "SetNormalFontObject",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["SetNormalFontObject"],
    funcPath = "SetNormalFontObject",
    params = { { name = "font", type = "SimpleFont", default = nil } },
    returns = {  },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["SetNormalTexture"] = {
    key = "SetNormalTexture",
    name = "SetNormalTexture",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["SetNormalTexture"],
    funcPath = "SetNormalTexture",
    params = { { name = "asset", type = "TextureAsset", default = nil } },
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

APIDefs["SetNumber"] = {
    key = "SetNumber",
    name = "SetNumber",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["SetNumber"],
    funcPath = "SetNumber",
    params = { { name = "number", type = "number", default = nil } },
    returns = {  },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["SetNumeric"] = {
    key = "SetNumeric",
    name = "SetNumeric",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["SetNumeric"],
    funcPath = "SetNumeric",
    params = { { name = "isNumeric", type = "bool", default = false } },
    returns = {  },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["SetNumericFullRange"] = {
    key = "SetNumericFullRange",
    name = "SetNumericFullRange",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["SetNumericFullRange"],
    funcPath = "SetNumericFullRange",
    params = { { name = "isNumeric", type = "bool", default = false } },
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

APIDefs["SetPadding"] = {
    key = "SetPadding",
    name = "SetPadding",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["SetPadding"],
    funcPath = "SetPadding",
    params = { { name = "right", type = "number", default = nil }, { name = "bottom", type = "number", default = nil }, { name = "left", type = "number", default = nil }, { name = "top", type = "number", default = nil } },
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
    params = { { name = "parent", type = "SimpleFrame", default = nil } },
    returns = {  },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=NotAllowed",
}

APIDefs["SetParentKey"] = {
    key = "SetParentKey",
    name = "SetParentKey",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["SetParentKey"],
    funcPath = "SetParentKey",
    params = { { name = "parentKey", type = "cstring", default = nil }, { name = "clearOtherKeys", type = "bool", default = false } },
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

APIDefs["SetPassThroughButtons"] = {
    key = "SetPassThroughButtons",
    name = "SetPassThroughButtons",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["SetPassThroughButtons"],
    funcPath = "SetPassThroughButtons",
    params = { { name = "buttons", type = "MouseButton", default = nil } },
    returns = {  },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=NotAllowed",
}

APIDefs["SetPassword"] = {
    key = "SetPassword",
    name = "SetPassword",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["SetPassword"],
    funcPath = "SetPassword",
    params = { { name = "isPassword", type = "bool", default = false } },
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

APIDefs["SetPreventSecretValues"] = {
    key = "SetPreventSecretValues",
    name = "SetPreventSecretValues",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["SetPreventSecretValues"],
    funcPath = "SetPreventSecretValues",
    params = { { name = "preventSecretValues", type = "bool", default = nil } },
    returns = {  },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["SetPropagateKeyboardInput"] = {
    key = "SetPropagateKeyboardInput",
    name = "SetPropagateKeyboardInput",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["SetPropagateKeyboardInput"],
    funcPath = "SetPropagateKeyboardInput",
    params = { { name = "propagate", type = "bool", default = nil } },
    returns = {  },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["SetPropagateMouseClicks"] = {
    key = "SetPropagateMouseClicks",
    name = "SetPropagateMouseClicks",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["SetPropagateMouseClicks"],
    funcPath = "SetPropagateMouseClicks",
    params = { { name = "propagate", type = "bool", default = nil } },
    returns = {  },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=NotAllowed",
}

APIDefs["SetPropagateMouseMotion"] = {
    key = "SetPropagateMouseMotion",
    name = "SetPropagateMouseMotion",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["SetPropagateMouseMotion"],
    funcPath = "SetPropagateMouseMotion",
    params = { { name = "propagate", type = "bool", default = nil } },
    returns = {  },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=NotAllowed",
}

APIDefs["SetPushedAtlas"] = {
    key = "SetPushedAtlas",
    name = "SetPushedAtlas",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["SetPushedAtlas"],
    funcPath = "SetPushedAtlas",
    params = { { name = "atlas", type = "textureAtlas", default = nil } },
    returns = {  },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["SetPushedTextOffset"] = {
    key = "SetPushedTextOffset",
    name = "SetPushedTextOffset",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["SetPushedTextOffset"],
    funcPath = "SetPushedTextOffset",
    params = { { name = "offsetX", type = "uiUnit", default = nil }, { name = "offsetY", type = "uiUnit", default = nil } },
    returns = {  },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["SetPushedTexture"] = {
    key = "SetPushedTexture",
    name = "SetPushedTexture",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["SetPushedTexture"],
    funcPath = "SetPushedTexture",
    params = { { name = "asset", type = "TextureAsset", default = nil } },
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

APIDefs["SetResizable"] = {
    key = "SetResizable",
    name = "SetResizable",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["SetResizable"],
    funcPath = "SetResizable",
    params = { { name = "resizable", type = "bool", default = nil } },
    returns = {  },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["SetResizeBounds"] = {
    key = "SetResizeBounds",
    name = "SetResizeBounds",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["SetResizeBounds"],
    funcPath = "SetResizeBounds",
    params = { { name = "minWidth", type = "uiUnit", default = nil }, { name = "minHeight", type = "uiUnit", default = nil }, { name = "maxWidth", type = "uiUnit", default = nil }, { name = "maxHeight", type = "uiUnit", default = nil } },
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

APIDefs["SetReverse"] = {
    key = "SetReverse",
    name = "SetReverse",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["SetReverse"],
    funcPath = "SetReverse",
    params = { { name = "reverse", type = "bool", default = false } },
    returns = {  },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["SetReverseFill"] = {
    key = "SetReverseFill",
    name = "SetReverseFill",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["SetReverseFill"],
    funcPath = "SetReverseFill",
    params = { { name = "isReverseFill", type = "bool", default = nil } },
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

APIDefs["SetRotatesTexture"] = {
    key = "SetRotatesTexture",
    name = "SetRotatesTexture",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["SetRotatesTexture"],
    funcPath = "SetRotatesTexture",
    params = { { name = "rotatesTexture", type = "bool", default = nil } },
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
    params = { { name = "radians", type = "number", default = nil }, { name = "normalizedRotationPoint", type = "vector2", default = nil } },
    returns = {  },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenTainted",
}

APIDefs["SetScale"] = {
    key = "SetScale",
    name = "SetScale",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["SetScale"],
    funcPath = "SetScale",
    params = { { name = "scale", type = "number", default = nil } },
    returns = {  },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["SetScaleAnimationMode"] = {
    key = "SetScaleAnimationMode",
    name = "SetScaleAnimationMode",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["SetScaleAnimationMode"],
    funcPath = "SetScaleAnimationMode",
    params = { { name = "scaleAnimationMode", type = "FontStringScaleAnimationMode", default = nil } },
    returns = {  },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=NotAllowed",
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

APIDefs["SetScrollChild"] = {
    key = "SetScrollChild",
    name = "SetScrollChild",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["SetScrollChild"],
    funcPath = "SetScrollChild",
    params = { { name = "scrollChild", type = "SimpleFrame", default = nil } },
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

APIDefs["SetSecureText"] = {
    key = "SetSecureText",
    name = "SetSecureText",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["SetSecureText"],
    funcPath = "SetSecureText",
    params = { { name = "isSecure", type = "bool", default = false } },
    returns = {  },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["SetSecurityDisablePaste"] = {
    key = "SetSecurityDisablePaste",
    name = "SetSecurityDisablePaste",
    category = "general",
    subcategory = "global",
    func = _G["SetSecurityDisablePaste"],
    funcPath = "SetSecurityDisablePaste",
    params = {  },
    returns = {  },
    midnightImpact = "NORMAL",
}

APIDefs["SetSecurityDisableSetText"] = {
    key = "SetSecurityDisableSetText",
    name = "SetSecurityDisableSetText",
    category = "general",
    subcategory = "global",
    func = _G["SetSecurityDisableSetText"],
    funcPath = "SetSecurityDisableSetText",
    params = {  },
    returns = {  },
    midnightImpact = "NORMAL",
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

APIDefs["SetSnapToPixelGrid"] = {
    key = "SetSnapToPixelGrid",
    name = "SetSnapToPixelGrid",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["SetSnapToPixelGrid"],
    funcPath = "SetSnapToPixelGrid",
    params = { { name = "snap", type = "bool", default = false } },
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

APIDefs["SetSpriteSheetCell"] = {
    key = "SetSpriteSheetCell",
    name = "SetSpriteSheetCell",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["SetSpriteSheetCell"],
    funcPath = "SetSpriteSheetCell",
    params = { { name = "cell", type = "luaIndex", default = nil }, { name = "numRows", type = "number", default = nil }, { name = "numColumns", type = "number", default = nil }, { name = "cellWidth", type = "number", default = nil }, { name = "cellHeight", type = "number", default = nil } },
    returns = {  },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenTainted",
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

APIDefs["SetStatusBarColor"] = {
    key = "SetStatusBarColor",
    name = "SetStatusBarColor",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["SetStatusBarColor"],
    funcPath = "SetStatusBarColor",
    params = { { name = "colorR", type = "number", default = nil }, { name = "colorG", type = "number", default = nil }, { name = "colorB", type = "number", default = nil }, { name = "a", type = "SingleColorValue", default = nil } },
    returns = {  },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["SetStatusBarDesaturated"] = {
    key = "SetStatusBarDesaturated",
    name = "SetStatusBarDesaturated",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["SetStatusBarDesaturated"],
    funcPath = "SetStatusBarDesaturated",
    params = { { name = "desaturated", type = "bool", default = false } },
    returns = {  },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["SetStatusBarDesaturation"] = {
    key = "SetStatusBarDesaturation",
    name = "SetStatusBarDesaturation",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["SetStatusBarDesaturation"],
    funcPath = "SetStatusBarDesaturation",
    params = { { name = "desaturation", type = "normalizedValue", default = nil } },
    returns = {  },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["SetStatusBarTexture"] = {
    key = "SetStatusBarTexture",
    name = "SetStatusBarTexture",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["SetStatusBarTexture"],
    funcPath = "SetStatusBarTexture",
    params = { { name = "asset", type = "TextureAsset", default = nil } },
    returns = { { name = "success", type = "bool", canBeSecret = false } },
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

APIDefs["SetSwipeColor"] = {
    key = "SetSwipeColor",
    name = "SetSwipeColor",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["SetSwipeColor"],
    funcPath = "SetSwipeColor",
    params = { { name = "colorR", type = "number", default = nil }, { name = "colorG", type = "number", default = nil }, { name = "colorB", type = "number", default = nil }, { name = "a", type = "SingleColorValue", default = nil } },
    returns = {  },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["SetSwipeTexture"] = {
    key = "SetSwipeTexture",
    name = "SetSwipeTexture",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["SetSwipeTexture"],
    funcPath = "SetSwipeTexture",
    params = { { name = "texture", type = "FileAsset", default = nil }, { name = "colorR", type = "number", default = nil }, { name = "colorG", type = "number", default = nil }, { name = "colorB", type = "number", default = nil }, { name = "colorA", type = "number", default = nil } },
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
    params = { { name = "success", type = "bool", default = nil } },
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

APIDefs["SetTexCoord"] = {
    key = "SetTexCoord",
    name = "SetTexCoord",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["SetTexCoord"],
    funcPath = "SetTexCoord",
    params = { { name = "left", type = "number", default = nil }, { name = "right", type = "number", default = nil }, { name = "bottom", type = "number", default = nil }, { name = "top", type = "number", default = nil } },
    returns = {  },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenTainted",
}

APIDefs["SetTexCoordRange"] = {
    key = "SetTexCoordRange",
    name = "SetTexCoordRange",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["SetTexCoordRange"],
    funcPath = "SetTexCoordRange",
    params = { { name = "low", type = "vector2", default = nil }, { name = "high", type = "vector2", default = nil } },
    returns = {  },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["SetTexelSnappingBias"] = {
    key = "SetTexelSnappingBias",
    name = "SetTexelSnappingBias",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["SetTexelSnappingBias"],
    funcPath = "SetTexelSnappingBias",
    params = { { name = "bias", type = "normalizedValue", default = nil } },
    returns = {  },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["SetText"] = {
    key = "SetText",
    name = "SetText",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["SetText"],
    funcPath = "SetText",
    params = { { name = "text", type = "cstring", default = nil }, { name = "ignoreMarkup", type = "bool", default = false } },
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

APIDefs["SetTextHeight"] = {
    key = "SetTextHeight",
    name = "SetTextHeight",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["SetTextHeight"],
    funcPath = "SetTextHeight",
    params = { { name = "height", type = "uiUnit", default = nil } },
    returns = {  },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["SetTextInsets"] = {
    key = "SetTextInsets",
    name = "SetTextInsets",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["SetTextInsets"],
    funcPath = "SetTextInsets",
    params = { { name = "left", type = "uiUnit", default = nil }, { name = "right", type = "uiUnit", default = nil }, { name = "top", type = "uiUnit", default = nil }, { name = "bottom", type = "uiUnit", default = nil } },
    returns = {  },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["SetTextScale"] = {
    key = "SetTextScale",
    name = "SetTextScale",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["SetTextScale"],
    funcPath = "SetTextScale",
    params = { { name = "textScale", type = "number", default = nil } },
    returns = {  },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["SetTextToFit"] = {
    key = "SetTextToFit",
    name = "SetTextToFit",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["SetTextToFit"],
    funcPath = "SetTextToFit",
    params = { { name = "text", type = "cstring", default = "" } },
    returns = {  },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenTainted",
}

APIDefs["SetTexture"] = {
    key = "SetTexture",
    name = "SetTexture",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["SetTexture"],
    funcPath = "SetTexture",
    params = { { name = "textureAsset", type = "cstring", default = nil }, { name = "wrapModeHorizontal", type = "cstring", default = nil }, { name = "wrapModeVertical", type = "cstring", default = nil }, { name = "filterMode", type = "cstring", default = nil } },
    returns = { { name = "success", type = "bool", canBeSecret = false } },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenTainted",
}

APIDefs["SetTextureSliceMargins"] = {
    key = "SetTextureSliceMargins",
    name = "SetTextureSliceMargins",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["SetTextureSliceMargins"],
    funcPath = "SetTextureSliceMargins",
    params = { { name = "left", type = "number", default = nil }, { name = "top", type = "number", default = nil }, { name = "right", type = "number", default = nil }, { name = "bottom", type = "number", default = nil } },
    returns = {  },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["SetTextureSliceMode"] = {
    key = "SetTextureSliceMode",
    name = "SetTextureSliceMode",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["SetTextureSliceMode"],
    funcPath = "SetTextureSliceMode",
    params = { { name = "sliceMode", type = "UITextureSliceMode", default = nil } },
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

APIDefs["SetTimerDuration"] = {
    key = "SetTimerDuration",
    name = "SetTimerDuration",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["SetTimerDuration"],
    funcPath = "SetTimerDuration",
    params = { { name = "duration", type = "LuaDurationObject", default = nil }, { name = "interpolation", type = "StatusBarInterpolation", default = "Immediate" } },
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

APIDefs["SetToTargetValue"] = {
    key = "SetToTargetValue",
    name = "SetToTargetValue",
    category = "general",
    subcategory = "global",
    func = _G["SetToTargetValue"],
    funcPath = "SetToTargetValue",
    params = {  },
    returns = {  },
    midnightImpact = "NORMAL",
}

APIDefs["SetToplevel"] = {
    key = "SetToplevel",
    name = "SetToplevel",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["SetToplevel"],
    funcPath = "SetToplevel",
    params = { { name = "topLevel", type = "bool", default = nil } },
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

APIDefs["SetUseAuraDisplayTime"] = {
    key = "SetUseAuraDisplayTime",
    name = "SetUseAuraDisplayTime",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["SetUseAuraDisplayTime"],
    funcPath = "SetUseAuraDisplayTime",
    params = { { name = "useAuraDisplayTime", type = "bool", default = false } },
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

APIDefs["SetUseCircularEdge"] = {
    key = "SetUseCircularEdge",
    name = "SetUseCircularEdge",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["SetUseCircularEdge"],
    funcPath = "SetUseCircularEdge",
    params = { { name = "useCircularEdge", type = "bool", default = false } },
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

APIDefs["SetUserPlaced"] = {
    key = "SetUserPlaced",
    name = "SetUserPlaced",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["SetUserPlaced"],
    funcPath = "SetUserPlaced",
    params = { { name = "userPlaced", type = "bool", default = nil } },
    returns = {  },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["SetUsingParentLevel"] = {
    key = "SetUsingParentLevel",
    name = "SetUsingParentLevel",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["SetUsingParentLevel"],
    funcPath = "SetUsingParentLevel",
    params = { { name = "usingParentLevel", type = "bool", default = nil } },
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
    params = { { name = "value", type = "number", default = nil }, { name = "interpolation", type = "StatusBarInterpolation", default = "Immediate" } },
    returns = {  },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenTainted",
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

APIDefs["SetVertTile"] = {
    key = "SetVertTile",
    name = "SetVertTile",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["SetVertTile"],
    funcPath = "SetVertTile",
    params = { { name = "tiling", type = "bool", default = false } },
    returns = {  },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["SetVertexColor"] = {
    key = "SetVertexColor",
    name = "SetVertexColor",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["SetVertexColor"],
    funcPath = "SetVertexColor",
    params = { { name = "colorR", type = "number", default = nil }, { name = "colorG", type = "number", default = nil }, { name = "colorB", type = "number", default = nil }, { name = "a", type = "SingleColorValue", default = nil } },
    returns = {  },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenTainted",
}

APIDefs["SetVertexColorFromBoolean"] = {
    key = "SetVertexColorFromBoolean",
    name = "SetVertexColorFromBoolean",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["SetVertexColorFromBoolean"],
    funcPath = "SetVertexColorFromBoolean",
    params = { { name = "value", type = "bool", default = nil }, { name = "colorIfTrue", type = "colorRGBA", default = nil }, { name = "colorIfFalse", type = "colorRGBA", default = nil } },
    returns = {  },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenTainted",
}

APIDefs["SetVertexOffset"] = {
    key = "SetVertexOffset",
    name = "SetVertexOffset",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["SetVertexOffset"],
    funcPath = "SetVertexOffset",
    params = { { name = "vertexIndex", type = "luaIndex", default = nil }, { name = "offsetX", type = "uiUnit", default = nil }, { name = "offsetY", type = "uiUnit", default = nil } },
    returns = {  },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["SetVerticalScroll"] = {
    key = "SetVerticalScroll",
    name = "SetVerticalScroll",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["SetVerticalScroll"],
    funcPath = "SetVerticalScroll",
    params = { { name = "offset", type = "uiUnit", default = nil } },
    returns = {  },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=NotAllowed",
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

APIDefs["SetVisibleTextByteLimit"] = {
    key = "SetVisibleTextByteLimit",
    name = "SetVisibleTextByteLimit",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["SetVisibleTextByteLimit"],
    funcPath = "SetVisibleTextByteLimit",
    params = { { name = "maxVisibleBytes", type = "number", default = nil } },
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

APIDefs["SetWindow"] = {
    key = "SetWindow",
    name = "SetWindow",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["SetWindow"],
    funcPath = "SetWindow",
    params = { { name = "window", type = "SimpleWindow", default = nil } },
    returns = {  },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["SetWordWrap"] = {
    key = "SetWordWrap",
    name = "SetWordWrap",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["SetWordWrap"],
    funcPath = "SetWordWrap",
    params = { { name = "wrap", type = "bool", default = nil } },
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

APIDefs["ShouldButtonPassThrough"] = {
    key = "ShouldButtonPassThrough",
    name = "ShouldButtonPassThrough",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["ShouldButtonPassThrough"],
    funcPath = "ShouldButtonPassThrough",
    params = { { name = "button", type = "MouseButton", default = nil } },
    returns = { { name = "shouldPassThrough", type = "bool", canBeSecret = false } },
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

APIDefs["StartMoving"] = {
    key = "StartMoving",
    name = "StartMoving",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["StartMoving"],
    funcPath = "StartMoving",
    params = { { name = "alwaysStartFromMouse", type = "bool", default = false } },
    returns = {  },
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

APIDefs["StartSizing"] = {
    key = "StartSizing",
    name = "StartSizing",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["StartSizing"],
    funcPath = "StartSizing",
    params = { { name = "resizePoint", type = "FramePoint", default = nil }, { name = "alwaysStartFromMouse", type = "bool", default = false } },
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

APIDefs["StopMovingOrSizing"] = {
    key = "StopMovingOrSizing",
    name = "StopMovingOrSizing",
    category = "general",
    subcategory = "global",
    func = _G["StopMovingOrSizing"],
    funcPath = "StopMovingOrSizing",
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
    params = { { name = "snapshotID", type = "number", default = nil } },
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

APIDefs["ToggleInputLanguage"] = {
    key = "ToggleInputLanguage",
    name = "ToggleInputLanguage",
    category = "general",
    subcategory = "global",
    func = _G["ToggleInputLanguage"],
    funcPath = "ToggleInputLanguage",
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
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
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
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
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
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
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
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
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
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
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
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
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
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
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
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
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
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
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
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenTainted",
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
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenTainted",
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
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
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
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
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
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
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
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
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
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
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
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
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
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
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
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted, SecretWhenCurveSecret",
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
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenTainted",
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

APIDefs["UnlockHighlight"] = {
    key = "UnlockHighlight",
    name = "UnlockHighlight",
    category = "general",
    subcategory = "global",
    func = _G["UnlockHighlight"],
    funcPath = "UnlockHighlight",
    params = {  },
    returns = {  },
    midnightImpact = "NORMAL",
}

APIDefs["UnregisterAllEvents"] = {
    key = "UnregisterAllEvents",
    name = "UnregisterAllEvents",
    category = "general",
    subcategory = "global",
    func = _G["UnregisterAllEvents"],
    funcPath = "UnregisterAllEvents",
    params = {  },
    returns = {  },
    midnightImpact = "NORMAL",
}

APIDefs["UnregisterEvent"] = {
    key = "UnregisterEvent",
    name = "UnregisterEvent",
    category = "combat_midnight",
    subcategory = "global",
    func = _G["UnregisterEvent"],
    funcPath = "UnregisterEvent",
    params = { { name = "eventName", type = "cstring", default = nil } },
    returns = { { name = "registered", type = "bool", canBeSecret = false } },
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

APIDefs["UpdateScrollChildRect"] = {
    key = "UpdateScrollChildRect",
    name = "UpdateScrollChildRect",
    category = "general",
    subcategory = "global",
    func = _G["UpdateScrollChildRect"],
    funcPath = "UpdateScrollChildRect",
    params = {  },
    returns = {  },
    midnightImpact = "NORMAL",
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
    params = { { name = "usesNPOT", type = "bool", default = nil } },
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
