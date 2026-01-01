-- Generated APIDefinitions for namespace: C_Soulbinds
local _, ns = ...
local APIDefs = ns.APIDefinitions

APIDefs["C_Soulbinds.ActivateSoulbind"] = {
	key = "C_Soulbinds.ActivateSoulbind",
	name = "ActivateSoulbind",
	category = "combat_midnight",
	subcategory = "c_soulbinds",
	func = _G["C_Soulbinds"] and _G["C_Soulbinds"]["ActivateSoulbind"],
	funcPath = "C_Soulbinds.ActivateSoulbind",
	params = { { name = "soulbindID", type = "number", default = nil } },
	returns = {},
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Soulbinds.CanActivateSoulbind"] = {
	key = "C_Soulbinds.CanActivateSoulbind",
	name = "CanActivateSoulbind",
	category = "combat_midnight",
	subcategory = "c_soulbinds",
	func = _G["C_Soulbinds"] and _G["C_Soulbinds"]["CanActivateSoulbind"],
	funcPath = "C_Soulbinds.CanActivateSoulbind",
	params = { { name = "soulbindID", type = "number", default = nil } },
	returns = {
		{ name = "result", type = "bool", canBeSecret = false },
		{ name = "errorDescription", type = "cstring", canBeSecret = false },
	},
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Soulbinds.CanResetConduitsInSoulbind"] = {
	key = "C_Soulbinds.CanResetConduitsInSoulbind",
	name = "CanResetConduitsInSoulbind",
	category = "combat_midnight",
	subcategory = "c_soulbinds",
	func = _G["C_Soulbinds"] and _G["C_Soulbinds"]["CanResetConduitsInSoulbind"],
	funcPath = "C_Soulbinds.CanResetConduitsInSoulbind",
	params = { { name = "soulbindID", type = "number", default = nil } },
	returns = {
		{ name = "result", type = "bool", canBeSecret = false },
		{ name = "errorDescription", type = "cstring", canBeSecret = false },
	},
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Soulbinds.CommitPendingConduitsInSoulbind"] = {
	key = "C_Soulbinds.CommitPendingConduitsInSoulbind",
	name = "CommitPendingConduitsInSoulbind",
	category = "combat_midnight",
	subcategory = "c_soulbinds",
	func = _G["C_Soulbinds"] and _G["C_Soulbinds"]["CommitPendingConduitsInSoulbind"],
	funcPath = "C_Soulbinds.CommitPendingConduitsInSoulbind",
	params = { { name = "soulbindID", type = "number", default = nil } },
	returns = {},
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Soulbinds.FindNodeIDActuallyInstalled"] = {
	key = "C_Soulbinds.FindNodeIDActuallyInstalled",
	name = "FindNodeIDActuallyInstalled",
	category = "combat_midnight",
	subcategory = "c_soulbinds",
	func = _G["C_Soulbinds"] and _G["C_Soulbinds"]["FindNodeIDActuallyInstalled"],
	funcPath = "C_Soulbinds.FindNodeIDActuallyInstalled",
	params = {
		{ name = "soulbindID", type = "number", default = nil },
		{ name = "conduitID", type = "number", default = nil },
	},
	returns = { { name = "nodeID", type = "number", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Soulbinds.FindNodeIDAppearingInstalled"] = {
	key = "C_Soulbinds.FindNodeIDAppearingInstalled",
	name = "FindNodeIDAppearingInstalled",
	category = "combat_midnight",
	subcategory = "c_soulbinds",
	func = _G["C_Soulbinds"] and _G["C_Soulbinds"]["FindNodeIDAppearingInstalled"],
	funcPath = "C_Soulbinds.FindNodeIDAppearingInstalled",
	params = {
		{ name = "soulbindID", type = "number", default = nil },
		{ name = "conduitID", type = "number", default = nil },
	},
	returns = { { name = "nodeID", type = "number", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Soulbinds.FindNodeIDPendingInstall"] = {
	key = "C_Soulbinds.FindNodeIDPendingInstall",
	name = "FindNodeIDPendingInstall",
	category = "combat_midnight",
	subcategory = "c_soulbinds",
	func = _G["C_Soulbinds"] and _G["C_Soulbinds"]["FindNodeIDPendingInstall"],
	funcPath = "C_Soulbinds.FindNodeIDPendingInstall",
	params = {
		{ name = "soulbindID", type = "number", default = nil },
		{ name = "conduitID", type = "number", default = nil },
	},
	returns = { { name = "nodeID", type = "number", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Soulbinds.FindNodeIDPendingUninstall"] = {
	key = "C_Soulbinds.FindNodeIDPendingUninstall",
	name = "FindNodeIDPendingUninstall",
	category = "combat_midnight",
	subcategory = "c_soulbinds",
	func = _G["C_Soulbinds"] and _G["C_Soulbinds"]["FindNodeIDPendingUninstall"],
	funcPath = "C_Soulbinds.FindNodeIDPendingUninstall",
	params = {
		{ name = "soulbindID", type = "number", default = nil },
		{ name = "conduitID", type = "number", default = nil },
	},
	returns = { { name = "nodeID", type = "number", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Soulbinds.GetConduitCollection"] = {
	key = "C_Soulbinds.GetConduitCollection",
	name = "GetConduitCollection",
	category = "combat_midnight",
	subcategory = "c_soulbinds",
	func = _G["C_Soulbinds"] and _G["C_Soulbinds"]["GetConduitCollection"],
	funcPath = "C_Soulbinds.GetConduitCollection",
	params = { { name = "conduitType", type = "SoulbindConduitType", default = nil } },
	returns = { { name = "collectionData", type = "table", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Soulbinds.GetConduitCollectionData"] = {
	key = "C_Soulbinds.GetConduitCollectionData",
	name = "GetConduitCollectionData",
	category = "combat_midnight",
	subcategory = "c_soulbinds",
	func = _G["C_Soulbinds"] and _G["C_Soulbinds"]["GetConduitCollectionData"],
	funcPath = "C_Soulbinds.GetConduitCollectionData",
	params = { { name = "conduitID", type = "number", default = nil } },
	returns = { { name = "collectionData", type = "ConduitCollectionData", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Soulbinds.GetConduitCollectionDataByVirtualID"] = {
	key = "C_Soulbinds.GetConduitCollectionDataByVirtualID",
	name = "GetConduitCollectionDataByVirtualID",
	category = "combat_midnight",
	subcategory = "c_soulbinds",
	func = _G["C_Soulbinds"] and _G["C_Soulbinds"]["GetConduitCollectionDataByVirtualID"],
	funcPath = "C_Soulbinds.GetConduitCollectionDataByVirtualID",
	params = { { name = "virtualID", type = "number", default = nil } },
	returns = { { name = "collectionData", type = "ConduitCollectionData", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Soulbinds.GetConduitDisplayed"] = {
	key = "C_Soulbinds.GetConduitDisplayed",
	name = "GetConduitDisplayed",
	category = "combat_midnight",
	subcategory = "c_soulbinds",
	func = _G["C_Soulbinds"] and _G["C_Soulbinds"]["GetConduitDisplayed"],
	funcPath = "C_Soulbinds.GetConduitDisplayed",
	params = { { name = "nodeID", type = "number", default = nil } },
	returns = { { name = "conduitID", type = "number", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Soulbinds.GetConduitHyperlink"] = {
	key = "C_Soulbinds.GetConduitHyperlink",
	name = "GetConduitHyperlink",
	category = "combat_midnight",
	subcategory = "c_soulbinds",
	func = _G["C_Soulbinds"] and _G["C_Soulbinds"]["GetConduitHyperlink"],
	funcPath = "C_Soulbinds.GetConduitHyperlink",
	params = {
		{ name = "conduitID", type = "number", default = nil },
		{ name = "rank", type = "number", default = nil },
	},
	returns = { { name = "link", type = "cstring", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Soulbinds.GetConduitIDPendingInstall"] = {
	key = "C_Soulbinds.GetConduitIDPendingInstall",
	name = "GetConduitIDPendingInstall",
	category = "combat_midnight",
	subcategory = "c_soulbinds",
	func = _G["C_Soulbinds"] and _G["C_Soulbinds"]["GetConduitIDPendingInstall"],
	funcPath = "C_Soulbinds.GetConduitIDPendingInstall",
	params = { { name = "nodeID", type = "number", default = nil } },
	returns = { { name = "conduitID", type = "number", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Soulbinds.GetConduitQuality"] = {
	key = "C_Soulbinds.GetConduitQuality",
	name = "GetConduitQuality",
	category = "combat_midnight",
	subcategory = "c_soulbinds",
	func = _G["C_Soulbinds"] and _G["C_Soulbinds"]["GetConduitQuality"],
	funcPath = "C_Soulbinds.GetConduitQuality",
	params = {
		{ name = "conduitID", type = "number", default = nil },
		{ name = "rank", type = "number", default = nil },
	},
	returns = { { name = "quality", type = "number", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Soulbinds.GetConduitRank"] = {
	key = "C_Soulbinds.GetConduitRank",
	name = "GetConduitRank",
	category = "combat_midnight",
	subcategory = "c_soulbinds",
	func = _G["C_Soulbinds"] and _G["C_Soulbinds"]["GetConduitRank"],
	funcPath = "C_Soulbinds.GetConduitRank",
	params = { { name = "conduitID", type = "number", default = nil } },
	returns = { { name = "conduitRank", type = "number", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Soulbinds.GetConduitSpellID"] = {
	key = "C_Soulbinds.GetConduitSpellID",
	name = "GetConduitSpellID",
	category = "combat_midnight",
	subcategory = "c_soulbinds",
	func = _G["C_Soulbinds"] and _G["C_Soulbinds"]["GetConduitSpellID"],
	funcPath = "C_Soulbinds.GetConduitSpellID",
	params = {
		{ name = "conduitID", type = "number", default = nil },
		{ name = "conduitRank", type = "number", default = nil },
	},
	returns = { { name = "spellID", type = "number", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Soulbinds.GetInstalledConduitID"] = {
	key = "C_Soulbinds.GetInstalledConduitID",
	name = "GetInstalledConduitID",
	category = "combat_midnight",
	subcategory = "c_soulbinds",
	func = _G["C_Soulbinds"] and _G["C_Soulbinds"]["GetInstalledConduitID"],
	funcPath = "C_Soulbinds.GetInstalledConduitID",
	params = { { name = "nodeID", type = "number", default = nil } },
	returns = { { name = "conduitID", type = "number", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Soulbinds.GetNode"] = {
	key = "C_Soulbinds.GetNode",
	name = "GetNode",
	category = "combat_midnight",
	subcategory = "c_soulbinds",
	func = _G["C_Soulbinds"] and _G["C_Soulbinds"]["GetNode"],
	funcPath = "C_Soulbinds.GetNode",
	params = { { name = "nodeID", type = "number", default = nil } },
	returns = { { name = "node", type = "SoulbindNode", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Soulbinds.GetSoulbindData"] = {
	key = "C_Soulbinds.GetSoulbindData",
	name = "GetSoulbindData",
	category = "combat_midnight",
	subcategory = "c_soulbinds",
	func = _G["C_Soulbinds"] and _G["C_Soulbinds"]["GetSoulbindData"],
	funcPath = "C_Soulbinds.GetSoulbindData",
	params = { { name = "soulbindID", type = "number", default = nil } },
	returns = { { name = "data", type = "SoulbindData", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Soulbinds.GetSpecsAssignedToSoulbind"] = {
	key = "C_Soulbinds.GetSpecsAssignedToSoulbind",
	name = "GetSpecsAssignedToSoulbind",
	category = "combat_midnight",
	subcategory = "c_soulbinds",
	func = _G["C_Soulbinds"] and _G["C_Soulbinds"]["GetSpecsAssignedToSoulbind"],
	funcPath = "C_Soulbinds.GetSpecsAssignedToSoulbind",
	params = { { name = "soulbindID", type = "number", default = nil } },
	returns = { { name = "specIDs", type = "table", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Soulbinds.GetTree"] = {
	key = "C_Soulbinds.GetTree",
	name = "GetTree",
	category = "combat_midnight",
	subcategory = "c_soulbinds",
	func = _G["C_Soulbinds"] and _G["C_Soulbinds"]["GetTree"],
	funcPath = "C_Soulbinds.GetTree",
	params = { { name = "treeID", type = "number", default = nil } },
	returns = { { name = "tree", type = "SoulbindTree", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Soulbinds.HasAnyInstalledConduitInSoulbind"] = {
	key = "C_Soulbinds.HasAnyInstalledConduitInSoulbind",
	name = "HasAnyInstalledConduitInSoulbind",
	category = "combat_midnight",
	subcategory = "c_soulbinds",
	func = _G["C_Soulbinds"] and _G["C_Soulbinds"]["HasAnyInstalledConduitInSoulbind"],
	funcPath = "C_Soulbinds.HasAnyInstalledConduitInSoulbind",
	params = { { name = "soulbindID", type = "number", default = nil } },
	returns = { { name = "result", type = "bool", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Soulbinds.HasPendingConduitsInSoulbind"] = {
	key = "C_Soulbinds.HasPendingConduitsInSoulbind",
	name = "HasPendingConduitsInSoulbind",
	category = "combat_midnight",
	subcategory = "c_soulbinds",
	func = _G["C_Soulbinds"] and _G["C_Soulbinds"]["HasPendingConduitsInSoulbind"],
	funcPath = "C_Soulbinds.HasPendingConduitsInSoulbind",
	params = { { name = "soulbindID", type = "number", default = nil } },
	returns = { { name = "result", type = "bool", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Soulbinds.IsConduitInstalled"] = {
	key = "C_Soulbinds.IsConduitInstalled",
	name = "IsConduitInstalled",
	category = "combat_midnight",
	subcategory = "c_soulbinds",
	func = _G["C_Soulbinds"] and _G["C_Soulbinds"]["IsConduitInstalled"],
	funcPath = "C_Soulbinds.IsConduitInstalled",
	params = { { name = "nodeID", type = "number", default = nil } },
	returns = { { name = "result", type = "bool", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Soulbinds.IsConduitInstalledInSoulbind"] = {
	key = "C_Soulbinds.IsConduitInstalledInSoulbind",
	name = "IsConduitInstalledInSoulbind",
	category = "combat_midnight",
	subcategory = "c_soulbinds",
	func = _G["C_Soulbinds"] and _G["C_Soulbinds"]["IsConduitInstalledInSoulbind"],
	funcPath = "C_Soulbinds.IsConduitInstalledInSoulbind",
	params = {
		{ name = "soulbindID", type = "number", default = nil },
		{ name = "conduitID", type = "number", default = nil },
	},
	returns = { { name = "result", type = "bool", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Soulbinds.IsItemConduitByItemInfo"] = {
	key = "C_Soulbinds.IsItemConduitByItemInfo",
	name = "IsItemConduitByItemInfo",
	category = "combat_midnight",
	subcategory = "c_soulbinds",
	func = _G["C_Soulbinds"] and _G["C_Soulbinds"]["IsItemConduitByItemInfo"],
	funcPath = "C_Soulbinds.IsItemConduitByItemInfo",
	params = { { name = "itemInfo", type = "ItemInfo", default = nil } },
	returns = { { name = "result", type = "bool", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Soulbinds.IsNodePendingModify"] = {
	key = "C_Soulbinds.IsNodePendingModify",
	name = "IsNodePendingModify",
	category = "combat_midnight",
	subcategory = "c_soulbinds",
	func = _G["C_Soulbinds"] and _G["C_Soulbinds"]["IsNodePendingModify"],
	funcPath = "C_Soulbinds.IsNodePendingModify",
	params = { { name = "nodeID", type = "number", default = nil } },
	returns = { { name = "result", type = "bool", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Soulbinds.IsUnselectedConduitPendingInSoulbind"] = {
	key = "C_Soulbinds.IsUnselectedConduitPendingInSoulbind",
	name = "IsUnselectedConduitPendingInSoulbind",
	category = "combat_midnight",
	subcategory = "c_soulbinds",
	func = _G["C_Soulbinds"] and _G["C_Soulbinds"]["IsUnselectedConduitPendingInSoulbind"],
	funcPath = "C_Soulbinds.IsUnselectedConduitPendingInSoulbind",
	params = { { name = "soulbindID", type = "number", default = nil } },
	returns = { { name = "result", type = "bool", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Soulbinds.ModifyNode"] = {
	key = "C_Soulbinds.ModifyNode",
	name = "ModifyNode",
	category = "combat_midnight",
	subcategory = "c_soulbinds",
	func = _G["C_Soulbinds"] and _G["C_Soulbinds"]["ModifyNode"],
	funcPath = "C_Soulbinds.ModifyNode",
	params = {
		{ name = "nodeID", type = "number", default = nil },
		{ name = "conduitID", type = "number", default = nil },
		{ name = "type", type = "SoulbindConduitTransactionType", default = nil },
	},
	returns = {},
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Soulbinds.SelectNode"] = {
	key = "C_Soulbinds.SelectNode",
	name = "SelectNode",
	category = "combat_midnight",
	subcategory = "c_soulbinds",
	func = _G["C_Soulbinds"] and _G["C_Soulbinds"]["SelectNode"],
	funcPath = "C_Soulbinds.SelectNode",
	params = { { name = "nodeID", type = "number", default = nil } },
	returns = {},
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Soulbinds.UnmodifyNode"] = {
	key = "C_Soulbinds.UnmodifyNode",
	name = "UnmodifyNode",
	category = "combat_midnight",
	subcategory = "c_soulbinds",
	func = _G["C_Soulbinds"] and _G["C_Soulbinds"]["UnmodifyNode"],
	funcPath = "C_Soulbinds.UnmodifyNode",
	params = { { name = "nodeID", type = "number", default = nil } },
	returns = {},
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}
