-- Generated APIDefinitions for namespace: C_Traits
local _, ns = ...
local APIDefs = ns.APIDefinitions

APIDefs["C_Traits.CanEditConfig"] = {
	key = "C_Traits.CanEditConfig",
	name = "CanEditConfig",
	category = "combat_midnight",
	subcategory = "c_traits",
	func = _G["C_Traits"] and _G["C_Traits"]["CanEditConfig"],
	funcPath = "C_Traits.CanEditConfig",
	params = { { name = "configID", type = "number", default = nil } },
	returns = {
		{ name = "canEdit", type = "bool", canBeSecret = false },
		{ name = "errorMessage", type = "cstring", canBeSecret = false },
	},
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Traits.CanPurchaseRank"] = {
	key = "C_Traits.CanPurchaseRank",
	name = "CanPurchaseRank",
	category = "combat_midnight",
	subcategory = "c_traits",
	func = _G["C_Traits"] and _G["C_Traits"]["CanPurchaseRank"],
	funcPath = "C_Traits.CanPurchaseRank",
	params = {
		{ name = "configID", type = "number", default = nil },
		{ name = "nodeID", type = "number", default = nil },
		{ name = "nodeEntryID", type = "number", default = nil },
	},
	returns = { { name = "canPurchase", type = "bool", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Traits.CanRefundRank"] = {
	key = "C_Traits.CanRefundRank",
	name = "CanRefundRank",
	category = "combat_midnight",
	subcategory = "c_traits",
	func = _G["C_Traits"] and _G["C_Traits"]["CanRefundRank"],
	funcPath = "C_Traits.CanRefundRank",
	params = {
		{ name = "configID", type = "number", default = nil },
		{ name = "nodeID", type = "number", default = nil },
	},
	returns = { { name = "canRefund", type = "bool", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Traits.CascadeRepurchaseRanks"] = {
	key = "C_Traits.CascadeRepurchaseRanks",
	name = "CascadeRepurchaseRanks",
	category = "combat_midnight",
	subcategory = "c_traits",
	func = _G["C_Traits"] and _G["C_Traits"]["CascadeRepurchaseRanks"],
	funcPath = "C_Traits.CascadeRepurchaseRanks",
	params = {
		{ name = "configID", type = "number", default = nil },
		{ name = "nodeID", type = "number", default = nil },
		{ name = "entryID", type = "number", default = nil },
	},
	returns = { { name = "success", type = "bool", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Traits.ClearCascadeRepurchaseHistory"] = {
	key = "C_Traits.ClearCascadeRepurchaseHistory",
	name = "ClearCascadeRepurchaseHistory",
	category = "combat_midnight",
	subcategory = "c_traits",
	func = _G["C_Traits"] and _G["C_Traits"]["ClearCascadeRepurchaseHistory"],
	funcPath = "C_Traits.ClearCascadeRepurchaseHistory",
	params = { { name = "configID", type = "number", default = nil } },
	returns = {},
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Traits.CommitConfig"] = {
	key = "C_Traits.CommitConfig",
	name = "CommitConfig",
	category = "combat_midnight",
	subcategory = "c_traits",
	func = _G["C_Traits"] and _G["C_Traits"]["CommitConfig"],
	funcPath = "C_Traits.CommitConfig",
	params = { { name = "configID", type = "number", default = nil } },
	returns = { { name = "success", type = "bool", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Traits.ConfigHasStagedChanges"] = {
	key = "C_Traits.ConfigHasStagedChanges",
	name = "ConfigHasStagedChanges",
	category = "combat_midnight",
	subcategory = "c_traits",
	func = _G["C_Traits"] and _G["C_Traits"]["ConfigHasStagedChanges"],
	funcPath = "C_Traits.ConfigHasStagedChanges",
	params = { { name = "configID", type = "number", default = nil } },
	returns = { { name = "hasChanges", type = "bool", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Traits.GenerateImportString"] = {
	key = "C_Traits.GenerateImportString",
	name = "GenerateImportString",
	category = "combat_midnight",
	subcategory = "c_traits",
	func = _G["C_Traits"] and _G["C_Traits"]["GenerateImportString"],
	funcPath = "C_Traits.GenerateImportString",
	params = { { name = "configID", type = "number", default = nil } },
	returns = { { name = "importString", type = "string", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Traits.GenerateInspectImportString"] = {
	key = "C_Traits.GenerateInspectImportString",
	name = "GenerateInspectImportString",
	category = "combat_midnight",
	subcategory = "c_traits",
	func = _G["C_Traits"] and _G["C_Traits"]["GenerateInspectImportString"],
	funcPath = "C_Traits.GenerateInspectImportString",
	params = {
		{
			name = "target",
			type = "cstring",
			default = nil,
			examples = { { value = "unit", label = "TalentTreeTweaks" } },
		},
	},
	returns = { { name = "importString", type = "string", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Traits.GetConditionInfo"] = {
	key = "C_Traits.GetConditionInfo",
	name = "GetConditionInfo",
	category = "combat_midnight",
	subcategory = "c_traits",
	func = _G["C_Traits"] and _G["C_Traits"]["GetConditionInfo"],
	funcPath = "C_Traits.GetConditionInfo",
	params = {
		{ name = "configID", type = "number", default = nil },
		{ name = "condID", type = "number", default = nil },
	},
	returns = { { name = "condInfo", type = "TraitCondInfo", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Traits.GetConfigIDBySystemID"] = {
	key = "C_Traits.GetConfigIDBySystemID",
	name = "GetConfigIDBySystemID",
	category = "combat_midnight",
	subcategory = "c_traits",
	func = _G["C_Traits"] and _G["C_Traits"]["GetConfigIDBySystemID"],
	funcPath = "C_Traits.GetConfigIDBySystemID",
	params = {
		{ name = "systemID", type = "number", default = nil, examples = { { value = 1, label = "Leatrix_Plus" } } },
	},
	returns = { { name = "configID", type = "number", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Traits.GetConfigIDByTreeID"] = {
	key = "C_Traits.GetConfigIDByTreeID",
	name = "GetConfigIDByTreeID",
	category = "combat_midnight",
	subcategory = "c_traits",
	func = _G["C_Traits"] and _G["C_Traits"]["GetConfigIDByTreeID"],
	funcPath = "C_Traits.GetConfigIDByTreeID",
	params = {
		{ name = "treeID", type = "number", default = nil, examples = { { value = 1161, label = "Narcissus" } } },
	},
	returns = { { name = "configID", type = "number", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Traits.GetConfigInfo"] = {
	key = "C_Traits.GetConfigInfo",
	name = "GetConfigInfo",
	category = "combat_midnight",
	subcategory = "c_traits",
	func = _G["C_Traits"] and _G["C_Traits"]["GetConfigInfo"],
	funcPath = "C_Traits.GetConfigInfo",
	params = { { name = "configID", type = "number", default = nil } },
	returns = { { name = "configInfo", type = "TraitConfigInfo", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Traits.GetConfigVariationID"] = {
	key = "C_Traits.GetConfigVariationID",
	name = "GetConfigVariationID",
	category = "combat_midnight",
	subcategory = "c_traits",
	func = _G["C_Traits"] and _G["C_Traits"]["GetConfigVariationID"],
	funcPath = "C_Traits.GetConfigVariationID",
	params = { { name = "systemID", type = "number", default = nil } },
	returns = { { name = "variationID", type = "number", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Traits.GetConfigsByType"] = {
	key = "C_Traits.GetConfigsByType",
	name = "GetConfigsByType",
	category = "combat_midnight",
	subcategory = "c_traits",
	func = _G["C_Traits"] and _G["C_Traits"]["GetConfigsByType"],
	funcPath = "C_Traits.GetConfigsByType",
	params = { { name = "configType", type = "TraitConfigType", default = nil } },
	returns = { { name = "configIDs", type = "table", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Traits.GetDefinitionInfo"] = {
	key = "C_Traits.GetDefinitionInfo",
	name = "GetDefinitionInfo",
	category = "combat_midnight",
	subcategory = "c_traits",
	func = _G["C_Traits"] and _G["C_Traits"]["GetDefinitionInfo"],
	funcPath = "C_Traits.GetDefinitionInfo",
	params = { { name = "definitionID", type = "number", default = nil } },
	returns = { { name = "definitionInfo", type = "TraitDefinitionInfo", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Traits.GetEntryInfo"] = {
	key = "C_Traits.GetEntryInfo",
	name = "GetEntryInfo",
	category = "combat_midnight",
	subcategory = "c_traits",
	func = _G["C_Traits"] and _G["C_Traits"]["GetEntryInfo"],
	funcPath = "C_Traits.GetEntryInfo",
	params = {
		{ name = "configID", type = "number", default = nil },
		{ name = "entryID", type = "number", default = nil },
	},
	returns = { { name = "entryInfo", type = "TraitEntryInfo", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Traits.GetIncreasedTraitData"] = {
	key = "C_Traits.GetIncreasedTraitData",
	name = "GetIncreasedTraitData",
	category = "combat_midnight",
	subcategory = "c_traits",
	func = _G["C_Traits"] and _G["C_Traits"]["GetIncreasedTraitData"],
	funcPath = "C_Traits.GetIncreasedTraitData",
	params = {
		{ name = "nodeID", type = "number", default = nil },
		{ name = "entryID", type = "number", default = nil },
	},
	returns = { { name = "itemName", type = "table", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Traits.GetNodeCost"] = {
	key = "C_Traits.GetNodeCost",
	name = "GetNodeCost",
	category = "combat_midnight",
	subcategory = "c_traits",
	func = _G["C_Traits"] and _G["C_Traits"]["GetNodeCost"],
	funcPath = "C_Traits.GetNodeCost",
	params = {
		{ name = "configID", type = "number", default = nil },
		{ name = "nodeID", type = "number", default = nil },
	},
	returns = { { name = "costs", type = "table", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Traits.GetNodeInfo"] = {
	key = "C_Traits.GetNodeInfo",
	name = "GetNodeInfo",
	category = "combat_midnight",
	subcategory = "c_traits",
	func = _G["C_Traits"] and _G["C_Traits"]["GetNodeInfo"],
	funcPath = "C_Traits.GetNodeInfo",
	params = {
		{
			name = "configID",
			type = "number",
			default = nil,
			examples = {
				{ value = "configID", label = "Narcissus" },
				{
					value = "C_ClassTalents.GetActiveConfigID() or Constants.TraitConsts.VIEW_TRAIT_CONFIG_ID or -3",
					label = "TalentTreeTweaks",
				},
				{ value = "C_ClassTalents.GetActiveConfigID()", label = "TalentTreeTweaks" },
			},
		},
		{ name = "nodeID", type = "number", default = nil },
	},
	returns = { { name = "nodeInfo", type = "TraitNodeInfo", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Traits.GetStagedChanges"] = {
	key = "C_Traits.GetStagedChanges",
	name = "GetStagedChanges",
	category = "combat_midnight",
	subcategory = "c_traits",
	func = _G["C_Traits"] and _G["C_Traits"]["GetStagedChanges"],
	funcPath = "C_Traits.GetStagedChanges",
	params = { { name = "configID", type = "number", default = nil } },
	returns = {
		{ name = "nodeIDsWithPurchases", type = "table", canBeSecret = false },
		{ name = "nodeIDsWithRefunds", type = "table", canBeSecret = false },
		{ name = "nodeIDsWithSelectionSwaps", type = "table", canBeSecret = false },
	},
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Traits.GetStagedChangesCost"] = {
	key = "C_Traits.GetStagedChangesCost",
	name = "GetStagedChangesCost",
	category = "combat_midnight",
	subcategory = "c_traits",
	func = _G["C_Traits"] and _G["C_Traits"]["GetStagedChangesCost"],
	funcPath = "C_Traits.GetStagedChangesCost",
	params = { { name = "configID", type = "number", default = nil } },
	returns = { { name = "costs", type = "table", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Traits.GetSubTreeInfo"] = {
	key = "C_Traits.GetSubTreeInfo",
	name = "GetSubTreeInfo",
	category = "combat_midnight",
	subcategory = "c_traits",
	func = _G["C_Traits"] and _G["C_Traits"]["GetSubTreeInfo"],
	funcPath = "C_Traits.GetSubTreeInfo",
	params = {
		{ name = "configID", type = "number", default = nil },
		{ name = "subTreeID", type = "number", default = nil },
	},
	returns = { { name = "subTreeInfo", type = "TraitSubTreeInfo", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Traits.GetSystemIDByTreeID"] = {
	key = "C_Traits.GetSystemIDByTreeID",
	name = "GetSystemIDByTreeID",
	category = "combat_midnight",
	subcategory = "c_traits",
	func = _G["C_Traits"] and _G["C_Traits"]["GetSystemIDByTreeID"],
	funcPath = "C_Traits.GetSystemIDByTreeID",
	params = { { name = "treeID", type = "number", default = nil } },
	returns = { { name = "systemID", type = "number", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Traits.GetTraitCurrencyInfo"] = {
	key = "C_Traits.GetTraitCurrencyInfo",
	name = "GetTraitCurrencyInfo",
	category = "combat_midnight",
	subcategory = "c_traits",
	func = _G["C_Traits"] and _G["C_Traits"]["GetTraitCurrencyInfo"],
	funcPath = "C_Traits.GetTraitCurrencyInfo",
	params = { { name = "traitCurrencyID", type = "number", default = nil } },
	returns = {
		{ name = "flags", type = "number", canBeSecret = false },
		{ name = "type", type = "number", canBeSecret = false },
		{ name = "currencyTypesID", type = "number", canBeSecret = false },
		{ name = "icon", type = "number", canBeSecret = false },
	},
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Traits.GetTraitDescription"] = {
	key = "C_Traits.GetTraitDescription",
	name = "GetTraitDescription",
	category = "combat_midnight",
	subcategory = "c_traits",
	func = _G["C_Traits"] and _G["C_Traits"]["GetTraitDescription"],
	funcPath = "C_Traits.GetTraitDescription",
	params = { { name = "entryID", type = "number", default = nil }, { name = "rank", type = "number", default = nil } },
	returns = { { name = "description", type = "string", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Traits.GetTraitSystemFlags"] = {
	key = "C_Traits.GetTraitSystemFlags",
	name = "GetTraitSystemFlags",
	category = "combat_midnight",
	subcategory = "c_traits",
	func = _G["C_Traits"] and _G["C_Traits"]["GetTraitSystemFlags"],
	funcPath = "C_Traits.GetTraitSystemFlags",
	params = { { name = "configID", type = "number", default = nil } },
	returns = { { name = "flags", type = "number", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Traits.GetTraitSystemWidgetSetID"] = {
	key = "C_Traits.GetTraitSystemWidgetSetID",
	name = "GetTraitSystemWidgetSetID",
	category = "combat_midnight",
	subcategory = "c_traits",
	func = _G["C_Traits"] and _G["C_Traits"]["GetTraitSystemWidgetSetID"],
	funcPath = "C_Traits.GetTraitSystemWidgetSetID",
	params = { { name = "configID", type = "number", default = nil } },
	returns = { { name = "uiWidgetSetID", type = "number", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Traits.GetTreeCurrencyInfo"] = {
	key = "C_Traits.GetTreeCurrencyInfo",
	name = "GetTreeCurrencyInfo",
	category = "combat_midnight",
	subcategory = "c_traits",
	func = _G["C_Traits"] and _G["C_Traits"]["GetTreeCurrencyInfo"],
	funcPath = "C_Traits.GetTreeCurrencyInfo",
	params = {
		{ name = "configID", type = "number", default = nil },
		{ name = "treeID", type = "number", default = nil },
		{ name = "excludeStagedChanges", type = "bool", default = nil },
	},
	returns = { { name = "treeCurrencyInfo", type = "table", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Traits.GetTreeHash"] = {
	key = "C_Traits.GetTreeHash",
	name = "GetTreeHash",
	category = "combat_midnight",
	subcategory = "c_traits",
	func = _G["C_Traits"] and _G["C_Traits"]["GetTreeHash"],
	funcPath = "C_Traits.GetTreeHash",
	params = {
		{
			name = "treeID",
			type = "number",
			default = nil,
			examples = { { value = "treeInfo.ID", label = "Narcissus" } },
		},
	},
	returns = { { name = "result", type = "table", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Traits.GetTreeInfo"] = {
	key = "C_Traits.GetTreeInfo",
	name = "GetTreeInfo",
	category = "combat_midnight",
	subcategory = "c_traits",
	func = _G["C_Traits"] and _G["C_Traits"]["GetTreeInfo"],
	funcPath = "C_Traits.GetTreeInfo",
	params = {
		{ name = "configID", type = "number", default = nil, examples = { { value = "configId", label = "Plater" } } },
		{ name = "treeID", type = "number", default = nil },
	},
	returns = { { name = "treeInfo", type = "TraitTreeInfo", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Traits.GetTreeNodes"] = {
	key = "C_Traits.GetTreeNodes",
	name = "GetTreeNodes",
	category = "combat_midnight",
	subcategory = "c_traits",
	func = _G["C_Traits"] and _G["C_Traits"]["GetTreeNodes"],
	funcPath = "C_Traits.GetTreeNodes",
	params = {
		{ name = "treeID", type = "number", default = nil, examples = { { value = 672, label = "Leatrix_Plus" } } },
	},
	returns = { { name = "nodeIDs", type = "table", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Traits.PurchaseAllRanks"] = {
	key = "C_Traits.PurchaseAllRanks",
	name = "PurchaseAllRanks",
	category = "combat_midnight",
	subcategory = "c_traits",
	func = _G["C_Traits"] and _G["C_Traits"]["PurchaseAllRanks"],
	funcPath = "C_Traits.PurchaseAllRanks",
	params = {
		{ name = "configID", type = "number", default = nil },
		{ name = "nodeID", type = "number", default = nil },
		{ name = "ignoreCost", type = "bool", default = nil },
	},
	returns = { { name = "success", type = "bool", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Traits.PurchaseRank"] = {
	key = "C_Traits.PurchaseRank",
	name = "PurchaseRank",
	category = "combat_midnight",
	subcategory = "c_traits",
	func = _G["C_Traits"] and _G["C_Traits"]["PurchaseRank"],
	funcPath = "C_Traits.PurchaseRank",
	params = {
		{ name = "configID", type = "number", default = nil },
		{ name = "nodeID", type = "number", default = nil },
	},
	returns = { { name = "success", type = "bool", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Traits.RefundAllRanks"] = {
	key = "C_Traits.RefundAllRanks",
	name = "RefundAllRanks",
	category = "combat_midnight",
	subcategory = "c_traits",
	func = _G["C_Traits"] and _G["C_Traits"]["RefundAllRanks"],
	funcPath = "C_Traits.RefundAllRanks",
	params = {
		{ name = "configID", type = "number", default = nil },
		{ name = "nodeID", type = "number", default = nil },
	},
	returns = { { name = "success", type = "bool", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Traits.RefundRank"] = {
	key = "C_Traits.RefundRank",
	name = "RefundRank",
	category = "combat_midnight",
	subcategory = "c_traits",
	func = _G["C_Traits"] and _G["C_Traits"]["RefundRank"],
	funcPath = "C_Traits.RefundRank",
	params = {
		{ name = "configID", type = "number", default = nil },
		{ name = "nodeID", type = "number", default = nil },
		{ name = "clearEdges", type = "bool", default = nil },
	},
	returns = { { name = "success", type = "bool", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Traits.ResetTree"] = {
	key = "C_Traits.ResetTree",
	name = "ResetTree",
	category = "combat_midnight",
	subcategory = "c_traits",
	func = _G["C_Traits"] and _G["C_Traits"]["ResetTree"],
	funcPath = "C_Traits.ResetTree",
	params = {
		{ name = "configID", type = "number", default = nil },
		{ name = "treeID", type = "number", default = nil },
	},
	returns = { { name = "success", type = "bool", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Traits.ResetTreeByCurrency"] = {
	key = "C_Traits.ResetTreeByCurrency",
	name = "ResetTreeByCurrency",
	category = "combat_midnight",
	subcategory = "c_traits",
	func = _G["C_Traits"] and _G["C_Traits"]["ResetTreeByCurrency"],
	funcPath = "C_Traits.ResetTreeByCurrency",
	params = {
		{ name = "configID", type = "number", default = nil },
		{ name = "treeID", type = "number", default = nil },
		{ name = "traitCurrencyID", type = "number", default = nil },
	},
	returns = { { name = "success", type = "bool", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Traits.RollbackConfig"] = {
	key = "C_Traits.RollbackConfig",
	name = "RollbackConfig",
	category = "combat_midnight",
	subcategory = "c_traits",
	func = _G["C_Traits"] and _G["C_Traits"]["RollbackConfig"],
	funcPath = "C_Traits.RollbackConfig",
	params = { { name = "configID", type = "number", default = nil } },
	returns = { { name = "success", type = "bool", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Traits.SetSelection"] = {
	key = "C_Traits.SetSelection",
	name = "SetSelection",
	category = "combat_midnight",
	subcategory = "c_traits",
	func = _G["C_Traits"] and _G["C_Traits"]["SetSelection"],
	funcPath = "C_Traits.SetSelection",
	params = {
		{
			name = "configID",
			type = "number",
			default = nil,
			examples = {
				{ value = "c", label = "Leatrix_Plus" },
				{ value = "self.configID", label = "TalentTreeTweaks" },
				{ value = "i == ID", label = "Narcissus" },
			},
		},
		{ name = "nodeID", type = "number", default = nil },
		{ name = "nodeEntryID", type = "number", default = nil },
		{ name = "clearEdges", type = "bool", default = nil },
	},
	returns = { { name = "success", type = "bool", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Traits.StageConfig"] = {
	key = "C_Traits.StageConfig",
	name = "StageConfig",
	category = "combat_midnight",
	subcategory = "c_traits",
	func = _G["C_Traits"] and _G["C_Traits"]["StageConfig"],
	funcPath = "C_Traits.StageConfig",
	params = { { name = "configID", type = "number", default = nil } },
	returns = { { name = "success", type = "bool", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Traits.TryPurchaseAllRanks"] = {
	key = "C_Traits.TryPurchaseAllRanks",
	name = "TryPurchaseAllRanks",
	category = "combat_midnight",
	subcategory = "c_traits",
	func = _G["C_Traits"] and _G["C_Traits"]["TryPurchaseAllRanks"],
	funcPath = "C_Traits.TryPurchaseAllRanks",
	params = {
		{ name = "configID", type = "number", default = nil },
		{ name = "nodeID", type = "number", default = nil },
	},
	returns = { { name = "success", type = "bool", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Traits.TryPurchaseToNode"] = {
	key = "C_Traits.TryPurchaseToNode",
	name = "TryPurchaseToNode",
	category = "combat_midnight",
	subcategory = "c_traits",
	func = _G["C_Traits"] and _G["C_Traits"]["TryPurchaseToNode"],
	funcPath = "C_Traits.TryPurchaseToNode",
	params = {
		{ name = "configID", type = "number", default = nil },
		{ name = "nodeID", type = "number", default = nil },
	},
	returns = { { name = "success", type = "bool", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Traits.TryRefundToNode"] = {
	key = "C_Traits.TryRefundToNode",
	name = "TryRefundToNode",
	category = "combat_midnight",
	subcategory = "c_traits",
	func = _G["C_Traits"] and _G["C_Traits"]["TryRefundToNode"],
	funcPath = "C_Traits.TryRefundToNode",
	params = {
		{ name = "configID", type = "number", default = nil },
		{ name = "nodeID", type = "number", default = nil },
		{ name = "entryID", type = "number", default = nil },
	},
	returns = { { name = "success", type = "bool", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}
