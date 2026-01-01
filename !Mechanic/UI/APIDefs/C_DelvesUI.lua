-- Generated APIDefinitions for namespace: C_DelvesUI
local _, ns = ...
local APIDefs = ns.APIDefinitions

APIDefs["C_DelvesUI.GetCreatureDisplayInfoForCompanion"] = {
	key = "C_DelvesUI.GetCreatureDisplayInfoForCompanion",
	name = "GetCreatureDisplayInfoForCompanion",
	category = "combat_midnight",
	subcategory = "c_delvesui",
	func = _G["C_DelvesUI"] and _G["C_DelvesUI"]["GetCreatureDisplayInfoForCompanion"],
	funcPath = "C_DelvesUI.GetCreatureDisplayInfoForCompanion",
	params = { { name = "companionID", type = "number", default = nil } },
	returns = { { name = "creatureDisplayInfoID", type = "number", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_DelvesUI.GetCurioLink"] = {
	key = "C_DelvesUI.GetCurioLink",
	name = "GetCurioLink",
	category = "combat_midnight",
	subcategory = "c_delvesui",
	func = _G["C_DelvesUI"] and _G["C_DelvesUI"]["GetCurioLink"],
	funcPath = "C_DelvesUI.GetCurioLink",
	params = {
		{ name = "spellID", type = "number", default = nil },
		{ name = "rarity", type = "CurioRarity", default = nil },
	},
	returns = { { name = "curioLink", type = "cstring", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenTainted",
}

APIDefs["C_DelvesUI.GetCurioNodeForCompanion"] = {
	key = "C_DelvesUI.GetCurioNodeForCompanion",
	name = "GetCurioNodeForCompanion",
	category = "combat_midnight",
	subcategory = "c_delvesui",
	func = _G["C_DelvesUI"] and _G["C_DelvesUI"]["GetCurioNodeForCompanion"],
	funcPath = "C_DelvesUI.GetCurioNodeForCompanion",
	params = {
		{ name = "curioType", type = "CurioType", default = nil },
		{ name = "companionID", type = "number", default = nil },
	},
	returns = { { name = "nodeID", type = "number", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_DelvesUI.GetCurioRarityByTraitCondAccountElementID"] = {
	key = "C_DelvesUI.GetCurioRarityByTraitCondAccountElementID",
	name = "GetCurioRarityByTraitCondAccountElementID",
	category = "combat_midnight",
	subcategory = "c_delvesui",
	func = _G["C_DelvesUI"] and _G["C_DelvesUI"]["GetCurioRarityByTraitCondAccountElementID"],
	funcPath = "C_DelvesUI.GetCurioRarityByTraitCondAccountElementID",
	params = { { name = "traitCondAccountElementID", type = "number", default = nil } },
	returns = { { name = "rarity", type = "CurioRarity", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_DelvesUI.GetFactionForCompanion"] = {
	key = "C_DelvesUI.GetFactionForCompanion",
	name = "GetFactionForCompanion",
	category = "combat_midnight",
	subcategory = "c_delvesui",
	func = _G["C_DelvesUI"] and _G["C_DelvesUI"]["GetFactionForCompanion"],
	funcPath = "C_DelvesUI.GetFactionForCompanion",
	params = { { name = "companionID", type = "number", default = nil } },
	returns = { { name = "factionID", type = "number", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_DelvesUI.GetLockedTextForCompanion"] = {
	key = "C_DelvesUI.GetLockedTextForCompanion",
	name = "GetLockedTextForCompanion",
	category = "combat_midnight",
	subcategory = "c_delvesui",
	func = _G["C_DelvesUI"] and _G["C_DelvesUI"]["GetLockedTextForCompanion"],
	funcPath = "C_DelvesUI.GetLockedTextForCompanion",
	params = { { name = "companionID", type = "number", default = nil } },
	returns = { { name = "text", type = "string", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_DelvesUI.GetModelSceneForCompanion"] = {
	key = "C_DelvesUI.GetModelSceneForCompanion",
	name = "GetModelSceneForCompanion",
	category = "combat_midnight",
	subcategory = "c_delvesui",
	func = _G["C_DelvesUI"] and _G["C_DelvesUI"]["GetModelSceneForCompanion"],
	funcPath = "C_DelvesUI.GetModelSceneForCompanion",
	params = { { name = "companionID", type = "number", default = nil } },
	returns = { { name = "modelSceneID", type = "number", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_DelvesUI.GetRoleNodeForCompanion"] = {
	key = "C_DelvesUI.GetRoleNodeForCompanion",
	name = "GetRoleNodeForCompanion",
	category = "combat_midnight",
	subcategory = "c_delvesui",
	func = _G["C_DelvesUI"] and _G["C_DelvesUI"]["GetRoleNodeForCompanion"],
	funcPath = "C_DelvesUI.GetRoleNodeForCompanion",
	params = { { name = "companionID", type = "number", default = nil } },
	returns = { { name = "nodeID", type = "number", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_DelvesUI.GetRoleSubtreeForCompanion"] = {
	key = "C_DelvesUI.GetRoleSubtreeForCompanion",
	name = "GetRoleSubtreeForCompanion",
	category = "combat_midnight",
	subcategory = "c_delvesui",
	func = _G["C_DelvesUI"] and _G["C_DelvesUI"]["GetRoleSubtreeForCompanion"],
	funcPath = "C_DelvesUI.GetRoleSubtreeForCompanion",
	params = {
		{ name = "roleType", type = "CompanionRoleType", default = nil },
		{ name = "companionID", type = "number", default = nil },
	},
	returns = { { name = "subTreeID", type = "number", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_DelvesUI.GetTraitTreeForCompanion"] = {
	key = "C_DelvesUI.GetTraitTreeForCompanion",
	name = "GetTraitTreeForCompanion",
	category = "combat_midnight",
	subcategory = "c_delvesui",
	func = _G["C_DelvesUI"] and _G["C_DelvesUI"]["GetTraitTreeForCompanion"],
	funcPath = "C_DelvesUI.GetTraitTreeForCompanion",
	params = { { name = "companionID", type = "number", default = nil } },
	returns = { { name = "treeID", type = "number", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_DelvesUI.GetUnseenCuriosBySlotType"] = {
	key = "C_DelvesUI.GetUnseenCuriosBySlotType",
	name = "GetUnseenCuriosBySlotType",
	category = "combat_midnight",
	subcategory = "c_delvesui",
	func = _G["C_DelvesUI"] and _G["C_DelvesUI"]["GetUnseenCuriosBySlotType"],
	funcPath = "C_DelvesUI.GetUnseenCuriosBySlotType",
	params = {
		{ name = "slotType", type = "CompanionConfigSlotTypes", default = nil },
		{ name = "ownedCurioNodeIDs", type = "table", default = nil },
	},
	returns = { { name = "unseenCurioNodeIDs", type = "table", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_DelvesUI.HasActiveDelve"] = {
	key = "C_DelvesUI.HasActiveDelve",
	name = "HasActiveDelve",
	category = "combat_midnight",
	subcategory = "c_delvesui",
	func = _G["C_DelvesUI"] and _G["C_DelvesUI"]["HasActiveDelve"],
	funcPath = "C_DelvesUI.HasActiveDelve",
	params = { { name = "mapID", type = "number", default = nil } },
	returns = { { name = "result", type = "bool", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_DelvesUI.IsEligibleForActiveDelveRewards"] = {
	key = "C_DelvesUI.IsEligibleForActiveDelveRewards",
	name = "IsEligibleForActiveDelveRewards",
	category = "combat_midnight",
	subcategory = "c_delvesui",
	func = _G["C_DelvesUI"] and _G["C_DelvesUI"]["IsEligibleForActiveDelveRewards"],
	funcPath = "C_DelvesUI.IsEligibleForActiveDelveRewards",
	params = { { name = "unit", type = "UnitToken", default = "player" } },
	returns = { { name = "result", type = "bool", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_DelvesUI.IsTraitTreeForCompanion"] = {
	key = "C_DelvesUI.IsTraitTreeForCompanion",
	name = "IsTraitTreeForCompanion",
	category = "combat_midnight",
	subcategory = "c_delvesui",
	func = _G["C_DelvesUI"] and _G["C_DelvesUI"]["IsTraitTreeForCompanion"],
	funcPath = "C_DelvesUI.IsTraitTreeForCompanion",
	params = { { name = "traitTreeID", type = "number", default = nil } },
	returns = { { name = "isForCompanion", type = "bool", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_DelvesUI.RequestPartyEligibilityForDelveTiers"] = {
	key = "C_DelvesUI.RequestPartyEligibilityForDelveTiers",
	name = "RequestPartyEligibilityForDelveTiers",
	category = "combat_midnight",
	subcategory = "c_delvesui",
	func = _G["C_DelvesUI"] and _G["C_DelvesUI"]["RequestPartyEligibilityForDelveTiers"],
	funcPath = "C_DelvesUI.RequestPartyEligibilityForDelveTiers",
	params = { { name = "gossipOption", type = "number", default = nil } },
	returns = {},
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_DelvesUI.SaveSeenCuriosBySlotType"] = {
	key = "C_DelvesUI.SaveSeenCuriosBySlotType",
	name = "SaveSeenCuriosBySlotType",
	category = "combat_midnight",
	subcategory = "c_delvesui",
	func = _G["C_DelvesUI"] and _G["C_DelvesUI"]["SaveSeenCuriosBySlotType"],
	funcPath = "C_DelvesUI.SaveSeenCuriosBySlotType",
	params = {
		{ name = "slotType", type = "CompanionConfigSlotTypes", default = nil },
		{ name = "ownedCurioNodeIDs", type = "table", default = nil },
	},
	returns = {},
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}
