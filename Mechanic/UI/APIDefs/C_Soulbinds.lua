-- Generated APIDefinitions for namespace: C_Soulbinds
local _, ns = ...
local APIDefs = ns.APIDefinitions

APIDefs["C_Soulbinds.ActivateSoulbind"] = {
    key = "C_Soulbinds.ActivateSoulbind",
    name = "ActivateSoulbind",
    category = "general",
    subcategory = "c_soulbinds",
    funcPath = "C_Soulbinds.ActivateSoulbind",
    params = { { name = "soulbindID", type = "number", default = nil } },
    returns = {  },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Soulbinds.CanActivateSoulbind"] = {
    key = "C_Soulbinds.CanActivateSoulbind",
    name = "CanActivateSoulbind",
    category = "general",
    subcategory = "c_soulbinds",
    funcPath = "C_Soulbinds.CanActivateSoulbind",
    params = { { name = "soulbindID", type = "number", default = nil } },
    returns = { { name = "result", type = "bool", canBeSecret = false }, { name = "errorDescription", type = "cstring", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Soulbinds.CanModifySoulbind"] = {
    key = "C_Soulbinds.CanModifySoulbind",
    name = "CanModifySoulbind",
    category = "general",
    subcategory = "c_soulbinds",
    funcPath = "C_Soulbinds.CanModifySoulbind",
    params = {  },
    returns = { { name = "result", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["C_Soulbinds.CanResetConduitsInSoulbind"] = {
    key = "C_Soulbinds.CanResetConduitsInSoulbind",
    name = "CanResetConduitsInSoulbind",
    category = "general",
    subcategory = "c_soulbinds",
    funcPath = "C_Soulbinds.CanResetConduitsInSoulbind",
    params = { { name = "soulbindID", type = "number", default = nil } },
    returns = { { name = "result", type = "bool", canBeSecret = false }, { name = "errorDescription", type = "cstring", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Soulbinds.CanSwitchActiveSoulbindTreeBranch"] = {
    key = "C_Soulbinds.CanSwitchActiveSoulbindTreeBranch",
    name = "CanSwitchActiveSoulbindTreeBranch",
    category = "general",
    subcategory = "c_soulbinds",
    funcPath = "C_Soulbinds.CanSwitchActiveSoulbindTreeBranch",
    params = {  },
    returns = { { name = "result", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["C_Soulbinds.CloseUI"] = {
    key = "C_Soulbinds.CloseUI",
    name = "CloseUI",
    category = "general",
    subcategory = "c_soulbinds",
    funcPath = "C_Soulbinds.CloseUI",
    params = {  },
    returns = {  },
    midnightImpact = "NORMAL",
}

APIDefs["C_Soulbinds.CommitPendingConduitsInSoulbind"] = {
    key = "C_Soulbinds.CommitPendingConduitsInSoulbind",
    name = "CommitPendingConduitsInSoulbind",
    category = "general",
    subcategory = "c_soulbinds",
    funcPath = "C_Soulbinds.CommitPendingConduitsInSoulbind",
    params = { { name = "soulbindID", type = "number", default = nil } },
    returns = {  },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Soulbinds.FindNodeIDActuallyInstalled"] = {
    key = "C_Soulbinds.FindNodeIDActuallyInstalled",
    name = "FindNodeIDActuallyInstalled",
    category = "general",
    subcategory = "c_soulbinds",
    funcPath = "C_Soulbinds.FindNodeIDActuallyInstalled",
    params = { { name = "soulbindID", type = "number", default = nil }, { name = "conduitID", type = "number", default = nil } },
    returns = { { name = "nodeID", type = "number", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Soulbinds.FindNodeIDAppearingInstalled"] = {
    key = "C_Soulbinds.FindNodeIDAppearingInstalled",
    name = "FindNodeIDAppearingInstalled",
    category = "general",
    subcategory = "c_soulbinds",
    funcPath = "C_Soulbinds.FindNodeIDAppearingInstalled",
    params = { { name = "soulbindID", type = "number", default = nil }, { name = "conduitID", type = "number", default = nil } },
    returns = { { name = "nodeID", type = "number", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Soulbinds.FindNodeIDPendingInstall"] = {
    key = "C_Soulbinds.FindNodeIDPendingInstall",
    name = "FindNodeIDPendingInstall",
    category = "general",
    subcategory = "c_soulbinds",
    funcPath = "C_Soulbinds.FindNodeIDPendingInstall",
    params = { { name = "soulbindID", type = "number", default = nil }, { name = "conduitID", type = "number", default = nil } },
    returns = { { name = "nodeID", type = "number", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Soulbinds.FindNodeIDPendingUninstall"] = {
    key = "C_Soulbinds.FindNodeIDPendingUninstall",
    name = "FindNodeIDPendingUninstall",
    category = "general",
    subcategory = "c_soulbinds",
    funcPath = "C_Soulbinds.FindNodeIDPendingUninstall",
    params = { { name = "soulbindID", type = "number", default = nil }, { name = "conduitID", type = "number", default = nil } },
    returns = { { name = "nodeID", type = "number", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Soulbinds.GetActiveSoulbindID"] = {
    key = "C_Soulbinds.GetActiveSoulbindID",
    name = "GetActiveSoulbindID",
    category = "general",
    subcategory = "c_soulbinds",
    funcPath = "C_Soulbinds.GetActiveSoulbindID",
    params = {  },
    returns = { { name = "soulbindID", type = "number", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["C_Soulbinds.GetConduitCollection"] = {
    key = "C_Soulbinds.GetConduitCollection",
    name = "GetConduitCollection",
    category = "general",
    subcategory = "c_soulbinds",
    funcPath = "C_Soulbinds.GetConduitCollection",
    params = { { name = "conduitType", type = "SoulbindConduitType", default = nil } },
    returns = { { name = "collectionData", type = "table", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Soulbinds.GetConduitCollectionCount"] = {
    key = "C_Soulbinds.GetConduitCollectionCount",
    name = "GetConduitCollectionCount",
    category = "general",
    subcategory = "c_soulbinds",
    funcPath = "C_Soulbinds.GetConduitCollectionCount",
    params = {  },
    returns = { { name = "count", type = "number", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["C_Soulbinds.GetConduitCollectionData"] = {
    key = "C_Soulbinds.GetConduitCollectionData",
    name = "GetConduitCollectionData",
    category = "general",
    subcategory = "c_soulbinds",
    funcPath = "C_Soulbinds.GetConduitCollectionData",
    params = { { name = "conduitID", type = "number", default = nil } },
    returns = { { name = "collectionData", type = "ConduitCollectionData", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Soulbinds.GetConduitCollectionDataAtCursor"] = {
    key = "C_Soulbinds.GetConduitCollectionDataAtCursor",
    name = "GetConduitCollectionDataAtCursor",
    category = "general",
    subcategory = "c_soulbinds",
    funcPath = "C_Soulbinds.GetConduitCollectionDataAtCursor",
    params = {  },
    returns = { { name = "collectionData", type = "ConduitCollectionData", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["C_Soulbinds.GetConduitCollectionDataByVirtualID"] = {
    key = "C_Soulbinds.GetConduitCollectionDataByVirtualID",
    name = "GetConduitCollectionDataByVirtualID",
    category = "general",
    subcategory = "c_soulbinds",
    funcPath = "C_Soulbinds.GetConduitCollectionDataByVirtualID",
    params = { { name = "virtualID", type = "number", default = nil } },
    returns = { { name = "collectionData", type = "ConduitCollectionData", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Soulbinds.GetConduitDisplayed"] = {
    key = "C_Soulbinds.GetConduitDisplayed",
    name = "GetConduitDisplayed",
    category = "general",
    subcategory = "c_soulbinds",
    funcPath = "C_Soulbinds.GetConduitDisplayed",
    params = { { name = "nodeID", type = "number", default = nil } },
    returns = { { name = "conduitID", type = "number", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Soulbinds.GetConduitHyperlink"] = {
    key = "C_Soulbinds.GetConduitHyperlink",
    name = "GetConduitHyperlink",
    category = "general",
    subcategory = "c_soulbinds",
    funcPath = "C_Soulbinds.GetConduitHyperlink",
    params = { { name = "conduitID", type = "number", default = nil }, { name = "rank", type = "number", default = nil } },
    returns = { { name = "link", type = "cstring", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Soulbinds.GetConduitIDPendingInstall"] = {
    key = "C_Soulbinds.GetConduitIDPendingInstall",
    name = "GetConduitIDPendingInstall",
    category = "general",
    subcategory = "c_soulbinds",
    funcPath = "C_Soulbinds.GetConduitIDPendingInstall",
    params = { { name = "nodeID", type = "number", default = nil } },
    returns = { { name = "conduitID", type = "number", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Soulbinds.GetConduitQuality"] = {
    key = "C_Soulbinds.GetConduitQuality",
    name = "GetConduitQuality",
    category = "general",
    subcategory = "c_soulbinds",
    funcPath = "C_Soulbinds.GetConduitQuality",
    params = { { name = "conduitID", type = "number", default = nil }, { name = "rank", type = "number", default = nil } },
    returns = { { name = "quality", type = "number", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Soulbinds.GetConduitRank"] = {
    key = "C_Soulbinds.GetConduitRank",
    name = "GetConduitRank",
    category = "general",
    subcategory = "c_soulbinds",
    funcPath = "C_Soulbinds.GetConduitRank",
    params = { { name = "conduitID", type = "number", default = nil } },
    returns = { { name = "conduitRank", type = "number", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Soulbinds.GetConduitSpellID"] = {
    key = "C_Soulbinds.GetConduitSpellID",
    name = "GetConduitSpellID",
    category = "general",
    subcategory = "c_soulbinds",
    funcPath = "C_Soulbinds.GetConduitSpellID",
    params = { { name = "conduitID", type = "number", default = nil }, { name = "conduitRank", type = "number", default = nil } },
    returns = { { name = "spellID", type = "number", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Soulbinds.GetInstalledConduitID"] = {
    key = "C_Soulbinds.GetInstalledConduitID",
    name = "GetInstalledConduitID",
    category = "general",
    subcategory = "c_soulbinds",
    funcPath = "C_Soulbinds.GetInstalledConduitID",
    params = { { name = "nodeID", type = "number", default = nil } },
    returns = { { name = "conduitID", type = "number", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Soulbinds.GetNode"] = {
    key = "C_Soulbinds.GetNode",
    name = "GetNode",
    category = "general",
    subcategory = "c_soulbinds",
    funcPath = "C_Soulbinds.GetNode",
    params = { { name = "nodeID", type = "number", default = nil } },
    returns = { { name = "node", type = "SoulbindNode", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Soulbinds.GetSoulbindData"] = {
    key = "C_Soulbinds.GetSoulbindData",
    name = "GetSoulbindData",
    category = "general",
    subcategory = "c_soulbinds",
    funcPath = "C_Soulbinds.GetSoulbindData",
    params = { { name = "soulbindID", type = "number", default = nil } },
    returns = { { name = "data", type = "SoulbindData", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Soulbinds.GetSpecsAssignedToSoulbind"] = {
    key = "C_Soulbinds.GetSpecsAssignedToSoulbind",
    name = "GetSpecsAssignedToSoulbind",
    category = "general",
    subcategory = "c_soulbinds",
    funcPath = "C_Soulbinds.GetSpecsAssignedToSoulbind",
    params = { { name = "soulbindID", type = "number", default = nil } },
    returns = { { name = "specIDs", type = "table", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Soulbinds.GetTree"] = {
    key = "C_Soulbinds.GetTree",
    name = "GetTree",
    category = "general",
    subcategory = "c_soulbinds",
    funcPath = "C_Soulbinds.GetTree",
    params = { { name = "treeID", type = "number", default = nil } },
    returns = { { name = "tree", type = "SoulbindTree", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Soulbinds.HasAnyInstalledConduitInSoulbind"] = {
    key = "C_Soulbinds.HasAnyInstalledConduitInSoulbind",
    name = "HasAnyInstalledConduitInSoulbind",
    category = "general",
    subcategory = "c_soulbinds",
    funcPath = "C_Soulbinds.HasAnyInstalledConduitInSoulbind",
    params = { { name = "soulbindID", type = "number", default = nil } },
    returns = { { name = "result", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Soulbinds.HasAnyPendingConduits"] = {
    key = "C_Soulbinds.HasAnyPendingConduits",
    name = "HasAnyPendingConduits",
    category = "general",
    subcategory = "c_soulbinds",
    funcPath = "C_Soulbinds.HasAnyPendingConduits",
    params = {  },
    returns = { { name = "result", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["C_Soulbinds.HasPendingConduitsInSoulbind"] = {
    key = "C_Soulbinds.HasPendingConduitsInSoulbind",
    name = "HasPendingConduitsInSoulbind",
    category = "general",
    subcategory = "c_soulbinds",
    funcPath = "C_Soulbinds.HasPendingConduitsInSoulbind",
    params = { { name = "soulbindID", type = "number", default = nil } },
    returns = { { name = "result", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Soulbinds.IsConduitInstalled"] = {
    key = "C_Soulbinds.IsConduitInstalled",
    name = "IsConduitInstalled",
    category = "general",
    subcategory = "c_soulbinds",
    funcPath = "C_Soulbinds.IsConduitInstalled",
    params = { { name = "nodeID", type = "number", default = nil } },
    returns = { { name = "result", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Soulbinds.IsConduitInstalledInSoulbind"] = {
    key = "C_Soulbinds.IsConduitInstalledInSoulbind",
    name = "IsConduitInstalledInSoulbind",
    category = "general",
    subcategory = "c_soulbinds",
    funcPath = "C_Soulbinds.IsConduitInstalledInSoulbind",
    params = { { name = "soulbindID", type = "number", default = nil }, { name = "conduitID", type = "number", default = nil } },
    returns = { { name = "result", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Soulbinds.IsItemConduitByItemInfo"] = {
    key = "C_Soulbinds.IsItemConduitByItemInfo",
    name = "IsItemConduitByItemInfo",
    category = "general",
    subcategory = "c_soulbinds",
    funcPath = "C_Soulbinds.IsItemConduitByItemInfo",
    params = { { name = "itemInfo", type = "ItemInfo", default = nil } },
    returns = { { name = "result", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Soulbinds.IsNodePendingModify"] = {
    key = "C_Soulbinds.IsNodePendingModify",
    name = "IsNodePendingModify",
    category = "general",
    subcategory = "c_soulbinds",
    funcPath = "C_Soulbinds.IsNodePendingModify",
    params = { { name = "nodeID", type = "number", default = nil } },
    returns = { { name = "result", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Soulbinds.IsUnselectedConduitPendingInSoulbind"] = {
    key = "C_Soulbinds.IsUnselectedConduitPendingInSoulbind",
    name = "IsUnselectedConduitPendingInSoulbind",
    category = "general",
    subcategory = "c_soulbinds",
    funcPath = "C_Soulbinds.IsUnselectedConduitPendingInSoulbind",
    params = { { name = "soulbindID", type = "number", default = nil } },
    returns = { { name = "result", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Soulbinds.ModifyNode"] = {
    key = "C_Soulbinds.ModifyNode",
    name = "ModifyNode",
    category = "general",
    subcategory = "c_soulbinds",
    funcPath = "C_Soulbinds.ModifyNode",
    params = { { name = "nodeID", type = "number", default = nil }, { name = "conduitID", type = "number", default = nil }, { name = "type", type = "SoulbindConduitTransactionType", default = nil } },
    returns = {  },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Soulbinds.SelectNode"] = {
    key = "C_Soulbinds.SelectNode",
    name = "SelectNode",
    category = "general",
    subcategory = "c_soulbinds",
    funcPath = "C_Soulbinds.SelectNode",
    params = { { name = "nodeID", type = "number", default = nil } },
    returns = {  },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Soulbinds.UnmodifyNode"] = {
    key = "C_Soulbinds.UnmodifyNode",
    name = "UnmodifyNode",
    category = "general",
    subcategory = "c_soulbinds",
    funcPath = "C_Soulbinds.UnmodifyNode",
    params = { { name = "nodeID", type = "number", default = nil } },
    returns = {  },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}
