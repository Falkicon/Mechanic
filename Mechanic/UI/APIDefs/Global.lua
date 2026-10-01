-- Generated APIDefinitions for namespace: Global
local _, ns = ...
local APIDefs = ns.APIDefinitions

APIDefs["AbbreviateLargeNumbers"] = {
    key = "AbbreviateLargeNumbers",
    name = "AbbreviateLargeNumbers",
    category = "general",
    subcategory = "global",
    funcPath = "AbbreviateLargeNumbers",
    params = { { name = "number", type = "number", default = nil }, { name = "options", type = "NumberAbbrevOptions", default = nil } },
    returns = { { name = "result", type = "string", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenTainted",
}

APIDefs["AbbreviateNumbers"] = {
    key = "AbbreviateNumbers",
    name = "AbbreviateNumbers",
    category = "general",
    subcategory = "global",
    funcPath = "AbbreviateNumbers",
    params = { { name = "number", type = "number", default = nil }, { name = "options", type = "NumberAbbrevOptions", default = nil } },
    returns = { { name = "result", type = "string", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenTainted",
}

APIDefs["AcceptAreaSpiritHeal"] = {
    key = "AcceptAreaSpiritHeal",
    name = "AcceptAreaSpiritHeal",
    category = "general",
    subcategory = "global",
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
    funcPath = "AcceptResurrect",
    params = {  },
    returns = {  },
    midnightImpact = "NORMAL",
}

APIDefs["AddSourceLocationExclude"] = {
    key = "AddSourceLocationExclude",
    name = "AddSourceLocationExclude",
    category = "general",
    subcategory = "global",
    funcPath = "AddSourceLocationExclude",
    params = { { name = "fileName", type = "cstring", default = nil } },
    returns = {  },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["Ambiguate"] = {
    key = "Ambiguate",
    name = "Ambiguate",
    category = "general",
    subcategory = "global",
    funcPath = "Ambiguate",
    params = { { name = "fullName", type = "cstring", default = nil }, { name = "context", type = "cstring", default = nil } },
    returns = { { name = "result", type = "string", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["AreClassRolesSoftSuggestions"] = {
    key = "AreClassRolesSoftSuggestions",
    name = "AreClassRolesSoftSuggestions",
    category = "general",
    subcategory = "global",
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
    funcPath = "AreDangerousScriptsAllowed",
    params = {  },
    returns = { { name = "allowed", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["AssistUnit"] = {
    key = "AssistUnit",
    name = "AssistUnit",
    category = "general",
    subcategory = "global",
    funcPath = "AssistUnit",
    params = { { name = "name", type = "cstring", default = "" }, { name = "exactMatch", type = "bool", default = false } },
    returns = {  },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["AttackTarget"] = {
    key = "AttackTarget",
    name = "AttackTarget",
    category = "general",
    subcategory = "global",
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
    funcPath = "BeginTrade",
    params = {  },
    returns = {  },
    midnightImpact = "NORMAL",
}

APIDefs["BreakUpLargeNumbers"] = {
    key = "BreakUpLargeNumbers",
    name = "BreakUpLargeNumbers",
    category = "general",
    subcategory = "global",
    funcPath = "BreakUpLargeNumbers",
    params = { { name = "largeNumber", type = "number", default = nil }, { name = "natural", type = "bool", default = false } },
    returns = { { name = "result", type = "string", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenTainted",
}

APIDefs["CalculateStringEditDistance"] = {
    key = "CalculateStringEditDistance",
    name = "CalculateStringEditDistance",
    category = "general",
    subcategory = "global",
    funcPath = "CalculateStringEditDistance",
    params = { { name = "firstString", type = "stringView", default = nil }, { name = "secondString", type = "stringView", default = nil } },
    returns = { { name = "distance", type = "number", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["CanBeRaidTarget"] = {
    key = "CanBeRaidTarget",
    name = "CanBeRaidTarget",
    category = "general",
    subcategory = "global",
    funcPath = "CanBeRaidTarget",
    params = { { name = "target", type = "UnitToken", default = "player" } },
    returns = { { name = "result", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["CanChangePlayerDifficulty"] = {
    key = "CanChangePlayerDifficulty",
    name = "CanChangePlayerDifficulty",
    category = "general",
    subcategory = "global",
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
    funcPath = "CanDualWield",
    params = {  },
    returns = { { name = "result", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["CanEjectPassengerFromSeat"] = {
    key = "CanEjectPassengerFromSeat",
    name = "CanEjectPassengerFromSeat",
    category = "general",
    subcategory = "global",
    funcPath = "CanEjectPassengerFromSeat",
    params = { { name = "virtualSeatIndex", type = "luaIndex", default = nil } },
    returns = { { name = "result", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["CanInspect"] = {
    key = "CanInspect",
    name = "CanInspect",
    category = "general",
    subcategory = "global",
    funcPath = "CanInspect",
    params = { { name = "targetGUID", type = "UnitToken", default = "player" } },
    returns = { { name = "result", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["CanLootUnit"] = {
    key = "CanLootUnit",
    name = "CanLootUnit",
    category = "general",
    subcategory = "global",
    funcPath = "CanLootUnit",
    params = { { name = "targetUnit", type = "WOWGUID", default = nil } },
    returns = { { name = "hasLoot", type = "bool", canBeSecret = false }, { name = "canLoot", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["CanMapChangeDifficulty"] = {
    key = "CanMapChangeDifficulty",
    name = "CanMapChangeDifficulty",
    category = "general",
    subcategory = "global",
    funcPath = "CanMapChangeDifficulty",
    params = { { name = "mapID", type = "number", default = nil } },
    returns = { { name = "canChange", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["CanShowResetInstances"] = {
    key = "CanShowResetInstances",
    name = "CanShowResetInstances",
    category = "general",
    subcategory = "global",
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
    funcPath = "CancelLogout",
    params = {  },
    returns = {  },
    midnightImpact = "NORMAL",
}

APIDefs["CancelPendingEquip"] = {
    key = "CancelPendingEquip",
    name = "CancelPendingEquip",
    category = "general",
    subcategory = "global",
    funcPath = "CancelPendingEquip",
    params = { { name = "index", type = "number", default = nil } },
    returns = {  },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["CancelPreloadingMovie"] = {
    key = "CancelPreloadingMovie",
    name = "CancelPreloadingMovie",
    category = "general",
    subcategory = "global",
    funcPath = "CancelPreloadingMovie",
    params = { { name = "movieId", type = "number", default = nil } },
    returns = {  },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["CancelTrade"] = {
    key = "CancelTrade",
    name = "CancelTrade",
    category = "general",
    subcategory = "global",
    funcPath = "CancelTrade",
    params = {  },
    returns = {  },
    midnightImpact = "NORMAL",
}

APIDefs["CaseAccentInsensitiveParse"] = {
    key = "CaseAccentInsensitiveParse",
    name = "CaseAccentInsensitiveParse",
    category = "general",
    subcategory = "global",
    funcPath = "CaseAccentInsensitiveParse",
    params = { { name = "name", type = "cstring", default = nil } },
    returns = { { name = "result", type = "string", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["CheckInteractDistance"] = {
    key = "CheckInteractDistance",
    name = "CheckInteractDistance",
    category = "general",
    subcategory = "global",
    funcPath = "CheckInteractDistance",
    params = { { name = "unitGUID", type = "UnitToken", default = "player" }, { name = "distIndex", type = "luaIndex", default = nil } },
    returns = { { name = "result", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["CheckTalentMasterDist"] = {
    key = "CheckTalentMasterDist",
    name = "CheckTalentMasterDist",
    category = "general",
    subcategory = "global",
    funcPath = "CheckTalentMasterDist",
    params = {  },
    returns = { { name = "result", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["CinematicFinished"] = {
    key = "CinematicFinished",
    name = "CinematicFinished",
    category = "general",
    subcategory = "global",
    funcPath = "CinematicFinished",
    params = { { name = "movieType", type = "CinematicType", default = nil }, { name = "userCanceled", type = "bool", default = false }, { name = "didError", type = "bool", default = false } },
    returns = {  },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["CinematicStarted"] = {
    key = "CinematicStarted",
    name = "CinematicStarted",
    category = "general",
    subcategory = "global",
    funcPath = "CinematicStarted",
    params = { { name = "movieType", type = "CinematicType", default = nil }, { name = "movieID", type = "number", default = nil }, { name = "canCancel", type = "bool", default = true } },
    returns = {  },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["ClassicExpansionAtLeast"] = {
    key = "ClassicExpansionAtLeast",
    name = "ClassicExpansionAtLeast",
    category = "general",
    subcategory = "global",
    funcPath = "ClassicExpansionAtLeast",
    params = { { name = "expansionLevel", type = "number", default = nil } },
    returns = { { name = "isAtLeast", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["ClassicExpansionAtMost"] = {
    key = "ClassicExpansionAtMost",
    name = "ClassicExpansionAtMost",
    category = "general",
    subcategory = "global",
    funcPath = "ClassicExpansionAtMost",
    params = { { name = "expansionLevel", type = "number", default = nil } },
    returns = { { name = "isAtMost", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["ClearCursor"] = {
    key = "ClearCursor",
    name = "ClearCursor",
    category = "general",
    subcategory = "global",
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
    funcPath = "ClearFocus",
    params = {  },
    returns = {  },
    midnightImpact = "NORMAL",
}

APIDefs["ClearOutage"] = {
    key = "ClearOutage",
    name = "ClearOutage",
    category = "general",
    subcategory = "global",
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
    funcPath = "ClearPendingBindConversionItem",
    params = {  },
    returns = {  },
    midnightImpact = "NORMAL",
}

APIDefs["ClearRaidMarker"] = {
    key = "ClearRaidMarker",
    name = "ClearRaidMarker",
    category = "general",
    subcategory = "global",
    funcPath = "ClearRaidMarker",
    params = { { name = "raidMarkerIndex", type = "luaIndex", default = nil } },
    returns = {  },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["ClearTarget"] = {
    key = "ClearTarget",
    name = "ClearTarget",
    category = "general",
    subcategory = "global",
    funcPath = "ClearTarget",
    params = {  },
    returns = { { name = "willMakeChange", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["ClosestGameObjectPosition"] = {
    key = "ClosestGameObjectPosition",
    name = "ClosestGameObjectPosition",
    category = "combat_midnight",
    subcategory = "global",
    funcPath = "ClosestGameObjectPosition",
    params = { { name = "gameObjectID", type = "number", default = nil } },
    returns = { { name = "xPos", type = "number", canBeSecret = true }, { name = "yPos", type = "number", canBeSecret = true }, { name = "distance", type = "number", canBeSecret = true } },
    midnightImpact = "HIGH",
    midnightNote = "Secret behavior: SecretReturns, SecretArguments=AllowedWhenUntainted",
}

APIDefs["ClosestUnitPosition"] = {
    key = "ClosestUnitPosition",
    name = "ClosestUnitPosition",
    category = "combat_midnight",
    subcategory = "global",
    funcPath = "ClosestUnitPosition",
    params = { { name = "creatureID", type = "number", default = nil } },
    returns = { { name = "xPos", type = "number", canBeSecret = true }, { name = "yPos", type = "number", canBeSecret = true }, { name = "distance", type = "number", canBeSecret = true } },
    midnightImpact = "HIGH",
    midnightNote = "Secret behavior: SecretReturns, SecretArguments=AllowedWhenUntainted",
}

APIDefs["ConfirmTalentWipe"] = {
    key = "ConfirmTalentWipe",
    name = "ConfirmTalentWipe",
    category = "general",
    subcategory = "global",
    funcPath = "ConfirmTalentWipe",
    params = {  },
    returns = {  },
    midnightImpact = "NORMAL",
}

APIDefs["ConsoleEcho"] = {
    key = "ConsoleEcho",
    name = "ConsoleEcho",
    category = "general",
    subcategory = "global",
    funcPath = "ConsoleEcho",
    params = { { name = "command", type = "cstring", default = nil }, { name = "addToHistory", type = "bool", default = false }, { name = "prefix", type = "cstring", default = nil } },
    returns = { { name = "result", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["ConsoleExec"] = {
    key = "ConsoleExec",
    name = "ConsoleExec",
    category = "general",
    subcategory = "global",
    funcPath = "ConsoleExec",
    params = { { name = "command", type = "cstring", default = nil }, { name = "addToHistory", type = "bool", default = false } },
    returns = { { name = "result", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["ConsoleGetAllCommands"] = {
    key = "ConsoleGetAllCommands",
    name = "ConsoleGetAllCommands",
    category = "general",
    subcategory = "global",
    funcPath = "ConsoleGetAllCommands",
    params = {  },
    returns = { { name = "commands", type = "table", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["ConsoleGetColorFromType"] = {
    key = "ConsoleGetColorFromType",
    name = "ConsoleGetColorFromType",
    category = "general",
    subcategory = "global",
    funcPath = "ConsoleGetColorFromType",
    params = { { name = "colorType", type = "ConsoleColorType", default = nil } },
    returns = { { name = "color", type = "colorRGB", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["ConsoleGetFontHeight"] = {
    key = "ConsoleGetFontHeight",
    name = "ConsoleGetFontHeight",
    category = "general",
    subcategory = "global",
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
    funcPath = "ConsoleIsActive",
    params = {  },
    returns = { { name = "consoleIsActive", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["ConsolePrintAllMatchingCommands"] = {
    key = "ConsolePrintAllMatchingCommands",
    name = "ConsolePrintAllMatchingCommands",
    category = "general",
    subcategory = "global",
    funcPath = "ConsolePrintAllMatchingCommands",
    params = { { name = "partialCommandText", type = "cstring", default = nil } },
    returns = {  },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["ConsoleSetFontHeight"] = {
    key = "ConsoleSetFontHeight",
    name = "ConsoleSetFontHeight",
    category = "general",
    subcategory = "global",
    funcPath = "ConsoleSetFontHeight",
    params = { { name = "fontHeightInPixels", type = "number", default = nil } },
    returns = {  },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["ConvertItemToBindToAccount"] = {
    key = "ConvertItemToBindToAccount",
    name = "ConvertItemToBindToAccount",
    category = "general",
    subcategory = "global",
    funcPath = "ConvertItemToBindToAccount",
    params = {  },
    returns = {  },
    midnightImpact = "NORMAL",
}

APIDefs["CopyToClipboard"] = {
    key = "CopyToClipboard",
    name = "CopyToClipboard",
    category = "general",
    subcategory = "global",
    funcPath = "CopyToClipboard",
    params = { { name = "text", type = "cstring", default = nil }, { name = "removeMarkup", type = "bool", default = false } },
    returns = { { name = "length", type = "number", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["CreateAbbreviateConfig"] = {
    key = "CreateAbbreviateConfig",
    name = "CreateAbbreviateConfig",
    category = "combat_midnight",
    subcategory = "global",
    funcPath = "CreateAbbreviateConfig",
    params = { { name = "data", type = "table", default = nil } },
    returns = { { name = "config", type = "AbbreviateConfig", canBeSecret = false } },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=NotAllowed",
}

APIDefs["CreateFontFamily"] = {
    key = "CreateFontFamily",
    name = "CreateFontFamily",
    category = "general",
    subcategory = "global",
    funcPath = "CreateFontFamily",
    params = { { name = "name", type = "cstring", default = nil }, { name = "members", type = "table", default = nil } },
    returns = { { name = "fontFamily", type = "SimpleFont", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["CreateFromMixins"] = {
    key = "CreateFromMixins",
    name = "CreateFromMixins",
    category = "general",
    subcategory = "global",
    funcPath = "CreateFromMixins",
    params = { { name = "mixins", type = "LuaValueVariant", default = nil } },
    returns = { { name = "object", type = "LuaValueVariant", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["CreateSecureDelegate"] = {
    key = "CreateSecureDelegate",
    name = "CreateSecureDelegate",
    category = "general",
    subcategory = "global",
    funcPath = "CreateSecureDelegate",
    params = { { name = "luaFunction", type = "LuaValueReference", default = nil } },
    returns = { { name = "secureDelegateFunction", type = "LuaValueReference", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["CreateUnitHealPredictionCalculator"] = {
    key = "CreateUnitHealPredictionCalculator",
    name = "CreateUnitHealPredictionCalculator",
    category = "general",
    subcategory = "global",
    funcPath = "CreateUnitHealPredictionCalculator",
    params = {  },
    returns = { { name = "healPredictionCalculator", type = "UnitHealPredictionCalculator", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["CreateWindow"] = {
    key = "CreateWindow",
    name = "CreateWindow",
    category = "general",
    subcategory = "global",
    funcPath = "CreateWindow",
    params = { { name = "popupStyle", type = "bool", default = true }, { name = "topMost", type = "bool", default = false } },
    returns = { { name = "window", type = "SimpleWindow", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["CursorHasItem"] = {
    key = "CursorHasItem",
    name = "CursorHasItem",
    category = "general",
    subcategory = "global",
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
    funcPath = "CursorHasSpell",
    params = {  },
    returns = { { name = "result", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["DeclineGuild"] = {
    key = "DeclineGuild",
    name = "DeclineGuild",
    category = "general",
    subcategory = "global",
    funcPath = "DeclineGuild",
    params = {  },
    returns = {  },
    midnightImpact = "NORMAL",
}

APIDefs["DeclineName"] = {
    key = "DeclineName",
    name = "DeclineName",
    category = "general",
    subcategory = "global",
    funcPath = "DeclineName",
    params = { { name = "name", type = "cstring", default = nil }, { name = "gender", type = "UnitSex", default = nil }, { name = "declensionSet", type = "luaIndex", default = nil } },
    returns = { { name = "declinedNames", type = "string", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["DeclineResurrect"] = {
    key = "DeclineResurrect",
    name = "DeclineResurrect",
    category = "general",
    subcategory = "global",
    funcPath = "DeclineResurrect",
    params = {  },
    returns = {  },
    midnightImpact = "NORMAL",
}

APIDefs["DeleteCursorItem"] = {
    key = "DeleteCursorItem",
    name = "DeleteCursorItem",
    category = "general",
    subcategory = "global",
    funcPath = "DeleteCursorItem",
    params = {  },
    returns = {  },
    midnightImpact = "NORMAL",
}

APIDefs["DestroyTotem"] = {
    key = "DestroyTotem",
    name = "DestroyTotem",
    category = "general",
    subcategory = "global",
    funcPath = "DestroyTotem",
    params = { { name = "slot", type = "luaIndex", default = nil } },
    returns = {  },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["Dismount"] = {
    key = "Dismount",
    name = "Dismount",
    category = "general",
    subcategory = "global",
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
    funcPath = "DoesCurrentLocaleSellExpansionLevels",
    params = {  },
    returns = { { name = "regionSellsExpansions", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["DropCursorMoney"] = {
    key = "DropCursorMoney",
    name = "DropCursorMoney",
    category = "general",
    subcategory = "global",
    funcPath = "DropCursorMoney",
    params = {  },
    returns = {  },
    midnightImpact = "NORMAL",
}

APIDefs["EjectPassengerFromSeat"] = {
    key = "EjectPassengerFromSeat",
    name = "EjectPassengerFromSeat",
    category = "general",
    subcategory = "global",
    funcPath = "EjectPassengerFromSeat",
    params = { { name = "virtualSeatIndex", type = "luaIndex", default = nil } },
    returns = {  },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["EquipCursorItem"] = {
    key = "EquipCursorItem",
    name = "EquipCursorItem",
    category = "general",
    subcategory = "global",
    funcPath = "EquipCursorItem",
    params = { { name = "slot", type = "luaIndex", default = nil } },
    returns = {  },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["EquipPendingItem"] = {
    key = "EquipPendingItem",
    name = "EquipPendingItem",
    category = "general",
    subcategory = "global",
    funcPath = "EquipPendingItem",
    params = { { name = "index", type = "number", default = nil } },
    returns = {  },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["FlashClientIcon"] = {
    key = "FlashClientIcon",
    name = "FlashClientIcon",
    category = "general",
    subcategory = "global",
    funcPath = "FlashClientIcon",
    params = { { name = "briefly", type = "bool", default = false } },
    returns = {  },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["FocusUnit"] = {
    key = "FocusUnit",
    name = "FocusUnit",
    category = "general",
    subcategory = "global",
    funcPath = "FocusUnit",
    params = { { name = "name", type = "cstring", default = "" } },
    returns = {  },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["FollowUnit"] = {
    key = "FollowUnit",
    name = "FollowUnit",
    category = "general",
    subcategory = "global",
    funcPath = "FollowUnit",
    params = { { name = "name", type = "cstring", default = "0" }, { name = "exactMatch", type = "bool", default = false } },
    returns = {  },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["ForceLogout"] = {
    key = "ForceLogout",
    name = "ForceLogout",
    category = "general",
    subcategory = "global",
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
    funcPath = "ForceQuit",
    params = {  },
    returns = {  },
    midnightImpact = "NORMAL",
}

APIDefs["GetAccountExpansionLevel"] = {
    key = "GetAccountExpansionLevel",
    name = "GetAccountExpansionLevel",
    category = "general",
    subcategory = "global",
    funcPath = "GetAccountExpansionLevel",
    params = {  },
    returns = { { name = "expansionLevel", type = "number", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["GetAddOnCPUUsage"] = {
    key = "GetAddOnCPUUsage",
    name = "GetAddOnCPUUsage",
    category = "general",
    subcategory = "global",
    funcPath = "GetAddOnCPUUsage",
    params = { { name = "name", type = "uiAddon", default = nil } },
    returns = { { name = "result", type = "number", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["GetAddOnMemoryUsage"] = {
    key = "GetAddOnMemoryUsage",
    name = "GetAddOnMemoryUsage",
    category = "general",
    subcategory = "global",
    funcPath = "GetAddOnMemoryUsage",
    params = { { name = "name", type = "uiAddon", default = nil } },
    returns = { { name = "result", type = "number", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["GetAllowLowLevelRaid"] = {
    key = "GetAllowLowLevelRaid",
    name = "GetAllowLowLevelRaid",
    category = "general",
    subcategory = "global",
    funcPath = "GetAllowLowLevelRaid",
    params = {  },
    returns = { { name = "result", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["GetAllowRecentAlliesSeeLocation"] = {
    key = "GetAllowRecentAlliesSeeLocation",
    name = "GetAllowRecentAlliesSeeLocation",
    category = "general",
    subcategory = "global",
    funcPath = "GetAllowRecentAlliesSeeLocation",
    params = {  },
    returns = { { name = "allowRecentAlliesSeeLocation", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["GetAreaSpiritHealerTime"] = {
    key = "GetAreaSpiritHealerTime",
    name = "GetAreaSpiritHealerTime",
    category = "general",
    subcategory = "global",
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
    funcPath = "GetAreaText",
    params = {  },
    returns = { { name = "text", type = "cstring", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["GetAttackPowerForStat"] = {
    key = "GetAttackPowerForStat",
    name = "GetAttackPowerForStat",
    category = "general",
    subcategory = "global",
    funcPath = "GetAttackPowerForStat",
    params = { { name = "stat", type = "luaIndex", default = nil }, { name = "value", type = "number", default = nil } },
    returns = { { name = "result", type = "number", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["GetAutoDeclineGuildInvites"] = {
    key = "GetAutoDeclineGuildInvites",
    name = "GetAutoDeclineGuildInvites",
    category = "general",
    subcategory = "global",
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
    funcPath = "GetAutoDeclineNeighborhoodInvites",
    params = {  },
    returns = { { name = "result", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["GetAvailableBandwidth"] = {
    key = "GetAvailableBandwidth",
    name = "GetAvailableBandwidth",
    category = "general",
    subcategory = "global",
    funcPath = "GetAvailableBandwidth",
    params = {  },
    returns = { { name = "result", type = "number", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["GetAvailableLocaleInfo"] = {
    key = "GetAvailableLocaleInfo",
    name = "GetAvailableLocaleInfo",
    category = "general",
    subcategory = "global",
    funcPath = "GetAvailableLocaleInfo",
    params = { { name = "ignoreLocaleRestrictions", type = "bool", default = false } },
    returns = { { name = "localeInfos", type = "table", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["GetAvailableLocales"] = {
    key = "GetAvailableLocales",
    name = "GetAvailableLocales",
    category = "general",
    subcategory = "global",
    funcPath = "GetAvailableLocales",
    params = { { name = "ignoreLocaleRestrictions", type = "bool", default = false } },
    returns = { { name = "localeName", type = "cstring", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["GetAvoidance"] = {
    key = "GetAvoidance",
    name = "GetAvoidance",
    category = "general",
    subcategory = "global",
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
    funcPath = "GetCallstackHeight",
    params = {  },
    returns = { { name = "height", type = "number", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["GetCameraFOVDefaults"] = {
    key = "GetCameraFOVDefaults",
    name = "GetCameraFOVDefaults",
    category = "general",
    subcategory = "global",
    funcPath = "GetCameraFOVDefaults",
    params = {  },
    returns = { { name = "fieldOfViewDegreesDefault", type = "number", canBeSecret = false }, { name = "fieldOfViewDegreesPlayerMin", type = "number", canBeSecret = false }, { name = "fieldOfViewDegreesPlayerMax", type = "number", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["GetCemeteryPreference"] = {
    key = "GetCemeteryPreference",
    name = "GetCemeteryPreference",
    category = "general",
    subcategory = "global",
    funcPath = "GetCemeteryPreference",
    params = {  },
    returns = { { name = "result", type = "number", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["GetClassicExpansionLevel"] = {
    key = "GetClassicExpansionLevel",
    name = "GetClassicExpansionLevel",
    category = "general",
    subcategory = "global",
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
    funcPath = "GetCollapsingStarCost",
    params = {  },
    returns = { { name = "cost", type = "number", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["GetCombatRating"] = {
    key = "GetCombatRating",
    name = "GetCombatRating",
    category = "general",
    subcategory = "global",
    funcPath = "GetCombatRating",
    params = { { name = "ratingIndex", type = "luaIndex", default = nil } },
    returns = { { name = "result", type = "number", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["GetCombatRatingBonus"] = {
    key = "GetCombatRatingBonus",
    name = "GetCombatRatingBonus",
    category = "general",
    subcategory = "global",
    funcPath = "GetCombatRatingBonus",
    params = { { name = "ratingIndex", type = "luaIndex", default = nil } },
    returns = { { name = "result", type = "number", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["GetCombatRatingBonusForCombatRatingValue"] = {
    key = "GetCombatRatingBonusForCombatRatingValue",
    name = "GetCombatRatingBonusForCombatRatingValue",
    category = "general",
    subcategory = "global",
    funcPath = "GetCombatRatingBonusForCombatRatingValue",
    params = { { name = "ratingIndex", type = "luaIndex", default = nil }, { name = "value", type = "number", default = nil } },
    returns = { { name = "result", type = "number", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["GetComboPoints"] = {
    key = "GetComboPoints",
    name = "GetComboPoints",
    category = "combat_midnight",
    subcategory = "global",
    funcPath = "GetComboPoints",
    params = { { name = "unit", type = "UnitToken", default = "player" }, { name = "target", type = "UnitToken", default = "player" } },
    returns = { { name = "result", type = "number", canBeSecret = false } },
    midnightImpact = "CONDITIONAL",
    midnightNote = "Secret behavior: SecretWhenUnitComboPointsRestricted, SecretArguments=AllowedWhenUntainted",
}

APIDefs["GetCorpseRecoveryDelay"] = {
    key = "GetCorpseRecoveryDelay",
    name = "GetCorpseRecoveryDelay",
    category = "general",
    subcategory = "global",
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
    funcPath = "GetCursorPosition",
    params = {  },
    returns = { { name = "posX", type = "number", canBeSecret = false }, { name = "posY", type = "number", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["GetDefaultScale"] = {
    key = "GetDefaultScale",
    name = "GetDefaultScale",
    category = "general",
    subcategory = "global",
    funcPath = "GetDefaultScale",
    params = {  },
    returns = { { name = "scale", type = "number", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["GetDifficultyInfo"] = {
    key = "GetDifficultyInfo",
    name = "GetDifficultyInfo",
    category = "general",
    subcategory = "global",
    funcPath = "GetDifficultyInfo",
    params = { { name = "difficultyID", type = "number", default = nil } },
    returns = { { name = "name", type = "cstring", canBeSecret = false }, { name = "instanceType", type = "cstring", canBeSecret = false }, { name = "isHeroic", type = "bool", canBeSecret = false }, { name = "isChallengeMode", type = "bool", canBeSecret = false }, { name = "displayHeroic", type = "bool", canBeSecret = false }, { name = "displayMythic", type = "bool", canBeSecret = false }, { name = "toggleDifficultyID", type = "number", canBeSecret = false }, { name = "isLFR", type = "bool", canBeSecret = false }, { name = "minPlayers", type = "number", canBeSecret = false }, { name = "maxPlayers", type = "number", canBeSecret = false }, { name = "isUserSelectable", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["GetDodgeChance"] = {
    key = "GetDodgeChance",
    name = "GetDodgeChance",
    category = "general",
    subcategory = "global",
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
    funcPath = "GetDodgeChanceFromAttribute",
    params = {  },
    returns = { { name = "result", type = "number", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["GetDownloadedPercentage"] = {
    key = "GetDownloadedPercentage",
    name = "GetDownloadedPercentage",
    category = "general",
    subcategory = "global",
    funcPath = "GetDownloadedPercentage",
    params = {  },
    returns = { { name = "result", type = "number", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["GetDungeonDifficultyID"] = {
    key = "GetDungeonDifficultyID",
    name = "GetDungeonDifficultyID",
    category = "general",
    subcategory = "global",
    funcPath = "GetDungeonDifficultyID",
    params = {  },
    returns = { { name = "result", type = "number", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["GetErrorCallstackHeight"] = {
    key = "GetErrorCallstackHeight",
    name = "GetErrorCallstackHeight",
    category = "general",
    subcategory = "global",
    funcPath = "GetErrorCallstackHeight",
    params = {  },
    returns = { { name = "height", type = "number", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["GetEventTime"] = {
    key = "GetEventTime",
    name = "GetEventTime",
    category = "general",
    subcategory = "global",
    funcPath = "GetEventTime",
    params = { { name = "eventProfileIndex", type = "number", default = nil } },
    returns = { { name = "totalElapsedTime", type = "number", canBeSecret = false }, { name = "numExecutedHandlers", type = "number", canBeSecret = false }, { name = "slowestHandlerName", type = "cstring", canBeSecret = false }, { name = "slowestHandlerTime", type = "number", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["GetExpansionDisplayInfo"] = {
    key = "GetExpansionDisplayInfo",
    name = "GetExpansionDisplayInfo",
    category = "general",
    subcategory = "global",
    funcPath = "GetExpansionDisplayInfo",
    params = { { name = "expansionLevel", type = "number", default = nil }, { name = "desiredReleaseType", type = "ReleaseType", default = nil } },
    returns = { { name = "info", type = "ExpansionDisplayInfo", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["GetExpansionForLevel"] = {
    key = "GetExpansionForLevel",
    name = "GetExpansionForLevel",
    category = "general",
    subcategory = "global",
    funcPath = "GetExpansionForLevel",
    params = { { name = "playerLevel", type = "number", default = nil } },
    returns = { { name = "expansionLevel", type = "number", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["GetExpansionLevel"] = {
    key = "GetExpansionLevel",
    name = "GetExpansionLevel",
    category = "general",
    subcategory = "global",
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
    funcPath = "GetExpertisePercent",
    params = {  },
    returns = { { name = "mainhandExpertisePercent", type = "number", canBeSecret = false }, { name = "offhandExpertisePercent", type = "number", canBeSecret = false }, { name = "rangedExpertisePercent", type = "number", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["GetFileIDFromPath"] = {
    key = "GetFileIDFromPath",
    name = "GetFileIDFromPath",
    category = "general",
    subcategory = "global",
    funcPath = "GetFileIDFromPath",
    params = { { name = "filePath", type = "cstring", default = nil } },
    returns = { { name = "fileID", type = "fileID", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["GetFileStreamingStatus"] = {
    key = "GetFileStreamingStatus",
    name = "GetFileStreamingStatus",
    category = "general",
    subcategory = "global",
    funcPath = "GetFileStreamingStatus",
    params = {  },
    returns = { { name = "result", type = "number", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["GetFontInfo"] = {
    key = "GetFontInfo",
    name = "GetFontInfo",
    category = "general",
    subcategory = "global",
    funcPath = "GetFontInfo",
    params = { { name = "fontObject", type = "SimpleFont", default = nil } },
    returns = { { name = "info", type = "FontScriptInfo", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["GetFonts"] = {
    key = "GetFonts",
    name = "GetFonts",
    category = "general",
    subcategory = "global",
    funcPath = "GetFonts",
    params = {  },
    returns = { { name = "fontNames", type = "table", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["GetFrameCPUUsage"] = {
    key = "GetFrameCPUUsage",
    name = "GetFrameCPUUsage",
    category = "general",
    subcategory = "global",
    funcPath = "GetFrameCPUUsage",
    params = { { name = "frame", type = "SimpleFrame", default = nil }, { name = "includeChildren", type = "bool", default = false } },
    returns = { { name = "call_time", type = "number", canBeSecret = false }, { name = "call_count", type = "number", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["GetFramerate"] = {
    key = "GetFramerate",
    name = "GetFramerate",
    category = "general",
    subcategory = "global",
    funcPath = "GetFramerate",
    params = {  },
    returns = { { name = "framerate", type = "number", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["GetGameMessageInfo"] = {
    key = "GetGameMessageInfo",
    name = "GetGameMessageInfo",
    category = "general",
    subcategory = "global",
    funcPath = "GetGameMessageInfo",
    params = { { name = "gameErrorIndex", type = "luaIndex", default = nil } },
    returns = { { name = "errorName", type = "cstring", canBeSecret = false }, { name = "soundKitID", type = "number", canBeSecret = false }, { name = "voiceID", type = "number", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["GetGameTime"] = {
    key = "GetGameTime",
    name = "GetGameTime",
    category = "general",
    subcategory = "global",
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
    funcPath = "GetHaste",
    params = {  },
    returns = { { name = "result", type = "number", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["GetHitModifier"] = {
    key = "GetHitModifier",
    name = "GetHitModifier",
    category = "general",
    subcategory = "global",
    funcPath = "GetHitModifier",
    params = {  },
    returns = { { name = "result", type = "number", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["GetInstanceBootTimeRemaining"] = {
    key = "GetInstanceBootTimeRemaining",
    name = "GetInstanceBootTimeRemaining",
    category = "general",
    subcategory = "global",
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
    funcPath = "GetInstanceLockTimeRemaining",
    params = {  },
    returns = { { name = "timeLeft", type = "number", canBeSecret = false }, { name = "extending", type = "bool", canBeSecret = false }, { name = "encountersTotal", type = "number", canBeSecret = false }, { name = "encountersCompleted", type = "number", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["GetInstanceLockTimeRemainingEncounter"] = {
    key = "GetInstanceLockTimeRemainingEncounter",
    name = "GetInstanceLockTimeRemainingEncounter",
    category = "general",
    subcategory = "global",
    funcPath = "GetInstanceLockTimeRemainingEncounter",
    params = { { name = "encounterIndex", type = "luaIndex", default = nil } },
    returns = { { name = "encounterName", type = "cstring", canBeSecret = false }, { name = "texture", type = "cstring", canBeSecret = false }, { name = "isKilled", type = "bool", canBeSecret = false }, { name = "ineligible", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["GetJailersTowerLevel"] = {
    key = "GetJailersTowerLevel",
    name = "GetJailersTowerLevel",
    category = "general",
    subcategory = "global",
    funcPath = "GetJailersTowerLevel",
    params = {  },
    returns = { { name = "result", type = "number", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["GetLegacyRaidDifficultyID"] = {
    key = "GetLegacyRaidDifficultyID",
    name = "GetLegacyRaidDifficultyID",
    category = "general",
    subcategory = "global",
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
    funcPath = "GetLifesteal",
    params = {  },
    returns = { { name = "result", type = "number", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["GetLocalGameTime"] = {
    key = "GetLocalGameTime",
    name = "GetLocalGameTime",
    category = "general",
    subcategory = "global",
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
    funcPath = "GetLocale",
    params = {  },
    returns = { { name = "localeName", type = "cstring", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["GetLootSpecialization"] = {
    key = "GetLootSpecialization",
    name = "GetLootSpecialization",
    category = "general",
    subcategory = "global",
    funcPath = "GetLootSpecialization",
    params = {  },
    returns = { { name = "specializationID", type = "number", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["GetManaRegen"] = {
    key = "GetManaRegen",
    name = "GetManaRegen",
    category = "general",
    subcategory = "global",
    funcPath = "GetManaRegen",
    params = {  },
    returns = { { name = "baseManaRegen", type = "number", canBeSecret = false }, { name = "castingManaRegen", type = "number", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["GetMastery"] = {
    key = "GetMastery",
    name = "GetMastery",
    category = "general",
    subcategory = "global",
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
    funcPath = "GetMasteryEffect",
    params = {  },
    returns = { { name = "masteryEffect", type = "number", canBeSecret = false }, { name = "bonusCoefficient", type = "number", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["GetMaxCombatRatingBonus"] = {
    key = "GetMaxCombatRatingBonus",
    name = "GetMaxCombatRatingBonus",
    category = "general",
    subcategory = "global",
    funcPath = "GetMaxCombatRatingBonus",
    params = { { name = "ratingIndex", type = "luaIndex", default = nil } },
    returns = { { name = "result", type = "number", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["GetMaxLevelForExpansionLevel"] = {
    key = "GetMaxLevelForExpansionLevel",
    name = "GetMaxLevelForExpansionLevel",
    category = "general",
    subcategory = "global",
    funcPath = "GetMaxLevelForExpansionLevel",
    params = { { name = "expansionLevel", type = "number", default = nil } },
    returns = { { name = "maxLevel", type = "number", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["GetMaxLevelForLatestExpansion"] = {
    key = "GetMaxLevelForLatestExpansion",
    name = "GetMaxLevelForLatestExpansion",
    category = "general",
    subcategory = "global",
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
    funcPath = "GetMaxPlayerLevel",
    params = {  },
    returns = { { name = "maxPlayerLevel", type = "number", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["GetMaximumExpansionLevel"] = {
    key = "GetMaximumExpansionLevel",
    name = "GetMaximumExpansionLevel",
    category = "general",
    subcategory = "global",
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
    funcPath = "GetMeleeHaste",
    params = {  },
    returns = { { name = "result", type = "number", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["GetMinimapZoneText"] = {
    key = "GetMinimapZoneText",
    name = "GetMinimapZoneText",
    category = "general",
    subcategory = "global",
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
    funcPath = "GetMinimumExpansionLevel",
    params = {  },
    returns = { { name = "expansionLevel", type = "number", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["GetMirrorTimerInfo"] = {
    key = "GetMirrorTimerInfo",
    name = "GetMirrorTimerInfo",
    category = "general",
    subcategory = "global",
    funcPath = "GetMirrorTimerInfo",
    params = { { name = "timerIndex", type = "luaIndex", default = nil } },
    returns = { { name = "name", type = "cstring", canBeSecret = false }, { name = "startValue", type = "number", canBeSecret = false }, { name = "maxValue", type = "number", canBeSecret = false }, { name = "scale", type = "number", canBeSecret = false }, { name = "paused", type = "number", canBeSecret = false }, { name = "label", type = "cstring", canBeSecret = false }, { name = "spellID", type = "number", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["GetMirrorTimerProgress"] = {
    key = "GetMirrorTimerProgress",
    name = "GetMirrorTimerProgress",
    category = "general",
    subcategory = "global",
    funcPath = "GetMirrorTimerProgress",
    params = { { name = "timerName", type = "cstring", default = nil } },
    returns = { { name = "progress", type = "number", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["GetModResilienceDamageReduction"] = {
    key = "GetModResilienceDamageReduction",
    name = "GetModResilienceDamageReduction",
    category = "general",
    subcategory = "global",
    funcPath = "GetModResilienceDamageReduction",
    params = {  },
    returns = { { name = "result", type = "number", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["GetMoney"] = {
    key = "GetMoney",
    name = "GetMoney",
    category = "general",
    subcategory = "global",
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
    funcPath = "GetMouseButtonClicked",
    params = {  },
    returns = { { name = "buttonName", type = "cstring", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["GetMouseButtonName"] = {
    key = "GetMouseButtonName",
    name = "GetMouseButtonName",
    category = "general",
    subcategory = "global",
    funcPath = "GetMouseButtonName",
    params = { { name = "button", type = "mouseButton", default = nil } },
    returns = { { name = "buttonName", type = "cstring", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["GetMouseFoci"] = {
    key = "GetMouseFoci",
    name = "GetMouseFoci",
    category = "general",
    subcategory = "global",
    funcPath = "GetMouseFoci",
    params = {  },
    returns = { { name = "region", type = "table", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["GetMovieDownloadProgress"] = {
    key = "GetMovieDownloadProgress",
    name = "GetMovieDownloadProgress",
    category = "general",
    subcategory = "global",
    funcPath = "GetMovieDownloadProgress",
    params = { { name = "movieId", type = "number", default = nil } },
    returns = { { name = "inProgress", type = "bool", canBeSecret = false }, { name = "downloaded", type = "BigUInteger", canBeSecret = false }, { name = "total", type = "BigUInteger", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["GetNativeRealmID"] = {
    key = "GetNativeRealmID",
    name = "GetNativeRealmID",
    category = "general",
    subcategory = "global",
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
    funcPath = "GetNormalizedRealmName",
    params = {  },
    returns = { { name = "result", type = "cstring", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["GetNumDeclensionSets"] = {
    key = "GetNumDeclensionSets",
    name = "GetNumDeclensionSets",
    category = "general",
    subcategory = "global",
    funcPath = "GetNumDeclensionSets",
    params = { { name = "name", type = "cstring", default = nil }, { name = "gender", type = "UnitSex", default = nil } },
    returns = { { name = "numDeclensionSets", type = "number", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["GetNumExpansions"] = {
    key = "GetNumExpansions",
    name = "GetNumExpansions",
    category = "general",
    subcategory = "global",
    funcPath = "GetNumExpansions",
    params = {  },
    returns = { { name = "numExpansions", type = "number", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["GetNumTitles"] = {
    key = "GetNumTitles",
    name = "GetNumTitles",
    category = "general",
    subcategory = "global",
    funcPath = "GetNumTitles",
    params = {  },
    returns = { { name = "result", type = "number", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["GetOSLocale"] = {
    key = "GetOSLocale",
    name = "GetOSLocale",
    category = "general",
    subcategory = "global",
    funcPath = "GetOSLocale",
    params = {  },
    returns = { { name = "localeName", type = "cstring", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["GetOverrideAPBySpellPower"] = {
    key = "GetOverrideAPBySpellPower",
    name = "GetOverrideAPBySpellPower",
    category = "general",
    subcategory = "global",
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
    funcPath = "GetParryChanceFromAttribute",
    params = {  },
    returns = { { name = "result", type = "number", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["GetPetMeleeHaste"] = {
    key = "GetPetMeleeHaste",
    name = "GetPetMeleeHaste",
    category = "general",
    subcategory = "global",
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
    funcPath = "GetPhysicalScreenSize",
    params = {  },
    returns = { { name = "sizeX", type = "number", canBeSecret = false }, { name = "sizeY", type = "number", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["GetPlayerFacing"] = {
    key = "GetPlayerFacing",
    name = "GetPlayerFacing",
    category = "general",
    subcategory = "global",
    funcPath = "GetPlayerFacing",
    params = {  },
    returns = { { name = "result", type = "number", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["GetPlayerInfoByGUID"] = {
    key = "GetPlayerInfoByGUID",
    name = "GetPlayerInfoByGUID",
    category = "general",
    subcategory = "global",
    funcPath = "GetPlayerInfoByGUID",
    params = { { name = "guid", type = "WOWGUID", default = nil } },
    returns = { { name = "localizedClass", type = "cstring", canBeSecret = false }, { name = "englishClass", type = "cstring", canBeSecret = false }, { name = "localizedRace", type = "cstring", canBeSecret = false }, { name = "englishRace", type = "cstring", canBeSecret = false }, { name = "sex", type = "number", canBeSecret = false }, { name = "name", type = "cstring", canBeSecret = false }, { name = "realmName", type = "cstring", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenTainted",
}

APIDefs["GetPowerRegen"] = {
    key = "GetPowerRegen",
    name = "GetPowerRegen",
    category = "general",
    subcategory = "global",
    funcPath = "GetPowerRegen",
    params = {  },
    returns = { { name = "basePowerRegen", type = "number", canBeSecret = false }, { name = "castingPowerRegen", type = "number", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["GetPowerRegenForPowerType"] = {
    key = "GetPowerRegenForPowerType",
    name = "GetPowerRegenForPowerType",
    category = "general",
    subcategory = "global",
    funcPath = "GetPowerRegenForPowerType",
    params = { { name = "powerType", type = "number", default = nil } },
    returns = { { name = "basePowerRegen", type = "number", canBeSecret = false }, { name = "castingPowerRegen", type = "number", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["GetPvpPowerDamage"] = {
    key = "GetPvpPowerDamage",
    name = "GetPvpPowerDamage",
    category = "general",
    subcategory = "global",
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
    funcPath = "GetPvpPowerHealing",
    params = {  },
    returns = { { name = "result", type = "number", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["GetRaidDifficultyID"] = {
    key = "GetRaidDifficultyID",
    name = "GetRaidDifficultyID",
    category = "general",
    subcategory = "global",
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
    funcPath = "GetRaidTargetIndex",
    params = { { name = "target", type = "UnitToken", default = "player" } },
    returns = { { name = "result", type = "luaIndex", canBeSecret = true } },
    midnightImpact = "HIGH",
    midnightNote = "Secret behavior: SecretReturns, SecretArguments=AllowedWhenUntainted",
}

APIDefs["GetRangedCritChance"] = {
    key = "GetRangedCritChance",
    name = "GetRangedCritChance",
    category = "general",
    subcategory = "global",
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
    funcPath = "GetRangedHaste",
    params = {  },
    returns = { { name = "result", type = "number", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["GetRealZoneText"] = {
    key = "GetRealZoneText",
    name = "GetRealZoneText",
    category = "general",
    subcategory = "global",
    funcPath = "GetRealZoneText",
    params = { { name = "mapID", type = "number", default = nil } },
    returns = { { name = "text", type = "cstring", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["GetRealmID"] = {
    key = "GetRealmID",
    name = "GetRealmID",
    category = "general",
    subcategory = "global",
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
    funcPath = "GetRealmName",
    params = {  },
    returns = { { name = "realmName", type = "cstring", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["GetReleaseTimeRemaining"] = {
    key = "GetReleaseTimeRemaining",
    name = "GetReleaseTimeRemaining",
    category = "general",
    subcategory = "global",
    funcPath = "GetReleaseTimeRemaining",
    params = {  },
    returns = { { name = "result", type = "number", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["GetResSicknessDuration"] = {
    key = "GetResSicknessDuration",
    name = "GetResSicknessDuration",
    category = "general",
    subcategory = "global",
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
    funcPath = "GetRestrictedAccountData",
    params = {  },
    returns = { { name = "maxLevel", type = "number", canBeSecret = false }, { name = "maxMoney", type = "WOWMONEY", canBeSecret = false }, { name = "professionCap", type = "number", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["GetRuneCooldown"] = {
    key = "GetRuneCooldown",
    name = "GetRuneCooldown",
    category = "general",
    subcategory = "global",
    funcPath = "GetRuneCooldown",
    params = { { name = "runeIndex", type = "luaIndex", default = nil } },
    returns = { { name = "startTime", type = "number", canBeSecret = false }, { name = "duration", type = "number", canBeSecret = false }, { name = "isRuneReady", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["GetRuneCount"] = {
    key = "GetRuneCount",
    name = "GetRuneCount",
    category = "general",
    subcategory = "global",
    funcPath = "GetRuneCount",
    params = { { name = "runeIndex", type = "luaIndex", default = nil } },
    returns = { { name = "result", type = "number", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["GetScreenDPIScale"] = {
    key = "GetScreenDPIScale",
    name = "GetScreenDPIScale",
    category = "general",
    subcategory = "global",
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
    funcPath = "GetScreenWidth",
    params = {  },
    returns = { { name = "width", type = "number", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["GetSecondsUntilParentalControlsKick"] = {
    key = "GetSecondsUntilParentalControlsKick",
    name = "GetSecondsUntilParentalControlsKick",
    category = "general",
    subcategory = "global",
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
    funcPath = "GetSessionTime",
    params = {  },
    returns = { { name = "time", type = "number", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["GetSheathState"] = {
    key = "GetSheathState",
    name = "GetSheathState",
    category = "general",
    subcategory = "global",
    funcPath = "GetSheathState",
    params = {  },
    returns = { { name = "result", type = "number", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["GetShieldBlock"] = {
    key = "GetShieldBlock",
    name = "GetShieldBlock",
    category = "general",
    subcategory = "global",
    funcPath = "GetShieldBlock",
    params = {  },
    returns = { { name = "result", type = "number", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["GetSourceLocation"] = {
    key = "GetSourceLocation",
    name = "GetSourceLocation",
    category = "general",
    subcategory = "global",
    funcPath = "GetSourceLocation",
    params = {  },
    returns = { { name = "location", type = "string", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["GetSpecializationInfoForClassID"] = {
    key = "GetSpecializationInfoForClassID",
    name = "GetSpecializationInfoForClassID",
    category = "general",
    subcategory = "global",
    funcPath = "GetSpecializationInfoForClassID",
    params = { { name = "classID", type = "number", default = nil }, { name = "index", type = "luaIndex", default = nil }, { name = "gender", type = "UnitSex", default = nil } },
    returns = { { name = "id", type = "number", canBeSecret = false }, { name = "name", type = "cstring", canBeSecret = false }, { name = "description", type = "string", canBeSecret = false }, { name = "icon", type = "fileID", canBeSecret = false }, { name = "role", type = "cstring", canBeSecret = false }, { name = "recommended", type = "bool", canBeSecret = false }, { name = "allowedForBoost", type = "bool", canBeSecret = false }, { name = "masterySpell1", type = "number", canBeSecret = false }, { name = "masterySpell2", type = "number", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["GetSpecializationInfoForSpecID"] = {
    key = "GetSpecializationInfoForSpecID",
    name = "GetSpecializationInfoForSpecID",
    category = "general",
    subcategory = "global",
    funcPath = "GetSpecializationInfoForSpecID",
    params = { { name = "specID", type = "number", default = nil }, { name = "gender", type = "UnitSex", default = nil } },
    returns = { { name = "id", type = "number", canBeSecret = false }, { name = "name", type = "cstring", canBeSecret = false }, { name = "description", type = "string", canBeSecret = false }, { name = "icon", type = "fileID", canBeSecret = false }, { name = "role", type = "cstring", canBeSecret = false }, { name = "recommended", type = "bool", canBeSecret = false }, { name = "allowedForBoost", type = "bool", canBeSecret = false }, { name = "masterySpell1", type = "number", canBeSecret = false }, { name = "masterySpell2", type = "number", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["GetSpecializationNameForSpecID"] = {
    key = "GetSpecializationNameForSpecID",
    name = "GetSpecializationNameForSpecID",
    category = "general",
    subcategory = "global",
    funcPath = "GetSpecializationNameForSpecID",
    params = { { name = "specID", type = "number", default = nil }, { name = "gender", type = "UnitSex", default = nil } },
    returns = { { name = "name", type = "cstring", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["GetSpeed"] = {
    key = "GetSpeed",
    name = "GetSpeed",
    category = "general",
    subcategory = "global",
    funcPath = "GetSpeed",
    params = {  },
    returns = { { name = "result", type = "number", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["GetSpellBonusDamage"] = {
    key = "GetSpellBonusDamage",
    name = "GetSpellBonusDamage",
    category = "general",
    subcategory = "global",
    funcPath = "GetSpellBonusDamage",
    params = { { name = "school", type = "luaIndex", default = nil } },
    returns = { { name = "result", type = "number", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["GetSpellBonusHealing"] = {
    key = "GetSpellBonusHealing",
    name = "GetSpellBonusHealing",
    category = "general",
    subcategory = "global",
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
    funcPath = "GetSpellPenetration",
    params = {  },
    returns = { { name = "result", type = "number", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["GetSturdiness"] = {
    key = "GetSturdiness",
    name = "GetSturdiness",
    category = "general",
    subcategory = "global",
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
    funcPath = "GetSubZoneText",
    params = {  },
    returns = { { name = "text", type = "cstring", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["GetTaxiBenchmarkMode"] = {
    key = "GetTaxiBenchmarkMode",
    name = "GetTaxiBenchmarkMode",
    category = "general",
    subcategory = "global",
    funcPath = "GetTaxiBenchmarkMode",
    params = {  },
    returns = { { name = "result", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["GetThreatStatusColor"] = {
    key = "GetThreatStatusColor",
    name = "GetThreatStatusColor",
    category = "general",
    subcategory = "global",
    funcPath = "GetThreatStatusColor",
    params = { { name = "gameErrorIndex", type = "number", default = nil } },
    returns = { { name = "colorR", type = "number", canBeSecret = false }, { name = "colorG", type = "number", canBeSecret = false }, { name = "colorB", type = "number", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["GetTickTime"] = {
    key = "GetTickTime",
    name = "GetTickTime",
    category = "general",
    subcategory = "global",
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
    funcPath = "GetTimePreciseSec",
    params = {  },
    returns = { { name = "time", type = "number", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["GetTitleName"] = {
    key = "GetTitleName",
    name = "GetTitleName",
    category = "general",
    subcategory = "global",
    funcPath = "GetTitleName",
    params = { { name = "titleMaskID", type = "number", default = nil } },
    returns = { { name = "titleString", type = "string", canBeSecret = false }, { name = "playerTitle", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["GetTotemCannotDismiss"] = {
    key = "GetTotemCannotDismiss",
    name = "GetTotemCannotDismiss",
    category = "general",
    subcategory = "global",
    funcPath = "GetTotemCannotDismiss",
    params = { { name = "slot", type = "luaIndex", default = nil } },
    returns = { { name = "cannotDismiss", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["GetTotemInfo"] = {
    key = "GetTotemInfo",
    name = "GetTotemInfo",
    category = "general",
    subcategory = "global",
    funcPath = "GetTotemInfo",
    params = { { name = "slot", type = "luaIndex", default = nil } },
    returns = { { name = "haveTotem", type = "bool", canBeSecret = false }, { name = "totemName", type = "cstring", canBeSecret = false }, { name = "startTime", type = "number", canBeSecret = false }, { name = "duration", type = "number", canBeSecret = false }, { name = "icon", type = "fileID", canBeSecret = false }, { name = "modRate", type = "number", canBeSecret = false }, { name = "spellID", type = "number", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["GetTotemTimeLeft"] = {
    key = "GetTotemTimeLeft",
    name = "GetTotemTimeLeft",
    category = "general",
    subcategory = "global",
    funcPath = "GetTotemTimeLeft",
    params = { { name = "slot", type = "luaIndex", default = nil } },
    returns = { { name = "timeLeft", type = "number", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["GetUICameraInfo"] = {
    key = "GetUICameraInfo",
    name = "GetUICameraInfo",
    category = "general",
    subcategory = "global",
    funcPath = "GetUICameraInfo",
    params = { { name = "uiCameraID", type = "number", default = nil } },
    returns = { { name = "posX", type = "number", canBeSecret = false }, { name = "posY", type = "number", canBeSecret = false }, { name = "posZ", type = "number", canBeSecret = false }, { name = "lookAtX", type = "number", canBeSecret = false }, { name = "lookAtY", type = "number", canBeSecret = false }, { name = "lookAtZ", type = "number", canBeSecret = false }, { name = "animID", type = "number", canBeSecret = false }, { name = "animVariation", type = "number", canBeSecret = false }, { name = "animFrame", type = "number", canBeSecret = false }, { name = "useModelCenter", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["GetUnitChargedPowerPoints"] = {
    key = "GetUnitChargedPowerPoints",
    name = "GetUnitChargedPowerPoints",
    category = "combat_midnight",
    subcategory = "global",
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
    funcPath = "GetUnitEmpowerStageDuration",
    params = { { name = "unit", type = "UnitToken", default = "player" }, { name = "index", type = "number", default = nil } },
    returns = { { name = "duration", type = "number", canBeSecret = false } },
    midnightImpact = "CONDITIONAL",
    midnightNote = "Secret behavior: SecretWhenUnitSpellCastingRestricted, SecretArguments=AllowedWhenUntainted",
}

APIDefs["GetUnitHealthModifier"] = {
    key = "GetUnitHealthModifier",
    name = "GetUnitHealthModifier",
    category = "general",
    subcategory = "global",
    funcPath = "GetUnitHealthModifier",
    params = { { name = "unit", type = "UnitToken", default = "player" } },
    returns = { { name = "result", type = "number", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["GetUnitMaxHealthModifier"] = {
    key = "GetUnitMaxHealthModifier",
    name = "GetUnitMaxHealthModifier",
    category = "general",
    subcategory = "global",
    funcPath = "GetUnitMaxHealthModifier",
    params = { { name = "unit", type = "UnitToken", default = "player" } },
    returns = { { name = "result", type = "number", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["GetUnitPowerBarInfo"] = {
    key = "GetUnitPowerBarInfo",
    name = "GetUnitPowerBarInfo",
    category = "general",
    subcategory = "global",
    funcPath = "GetUnitPowerBarInfo",
    params = { { name = "unitToken", type = "UnitToken", default = "player" } },
    returns = { { name = "info", type = "UnitPowerBarInfo", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["GetUnitPowerBarInfoByID"] = {
    key = "GetUnitPowerBarInfoByID",
    name = "GetUnitPowerBarInfoByID",
    category = "general",
    subcategory = "global",
    funcPath = "GetUnitPowerBarInfoByID",
    params = { { name = "barID", type = "number", default = nil } },
    returns = { { name = "info", type = "UnitPowerBarInfo", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["GetUnitPowerBarStrings"] = {
    key = "GetUnitPowerBarStrings",
    name = "GetUnitPowerBarStrings",
    category = "general",
    subcategory = "global",
    funcPath = "GetUnitPowerBarStrings",
    params = { { name = "unitToken", type = "UnitToken", default = "player" } },
    returns = { { name = "name", type = "cstring", canBeSecret = false }, { name = "tooltip", type = "cstring", canBeSecret = false }, { name = "cost", type = "cstring", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["GetUnitPowerBarStringsByID"] = {
    key = "GetUnitPowerBarStringsByID",
    name = "GetUnitPowerBarStringsByID",
    category = "general",
    subcategory = "global",
    funcPath = "GetUnitPowerBarStringsByID",
    params = { { name = "barID", type = "number", default = nil } },
    returns = { { name = "name", type = "cstring", canBeSecret = false }, { name = "tooltip", type = "cstring", canBeSecret = false }, { name = "cost", type = "cstring", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["GetUnitPowerBarTextureInfo"] = {
    key = "GetUnitPowerBarTextureInfo",
    name = "GetUnitPowerBarTextureInfo",
    category = "general",
    subcategory = "global",
    funcPath = "GetUnitPowerBarTextureInfo",
    params = { { name = "unitToken", type = "UnitToken", default = "player" }, { name = "textureIndex", type = "luaIndex", default = nil }, { name = "timerIndex", type = "luaIndex", default = nil } },
    returns = { { name = "texture", type = "fileID", canBeSecret = false }, { name = "colorR", type = "number", canBeSecret = false }, { name = "colorG", type = "number", canBeSecret = false }, { name = "colorB", type = "number", canBeSecret = false }, { name = "colorA", type = "number", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["GetUnitPowerBarTextureInfoByID"] = {
    key = "GetUnitPowerBarTextureInfoByID",
    name = "GetUnitPowerBarTextureInfoByID",
    category = "general",
    subcategory = "global",
    funcPath = "GetUnitPowerBarTextureInfoByID",
    params = { { name = "barID", type = "number", default = nil }, { name = "textureIndex", type = "luaIndex", default = nil } },
    returns = { { name = "texture", type = "fileID", canBeSecret = false }, { name = "colorR", type = "number", canBeSecret = false }, { name = "colorG", type = "number", canBeSecret = false }, { name = "colorB", type = "number", canBeSecret = false }, { name = "colorA", type = "number", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["GetUnitPowerModifier"] = {
    key = "GetUnitPowerModifier",
    name = "GetUnitPowerModifier",
    category = "general",
    subcategory = "global",
    funcPath = "GetUnitPowerModifier",
    params = { { name = "unit", type = "UnitToken", default = "player" } },
    returns = { { name = "result", type = "number", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["GetUnitSpeed"] = {
    key = "GetUnitSpeed",
    name = "GetUnitSpeed",
    category = "general",
    subcategory = "global",
    funcPath = "GetUnitSpeed",
    params = { { name = "unit", type = "UnitToken", default = "player" } },
    returns = { { name = "currentSpeed", type = "number", canBeSecret = false }, { name = "runSpeed", type = "number", canBeSecret = false }, { name = "flightSpeed", type = "number", canBeSecret = false }, { name = "swimSpeed", type = "number", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["GetUnitTotalModifiedMaxHealthPercent"] = {
    key = "GetUnitTotalModifiedMaxHealthPercent",
    name = "GetUnitTotalModifiedMaxHealthPercent",
    category = "general",
    subcategory = "global",
    funcPath = "GetUnitTotalModifiedMaxHealthPercent",
    params = { { name = "unit", type = "UnitToken", default = "player" } },
    returns = { { name = "result", type = "number", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["GetUpgradeExpansionLevel"] = {
    key = "GetUpgradeExpansionLevel",
    name = "GetUpgradeExpansionLevel",
    category = "general",
    subcategory = "global",
    funcPath = "GetUpgradeExpansionLevel",
    params = {  },
    returns = { { name = "upgradeExpansionLevel", type = "number", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["GetVehicleUIIndicator"] = {
    key = "GetVehicleUIIndicator",
    name = "GetVehicleUIIndicator",
    category = "general",
    subcategory = "global",
    funcPath = "GetVehicleUIIndicator",
    params = { { name = "vehicleIndicatorID", type = "number", default = nil } },
    returns = { { name = "backgroundTextureID", type = "fileID", canBeSecret = false }, { name = "numSeatIndicators", type = "number", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["GetVehicleUIIndicatorSeat"] = {
    key = "GetVehicleUIIndicatorSeat",
    name = "GetVehicleUIIndicatorSeat",
    category = "general",
    subcategory = "global",
    funcPath = "GetVehicleUIIndicatorSeat",
    params = { { name = "vehicleIndicatorID", type = "number", default = nil }, { name = "indicatorSeatIndex", type = "luaIndex", default = nil } },
    returns = { { name = "virtualSeatIndex", type = "number", canBeSecret = false }, { name = "xPos", type = "number", canBeSecret = false }, { name = "yPos", type = "number", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["GetVersatilityBonus"] = {
    key = "GetVersatilityBonus",
    name = "GetVersatilityBonus",
    category = "general",
    subcategory = "global",
    funcPath = "GetVersatilityBonus",
    params = { { name = "combatRating", type = "luaIndex", default = nil } },
    returns = { { name = "result", type = "number", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["GetXPExhaustion"] = {
    key = "GetXPExhaustion",
    name = "GetXPExhaustion",
    category = "general",
    subcategory = "global",
    funcPath = "GetXPExhaustion",
    params = {  },
    returns = { { name = "result", type = "number", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["GetZoneText"] = {
    key = "GetZoneText",
    name = "GetZoneText",
    category = "general",
    subcategory = "global",
    funcPath = "GetZoneText",
    params = {  },
    returns = { { name = "text", type = "cstring", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["HasAPEffectsSpellPower"] = {
    key = "HasAPEffectsSpellPower",
    name = "HasAPEffectsSpellPower",
    category = "general",
    subcategory = "global",
    funcPath = "HasAPEffectsSpellPower",
    params = {  },
    returns = { { name = "result", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["HasDualWieldPenalty"] = {
    key = "HasDualWieldPenalty",
    name = "HasDualWieldPenalty",
    category = "general",
    subcategory = "global",
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
    funcPath = "HasLootSpecializations",
    params = {  },
    returns = { { name = "hasLootSpecializations", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["HasNoReleaseAura"] = {
    key = "HasNoReleaseAura",
    name = "HasNoReleaseAura",
    category = "general",
    subcategory = "global",
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
    funcPath = "HasSPEffectsAttackPower",
    params = {  },
    returns = { { name = "result", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["InCinematic"] = {
    key = "InCinematic",
    name = "InCinematic",
    category = "general",
    subcategory = "global",
    funcPath = "InCinematic",
    params = {  },
    returns = { { name = "inCinematic", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["InitiateRolePoll"] = {
    key = "InitiateRolePoll",
    name = "InitiateRolePoll",
    category = "general",
    subcategory = "global",
    funcPath = "InitiateRolePoll",
    params = {  },
    returns = { { name = "result", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["InitiateTrade"] = {
    key = "InitiateTrade",
    name = "InitiateTrade",
    category = "general",
    subcategory = "global",
    funcPath = "InitiateTrade",
    params = { { name = "guid", type = "UnitToken", default = "player" } },
    returns = {  },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["Is64BitClient"] = {
    key = "Is64BitClient",
    name = "Is64BitClient",
    category = "general",
    subcategory = "global",
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
    funcPath = "IsAdvancedFlyableArea",
    params = {  },
    returns = { { name = "result", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["IsAltKeyDown"] = {
    key = "IsAltKeyDown",
    name = "IsAltKeyDown",
    category = "general",
    subcategory = "global",
    funcPath = "IsAltKeyDown",
    params = {  },
    returns = { { name = "down", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["IsBetaBuild"] = {
    key = "IsBetaBuild",
    name = "IsBetaBuild",
    category = "general",
    subcategory = "global",
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
    funcPath = "IsCharacterNewlyBoosted",
    params = {  },
    returns = { { name = "newlyBoosted", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["IsControlKeyDown"] = {
    key = "IsControlKeyDown",
    name = "IsControlKeyDown",
    category = "general",
    subcategory = "global",
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
    funcPath = "IsCpuBound",
    params = {  },
    returns = { { name = "isCpuBound", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["IsDebugBuild"] = {
    key = "IsDebugBuild",
    name = "IsDebugBuild",
    category = "general",
    subcategory = "global",
    funcPath = "IsDebugBuild",
    params = {  },
    returns = { { name = "isDebugBuild", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["IsDemonHunterAvailable"] = {
    key = "IsDemonHunterAvailable",
    name = "IsDemonHunterAvailable",
    category = "general",
    subcategory = "global",
    funcPath = "IsDemonHunterAvailable",
    params = {  },
    returns = { { name = "available", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["IsDrivableArea"] = {
    key = "IsDrivableArea",
    name = "IsDrivableArea",
    category = "general",
    subcategory = "global",
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
    funcPath = "IsDualWielding",
    params = {  },
    returns = { { name = "result", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["IsEuropeanNumbers"] = {
    key = "IsEuropeanNumbers",
    name = "IsEuropeanNumbers",
    category = "general",
    subcategory = "global",
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
    funcPath = "IsExpansionTrial",
    params = {  },
    returns = { { name = "isExpansionTrialAccount", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["IsFalling"] = {
    key = "IsFalling",
    name = "IsFalling",
    category = "general",
    subcategory = "global",
    funcPath = "IsFalling",
    params = { { name = "unit", type = "UnitToken", default = "player" } },
    returns = { { name = "result", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["IsFlyableArea"] = {
    key = "IsFlyableArea",
    name = "IsFlyableArea",
    category = "general",
    subcategory = "global",
    funcPath = "IsFlyableArea",
    params = {  },
    returns = { { name = "result", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["IsFlying"] = {
    key = "IsFlying",
    name = "IsFlying",
    category = "general",
    subcategory = "global",
    funcPath = "IsFlying",
    params = { { name = "unit", type = "UnitToken", default = "player" } },
    returns = { { name = "result", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["IsGuildLeader"] = {
    key = "IsGuildLeader",
    name = "IsGuildLeader",
    category = "general",
    subcategory = "global",
    funcPath = "IsGuildLeader",
    params = {  },
    returns = { { name = "result", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["IsInGuild"] = {
    key = "IsInGuild",
    name = "IsInGuild",
    category = "general",
    subcategory = "global",
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
    funcPath = "IsInsane",
    params = {  },
    returns = { { name = "result", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["IsItemPreferredArmorType"] = {
    key = "IsItemPreferredArmorType",
    name = "IsItemPreferredArmorType",
    category = "general",
    subcategory = "global",
    funcPath = "IsItemPreferredArmorType",
    params = { { name = "itemLocation", type = "ItemLocation", default = nil } },
    returns = { { name = "isItemPreferredArmorType", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["IsJailersTowerLayerTimeLocked"] = {
    key = "IsJailersTowerLayerTimeLocked",
    name = "IsJailersTowerLayerTimeLocked",
    category = "general",
    subcategory = "global",
    funcPath = "IsJailersTowerLayerTimeLocked",
    params = { { name = "layerLevel", type = "number", default = nil } },
    returns = { { name = "result", type = "cstring", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["IsKeyDown"] = {
    key = "IsKeyDown",
    name = "IsKeyDown",
    category = "general",
    subcategory = "global",
    funcPath = "IsKeyDown",
    params = { { name = "keyOrMouseName", type = "cstring", default = nil }, { name = "excludeBindingState", type = "bool", default = false } },
    returns = { { name = "down", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["IsLeftAltKeyDown"] = {
    key = "IsLeftAltKeyDown",
    name = "IsLeftAltKeyDown",
    category = "general",
    subcategory = "global",
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
    funcPath = "IsLeftShiftKeyDown",
    params = {  },
    returns = { { name = "down", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["IsLegacyDifficulty"] = {
    key = "IsLegacyDifficulty",
    name = "IsLegacyDifficulty",
    category = "general",
    subcategory = "global",
    funcPath = "IsLegacyDifficulty",
    params = { { name = "difficultyID", type = "number", default = nil } },
    returns = { { name = "result", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["IsLinuxClient"] = {
    key = "IsLinuxClient",
    name = "IsLinuxClient",
    category = "general",
    subcategory = "global",
    funcPath = "IsLinuxClient",
    params = {  },
    returns = { { name = "isLinux", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["IsLoggedIn"] = {
    key = "IsLoggedIn",
    name = "IsLoggedIn",
    category = "general",
    subcategory = "global",
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
    funcPath = "IsMounted",
    params = {  },
    returns = { { name = "result", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["IsMouseButtonDown"] = {
    key = "IsMouseButtonDown",
    name = "IsMouseButtonDown",
    category = "general",
    subcategory = "global",
    funcPath = "IsMouseButtonDown",
    params = { { name = "button", type = "mouseButton", default = nil } },
    returns = { { name = "down", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["IsMovieLocal"] = {
    key = "IsMovieLocal",
    name = "IsMovieLocal",
    category = "general",
    subcategory = "global",
    funcPath = "IsMovieLocal",
    params = { { name = "movieId", type = "number", default = nil } },
    returns = { { name = "isLocal", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["IsMoviePlayable"] = {
    key = "IsMoviePlayable",
    name = "IsMoviePlayable",
    category = "general",
    subcategory = "global",
    funcPath = "IsMoviePlayable",
    params = { { name = "movieId", type = "number", default = nil } },
    returns = { { name = "isPlayable", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["IsMovieReadable"] = {
    key = "IsMovieReadable",
    name = "IsMovieReadable",
    category = "general",
    subcategory = "global",
    funcPath = "IsMovieReadable",
    params = { { name = "movieId", type = "number", default = nil } },
    returns = { { name = "readable", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["IsOnGroundFloorInJailersTower"] = {
    key = "IsOnGroundFloorInJailersTower",
    name = "IsOnGroundFloorInJailersTower",
    category = "general",
    subcategory = "global",
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
    funcPath = "IsOutdoors",
    params = {  },
    returns = { { name = "result", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["IsPVPTimerRunning"] = {
    key = "IsPVPTimerRunning",
    name = "IsPVPTimerRunning",
    category = "general",
    subcategory = "global",
    funcPath = "IsPVPTimerRunning",
    params = {  },
    returns = { { name = "result", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["IsPlayerInGuildFromGUID"] = {
    key = "IsPlayerInGuildFromGUID",
    name = "IsPlayerInGuildFromGUID",
    category = "general",
    subcategory = "global",
    funcPath = "IsPlayerInGuildFromGUID",
    params = { { name = "playerGUID", type = "WOWGUID", default = nil } },
    returns = { { name = "IsInGuild", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["IsPlayerInWorld"] = {
    key = "IsPlayerInWorld",
    name = "IsPlayerInWorld",
    category = "general",
    subcategory = "global",
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
    funcPath = "IsPlayerMoving",
    params = {  },
    returns = { { name = "result", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["IsPublicBuild"] = {
    key = "IsPublicBuild",
    name = "IsPublicBuild",
    category = "general",
    subcategory = "global",
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
    funcPath = "IsPublicTestClient",
    params = {  },
    returns = { { name = "isPublicTestClient", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["IsRaidMarkerActive"] = {
    key = "IsRaidMarkerActive",
    name = "IsRaidMarkerActive",
    category = "general",
    subcategory = "global",
    funcPath = "IsRaidMarkerActive",
    params = { { name = "index", type = "luaIndex", default = nil } },
    returns = { { name = "result", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["IsRaidMarkerSystemEnabled"] = {
    key = "IsRaidMarkerSystemEnabled",
    name = "IsRaidMarkerSystemEnabled",
    category = "general",
    subcategory = "global",
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
    funcPath = "IsRestrictedAccount",
    params = {  },
    returns = { { name = "result", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["IsRightAltKeyDown"] = {
    key = "IsRightAltKeyDown",
    name = "IsRightAltKeyDown",
    category = "general",
    subcategory = "global",
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
    funcPath = "IsRightShiftKeyDown",
    params = {  },
    returns = { { name = "down", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["IsShiftKeyDown"] = {
    key = "IsShiftKeyDown",
    name = "IsShiftKeyDown",
    category = "general",
    subcategory = "global",
    funcPath = "IsShiftKeyDown",
    params = {  },
    returns = { { name = "down", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["IsStealthed"] = {
    key = "IsStealthed",
    name = "IsStealthed",
    category = "general",
    subcategory = "global",
    funcPath = "IsStealthed",
    params = {  },
    returns = { { name = "result", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["IsSubmerged"] = {
    key = "IsSubmerged",
    name = "IsSubmerged",
    category = "general",
    subcategory = "global",
    funcPath = "IsSubmerged",
    params = { { name = "unit", type = "UnitToken", default = "player" } },
    returns = { { name = "result", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["IsSwimming"] = {
    key = "IsSwimming",
    name = "IsSwimming",
    category = "general",
    subcategory = "global",
    funcPath = "IsSwimming",
    params = { { name = "unit", type = "UnitToken", default = "player" } },
    returns = { { name = "result", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["IsTargetLoose"] = {
    key = "IsTargetLoose",
    name = "IsTargetLoose",
    category = "general",
    subcategory = "global",
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
    funcPath = "IsThreatWarningEnabled",
    params = {  },
    returns = { { name = "result", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["IsTitleKnown"] = {
    key = "IsTitleKnown",
    name = "IsTitleKnown",
    category = "general",
    subcategory = "global",
    funcPath = "IsTitleKnown",
    params = { { name = "titleMaskID", type = "number", default = nil } },
    returns = { { name = "result", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["IsTrialAccount"] = {
    key = "IsTrialAccount",
    name = "IsTrialAccount",
    category = "general",
    subcategory = "global",
    funcPath = "IsTrialAccount",
    params = {  },
    returns = { { name = "isTrialAccount", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["IsUnitModelReadyForUI"] = {
    key = "IsUnitModelReadyForUI",
    name = "IsUnitModelReadyForUI",
    category = "general",
    subcategory = "global",
    funcPath = "IsUnitModelReadyForUI",
    params = { { name = "unitToken", type = "UnitToken", default = "player" } },
    returns = { { name = "isReady", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["IsUsingFixedTimeStep"] = {
    key = "IsUsingFixedTimeStep",
    name = "IsUsingFixedTimeStep",
    category = "general",
    subcategory = "global",
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
    funcPath = "IsUsingGamepad",
    params = {  },
    returns = { { name = "down", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["IsUsingMouse"] = {
    key = "IsUsingMouse",
    name = "IsUsingMouse",
    category = "general",
    subcategory = "global",
    funcPath = "IsUsingMouse",
    params = {  },
    returns = { { name = "down", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["IsVeteranTrialAccount"] = {
    key = "IsVeteranTrialAccount",
    name = "IsVeteranTrialAccount",
    category = "general",
    subcategory = "global",
    funcPath = "IsVeteranTrialAccount",
    params = {  },
    returns = { { name = "isVeteranTrialAccount", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["IsWindowsClient"] = {
    key = "IsWindowsClient",
    name = "IsWindowsClient",
    category = "general",
    subcategory = "global",
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
    funcPath = "IsXPUserDisabled",
    params = {  },
    returns = { { name = "result", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["LaunchURL"] = {
    key = "LaunchURL",
    name = "LaunchURL",
    category = "general",
    subcategory = "global",
    funcPath = "LaunchURL",
    params = { { name = "url", type = "cstring", default = nil } },
    returns = {  },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["LoadURLIndex"] = {
    key = "LoadURLIndex",
    name = "LoadURLIndex",
    category = "general",
    subcategory = "global",
    funcPath = "LoadURLIndex",
    params = { { name = "index", type = "number", default = nil }, { name = "param", type = "number", default = nil } },
    returns = {  },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["LocalizedClassList"] = {
    key = "LocalizedClassList",
    name = "LocalizedClassList",
    category = "general",
    subcategory = "global",
    funcPath = "LocalizedClassList",
    params = { { name = "isFemale", type = "bool", default = false } },
    returns = { { name = "result", type = "LuaValueVariant", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["Logout"] = {
    key = "Logout",
    name = "Logout",
    category = "general",
    subcategory = "global",
    funcPath = "Logout",
    params = {  },
    returns = {  },
    midnightImpact = "NORMAL",
}

APIDefs["Mixin"] = {
    key = "Mixin",
    name = "Mixin",
    category = "general",
    subcategory = "global",
    funcPath = "Mixin",
    params = { { name = "object", type = "LuaValueVariant", default = nil }, { name = "mixins", type = "LuaValueVariant", default = nil } },
    returns = { { name = "outObject", type = "LuaValueVariant", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["MouseOverrideCinematicDisable"] = {
    key = "MouseOverrideCinematicDisable",
    name = "MouseOverrideCinematicDisable",
    category = "general",
    subcategory = "global",
    funcPath = "MouseOverrideCinematicDisable",
    params = { { name = "doOverride", type = "bool", default = false } },
    returns = {  },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["NoPlayTime"] = {
    key = "NoPlayTime",
    name = "NoPlayTime",
    category = "general",
    subcategory = "global",
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
    funcPath = "NotWhileDeadError",
    params = {  },
    returns = {  },
    midnightImpact = "NORMAL",
}

APIDefs["NotifyInspect"] = {
    key = "NotifyInspect",
    name = "NotifyInspect",
    category = "general",
    subcategory = "global",
    funcPath = "NotifyInspect",
    params = { { name = "targetGUID", type = "UnitToken", default = "player" } },
    returns = {  },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["OpeningCinematic"] = {
    key = "OpeningCinematic",
    name = "OpeningCinematic",
    category = "general",
    subcategory = "global",
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
    funcPath = "PartialPlayTime",
    params = {  },
    returns = { { name = "result", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["PickupPlayerMoney"] = {
    key = "PickupPlayerMoney",
    name = "PickupPlayerMoney",
    category = "general",
    subcategory = "global",
    funcPath = "PickupPlayerMoney",
    params = { { name = "amount", type = "WOWMONEY", default = nil } },
    returns = {  },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["PlaceRaidMarker"] = {
    key = "PlaceRaidMarker",
    name = "PlaceRaidMarker",
    category = "general",
    subcategory = "global",
    funcPath = "PlaceRaidMarker",
    params = { { name = "index", type = "luaIndex", default = nil }, { name = "token", type = "cstring", default = nil } },
    returns = {  },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["PlayerCanTeleport"] = {
    key = "PlayerCanTeleport",
    name = "PlayerCanTeleport",
    category = "general",
    subcategory = "global",
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
    funcPath = "PlayerIsInCombat",
    params = {  },
    returns = { { name = "playerIsInCombat", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["PlayerIsPVPInactive"] = {
    key = "PlayerIsPVPInactive",
    name = "PlayerIsPVPInactive",
    category = "general",
    subcategory = "global",
    funcPath = "PlayerIsPVPInactive",
    params = { { name = "unit", type = "UnitToken", default = "player" } },
    returns = { { name = "result", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["PlayerIsTimerunning"] = {
    key = "PlayerIsTimerunning",
    name = "PlayerIsTimerunning",
    category = "general",
    subcategory = "global",
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
    funcPath = "PortGraveyard",
    params = {  },
    returns = {  },
    midnightImpact = "NORMAL",
}

APIDefs["PreloadMovie"] = {
    key = "PreloadMovie",
    name = "PreloadMovie",
    category = "general",
    subcategory = "global",
    funcPath = "PreloadMovie",
    params = { { name = "movieId", type = "number", default = nil } },
    returns = {  },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["Quit"] = {
    key = "Quit",
    name = "Quit",
    category = "general",
    subcategory = "global",
    funcPath = "Quit",
    params = {  },
    returns = {  },
    midnightImpact = "NORMAL",
}

APIDefs["RandomRoll"] = {
    key = "RandomRoll",
    name = "RandomRoll",
    category = "general",
    subcategory = "global",
    funcPath = "RandomRoll",
    params = { { name = "min", type = "number", default = nil }, { name = "max", type = "number", default = nil } },
    returns = {  },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["RegisterEventCallback"] = {
    key = "RegisterEventCallback",
    name = "RegisterEventCallback",
    category = "general",
    subcategory = "global",
    funcPath = "RegisterEventCallback",
    params = { { name = "eventName", type = "cstring", default = nil }, { name = "callback", type = "EventCallbackType", default = nil } },
    returns = {  },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["RegisterUnitEventCallback"] = {
    key = "RegisterUnitEventCallback",
    name = "RegisterUnitEventCallback",
    category = "general",
    subcategory = "global",
    funcPath = "RegisterUnitEventCallback",
    params = { { name = "eventName", type = "cstring", default = nil }, { name = "callback", type = "EventCallbackType", default = nil }, { name = "unit", type = "UnitToken", default = "player" } },
    returns = {  },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["RemoveRaidTargets"] = {
    key = "RemoveRaidTargets",
    name = "RemoveRaidTargets",
    category = "general",
    subcategory = "global",
    funcPath = "RemoveRaidTargets",
    params = {  },
    returns = {  },
    midnightImpact = "NORMAL",
}

APIDefs["RepopMe"] = {
    key = "RepopMe",
    name = "RepopMe",
    category = "general",
    subcategory = "global",
    funcPath = "RepopMe",
    params = {  },
    returns = {  },
    midnightImpact = "NORMAL",
}

APIDefs["ReportBug"] = {
    key = "ReportBug",
    name = "ReportBug",
    category = "general",
    subcategory = "global",
    funcPath = "ReportBug",
    params = { { name = "description", type = "cstring", default = nil } },
    returns = {  },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["ReportPlayerIsPVPAFK"] = {
    key = "ReportPlayerIsPVPAFK",
    name = "ReportPlayerIsPVPAFK",
    category = "general",
    subcategory = "global",
    funcPath = "ReportPlayerIsPVPAFK",
    params = { { name = "unit", type = "UnitToken", default = "player" } },
    returns = {  },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["ReportSuggestion"] = {
    key = "ReportSuggestion",
    name = "ReportSuggestion",
    category = "general",
    subcategory = "global",
    funcPath = "ReportSuggestion",
    params = { { name = "description", type = "cstring", default = nil } },
    returns = {  },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["RequestTimePlayed"] = {
    key = "RequestTimePlayed",
    name = "RequestTimePlayed",
    category = "general",
    subcategory = "global",
    funcPath = "RequestTimePlayed",
    params = {  },
    returns = {  },
    midnightImpact = "NORMAL",
}

APIDefs["ResetCPUUsage"] = {
    key = "ResetCPUUsage",
    name = "ResetCPUUsage",
    category = "general",
    subcategory = "global",
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
    funcPath = "ResetInstances",
    params = {  },
    returns = {  },
    midnightImpact = "NORMAL",
}

APIDefs["ResistancePercent"] = {
    key = "ResistancePercent",
    name = "ResistancePercent",
    category = "general",
    subcategory = "global",
    funcPath = "ResistancePercent",
    params = { { name = "resistance", type = "number", default = nil }, { name = "casterLevel", type = "number", default = nil } },
    returns = { { name = "result", type = "number", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["RespondInstanceLock"] = {
    key = "RespondInstanceLock",
    name = "RespondInstanceLock",
    category = "general",
    subcategory = "global",
    funcPath = "RespondInstanceLock",
    params = { { name = "acceptLock", type = "bool", default = nil } },
    returns = {  },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["RestartGx"] = {
    key = "RestartGx",
    name = "RestartGx",
    category = "general",
    subcategory = "global",
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
    funcPath = "RetrieveCorpse",
    params = {  },
    returns = {  },
    midnightImpact = "NORMAL",
}

APIDefs["RunScript"] = {
    key = "RunScript",
    name = "RunScript",
    category = "general",
    subcategory = "global",
    funcPath = "RunScript",
    params = { { name = "text", type = "cstring", default = nil } },
    returns = {  },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["Screenshot"] = {
    key = "Screenshot",
    name = "Screenshot",
    category = "general",
    subcategory = "global",
    funcPath = "Screenshot",
    params = {  },
    returns = {  },
    midnightImpact = "NORMAL",
}

APIDefs["SelectedRealmName"] = {
    key = "SelectedRealmName",
    name = "SelectedRealmName",
    category = "general",
    subcategory = "global",
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
    funcPath = "SellCursorItem",
    params = {  },
    returns = {  },
    midnightImpact = "NORMAL",
}

APIDefs["SendSubscriptionInterstitialResponse"] = {
    key = "SendSubscriptionInterstitialResponse",
    name = "SendSubscriptionInterstitialResponse",
    category = "general",
    subcategory = "global",
    funcPath = "SendSubscriptionInterstitialResponse",
    params = { { name = "response", type = "SubscriptionInterstitialResponseType", default = nil } },
    returns = {  },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["SetAllowDangerousScripts"] = {
    key = "SetAllowDangerousScripts",
    name = "SetAllowDangerousScripts",
    category = "general",
    subcategory = "global",
    funcPath = "SetAllowDangerousScripts",
    params = { { name = "allowed", type = "bool", default = false } },
    returns = {  },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["SetAllowLowLevelRaid"] = {
    key = "SetAllowLowLevelRaid",
    name = "SetAllowLowLevelRaid",
    category = "general",
    subcategory = "global",
    funcPath = "SetAllowLowLevelRaid",
    params = { { name = "allow", type = "bool", default = false } },
    returns = {  },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["SetAllowRecentAlliesSeeLocation"] = {
    key = "SetAllowRecentAlliesSeeLocation",
    name = "SetAllowRecentAlliesSeeLocation",
    category = "general",
    subcategory = "global",
    funcPath = "SetAllowRecentAlliesSeeLocation",
    params = { { name = "allowRecentAlliesSeeLocation", type = "bool", default = nil } },
    returns = {  },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["SetAutoDeclineGuildInvites"] = {
    key = "SetAutoDeclineGuildInvites",
    name = "SetAutoDeclineGuildInvites",
    category = "general",
    subcategory = "global",
    funcPath = "SetAutoDeclineGuildInvites",
    params = { { name = "allow", type = "bool", default = false } },
    returns = {  },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["SetAutoDeclineNeighborhoodInvites"] = {
    key = "SetAutoDeclineNeighborhoodInvites",
    name = "SetAutoDeclineNeighborhoodInvites",
    category = "general",
    subcategory = "global",
    funcPath = "SetAutoDeclineNeighborhoodInvites",
    params = { { name = "allow", type = "bool", default = false } },
    returns = {  },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["SetCemeteryPreference"] = {
    key = "SetCemeteryPreference",
    name = "SetCemeteryPreference",
    category = "general",
    subcategory = "global",
    funcPath = "SetCemeteryPreference",
    params = { { name = "cemetaryID", type = "number", default = nil } },
    returns = {  },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["SetConsoleKey"] = {
    key = "SetConsoleKey",
    name = "SetConsoleKey",
    category = "general",
    subcategory = "global",
    funcPath = "SetConsoleKey",
    params = { { name = "keystring", type = "cstring", default = nil } },
    returns = {  },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["SetCurrentTitle"] = {
    key = "SetCurrentTitle",
    name = "SetCurrentTitle",
    category = "general",
    subcategory = "global",
    funcPath = "SetCurrentTitle",
    params = { { name = "titleMaskID", type = "number", default = nil } },
    returns = {  },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["SetCursor"] = {
    key = "SetCursor",
    name = "SetCursor",
    category = "general",
    subcategory = "global",
    funcPath = "SetCursor",
    params = { { name = "name", type = "cstring", default = nil } },
    returns = { { name = "result", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["SetCursorByMode"] = {
    key = "SetCursorByMode",
    name = "SetCursorByMode",
    category = "general",
    subcategory = "global",
    funcPath = "SetCursorByMode",
    params = { { name = "mode", type = "Cursormode", default = nil } },
    returns = { { name = "result", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["SetCursorHoveredItem"] = {
    key = "SetCursorHoveredItem",
    name = "SetCursorHoveredItem",
    category = "general",
    subcategory = "global",
    funcPath = "SetCursorHoveredItem",
    params = { { name = "item", type = "ItemLocation", default = nil } },
    returns = {  },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["SetCursorHoveredItemTradeItem"] = {
    key = "SetCursorHoveredItemTradeItem",
    name = "SetCursorHoveredItemTradeItem",
    category = "general",
    subcategory = "global",
    funcPath = "SetCursorHoveredItemTradeItem",
    params = { { name = "enabled", type = "bool", default = nil } },
    returns = {  },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["SetCursorPosition"] = {
    key = "SetCursorPosition",
    name = "SetCursorPosition",
    category = "general",
    subcategory = "global",
    funcPath = "SetCursorPosition",
    params = { { name = "xPosition", type = "uiUnit", default = nil }, { name = "yPosition", type = "uiUnit", default = nil } },
    returns = {  },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["SetCursorVirtualItem"] = {
    key = "SetCursorVirtualItem",
    name = "SetCursorVirtualItem",
    category = "general",
    subcategory = "global",
    funcPath = "SetCursorVirtualItem",
    params = { { name = "itemInfo", type = "ItemInfo", default = nil }, { name = "cursorType", type = "UICursorType", default = nil } },
    returns = {  },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["SetDungeonDifficultyID"] = {
    key = "SetDungeonDifficultyID",
    name = "SetDungeonDifficultyID",
    category = "general",
    subcategory = "global",
    funcPath = "SetDungeonDifficultyID",
    params = { { name = "difficultyID", type = "number", default = nil } },
    returns = {  },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["SetErrorCallstackHeight"] = {
    key = "SetErrorCallstackHeight",
    name = "SetErrorCallstackHeight",
    category = "general",
    subcategory = "global",
    funcPath = "SetErrorCallstackHeight",
    params = { { name = "height", type = "number", default = nil } },
    returns = {  },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["SetEuropeanNumbers"] = {
    key = "SetEuropeanNumbers",
    name = "SetEuropeanNumbers",
    category = "general",
    subcategory = "global",
    funcPath = "SetEuropeanNumbers",
    params = { { name = "enabled", type = "bool", default = nil } },
    returns = {  },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["SetInWorldUIVisibility"] = {
    key = "SetInWorldUIVisibility",
    name = "SetInWorldUIVisibility",
    category = "general",
    subcategory = "global",
    funcPath = "SetInWorldUIVisibility",
    params = { { name = "visible", type = "bool", default = nil } },
    returns = {  },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["SetLegacyRaidDifficultyID"] = {
    key = "SetLegacyRaidDifficultyID",
    name = "SetLegacyRaidDifficultyID",
    category = "general",
    subcategory = "global",
    funcPath = "SetLegacyRaidDifficultyID",
    params = { { name = "difficultyID", type = "number", default = nil }, { name = "force", type = "bool", default = false } },
    returns = {  },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["SetLootSpecialization"] = {
    key = "SetLootSpecialization",
    name = "SetLootSpecialization",
    category = "general",
    subcategory = "global",
    funcPath = "SetLootSpecialization",
    params = { { name = "specializationID", type = "number", default = nil } },
    returns = {  },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["SetPortraitTexture"] = {
    key = "SetPortraitTexture",
    name = "SetPortraitTexture",
    category = "general",
    subcategory = "global",
    funcPath = "SetPortraitTexture",
    params = { { name = "textureObject", type = "SimpleTexture", default = nil }, { name = "unitToken", type = "UnitToken", default = "player" }, { name = "disableMasking", type = "bool", default = false } },
    returns = {  },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["SetPortraitTextureFromCreatureDisplayID"] = {
    key = "SetPortraitTextureFromCreatureDisplayID",
    name = "SetPortraitTextureFromCreatureDisplayID",
    category = "general",
    subcategory = "global",
    funcPath = "SetPortraitTextureFromCreatureDisplayID",
    params = { { name = "textureObject", type = "SimpleTexture", default = nil }, { name = "creatureDisplayID", type = "number", default = nil } },
    returns = {  },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["SetRaidDifficultyID"] = {
    key = "SetRaidDifficultyID",
    name = "SetRaidDifficultyID",
    category = "general",
    subcategory = "global",
    funcPath = "SetRaidDifficultyID",
    params = { { name = "difficultyID", type = "number", default = nil }, { name = "force", type = "bool", default = false } },
    returns = {  },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["SetRaidTarget"] = {
    key = "SetRaidTarget",
    name = "SetRaidTarget",
    category = "general",
    subcategory = "global",
    funcPath = "SetRaidTarget",
    params = { { name = "target", type = "UnitToken", default = "player" }, { name = "userIndex", type = "luaIndex", default = nil } },
    returns = {  },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["SetTableSecurityOption"] = {
    key = "SetTableSecurityOption",
    name = "SetTableSecurityOption",
    category = "general",
    subcategory = "global",
    funcPath = "SetTableSecurityOption",
    params = { { name = "table", type = "LuaValueVariant", default = nil }, { name = "option", type = "TableSecurityOption", default = nil } },
    returns = {  },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["SetTaxiBenchmarkMode"] = {
    key = "SetTaxiBenchmarkMode",
    name = "SetTaxiBenchmarkMode",
    category = "general",
    subcategory = "global",
    funcPath = "SetTaxiBenchmarkMode",
    params = { { name = "enable", type = "bool", default = false } },
    returns = {  },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["SetUIVisibility"] = {
    key = "SetUIVisibility",
    name = "SetUIVisibility",
    category = "general",
    subcategory = "global",
    funcPath = "SetUIVisibility",
    params = { { name = "visible", type = "bool", default = nil } },
    returns = {  },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["SetUnitCursorTexture"] = {
    key = "SetUnitCursorTexture",
    name = "SetUnitCursorTexture",
    category = "general",
    subcategory = "global",
    funcPath = "SetUnitCursorTexture",
    params = { { name = "textureObject", type = "SimpleTexture", default = nil }, { name = "unit", type = "UnitToken", default = "player" }, { name = "style", type = "CursorStyle", default = nil }, { name = "includeLowPriority", type = "bool", default = nil } },
    returns = { { name = "hasCursor", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["ShouldShowExpansionUpgradeBanner"] = {
    key = "ShouldShowExpansionUpgradeBanner",
    name = "ShouldShowExpansionUpgradeBanner",
    category = "general",
    subcategory = "global",
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
    funcPath = "ShouldShowSpecialSplashScreen",
    params = {  },
    returns = { { name = "result", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["ShowCloak"] = {
    key = "ShowCloak",
    name = "ShowCloak",
    category = "general",
    subcategory = "global",
    funcPath = "ShowCloak",
    params = { { name = "show", type = "bool", default = nil } },
    returns = {  },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["ShowHelm"] = {
    key = "ShowHelm",
    name = "ShowHelm",
    category = "general",
    subcategory = "global",
    funcPath = "ShowHelm",
    params = { { name = "show", type = "bool", default = nil } },
    returns = {  },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["ShowingCloak"] = {
    key = "ShowingCloak",
    name = "ShowingCloak",
    category = "general",
    subcategory = "global",
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
    funcPath = "ShowingHelm",
    params = {  },
    returns = { { name = "result", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["SimulateMouseClick"] = {
    key = "SimulateMouseClick",
    name = "SimulateMouseClick",
    category = "general",
    subcategory = "global",
    funcPath = "SimulateMouseClick",
    params = { { name = "button", type = "mouseButton", default = nil } },
    returns = {  },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["SimulateMouseDown"] = {
    key = "SimulateMouseDown",
    name = "SimulateMouseDown",
    category = "general",
    subcategory = "global",
    funcPath = "SimulateMouseDown",
    params = { { name = "button", type = "mouseButton", default = nil } },
    returns = {  },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["SimulateMouseUp"] = {
    key = "SimulateMouseUp",
    name = "SimulateMouseUp",
    category = "general",
    subcategory = "global",
    funcPath = "SimulateMouseUp",
    params = { { name = "button", type = "mouseButton", default = nil } },
    returns = {  },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["SimulateMouseWheel"] = {
    key = "SimulateMouseWheel",
    name = "SimulateMouseWheel",
    category = "general",
    subcategory = "global",
    funcPath = "SimulateMouseWheel",
    params = { { name = "delta", type = "number", default = nil } },
    returns = {  },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["SitStandOrDescendStart"] = {
    key = "SitStandOrDescendStart",
    name = "SitStandOrDescendStart",
    category = "general",
    subcategory = "global",
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
    funcPath = "SplashFrameCanBeShown",
    params = {  },
    returns = { { name = "result", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["StartAttack"] = {
    key = "StartAttack",
    name = "StartAttack",
    category = "general",
    subcategory = "global",
    funcPath = "StartAttack",
    params = { { name = "name", type = "cstring", default = "0" }, { name = "exactMatch", type = "bool", default = false } },
    returns = {  },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["StopAttack"] = {
    key = "StopAttack",
    name = "StopAttack",
    category = "general",
    subcategory = "global",
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
    funcPath = "StopCinematic",
    params = {  },
    returns = {  },
    midnightImpact = "NORMAL",
}

APIDefs["Stuck"] = {
    key = "Stuck",
    name = "Stuck",
    category = "general",
    subcategory = "global",
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
    funcPath = "SupportsClipCursor",
    params = {  },
    returns = { { name = "supportsClipCursor", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["TargetDirectionEnemy"] = {
    key = "TargetDirectionEnemy",
    name = "TargetDirectionEnemy",
    category = "general",
    subcategory = "global",
    funcPath = "TargetDirectionEnemy",
    params = { { name = "facing", type = "number", default = nil }, { name = "coneAngle", type = "number", default = nil } },
    returns = {  },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["TargetDirectionFinished"] = {
    key = "TargetDirectionFinished",
    name = "TargetDirectionFinished",
    category = "general",
    subcategory = "global",
    funcPath = "TargetDirectionFinished",
    params = {  },
    returns = {  },
    midnightImpact = "NORMAL",
}

APIDefs["TargetDirectionFriend"] = {
    key = "TargetDirectionFriend",
    name = "TargetDirectionFriend",
    category = "general",
    subcategory = "global",
    funcPath = "TargetDirectionFriend",
    params = { { name = "facing", type = "number", default = nil }, { name = "coneAngle", type = "number", default = nil } },
    returns = {  },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["TargetLastEnemy"] = {
    key = "TargetLastEnemy",
    name = "TargetLastEnemy",
    category = "general",
    subcategory = "global",
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
    funcPath = "TargetLastTarget",
    params = {  },
    returns = {  },
    midnightImpact = "NORMAL",
}

APIDefs["TargetNearest"] = {
    key = "TargetNearest",
    name = "TargetNearest",
    category = "general",
    subcategory = "global",
    funcPath = "TargetNearest",
    params = { { name = "reverse", type = "bool", default = false } },
    returns = {  },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["TargetNearestEnemy"] = {
    key = "TargetNearestEnemy",
    name = "TargetNearestEnemy",
    category = "general",
    subcategory = "global",
    funcPath = "TargetNearestEnemy",
    params = { { name = "reverse", type = "bool", default = false } },
    returns = {  },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["TargetNearestEnemyPlayer"] = {
    key = "TargetNearestEnemyPlayer",
    name = "TargetNearestEnemyPlayer",
    category = "general",
    subcategory = "global",
    funcPath = "TargetNearestEnemyPlayer",
    params = { { name = "reverse", type = "bool", default = false } },
    returns = {  },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["TargetNearestFriend"] = {
    key = "TargetNearestFriend",
    name = "TargetNearestFriend",
    category = "general",
    subcategory = "global",
    funcPath = "TargetNearestFriend",
    params = { { name = "reverse", type = "bool", default = false } },
    returns = {  },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["TargetNearestFriendPlayer"] = {
    key = "TargetNearestFriendPlayer",
    name = "TargetNearestFriendPlayer",
    category = "general",
    subcategory = "global",
    funcPath = "TargetNearestFriendPlayer",
    params = { { name = "reverse", type = "bool", default = false } },
    returns = {  },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["TargetNearestPartyMember"] = {
    key = "TargetNearestPartyMember",
    name = "TargetNearestPartyMember",
    category = "general",
    subcategory = "global",
    funcPath = "TargetNearestPartyMember",
    params = { { name = "reverse", type = "bool", default = false } },
    returns = {  },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["TargetNearestRaidMember"] = {
    key = "TargetNearestRaidMember",
    name = "TargetNearestRaidMember",
    category = "general",
    subcategory = "global",
    funcPath = "TargetNearestRaidMember",
    params = { { name = "reverse", type = "bool", default = false } },
    returns = {  },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["TargetPriorityHighlightEnd"] = {
    key = "TargetPriorityHighlightEnd",
    name = "TargetPriorityHighlightEnd",
    category = "general",
    subcategory = "global",
    funcPath = "TargetPriorityHighlightEnd",
    params = {  },
    returns = {  },
    midnightImpact = "NORMAL",
}

APIDefs["TargetPriorityHighlightStart"] = {
    key = "TargetPriorityHighlightStart",
    name = "TargetPriorityHighlightStart",
    category = "general",
    subcategory = "global",
    funcPath = "TargetPriorityHighlightStart",
    params = { { name = "useStartDelay", type = "bool", default = false } },
    returns = {  },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["TargetToggle"] = {
    key = "TargetToggle",
    name = "TargetToggle",
    category = "general",
    subcategory = "global",
    funcPath = "TargetToggle",
    params = {  },
    returns = {  },
    midnightImpact = "NORMAL",
}

APIDefs["TargetTotem"] = {
    key = "TargetTotem",
    name = "TargetTotem",
    category = "general",
    subcategory = "global",
    funcPath = "TargetTotem",
    params = { { name = "slot", type = "luaIndex", default = nil } },
    returns = {  },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["TargetUnit"] = {
    key = "TargetUnit",
    name = "TargetUnit",
    category = "general",
    subcategory = "global",
    funcPath = "TargetUnit",
    params = { { name = "name", type = "cstring", default = "" }, { name = "exactMatch", type = "bool", default = false } },
    returns = {  },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["TimeoutResurrect"] = {
    key = "TimeoutResurrect",
    name = "TimeoutResurrect",
    category = "general",
    subcategory = "global",
    funcPath = "TimeoutResurrect",
    params = {  },
    returns = {  },
    midnightImpact = "NORMAL",
}

APIDefs["ToggleAnimKitDisplay"] = {
    key = "ToggleAnimKitDisplay",
    name = "ToggleAnimKitDisplay",
    category = "general",
    subcategory = "global",
    funcPath = "ToggleAnimKitDisplay",
    params = {  },
    returns = {  },
    midnightImpact = "NORMAL",
}

APIDefs["ToggleCollision"] = {
    key = "ToggleCollision",
    name = "ToggleCollision",
    category = "general",
    subcategory = "global",
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
    funcPath = "ToggleCollisionDisplay",
    params = {  },
    returns = {  },
    midnightImpact = "NORMAL",
}

APIDefs["ToggleDebugAIDisplay"] = {
    key = "ToggleDebugAIDisplay",
    name = "ToggleDebugAIDisplay",
    category = "general",
    subcategory = "global",
    funcPath = "ToggleDebugAIDisplay",
    params = {  },
    returns = {  },
    midnightImpact = "NORMAL",
}

APIDefs["ToggleGravity"] = {
    key = "ToggleGravity",
    name = "ToggleGravity",
    category = "general",
    subcategory = "global",
    funcPath = "ToggleGravity",
    params = {  },
    returns = {  },
    midnightImpact = "NORMAL",
}

APIDefs["TogglePlayerBounds"] = {
    key = "TogglePlayerBounds",
    name = "TogglePlayerBounds",
    category = "general",
    subcategory = "global",
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
    funcPath = "ToggleTris",
    params = {  },
    returns = {  },
    midnightImpact = "NORMAL",
}

APIDefs["UnitAffectingCombat"] = {
    key = "UnitAffectingCombat",
    name = "UnitAffectingCombat",
    category = "general",
    subcategory = "global",
    funcPath = "UnitAffectingCombat",
    params = { { name = "unit", type = "UnitToken", default = "player" } },
    returns = { { name = "result", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["UnitAlliedRaceInfo"] = {
    key = "UnitAlliedRaceInfo",
    name = "UnitAlliedRaceInfo",
    category = "general",
    subcategory = "global",
    funcPath = "UnitAlliedRaceInfo",
    params = { { name = "unit", type = "UnitToken", default = "player" } },
    returns = { { name = "isAlliedRace", type = "bool", canBeSecret = false }, { name = "hasHeritageArmorUnlocked", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["UnitArmor"] = {
    key = "UnitArmor",
    name = "UnitArmor",
    category = "general",
    subcategory = "global",
    funcPath = "UnitArmor",
    params = { { name = "unit", type = "UnitToken", default = "player" } },
    returns = { { name = "base", type = "number", canBeSecret = false }, { name = "effective", type = "number", canBeSecret = false }, { name = "real", type = "number", canBeSecret = false }, { name = "bonus", type = "number", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["UnitAttackPower"] = {
    key = "UnitAttackPower",
    name = "UnitAttackPower",
    category = "general",
    subcategory = "global",
    funcPath = "UnitAttackPower",
    params = { { name = "unit", type = "UnitToken", default = "player" } },
    returns = { { name = "attackPower", type = "number", canBeSecret = false }, { name = "posBuff", type = "number", canBeSecret = false }, { name = "negBuff", type = "number", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["UnitAttackSpeed"] = {
    key = "UnitAttackSpeed",
    name = "UnitAttackSpeed",
    category = "general",
    subcategory = "global",
    funcPath = "UnitAttackSpeed",
    params = { { name = "unit", type = "UnitToken", default = "player" } },
    returns = { { name = "attackSpeed", type = "number", canBeSecret = false }, { name = "offhandAttackSpeed", type = "number", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["UnitBattlePetLevel"] = {
    key = "UnitBattlePetLevel",
    name = "UnitBattlePetLevel",
    category = "general",
    subcategory = "global",
    funcPath = "UnitBattlePetLevel",
    params = { { name = "unit", type = "UnitToken", default = "player" } },
    returns = { { name = "result", type = "number", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["UnitBattlePetSpeciesID"] = {
    key = "UnitBattlePetSpeciesID",
    name = "UnitBattlePetSpeciesID",
    category = "general",
    subcategory = "global",
    funcPath = "UnitBattlePetSpeciesID",
    params = { { name = "unit", type = "UnitToken", default = "player" } },
    returns = { { name = "result", type = "number", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["UnitBattlePetType"] = {
    key = "UnitBattlePetType",
    name = "UnitBattlePetType",
    category = "general",
    subcategory = "global",
    funcPath = "UnitBattlePetType",
    params = { { name = "unit", type = "UnitToken", default = "player" } },
    returns = { { name = "result", type = "number", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["UnitCanAssist"] = {
    key = "UnitCanAssist",
    name = "UnitCanAssist",
    category = "general",
    subcategory = "global",
    funcPath = "UnitCanAssist",
    params = { { name = "unit", type = "UnitToken", default = "player" }, { name = "target", type = "UnitToken", default = "player" } },
    returns = { { name = "result", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["UnitCanAttack"] = {
    key = "UnitCanAttack",
    name = "UnitCanAttack",
    category = "general",
    subcategory = "global",
    funcPath = "UnitCanAttack",
    params = { { name = "unit", type = "UnitToken", default = "player" }, { name = "target", type = "UnitToken", default = "player" } },
    returns = { { name = "result", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["UnitCanCooperate"] = {
    key = "UnitCanCooperate",
    name = "UnitCanCooperate",
    category = "general",
    subcategory = "global",
    funcPath = "UnitCanCooperate",
    params = { { name = "unit", type = "UnitToken", default = "player" }, { name = "target", type = "UnitToken", default = "player" } },
    returns = { { name = "result", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["UnitCanPetBattle"] = {
    key = "UnitCanPetBattle",
    name = "UnitCanPetBattle",
    category = "general",
    subcategory = "global",
    funcPath = "UnitCanPetBattle",
    params = { { name = "unit", type = "UnitToken", default = "player" }, { name = "target", type = "UnitToken", default = "player" } },
    returns = { { name = "result", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["UnitCastingDuration"] = {
    key = "UnitCastingDuration",
    name = "UnitCastingDuration",
    category = "combat_midnight",
    subcategory = "global",
    funcPath = "UnitCastingDuration",
    params = { { name = "unit", type = "UnitToken", default = "player" } },
    returns = { { name = "duration", type = "LuaDurationObject", canBeSecret = true } },
    midnightImpact = "HIGH",
    midnightNote = "Secret behavior: SecretReturns, SecretArguments=AllowedWhenUntainted",
}

APIDefs["UnitCastingInfo"] = {
    key = "UnitCastingInfo",
    name = "UnitCastingInfo",
    category = "combat_midnight",
    subcategory = "global",
    funcPath = "UnitCastingInfo",
    params = { { name = "unit", type = "UnitToken", default = "player" } },
    returns = { { name = "name", type = "cstring", canBeSecret = false }, { name = "displayName", type = "string", canBeSecret = false }, { name = "textureID", type = "fileID", canBeSecret = false }, { name = "startTimeMs", type = "number", canBeSecret = false }, { name = "endTimeMs", type = "number", canBeSecret = false }, { name = "isTradeskill", type = "bool", canBeSecret = false }, { name = "castID", type = "WOWGUID", canBeSecret = false }, { name = "notInterruptible", type = "bool", canBeSecret = false }, { name = "castingSpellID", type = "number", canBeSecret = false } },
    midnightImpact = "CONDITIONAL",
    midnightNote = "Secret behavior: SecretWhenUnitCastingInfoRestricted, SecretArguments=AllowedWhenUntainted",
}

APIDefs["UnitChannelDuration"] = {
    key = "UnitChannelDuration",
    name = "UnitChannelDuration",
    category = "general",
    subcategory = "global",
    funcPath = "UnitChannelDuration",
    params = { { name = "unit", type = "UnitToken", default = "player" } },
    returns = { { name = "duration", type = "LuaDurationObject", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["UnitChannelInfo"] = {
    key = "UnitChannelInfo",
    name = "UnitChannelInfo",
    category = "combat_midnight",
    subcategory = "global",
    funcPath = "UnitChannelInfo",
    params = { { name = "unit", type = "UnitToken", default = "player" } },
    returns = { { name = "name", type = "cstring", canBeSecret = false }, { name = "displayName", type = "cstring", canBeSecret = false }, { name = "textureID", type = "fileID", canBeSecret = false }, { name = "startTimeMs", type = "number", canBeSecret = false }, { name = "endTimeMs", type = "number", canBeSecret = false }, { name = "isTradeskill", type = "bool", canBeSecret = false }, { name = "notInterruptible", type = "bool", canBeSecret = false }, { name = "spellID", type = "number", canBeSecret = false }, { name = "isEmpowered", type = "bool", canBeSecret = false }, { name = "numEmpowerStages", type = "number", canBeSecret = false } },
    midnightImpact = "CONDITIONAL",
    midnightNote = "Secret behavior: SecretWhenUnitChannelInfoRestricted, SecretArguments=AllowedWhenUntainted",
}

APIDefs["UnitChromieTimeID"] = {
    key = "UnitChromieTimeID",
    name = "UnitChromieTimeID",
    category = "general",
    subcategory = "global",
    funcPath = "UnitChromieTimeID",
    params = { { name = "unit", type = "UnitToken", default = "player" } },
    returns = { { name = "ID", type = "number", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["UnitClass"] = {
    key = "UnitClass",
    name = "UnitClass",
    category = "general",
    subcategory = "global",
    funcPath = "UnitClass",
    params = { { name = "unit", type = "UnitToken", default = "player" } },
    returns = { { name = "className", type = "cstring", canBeSecret = false }, { name = "classFilename", type = "cstring", canBeSecret = false }, { name = "classID", type = "number", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["UnitClassBase"] = {
    key = "UnitClassBase",
    name = "UnitClassBase",
    category = "general",
    subcategory = "global",
    funcPath = "UnitClassBase",
    params = { { name = "unit", type = "UnitToken", default = "player" } },
    returns = { { name = "classFilename", type = "cstring", canBeSecret = false }, { name = "classID", type = "number", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["UnitClassFromGUID"] = {
    key = "UnitClassFromGUID",
    name = "UnitClassFromGUID",
    category = "general",
    subcategory = "global",
    funcPath = "UnitClassFromGUID",
    params = { { name = "unitGUID", type = "WOWGUID", default = nil } },
    returns = { { name = "className", type = "cstring", canBeSecret = false }, { name = "classFilename", type = "cstring", canBeSecret = false }, { name = "classID", type = "number", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["UnitClassification"] = {
    key = "UnitClassification",
    name = "UnitClassification",
    category = "general",
    subcategory = "global",
    funcPath = "UnitClassification",
    params = { { name = "unit", type = "UnitToken", default = "player" } },
    returns = { { name = "result", type = "cstring", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["UnitControllingVehicle"] = {
    key = "UnitControllingVehicle",
    name = "UnitControllingVehicle",
    category = "general",
    subcategory = "global",
    funcPath = "UnitControllingVehicle",
    params = { { name = "unit", type = "UnitToken", default = "player" } },
    returns = { { name = "result", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["UnitCreatureFamily"] = {
    key = "UnitCreatureFamily",
    name = "UnitCreatureFamily",
    category = "combat_midnight",
    subcategory = "global",
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
    funcPath = "UnitCreatureType",
    params = { { name = "unit", type = "UnitToken", default = "player" } },
    returns = { { name = "name", type = "cstring", canBeSecret = false }, { name = "id", type = "number", canBeSecret = false } },
    midnightImpact = "CONDITIONAL",
    midnightNote = "Secret behavior: SecretWhenUnitIdentityRestricted, SecretArguments=AllowedWhenUntainted",
}

APIDefs["UnitDamage"] = {
    key = "UnitDamage",
    name = "UnitDamage",
    category = "general",
    subcategory = "global",
    funcPath = "UnitDamage",
    params = { { name = "unit", type = "UnitToken", default = "player" } },
    returns = { { name = "minDamage", type = "number", canBeSecret = false }, { name = "maxDamage", type = "number", canBeSecret = false }, { name = "offhandMinDamage", type = "number", canBeSecret = false }, { name = "offhandMaxDamage", type = "number", canBeSecret = false }, { name = "posBuff", type = "number", canBeSecret = false }, { name = "negBuff", type = "number", canBeSecret = false }, { name = "percent", type = "number", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["UnitDetailedThreatSituation"] = {
    key = "UnitDetailedThreatSituation",
    name = "UnitDetailedThreatSituation",
    category = "general",
    subcategory = "global",
    funcPath = "UnitDetailedThreatSituation",
    params = { { name = "unit", type = "UnitToken", default = "player" }, { name = "mobGUID", type = "UnitToken", default = "player" } },
    returns = { { name = "isTanking", type = "bool", canBeSecret = false }, { name = "status", type = "number", canBeSecret = false }, { name = "scaledPercentage", type = "number", canBeSecret = false }, { name = "rawPercentage", type = "number", canBeSecret = false }, { name = "rawThreat", type = "number", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["UnitDistanceSquared"] = {
    key = "UnitDistanceSquared",
    name = "UnitDistanceSquared",
    category = "general",
    subcategory = "global",
    funcPath = "UnitDistanceSquared",
    params = { { name = "unit", type = "UnitToken", default = "player" } },
    returns = { { name = "distance", type = "number", canBeSecret = false }, { name = "checkedDistance", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["UnitEffectiveLevel"] = {
    key = "UnitEffectiveLevel",
    name = "UnitEffectiveLevel",
    category = "general",
    subcategory = "global",
    funcPath = "UnitEffectiveLevel",
    params = { { name = "name", type = "cstring", default = nil } },
    returns = { { name = "result", type = "number", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["UnitExists"] = {
    key = "UnitExists",
    name = "UnitExists",
    category = "general",
    subcategory = "global",
    funcPath = "UnitExists",
    params = { { name = "unit", type = "UnitToken", default = "player" } },
    returns = { { name = "result", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["UnitFactionGroup"] = {
    key = "UnitFactionGroup",
    name = "UnitFactionGroup",
    category = "general",
    subcategory = "global",
    funcPath = "UnitFactionGroup",
    params = { { name = "unitName", type = "cstring", default = nil }, { name = "checkDisplayRace", type = "bool", default = false } },
    returns = { { name = "factionGroupTag", type = "cstring", canBeSecret = false }, { name = "localized", type = "cstring", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["UnitFullName"] = {
    key = "UnitFullName",
    name = "UnitFullName",
    category = "combat_midnight",
    subcategory = "global",
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
    funcPath = "UnitGUID",
    params = { { name = "unit", type = "UnitToken", default = "player" } },
    returns = { { name = "result", type = "WOWGUID", canBeSecret = false } },
    midnightImpact = "CONDITIONAL",
    midnightNote = "Secret behavior: SecretWhenUnitIdentityRestricted, SecretArguments=AllowedWhenUntainted",
}

APIDefs["UnitGetAvailableRoles"] = {
    key = "UnitGetAvailableRoles",
    name = "UnitGetAvailableRoles",
    category = "general",
    subcategory = "global",
    funcPath = "UnitGetAvailableRoles",
    params = { { name = "unit", type = "UnitToken", default = "player" } },
    returns = { { name = "tank", type = "bool", canBeSecret = false }, { name = "healer", type = "bool", canBeSecret = false }, { name = "dps", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["UnitGetDetailedHealPrediction"] = {
    key = "UnitGetDetailedHealPrediction",
    name = "UnitGetDetailedHealPrediction",
    category = "general",
    subcategory = "global",
    funcPath = "UnitGetDetailedHealPrediction",
    params = { { name = "unit", type = "UnitToken", default = "player" }, { name = "healerUnit", type = "UnitToken", default = "player" }, { name = "healPredictionCalculator", type = "UnitHealPredictionCalculator", default = nil } },
    returns = {  },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["UnitGetIncomingHeals"] = {
    key = "UnitGetIncomingHeals",
    name = "UnitGetIncomingHeals",
    category = "combat_midnight",
    subcategory = "global",
    funcPath = "UnitGetIncomingHeals",
    params = { { name = "unit", type = "UnitToken", default = "player" }, { name = "healerGUID", type = "UnitToken", default = "player" } },
    returns = { { name = "result", type = "number", canBeSecret = true } },
    midnightImpact = "HIGH",
    midnightNote = "Secret behavior: SecretReturns, SecretArguments=AllowedWhenUntainted",
}

APIDefs["UnitGetTotalAbsorbs"] = {
    key = "UnitGetTotalAbsorbs",
    name = "UnitGetTotalAbsorbs",
    category = "combat_midnight",
    subcategory = "global",
    funcPath = "UnitGetTotalAbsorbs",
    params = { { name = "unit", type = "UnitToken", default = "player" } },
    returns = { { name = "result", type = "number", canBeSecret = true } },
    midnightImpact = "HIGH",
    midnightNote = "Secret behavior: SecretReturns, SecretArguments=AllowedWhenUntainted",
}

APIDefs["UnitGetTotalHealAbsorbs"] = {
    key = "UnitGetTotalHealAbsorbs",
    name = "UnitGetTotalHealAbsorbs",
    category = "combat_midnight",
    subcategory = "global",
    funcPath = "UnitGetTotalHealAbsorbs",
    params = { { name = "unit", type = "UnitToken", default = "player" } },
    returns = { { name = "result", type = "number", canBeSecret = true } },
    midnightImpact = "HIGH",
    midnightNote = "Secret behavior: SecretReturns, SecretArguments=AllowedWhenUntainted",
}

APIDefs["UnitGroupRolesAssigned"] = {
    key = "UnitGroupRolesAssigned",
    name = "UnitGroupRolesAssigned",
    category = "general",
    subcategory = "global",
    funcPath = "UnitGroupRolesAssigned",
    params = { { name = "unit", type = "UnitToken", default = "player" } },
    returns = { { name = "result", type = "cstring", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["UnitGroupRolesAssignedEnum"] = {
    key = "UnitGroupRolesAssignedEnum",
    name = "UnitGroupRolesAssignedEnum",
    category = "general",
    subcategory = "global",
    funcPath = "UnitGroupRolesAssignedEnum",
    params = { { name = "unit", type = "UnitToken", default = "player" } },
    returns = { { name = "result", type = "number", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["UnitHPPerStamina"] = {
    key = "UnitHPPerStamina",
    name = "UnitHPPerStamina",
    category = "general",
    subcategory = "global",
    funcPath = "UnitHPPerStamina",
    params = { { name = "unit", type = "UnitToken", default = "player" } },
    returns = { { name = "result", type = "number", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["UnitHasRelicSlot"] = {
    key = "UnitHasRelicSlot",
    name = "UnitHasRelicSlot",
    category = "general",
    subcategory = "global",
    funcPath = "UnitHasRelicSlot",
    params = { { name = "unit", type = "UnitToken", default = "player" } },
    returns = { { name = "result", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["UnitHasVehiclePlayerFrameUI"] = {
    key = "UnitHasVehiclePlayerFrameUI",
    name = "UnitHasVehiclePlayerFrameUI",
    category = "general",
    subcategory = "global",
    funcPath = "UnitHasVehiclePlayerFrameUI",
    params = { { name = "unit", type = "UnitToken", default = "player" } },
    returns = { { name = "result", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["UnitHasVehicleUI"] = {
    key = "UnitHasVehicleUI",
    name = "UnitHasVehicleUI",
    category = "general",
    subcategory = "global",
    funcPath = "UnitHasVehicleUI",
    params = { { name = "unit", type = "UnitToken", default = "player" } },
    returns = { { name = "result", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["UnitHealth"] = {
    key = "UnitHealth",
    name = "UnitHealth",
    category = "combat_midnight",
    subcategory = "global",
    funcPath = "UnitHealth",
    params = { { name = "unit", type = "UnitToken", default = "player" }, { name = "usePredicted", type = "bool", default = true } },
    returns = { { name = "result", type = "number", canBeSecret = true } },
    midnightImpact = "HIGH",
    midnightNote = "Secret behavior: SecretReturns, SecretArguments=AllowedWhenUntainted",
}

APIDefs["UnitHealthMax"] = {
    key = "UnitHealthMax",
    name = "UnitHealthMax",
    category = "combat_midnight",
    subcategory = "global",
    funcPath = "UnitHealthMax",
    params = { { name = "unit", type = "UnitToken", default = "player" } },
    returns = { { name = "result", type = "number", canBeSecret = false } },
    midnightImpact = "CONDITIONAL",
    midnightNote = "Secret behavior: SecretWhenUnitHealthMaxRestricted, SecretArguments=AllowedWhenUntainted",
}

APIDefs["UnitHealthMissing"] = {
    key = "UnitHealthMissing",
    name = "UnitHealthMissing",
    category = "combat_midnight",
    subcategory = "global",
    funcPath = "UnitHealthMissing",
    params = { { name = "unit", type = "UnitToken", default = "player" }, { name = "usePredicted", type = "bool", default = true } },
    returns = { { name = "result", type = "number", canBeSecret = true } },
    midnightImpact = "HIGH",
    midnightNote = "Secret behavior: SecretReturns, SecretArguments=AllowedWhenUntainted",
}

APIDefs["UnitHealthPercent"] = {
    key = "UnitHealthPercent",
    name = "UnitHealthPercent",
    category = "combat_midnight",
    subcategory = "global",
    funcPath = "UnitHealthPercent",
    params = { { name = "unit", type = "UnitToken", default = "player" }, { name = "usePredicted", type = "bool", default = true }, { name = "curve", type = "LuaCurveObjectBase", default = nil } },
    returns = { { name = "result", type = "LuaCurveEvaluatedResult", canBeSecret = true } },
    midnightImpact = "HIGH",
    midnightNote = "Secret behavior: SecretWhenCurveSecret, SecretReturns, SecretArguments=AllowedWhenUntainted",
}

APIDefs["UnitHonor"] = {
    key = "UnitHonor",
    name = "UnitHonor",
    category = "general",
    subcategory = "global",
    funcPath = "UnitHonor",
    params = { { name = "unit", type = "UnitToken", default = "player" } },
    returns = { { name = "result", type = "number", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["UnitHonorLevel"] = {
    key = "UnitHonorLevel",
    name = "UnitHonorLevel",
    category = "general",
    subcategory = "global",
    funcPath = "UnitHonorLevel",
    params = { { name = "unit", type = "UnitToken", default = "player" } },
    returns = { { name = "result", type = "number", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["UnitHonorMax"] = {
    key = "UnitHonorMax",
    name = "UnitHonorMax",
    category = "general",
    subcategory = "global",
    funcPath = "UnitHonorMax",
    params = { { name = "unit", type = "UnitToken", default = "player" } },
    returns = { { name = "result", type = "number", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["UnitInAnyGroup"] = {
    key = "UnitInAnyGroup",
    name = "UnitInAnyGroup",
    category = "general",
    subcategory = "global",
    funcPath = "UnitInAnyGroup",
    params = { { name = "unit", type = "UnitToken", default = "player" }, { name = "partyIndex", type = "luaIndex", default = nil } },
    returns = { { name = "result", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["UnitInBattleground"] = {
    key = "UnitInBattleground",
    name = "UnitInBattleground",
    category = "general",
    subcategory = "global",
    funcPath = "UnitInBattleground",
    params = { { name = "unit", type = "UnitToken", default = "player" }, { name = "partyIndex", type = "luaIndex", default = nil } },
    returns = { { name = "result", type = "luaIndex", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["UnitInOtherParty"] = {
    key = "UnitInOtherParty",
    name = "UnitInOtherParty",
    category = "general",
    subcategory = "global",
    funcPath = "UnitInOtherParty",
    params = { { name = "unit", type = "UnitToken", default = "player" } },
    returns = { { name = "inOtherParty", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["UnitInParty"] = {
    key = "UnitInParty",
    name = "UnitInParty",
    category = "general",
    subcategory = "global",
    funcPath = "UnitInParty",
    params = { { name = "unit", type = "UnitToken", default = "player" }, { name = "partyIndex", type = "luaIndex", default = nil } },
    returns = { { name = "result", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["UnitInPartyIsAI"] = {
    key = "UnitInPartyIsAI",
    name = "UnitInPartyIsAI",
    category = "general",
    subcategory = "global",
    funcPath = "UnitInPartyIsAI",
    params = { { name = "unit", type = "UnitToken", default = "player" } },
    returns = { { name = "result", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["UnitInPartyShard"] = {
    key = "UnitInPartyShard",
    name = "UnitInPartyShard",
    category = "general",
    subcategory = "global",
    funcPath = "UnitInPartyShard",
    params = { { name = "unit", type = "UnitToken", default = "player" } },
    returns = { { name = "inPartyShard", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["UnitInRaid"] = {
    key = "UnitInRaid",
    name = "UnitInRaid",
    category = "general",
    subcategory = "global",
    funcPath = "UnitInRaid",
    params = { { name = "unit", type = "UnitToken", default = "player" }, { name = "partyIndex", type = "luaIndex", default = nil } },
    returns = { { name = "result", type = "luaIndex", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["UnitInRange"] = {
    key = "UnitInRange",
    name = "UnitInRange",
    category = "combat_midnight",
    subcategory = "global",
    funcPath = "UnitInRange",
    params = { { name = "unit", type = "UnitToken", default = "player" } },
    returns = { { name = "inRange", type = "bool", canBeSecret = true }, { name = "checkedRange", type = "bool", canBeSecret = true } },
    midnightImpact = "HIGH",
    midnightNote = "Secret behavior: SecretReturns, SecretArguments=AllowedWhenUntainted",
}

APIDefs["UnitInSubgroup"] = {
    key = "UnitInSubgroup",
    name = "UnitInSubgroup",
    category = "general",
    subcategory = "global",
    funcPath = "UnitInSubgroup",
    params = { { name = "unit", type = "UnitToken", default = "player" }, { name = "partyIndex", type = "luaIndex", default = nil } },
    returns = { { name = "result", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["UnitInVehicle"] = {
    key = "UnitInVehicle",
    name = "UnitInVehicle",
    category = "general",
    subcategory = "global",
    funcPath = "UnitInVehicle",
    params = { { name = "unit", type = "UnitToken", default = "player" } },
    returns = { { name = "result", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["UnitInVehicleControlSeat"] = {
    key = "UnitInVehicleControlSeat",
    name = "UnitInVehicleControlSeat",
    category = "general",
    subcategory = "global",
    funcPath = "UnitInVehicleControlSeat",
    params = { { name = "unit", type = "UnitToken", default = "player" } },
    returns = { { name = "result", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["UnitInVehicleHidesPetFrame"] = {
    key = "UnitInVehicleHidesPetFrame",
    name = "UnitInVehicleHidesPetFrame",
    category = "general",
    subcategory = "global",
    funcPath = "UnitInVehicleHidesPetFrame",
    params = { { name = "unit", type = "UnitToken", default = "player" } },
    returns = { { name = "result", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["UnitIsAFK"] = {
    key = "UnitIsAFK",
    name = "UnitIsAFK",
    category = "general",
    subcategory = "global",
    funcPath = "UnitIsAFK",
    params = { { name = "unit", type = "UnitToken", default = "player" } },
    returns = { { name = "result", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["UnitIsBattlePet"] = {
    key = "UnitIsBattlePet",
    name = "UnitIsBattlePet",
    category = "general",
    subcategory = "global",
    funcPath = "UnitIsBattlePet",
    params = { { name = "unit", type = "UnitToken", default = "player" } },
    returns = { { name = "result", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["UnitIsBattlePetCompanion"] = {
    key = "UnitIsBattlePetCompanion",
    name = "UnitIsBattlePetCompanion",
    category = "general",
    subcategory = "global",
    funcPath = "UnitIsBattlePetCompanion",
    params = { { name = "unit", type = "UnitToken", default = "player" } },
    returns = { { name = "result", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["UnitIsBossMob"] = {
    key = "UnitIsBossMob",
    name = "UnitIsBossMob",
    category = "general",
    subcategory = "global",
    funcPath = "UnitIsBossMob",
    params = { { name = "unit", type = "UnitToken", default = "player" } },
    returns = { { name = "result", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["UnitIsCharmed"] = {
    key = "UnitIsCharmed",
    name = "UnitIsCharmed",
    category = "general",
    subcategory = "global",
    funcPath = "UnitIsCharmed",
    params = { { name = "unit", type = "UnitToken", default = "player" } },
    returns = { { name = "result", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["UnitIsConnected"] = {
    key = "UnitIsConnected",
    name = "UnitIsConnected",
    category = "general",
    subcategory = "global",
    funcPath = "UnitIsConnected",
    params = { { name = "unit", type = "UnitToken", default = "player" } },
    returns = { { name = "isConnected", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["UnitIsControlling"] = {
    key = "UnitIsControlling",
    name = "UnitIsControlling",
    category = "general",
    subcategory = "global",
    funcPath = "UnitIsControlling",
    params = { { name = "unit", type = "UnitToken", default = "player" } },
    returns = { { name = "result", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["UnitIsCorpse"] = {
    key = "UnitIsCorpse",
    name = "UnitIsCorpse",
    category = "general",
    subcategory = "global",
    funcPath = "UnitIsCorpse",
    params = { { name = "unit", type = "UnitToken", default = "player" } },
    returns = { { name = "result", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["UnitIsDND"] = {
    key = "UnitIsDND",
    name = "UnitIsDND",
    category = "general",
    subcategory = "global",
    funcPath = "UnitIsDND",
    params = { { name = "unit", type = "UnitToken", default = "player" } },
    returns = { { name = "result", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["UnitIsDead"] = {
    key = "UnitIsDead",
    name = "UnitIsDead",
    category = "general",
    subcategory = "global",
    funcPath = "UnitIsDead",
    params = { { name = "unit", type = "UnitToken", default = "player" } },
    returns = { { name = "result", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["UnitIsDeadOrGhost"] = {
    key = "UnitIsDeadOrGhost",
    name = "UnitIsDeadOrGhost",
    category = "general",
    subcategory = "global",
    funcPath = "UnitIsDeadOrGhost",
    params = { { name = "unit", type = "UnitToken", default = "player" } },
    returns = { { name = "result", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["UnitIsEnemy"] = {
    key = "UnitIsEnemy",
    name = "UnitIsEnemy",
    category = "general",
    subcategory = "global",
    funcPath = "UnitIsEnemy",
    params = { { name = "unit", type = "UnitToken", default = "player" }, { name = "target", type = "UnitToken", default = "player" } },
    returns = { { name = "result", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["UnitIsFeignDeath"] = {
    key = "UnitIsFeignDeath",
    name = "UnitIsFeignDeath",
    category = "general",
    subcategory = "global",
    funcPath = "UnitIsFeignDeath",
    params = { { name = "unit", type = "UnitToken", default = "player" } },
    returns = { { name = "result", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["UnitIsFriend"] = {
    key = "UnitIsFriend",
    name = "UnitIsFriend",
    category = "general",
    subcategory = "global",
    funcPath = "UnitIsFriend",
    params = { { name = "unit", type = "UnitToken", default = "player" }, { name = "target", type = "UnitToken", default = "player" } },
    returns = { { name = "result", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["UnitIsGameObject"] = {
    key = "UnitIsGameObject",
    name = "UnitIsGameObject",
    category = "general",
    subcategory = "global",
    funcPath = "UnitIsGameObject",
    params = { { name = "unit", type = "UnitToken", default = "player" } },
    returns = { { name = "result", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["UnitIsGhost"] = {
    key = "UnitIsGhost",
    name = "UnitIsGhost",
    category = "general",
    subcategory = "global",
    funcPath = "UnitIsGhost",
    params = { { name = "unit", type = "UnitToken", default = "player" } },
    returns = { { name = "result", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["UnitIsGroupAssistant"] = {
    key = "UnitIsGroupAssistant",
    name = "UnitIsGroupAssistant",
    category = "general",
    subcategory = "global",
    funcPath = "UnitIsGroupAssistant",
    params = { { name = "unit", type = "UnitToken", default = "player" } },
    returns = { { name = "isAssistant", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["UnitIsGroupLeader"] = {
    key = "UnitIsGroupLeader",
    name = "UnitIsGroupLeader",
    category = "general",
    subcategory = "global",
    funcPath = "UnitIsGroupLeader",
    params = { { name = "unit", type = "UnitToken", default = "player" }, { name = "partyCategory", type = "luaIndex", default = nil } },
    returns = { { name = "isLeader", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["UnitIsHumanPlayer"] = {
    key = "UnitIsHumanPlayer",
    name = "UnitIsHumanPlayer",
    category = "general",
    subcategory = "global",
    funcPath = "UnitIsHumanPlayer",
    params = { { name = "unit", type = "UnitToken", default = "player" }, { name = "partyIndex", type = "luaIndex", default = nil } },
    returns = { { name = "result", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["UnitIsInMyGuild"] = {
    key = "UnitIsInMyGuild",
    name = "UnitIsInMyGuild",
    category = "general",
    subcategory = "global",
    funcPath = "UnitIsInMyGuild",
    params = { { name = "unit", type = "cstring", default = nil } },
    returns = { { name = "result", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["UnitIsInteractable"] = {
    key = "UnitIsInteractable",
    name = "UnitIsInteractable",
    category = "general",
    subcategory = "global",
    funcPath = "UnitIsInteractable",
    params = { { name = "unit", type = "UnitToken", default = "player" } },
    returns = { { name = "result", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["UnitIsLieutenant"] = {
    key = "UnitIsLieutenant",
    name = "UnitIsLieutenant",
    category = "general",
    subcategory = "global",
    funcPath = "UnitIsLieutenant",
    params = { { name = "unit", type = "UnitToken", default = "player" } },
    returns = { { name = "result", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["UnitIsMercenary"] = {
    key = "UnitIsMercenary",
    name = "UnitIsMercenary",
    category = "general",
    subcategory = "global",
    funcPath = "UnitIsMercenary",
    params = { { name = "name", type = "cstring", default = nil } },
    returns = { { name = "result", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["UnitIsMinion"] = {
    key = "UnitIsMinion",
    name = "UnitIsMinion",
    category = "general",
    subcategory = "global",
    funcPath = "UnitIsMinion",
    params = { { name = "unit", type = "UnitToken", default = "player" } },
    returns = { { name = "result", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["UnitIsNPCAsPlayer"] = {
    key = "UnitIsNPCAsPlayer",
    name = "UnitIsNPCAsPlayer",
    category = "general",
    subcategory = "global",
    funcPath = "UnitIsNPCAsPlayer",
    params = { { name = "unit", type = "UnitToken", default = "player" } },
    returns = { { name = "result", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["UnitIsOtherPlayersBattlePet"] = {
    key = "UnitIsOtherPlayersBattlePet",
    name = "UnitIsOtherPlayersBattlePet",
    category = "general",
    subcategory = "global",
    funcPath = "UnitIsOtherPlayersBattlePet",
    params = { { name = "unit", type = "UnitToken", default = "player" } },
    returns = { { name = "result", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["UnitIsOtherPlayersPet"] = {
    key = "UnitIsOtherPlayersPet",
    name = "UnitIsOtherPlayersPet",
    category = "general",
    subcategory = "global",
    funcPath = "UnitIsOtherPlayersPet",
    params = { { name = "unit", type = "UnitToken", default = "player" } },
    returns = { { name = "result", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["UnitIsOwnerOrControllerOfUnit"] = {
    key = "UnitIsOwnerOrControllerOfUnit",
    name = "UnitIsOwnerOrControllerOfUnit",
    category = "general",
    subcategory = "global",
    funcPath = "UnitIsOwnerOrControllerOfUnit",
    params = { { name = "controllingUnit", type = "UnitToken", default = "player" }, { name = "controlledUnit", type = "UnitToken", default = "player" } },
    returns = { { name = "unitIsOwnerOrControllerOfUnit", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["UnitIsPVP"] = {
    key = "UnitIsPVP",
    name = "UnitIsPVP",
    category = "general",
    subcategory = "global",
    funcPath = "UnitIsPVP",
    params = { { name = "unit", type = "UnitToken", default = "player" } },
    returns = { { name = "result", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["UnitIsPVPFreeForAll"] = {
    key = "UnitIsPVPFreeForAll",
    name = "UnitIsPVPFreeForAll",
    category = "general",
    subcategory = "global",
    funcPath = "UnitIsPVPFreeForAll",
    params = { { name = "unit", type = "UnitToken", default = "player" } },
    returns = { { name = "result", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["UnitIsPVPSanctuary"] = {
    key = "UnitIsPVPSanctuary",
    name = "UnitIsPVPSanctuary",
    category = "general",
    subcategory = "global",
    funcPath = "UnitIsPVPSanctuary",
    params = { { name = "unit", type = "UnitToken", default = "player" } },
    returns = { { name = "result", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["UnitIsPlayer"] = {
    key = "UnitIsPlayer",
    name = "UnitIsPlayer",
    category = "general",
    subcategory = "global",
    funcPath = "UnitIsPlayer",
    params = { { name = "unit", type = "UnitToken", default = "player" }, { name = "partyIndex", type = "luaIndex", default = nil } },
    returns = { { name = "result", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["UnitIsPossessed"] = {
    key = "UnitIsPossessed",
    name = "UnitIsPossessed",
    category = "general",
    subcategory = "global",
    funcPath = "UnitIsPossessed",
    params = { { name = "unit", type = "UnitToken", default = "player" } },
    returns = { { name = "result", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["UnitIsQuestBoss"] = {
    key = "UnitIsQuestBoss",
    name = "UnitIsQuestBoss",
    category = "general",
    subcategory = "global",
    funcPath = "UnitIsQuestBoss",
    params = { { name = "unit", type = "UnitToken", default = "player" } },
    returns = { { name = "result", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["UnitIsRaidOfficer"] = {
    key = "UnitIsRaidOfficer",
    name = "UnitIsRaidOfficer",
    category = "general",
    subcategory = "global",
    funcPath = "UnitIsRaidOfficer",
    params = { { name = "unit", type = "UnitToken", default = "player" } },
    returns = { { name = "result", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["UnitIsSameServer"] = {
    key = "UnitIsSameServer",
    name = "UnitIsSameServer",
    category = "general",
    subcategory = "global",
    funcPath = "UnitIsSameServer",
    params = { { name = "unitName", type = "cstring", default = nil } },
    returns = { { name = "result", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["UnitIsSpellTarget"] = {
    key = "UnitIsSpellTarget",
    name = "UnitIsSpellTarget",
    category = "combat_midnight",
    subcategory = "global",
    funcPath = "UnitIsSpellTarget",
    params = { { name = "unit", type = "UnitToken", default = "player" }, { name = "target", type = "UnitToken", default = "player" } },
    returns = { { name = "result", type = "bool", canBeSecret = true } },
    midnightImpact = "HIGH",
    midnightNote = "Secret behavior: SecretReturns, SecretArguments=AllowedWhenUntainted",
}

APIDefs["UnitIsTapDenied"] = {
    key = "UnitIsTapDenied",
    name = "UnitIsTapDenied",
    category = "general",
    subcategory = "global",
    funcPath = "UnitIsTapDenied",
    params = { { name = "unit", type = "UnitToken", default = "player" } },
    returns = { { name = "result", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["UnitIsTrivial"] = {
    key = "UnitIsTrivial",
    name = "UnitIsTrivial",
    category = "general",
    subcategory = "global",
    funcPath = "UnitIsTrivial",
    params = { { name = "unit", type = "UnitToken", default = "player" } },
    returns = { { name = "result", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["UnitIsUnconscious"] = {
    key = "UnitIsUnconscious",
    name = "UnitIsUnconscious",
    category = "general",
    subcategory = "global",
    funcPath = "UnitIsUnconscious",
    params = { { name = "unit", type = "UnitToken", default = "player" } },
    returns = { { name = "result", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["UnitIsUnit"] = {
    key = "UnitIsUnit",
    name = "UnitIsUnit",
    category = "combat_midnight",
    subcategory = "global",
    funcPath = "UnitIsUnit",
    params = { { name = "unit1", type = "UnitToken", default = "player" }, { name = "unit2", type = "UnitToken", default = "player" } },
    returns = { { name = "result", type = "bool", canBeSecret = false } },
    midnightImpact = "CONDITIONAL",
    midnightNote = "Secret behavior: SecretWhenUnitComparisonRestricted, SecretArguments=AllowedWhenUntainted",
}

APIDefs["UnitIsVisible"] = {
    key = "UnitIsVisible",
    name = "UnitIsVisible",
    category = "general",
    subcategory = "global",
    funcPath = "UnitIsVisible",
    params = { { name = "unit", type = "UnitToken", default = "player" } },
    returns = { { name = "result", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["UnitIsWildBattlePet"] = {
    key = "UnitIsWildBattlePet",
    name = "UnitIsWildBattlePet",
    category = "general",
    subcategory = "global",
    funcPath = "UnitIsWildBattlePet",
    params = { { name = "unit", type = "UnitToken", default = "player" } },
    returns = { { name = "result", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["UnitLeadsAnyGroup"] = {
    key = "UnitLeadsAnyGroup",
    name = "UnitLeadsAnyGroup",
    category = "general",
    subcategory = "global",
    funcPath = "UnitLeadsAnyGroup",
    params = { { name = "unit", type = "UnitToken", default = "player" } },
    returns = { { name = "isLeader", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["UnitLevel"] = {
    key = "UnitLevel",
    name = "UnitLevel",
    category = "general",
    subcategory = "global",
    funcPath = "UnitLevel",
    params = { { name = "name", type = "cstring", default = nil } },
    returns = { { name = "result", type = "number", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["UnitName"] = {
    key = "UnitName",
    name = "UnitName",
    category = "combat_midnight",
    subcategory = "global",
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
    funcPath = "UnitNameUnmodified",
    params = { { name = "unit", type = "UnitToken", default = "player" } },
    returns = { { name = "unitName", type = "cstring", canBeSecret = false }, { name = "unitServer", type = "cstring", canBeSecret = false } },
    midnightImpact = "CONDITIONAL",
    midnightNote = "Secret behavior: SecretWhenUnitIdentityRestricted, SecretArguments=AllowedWhenUntainted",
}

APIDefs["UnitNameplateShowsWidgetsOnly"] = {
    key = "UnitNameplateShowsWidgetsOnly",
    name = "UnitNameplateShowsWidgetsOnly",
    category = "general",
    subcategory = "global",
    funcPath = "UnitNameplateShowsWidgetsOnly",
    params = { { name = "unit", type = "UnitToken", default = "player" } },
    returns = { { name = "nameplateShowsWidgetsOnly", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["UnitNumPowerBarTimers"] = {
    key = "UnitNumPowerBarTimers",
    name = "UnitNumPowerBarTimers",
    category = "general",
    subcategory = "global",
    funcPath = "UnitNumPowerBarTimers",
    params = { { name = "unit", type = "UnitToken", default = "player" } },
    returns = { { name = "result", type = "number", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["UnitOnTaxi"] = {
    key = "UnitOnTaxi",
    name = "UnitOnTaxi",
    category = "general",
    subcategory = "global",
    funcPath = "UnitOnTaxi",
    params = { { name = "unit", type = "UnitToken", default = "player" } },
    returns = { { name = "result", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["UnitOwnerGUID"] = {
    key = "UnitOwnerGUID",
    name = "UnitOwnerGUID",
    category = "combat_midnight",
    subcategory = "global",
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
    funcPath = "UnitPercentHealthFromGUID",
    params = { { name = "unitGUID", type = "WOWGUID", default = nil } },
    returns = { { name = "percentHealth", type = "number", canBeSecret = true } },
    midnightImpact = "HIGH",
    midnightNote = "Secret behavior: SecretReturns, SecretArguments=AllowedWhenTainted",
}

APIDefs["UnitPhaseReason"] = {
    key = "UnitPhaseReason",
    name = "UnitPhaseReason",
    category = "general",
    subcategory = "global",
    funcPath = "UnitPhaseReason",
    params = { { name = "unit", type = "UnitToken", default = "player" } },
    returns = { { name = "reason", type = "PhaseReason", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["UnitPlayerControlled"] = {
    key = "UnitPlayerControlled",
    name = "UnitPlayerControlled",
    category = "general",
    subcategory = "global",
    funcPath = "UnitPlayerControlled",
    params = { { name = "unit", type = "UnitToken", default = "player" } },
    returns = { { name = "result", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["UnitPlayerOrPetInParty"] = {
    key = "UnitPlayerOrPetInParty",
    name = "UnitPlayerOrPetInParty",
    category = "general",
    subcategory = "global",
    funcPath = "UnitPlayerOrPetInParty",
    params = { { name = "unit", type = "UnitToken", default = "player" }, { name = "partyIndex", type = "luaIndex", default = nil } },
    returns = { { name = "result", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["UnitPlayerOrPetInRaid"] = {
    key = "UnitPlayerOrPetInRaid",
    name = "UnitPlayerOrPetInRaid",
    category = "general",
    subcategory = "global",
    funcPath = "UnitPlayerOrPetInRaid",
    params = { { name = "unit", type = "UnitToken", default = "player" }, { name = "partyIndex", type = "luaIndex", default = nil } },
    returns = { { name = "result", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["UnitPosition"] = {
    key = "UnitPosition",
    name = "UnitPosition",
    category = "general",
    subcategory = "global",
    funcPath = "UnitPosition",
    params = { { name = "unit", type = "UnitToken", default = "player" } },
    returns = { { name = "positionX", type = "number", canBeSecret = false }, { name = "positionY", type = "number", canBeSecret = false }, { name = "positionZ", type = "number", canBeSecret = false }, { name = "mapID", type = "number", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["UnitPower"] = {
    key = "UnitPower",
    name = "UnitPower",
    category = "combat_midnight",
    subcategory = "global",
    funcPath = "UnitPower",
    params = { { name = "unitToken", type = "UnitToken", default = "player" }, { name = "powerType", type = "PowerType", default = nil }, { name = "unmodified", type = "bool", default = false } },
    returns = { { name = "power", type = "number", canBeSecret = false } },
    midnightImpact = "CONDITIONAL",
    midnightNote = "Secret behavior: SecretWhenUnitPowerRestricted, SecretArguments=AllowedWhenUntainted",
}

APIDefs["UnitPowerBarID"] = {
    key = "UnitPowerBarID",
    name = "UnitPowerBarID",
    category = "general",
    subcategory = "global",
    funcPath = "UnitPowerBarID",
    params = { { name = "unitToken", type = "UnitToken", default = "player" } },
    returns = { { name = "barID", type = "number", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["UnitPowerBarTimerInfo"] = {
    key = "UnitPowerBarTimerInfo",
    name = "UnitPowerBarTimerInfo",
    category = "combat_midnight",
    subcategory = "global",
    funcPath = "UnitPowerBarTimerInfo",
    params = { { name = "unit", type = "UnitToken", default = "player" }, { name = "index", type = "luaIndex", default = 0 } },
    returns = { { name = "duration", type = "number", canBeSecret = true }, { name = "expiration", type = "number", canBeSecret = true }, { name = "barID", type = "number", canBeSecret = true }, { name = "auraID", type = "number", canBeSecret = true } },
    midnightImpact = "HIGH",
    midnightNote = "Secret behavior: SecretReturns, SecretArguments=AllowedWhenUntainted",
}

APIDefs["UnitPowerDisplayMod"] = {
    key = "UnitPowerDisplayMod",
    name = "UnitPowerDisplayMod",
    category = "general",
    subcategory = "global",
    funcPath = "UnitPowerDisplayMod",
    params = { { name = "powerType", type = "PowerType", default = nil } },
    returns = { { name = "displayMod", type = "number", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["UnitPowerMax"] = {
    key = "UnitPowerMax",
    name = "UnitPowerMax",
    category = "combat_midnight",
    subcategory = "global",
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
    funcPath = "UnitPowerPercent",
    params = { { name = "unitToken", type = "UnitToken", default = "player" }, { name = "powerType", type = "PowerType", default = nil }, { name = "unmodified", type = "bool", default = false }, { name = "curve", type = "LuaCurveObjectBase", default = nil } },
    returns = { { name = "result", type = "LuaCurveEvaluatedResult", canBeSecret = false } },
    midnightImpact = "CONDITIONAL",
    midnightNote = "Secret behavior: SecretWhenUnitPowerRestricted, SecretWhenCurveSecret, SecretArguments=AllowedWhenUntainted",
}

APIDefs["UnitPowerType"] = {
    key = "UnitPowerType",
    name = "UnitPowerType",
    category = "general",
    subcategory = "global",
    funcPath = "UnitPowerType",
    params = { { name = "unit", type = "UnitToken", default = "player" }, { name = "index", type = "number", default = 0 } },
    returns = { { name = "powerType", type = "PowerType", canBeSecret = false }, { name = "powerTypeToken", type = "string", canBeSecret = false }, { name = "rgbX", type = "number", canBeSecret = false }, { name = "rgbY", type = "number", canBeSecret = false }, { name = "rgbZ", type = "number", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["UnitPvpClassification"] = {
    key = "UnitPvpClassification",
    name = "UnitPvpClassification",
    category = "general",
    subcategory = "global",
    funcPath = "UnitPvpClassification",
    params = { { name = "unit", type = "UnitToken", default = "player" } },
    returns = { { name = "classification", type = "PvPUnitClassification", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["UnitQuestTrivialLevelRange"] = {
    key = "UnitQuestTrivialLevelRange",
    name = "UnitQuestTrivialLevelRange",
    category = "general",
    subcategory = "global",
    funcPath = "UnitQuestTrivialLevelRange",
    params = { { name = "unit", type = "UnitToken", default = "player" } },
    returns = { { name = "levelRange", type = "number", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["UnitQuestTrivialLevelRangeScaling"] = {
    key = "UnitQuestTrivialLevelRangeScaling",
    name = "UnitQuestTrivialLevelRangeScaling",
    category = "general",
    subcategory = "global",
    funcPath = "UnitQuestTrivialLevelRangeScaling",
    params = { { name = "unit", type = "UnitToken", default = "player" } },
    returns = { { name = "levelRange", type = "number", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["UnitRace"] = {
    key = "UnitRace",
    name = "UnitRace",
    category = "general",
    subcategory = "global",
    funcPath = "UnitRace",
    params = { { name = "name", type = "cstring", default = nil } },
    returns = { { name = "localizedRaceName", type = "cstring", canBeSecret = false }, { name = "englishRaceName", type = "cstring", canBeSecret = false }, { name = "raceID", type = "number", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["UnitRangedAttackPower"] = {
    key = "UnitRangedAttackPower",
    name = "UnitRangedAttackPower",
    category = "general",
    subcategory = "global",
    funcPath = "UnitRangedAttackPower",
    params = { { name = "unit", type = "UnitToken", default = "player" } },
    returns = { { name = "attackPower", type = "number", canBeSecret = false }, { name = "posBuff", type = "number", canBeSecret = false }, { name = "negBuff", type = "number", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["UnitRangedDamage"] = {
    key = "UnitRangedDamage",
    name = "UnitRangedDamage",
    category = "general",
    subcategory = "global",
    funcPath = "UnitRangedDamage",
    params = { { name = "unit", type = "UnitToken", default = "player" } },
    returns = { { name = "speed", type = "number", canBeSecret = false }, { name = "minDamage", type = "number", canBeSecret = false }, { name = "maxDamage", type = "number", canBeSecret = false }, { name = "posBuff", type = "number", canBeSecret = false }, { name = "negBuff", type = "number", canBeSecret = false }, { name = "percent", type = "number", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["UnitReaction"] = {
    key = "UnitReaction",
    name = "UnitReaction",
    category = "general",
    subcategory = "global",
    funcPath = "UnitReaction",
    params = { { name = "unit", type = "UnitToken", default = "player" }, { name = "target", type = "UnitToken", default = "player" } },
    returns = { { name = "result", type = "luaIndex", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["UnitRealmRelationship"] = {
    key = "UnitRealmRelationship",
    name = "UnitRealmRelationship",
    category = "general",
    subcategory = "global",
    funcPath = "UnitRealmRelationship",
    params = { { name = "unit", type = "UnitToken", default = "player" } },
    returns = { { name = "realmRelationship", type = "luaIndex", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["UnitSelectionColor"] = {
    key = "UnitSelectionColor",
    name = "UnitSelectionColor",
    category = "general",
    subcategory = "global",
    funcPath = "UnitSelectionColor",
    params = { { name = "unit", type = "UnitToken", default = "player" }, { name = "useExtendedColors", type = "bool", default = false } },
    returns = { { name = "resultR", type = "number", canBeSecret = false }, { name = "resultG", type = "number", canBeSecret = false }, { name = "resultB", type = "number", canBeSecret = false }, { name = "resultA", type = "number", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["UnitSelectionType"] = {
    key = "UnitSelectionType",
    name = "UnitSelectionType",
    category = "general",
    subcategory = "global",
    funcPath = "UnitSelectionType",
    params = { { name = "unit", type = "UnitToken", default = "player" }, { name = "useExtendedColors", type = "bool", default = false } },
    returns = { { name = "result", type = "number", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["UnitSetRole"] = {
    key = "UnitSetRole",
    name = "UnitSetRole",
    category = "general",
    subcategory = "global",
    funcPath = "UnitSetRole",
    params = { { name = "unit", type = "UnitToken", default = "player" }, { name = "roleStr", type = "cstring", default = nil } },
    returns = { { name = "result", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["UnitSetRoleEnum"] = {
    key = "UnitSetRoleEnum",
    name = "UnitSetRoleEnum",
    category = "general",
    subcategory = "global",
    funcPath = "UnitSetRoleEnum",
    params = { { name = "unit", type = "UnitToken", default = "player" }, { name = "role", type = "LFGRole", default = nil } },
    returns = { { name = "result", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["UnitSex"] = {
    key = "UnitSex",
    name = "UnitSex",
    category = "general",
    subcategory = "global",
    funcPath = "UnitSex",
    params = { { name = "unit", type = "UnitToken", default = "player" } },
    returns = { { name = "sex", type = "number", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["UnitSexBase"] = {
    key = "UnitSexBase",
    name = "UnitSexBase",
    category = "general",
    subcategory = "global",
    funcPath = "UnitSexBase",
    params = { { name = "unit", type = "UnitToken", default = "player" } },
    returns = { { name = "sex", type = "UnitSex", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["UnitShouldDisplayName"] = {
    key = "UnitShouldDisplayName",
    name = "UnitShouldDisplayName",
    category = "general",
    subcategory = "global",
    funcPath = "UnitShouldDisplayName",
    params = { { name = "unit", type = "UnitToken", default = "player" } },
    returns = { { name = "result", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["UnitShouldDisplaySpellTargetName"] = {
    key = "UnitShouldDisplaySpellTargetName",
    name = "UnitShouldDisplaySpellTargetName",
    category = "general",
    subcategory = "global",
    funcPath = "UnitShouldDisplaySpellTargetName",
    params = { { name = "unit", type = "UnitToken", default = "player" } },
    returns = { { name = "result", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["UnitSpellHaste"] = {
    key = "UnitSpellHaste",
    name = "UnitSpellHaste",
    category = "general",
    subcategory = "global",
    funcPath = "UnitSpellHaste",
    params = { { name = "unit", type = "UnitToken", default = "player" } },
    returns = { { name = "result", type = "number", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["UnitSpellTargetClass"] = {
    key = "UnitSpellTargetClass",
    name = "UnitSpellTargetClass",
    category = "combat_midnight",
    subcategory = "global",
    funcPath = "UnitSpellTargetClass",
    params = { { name = "unit", type = "UnitToken", default = "player" } },
    returns = { { name = "classFilename", type = "cstring", canBeSecret = true } },
    midnightImpact = "HIGH",
    midnightNote = "Secret behavior: SecretReturns, SecretArguments=AllowedWhenUntainted",
}

APIDefs["UnitSpellTargetName"] = {
    key = "UnitSpellTargetName",
    name = "UnitSpellTargetName",
    category = "combat_midnight",
    subcategory = "global",
    funcPath = "UnitSpellTargetName",
    params = { { name = "unit", type = "UnitToken", default = "player" } },
    returns = { { name = "targetName", type = "cstring", canBeSecret = true } },
    midnightImpact = "HIGH",
    midnightNote = "Secret behavior: SecretReturns, SecretArguments=AllowedWhenUntainted",
}

APIDefs["UnitStagger"] = {
    key = "UnitStagger",
    name = "UnitStagger",
    category = "general",
    subcategory = "global",
    funcPath = "UnitStagger",
    params = { { name = "unit", type = "UnitToken", default = "player" } },
    returns = { { name = "result", type = "number", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["UnitStat"] = {
    key = "UnitStat",
    name = "UnitStat",
    category = "general",
    subcategory = "global",
    funcPath = "UnitStat",
    params = { { name = "unit", type = "UnitToken", default = "player" }, { name = "index", type = "luaIndex", default = nil } },
    returns = { { name = "currentStat", type = "number", canBeSecret = false }, { name = "effectiveStat", type = "number", canBeSecret = false }, { name = "statPositiveBuff", type = "number", canBeSecret = false }, { name = "statNegativeBuff", type = "number", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["UnitSwitchToVehicleSeat"] = {
    key = "UnitSwitchToVehicleSeat",
    name = "UnitSwitchToVehicleSeat",
    category = "general",
    subcategory = "global",
    funcPath = "UnitSwitchToVehicleSeat",
    params = { { name = "unit", type = "UnitToken", default = "player" }, { name = "virtualSeatIndex", type = "luaIndex", default = nil } },
    returns = {  },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["UnitTargetsVehicleInRaidUI"] = {
    key = "UnitTargetsVehicleInRaidUI",
    name = "UnitTargetsVehicleInRaidUI",
    category = "general",
    subcategory = "global",
    funcPath = "UnitTargetsVehicleInRaidUI",
    params = { { name = "unit", type = "UnitToken", default = "player" } },
    returns = { { name = "result", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["UnitThreatLeadSituation"] = {
    key = "UnitThreatLeadSituation",
    name = "UnitThreatLeadSituation",
    category = "general",
    subcategory = "global",
    funcPath = "UnitThreatLeadSituation",
    params = { { name = "unit", type = "UnitToken", default = "player" }, { name = "mobGUID", type = "UnitToken", default = "player" } },
    returns = { { name = "result", type = "number", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["UnitThreatPercentageOfLead"] = {
    key = "UnitThreatPercentageOfLead",
    name = "UnitThreatPercentageOfLead",
    category = "general",
    subcategory = "global",
    funcPath = "UnitThreatPercentageOfLead",
    params = { { name = "unit", type = "UnitToken", default = "player" }, { name = "mobGUID", type = "UnitToken", default = "player" } },
    returns = { { name = "result", type = "number", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["UnitThreatSituation"] = {
    key = "UnitThreatSituation",
    name = "UnitThreatSituation",
    category = "general",
    subcategory = "global",
    funcPath = "UnitThreatSituation",
    params = { { name = "unit", type = "UnitToken", default = "player" }, { name = "mobGUID", type = "UnitToken", default = "player" } },
    returns = { { name = "result", type = "number", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["UnitTokenFromGUID"] = {
    key = "UnitTokenFromGUID",
    name = "UnitTokenFromGUID",
    category = "combat_midnight",
    subcategory = "global",
    funcPath = "UnitTokenFromGUID",
    params = { { name = "unitGUID", type = "WOWGUID", default = nil } },
    returns = { { name = "unitToken", type = "string", canBeSecret = false } },
    midnightImpact = "CONDITIONAL",
    midnightNote = "Secret behavior: SecretWhenUnitIdentityRestricted, SecretArguments=AllowedWhenTainted",
}

APIDefs["UnitTreatAsPlayerForDisplay"] = {
    key = "UnitTreatAsPlayerForDisplay",
    name = "UnitTreatAsPlayerForDisplay",
    category = "general",
    subcategory = "global",
    funcPath = "UnitTreatAsPlayerForDisplay",
    params = { { name = "unit", type = "UnitToken", default = "player" } },
    returns = { { name = "treatAsPlayer", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["UnitTrialBankedLevels"] = {
    key = "UnitTrialBankedLevels",
    name = "UnitTrialBankedLevels",
    category = "general",
    subcategory = "global",
    funcPath = "UnitTrialBankedLevels",
    params = { { name = "unit", type = "UnitToken", default = "player" } },
    returns = { { name = "bankedLevels", type = "number", canBeSecret = false }, { name = "xpIntoCurrentLevel", type = "number", canBeSecret = false }, { name = "xpForNextLevel", type = "number", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["UnitTrialXP"] = {
    key = "UnitTrialXP",
    name = "UnitTrialXP",
    category = "general",
    subcategory = "global",
    funcPath = "UnitTrialXP",
    params = { { name = "unit", type = "UnitToken", default = "player" } },
    returns = { { name = "result", type = "number", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["UnitUsingVehicle"] = {
    key = "UnitUsingVehicle",
    name = "UnitUsingVehicle",
    category = "general",
    subcategory = "global",
    funcPath = "UnitUsingVehicle",
    params = { { name = "unit", type = "UnitToken", default = "player" } },
    returns = { { name = "result", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["UnitVehicleSeatCount"] = {
    key = "UnitVehicleSeatCount",
    name = "UnitVehicleSeatCount",
    category = "general",
    subcategory = "global",
    funcPath = "UnitVehicleSeatCount",
    params = { { name = "unit", type = "UnitToken", default = "player" } },
    returns = { { name = "result", type = "number", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["UnitVehicleSeatInfo"] = {
    key = "UnitVehicleSeatInfo",
    name = "UnitVehicleSeatInfo",
    category = "general",
    subcategory = "global",
    funcPath = "UnitVehicleSeatInfo",
    params = { { name = "unit", type = "UnitToken", default = "player" }, { name = "virtualSeatIndex", type = "luaIndex", default = nil } },
    returns = { { name = "controlType", type = "cstring", canBeSecret = false }, { name = "occupantName", type = "cstring", canBeSecret = false }, { name = "serverName", type = "cstring", canBeSecret = false }, { name = "ejectable", type = "bool", canBeSecret = false }, { name = "canSwitchSeats", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["UnitVehicleSkin"] = {
    key = "UnitVehicleSkin",
    name = "UnitVehicleSkin",
    category = "general",
    subcategory = "global",
    funcPath = "UnitVehicleSkin",
    params = { { name = "unit", type = "UnitToken", default = "player" } },
    returns = { { name = "result", type = "fileID", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["UnitWeaponAttackPower"] = {
    key = "UnitWeaponAttackPower",
    name = "UnitWeaponAttackPower",
    category = "general",
    subcategory = "global",
    funcPath = "UnitWeaponAttackPower",
    params = { { name = "unit", type = "UnitToken", default = "player" } },
    returns = { { name = "mainHandWeaponAttackPower", type = "number", canBeSecret = false }, { name = "offHandWeaponAttackPower", type = "number", canBeSecret = false }, { name = "rangedWeaponAttackPower", type = "number", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["UnitWidgetSet"] = {
    key = "UnitWidgetSet",
    name = "UnitWidgetSet",
    category = "general",
    subcategory = "global",
    funcPath = "UnitWidgetSet",
    params = { { name = "unit", type = "UnitToken", default = "player" } },
    returns = { { name = "uiWidgetSet", type = "number", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["UnitXP"] = {
    key = "UnitXP",
    name = "UnitXP",
    category = "general",
    subcategory = "global",
    funcPath = "UnitXP",
    params = { { name = "unit", type = "UnitToken", default = "player" } },
    returns = { { name = "result", type = "number", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["UnitXPMax"] = {
    key = "UnitXPMax",
    name = "UnitXPMax",
    category = "general",
    subcategory = "global",
    funcPath = "UnitXPMax",
    params = { { name = "unit", type = "UnitToken", default = "player" } },
    returns = { { name = "result", type = "number", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["UnregisterEventCallback"] = {
    key = "UnregisterEventCallback",
    name = "UnregisterEventCallback",
    category = "general",
    subcategory = "global",
    funcPath = "UnregisterEventCallback",
    params = { { name = "eventName", type = "cstring", default = nil }, { name = "callback", type = "EventCallbackType", default = nil } },
    returns = {  },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["UnregisterUnitEventCallback"] = {
    key = "UnregisterUnitEventCallback",
    name = "UnregisterUnitEventCallback",
    category = "general",
    subcategory = "global",
    funcPath = "UnregisterUnitEventCallback",
    params = { { name = "eventName", type = "cstring", default = nil }, { name = "callback", type = "EventCallbackType", default = nil }, { name = "unit", type = "UnitToken", default = "player" } },
    returns = {  },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["UpdateAddOnCPUUsage"] = {
    key = "UpdateAddOnCPUUsage",
    name = "UpdateAddOnCPUUsage",
    category = "general",
    subcategory = "global",
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
    funcPath = "UpdateAddOnMemoryUsage",
    params = {  },
    returns = {  },
    midnightImpact = "NORMAL",
}

APIDefs["UpdateWindow"] = {
    key = "UpdateWindow",
    name = "UpdateWindow",
    category = "general",
    subcategory = "global",
    funcPath = "UpdateWindow",
    params = {  },
    returns = {  },
    midnightImpact = "NORMAL",
}

APIDefs["WorldLootObjectExists"] = {
    key = "WorldLootObjectExists",
    name = "WorldLootObjectExists",
    category = "general",
    subcategory = "global",
    funcPath = "WorldLootObjectExists",
    params = { { name = "unit", type = "UnitToken", default = "player" } },
    returns = { { name = "result", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["canaccessallvalues"] = {
    key = "canaccessallvalues",
    name = "canaccessallvalues",
    category = "general",
    subcategory = "global",
    funcPath = "canaccessallvalues",
    params = { { name = "values", type = "LuaValueReference", default = nil } },
    returns = { { name = "canAccessAllValues", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["canaccesssecrets"] = {
    key = "canaccesssecrets",
    name = "canaccesssecrets",
    category = "general",
    subcategory = "global",
    funcPath = "canaccesssecrets",
    params = {  },
    returns = { { name = "canAccessSecrets", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["canaccesstable"] = {
    key = "canaccesstable",
    name = "canaccesstable",
    category = "general",
    subcategory = "global",
    funcPath = "canaccesstable",
    params = { { name = "table", type = "LuaValueReference", default = nil } },
    returns = { { name = "canAccessTable", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["canaccessvalue"] = {
    key = "canaccessvalue",
    name = "canaccessvalue",
    category = "general",
    subcategory = "global",
    funcPath = "canaccessvalue",
    params = { { name = "value", type = "LuaValueReference", default = nil } },
    returns = { { name = "canAccessValue", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["debugprofilestart"] = {
    key = "debugprofilestart",
    name = "debugprofilestart",
    category = "general",
    subcategory = "global",
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
    funcPath = "dropsecretaccess",
    params = {  },
    returns = {  },
    midnightImpact = "NORMAL",
}

APIDefs["hasanysecretvalues"] = {
    key = "hasanysecretvalues",
    name = "hasanysecretvalues",
    category = "general",
    subcategory = "global",
    funcPath = "hasanysecretvalues",
    params = { { name = "values", type = "LuaValueReference", default = nil } },
    returns = { { name = "isAnyValueSecret", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["issecrettable"] = {
    key = "issecrettable",
    name = "issecrettable",
    category = "general",
    subcategory = "global",
    funcPath = "issecrettable",
    params = { { name = "table", type = "LuaValueReference", default = nil } },
    returns = { { name = "isSecretOrContentsSecret", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["issecretvalue"] = {
    key = "issecretvalue",
    name = "issecretvalue",
    category = "general",
    subcategory = "global",
    funcPath = "issecretvalue",
    params = { { name = "value", type = "LuaValueReference", default = nil } },
    returns = { { name = "isSecret", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["mapvalues"] = {
    key = "mapvalues",
    name = "mapvalues",
    category = "general",
    subcategory = "global",
    funcPath = "mapvalues",
    params = { { name = "func", type = "LuaValueReference", default = nil }, { name = "values", type = "LuaValueReference", default = nil } },
    returns = { { name = "mapped", type = "LuaValueReference", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["scrub"] = {
    key = "scrub",
    name = "scrub",
    category = "general",
    subcategory = "global",
    funcPath = "scrub",
    params = { { name = "values", type = "LuaValueReference", default = nil } },
    returns = { { name = "scrubbed", type = "LuaValueReference", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["scrubsecretvalues"] = {
    key = "scrubsecretvalues",
    name = "scrubsecretvalues",
    category = "general",
    subcategory = "global",
    funcPath = "scrubsecretvalues",
    params = { { name = "values", type = "LuaValueReference", default = nil } },
    returns = { { name = "scrubbed", type = "LuaValueReference", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["secretunwrap"] = {
    key = "secretunwrap",
    name = "secretunwrap",
    category = "general",
    subcategory = "global",
    funcPath = "secretunwrap",
    params = { { name = "values", type = "LuaValueReference", default = nil } },
    returns = { { name = "unwrapped", type = "LuaValueReference", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["secretwrap"] = {
    key = "secretwrap",
    name = "secretwrap",
    category = "general",
    subcategory = "global",
    funcPath = "secretwrap",
    params = { { name = "values", type = "LuaValueReference", default = nil } },
    returns = { { name = "wrapped", type = "LuaValueReference", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}
