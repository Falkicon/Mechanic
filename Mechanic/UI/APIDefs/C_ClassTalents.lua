-- Generated APIDefinitions for namespace: C_ClassTalents
local _, ns = ...
local APIDefs = ns.APIDefinitions

APIDefs["C_ClassTalents.CanChangeTalents"] = {
    key = "C_ClassTalents.CanChangeTalents",
    name = "CanChangeTalents",
    category = "spell",
    subcategory = "c_classtalents",
    funcPath = "C_ClassTalents.CanChangeTalents",
    params = {  },
    returns = { { name = "canChange", type = "bool", canBeSecret = false }, { name = "canAdd", type = "bool", canBeSecret = false }, { name = "changeError", type = "string", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["C_ClassTalents.CanCreateNewConfig"] = {
    key = "C_ClassTalents.CanCreateNewConfig",
    name = "CanCreateNewConfig",
    category = "spell",
    subcategory = "c_classtalents",
    funcPath = "C_ClassTalents.CanCreateNewConfig",
    params = {  },
    returns = { { name = "canCreate", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["C_ClassTalents.CanEditTalents"] = {
    key = "C_ClassTalents.CanEditTalents",
    name = "CanEditTalents",
    category = "spell",
    subcategory = "c_classtalents",
    funcPath = "C_ClassTalents.CanEditTalents",
    params = {  },
    returns = { { name = "canEdit", type = "bool", canBeSecret = false }, { name = "changeError", type = "cstring", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["C_ClassTalents.CommitConfig"] = {
    key = "C_ClassTalents.CommitConfig",
    name = "CommitConfig",
    category = "spell",
    subcategory = "c_classtalents",
    funcPath = "C_ClassTalents.CommitConfig",
    params = { { name = "savedConfigID", type = "number", default = nil } },
    returns = { { name = "success", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_ClassTalents.DeleteConfig"] = {
    key = "C_ClassTalents.DeleteConfig",
    name = "DeleteConfig",
    category = "spell",
    subcategory = "c_classtalents",
    funcPath = "C_ClassTalents.DeleteConfig",
    params = { { name = "configID", type = "number", default = nil } },
    returns = { { name = "success", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_ClassTalents.GetActiveConfigID"] = {
    key = "C_ClassTalents.GetActiveConfigID",
    name = "GetActiveConfigID",
    category = "spell",
    subcategory = "c_classtalents",
    funcPath = "C_ClassTalents.GetActiveConfigID",
    params = {  },
    returns = { { name = "activeConfigID", type = "number", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["C_ClassTalents.GetActiveHeroTalentSpec"] = {
    key = "C_ClassTalents.GetActiveHeroTalentSpec",
    name = "GetActiveHeroTalentSpec",
    category = "spell",
    subcategory = "c_classtalents",
    funcPath = "C_ClassTalents.GetActiveHeroTalentSpec",
    params = {  },
    returns = { { name = "heroSpecID", type = "number", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["C_ClassTalents.GetConfigIDsBySpecID"] = {
    key = "C_ClassTalents.GetConfigIDsBySpecID",
    name = "GetConfigIDsBySpecID",
    category = "spell",
    subcategory = "c_classtalents",
    funcPath = "C_ClassTalents.GetConfigIDsBySpecID",
    params = { { name = "specID", type = "number", default = nil } },
    returns = { { name = "configIDs", type = "table", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_ClassTalents.GetHasStarterBuild"] = {
    key = "C_ClassTalents.GetHasStarterBuild",
    name = "GetHasStarterBuild",
    category = "spell",
    subcategory = "c_classtalents",
    funcPath = "C_ClassTalents.GetHasStarterBuild",
    params = {  },
    returns = { { name = "hasStarterBuild", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["C_ClassTalents.GetHeroTalentSpecsForClassSpec"] = {
    key = "C_ClassTalents.GetHeroTalentSpecsForClassSpec",
    name = "GetHeroTalentSpecsForClassSpec",
    category = "spell",
    subcategory = "c_classtalents",
    funcPath = "C_ClassTalents.GetHeroTalentSpecsForClassSpec",
    params = { { name = "configID", type = "number", default = nil }, { name = "classSpecID", type = "number", default = nil } },
    returns = { { name = "subTreeIDs", type = "table", canBeSecret = false }, { name = "requiredPlayerLevel", type = "number", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_ClassTalents.GetLastSelectedSavedConfigID"] = {
    key = "C_ClassTalents.GetLastSelectedSavedConfigID",
    name = "GetLastSelectedSavedConfigID",
    category = "spell",
    subcategory = "c_classtalents",
    funcPath = "C_ClassTalents.GetLastSelectedSavedConfigID",
    params = { { name = "specID", type = "number", default = nil } },
    returns = { { name = "configID", type = "number", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_ClassTalents.GetNextStarterBuildPurchase"] = {
    key = "C_ClassTalents.GetNextStarterBuildPurchase",
    name = "GetNextStarterBuildPurchase",
    category = "spell",
    subcategory = "c_classtalents",
    funcPath = "C_ClassTalents.GetNextStarterBuildPurchase",
    params = {  },
    returns = { { name = "nodeID", type = "number", canBeSecret = false }, { name = "entryID", type = "number", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["C_ClassTalents.GetStarterBuildActive"] = {
    key = "C_ClassTalents.GetStarterBuildActive",
    name = "GetStarterBuildActive",
    category = "spell",
    subcategory = "c_classtalents",
    funcPath = "C_ClassTalents.GetStarterBuildActive",
    params = {  },
    returns = { { name = "isActive", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["C_ClassTalents.GetTraitTreeForSpec"] = {
    key = "C_ClassTalents.GetTraitTreeForSpec",
    name = "GetTraitTreeForSpec",
    category = "spell",
    subcategory = "c_classtalents",
    funcPath = "C_ClassTalents.GetTraitTreeForSpec",
    params = { { name = "specID", type = "number", default = nil } },
    returns = { { name = "treeID", type = "number", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_ClassTalents.HasUnspentHeroTalentPoints"] = {
    key = "C_ClassTalents.HasUnspentHeroTalentPoints",
    name = "HasUnspentHeroTalentPoints",
    category = "spell",
    subcategory = "c_classtalents",
    funcPath = "C_ClassTalents.HasUnspentHeroTalentPoints",
    params = {  },
    returns = { { name = "hasUnspentPoints", type = "bool", canBeSecret = false }, { name = "numHeroPoints", type = "number", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["C_ClassTalents.HasUnspentTalentPoints"] = {
    key = "C_ClassTalents.HasUnspentTalentPoints",
    name = "HasUnspentTalentPoints",
    category = "spell",
    subcategory = "c_classtalents",
    funcPath = "C_ClassTalents.HasUnspentTalentPoints",
    params = {  },
    returns = { { name = "hasUnspentPoints", type = "bool", canBeSecret = false }, { name = "numClassPoints", type = "number", canBeSecret = false }, { name = "numSpecPoints", type = "number", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["C_ClassTalents.ImportLoadout"] = {
    key = "C_ClassTalents.ImportLoadout",
    name = "ImportLoadout",
    category = "spell",
    subcategory = "c_classtalents",
    funcPath = "C_ClassTalents.ImportLoadout",
    params = { { name = "configID", type = "number", default = nil }, { name = "entries", type = "table", default = nil }, { name = "name", type = "string", default = nil }, { name = "importString", type = "string", default = nil } },
    returns = { { name = "success", type = "bool", canBeSecret = false }, { name = "importError", type = "cstring", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_ClassTalents.InitializeViewLoadout"] = {
    key = "C_ClassTalents.InitializeViewLoadout",
    name = "InitializeViewLoadout",
    category = "spell",
    subcategory = "c_classtalents",
    funcPath = "C_ClassTalents.InitializeViewLoadout",
    params = { { name = "specID", type = "number", default = nil }, { name = "level", type = "number", default = nil } },
    returns = {  },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_ClassTalents.IsConfigPopulated"] = {
    key = "C_ClassTalents.IsConfigPopulated",
    name = "IsConfigPopulated",
    category = "spell",
    subcategory = "c_classtalents",
    funcPath = "C_ClassTalents.IsConfigPopulated",
    params = { { name = "configID", type = "number", default = nil } },
    returns = { { name = "isPopulated", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_ClassTalents.LoadConfig"] = {
    key = "C_ClassTalents.LoadConfig",
    name = "LoadConfig",
    category = "spell",
    subcategory = "c_classtalents",
    funcPath = "C_ClassTalents.LoadConfig",
    params = { { name = "configID", type = "number", default = nil }, { name = "autoApply", type = "bool", default = nil } },
    returns = { { name = "result", type = "LoadConfigResult", canBeSecret = false }, { name = "changeError", type = "string", canBeSecret = false }, { name = "newLearnedNodeIDs", type = "table", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_ClassTalents.RenameConfig"] = {
    key = "C_ClassTalents.RenameConfig",
    name = "RenameConfig",
    category = "spell",
    subcategory = "c_classtalents",
    funcPath = "C_ClassTalents.RenameConfig",
    params = { { name = "configID", type = "number", default = nil }, { name = "name", type = "string", default = nil } },
    returns = { { name = "success", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_ClassTalents.RequestNewConfig"] = {
    key = "C_ClassTalents.RequestNewConfig",
    name = "RequestNewConfig",
    category = "spell",
    subcategory = "c_classtalents",
    funcPath = "C_ClassTalents.RequestNewConfig",
    params = { { name = "name", type = "string", default = nil } },
    returns = { { name = "success", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_ClassTalents.SaveConfig"] = {
    key = "C_ClassTalents.SaveConfig",
    name = "SaveConfig",
    category = "spell",
    subcategory = "c_classtalents",
    funcPath = "C_ClassTalents.SaveConfig",
    params = { { name = "configID", type = "number", default = nil } },
    returns = { { name = "success", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_ClassTalents.SetStarterBuildActive"] = {
    key = "C_ClassTalents.SetStarterBuildActive",
    name = "SetStarterBuildActive",
    category = "spell",
    subcategory = "c_classtalents",
    funcPath = "C_ClassTalents.SetStarterBuildActive",
    params = { { name = "active", type = "bool", default = nil } },
    returns = { { name = "result", type = "LoadConfigResult", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_ClassTalents.SetUsesSharedActionBars"] = {
    key = "C_ClassTalents.SetUsesSharedActionBars",
    name = "SetUsesSharedActionBars",
    category = "spell",
    subcategory = "c_classtalents",
    funcPath = "C_ClassTalents.SetUsesSharedActionBars",
    params = { { name = "configID", type = "number", default = nil }, { name = "usesShared", type = "bool", default = nil } },
    returns = {  },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_ClassTalents.UpdateLastSelectedSavedConfigID"] = {
    key = "C_ClassTalents.UpdateLastSelectedSavedConfigID",
    name = "UpdateLastSelectedSavedConfigID",
    category = "spell",
    subcategory = "c_classtalents",
    funcPath = "C_ClassTalents.UpdateLastSelectedSavedConfigID",
    params = { { name = "specID", type = "number", default = nil }, { name = "configID", type = "number", default = nil } },
    returns = {  },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_ClassTalents.ViewLoadout"] = {
    key = "C_ClassTalents.ViewLoadout",
    name = "ViewLoadout",
    category = "spell",
    subcategory = "c_classtalents",
    funcPath = "C_ClassTalents.ViewLoadout",
    params = { { name = "entries", type = "table", default = nil }, { name = "importString", type = "string", default = nil } },
    returns = { { name = "success", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}
