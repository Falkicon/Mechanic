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
	params = {
		{ name = "number", type = "number", default = nil },
		{ name = "options", type = "NumberAbbrevOptions", default = nil },
	},
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
	params = {
		{ name = "number", type = "number", default = nil },
		{ name = "options", type = "NumberAbbrevOptions", default = nil },
	},
	returns = { { name = "result", type = "string", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenTainted",
}

APIDefs["AddCharacterLight"] = {
	key = "AddCharacterLight",
	name = "AddCharacterLight",
	category = "combat_midnight",
	subcategory = "global",
	func = _G["AddCharacterLight"],
	funcPath = "AddCharacterLight",
	params = {
		{ name = "index", type = "number", default = nil },
		{ name = "light", type = "ModelLight", default = nil },
	},
	returns = {},
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
	params = {
		{ name = "index", type = "number", default = nil },
		{ name = "light", type = "ModelLight", default = nil },
	},
	returns = {},
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
	params = {
		{
			name = "mask",
			type = "SimpleMaskTexture",
			default = nil,
			examples = {
				{ value = "f.masks[2]", label = "MRT" },
				{ value = "f.masks[1]", label = "MRT" },
				{ value = "mask1", label = "Plumber" },
			},
		},
	},
	returns = {},
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
	params = {
		{
			name = "text",
			type = "cstring",
			default = nil,
			examples = {
				{ value = "message", label = "WeakAuras" },
				{ value = [=["ACP: " .. msg]=], label = "ACP" },
				{ value = "ERR_NOT_ENOUGH_MONEY", label = "Auctionator" },
			},
		},
		{ name = "colorR", type = "number", default = nil },
		{ name = "colorG", type = "number", default = nil },
		{ name = "colorB", type = "number", default = nil },
		{ name = "a", type = "SingleColorValue", default = nil },
		{ name = "messageID", type = "number", default = nil },
	},
	returns = {},
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
	params = {
		{ name = "index", type = "number", default = nil },
		{ name = "light", type = "ModelLight", default = nil },
	},
	returns = {},
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
	params = {
		{
			name = "pointX",
			type = "number",
			default = nil,
			examples = {
				{ value = 0, label = "DandersFrames" },
				{ value = 1, label = "DandersFrames" },
				{ value = 2, label = "DandersFrames" },
			},
		},
		{ name = "pointY", type = "number", default = nil },
	},
	returns = {},
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
	returns = {},
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
	params = {
		{
			name = "unitTokenString",
			type = "cstring",
			default = nil,
			examples = { { value = "unit", label = "AstralKeys" }, { value = "player", label = "Narcissus" } },
		},
		{ name = "asset", type = "TextureAssetDisk", default = nil },
		{ name = "width", type = "uiUnit", default = nil },
		{ name = "height", type = "uiUnit", default = nil },
		{ name = "r", type = "number", default = nil },
		{ name = "g", type = "number", default = nil },
		{ name = "b", type = "number", default = nil },
		{ name = "a", type = "number", default = nil },
		{ name = "sublayer", type = "number", default = nil },
		{ name = "showFacing", type = "bool", default = nil },
	},
	returns = {},
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
	params = {
		{
			name = "x",
			type = "uiUnit",
			default = nil,
			examples = {
				{ value = "-3", label = "Details" },
				{ value = "-1", label = "Details" },
				{ value = "-8", label = "Details" },
			},
		},
		{ name = "y", type = "uiUnit", default = nil },
	},
	returns = {},
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["Ambiguate"] = {
	key = "Ambiguate",
	name = "Ambiguate",
	category = "combat_midnight",
	subcategory = "global",
	func = _G["Ambiguate"],
	funcPath = "Ambiguate",
	params = {
		{
			name = "fullName",
			type = "cstring",
			default = nil,
			examples = {
				{ value = "player", label = "WeakAuras" },
				{ value = "characterName", label = "WeakAuras" },
				{ value = "playerNameRealm", label = "AstralKeys" },
			},
		},
		{ name = "context", type = "cstring", default = nil },
	},
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
	params = {
		{ name = "texture", type = "SimpleTexture", default = nil },
		{ name = "snapshotID", type = "number", default = nil },
	},
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
	params = {
		{
			name = "spellVisualKitID",
			type = "number",
			default = nil,
			examples = {
				{ value = 79517, label = "Narcissus" },
				{ value = 40277, label = "Narcissus" },
				{ value = 68828, label = "Narcissus" },
			},
		},
		{ name = "oneShot", type = "bool", default = false },
	},
	returns = {},
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["Assign"] = {
	key = "Assign",
	name = "Assign",
	category = "combat_midnight",
	subcategory = "global",
	func = _G["Assign"],
	funcPath = "Assign",
	params = { { name = "other", type = "LuaDurationObject", default = nil } },
	returns = {},
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
	params = {
		{ name = "name", type = "cstring", default = "", examples = { { value = "unit", label = "Details" } } },
		{ name = "exactMatch", type = "bool", default = false },
	},
	returns = {},
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
	params = {
		{ name = "rider", type = "ModelSceneFrameActor", default = nil },
		{ name = "animation", type = "AnimationDataEnum", default = nil },
		{ name = "spellKitVisualID", type = "number", default = nil },
	},
	returns = { { name = "success", type = "bool", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["BreakUpLargeNumbers"] = {
	key = "BreakUpLargeNumbers",
	name = "BreakUpLargeNumbers",
	category = "combat_midnight",
	subcategory = "global",
	func = _G["BreakUpLargeNumbers"],
	funcPath = "BreakUpLargeNumbers",
	params = {
		{
			name = "largeNumber",
			type = "number",
			default = nil,
			examples = {
				{ value = "max((base+posBuff+negBuff)", label = "DejaCharacterStats" },
				{ value = "effectiveAP * GetOverrideSpellPowerByAP() + 0.5", label = "DejaCharacterStats" },
				{ value = "max(floor(minDamage)", label = "Narcissus" },
			},
		},
		{ name = "natural", type = "bool", default = false },
	},
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
	params = {
		{ name = "firstString", type = "stringView", default = nil },
		{ name = "secondString", type = "stringView", default = nil },
	},
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
	params = {
		{
			name = "targetGUID",
			type = "UnitToken",
			default = "player",
			examples = { { value = "unit", label = "Narcissus" }, { value = "unit", label = "Narcissus" } },
		},
	},
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
	returns = {
		{ name = "hasLoot", type = "bool", canBeSecret = false },
		{ name = "canLoot", type = "bool", canBeSecret = false },
	},
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

APIDefs["CanSetUnit"] = {
	key = "CanSetUnit",
	name = "CanSetUnit",
	category = "combat_midnight",
	subcategory = "global",
	func = _G["CanSetUnit"],
	funcPath = "CanSetUnit",
	params = { { name = "unit", type = "UnitToken", default = "player" } },
	returns = {},
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["CancelPendingEquip"] = {
	key = "CancelPendingEquip",
	name = "CancelPendingEquip",
	category = "combat_midnight",
	subcategory = "global",
	func = _G["CancelPendingEquip"],
	funcPath = "CancelPendingEquip",
	params = { { name = "index", type = "number", default = nil } },
	returns = {},
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
	returns = {},
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
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
	params = {
		{
			name = "unitGUID",
			type = "UnitToken",
			default = "player",
			examples = {
				{ value = "unit", label = "BigWigs_Plugins" },
				{ value = "unit", label = "Details" },
				{ value = "name", label = "MRT" },
			},
		},
		{ name = "distIndex", type = "luaIndex", default = nil },
	},
	returns = { { name = "result", type = "bool", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["CinematicFinished"] = {
	key = "CinematicFinished",
	name = "CinematicFinished",
	category = "combat_midnight",
	subcategory = "global",
	func = _G["CinematicFinished"],
	funcPath = "CinematicFinished",
	params = {
		{ name = "movieType", type = "CinematicType", default = nil },
		{ name = "userCanceled", type = "bool", default = false },
		{ name = "didError", type = "bool", default = false },
	},
	returns = {},
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
	params = {
		{ name = "movieType", type = "CinematicType", default = nil },
		{ name = "movieID", type = "number", default = nil },
		{ name = "canCancel", type = "bool", default = true },
	},
	returns = {},
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

APIDefs["ClearPoint"] = {
	key = "ClearPoint",
	name = "ClearPoint",
	category = "combat_midnight",
	subcategory = "global",
	func = _G["ClearPoint"],
	funcPath = "ClearPoint",
	params = { { name = "point", type = "FramePoint", default = nil } },
	returns = {},
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["ClearRaidMarker"] = {
	key = "ClearRaidMarker",
	name = "ClearRaidMarker",
	category = "combat_midnight",
	subcategory = "global",
	func = _G["ClearRaidMarker"],
	funcPath = "ClearRaidMarker",
	params = { { name = "raidMarkerIndex", type = "luaIndex", default = nil } },
	returns = {},
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["ClosestGameObjectPosition"] = {
	key = "ClosestGameObjectPosition",
	name = "ClosestGameObjectPosition",
	category = "combat_midnight",
	subcategory = "global",
	func = _G["ClosestGameObjectPosition"],
	funcPath = "ClosestGameObjectPosition",
	params = { { name = "gameObjectID", type = "number", default = nil } },
	returns = {
		{ name = "xPos", type = "number", canBeSecret = true },
		{ name = "yPos", type = "number", canBeSecret = true },
		{ name = "distance", type = "number", canBeSecret = true },
	},
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
	returns = {
		{ name = "xPos", type = "number", canBeSecret = true },
		{ name = "yPos", type = "number", canBeSecret = true },
		{ name = "distance", type = "number", canBeSecret = true },
	},
	midnightImpact = "HIGH",
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted, SecretReturns",
}

APIDefs["ConsoleEcho"] = {
	key = "ConsoleEcho",
	name = "ConsoleEcho",
	category = "combat_midnight",
	subcategory = "global",
	func = _G["ConsoleEcho"],
	funcPath = "ConsoleEcho",
	params = {
		{ name = "command", type = "cstring", default = nil },
		{ name = "addToHistory", type = "bool", default = false },
		{ name = "prefix", type = "cstring", default = nil },
	},
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
	params = {
		{
			name = "command",
			type = "cstring",
			default = nil,
			examples = {
				{ value = "taintLog 0", label = "Leatrix_Plus" },
				{ value = "taintLog 1", label = "Leatrix_Plus" },
				{ value = "taintLog 2", label = "Leatrix_Plus" },
			},
		},
		{ name = "addToHistory", type = "bool", default = false },
	},
	returns = { { name = "result", type = "bool", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
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

APIDefs["ConsolePrintAllMatchingCommands"] = {
	key = "ConsolePrintAllMatchingCommands",
	name = "ConsolePrintAllMatchingCommands",
	category = "combat_midnight",
	subcategory = "global",
	func = _G["ConsolePrintAllMatchingCommands"],
	funcPath = "ConsolePrintAllMatchingCommands",
	params = { { name = "partialCommandText", type = "cstring", default = nil } },
	returns = {},
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
	params = {
		{
			name = "fontHeightInPixels",
			type = "number",
			default = nil,
			examples = { { value = 28, label = "Leatrix_Plus" } },
		},
	},
	returns = {},
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["CopyFontObject"] = {
	key = "CopyFontObject",
	name = "CopyFontObject",
	category = "combat_midnight",
	subcategory = "global",
	func = _G["CopyFontObject"],
	funcPath = "CopyFontObject",
	params = {
		{
			name = "sourceFont",
			type = "SimpleFont",
			default = nil,
			examples = {
				{ value = "GameFontNormal", label = "Dominos_Config" },
				{ value = "ZoneTextFont2", label = "Plumber" },
			},
		},
	},
	returns = {},
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
	params = {
		{
			name = "text",
			type = "cstring",
			default = nil,
			examples = {
				{ value = "all", label = "WeakAurasOptions" },
				{ value = "display", label = "WeakAurasOptions" },
				{ value = "display", label = "WeakAurasOptions" },
			},
		},
		{ name = "removeMarkup", type = "bool", default = false },
	},
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
	params = {
		{
			name = "name",
			type = "cstring",
			default = nil,
			examples = {
				{ value = "AT", label = "Narcissus" },
				{ value = nil, label = "Narcissus" },
				{ value = nil, label = "Narcissus" },
			},
		},
		{ name = "template", type = "cstring", default = nil },
	},
	returns = {},
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
	params = {
		{
			name = "animationType",
			type = "cstring",
			default = nil,
			examples = {
				{ value = "rotation", label = "WeakAuras" },
				{ value = "Alpha", label = "AstralKeys" },
				{ value = "Alpha", label = "Baganator" },
			},
		},
		{ name = "name", type = "cstring", default = nil },
		{ name = "templateName", type = "cstring", default = nil },
	},
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
	params = {
		{
			name = "name",
			type = "cstring",
			default = nil,
			examples = {
				{ value = "DetailsNewDamageRecordAnimationGroup", label = "Details" },
				{ value = "DetailsMythicLevelTextAnimationGroup", label = "Details" },
			},
		},
		{ name = "templateName", type = "cstring", default = nil },
	},
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
	params = {
		{
			name = "name",
			type = "cstring",
			default = nil,
			examples = { { value = nil, label = "Narcissus" }, { value = nil, label = "Narcissus" } },
		},
		{ name = "templateName", type = "cstring", default = nil },
		{ name = "order", type = "number", default = nil },
	},
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

APIDefs["CreateWindow"] = {
	key = "CreateWindow",
	name = "CreateWindow",
	category = "combat_midnight",
	subcategory = "global",
	func = _G["CreateWindow"],
	funcPath = "CreateWindow",
	params = {
		{
			name = "popupStyle",
			type = "bool",
			default = true,
			examples = { { value = [=[{ 		name = "WeeklyDiscoveryFrame"]=], label = "Weekly" } },
		},
		{ name = "topMost", type = "bool", default = false },
	},
	returns = { { name = "window", type = "SimpleWindow", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["CycleVariation"] = {
	key = "CycleVariation",
	name = "CycleVariation",
	category = "combat_midnight",
	subcategory = "global",
	func = _G["CycleVariation"],
	funcPath = "CycleVariation",
	params = {
		{ name = "variationIndex", type = "luaIndex", default = nil },
		{ name = "delta", type = "number", default = nil },
	},
	returns = {},
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["DeclineName"] = {
	key = "DeclineName",
	name = "DeclineName",
	category = "combat_midnight",
	subcategory = "global",
	func = _G["DeclineName"],
	funcPath = "DeclineName",
	params = {
		{ name = "name", type = "cstring", default = nil },
		{ name = "gender", type = "UnitSex", default = nil },
		{ name = "declensionSet", type = "luaIndex", default = nil },
	},
	returns = { { name = "declinedNames", type = "string", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["DestroyTotem"] = {
	key = "DestroyTotem",
	name = "DestroyTotem",
	category = "combat_midnight",
	subcategory = "global",
	func = _G["DestroyTotem"],
	funcPath = "DestroyTotem",
	params = { { name = "slot", type = "luaIndex", default = nil } },
	returns = {},
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

APIDefs["Drag"] = {
	key = "Drag",
	name = "Drag",
	category = "combat_midnight",
	subcategory = "global",
	func = _G["Drag"],
	funcPath = "Drag",
	params = { { name = "isAccessible", type = "bool", default = nil } },
	returns = {},
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["DrawBlob"] = {
	key = "DrawBlob",
	name = "DrawBlob",
	category = "combat_midnight",
	subcategory = "global",
	func = _G["DrawBlob"],
	funcPath = "DrawBlob",
	params = { { name = "questID", type = "number", default = nil }, { name = "draw", type = "bool", default = false } },
	returns = {},
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["DressPlayerSlot"] = {
	key = "DressPlayerSlot",
	name = "DressPlayerSlot",
	category = "combat_midnight",
	subcategory = "global",
	func = _G["DressPlayerSlot"],
	funcPath = "DressPlayerSlot",
	params = { { name = "invSlot", type = "luaIndex", default = nil } },
	returns = {},
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["EjectPassengerFromSeat"] = {
	key = "EjectPassengerFromSeat",
	name = "EjectPassengerFromSeat",
	category = "combat_midnight",
	subcategory = "global",
	func = _G["EjectPassengerFromSeat"],
	funcPath = "EjectPassengerFromSeat",
	params = { { name = "virtualSeatIndex", type = "luaIndex", default = nil } },
	returns = {},
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["EnableMerging"] = {
	key = "EnableMerging",
	name = "EnableMerging",
	category = "combat_midnight",
	subcategory = "global",
	func = _G["EnableMerging"],
	funcPath = "EnableMerging",
	params = { { name = "enable", type = "bool", default = false } },
	returns = {},
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
	returns = {},
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
	returns = {},
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
	returns = {},
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
	params = {
		{
			name = "itemID",
			type = "number",
			default = nil,
			examples = {
				{ value = 111532, label = "Narcissus" },
				{ value = 130105, label = "Narcissus" },
				{ value = "weapons[1]", label = "Narcissus" },
			},
		},
	},
	returns = {},
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
	returns = {},
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
	params = {
		{ name = "curve", type = "LuaCurveObjectBase", default = nil },
		{ name = "modifier", type = "DurationTimeModifier", default = "RealTime" },
	},
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
	params = {
		{ name = "curve", type = "LuaCurveObjectBase", default = nil },
		{ name = "modifier", type = "DurationTimeModifier", default = "RealTime" },
	},
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
	returns = {
		{ name = "yR", type = "number", canBeSecret = false },
		{ name = "yG", type = "number", canBeSecret = false },
		{ name = "yB", type = "number", canBeSecret = false },
		{ name = "yA", type = "number", canBeSecret = false },
	},
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["FlashClientIcon"] = {
	key = "FlashClientIcon",
	name = "FlashClientIcon",
	category = "combat_midnight",
	subcategory = "global",
	func = _G["FlashClientIcon"],
	funcPath = "FlashClientIcon",
	params = { { name = "briefly", type = "bool", default = false } },
	returns = {},
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["FocusUnit"] = {
	key = "FocusUnit",
	name = "FocusUnit",
	category = "combat_midnight",
	subcategory = "global",
	func = _G["FocusUnit"],
	funcPath = "FocusUnit",
	params = {
		{ name = "name", type = "cstring", default = "", examples = { { value = "unit", label = "Details" } } },
	},
	returns = {},
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
	params = {
		{ name = "name", type = "cstring", default = "0", examples = { { value = "unit", label = "Details" } } },
		{ name = "exactMatch", type = "bool", default = false },
	},
	returns = {},
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["FreezeAnimation"] = {
	key = "FreezeAnimation",
	name = "FreezeAnimation",
	category = "combat_midnight",
	subcategory = "global",
	func = _G["FreezeAnimation"],
	funcPath = "FreezeAnimation",
	params = {
		{
			name = "anim",
			type = "AnimationDataEnum",
			default = nil,
			examples = {
				{ value = 0, label = "Narcissus" },
				{ value = 1056, label = "Narcissus" },
				{ value = 4, label = "Narcissus" },
			},
		},
		{ name = "variation", type = "number", default = nil },
		{ name = "frame", type = "number", default = nil },
	},
	returns = {},
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["GetActorAtIndex"] = {
	key = "GetActorAtIndex",
	name = "GetActorAtIndex",
	category = "combat_midnight",
	subcategory = "global",
	func = _G["GetActorAtIndex"],
	funcPath = "GetActorAtIndex",
	params = { { name = "index", type = "luaIndex", default = nil } },
	returns = {},
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
	params = {
		{
			name = "name",
			type = "uiAddon",
			default = nil,
			examples = {
				{ value = "Details", label = "Details" },
				{ value = "Leatrix_Maps", label = "Leatrix_Maps" },
				{ value = "Leatrix_Plus", label = "Leatrix_Plus" },
			},
		},
	},
	returns = { { name = "result", type = "number", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
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
	params = {
		{ name = "ratingIndex", type = "luaIndex", default = nil },
		{ name = "value", type = "number", default = nil },
	},
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
	params = {
		{
			name = "unit",
			type = "UnitToken",
			default = "player",
			examples = { { value = "unit", label = "WeakAuras" }, { value = "player", label = "Plater" } },
		},
		{ name = "target", type = "UnitToken", default = "player" },
	},
	returns = { { name = "result", type = "number", canBeSecret = false } },
	midnightImpact = "CONDITIONAL",
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted, SecretWhenUnitComboPointsRestricted",
}

APIDefs["GetDifficultyInfo"] = {
	key = "GetDifficultyInfo",
	name = "GetDifficultyInfo",
	category = "combat_midnight",
	subcategory = "global",
	func = _G["GetDifficultyInfo"],
	funcPath = "GetDifficultyInfo",
	params = {
		{
			name = "difficultyID",
			type = "number",
			default = nil,
			examples = {
				{ value = 3, label = "AllTheThings" },
				{ value = 7, label = "AllTheThings" },
				{ value = 1, label = "AllTheThings" },
			},
		},
	},
	returns = {
		{ name = "name", type = "cstring", canBeSecret = false },
		{ name = "instanceType", type = "cstring", canBeSecret = false },
		{ name = "isHeroic", type = "bool", canBeSecret = false },
		{ name = "isChallengeMode", type = "bool", canBeSecret = false },
		{ name = "displayHeroic", type = "bool", canBeSecret = false },
		{ name = "displayMythic", type = "bool", canBeSecret = false },
		{ name = "toggleDifficultyID", type = "number", canBeSecret = false },
		{ name = "isLFR", type = "bool", canBeSecret = false },
		{ name = "minPlayers", type = "number", canBeSecret = false },
		{ name = "maxPlayers", type = "number", canBeSecret = false },
		{ name = "isUserSelectable", type = "bool", canBeSecret = false },
	},
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
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

APIDefs["GetEventTime"] = {
	key = "GetEventTime",
	name = "GetEventTime",
	category = "combat_midnight",
	subcategory = "global",
	func = _G["GetEventTime"],
	funcPath = "GetEventTime",
	params = { { name = "eventProfileIndex", type = "number", default = nil } },
	returns = {
		{ name = "totalElapsedTime", type = "number", canBeSecret = false },
		{ name = "numExecutedHandlers", type = "number", canBeSecret = false },
		{ name = "slowestHandlerName", type = "cstring", canBeSecret = false },
		{ name = "slowestHandlerTime", type = "number", canBeSecret = false },
	},
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
	params = {
		{ name = "expansionLevel", type = "number", default = nil },
		{ name = "desiredReleaseType", type = "ReleaseType", default = nil },
	},
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

APIDefs["GetFileIDFromPath"] = {
	key = "GetFileIDFromPath",
	name = "GetFileIDFromPath",
	category = "combat_midnight",
	subcategory = "global",
	func = _G["GetFileIDFromPath"],
	funcPath = "GetFileIDFromPath",
	params = {
		{
			name = "filePath",
			type = "cstring",
			default = nil,
			examples = { { value = "Interface/Buttons/UI-MinusButton-Up", label = "BagBrother" } },
		},
	},
	returns = { { name = "fileID", type = "fileID", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["GetFilterTagStatus"] = {
	key = "GetFilterTagStatus",
	name = "GetFilterTagStatus",
	category = "combat_midnight",
	subcategory = "global",
	func = _G["GetFilterTagStatus"],
	funcPath = "GetFilterTagStatus",
	params = {
		{ name = "groupID", type = "number", default = nil },
		{ name = "tagID", type = "number", default = nil },
	},
	returns = { { name = "active", type = "bool", canBeSecret = false } },
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

APIDefs["GetFrameCPUUsage"] = {
	key = "GetFrameCPUUsage",
	name = "GetFrameCPUUsage",
	category = "combat_midnight",
	subcategory = "global",
	func = _G["GetFrameCPUUsage"],
	funcPath = "GetFrameCPUUsage",
	params = {
		{ name = "frame", type = "SimpleFrame", default = nil },
		{ name = "includeChildren", type = "bool", default = false },
	},
	returns = {
		{ name = "call_time", type = "number", canBeSecret = false },
		{ name = "call_count", type = "number", canBeSecret = false },
	},
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["GetGameMessageInfo"] = {
	key = "GetGameMessageInfo",
	name = "GetGameMessageInfo",
	category = "combat_midnight",
	subcategory = "global",
	func = _G["GetGameMessageInfo"],
	funcPath = "GetGameMessageInfo",
	params = { { name = "gameErrorIndex", type = "luaIndex", default = nil } },
	returns = {
		{ name = "errorName", type = "cstring", canBeSecret = false },
		{ name = "soundKitID", type = "number", canBeSecret = false },
		{ name = "voiceID", type = "number", canBeSecret = false },
	},
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["GetInstanceLockTimeRemainingEncounter"] = {
	key = "GetInstanceLockTimeRemainingEncounter",
	name = "GetInstanceLockTimeRemainingEncounter",
	category = "combat_midnight",
	subcategory = "global",
	func = _G["GetInstanceLockTimeRemainingEncounter"],
	funcPath = "GetInstanceLockTimeRemainingEncounter",
	params = { { name = "encounterIndex", type = "luaIndex", default = nil } },
	returns = {
		{ name = "encounterName", type = "cstring", canBeSecret = false },
		{ name = "texture", type = "cstring", canBeSecret = false },
		{ name = "isKilled", type = "bool", canBeSecret = false },
		{ name = "ineligible", type = "bool", canBeSecret = false },
	},
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

APIDefs["GetLowerEmblemTexture"] = {
	key = "GetLowerEmblemTexture",
	name = "GetLowerEmblemTexture",
	category = "combat_midnight",
	subcategory = "global",
	func = _G["GetLowerEmblemTexture"],
	funcPath = "GetLowerEmblemTexture",
	params = { { name = "texture", type = "SimpleTexture", default = nil } },
	returns = {},
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
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

APIDefs["GetMirrorTimerInfo"] = {
	key = "GetMirrorTimerInfo",
	name = "GetMirrorTimerInfo",
	category = "combat_midnight",
	subcategory = "global",
	func = _G["GetMirrorTimerInfo"],
	funcPath = "GetMirrorTimerInfo",
	params = { { name = "timerIndex", type = "luaIndex", default = nil } },
	returns = {
		{ name = "name", type = "cstring", canBeSecret = false },
		{ name = "startValue", type = "number", canBeSecret = false },
		{ name = "maxValue", type = "number", canBeSecret = false },
		{ name = "scale", type = "number", canBeSecret = false },
		{ name = "paused", type = "number", canBeSecret = false },
		{ name = "label", type = "cstring", canBeSecret = false },
		{ name = "spellID", type = "number", canBeSecret = false },
	},
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

APIDefs["GetMovieDownloadProgress"] = {
	key = "GetMovieDownloadProgress",
	name = "GetMovieDownloadProgress",
	category = "combat_midnight",
	subcategory = "global",
	func = _G["GetMovieDownloadProgress"],
	funcPath = "GetMovieDownloadProgress",
	params = { { name = "movieId", type = "number", default = nil } },
	returns = {
		{ name = "inProgress", type = "bool", canBeSecret = false },
		{ name = "downloaded", type = "BigUInteger", canBeSecret = false },
		{ name = "total", type = "BigUInteger", canBeSecret = false },
	},
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["GetNumDeclensionSets"] = {
	key = "GetNumDeclensionSets",
	name = "GetNumDeclensionSets",
	category = "combat_midnight",
	subcategory = "global",
	func = _G["GetNumDeclensionSets"],
	funcPath = "GetNumDeclensionSets",
	params = {
		{ name = "name", type = "cstring", default = nil },
		{ name = "gender", type = "UnitSex", default = nil },
	},
	returns = { { name = "numDeclensionSets", type = "number", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["GetPlayerInfoByGUID"] = {
	key = "GetPlayerInfoByGUID",
	name = "GetPlayerInfoByGUID",
	category = "combat_midnight",
	subcategory = "global",
	func = _G["GetPlayerInfoByGUID"],
	funcPath = "GetPlayerInfoByGUID",
	params = {
		{
			name = "guid",
			type = "WOWGUID",
			default = nil,
			examples = {
				{ value = "guid", label = "AllTheThings" },
				{ value = "id", label = "AllTheThings" },
				{ value = [=[self.serial or ""]=], label = "Details" },
			},
		},
	},
	returns = {
		{ name = "localizedClass", type = "cstring", canBeSecret = false },
		{ name = "englishClass", type = "cstring", canBeSecret = false },
		{ name = "localizedRace", type = "cstring", canBeSecret = false },
		{ name = "englishRace", type = "cstring", canBeSecret = false },
		{ name = "sex", type = "number", canBeSecret = false },
		{ name = "name", type = "cstring", canBeSecret = false },
		{ name = "realmName", type = "cstring", canBeSecret = false },
	},
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenTainted",
}

APIDefs["GetPoint"] = {
	key = "GetPoint",
	name = "GetPoint",
	category = "combat_midnight",
	subcategory = "global",
	func = _G["GetPoint"],
	funcPath = "GetPoint",
	params = {
		{
			name = "anchorIndex",
			type = "luaIndex",
			default = 0,
			examples = { { value = 1, label = "WeakAuras" }, { value = 2, label = "DejaCharacterStats" } },
		},
		{ name = "resolveCollapsed", type = "bool", default = false },
	},
	returns = {
		{ name = "point", type = "FramePoint", canBeSecret = false },
		{ name = "relativeTo", type = "ScriptRegion", canBeSecret = false },
		{ name = "relativePoint", type = "FramePoint", canBeSecret = false },
		{ name = "offsetX", type = "uiUnit", canBeSecret = false },
		{ name = "offsetY", type = "uiUnit", canBeSecret = false },
	},
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
	params = {
		{
			name = "point",
			type = "FramePoint",
			default = nil,
			examples = { { value = "LEFT", label = "AllTheThings" }, { value = "TOPLEFT", label = "Auctionator" } },
		},
		{ name = "resolveCollapsed", type = "bool", default = false },
	},
	returns = {
		{ name = "point", type = "FramePoint", canBeSecret = false },
		{ name = "relativeTo", type = "ScriptRegion", canBeSecret = false },
		{ name = "relativePoint", type = "FramePoint", canBeSecret = false },
		{ name = "offsetX", type = "uiUnit", canBeSecret = false },
		{ name = "offsetY", type = "uiUnit", canBeSecret = false },
	},
	midnightImpact = "CONDITIONAL",
	midnightNote = "Secret behavior: SecretWhenAnchoringSecret, SecretArguments=AllowedWhenUntainted",
}

APIDefs["GetPowerRegenForPowerType"] = {
	key = "GetPowerRegenForPowerType",
	name = "GetPowerRegenForPowerType",
	category = "combat_midnight",
	subcategory = "global",
	func = _G["GetPowerRegenForPowerType"],
	funcPath = "GetPowerRegenForPowerType",
	params = { { name = "powerType", type = "number", default = nil } },
	returns = {
		{ name = "basePowerRegen", type = "number", canBeSecret = false },
		{ name = "castingPowerRegen", type = "number", canBeSecret = false },
	},
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["GetRaidTargetIndex"] = {
	key = "GetRaidTargetIndex",
	name = "GetRaidTargetIndex",
	category = "combat_midnight",
	subcategory = "global",
	func = _G["GetRaidTargetIndex"],
	funcPath = "GetRaidTargetIndex",
	params = {
		{
			name = "target",
			type = "UnitToken",
			default = "player",
			examples = {
				{ value = "unit", label = "WeakAuras" },
				{ value = "player", label = "BigWigs_Plugins" },
				{ value = "frame.unit", label = "DandersFrames" },
			},
		},
	},
	returns = { { name = "result", type = "luaIndex", canBeSecret = true } },
	midnightImpact = "HIGH",
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted, SecretReturns",
}

APIDefs["GetRealZoneText"] = {
	key = "GetRealZoneText",
	name = "GetRealZoneText",
	category = "combat_midnight",
	subcategory = "global",
	func = _G["GetRealZoneText"],
	funcPath = "GetRealZoneText",
	params = {
		{
			name = "mapID",
			type = "number",
			default = nil,
			examples = {
				{ value = "id", label = "BigWigs" },
				{ value = "teleport[1]", label = "DBM-Core" },
				{ value = "tonumber(string.sub(name", label = "DBM-Core" },
			},
		},
	},
	returns = { { name = "text", type = "cstring", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
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

APIDefs["GetRuneCooldown"] = {
	key = "GetRuneCooldown",
	name = "GetRuneCooldown",
	category = "combat_midnight",
	subcategory = "global",
	func = _G["GetRuneCooldown"],
	funcPath = "GetRuneCooldown",
	params = {
		{
			name = "runeIndex",
			type = "luaIndex",
			default = nil,
			examples = { { value = "id", label = "WeakAuras" }, { value = 1, label = "DejaCharacterStats" } },
		},
	},
	returns = {
		{ name = "startTime", type = "number", canBeSecret = false },
		{ name = "duration", type = "number", canBeSecret = false },
		{ name = "isRuneReady", type = "bool", canBeSecret = false },
	},
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

APIDefs["GetScript"] = {
	key = "GetScript",
	name = "GetScript",
	category = "combat_midnight",
	subcategory = "global",
	func = _G["GetScript"],
	funcPath = "GetScript",
	params = {
		{
			name = "scriptTypeName",
			type = "cstring",
			default = nil,
			examples = {
				{ value = "OnEvent", label = "WeakAuras" },
				{ value = "OnTextSet", label = "WeakAurasOptions" },
				{ value = "OnTextChanged", label = "WeakAurasOptions" },
			},
		},
		{ name = "bindingType", type = "number", default = nil },
	},
	returns = { { name = "script", type = "luaFunction", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["GetSpecializationInfoForClassID"] = {
	key = "GetSpecializationInfoForClassID",
	name = "GetSpecializationInfoForClassID",
	category = "combat_midnight",
	subcategory = "global",
	func = _G["GetSpecializationInfoForClassID"],
	funcPath = "GetSpecializationInfoForClassID",
	params = {
		{
			name = "classID",
			type = "number",
			default = nil,
			examples = {
				{ value = "classID", label = "Plater" },
				{ value = "classID", label = "Plater" },
				{ value = "classID", label = "TalentTreeTweaks" },
			},
		},
		{ name = "index", type = "luaIndex", default = nil },
		{ name = "gender", type = "UnitSex", default = nil },
	},
	returns = {
		{ name = "id", type = "number", canBeSecret = false },
		{ name = "name", type = "cstring", canBeSecret = false },
		{ name = "description", type = "string", canBeSecret = false },
		{ name = "icon", type = "fileID", canBeSecret = false },
		{ name = "role", type = "cstring", canBeSecret = false },
		{ name = "recommended", type = "bool", canBeSecret = false },
		{ name = "allowedForBoost", type = "bool", canBeSecret = false },
		{ name = "masterySpell1", type = "number", canBeSecret = false },
		{ name = "masterySpell2", type = "number", canBeSecret = false },
	},
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
	params = {
		{ name = "specID", type = "number", default = nil },
		{ name = "gender", type = "UnitSex", default = nil },
	},
	returns = {
		{ name = "id", type = "number", canBeSecret = false },
		{ name = "name", type = "cstring", canBeSecret = false },
		{ name = "description", type = "string", canBeSecret = false },
		{ name = "icon", type = "fileID", canBeSecret = false },
		{ name = "role", type = "cstring", canBeSecret = false },
		{ name = "recommended", type = "bool", canBeSecret = false },
		{ name = "allowedForBoost", type = "bool", canBeSecret = false },
		{ name = "masterySpell1", type = "number", canBeSecret = false },
		{ name = "masterySpell2", type = "number", canBeSecret = false },
	},
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
	params = {
		{ name = "specID", type = "number", default = nil },
		{ name = "gender", type = "UnitSex", default = nil },
	},
	returns = { { name = "name", type = "cstring", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
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

APIDefs["GetThreatStatusColor"] = {
	key = "GetThreatStatusColor",
	name = "GetThreatStatusColor",
	category = "combat_midnight",
	subcategory = "global",
	func = _G["GetThreatStatusColor"],
	funcPath = "GetThreatStatusColor",
	params = { { name = "gameErrorIndex", type = "number", default = nil } },
	returns = {
		{ name = "colorR", type = "number", canBeSecret = false },
		{ name = "colorG", type = "number", canBeSecret = false },
		{ name = "colorB", type = "number", canBeSecret = false },
	},
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["GetTitleName"] = {
	key = "GetTitleName",
	name = "GetTitleName",
	category = "combat_midnight",
	subcategory = "global",
	func = _G["GetTitleName"],
	funcPath = "GetTitleName",
	params = {
		{ name = "titleMaskID", type = "number", default = nil, examples = { { value = "id", label = "Plumber" } } },
	},
	returns = {
		{ name = "titleString", type = "string", canBeSecret = false },
		{ name = "playerTitle", type = "bool", canBeSecret = false },
	},
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
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
	returns = {
		{ name = "haveTotem", type = "bool", canBeSecret = false },
		{ name = "totemName", type = "cstring", canBeSecret = false },
		{ name = "startTime", type = "number", canBeSecret = false },
		{ name = "duration", type = "number", canBeSecret = false },
		{ name = "icon", type = "fileID", canBeSecret = false },
		{ name = "modRate", type = "number", canBeSecret = false },
		{ name = "spellID", type = "number", canBeSecret = false },
	},
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

APIDefs["GetUICameraInfo"] = {
	key = "GetUICameraInfo",
	name = "GetUICameraInfo",
	category = "combat_midnight",
	subcategory = "global",
	func = _G["GetUICameraInfo"],
	funcPath = "GetUICameraInfo",
	params = { { name = "uiCameraID", type = "number", default = nil } },
	returns = {
		{ name = "posX", type = "number", canBeSecret = false },
		{ name = "posY", type = "number", canBeSecret = false },
		{ name = "posZ", type = "number", canBeSecret = false },
		{ name = "lookAtX", type = "number", canBeSecret = false },
		{ name = "lookAtY", type = "number", canBeSecret = false },
		{ name = "lookAtZ", type = "number", canBeSecret = false },
		{ name = "animID", type = "number", canBeSecret = false },
		{ name = "animVariation", type = "number", canBeSecret = false },
		{ name = "animFrame", type = "number", canBeSecret = false },
		{ name = "useModelCenter", type = "bool", canBeSecret = false },
	},
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["GetUnitChargedPowerPoints"] = {
	key = "GetUnitChargedPowerPoints",
	name = "GetUnitChargedPowerPoints",
	category = "combat_midnight",
	subcategory = "global",
	func = _G["GetUnitChargedPowerPoints"],
	funcPath = "GetUnitChargedPowerPoints",
	params = {
		{
			name = "unit",
			type = "UnitToken",
			default = "player",
			examples = { { value = "player", label = "WeakAuras" }, { value = "player", label = "Plater" } },
		},
	},
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
	params = {
		{
			name = "unit",
			type = "UnitToken",
			default = "player",
			examples = { { value = "unit", label = "WeakAuras" }, { value = "self.unit", label = "Plater" } },
		},
	},
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
	params = {
		{
			name = "unit",
			type = "UnitToken",
			default = "player",
			examples = { { value = "unit", label = "WeakAuras" } },
		},
		{ name = "index", type = "number", default = nil },
	},
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
	params = {
		{
			name = "unit",
			type = "UnitToken",
			default = "player",
			examples = { { value = "player", label = "WeakAuras" }, { value = "player", label = "Narcissus" } },
		},
	},
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
	params = {
		{
			name = "unitToken",
			type = "UnitToken",
			default = "player",
			examples = { { value = "unit", label = "WeakAuras" } },
		},
	},
	returns = {
		{ name = "name", type = "cstring", canBeSecret = false },
		{ name = "tooltip", type = "cstring", canBeSecret = false },
		{ name = "cost", type = "cstring", canBeSecret = false },
	},
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
	returns = {
		{ name = "name", type = "cstring", canBeSecret = false },
		{ name = "tooltip", type = "cstring", canBeSecret = false },
		{ name = "cost", type = "cstring", canBeSecret = false },
	},
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
	params = {
		{
			name = "unitToken",
			type = "UnitToken",
			default = "player",
			examples = { { value = "unit", label = "WeakAuras" } },
		},
		{ name = "textureIndex", type = "luaIndex", default = nil },
		{ name = "timerIndex", type = "luaIndex", default = nil },
	},
	returns = {
		{ name = "texture", type = "fileID", canBeSecret = false },
		{ name = "colorR", type = "number", canBeSecret = false },
		{ name = "colorG", type = "number", canBeSecret = false },
		{ name = "colorB", type = "number", canBeSecret = false },
		{ name = "colorA", type = "number", canBeSecret = false },
	},
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
	params = {
		{ name = "barID", type = "number", default = nil },
		{ name = "textureIndex", type = "luaIndex", default = nil },
	},
	returns = {
		{ name = "texture", type = "fileID", canBeSecret = false },
		{ name = "colorR", type = "number", canBeSecret = false },
		{ name = "colorG", type = "number", canBeSecret = false },
		{ name = "colorB", type = "number", canBeSecret = false },
		{ name = "colorA", type = "number", canBeSecret = false },
	},
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
	params = {
		{
			name = "unit",
			type = "UnitToken",
			default = "player",
			examples = {
				{ value = "player", label = "WeakAuras" },
				{ value = "player", label = "WeakAuras" },
				{ value = "unit", label = "DejaCharacterStats" },
			},
		},
	},
	returns = {
		{ name = "currentSpeed", type = "number", canBeSecret = false },
		{ name = "runSpeed", type = "number", canBeSecret = false },
		{ name = "flightSpeed", type = "number", canBeSecret = false },
		{ name = "swimSpeed", type = "number", canBeSecret = false },
	},
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

APIDefs["GetUpperEmblemTexture"] = {
	key = "GetUpperEmblemTexture",
	name = "GetUpperEmblemTexture",
	category = "combat_midnight",
	subcategory = "global",
	func = _G["GetUpperEmblemTexture"],
	funcPath = "GetUpperEmblemTexture",
	params = { { name = "texture", type = "SimpleTexture", default = nil } },
	returns = {},
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["GetVehicleUIIndicator"] = {
	key = "GetVehicleUIIndicator",
	name = "GetVehicleUIIndicator",
	category = "combat_midnight",
	subcategory = "global",
	func = _G["GetVehicleUIIndicator"],
	funcPath = "GetVehicleUIIndicator",
	params = { { name = "vehicleIndicatorID", type = "number", default = nil } },
	returns = {
		{ name = "backgroundTextureID", type = "fileID", canBeSecret = false },
		{ name = "numSeatIndicators", type = "number", canBeSecret = false },
	},
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
	params = {
		{ name = "vehicleIndicatorID", type = "number", default = nil },
		{ name = "indicatorSeatIndex", type = "luaIndex", default = nil },
	},
	returns = {
		{ name = "virtualSeatIndex", type = "number", canBeSecret = false },
		{ name = "xPos", type = "number", canBeSecret = false },
		{ name = "yPos", type = "number", canBeSecret = false },
	},
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

APIDefs["HasAnimation"] = {
	key = "HasAnimation",
	name = "HasAnimation",
	category = "combat_midnight",
	subcategory = "global",
	func = _G["HasAnimation"],
	funcPath = "HasAnimation",
	params = {
		{
			name = "anim",
			type = "AnimationDataEnum",
			default = nil,
			examples = { { value = "id", label = "Narcissus" } },
		},
	},
	returns = { { name = "hasAnimation", type = "bool", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
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

APIDefs["HasScript"] = {
	key = "HasScript",
	name = "HasScript",
	category = "combat_midnight",
	subcategory = "global",
	func = _G["HasScript"],
	funcPath = "HasScript",
	params = {
		{
			name = "scriptName",
			type = "cstring",
			default = nil,
			examples = {
				{ value = "OnMouseDown", label = "MoveAny" },
				{ value = "OnMouseUp", label = "MoveAny" },
				{ value = "OnTooltipAddMoney", label = "Narcissus" },
			},
		},
	},
	returns = { { name = "hasScript", type = "bool", canBeSecret = false } },
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
	params = {
		{
			name = "scriptTypeName",
			type = "cstring",
			default = nil,
			examples = {
				{ value = "OnSizeChanged", label = "WeakAuras" },
				{ value = "OnVerticalScroll", label = "WeakAurasOptions" },
				{ value = "OnScrollRangeChanged", label = "WeakAurasOptions" },
			},
		},
		{ name = "script", type = "luaFunction", default = nil },
		{ name = "bindingType", type = "number", default = nil },
	},
	returns = {},
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["InitializeCamera"] = {
	key = "InitializeCamera",
	name = "InitializeCamera",
	category = "combat_midnight",
	subcategory = "global",
	func = _G["InitializeCamera"],
	funcPath = "InitializeCamera",
	params = { { name = "scaleFactor", type = "number", default = 0 } },
	returns = {},
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
	returns = {},
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["InitiateTrade"] = {
	key = "InitiateTrade",
	name = "InitiateTrade",
	category = "combat_midnight",
	subcategory = "global",
	func = _G["InitiateTrade"],
	funcPath = "InitiateTrade",
	params = { { name = "guid", type = "UnitToken", default = "player" } },
	returns = {},
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["IsFalling"] = {
	key = "IsFalling",
	name = "IsFalling",
	category = "combat_midnight",
	subcategory = "global",
	func = _G["IsFalling"],
	funcPath = "IsFalling",
	params = {
		{
			name = "unit",
			type = "UnitToken",
			default = "player",
			examples = { { value = "unit", label = "DejaCharacterStats" } },
		},
	},
	returns = { { name = "result", type = "bool", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["IsFlying"] = {
	key = "IsFlying",
	name = "IsFlying",
	category = "combat_midnight",
	subcategory = "global",
	func = _G["IsFlying"],
	funcPath = "IsFlying",
	params = {
		{
			name = "unit",
			type = "UnitToken",
			default = "player",
			examples = { { value = "unit", label = "DejaCharacterStats" }, { value = "player", label = "Narcissus" } },
		},
	},
	returns = { { name = "result", type = "bool", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
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
	params = {
		{
			name = "keyOrMouseName",
			type = "cstring",
			default = nil,
			examples = { { value = "BACKSPACE", label = "Narcissus" } },
		},
		{ name = "excludeBindingState", type = "bool", default = false },
	},
	returns = { { name = "down", type = "bool", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
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

APIDefs["IsMouseButtonDown"] = {
	key = "IsMouseButtonDown",
	name = "IsMouseButtonDown",
	category = "combat_midnight",
	subcategory = "global",
	func = _G["IsMouseButtonDown"],
	funcPath = "IsMouseButtonDown",
	params = {
		{
			name = "button",
			type = "mouseButton",
			default = nil,
			examples = {
				{ value = "LeftButton", label = "WeakAurasOptions" },
				{ value = "RightButton", label = "WeakAurasOptions" },
				{ value = "MiddleButton", label = "MoveAny" },
			},
		},
	},
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
	params = {
		{ name = "movieId", type = "number", default = nil, examples = { { value = "arg1", label = "Leatrix_Plus" } } },
	},
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
	params = {
		{
			name = "unit",
			type = "UnitToken",
			default = "player",
			examples = { { value = "unit", label = "DejaCharacterStats" } },
		},
	},
	returns = { { name = "result", type = "bool", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
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

APIDefs["IsUnitModelReadyForUI"] = {
	key = "IsUnitModelReadyForUI",
	name = "IsUnitModelReadyForUI",
	category = "combat_midnight",
	subcategory = "global",
	func = _G["IsUnitModelReadyForUI"],
	funcPath = "IsUnitModelReadyForUI",
	params = {
		{
			name = "unitToken",
			type = "UnitToken",
			default = "player",
			examples = { { value = "player", label = "Narcissus_Barbershop" } },
		},
	},
	returns = { { name = "isReady", type = "bool", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["LaunchURL"] = {
	key = "LaunchURL",
	name = "LaunchURL",
	category = "combat_midnight",
	subcategory = "global",
	func = _G["LaunchURL"],
	funcPath = "LaunchURL",
	params = { { name = "url", type = "cstring", default = nil } },
	returns = {},
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
	returns = {},
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

APIDefs["Mixin"] = {
	key = "Mixin",
	name = "Mixin",
	category = "combat_midnight",
	subcategory = "global",
	func = _G["Mixin"],
	funcPath = "Mixin",
	params = {
		{
			name = "object",
			type = "LuaValueVariant",
			default = nil,
			examples = {
				{ value = [=[{   player = L["Player"]]=], label = "WeakAuras" },
				{ value = [=[{   player = L["Player"]]=], label = "WeakAuras" },
				{ value = [=[{   player = L["Player"]]=], label = "WeakAuras" },
			},
		},
		{ name = "mixins", type = "LuaValueVariant", default = nil },
	},
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
	returns = {},
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["NavigateHome"] = {
	key = "NavigateHome",
	name = "NavigateHome",
	category = "combat_midnight",
	subcategory = "global",
	func = _G["NavigateHome"],
	funcPath = "NavigateHome",
	params = { { name = "urlType", type = "cstring", default = nil } },
	returns = {},
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["NotifyInspect"] = {
	key = "NotifyInspect",
	name = "NotifyInspect",
	category = "combat_midnight",
	subcategory = "global",
	func = _G["NotifyInspect"],
	funcPath = "NotifyInspect",
	params = {
		{
			name = "targetGUID",
			type = "UnitToken",
			default = "player",
			examples = { { value = "unit", label = "Narcissus" }, { value = "player", label = "Narcissus" } },
		},
	},
	returns = {},
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

APIDefs["OpenTicket"] = {
	key = "OpenTicket",
	name = "OpenTicket",
	category = "combat_midnight",
	subcategory = "global",
	func = _G["OpenTicket"],
	funcPath = "OpenTicket",
	params = { { name = "index", type = "number", default = nil } },
	returns = {},
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["PickupPlayerMoney"] = {
	key = "PickupPlayerMoney",
	name = "PickupPlayerMoney",
	category = "combat_midnight",
	subcategory = "global",
	func = _G["PickupPlayerMoney"],
	funcPath = "PickupPlayerMoney",
	params = { { name = "amount", type = "WOWMONEY", default = nil } },
	returns = {},
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
	params = {
		{ name = "locationX", type = "number", default = nil },
		{ name = "locationY", type = "number", default = nil },
	},
	returns = {},
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
	params = {
		{ name = "index", type = "luaIndex", default = nil },
		{ name = "token", type = "cstring", default = nil },
	},
	returns = {},
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
	params = {
		{
			name = "reverse",
			type = "bool",
			default = false,
			examples = {
				{ value = "helpspirit", label = "DBM-Affixes" },
				{ value = "targetchange", label = "DBM-Affixes" },
				{ value = "range5", label = "DBM-Affixes" },
			},
		},
		{ name = "offset", type = "number", default = 0 },
	},
	returns = {},
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
	params = {
		{ name = "animKit", type = "number", default = nil, examples = { { value = "id", label = "Narcissus" } } },
		{ name = "loop", type = "bool", default = false },
	},
	returns = {},
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
	params = {
		{ name = "animationKit", type = "number", default = nil, examples = { { value = 0, label = "Narcissus" } } },
		{ name = "isLooping", type = "bool", default = false },
	},
	returns = {},
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
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

APIDefs["PreloadMovie"] = {
	key = "PreloadMovie",
	name = "PreloadMovie",
	category = "combat_midnight",
	subcategory = "global",
	func = _G["PreloadMovie"],
	funcPath = "PreloadMovie",
	params = { { name = "movieId", type = "number", default = nil } },
	returns = {},
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
	params = {
		{
			name = "pointX",
			type = "number",
			default = nil,
			examples = {
				{ value = 0, label = "Narcissus" },
				{ value = "x", label = "Narcissus" },
				{ value = "x", label = "Narcissus" },
			},
		},
		{ name = "pointY", type = "number", default = nil },
		{ name = "pointZ", type = "number", default = nil },
	},
	returns = {
		{ name = "point2DX", type = "number", canBeSecret = false },
		{ name = "point2DY", type = "number", canBeSecret = false },
		{ name = "depth", type = "number", canBeSecret = false },
	},
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["RandomRoll"] = {
	key = "RandomRoll",
	name = "RandomRoll",
	category = "combat_midnight",
	subcategory = "global",
	func = _G["RandomRoll"],
	funcPath = "RandomRoll",
	params = {
		{
			name = "min",
			type = "number",
			default = nil,
			examples = { { value = 1, label = "TitanLootType" }, { value = 1, label = "TitanLootType" } },
		},
		{ name = "max", type = "number", default = nil },
	},
	returns = {},
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
	params = {
		{
			name = "eventName",
			type = "cstring",
			default = nil,
			examples = {
				{ value = "HOUSE_LEVEL_FAVOR_UPDATED", label = "Plumber" },
				{ value = "PLAYER_HOUSE_LIST_UPDATED", label = "Plumber" },
			},
		},
		{ name = "callback", type = "EventCallbackType", default = nil },
	},
	returns = {},
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
	params = {
		{ name = "eventName", type = "cstring", default = nil },
		{ name = "callback", type = "EventCallbackType", default = nil },
		{ name = "unit", type = "UnitToken", default = "player" },
	},
	returns = {},
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["RemoveMaskTexture"] = {
	key = "RemoveMaskTexture",
	name = "RemoveMaskTexture",
	category = "combat_midnight",
	subcategory = "global",
	func = _G["RemoveMaskTexture"],
	funcPath = "RemoveMaskTexture",
	params = { { name = "mask", type = "SimpleMaskTexture", default = nil } },
	returns = {},
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
	returns = {},
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["ReplaceIconTexture"] = {
	key = "ReplaceIconTexture",
	name = "ReplaceIconTexture",
	category = "combat_midnight",
	subcategory = "global",
	func = _G["ReplaceIconTexture"],
	funcPath = "ReplaceIconTexture",
	params = { { name = "asset", type = "FileAsset", default = nil } },
	returns = {},
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["ReportBug"] = {
	key = "ReportBug",
	name = "ReportBug",
	category = "combat_midnight",
	subcategory = "global",
	func = _G["ReportBug"],
	funcPath = "ReportBug",
	params = { { name = "description", type = "cstring", default = nil } },
	returns = {},
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
	returns = {},
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
	returns = {},
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["ResetMessageFadeByID"] = {
	key = "ResetMessageFadeByID",
	name = "ResetMessageFadeByID",
	category = "combat_midnight",
	subcategory = "global",
	func = _G["ResetMessageFadeByID"],
	funcPath = "ResetMessageFadeByID",
	params = { { name = "messageID", type = "number", default = nil } },
	returns = {},
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["ResistancePercent"] = {
	key = "ResistancePercent",
	name = "ResistancePercent",
	category = "combat_midnight",
	subcategory = "global",
	func = _G["ResistancePercent"],
	funcPath = "ResistancePercent",
	params = {
		{ name = "resistance", type = "number", default = nil },
		{ name = "casterLevel", type = "number", default = nil },
	},
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
	returns = {},
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
	params = {
		{
			name = "reverse",
			type = "bool",
			default = false,
			examples = {
				{ value = 6, label = "DBM-Party-Dragonflight" },
				{ value = "15.7", label = "DBM-Party-Dragonflight" },
			},
		},
		{ name = "offset", type = "number", default = 0 },
	},
	returns = {},
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
	params = {
		{
			name = "text",
			type = "cstring",
			default = nil,
			examples = {
				{ value = [=["hooksecurefunc('OpenAllBags']=], label = "Leatrix_Plus" },
				{ value = "ShowUIPanel(EditModeManagerFrame)", label = "Leatrix_Plus" },
				{ value = "btn:GetParent()", label = "TalentTreeTweaks" },
			},
		},
	},
	returns = {},
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["SendSubscriptionInterstitialResponse"] = {
	key = "SendSubscriptionInterstitialResponse",
	name = "SendSubscriptionInterstitialResponse",
	category = "combat_midnight",
	subcategory = "global",
	func = _G["SendSubscriptionInterstitialResponse"],
	funcPath = "SendSubscriptionInterstitialResponse",
	params = { { name = "response", type = "SubscriptionInterstitialResponseType", default = nil } },
	returns = {},
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
	returns = {},
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
	returns = {},
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
	params = {
		{
			name = "relativeTo",
			type = "ScriptRegion",
			default = nil,
			examples = {
				{ value = "_G[menu:GetName() .. 'TitleBG']", label = "Dominos_Config" },
				{ value = [=[LeaPlusLC["PageF"]]=], label = "Leatrix_Plus" },
				{ value = "DebuffButton1", label = "MoveAny" },
			},
		},
		{ name = "doResize", type = "bool", default = true },
	},
	returns = {},
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
	returns = {},
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
	returns = {},
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
	returns = {},
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
	returns = {},
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
	returns = {},
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
	returns = {},
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
	params = {
		{
			name = "alpha",
			type = "SingleColorValue",
			default = nil,
			examples = {
				{ value = "0.8", label = "WeakAuras" },
				{ value = "region.color_anim_a or a or 1", label = "WeakAuras" },
				{ value = "a or region.color_a or 1", label = "WeakAuras" },
			},
		},
	},
	returns = {},
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
	returns = {},
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
	params = {
		{
			name = "animation",
			type = "AnimationDataEnum",
			default = nil,
			examples = {
				{ value = 0, label = "WeakAuras" },
				{ value = "animTable[setting]", label = "Leatrix_Plus" },
				{
					value = [=[animTable[math.floor(LeaPlusCB["DressupAnim"]:GetValue() + 0.5)]]=],
					label = "Leatrix_Plus",
				},
			},
		},
		{ name = "variation", type = "number", default = nil },
		{ name = "animSpeed", type = "number", default = 1 },
		{ name = "animOffsetSeconds", type = "number", default = 0 },
	},
	returns = {},
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
	params = {
		{
			name = "blendOp",
			type = "ModelBlendOperation",
			default = nil,
			examples = { { value = 0, label = "Narcissus" }, { value = 1, label = "Narcissus" } },
		},
	},
	returns = {},
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
	returns = {},
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
	returns = {},
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
	returns = {},
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
	returns = {},
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
	returns = {},
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
	params = { { name = "alpha", type = "number", default = nil, examples = { { value = 0, label = "ClassyMap" } } } },
	returns = {},
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
	params = {
		{
			name = "scalar",
			type = "number",
			default = nil,
			examples = { { value = 0, label = "ClassyMap" }, { value = 1, label = "ClassyMap" } },
		},
	},
	returns = {},
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
	returns = {},
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
	returns = {},
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
	returns = {},
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
	returns = {},
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
	returns = {},
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
	returns = {},
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
	params = { { name = "alpha", type = "number", default = nil, examples = { { value = "a1", label = "Plater" } } } },
	returns = {},
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
	returns = {},
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
	params = {
		{
			name = "asset",
			type = "FileAsset",
			default = nil,
			examples = { { value = "border", label = "Narcissus" }, { value = "self.Border", label = "Narcissus" } },
		},
	},
	returns = {},
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
	params = {
		{
			name = "scale",
			type = "number",
			default = nil,
			examples = {
				{ value = "1.7", label = "AllTheThings" },
				{ value = "0.8", label = "AllTheThings" },
				{ value = "reference.modelScale or 1", label = "AllTheThings" },
			},
		},
	},
	returns = {},
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
	params = {
		{ name = "cameraIndex", type = "number", default = nil, examples = { { value = 0, label = "Narcissus" } } },
	},
	returns = {},
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
	returns = {},
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
	returns = {},
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
	returns = {},
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
	params = {
		{
			name = "fov",
			type = "number",
			default = nil,
			examples = { { value = "0.75", label = "Narcissus" }, { value = "camInfo[1]", label = "Narcissus" } },
		},
	},
	returns = {},
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
	returns = {},
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
	params = {
		{
			name = "forwardX",
			type = "number",
			default = nil,
			examples = { { value = "-1", label = "Narcissus" }, { value = "camInfo[5]", label = "Narcissus" } },
		},
		{ name = "forwardY", type = "number", default = nil },
		{ name = "forwardZ", type = "number", default = nil },
		{ name = "rightX", type = "number", default = nil },
		{ name = "rightY", type = "number", default = nil },
		{ name = "rightZ", type = "number", default = nil },
		{ name = "upX", type = "number", default = nil },
		{ name = "upY", type = "number", default = nil },
		{ name = "upZ", type = "number", default = nil },
	},
	returns = {},
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
	params = {
		{
			name = "yaw",
			type = "number",
			default = nil,
			examples = {
				{ value = "PI", label = "Narcissus" },
				{ value = "math.pi", label = "Narcissus" },
				{ value = "self.yaw", label = "Narcissus" },
			},
		},
		{ name = "pitch", type = "number", default = nil },
		{ name = "roll", type = "number", default = nil },
	},
	returns = {},
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
	params = {
		{
			name = "positionX",
			type = "number",
			default = nil,
			examples = {
				{ value = "3.84", label = "Narcissus" },
				{ value = "NarciNPCModelFrame2:GetCameraPosition()", label = "Narcissus" },
				{ value = 10, label = "Narcissus" },
			},
		},
		{ name = "positionY", type = "number", default = nil },
		{ name = "positionZ", type = "number", default = nil },
	},
	returns = {},
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
	returns = {},
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
	params = {
		{ name = "targetX", type = "number", default = nil, examples = { { value = 0, label = "Narcissus" } } },
		{ name = "targetY", type = "number", default = nil },
		{ name = "targetZ", type = "number", default = nil },
	},
	returns = {},
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
	returns = {},
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
	params = {
		{
			name = "checked",
			type = "bool",
			default = false,
			examples = {
				{ value = [=[settings:Get("Skip:AutoRefresh")]=], label = "AllTheThings" },
				{ value = [=[settings:GetTooltipSetting("Channel") == "Master"]=], label = "AllTheThings" },
				{ value = [=[settings:GetTooltipSetting("Channel") == "Music"]=], label = "AllTheThings" },
			},
		},
	},
	returns = {},
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
	params = {
		{
			name = "asset",
			type = "TextureAsset",
			default = nil,
			examples = {
				{ value = [=[app.asset("TrackAccountWide")]=], label = "AllTheThings" },
				{ value = "_G[name .. 'Check']", label = "BagBrother" },
				{ value = "template.checked_texture", label = "Plater" },
			},
		},
	},
	returns = {},
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
	params = {
		{
			name = "childKey",
			type = "cstring",
			default = nil,
			examples = {
				{ value = "flash", label = "BagBrother" },
				{ value = "TextObj", label = "MRT" },
				{ value = "target", label = "MRT" },
			},
		},
	},
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
	params = {
		{ name = "isActive", type = "bool", default = nil, examples = { { value = "t", label = "AllTheThings" } } },
	},
	returns = {},
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
	returns = {},
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
	returns = {},
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
	returns = {},
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
	params = {
		{ name = "hsvX", type = "number", default = nil, examples = { { value = "h3", label = "WeakAuras" } } },
		{ name = "hsvY", type = "number", default = nil },
		{ name = "hsvZ", type = "number", default = nil },
	},
	returns = {},
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
	params = {
		{
			name = "rgbR",
			type = "number",
			default = nil,
			examples = {
				{ value = "r1", label = "WeakAuras" },
				{ value = "r2", label = "WeakAuras" },
				{ value = 1, label = "Baganator" },
			},
		},
		{ name = "rgbG", type = "number", default = nil },
		{ name = "rgbB", type = "number", default = nil },
	},
	returns = {},
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
	returns = {},
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
	params = {
		{
			name = "texture",
			type = "TextureAsset",
			default = nil,
			examples = { { value = "colorTexture2", label = "DBM-GUI" } },
		},
	},
	returns = {},
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
	returns = {},
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
	returns = {},
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
	returns = {},
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
	returns = {},
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
	params = {
		{
			name = "creatureID",
			type = "number",
			default = nil,
			examples = {
				{ value = "id", label = "AllTheThings" },
				{ value = "tonumber(creatureid) or 448", label = "DBM-GUI" },
				{ value = "self.id", label = "Narcissus" },
			},
		},
		{ name = "displayID", type = "number", default = 0 },
	},
	returns = {},
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
	returns = {},
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
	returns = {},
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
	params = {
		{
			name = "name",
			type = "cstring",
			default = nil,
			examples = {
				{ value = "CAST_CURSOR", label = "WeakAurasOptions" },
				{ value = "Interface/Cursor/Buy.blp", label = "Baganator" },
				{ value = "Interface/CURSOR/Item.blp", label = "Narcissus" },
			},
		},
	},
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
	returns = {},
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
	returns = {},
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
	params = {
		{
			name = "xPosition",
			type = "uiUnit",
			default = nil,
			examples = {
				{ value = 0, label = "WeakAurasOptions" },
				{ value = "self.timeMachine[self.timeMachinePos][2]", label = "WeakAurasOptions" },
				{ value = "editor.editBox:GetCursorPosition() - 1", label = "WeakAurasOptions" },
			},
		},
		{ name = "yPosition", type = "uiUnit", default = nil },
	},
	returns = {},
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
	params = {
		{ name = "itemInfo", type = "ItemInfo", default = nil },
		{ name = "cursorType", type = "UICursorType", default = nil },
	},
	returns = {},
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
	params = {
		{
			name = "curveType",
			type = "CurveType",
			default = nil,
			examples = {
				{ value = "SMOOTH", label = "Narcissus" },
				{ value = [=[arg4 or "SMOOTH"]=], label = "Plater" },
			},
		},
	},
	returns = {},
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
	returns = {},
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
	returns = {},
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
	params = {
		{
			name = "damageAbsorbClampMode",
			type = "UnitDamageAbsorbClampMode",
			default = nil,
			examples = { { value = 2, label = "DandersFrames" } },
		},
	},
	returns = {},
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
	params = {
		{
			name = "angle",
			type = "number",
			default = nil,
			examples = {
				{ value = "-360", label = "WeakAurasOptions" },
				{ value = 360, label = "Details" },
				{ value = 20, label = "Details" },
			},
		},
	},
	returns = {},
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
	params = {
		{
			name = "strength",
			type = "number",
			default = nil,
			examples = {
				{ value = "0.5", label = "Baganator" },
				{ value = 1, label = "Baganator" },
				{ value = "self.icon", label = "Bartender4" },
			},
		},
	},
	returns = {},
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
	returns = {},
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
	params = {
		{
			name = "displayID",
			type = "number",
			default = nil,
			examples = {
				{ value = 0, label = "AllTheThings" },
				{ value = 987, label = "AllTheThings" },
				{ value = "displayInfos[1]", label = "AllTheThings" },
			},
		},
		{ name = "mountDisplayID", type = "number", default = nil },
	},
	returns = {},
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
	returns = {},
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
	params = {
		{
			name = "layer",
			type = "DrawLayer",
			default = nil,
			examples = {
				{ value = "ARTWORK", label = "WeakAuras" },
				{ value = "ARTWORK", label = "WeakAuras" },
				{ value = "ARTWORK", label = "WeakAuras" },
			},
		},
	},
	returns = {},
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
	params = {
		{
			name = "difficultyID",
			type = "number",
			default = nil,
			examples = {
				{ value = 1, label = "TitanLootType" },
				{ value = 2, label = "TitanLootType" },
				{ value = 23, label = "TitanLootType" },
			},
		},
	},
	returns = {},
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
	params = {
		{
			name = "durationSec",
			type = "number",
			default = nil,
			examples = {
				{ value = 0, label = "WeakAuras" },
				{ value = 1, label = "WeakAurasOptions" },
				{ value = ".12", label = "AstralKeys" },
			},
		},
		{ name = "recomputeGroupDuration", type = "bool", default = true },
	},
	returns = {},
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
	returns = {},
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
	params = {
		{
			name = "enabled",
			type = "bool",
			default = nil,
			examples = {
				{ value = "self.currentIndex > 1", label = "!Mechanic" },
				{ value = "#AUCTIONATOR_SELLING_GROUPS.HiddenItems ~= 0", label = "Auctionator" },
				{
					value = "self.selectedAuctionData ~= nil and self.selectedAuctionData.isOwned and self.selectedAuctionData.numStacks > 0 and Auctionator.AH.IsNotThrottled()",
					label = "Auctionator",
				},
			},
		},
	},
	returns = {},
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
	params = {
		{
			name = "color",
			type = "colorRGBA",
			default = nil,
			examples = { { value = "CreateColor(r2", label = "Plater" } },
		},
	},
	returns = {},
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
	params = {
		{
			name = "delaySec",
			type = "number",
			default = nil,
			examples = {
				{ value = 2147483647, label = "WeakAuras" },
				{ value = "0.4", label = "BigWigs_Plugins" },
				{ value = 0, label = "Details" },
			},
		},
		{ name = "recomputeGroupDuration", type = "bool", default = true },
	},
	returns = {},
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
	params = {
		{
			name = "relativePoint",
			type = "FramePoint",
			default = nil,
			examples = {
				{ value = "BOTTOMRIGHT", label = "WeakAurasOptions" },
				{ value = "BOTTOMLEFT", label = "WeakAurasOptions" },
				{ value = "BOTTOMLEFT", label = "WeakAurasOptions" },
			},
		},
		{ name = "relativeTo", type = "ScriptRegion", default = nil },
		{ name = "offsetX", type = "uiUnit", default = 0 },
		{ name = "offsetY", type = "uiUnit", default = 0 },
	},
	returns = {},
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
	returns = {},
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
	returns = {},
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
	params = {
		{
			name = "facing",
			type = "number",
			default = nil,
			examples = {
				{ value = "mod.modelRotation or 0", label = "DBM-GUI" },
				{ value = 0, label = "Narcissus" },
				{ value = "math.pi/6", label = "Narcissus" },
			},
		},
	},
	returns = {},
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
	returns = {},
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
	returns = {},
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
	returns = {},
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
	params = {
		{ name = "fadeInSeconds", type = "number", default = nil },
		{ name = "fadeOutSeconds", type = "number", default = nil },
	},
	returns = {},
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
	params = {
		{
			name = "fading",
			type = "bool",
			default = nil,
			examples = { { value = "-4", label = "Narcissus" }, { value = 4, label = "Narcissus" } },
		},
	},
	returns = {},
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
	returns = {},
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
	returns = {},
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
	params = {
		{ name = "groupID", type = "number", default = nil },
		{ name = "tagID", type = "number", default = nil },
		{ name = "active", type = "bool", default = nil },
	},
	returns = {},
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
	returns = {},
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
	returns = {},
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
	returns = {},
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
	params = {
		{
			name = "columns",
			type = "number",
			default = nil,
			examples = { { value = "Style.Columns or 5", label = "Masque" }, { value = 5, label = "Masque" } },
		},
	},
	returns = {},
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
	params = {
		{
			name = "height",
			type = "number",
			default = nil,
			examples = { { value = 0, label = "Masque" }, { value = "Style.FrameHeight or 0", label = "Masque" } },
		},
	},
	returns = {},
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
	params = {
		{
			name = "width",
			type = "number",
			default = nil,
			examples = { { value = 0, label = "Masque" }, { value = "Style.FrameWidth or 0", label = "Masque" } },
		},
	},
	returns = {},
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
	params = {
		{
			name = "frames",
			type = "number",
			default = nil,
			examples = { { value = "Style.Frames or 30", label = "Masque" }, { value = 30, label = "Masque" } },
		},
	},
	returns = {},
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
	params = {
		{
			name = "rows",
			type = "number",
			default = nil,
			examples = { { value = "Style.Rows or 6", label = "Masque" }, { value = 6, label = "Masque" } },
		},
	},
	returns = {},
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["SetFogColor"] = {
	key = "SetFogColor",
	name = "SetFogColor",
	category = "combat_midnight",
	subcategory = "global",
	func = _G["SetFogColor"],
	funcPath = "SetFogColor",
	params = {
		{
			name = "colorR",
			type = "number",
			default = nil,
			examples = { { value = 1, label = "Narcissus" }, { value = "0.13", label = "Narcissus" } },
		},
		{ name = "colorG", type = "number", default = nil },
		{ name = "colorB", type = "number", default = nil },
		{ name = "a", type = "SingleColorValue", default = nil },
	},
	returns = {},
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
	params = {
		{ name = "fogFar", type = "number", default = nil, examples = { { value = "0.1", label = "Narcissus" } } },
	},
	returns = {},
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
	params = {
		{ name = "fogNear", type = "number", default = nil, examples = { { value = 0, label = "Narcissus" } } },
	},
	returns = {},
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
	returns = {},
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
	params = {
		{ name = "asset", type = "FileAsset", default = nil },
		{ name = "horizontalTile", type = "bool", default = nil },
		{ name = "verticalTile", type = "bool", default = nil },
	},
	returns = {},
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
	returns = {},
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
	returns = {},
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
	params = {
		{
			name = "fontFile",
			type = "cstring",
			default = nil,
			examples = {
				{ value = "fontPath", label = "WeakAuras" },
				{ value = "STANDARD_TEXT_FONT", label = "WeakAuras" },
				{ value = "fontPath", label = "WeakAuras" },
			},
		},
		{ name = "height", type = "uiFontHeight", default = nil },
		{ name = "flags", type = "TBFFlags", default = nil },
	},
	returns = {},
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
	returns = {},
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
	params = {
		{
			name = "font",
			type = "SimpleFont",
			default = nil,
			examples = {
				{ value = "GameFontNormalSmall2", label = "WeakAurasOptions" },
				{ value = "GameFontNormalSmall", label = "WeakAurasOptions" },
				{ value = "GameFontNormal", label = "WeakAurasOptions" },
			},
		},
	},
	returns = {},
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
	params = {
		{
			name = "normalizedAlpha",
			type = "number",
			default = nil,
			examples = {
				{ value = 1, label = "AstralKeys" },
				{ value = 0, label = "AstralKeys" },
				{ value = "0.4", label = "Baganator" },
			},
		},
	},
	returns = {},
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
	returns = {},
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
	params = {
		{ name = "grad0", type = "number", default = nil },
		{ name = "grad1", type = "number", default = nil },
		{ name = "grad2", type = "number", default = nil },
		{ name = "grad3", type = "number", default = nil },
	},
	returns = {},
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
	params = {
		{
			name = "healAbsorbClampMode",
			type = "UnitHealAbsorbClampMode",
			default = nil,
			examples = { { value = 0, label = "DandersFrames" } },
		},
	},
	returns = {},
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
	returns = {},
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
	params = {
		{
			name = "height",
			type = "uiUnit",
			default = nil,
			examples = {
				{ value = 1, label = "WeakAuras" },
				{ value = 32, label = "WeakAuras" },
				{ value = "show and (yProgress + 0.1) or 0.1", label = "WeakAuras" },
			},
		},
	},
	returns = {},
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
	returns = {},
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
	returns = {},
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
	returns = {},
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
	returns = {},
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
	returns = {},
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
	params = {
		{
			name = "incomingHealOverflowPercent",
			type = "number",
			default = nil,
			examples = { { value = "1.0", label = "DandersFrames" } },
		},
	},
	returns = {},
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
	returns = {},
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
	returns = {},
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
	params = {
		{
			name = "itemID",
			type = "number",
			default = nil,
			examples = {
				{ value = "dbKeys[1]", label = "Auctionator" },
				{
					value = "Auctionator.Utilities.DBKeyFromBrowseResult({ itemKey = itemInfo.itemKey })[1]",
					label = "Auctionator",
				},
				{ value = "itemInfo[1]", label = "Narcissus" },
			},
		},
		{ name = "appearanceModID", type = "number", default = nil },
		{ name = "itemVisualID", type = "number", default = nil },
	},
	returns = {},
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
	params = {
		{
			name = "itemAppearanceID",
			type = "number",
			default = nil,
			examples = { { value = 69893, label = "Narcissus" } },
		},
		{ name = "itemVisualID", type = "number", default = nil },
		{ name = "itemSubclass", type = "ItemWeaponSubclass", default = nil },
	},
	returns = {},
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
	params = {
		{
			name = "transmogInfo",
			type = "ItemTransmogInfo",
			default = nil,
			examples = {
				{ value = "transmogInfo", label = "Narcissus" },
				{ value = "mainHandInfo", label = "Narcissus" },
				{ value = "offHandInfo", label = "Narcissus" },
			},
		},
		{ name = "inventorySlots", type = "number", default = nil },
		{ name = "ignoreChildItems", type = "bool", default = false },
	},
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
	params = {
		{ name = "jumpLength", type = "number", default = nil },
		{ name = "jumpHeight", type = "number", default = nil },
	},
	returns = {},
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
	params = {
		{
			name = "justifyH",
			type = "JustifyHorizontal",
			default = nil,
			examples = {
				{ value = "LEFT", label = "WeakAuras" },
				{ value = [=[data.text_justify or "CENTER"]=], label = "WeakAuras" },
				{ value = "CENTER", label = "WeakAurasOptions" },
			},
		},
	},
	returns = {},
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
	params = {
		{
			name = "justifyV",
			type = "JustifyVertical",
			default = nil,
			examples = {
				{ value = "TOP", label = "WeakAuras" },
				{ value = "MIDDLE", label = "WeakAurasOptions" },
				{ value = "TOP", label = "Bartender4" },
			},
		},
	},
	returns = {},
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
	returns = {},
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
	params = {
		{ name = "difficultyID", type = "number", default = nil },
		{ name = "force", type = "bool", default = false },
	},
	returns = {},
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
	params = {
		{
			name = "enabled",
			type = "bool",
			default = nil,
			examples = {
				{ value = true, label = "Narcissus" },
				{ value = true, label = "Narcissus" },
				{ value = true, label = "Narcissus" },
			},
		},
		{ name = "light", type = "ModelLight", default = nil },
	},
	returns = {},
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
	params = {
		{ name = "colorR", type = "number", default = nil, examples = { { value = "0.6", label = "Narcissus" } } },
		{ name = "colorG", type = "number", default = nil },
		{ name = "colorB", type = "number", default = nil },
	},
	returns = {},
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
	params = {
		{
			name = "colorR",
			type = "number",
			default = nil,
			examples = { { value = "0.78", label = "Narcissus" }, { value = "0.8", label = "Narcissus" } },
		},
		{ name = "colorG", type = "number", default = nil },
		{ name = "colorB", type = "number", default = nil },
	},
	returns = {},
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
	params = {
		{
			name = "directionX",
			type = "number",
			default = nil,
			examples = {
				{ value = "-1", label = "Narcissus" },
				{ value = "-0.0655", label = "Narcissus_Achievements" },
			},
		},
		{ name = "directionY", type = "number", default = nil },
		{ name = "directionZ", type = "number", default = nil },
	},
	returns = {},
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
	params = {
		{ name = "positionX", type = "number", default = nil, examples = { { value = 1, label = "Narcissus" } } },
		{ name = "positionY", type = "number", default = nil },
		{ name = "positionZ", type = "number", default = nil },
	},
	returns = {},
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
	params = {
		{
			name = "lightType",
			type = "ModelLightType",
			default = nil,
			examples = { { value = 1, label = "Narcissus" } },
		},
	},
	returns = {},
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
	returns = {},
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
	params = {
		{
			name = "loopType",
			type = "LoopType",
			default = nil,
			examples = {
				{ value = "REPEAT", label = "Baganator" },
				{ value = "repeat", label = "Details" },
				{ value = "NONE", label = "Details" },
			},
		},
	},
	returns = {},
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
	params = {
		{
			name = "specializationID",
			type = "number",
			default = nil,
			examples = { { value = "row.ref.id", label = "AllTheThings" }, { value = 0, label = "AllTheThings" } },
		},
	},
	returns = {},
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
	params = {
		{
			name = "uiMapID",
			type = "number",
			default = nil,
			examples = {
				{ value = "tonumber(cmd:sub(7))", label = "AllTheThings" },
				{ value = "arg1", label = "Leatrix_Maps" },
				{ value = "tonumber(arg1)", label = "Leatrix_Maps" },
			},
		},
	},
	returns = {},
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
	returns = {},
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
	params = {
		{
			name = "asset",
			type = "TextureAsset",
			default = nil,
			examples = {
				{ value = "Interface\\BUTTONS\\WHITE8X8", label = "ClassyMap" },
				{ value = "Textures\\MinimapMask", label = "ClassyMap" },
				{ value = "Interface\\ChatFrame\\ChatFrameBackground", label = "Leatrix_Plus" },
			},
		},
	},
	returns = {},
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
	returns = {},
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
	returns = {},
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
	params = {
		{
			name = "minValue",
			type = "number",
			default = nil,
			examples = {
				{ value = 0, label = "WeakAuras" },
				{ value = 0, label = "WeakAurasOptions" },
				{ value = 0, label = "WeakAurasOptions" },
			},
		},
		{ name = "maxValue", type = "number", default = nil },
	},
	returns = {},
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
	params = {
		{
			name = "asset",
			type = "ModelAsset",
			default = nil,
			examples = { { value = "self.id", label = "Narcissus" }, { value = 124640, label = "Narcissus" } },
		},
		{ name = "noMip", type = "bool", default = false },
	},
	returns = {},
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
	params = {
		{
			name = "alpha",
			type = "number",
			default = nil,
			examples = {
				{ value = 1, label = "Narcissus" },
				{ value = "f.t * 4", label = "Narcissus" },
				{ value = 0, label = "Narcissus" },
			},
		},
	},
	returns = {},
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
	params = {
		{
			name = "creatureDisplayID",
			type = "number",
			default = nil,
			examples = { { value = "id", label = "Narcissus" } },
		},
		{ name = "useActivePlayerCustomizations", type = "bool", default = false },
	},
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
	params = {
		{
			name = "asset",
			type = "FileAsset",
			default = nil,
			examples = {
				{ value = 611777, label = "Narcissus" },
				{ value = 1567107, label = "Narcissus" },
				{ value = 916495, label = "Narcissus" },
			},
		},
		{ name = "useMips", type = "bool", default = false },
	},
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
	params = {
		{ name = "asset", type = "FileAsset", default = nil },
		{ name = "useMips", type = "bool", default = false },
	},
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
	params = {
		{
			name = "unit",
			type = "UnitToken",
			default = "player",
			examples = {
				{ value = "player", label = "Leatrix_Plus" },
				{ value = "target", label = "Leatrix_Plus" },
				{ value = "player", label = "Narcissus" },
			},
		},
		{ name = "sheatheWeapons", type = "bool", default = false },
		{ name = "autoDress", type = "bool", default = true },
		{ name = "hideWeapons", type = "bool", default = false },
		{ name = "usePlayerNativeForm", type = "bool", default = true },
		{ name = "holdBowString", type = "bool", default = false },
		{ name = "customRaceID", type = "number", default = nil },
	},
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
	params = {
		{
			name = "layer",
			type = "DrawLayer",
			default = nil,
			examples = {
				{ value = "ARTWORK", label = "Narcissus" },
				{ value = "BACKGROUND", label = "Narcissus" },
				{ value = "BACKGROUND", label = "Narcissus" },
			},
		},
	},
	returns = {},
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
	params = {
		{
			name = "scale",
			type = "number",
			default = nil,
			examples = {
				{ value = 1, label = "DBM-GUI" },
				{ value = "0.85", label = "DBM-Party-BC" },
				{ value = "0.5", label = "DBM-Party-BC" },
			},
		},
	},
	returns = {},
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
	returns = {},
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
	returns = {},
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
	returns = {},
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
	params = {
		{
			name = "offsetX",
			type = "uiUnit",
			default = nil,
			examples = {
				{ value = "data.xOffset or 0", label = "WeakAuras" },
				{ value = 0, label = "Bartender4" },
				{ value = 200, label = "Details" },
			},
		},
		{ name = "offsetY", type = "uiUnit", default = nil },
	},
	returns = {},
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
	params = {
		{
			name = "order",
			type = "number",
			default = nil,
			examples = {
				{ value = 1, label = "Baganator" },
				{ value = 2, label = "Baganator" },
				{ value = "i * 2", label = "BagBrother" },
			},
		},
	},
	returns = {},
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
	params = {
		{
			name = "orientation",
			type = "Orientation",
			default = nil,
			examples = {
				{ value = "VERTICAL_INVERSE", label = "WeakAuras" },
				{ value = "VERTICAL", label = "WeakAuras" },
				{ value = "data.linearTextureOrientation", label = "WeakAuras" },
			},
		},
	},
	returns = {},
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
	params = {
		{
			name = "point",
			type = "FramePoint",
			default = nil,
			examples = {
				{ value = "anchor", label = "WeakAuras" },
				{ value = "center", label = "Details" },
				{ value = "RIGHT", label = "Details" },
			},
		},
		{ name = "originX", type = "number", default = nil },
		{ name = "originY", type = "number", default = nil },
	},
	returns = {},
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
	returns = {},
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
	returns = {},
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
	returns = {},
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
	params = {
		{
			name = "parent",
			type = "SimplePathAnim",
			default = nil,
			examples = {
				{ value = "Bartender4.UIHider", label = "Bartender4" },
				{ value = [=[_G[window:GetName() .. "TitleBar"]]=], label = "Details" },
				{ value = "window1.baseframe", label = "Details" },
			},
		},
		{ name = "order", type = "number", default = nil },
	},
	returns = {},
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
	params = { { name = "scale", type = "number", default = nil, examples = { { value = 0, label = "Narcissus" } } } },
	returns = {},
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
	returns = {},
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
	returns = {},
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
	params = {
		{
			name = "pitch",
			type = "number",
			default = nil,
			examples = {
				{ value = 0, label = "Narcissus" },
				{ value = "pi/2", label = "Narcissus" },
				{ value = "modelInfo[7]", label = "Narcissus" },
			},
		},
	},
	returns = {},
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
	params = {
		{ name = "characterIndex", type = "number", default = nil },
		{ name = "sheatheWeapons", type = "bool", default = false },
		{ name = "autoDress", type = "bool", default = true },
		{ name = "hideWeapons", type = "bool", default = false },
		{ name = "usePlayerNativeForm", type = "bool", default = true },
		{ name = "customRaceID", type = "number", default = nil },
	},
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
	returns = {},
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
	params = {
		{
			name = "textureType",
			type = "PingTextureType",
			default = nil,
			examples = {
				{ value = "Enum.PingTextureType.Center", label = "Plumber" },
				{ value = "Enum.PingTextureType.Expand", label = "Plumber" },
				{ value = "Enum.PingTextureType.Rotation", label = "Plumber" },
			},
		},
		{ name = "asset", type = "FileAsset", default = nil },
		{ name = "width", type = "uiUnit", default = 0 },
		{ name = "height", type = "uiUnit", default = 0 },
	},
	returns = {},
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
	returns = {},
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
	returns = {},
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
	params = {
		{
			name = "point",
			type = "FramePoint",
			default = nil,
			examples = {
				{ value = "TOPRIGHT", label = "WeakAuras" },
				{ value = "TOPLEFT", label = "WeakAuras" },
				{ value = "TOPLEFT", label = "WeakAuras" },
			},
		},
		{ name = "relativeTo", type = "ScriptRegion", default = nil },
		{ name = "relativePoint", type = "FramePoint", default = nil },
		{ name = "offsetX", type = "uiUnit", default = nil },
		{ name = "offsetY", type = "uiUnit", default = nil },
	},
	returns = {},
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
	returns = {},
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
	returns = {},
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
	params = {
		{
			name = "textureObject",
			type = "SimpleTexture",
			default = nil,
			examples = {
				{ value = "self", label = "AllTheThings" },
				{ value = "self.Icon", label = "BagBrother" },
				{ value = 133139, label = "Narcissus" },
			},
		},
		{ name = "unitToken", type = "UnitToken", default = "player" },
		{ name = "disableMasking", type = "bool", default = false },
	},
	returns = {},
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
	params = {
		{ name = "textureObject", type = "SimpleTexture", default = nil },
		{ name = "creatureDisplayID", type = "number", default = nil },
	},
	returns = {},
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
	params = {
		{
			name = "zoom",
			type = "number",
			default = nil,
			examples = {
				{ value = "data.portraitZoom and 1 or 0", label = "WeakAuras" },
				{ value = "0.4", label = "DBM-GUI" },
				{ value = "data[1]", label = "Narcissus" },
			},
		},
	},
	returns = {},
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
	params = {
		{
			name = "positionX",
			type = "number",
			default = nil,
			examples = {
				{ value = "fi * -0.1", label = "AllTheThings" },
				{ value = 0, label = "AllTheThings" },
				{ value = "fi * -0.1", label = "AllTheThings" },
			},
		},
		{ name = "positionY", type = "number", default = nil },
		{ name = "positionZ", type = "number", default = nil },
	},
	returns = {},
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
	returns = {},
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
	returns = {},
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
	returns = {},
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
	returns = {},
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
	returns = {},
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
	returns = {},
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
	params = { { name = "alpha", type = "number", default = nil, examples = { { value = 0, label = "ClassyMap" } } } },
	returns = {},
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
	params = {
		{
			name = "scalar",
			type = "number",
			default = nil,
			examples = { { value = 0, label = "ClassyMap" }, { value = 1, label = "ClassyMap" } },
		},
	},
	returns = {},
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
	returns = {},
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
	params = { { name = "angle", type = "number", default = nil, examples = { { value = 0, label = "Narcissus" } } } },
	returns = {},
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
	params = {
		{
			name = "difficultyID",
			type = "number",
			default = nil,
			examples = {
				{ value = 1, label = "TitanLootType" },
				{ value = 2, label = "TitanLootType" },
				{ value = 3, label = "TitanLootType" },
			},
		},
		{ name = "force", type = "bool", default = false },
	},
	returns = {},
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
	params = {
		{
			name = "target",
			type = "UnitToken",
			default = "player",
			examples = {
				{ value = "unit", label = "BigWigs_Core" },
				{ value = "unit", label = "BigWigs_Core" },
				{ value = "lastplayer[1]", label = "BigWigs_Plugins" },
			},
		},
		{ name = "userIndex", type = "luaIndex", default = nil },
	},
	returns = {},
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
	returns = {},
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
	params = {
		{
			name = "roll",
			type = "number",
			default = nil,
			examples = {
				{ value = "1.8", label = "Narcissus" },
				{ value = 0, label = "Narcissus" },
				{ value = "modelInfo[8]", label = "Narcissus" },
			},
		},
	},
	returns = {},
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
	params = {
		{
			name = "radians",
			type = "number",
			default = nil,
			examples = {
				{ value = "math.rad(-90)", label = "WeakAurasOptions" },
				{ value = "auraRotation / 180 * math.pi", label = "WeakAurasOptions" },
				{ value = "math.pi/2", label = "WeakAurasOptions" },
			},
		},
		{ name = "animate", type = "bool", default = true },
	},
	returns = {},
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
	params = {
		{
			name = "scaleX",
			type = "number",
			default = nil,
			examples = {
				{ value = 1, label = "WeakAuras" },
				{ value = "1 / UIParent:GetEffectiveScale()", label = "WeakAuras" },
				{
					value = "data.scale and data.scale > 0 and data.scale <= 10 and data.scale or 1",
					label = "WeakAuras",
				},
			},
		},
		{ name = "scaleY", type = "number", default = nil },
	},
	returns = {},
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
	params = {
		{
			name = "scaleX",
			type = "number",
			default = nil,
			examples = { { value = 0, label = "Details" }, { value = "arg1", label = "Plater" } },
		},
		{ name = "scaleY", type = "number", default = nil },
	},
	returns = {},
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
	params = {
		{
			name = "scaleX",
			type = "number",
			default = nil,
			examples = { { value = 1, label = "Details" }, { value = "arg3", label = "Plater" } },
		},
		{ name = "scaleY", type = "number", default = nil },
	},
	returns = {},
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
	params = {
		{
			name = "scriptTypeName",
			type = "cstring",
			default = nil,
			examples = {
				{ value = "OnUpdate", label = "WeakAuras" },
				{ value = "OnEvent", label = "WeakAuras" },
				{ value = "OnEvent", label = "WeakAuras" },
			},
		},
		{ name = "script", type = "luaFunction", default = nil },
	},
	returns = {},
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
	returns = {},
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
	params = {
		{
			name = "sequence",
			type = "number",
			default = nil,
			examples = { { value = "mod.modelSequence or 4", label = "DBM-GUI" } },
		},
	},
	returns = {},
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
	params = {
		{ name = "sequence", type = "number", default = nil },
		{ name = "timeOffset", type = "number", default = nil },
	},
	returns = {},
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
	params = {
		{
			name = "colorR",
			type = "number",
			default = nil,
			examples = {
				{ value = [=[colors:GetColor("barTextShadow"]=], label = "BigWigs_LiberationOfUndermine" },
				{ value = "r", label = "BigWigs_LiberationOfUndermine" },
				{ value = [=[colors:GetColor("barTextShadow"]=], label = "BigWigs_Plugins" },
			},
		},
		{ name = "colorG", type = "number", default = nil },
		{ name = "colorB", type = "number", default = nil },
		{ name = "a", type = "SingleColorValue", default = nil },
	},
	returns = {},
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
	params = {
		{ name = "strength", type = "number", default = nil, examples = { { value = "0~1", label = "Narcissus" } } },
	},
	returns = {},
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
	params = {
		{
			name = "offsetX",
			type = "number",
			default = nil,
			examples = {
				{ value = 1, label = "BigWigs_Plugins" },
				{ value = 0, label = "DBM-Core" },
				{ value = 1, label = "MRT" },
			},
		},
		{ name = "offsetY", type = "number", default = nil },
	},
	returns = {},
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
	params = {
		{ name = "sheathed", type = "bool", default = nil },
		{ name = "hidden", type = "bool", default = false },
	},
	returns = {},
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
	params = {
		{
			name = "show",
			type = "bool",
			default = false,
			examples = {
				{ value = [=[OptionsPrivate.Private.Features:Enabled("undo")]=], label = "WeakAurasOptions" },
				{ value = "pH > 0", label = "ActionHud" },
				{ value = "cH > 0", label = "ActionHud" },
			},
		},
	},
	returns = {},
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
	params = {
		{
			name = "x",
			type = "uiUnit",
			default = nil,
			examples = {
				{ value = 500, label = "WeakAuras" },
				{ value = 16, label = "WeakAuras" },
				{ value = "iconWidth - 0.2 * width", label = "WeakAuras" },
			},
		},
		{ name = "y", type = "uiUnit", default = nil },
	},
	returns = {},
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
	params = {
		{ name = "durationSec", type = "number", default = nil, examples = { { value = 1, label = "WeakAuras" } } },
	},
	returns = {},
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
	params = {
		{
			name = "weights",
			type = "SmoothingType",
			default = nil,
			examples = {
				{ value = "OUT", label = "WeakAurasOptions" },
				{ value = "IN_OUT", label = "AstralKeys" },
				{ value = "IN_OUT", label = "Baganator" },
			},
		},
	},
	returns = {},
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
	returns = {},
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
	params = {
		{
			name = "spacing",
			type = "uiUnit",
			default = nil,
			examples = {
				{ value = 3, label = "Baganator" },
				{ value = 4, label = "BagBrother" },
				{ value = 8, label = "Narcissus" },
			},
		},
	},
	returns = {},
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
	params = {
		{
			name = "spellVisualKitID",
			type = "number",
			default = 0,
			examples = {
				{ value = "info.spell", label = "Narcissus" },
				{ value = "modelInfo[9]", label = "Narcissus" },
				{ value = 23368, label = "Plumber" },
			},
		},
		{ name = "oneShot", type = "bool", default = false },
	},
	returns = {},
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
	params = {
		{
			name = "color",
			type = "colorRGBA",
			default = nil,
			examples = { { value = "CreateColor(r1", label = "Plater" } },
		},
	},
	returns = {},
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
	params = {
		{
			name = "delaySec",
			type = "number",
			default = nil,
			examples = {
				{ value = 1, label = "Bartender4" },
				{ value = "1.1", label = "BigWigs_Plugins" },
				{ value = "customDisplayTime or 1", label = "BigWigs_Plugins" },
			},
		},
		{ name = "recomputeGroupDuration", type = "bool", default = true },
	},
	returns = {},
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
	params = {
		{
			name = "relativePoint",
			type = "FramePoint",
			default = nil,
			examples = {
				{ value = "TOPLEFT", label = "WeakAurasOptions" },
				{ value = "TOPRIGHT", label = "WeakAurasOptions" },
				{ value = "TOPLEFT", label = "WeakAurasOptions" },
			},
		},
		{ name = "relativeTo", type = "ScriptRegion", default = nil },
		{ name = "offsetX", type = "uiUnit", default = 0 },
		{ name = "offsetY", type = "uiUnit", default = 0 },
	},
	returns = {},
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
	returns = {},
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
	params = {
		{
			name = "stepsPerPage",
			type = "number",
			default = nil,
			examples = {
				{ value = 0, label = "AllTheThings" },
				{ value = "rowCount - 2", label = "AllTheThings" },
				{ value = "numToDisplay-1", label = "Plater" },
			},
		},
	},
	returns = {},
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
	params = {
		{ name = "table", type = "LuaValueVariant", default = nil },
		{ name = "option", type = "TableSecurityOption", default = nil },
	},
	returns = {},
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
	params = {
		{
			name = "target",
			type = "CScriptObject",
			default = nil,
			examples = { { value = "target", label = "Bartender4" } },
		},
	},
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
	returns = {},
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

APIDefs["SetTaskBlobInsideAlpha"] = {
	key = "SetTaskBlobInsideAlpha",
	name = "SetTaskBlobInsideAlpha",
	category = "combat_midnight",
	subcategory = "global",
	func = _G["SetTaskBlobInsideAlpha"],
	funcPath = "SetTaskBlobInsideAlpha",
	params = { { name = "alpha", type = "number", default = nil } },
	returns = {},
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
	returns = {},
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
	returns = {},
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
	returns = {},
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
	params = { { name = "alpha", type = "number", default = nil, examples = { { value = 0, label = "ClassyMap" } } } },
	returns = {},
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
	params = {
		{
			name = "scalar",
			type = "number",
			default = nil,
			examples = { { value = 0, label = "ClassyMap" }, { value = 1, label = "ClassyMap" } },
		},
	},
	returns = {},
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
	returns = {},
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
	returns = {},
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
	params = {
		{
			name = "colorR",
			type = "number",
			default = nil,
			examples = {
				{ value = "0.5", label = "WeakAurasOptions" },
				{ value = 1, label = "WeakAurasOptions" },
				{ value = 1, label = "WeakAurasOptions" },
			},
		},
		{ name = "colorG", type = "number", default = nil },
		{ name = "colorB", type = "number", default = nil },
		{ name = "a", type = "SingleColorValue", default = nil },
	},
	returns = {},
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
	params = {
		{
			name = "thickness",
			type = "uiUnit",
			default = nil,
			examples = {
				{ value = 2, label = "WeakAurasOptions" },
				{ value = 1, label = "WeakAurasOptions" },
				{ value = 10, label = "MRT" },
			},
		},
	},
	returns = {},
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
	params = {
		{
			name = "asset",
			type = "TextureAsset",
			default = nil,
			examples = {
				{ value = "Interface\\Buttons\\UI-ScrollBar-Knob", label = "AddonUsage" },
				{ value = "Interface\\Buttons\\UI-SliderBar-Button-Vertical", label = "Bartender4" },
				{ value = "Interface\\Buttons\\UI-SliderBar-Button-Horizontal", label = "Bartender4" },
			},
		},
	},
	returns = {},
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
	params = {
		{ name = "endTime", type = "FrameTime", default = nil },
		{ name = "duration", type = "DurationSeconds", default = nil },
		{ name = "modRate", type = "number", default = 1 },
	},
	returns = {},
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
	params = {
		{ name = "startTime", type = "FrameTime", default = nil },
		{ name = "duration", type = "DurationSeconds", default = nil },
		{ name = "modRate", type = "number", default = 1 },
	},
	returns = {},
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
	params = {
		{ name = "startTime", type = "FrameTime", default = nil },
		{ name = "endTime", type = "FrameTime", default = nil },
	},
	returns = {},
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
	returns = {},
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
	params = {
		{
			name = "normalizedAlpha",
			type = "number",
			default = nil,
			examples = {
				{ value = 0, label = "AstralKeys" },
				{ value = 1, label = "AstralKeys" },
				{ value = "0.4", label = "Baganator" },
			},
		},
	},
	returns = {},
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=NotAllowed",
}

APIDefs["SetToFinalAlpha"] = {
	key = "SetToFinalAlpha",
	name = "SetToFinalAlpha",
	category = "combat_midnight",
	subcategory = "global",
	func = _G["SetToFinalAlpha"],
	funcPath = "SetToFinalAlpha",
	params = { { name = "setToFinalAlpha", type = "bool", default = nil } },
	returns = {},
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
	params = {
		{
			name = "translation",
			type = "vector3",
			default = nil,
			examples = { { value = "CreateVector3D(tx", label = "WeakAuras" } },
		},
		{ name = "rotation", type = "vector3", default = nil },
		{ name = "scale", type = "number", default = nil },
	},
	returns = {},
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
	params = {
		{
			name = "type",
			type = "LuaCurveType",
			default = nil,
			examples = {
				{ value = "radio", label = "WeakAurasOptions" },
				{ value = "tooltipbar", label = "Details" },
				{ value = "tooltip", label = "Details" },
			},
		},
	},
	returns = {},
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
	returns = {},
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
	returns = {},
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
	returns = {},
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
	params = {
		{
			name = "unit",
			type = "UnitToken",
			default = "player",
			examples = {
				{ value = "none", label = "AllTheThings" },
				{ value = "player", label = "AllTheThings" },
				{ value = "reference.unit", label = "AllTheThings" },
			},
		},
		{ name = "blend", type = "bool", default = true },
		{ name = "useNativeForm", type = "bool", default = nil },
	},
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
	params = {
		{ name = "unit", type = "string", default = nil },
		{ name = "colorR", type = "number", default = nil },
		{ name = "colorG", type = "number", default = nil },
		{ name = "colorB", type = "number", default = nil },
		{ name = "colorA", type = "number", default = nil },
	},
	returns = {},
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
	params = {
		{
			name = "textureObject",
			type = "SimpleTexture",
			default = nil,
			examples = { { value = "Display.InteractIcon", label = "Plumber" } },
		},
		{ name = "unit", type = "UnitToken", default = "player" },
		{ name = "style", type = "CursorStyle", default = nil },
		{ name = "includeLowPriority", type = "bool", default = nil },
	},
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
	returns = {},
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
	params = {
		{ name = "x", type = "bool", default = false },
		{ name = "y", type = "bool", default = false },
		{ name = "z", type = "bool", default = false },
	},
	returns = {},
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
	returns = {},
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
	returns = {},
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
	params = {
		{
			name = "value",
			type = "number",
			default = nil,
			examples = {
				{ value = "1 - self.bar:GetValue()", label = "WeakAuras" },
				{ value = 0, label = "WeakAuras" },
				{ value = 0, label = "WeakAurasOptions" },
			},
		},
		{ name = "treatAsMouseEvent", type = "bool", default = false },
	},
	returns = {},
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
	params = {
		{
			name = "valueStep",
			type = "number",
			default = nil,
			examples = {
				{ value = 1, label = "WeakAurasOptions" },
				{ value = 10, label = "AllTheThings" },
				{ value = "0.1", label = "AllTheThings" },
			},
		},
	},
	returns = {},
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
	params = {
		{
			name = "left",
			type = "uiUnit",
			default = nil,
			examples = {
				{ value = 0, label = "Narcissus" },
				{ value = 4, label = "Narcissus" },
				{ value = 0, label = "Narcissus_Achievements" },
			},
		},
		{ name = "right", type = "uiUnit", default = nil },
		{ name = "top", type = "uiUnit", default = nil },
		{ name = "bottom", type = "uiUnit", default = nil },
	},
	returns = {},
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
	params = {
		{
			name = "x",
			type = "uiUnit",
			default = nil,
			examples = {
				{ value = 0, label = "Narcissus" },
				{ value = 0, label = "Narcissus" },
				{ value = 6, label = "Narcissus" },
			},
		},
		{ name = "y", type = "uiUnit", default = nil },
	},
	returns = {},
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
	params = {
		{
			name = "width",
			type = "uiUnit",
			default = nil,
			examples = {
				{ value = 1, label = "WeakAuras" },
				{ value = 32, label = "WeakAuras" },
				{ value = "show and (xProgress + 0.1) or 0.1", label = "WeakAuras" },
			},
		},
	},
	returns = {},
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
	params = {
		{
			name = "yaw",
			type = "number",
			default = nil,
			examples = {
				{ value = "-3.14/3", label = "Narcissus" },
				{ value = "-math.pi*0.5", label = "Narcissus" },
				{ value = "-1.57", label = "Narcissus" },
			},
		},
	},
	returns = {},
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
	params = {
		{
			name = "zoom",
			type = "number",
			default = nil,
			examples = { { value = "zoom < 2 and zoom + 1 or zoom - 1", label = "TomTom" } },
		},
	},
	returns = {},
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["ShowCloak"] = {
	key = "ShowCloak",
	name = "ShowCloak",
	category = "combat_midnight",
	subcategory = "global",
	func = _G["ShowCloak"],
	funcPath = "ShowCloak",
	params = { { name = "show", type = "bool", default = nil } },
	returns = {},
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
	returns = {},
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["SimulateMouseClick"] = {
	key = "SimulateMouseClick",
	name = "SimulateMouseClick",
	category = "combat_midnight",
	subcategory = "global",
	func = _G["SimulateMouseClick"],
	funcPath = "SimulateMouseClick",
	params = { { name = "button", type = "mouseButton", default = nil } },
	returns = {},
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
	returns = {},
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
	returns = {},
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
	returns = {},
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["StartAttack"] = {
	key = "StartAttack",
	name = "StartAttack",
	category = "combat_midnight",
	subcategory = "global",
	func = _G["StartAttack"],
	funcPath = "StartAttack",
	params = {
		{ name = "name", type = "cstring", default = "0" },
		{ name = "exactMatch", type = "bool", default = false },
	},
	returns = {},
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
	params = {
		{ name = "movieID", type = "number", default = nil },
		{ name = "looping", type = "bool", default = false },
	},
	returns = {
		{ name = "success", type = "bool", canBeSecret = false },
		{ name = "returnCode", type = "number", canBeSecret = false },
	},
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
	params = {
		{ name = "movieName", type = "cstring", default = nil },
		{ name = "looping", type = "bool", default = false },
		{ name = "resolution", type = "number", default = 0 },
	},
	returns = {
		{ name = "success", type = "bool", canBeSecret = false },
		{ name = "returnCode", type = "number", canBeSecret = false },
	},
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
	params = {
		{ name = "panType", type = "luaIndex", default = nil },
		{ name = "durationSeconds", type = "number", default = nil },
		{ name = "doFade", type = "bool", default = false },
		{ name = "visKitID", type = "number", default = 0 },
		{ name = "startPositionScale", type = "number", default = 0 },
		{ name = "speedMultiplier", type = "number", default = 1 },
	},
	returns = {},
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
	params = {
		{
			name = "duration",
			type = "number",
			default = 0,
			examples = { { value = 2, label = "Plumber" }, { value = "2.75", label = "Plumber" } },
		},
		{ name = "fadeDuration", type = "number", default = 0 },
	},
	returns = {},
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["TargetDirectionEnemy"] = {
	key = "TargetDirectionEnemy",
	name = "TargetDirectionEnemy",
	category = "combat_midnight",
	subcategory = "global",
	func = _G["TargetDirectionEnemy"],
	funcPath = "TargetDirectionEnemy",
	params = {
		{ name = "facing", type = "number", default = nil },
		{ name = "coneAngle", type = "number", default = nil },
	},
	returns = {},
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["TargetDirectionFriend"] = {
	key = "TargetDirectionFriend",
	name = "TargetDirectionFriend",
	category = "combat_midnight",
	subcategory = "global",
	func = _G["TargetDirectionFriend"],
	funcPath = "TargetDirectionFriend",
	params = {
		{ name = "facing", type = "number", default = nil },
		{ name = "coneAngle", type = "number", default = nil },
	},
	returns = {},
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["TargetNearest"] = {
	key = "TargetNearest",
	name = "TargetNearest",
	category = "combat_midnight",
	subcategory = "global",
	func = _G["TargetNearest"],
	funcPath = "TargetNearest",
	params = { { name = "reverse", type = "bool", default = false } },
	returns = {},
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
	returns = {},
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
	returns = {},
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
	returns = {},
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
	returns = {},
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
	returns = {},
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
	returns = {},
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["TargetPriorityHighlightStart"] = {
	key = "TargetPriorityHighlightStart",
	name = "TargetPriorityHighlightStart",
	category = "combat_midnight",
	subcategory = "global",
	func = _G["TargetPriorityHighlightStart"],
	funcPath = "TargetPriorityHighlightStart",
	params = { { name = "useStartDelay", type = "bool", default = false } },
	returns = {},
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["TargetTotem"] = {
	key = "TargetTotem",
	name = "TargetTotem",
	category = "combat_midnight",
	subcategory = "global",
	func = _G["TargetTotem"],
	funcPath = "TargetTotem",
	params = { { name = "slot", type = "luaIndex", default = nil } },
	returns = {},
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
	params = {
		{ name = "name", type = "cstring", default = "", examples = { { value = "unit", label = "Details" } } },
		{ name = "exactMatch", type = "bool", default = false },
	},
	returns = {},
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
	params = {
		{ name = "snapshotID", type = "number", default = nil },
		{ name = "filename", type = "cstring", default = nil },
	},
	returns = { { name = "success", type = "bool", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["ToggleFilterTag"] = {
	key = "ToggleFilterTag",
	name = "ToggleFilterTag",
	category = "combat_midnight",
	subcategory = "global",
	func = _G["ToggleFilterTag"],
	funcPath = "ToggleFilterTag",
	params = {
		{ name = "groupID", type = "number", default = nil },
		{ name = "tagID", type = "number", default = nil },
	},
	returns = {},
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["TransformCameraSpaceToModelSpace"] = {
	key = "TransformCameraSpaceToModelSpace",
	name = "TransformCameraSpaceToModelSpace",
	category = "combat_midnight",
	subcategory = "global",
	func = _G["TransformCameraSpaceToModelSpace"],
	funcPath = "TransformCameraSpaceToModelSpace",
	params = {
		{
			name = "cameraPosition",
			type = "vector3",
			default = nil,
			examples = { { value = "SharedVector3D", label = "Narcissus" }, { value = 0, label = "Narcissus" } },
		},
	},
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
	params = {
		{
			name = "itemLinkOrItemModifiedAppearanceID",
			type = "cstring",
			default = nil,
			examples = {
				{ value = "item:72019", label = "Narcissus" },
				{ value = "item:72020", label = "Narcissus" },
				{ value = [=["item:"..self.itemID]=], label = "Narcissus" },
			},
		},
		{ name = "handSlotName", type = "cstring", default = nil },
		{ name = "spellEnchantmentID", type = "number", default = 0 },
	},
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
	params = {
		{
			name = "includeWeapons",
			type = "bool",
			default = true,
			examples = {
				{ value = 16, label = "Narcissus_Database_Item" },
				{ value = 17, label = "Narcissus_Database_Item" },
			},
		},
	},
	returns = {},
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
	params = {
		{
			name = "inventorySlots",
			type = "number",
			default = nil,
			examples = {
				{ value = 16, label = "Narcissus" },
				{ value = 17, label = "Narcissus" },
				{ value = 1, label = "Narcissus" },
			},
		},
	},
	returns = {},
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["UnitAffectingCombat"] = {
	key = "UnitAffectingCombat",
	name = "UnitAffectingCombat",
	category = "combat_midnight",
	subcategory = "global",
	func = _G["UnitAffectingCombat"],
	funcPath = "UnitAffectingCombat",
	params = {
		{
			name = "unit",
			type = "UnitToken",
			default = "player",
			examples = {
				{ value = "player", label = "WeakAuras" },
				{ value = "unit", label = "WeakAuras" },
				{ value = "player", label = "WeakAuras" },
			},
		},
	},
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
	returns = {
		{ name = "isAlliedRace", type = "bool", canBeSecret = false },
		{ name = "hasHeritageArmorUnlocked", type = "bool", canBeSecret = false },
	},
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
	params = {
		{
			name = "unit",
			type = "UnitToken",
			default = "player",
			examples = { { value = "player", label = "WeakAuras" }, { value = "unit", label = "Details" } },
		},
	},
	returns = {
		{ name = "base", type = "number", canBeSecret = false },
		{ name = "effective", type = "number", canBeSecret = false },
		{ name = "real", type = "number", canBeSecret = false },
		{ name = "bonus", type = "number", canBeSecret = false },
	},
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
	params = {
		{
			name = "unit",
			type = "UnitToken",
			default = "player",
			examples = { { value = "player", label = "WeakAuras" }, { value = "unit", label = "DejaCharacterStats" } },
		},
	},
	returns = {
		{ name = "attackPower", type = "number", canBeSecret = false },
		{ name = "posBuff", type = "number", canBeSecret = false },
		{ name = "negBuff", type = "number", canBeSecret = false },
	},
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
	params = {
		{
			name = "unit",
			type = "UnitToken",
			default = "player",
			examples = { { value = "player", label = "WeakAuras" }, { value = "unit", label = "DejaCharacterStats" } },
		},
	},
	returns = {
		{ name = "attackSpeed", type = "number", canBeSecret = false },
		{ name = "offhandAttackSpeed", type = "number", canBeSecret = false },
	},
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
	params = {
		{
			name = "unit",
			type = "UnitToken",
			default = "player",
			examples = { { value = "unit", label = "Details" }, { value = "player", label = "Plater" } },
		},
		{ name = "target", type = "UnitToken", default = "player" },
	},
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
	params = {
		{
			name = "unit",
			type = "UnitToken",
			default = "player",
			examples = {
				{ value = "player", label = "WeakAuras" },
				{ value = "player", label = "WeakAuras" },
				{ value = "player", label = "WeakAuras" },
			},
		},
		{ name = "target", type = "UnitToken", default = "player" },
	},
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
	params = {
		{
			name = "unit",
			type = "UnitToken",
			default = "player",
			examples = { { value = "unit", label = "Details" }, { value = "target", label = "Leatrix_Plus" } },
		},
		{ name = "target", type = "UnitToken", default = "player" },
	},
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
	params = {
		{ name = "unit", type = "UnitToken", default = "player" },
		{ name = "target", type = "UnitToken", default = "player" },
	},
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
	params = {
		{
			name = "unit",
			type = "UnitToken",
			default = "player",
			examples = {
				{ value = "player", label = "BigWigs" },
				{ value = "unit", label = "BigWigs_NerubarPalace" },
				{ value = "boss1", label = "DBM-Party-Legion" },
			},
		},
	},
	returns = {
		{ name = "name", type = "cstring", canBeSecret = false },
		{ name = "displayName", type = "string", canBeSecret = false },
		{ name = "textureID", type = "fileID", canBeSecret = false },
		{ name = "startTimeMs", type = "number", canBeSecret = false },
		{ name = "endTimeMs", type = "number", canBeSecret = false },
		{ name = "isTradeskill", type = "bool", canBeSecret = false },
		{ name = "castID", type = "WOWGUID", canBeSecret = false },
		{ name = "notInterruptible", type = "bool", canBeSecret = false },
		{ name = "castingSpellID", type = "number", canBeSecret = false },
	},
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
	params = {
		{
			name = "unit",
			type = "UnitToken",
			default = "player",
			examples = {
				{ value = "unit", label = "WeakAuras" },
				{ value = "boss1", label = "DBM-Raids-WarWithin" },
				{ value = "player", label = "Details_Streamer" },
			},
		},
	},
	returns = {
		{ name = "name", type = "cstring", canBeSecret = false },
		{ name = "displayName", type = "cstring", canBeSecret = false },
		{ name = "textureID", type = "fileID", canBeSecret = false },
		{ name = "startTimeMs", type = "number", canBeSecret = false },
		{ name = "endTimeMs", type = "number", canBeSecret = false },
		{ name = "isTradeskill", type = "bool", canBeSecret = false },
		{ name = "notInterruptible", type = "bool", canBeSecret = false },
		{ name = "spellID", type = "number", canBeSecret = false },
		{ name = "isEmpowered", type = "bool", canBeSecret = false },
		{ name = "numEmpowerStages", type = "number", canBeSecret = false },
	},
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
	params = {
		{
			name = "unit",
			type = "UnitToken",
			default = "player",
			examples = {
				{ value = "unit", label = "WeakAuras" },
				{ value = "player", label = "WeakAuras" },
				{ value = "player", label = "WeakAuras" },
			},
		},
	},
	returns = {
		{ name = "className", type = "cstring", canBeSecret = false },
		{ name = "classFilename", type = "cstring", canBeSecret = false },
		{ name = "classID", type = "number", canBeSecret = false },
	},
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
	params = {
		{
			name = "unit",
			type = "UnitToken",
			default = "player",
			examples = {
				{ value = "player", label = "BagBrother" },
				{ value = "player", label = "Bartender4" },
				{ value = [=[LT["Unit"]]=], label = "Leatrix_Plus" },
			},
		},
	},
	returns = {
		{ name = "classFilename", type = "cstring", canBeSecret = false },
		{ name = "classID", type = "number", canBeSecret = false },
	},
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
	returns = {
		{ name = "className", type = "cstring", canBeSecret = false },
		{ name = "classFilename", type = "cstring", canBeSecret = false },
		{ name = "classID", type = "number", canBeSecret = false },
	},
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
	params = {
		{
			name = "unit",
			type = "UnitToken",
			default = "player",
			examples = {
				{ value = "unit", label = "WeakAuras" },
				{ value = [=[LT["Unit"]]=], label = "Leatrix_Plus" },
				{ value = "target", label = "Leatrix_Plus" },
			},
		},
	},
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
	params = {
		{
			name = "unit",
			type = "UnitToken",
			default = "player",
			examples = { { value = "player", label = "Dominos" } },
		},
	},
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
	params = {
		{
			name = "unit",
			type = "UnitToken",
			default = "player",
			examples = { { value = "unit", label = "WeakAuras" }, { value = [=[arg.."pet"]=], label = "MRT" } },
		},
	},
	returns = {
		{ name = "name", type = "cstring", canBeSecret = false },
		{ name = "id", type = "number", canBeSecret = false },
	},
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
	params = {
		{
			name = "unit",
			type = "UnitToken",
			default = "player",
			examples = { { value = "unit", label = "WeakAuras" }, { value = [=[LT["Unit"]]=], label = "Leatrix_Plus" } },
		},
	},
	returns = {
		{ name = "name", type = "cstring", canBeSecret = false },
		{ name = "id", type = "number", canBeSecret = false },
	},
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
	params = {
		{
			name = "unit",
			type = "UnitToken",
			default = "player",
			examples = { { value = "unit", label = "DejaCharacterStats" } },
		},
	},
	returns = {
		{ name = "minDamage", type = "number", canBeSecret = false },
		{ name = "maxDamage", type = "number", canBeSecret = false },
		{ name = "offhandMinDamage", type = "number", canBeSecret = false },
		{ name = "offhandMaxDamage", type = "number", canBeSecret = false },
		{ name = "posBuff", type = "number", canBeSecret = false },
		{ name = "negBuff", type = "number", canBeSecret = false },
		{ name = "percent", type = "number", canBeSecret = false },
	},
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
	params = {
		{
			name = "unit",
			type = "UnitToken",
			default = "player",
			examples = {
				{ value = [=[sourceUnit or "player"]=], label = "BigWigs_Core" },
				{ value = "uId", label = "DBM-Core" },
				{ value = "id", label = "DBM-Core" },
			},
		},
		{ name = "mobGUID", type = "UnitToken", default = "player" },
	},
	returns = {
		{ name = "isTanking", type = "bool", canBeSecret = false },
		{ name = "status", type = "number", canBeSecret = false },
		{ name = "scaledPercentage", type = "number", canBeSecret = false },
		{ name = "rawPercentage", type = "number", canBeSecret = false },
		{ name = "rawThreat", type = "number", canBeSecret = false },
	},
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
	returns = {
		{ name = "distance", type = "number", canBeSecret = false },
		{ name = "checkedDistance", type = "bool", canBeSecret = false },
	},
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
	params = {
		{
			name = "name",
			type = "cstring",
			default = nil,
			examples = {
				{ value = "player", label = "WeakAuras" },
				{ value = "player", label = "WeakAuras" },
				{ value = "unit", label = "DejaCharacterStats" },
			},
		},
	},
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
	params = {
		{
			name = "unit",
			type = "UnitToken",
			default = "player",
			examples = {
				{ value = "unit", label = "WeakAuras" },
				{ value = "arg1", label = "WeakAuras" },
				{ value = "target", label = "WeakAuras" },
			},
		},
	},
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
	params = {
		{
			name = "unitName",
			type = "cstring",
			default = nil,
			examples = {
				{ value = "player", label = "WeakAuras" },
				{ value = "npc", label = "AllTheThings" },
				{ value = "player", label = "AstralKeys" },
			},
		},
		{ name = "checkDisplayRace", type = "bool", default = false },
	},
	returns = {
		{ name = "factionGroupTag", type = "cstring", canBeSecret = false },
		{ name = "localized", type = "cstring", canBeSecret = false },
	},
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
	params = {
		{
			name = "unit",
			type = "UnitToken",
			default = "player",
			examples = {
				{ value = "player", label = "WeakAuras" },
				{ value = "unit", label = "WeakAuras" },
				{ value = "player", label = "BagBrother" },
			},
		},
	},
	returns = {
		{ name = "unitName", type = "cstring", canBeSecret = false },
		{ name = "unitServer", type = "cstring", canBeSecret = false },
	},
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
	params = {
		{
			name = "unit",
			type = "UnitToken",
			default = "player",
			examples = {
				{ value = "player", label = "WeakAuras" },
				{ value = "unit", label = "WeakAuras" },
				{ value = "pet", label = "WeakAuras" },
			},
		},
	},
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
	returns = {
		{ name = "tank", type = "bool", canBeSecret = false },
		{ name = "healer", type = "bool", canBeSecret = false },
		{ name = "dps", type = "bool", canBeSecret = false },
	},
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
	params = {
		{
			name = "unit",
			type = "UnitToken",
			default = "player",
			examples = { { value = "unit", label = "DandersFrames" }, { value = "unit", label = "DandersFrames" } },
		},
		{ name = "healerUnit", type = "UnitToken", default = "player" },
		{ name = "healPredictionCalculator", type = "UnitHealPredictionCalculator", default = nil },
	},
	returns = {},
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
	params = {
		{
			name = "unit",
			type = "UnitToken",
			default = "player",
			examples = { { value = "unit", label = "WeakAuras" }, { value = "unit", label = "DandersFrames" } },
		},
		{ name = "healerGUID", type = "UnitToken", default = "player" },
	},
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
	params = {
		{
			name = "unit",
			type = "UnitToken",
			default = "player",
			examples = {
				{ value = "unit", label = "WeakAuras" },
				{ value = "u", label = "ActionHud" },
				{ value = "boss1", label = "DBM-Party-MoP" },
			},
		},
	},
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
	params = {
		{
			name = "unit",
			type = "UnitToken",
			default = "player",
			examples = { { value = "unit", label = "WeakAuras" } },
		},
	},
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
	params = {
		{
			name = "unit",
			type = "UnitToken",
			default = "player",
			examples = {
				{ value = "unit", label = "WeakAuras" },
				{ value = "player", label = "WeakAuras" },
				{ value = "frame.unit", label = "DandersFrames" },
			},
		},
	},
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
	params = {
		{
			name = "unit",
			type = "UnitToken",
			default = "player",
			examples = { { value = "player", label = "Narcissus" } },
		},
	},
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
	params = {
		{ name = "unit", type = "UnitToken", default = "player", examples = { { value = "unit", label = "Details" } } },
	},
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
	params = {
		{
			name = "unit",
			type = "UnitToken",
			default = "player",
			examples = {
				{ value = "player", label = "WeakAuras" },
				{ value = "player", label = "Bartender4" },
				{ value = "self.unit", label = "Plater" },
			},
		},
	},
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
	params = {
		{
			name = "unit",
			type = "UnitToken",
			default = "player",
			examples = {
				{ value = "unit", label = "WeakAuras" },
				{ value = "unit", label = "ActionHud" },
				{ value = "boss1", label = "BigWigs_Core" },
			},
		},
		{ name = "usePredicted", type = "bool", default = true },
	},
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
	params = {
		{
			name = "unit",
			type = "UnitToken",
			default = "player",
			examples = {
				{ value = "unit", label = "WeakAuras" },
				{ value = "unit", label = "ActionHud" },
				{ value = "player", label = "DBM-Core" },
			},
		},
	},
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
	params = {
		{
			name = "unit",
			type = "UnitToken",
			default = "player",
			examples = { { value = "unit", label = "DandersFrames" }, { value = "unitFrame.unit", label = "Plater" } },
		},
		{ name = "usePredicted", type = "bool", default = true },
	},
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
	params = {
		{
			name = "unit",
			type = "UnitToken",
			default = "player",
			examples = {
				{ value = "unit", label = "ActionHud" },
				{ value = "unit", label = "DandersFrames" },
				{ value = "unit", label = "DandersFrames" },
			},
		},
		{ name = "usePredicted", type = "bool", default = true },
		{ name = "curve", type = "LuaCurveObjectBase", default = nil },
	},
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
	params = {
		{
			name = "unit",
			type = "UnitToken",
			default = "player",
			examples = {
				{ value = "player", label = "DejaCharacterStats" },
				{ value = "player", label = "Dominos_Progress" },
			},
		},
	},
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
	params = {
		{
			name = "unit",
			type = "UnitToken",
			default = "player",
			examples = { { value = "player", label = "DejaCharacterStats" } },
		},
	},
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
	params = {
		{
			name = "unit",
			type = "UnitToken",
			default = "player",
			examples = {
				{ value = "player", label = "DejaCharacterStats" },
				{ value = "player", label = "Dominos_Progress" },
			},
		},
	},
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
	params = {
		{ name = "unit", type = "UnitToken", default = "player" },
		{ name = "partyIndex", type = "luaIndex", default = nil },
	},
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
	params = {
		{
			name = "unit",
			type = "UnitToken",
			default = "player",
			examples = { { value = "player", label = "WeakAuras" }, { value = "unit", label = "Details" } },
		},
		{ name = "partyIndex", type = "luaIndex", default = nil },
	},
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
	params = {
		{
			name = "unit",
			type = "UnitToken",
			default = "player",
			examples = {
				{ value = "player", label = "WeakAuras" },
				{ value = "player", label = "AllTheThings" },
				{ value = "unit", label = "Details" },
			},
		},
		{ name = "partyIndex", type = "luaIndex", default = nil },
	},
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
	params = {
		{
			name = "unit",
			type = "UnitToken",
			default = "player",
			examples = { { value = "unit", label = "BigWigs_Core" } },
		},
	},
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
	params = {
		{
			name = "unit",
			type = "UnitToken",
			default = "player",
			examples = {
				{ value = "unit", label = "WeakAuras" },
				{ value = "player", label = "WeakAuras" },
				{ value = "player", label = "AllTheThings" },
			},
		},
		{ name = "partyIndex", type = "luaIndex", default = nil },
	},
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
	params = {
		{
			name = "unit",
			type = "UnitToken",
			default = "player",
			examples = { { value = "unit", label = "WeakAuras" } },
		},
	},
	returns = {
		{ name = "inRange", type = "bool", canBeSecret = true },
		{ name = "checkedRange", type = "bool", canBeSecret = true },
	},
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
	params = {
		{
			name = "unit",
			type = "UnitToken",
			default = "player",
			examples = {
				{ value = "unit", label = "WeakAuras" },
				{ value = "WeakAuras.petUnitToUnit[unit] or unit", label = "WeakAuras" },
				{ value = "WeakAuras.petUnitToUnit[unit]", label = "WeakAuras" },
			},
		},
		{ name = "partyIndex", type = "luaIndex", default = nil },
	},
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
	params = {
		{
			name = "unit",
			type = "UnitToken",
			default = "player",
			examples = {
				{ value = "player", label = "WeakAuras" },
				{ value = "player", label = "DBM-Challenges" },
				{ value = "unit", label = "DejaCharacterStats" },
			},
		},
	},
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
	params = {
		{
			name = "unit",
			type = "UnitToken",
			default = "player",
			examples = {
				{ value = "unit", label = "WeakAuras" },
				{ value = "player", label = "WeakAuras" },
				{ value = "player", label = "DBM-Core" },
			},
		},
	},
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
	params = {
		{
			name = "unit",
			type = "UnitToken",
			default = "player",
			examples = { { value = "target", label = "Plumber" } },
		},
	},
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
	params = {
		{
			name = "unit",
			type = "UnitToken",
			default = "player",
			examples = { { value = "unit", label = "Details" }, { value = [=[LT["Unit"]]=], label = "Leatrix_Plus" } },
		},
	},
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
	params = {
		{
			name = "unit",
			type = "UnitToken",
			default = "player",
			examples = {
				{ value = "unit", label = "WeakAuras" },
				{ value = "player", label = "BigWigs" },
				{ value = "id", label = "DBM-Core" },
			},
		},
	},
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
	params = {
		{
			name = "unit",
			type = "UnitToken",
			default = "player",
			examples = { { value = "mouseover", label = "BigWigs_Core" }, { value = "unit", label = "Details" } },
		},
	},
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
	params = {
		{
			name = "unit",
			type = "UnitToken",
			default = "player",
			examples = { { value = "unit", label = "WeakAuras" } },
		},
	},
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
	params = {
		{
			name = "unit",
			type = "UnitToken",
			default = "player",
			examples = {
				{ value = "pet", label = "WeakAuras" },
				{ value = "player", label = "Baganator" },
				{ value = "player", label = "BagBrother" },
			},
		},
	},
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
	params = {
		{
			name = "unit",
			type = "UnitToken",
			default = "player",
			examples = {
				{ value = "unit", label = "WeakAuras" },
				{ value = "player", label = "WeakAuras" },
				{ value = "player", label = "BigWigs_Core" },
			},
		},
	},
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
	params = {
		{
			name = "unit",
			type = "UnitToken",
			default = "player",
			examples = {
				{ value = "player", label = "ActionHud" },
				{ value = "player", label = "DBM-Party-BfA" },
				{ value = "unit", label = "Details" },
			},
		},
		{ name = "target", type = "UnitToken", default = "player" },
	},
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
	params = {
		{ name = "unit", type = "UnitToken", default = "player", examples = { { value = "unit", label = "Details" } } },
	},
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
	params = {
		{
			name = "unit",
			type = "UnitToken",
			default = "player",
			examples = {
				{ value = "player", label = "ActionHud" },
				{ value = "player", label = "DBM-Core" },
				{ value = "player", label = "DBM-Core" },
			},
		},
		{ name = "target", type = "UnitToken", default = "player" },
	},
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
	params = {
		{ name = "unit", type = "UnitToken", default = "player", examples = { { value = "unit", label = "Plumber" } } },
	},
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
	params = {
		{
			name = "unit",
			type = "UnitToken",
			default = "player",
			examples = { { value = "unit", label = "DandersFrames" }, { value = "v.id", label = "DBM-Core" } },
		},
	},
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
	params = {
		{
			name = "unit",
			type = "UnitToken",
			default = "player",
			examples = { { value = "player", label = "WeakAuras" }, { value = "unit", label = "DandersFrames" } },
		},
	},
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
	params = {
		{
			name = "unit",
			type = "UnitToken",
			default = "player",
			examples = {
				{ value = "player", label = "WeakAuras" },
				{ value = "t.unit", label = "AllTheThings" },
				{ value = "player", label = "AllTheThings" },
			},
		},
		{ name = "partyCategory", type = "luaIndex", default = nil },
	},
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
	params = {
		{ name = "unit", type = "UnitToken", default = "player" },
		{ name = "partyIndex", type = "luaIndex", default = nil },
	},
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
	params = {
		{
			name = "unit",
			type = "cstring",
			default = nil,
			examples = {
				{ value = "unit", label = "Details" },
				{ value = [=[LT["Unit"]]=], label = "Leatrix_Plus" },
				{ value = "id", label = "TitanLootType" },
			},
		},
	},
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
	params = {
		{
			name = "unit",
			type = "UnitToken",
			default = "player",
			examples = { { value = "unit", label = "BigWigs_Core" } },
		},
	},
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
	params = {
		{
			name = "unit",
			type = "UnitToken",
			default = "player",
			examples = { { value = "unit", label = "Narcissus_Database_NPC" } },
		},
	},
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
	params = {
		{ name = "controllingUnit", type = "UnitToken", default = "player" },
		{ name = "controlledUnit", type = "UnitToken", default = "player" },
	},
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
	params = {
		{
			name = "unit",
			type = "UnitToken",
			default = "player",
			examples = {
				{ value = "player", label = "WeakAuras" },
				{ value = "player", label = "WeakAuras" },
				{ value = "unit", label = "Details" },
			},
		},
	},
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
	params = {
		{
			name = "unit",
			type = "UnitToken",
			default = "player",
			examples = { { value = "player", label = "WeakAuras" }, { value = "unit", label = "Details" } },
		},
	},
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
	params = {
		{ name = "unit", type = "UnitToken", default = "player", examples = { { value = "unit", label = "Details" } } },
	},
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
	params = {
		{
			name = "unit",
			type = "UnitToken",
			default = "player",
			examples = {
				{ value = "unit", label = "WeakAuras" },
				{ value = "target", label = "AllTheThings" },
				{ value = [=[uId .. "target"]=], label = "DBM-Core" },
			},
		},
		{ name = "partyIndex", type = "luaIndex", default = nil },
	},
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
	params = {
		{ name = "unit", type = "UnitToken", default = "player", examples = { { value = "unit", label = "Details" } } },
	},
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
	params = {
		{ name = "unit", type = "UnitToken", default = "player", examples = { { value = "unit", label = "Details" } } },
	},
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
	params = {
		{ name = "unitName", type = "cstring", default = nil, examples = { { value = "unit", label = "Details" } } },
	},
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
	params = {
		{ name = "unit", type = "UnitToken", default = "player" },
		{ name = "target", type = "UnitToken", default = "player" },
	},
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
	params = {
		{
			name = "unit",
			type = "UnitToken",
			default = "player",
			examples = { { value = [=[LT["Unit"]]=], label = "Leatrix_Plus" }, { value = "unit", label = "Plater" } },
		},
	},
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
	params = {
		{ name = "unit", type = "UnitToken", default = "player", examples = { { value = "unit", label = "Details" } } },
	},
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
	params = {
		{
			name = "unit1",
			type = "UnitToken",
			default = "player",
			examples = {
				{ value = "player", label = "WeakAuras" },
				{ value = "pet", label = "WeakAuras" },
				{ value = "player", label = "WeakAuras" },
			},
		},
		{ name = "unit2", type = "UnitToken", default = "player" },
	},
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
	params = {
		{
			name = "unit",
			type = "UnitToken",
			default = "player",
			examples = { { value = "unit", label = "WeakAuras" }, { value = "unitFrame.unit", label = "Plater" } },
		},
	},
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
	params = {
		{
			name = "unit",
			type = "UnitToken",
			default = "player",
			examples = { { value = [=[LT["Unit"]]=], label = "Leatrix_Plus" } },
		},
	},
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
	params = {
		{
			name = "name",
			type = "cstring",
			default = nil,
			examples = {
				{ value = "unit", label = "WeakAuras" },
				{ value = "player", label = "WeakAuras" },
				{ value = "player", label = "WeakAuras" },
			},
		},
	},
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
	params = {
		{
			name = "unit",
			type = "UnitToken",
			default = "player",
			examples = {
				{ value = "unit", label = "WeakAuras" },
				{ value = "unit", label = "WeakAuras" },
				{ value = "player", label = "WeakAuras" },
			},
		},
	},
	returns = {
		{ name = "unitName", type = "cstring", canBeSecret = false },
		{ name = "unitServer", type = "cstring", canBeSecret = false },
	},
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
	returns = {
		{ name = "unitName", type = "cstring", canBeSecret = false },
		{ name = "unitServer", type = "cstring", canBeSecret = false },
	},
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
	params = {
		{
			name = "unit",
			type = "UnitToken",
			default = "player",
			examples = { { value = "player", label = "!BugGrabber" }, { value = "unit", label = "TalentTreeTweaks" } },
		},
	},
	returns = {
		{ name = "unitName", type = "cstring", canBeSecret = false },
		{ name = "unitServer", type = "cstring", canBeSecret = false },
	},
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
	params = {
		{
			name = "unit",
			type = "UnitToken",
			default = "player",
			examples = {
				{ value = "player", label = "WeakAuras" },
				{ value = "player", label = "Bartender4" },
				{ value = "unit", label = "Details" },
			},
		},
	},
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
	params = {
		{
			name = "unit",
			type = "UnitToken",
			default = "player",
			examples = { { value = "unit", label = "Details" }, { value = [=[LT["Unit"]]=], label = "Leatrix_Plus" } },
		},
	},
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
	params = {
		{
			name = "unitToken",
			type = "UnitToken",
			default = "player",
			examples = {
				{ value = "player", label = "WeakAuras" },
				{ value = "unit", label = "ActionHud" },
				{ value = "player", label = "Plater" },
			},
		},
		{ name = "powerType", type = "PowerType", default = nil },
		{ name = "unmodified", type = "bool", default = false },
	},
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
	params = {
		{
			name = "unit",
			type = "UnitToken",
			default = "player",
			examples = { { value = "unit", label = "BigWigs_Plugins" } },
		},
	},
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
	params = {
		{
			name = "unit",
			type = "UnitToken",
			default = "player",
			examples = { { value = "unit", label = "Details" }, { value = [=[LT["Unit"]]=], label = "Leatrix_Plus" } },
		},
	},
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
	params = {
		{
			name = "unit",
			type = "UnitToken",
			default = "player",
			examples = { { value = "unit", label = "DBM-Core" } },
		},
		{ name = "partyIndex", type = "luaIndex", default = nil },
	},
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
	params = {
		{
			name = "unit",
			type = "UnitToken",
			default = "player",
			examples = { { value = "unit", label = "DBM-Core" } },
		},
		{ name = "partyIndex", type = "luaIndex", default = nil },
	},
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
	params = {
		{
			name = "unit",
			type = "UnitToken",
			default = "player",
			examples = {
				{ value = "player", label = "BigWigs_Core" },
				{ value = "player", label = "BigWigs_Plugins" },
				{ value = "unit", label = "BigWigs_Plugins" },
			},
		},
	},
	returns = {
		{ name = "positionX", type = "number", canBeSecret = false },
		{ name = "positionY", type = "number", canBeSecret = false },
		{ name = "positionZ", type = "number", canBeSecret = false },
		{ name = "mapID", type = "number", canBeSecret = false },
	},
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
	params = {
		{
			name = "unitToken",
			type = "UnitToken",
			default = "player",
			examples = {
				{ value = "player", label = "WeakAuras" },
				{ value = "player", label = "WeakAuras" },
				{ value = "unit", label = "WeakAuras" },
			},
		},
		{ name = "powerType", type = "PowerType", default = nil },
		{ name = "unmodified", type = "bool", default = false },
	},
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
	params = {
		{
			name = "unitToken",
			type = "UnitToken",
			default = "player",
			examples = { { value = "player", label = "WeakAuras" } },
		},
	},
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
	params = {
		{ name = "unit", type = "UnitToken", default = "player" },
		{ name = "index", type = "luaIndex", default = 0 },
	},
	returns = {
		{ name = "duration", type = "number", canBeSecret = true },
		{ name = "expiration", type = "number", canBeSecret = true },
		{ name = "barID", type = "number", canBeSecret = true },
		{ name = "auraID", type = "number", canBeSecret = true },
	},
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
	params = {
		{
			name = "unitToken",
			type = "UnitToken",
			default = "player",
			examples = {
				{ value = "player", label = "WeakAuras" },
				{ value = "player", label = "WeakAuras" },
				{ value = "unit", label = "WeakAuras" },
			},
		},
		{ name = "powerType", type = "PowerType", default = nil },
		{ name = "unmodified", type = "bool", default = false },
	},
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
	params = {
		{ name = "unitToken", type = "UnitToken", default = "player" },
		{ name = "powerType", type = "PowerType", default = nil },
		{ name = "unmodified", type = "bool", default = false },
	},
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
	params = {
		{ name = "unitToken", type = "UnitToken", default = "player" },
		{ name = "powerType", type = "PowerType", default = nil },
		{ name = "unmodified", type = "bool", default = false },
		{ name = "curve", type = "LuaCurveObjectBase", default = nil },
	},
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
	params = {
		{
			name = "unit",
			type = "UnitToken",
			default = "player",
			examples = {
				{ value = "unit", label = "WeakAuras" },
				{ value = "player", label = "ActionHud" },
				{ value = "unit", label = "Details" },
			},
		},
		{ name = "index", type = "number", default = 0 },
	},
	returns = {
		{ name = "powerType", type = "PowerType", canBeSecret = false },
		{ name = "powerTypeToken", type = "string", canBeSecret = false },
		{ name = "rgbX", type = "number", canBeSecret = false },
		{ name = "rgbY", type = "number", canBeSecret = false },
		{ name = "rgbZ", type = "number", canBeSecret = false },
	},
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
	params = {
		{
			name = "name",
			type = "cstring",
			default = nil,
			examples = {
				{ value = "player", label = "WeakAuras" },
				{ value = "player", label = "WeakAurasTemplates" },
				{ value = "unit", label = "AllTheThings" },
			},
		},
	},
	returns = {
		{ name = "localizedRaceName", type = "cstring", canBeSecret = false },
		{ name = "englishRaceName", type = "cstring", canBeSecret = false },
		{ name = "raceID", type = "number", canBeSecret = false },
	},
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
	params = {
		{
			name = "unit",
			type = "UnitToken",
			default = "player",
			examples = { { value = "unit", label = "DejaCharacterStats" } },
		},
	},
	returns = {
		{ name = "attackPower", type = "number", canBeSecret = false },
		{ name = "posBuff", type = "number", canBeSecret = false },
		{ name = "negBuff", type = "number", canBeSecret = false },
	},
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
	params = {
		{
			name = "unit",
			type = "UnitToken",
			default = "player",
			examples = { { value = "player", label = "WeakAuras" }, { value = "unit", label = "DejaCharacterStats" } },
		},
	},
	returns = {
		{ name = "speed", type = "number", canBeSecret = false },
		{ name = "minDamage", type = "number", canBeSecret = false },
		{ name = "maxDamage", type = "number", canBeSecret = false },
		{ name = "posBuff", type = "number", canBeSecret = false },
		{ name = "negBuff", type = "number", canBeSecret = false },
		{ name = "percent", type = "number", canBeSecret = false },
	},
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
	params = {
		{
			name = "unit",
			type = "UnitToken",
			default = "player",
			examples = {
				{ value = "player", label = "WeakAuras" },
				{ value = "unit", label = "Details" },
				{ value = "target", label = "Details" },
			},
		},
		{ name = "target", type = "UnitToken", default = "player" },
	},
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
	params = {
		{
			name = "unit",
			type = "UnitToken",
			default = "player",
			examples = { { value = "v.id", label = "DBM-Core" } },
		},
	},
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
	params = {
		{ name = "unit", type = "UnitToken", default = "player", examples = { { value = "unit", label = "Details" } } },
		{ name = "useExtendedColors", type = "bool", default = false },
	},
	returns = {
		{ name = "resultR", type = "number", canBeSecret = false },
		{ name = "resultG", type = "number", canBeSecret = false },
		{ name = "resultB", type = "number", canBeSecret = false },
		{ name = "resultA", type = "number", canBeSecret = false },
	},
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
	params = {
		{ name = "unit", type = "UnitToken", default = "player" },
		{ name = "useExtendedColors", type = "bool", default = false },
	},
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
	params = {
		{
			name = "unit",
			type = "UnitToken",
			default = "player",
			examples = { { value = "player", label = "BigWigs" } },
		},
		{ name = "roleStr", type = "cstring", default = nil },
	},
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
	params = {
		{ name = "unit", type = "UnitToken", default = "player" },
		{ name = "role", type = "LFGRole", default = nil },
	},
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
	params = {
		{
			name = "unit",
			type = "UnitToken",
			default = "player",
			examples = {
				{ value = "player", label = "WeakAuras" },
				{ value = "player", label = "BagBrother" },
				{ value = "unit", label = "BigWigs_Core" },
			},
		},
	},
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
	params = {
		{
			name = "unit",
			type = "UnitToken",
			default = "player",
			examples = { { value = "self.unit", label = "Plater" } },
		},
	},
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
	params = {
		{
			name = "unit",
			type = "UnitToken",
			default = "player",
			examples = { { value = "self.unit", label = "Plater" } },
		},
	},
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
	params = {
		{
			name = "unit",
			type = "UnitToken",
			default = "player",
			examples = { { value = "player", label = "WeakAuras" }, { value = "unit", label = "WeakAuras" } },
		},
	},
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
	params = {
		{
			name = "unit",
			type = "UnitToken",
			default = "player",
			examples = {
				{ value = "player", label = "WeakAuras" },
				{ value = "player", label = "WeakAuras" },
				{ value = "player", label = "WeakAuras" },
			},
		},
		{ name = "index", type = "luaIndex", default = nil },
	},
	returns = {
		{ name = "currentStat", type = "number", canBeSecret = false },
		{ name = "effectiveStat", type = "number", canBeSecret = false },
		{ name = "statPositiveBuff", type = "number", canBeSecret = false },
		{ name = "statNegativeBuff", type = "number", canBeSecret = false },
	},
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
	params = {
		{ name = "unit", type = "UnitToken", default = "player" },
		{ name = "virtualSeatIndex", type = "luaIndex", default = nil },
	},
	returns = {},
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
	params = {
		{ name = "unit", type = "UnitToken", default = "player" },
		{ name = "mobGUID", type = "UnitToken", default = "player" },
	},
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
	params = {
		{ name = "unit", type = "UnitToken", default = "player" },
		{ name = "mobGUID", type = "UnitToken", default = "player" },
	},
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
	params = {
		{
			name = "unit",
			type = "UnitToken",
			default = "player",
			examples = {
				{ value = "player", label = "WeakAuras" },
				{ value = "unit", label = "DandersFrames" },
				{ value = "unit", label = "Details" },
			},
		},
		{ name = "mobGUID", type = "UnitToken", default = "player" },
	},
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
	params = {
		{
			name = "unitGUID",
			type = "WOWGUID",
			default = nil,
			examples = { { value = "guid", label = "BigWigs_Core" }, { value = "id", label = "BigWigs_Core" } },
		},
	},
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
	returns = {
		{ name = "bankedLevels", type = "number", canBeSecret = false },
		{ name = "xpIntoCurrentLevel", type = "number", canBeSecret = false },
		{ name = "xpForNextLevel", type = "number", canBeSecret = false },
	},
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
	params = {
		{ name = "unit", type = "UnitToken", default = "player", examples = { { value = "unit", label = "Details" } } },
	},
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
	params = {
		{ name = "unit", type = "UnitToken", default = "player" },
		{ name = "virtualSeatIndex", type = "luaIndex", default = nil },
	},
	returns = {
		{ name = "controlType", type = "cstring", canBeSecret = false },
		{ name = "occupantName", type = "cstring", canBeSecret = false },
		{ name = "serverName", type = "cstring", canBeSecret = false },
		{ name = "ejectable", type = "bool", canBeSecret = false },
		{ name = "canSwitchSeats", type = "bool", canBeSecret = false },
	},
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
	returns = {
		{ name = "mainHandWeaponAttackPower", type = "number", canBeSecret = false },
		{ name = "offHandWeaponAttackPower", type = "number", canBeSecret = false },
		{ name = "rangedWeaponAttackPower", type = "number", canBeSecret = false },
	},
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
	params = {
		{ name = "unit", type = "UnitToken", default = "player", examples = { { value = "unit", label = "Plumber" } } },
	},
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
	params = {
		{
			name = "unit",
			type = "UnitToken",
			default = "player",
			examples = { { value = "player", label = "WeakAuras" }, { value = "unit", label = "Details" } },
		},
	},
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
	params = {
		{
			name = "unit",
			type = "UnitToken",
			default = "player",
			examples = { { value = "player", label = "WeakAuras" }, { value = "unit", label = "Details" } },
		},
	},
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
	params = {
		{ name = "eventName", type = "cstring", default = nil },
		{ name = "callback", type = "EventCallbackType", default = nil },
	},
	returns = {},
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
	params = {
		{ name = "eventName", type = "cstring", default = nil },
		{ name = "callback", type = "EventCallbackType", default = nil },
		{ name = "unit", type = "UnitToken", default = "player" },
	},
	returns = {},
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
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

APIDefs["UseModelCenterToTransform"] = {
	key = "UseModelCenterToTransform",
	name = "UseModelCenterToTransform",
	category = "combat_midnight",
	subcategory = "global",
	func = _G["UseModelCenterToTransform"],
	funcPath = "UseModelCenterToTransform",
	params = { { name = "useCenter", type = "bool", default = nil } },
	returns = {},
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
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
	params = {
		{
			name = "value",
			type = "LuaValueReference",
			default = nil,
			examples = {
				{ value = "aura.spellId", label = "Leatrix_Plus" },
				{ value = "UnitName'target'", label = "MRT" },
				{ value = [=[UnitName("target")]=], label = "MRT" },
			},
		},
	},
	returns = { { name = "canAccessValue", type = "bool", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
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
	params = {
		{
			name = "value",
			type = "LuaValueReference",
			default = nil,
			examples = {
				{ value = "guid", label = "BigWigs_Core" },
				{ value = "arg1", label = "Plater" },
				{ value = "arg2", label = "Plater" },
			},
		},
	},
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
	params = {
		{ name = "func", type = "LuaValueReference", default = nil },
		{ name = "values", type = "LuaValueReference", default = nil },
	},
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
