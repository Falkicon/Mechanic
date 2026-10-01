-- Generated APIDefinitions for namespace: C_TransmogSets
local _, ns = ...
local APIDefs = ns.APIDefinitions

APIDefs["C_TransmogSets.ClearLatestSource"] = {
    key = "C_TransmogSets.ClearLatestSource",
    name = "ClearLatestSource",
    category = "general",
    subcategory = "c_transmogsets",
    funcPath = "C_TransmogSets.ClearLatestSource",
    params = {  },
    returns = {  },
    midnightImpact = "NORMAL",
}

APIDefs["C_TransmogSets.ClearNewSource"] = {
    key = "C_TransmogSets.ClearNewSource",
    name = "ClearNewSource",
    category = "general",
    subcategory = "c_transmogsets",
    funcPath = "C_TransmogSets.ClearNewSource",
    params = { { name = "sourceID", type = "number", default = nil } },
    returns = {  },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_TransmogSets.ClearSetNewSourcesForSlot"] = {
    key = "C_TransmogSets.ClearSetNewSourcesForSlot",
    name = "ClearSetNewSourcesForSlot",
    category = "general",
    subcategory = "c_transmogsets",
    funcPath = "C_TransmogSets.ClearSetNewSourcesForSlot",
    params = { { name = "transmogSetID", type = "number", default = nil }, { name = "slot", type = "luaIndex", default = nil } },
    returns = {  },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_TransmogSets.GetAllSets"] = {
    key = "C_TransmogSets.GetAllSets",
    name = "GetAllSets",
    category = "general",
    subcategory = "c_transmogsets",
    funcPath = "C_TransmogSets.GetAllSets",
    params = {  },
    returns = { { name = "sets", type = "table", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["C_TransmogSets.GetAllSourceIDs"] = {
    key = "C_TransmogSets.GetAllSourceIDs",
    name = "GetAllSourceIDs",
    category = "general",
    subcategory = "c_transmogsets",
    funcPath = "C_TransmogSets.GetAllSourceIDs",
    params = { { name = "transmogSetID", type = "number", default = nil } },
    returns = { { name = "sources", type = "table", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_TransmogSets.GetAvailableSets"] = {
    key = "C_TransmogSets.GetAvailableSets",
    name = "GetAvailableSets",
    category = "general",
    subcategory = "c_transmogsets",
    funcPath = "C_TransmogSets.GetAvailableSets",
    params = {  },
    returns = { { name = "sets", type = "table", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["C_TransmogSets.GetBaseSetID"] = {
    key = "C_TransmogSets.GetBaseSetID",
    name = "GetBaseSetID",
    category = "general",
    subcategory = "c_transmogsets",
    funcPath = "C_TransmogSets.GetBaseSetID",
    params = { { name = "transmogSetID", type = "number", default = nil } },
    returns = { { name = "baseTransmogSetID", type = "number", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_TransmogSets.GetBaseSets"] = {
    key = "C_TransmogSets.GetBaseSets",
    name = "GetBaseSets",
    category = "general",
    subcategory = "c_transmogsets",
    funcPath = "C_TransmogSets.GetBaseSets",
    params = {  },
    returns = { { name = "sets", type = "table", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["C_TransmogSets.GetBaseSetsFilter"] = {
    key = "C_TransmogSets.GetBaseSetsFilter",
    name = "GetBaseSetsFilter",
    category = "general",
    subcategory = "c_transmogsets",
    funcPath = "C_TransmogSets.GetBaseSetsFilter",
    params = { { name = "index", type = "luaIndex", default = nil } },
    returns = { { name = "isChecked", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_TransmogSets.GetCameraIDs"] = {
    key = "C_TransmogSets.GetCameraIDs",
    name = "GetCameraIDs",
    category = "general",
    subcategory = "c_transmogsets",
    funcPath = "C_TransmogSets.GetCameraIDs",
    params = {  },
    returns = { { name = "detailsCameraID", type = "number", canBeSecret = false }, { name = "vendorCameraID", type = "number", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["C_TransmogSets.GetFilteredBaseSetsCounts"] = {
    key = "C_TransmogSets.GetFilteredBaseSetsCounts",
    name = "GetFilteredBaseSetsCounts",
    category = "general",
    subcategory = "c_transmogsets",
    funcPath = "C_TransmogSets.GetFilteredBaseSetsCounts",
    params = {  },
    returns = { { name = "numCollected", type = "number", canBeSecret = false }, { name = "numTotal", type = "number", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["C_TransmogSets.GetFullBaseSetsCounts"] = {
    key = "C_TransmogSets.GetFullBaseSetsCounts",
    name = "GetFullBaseSetsCounts",
    category = "general",
    subcategory = "c_transmogsets",
    funcPath = "C_TransmogSets.GetFullBaseSetsCounts",
    params = {  },
    returns = { { name = "numCollected", type = "number", canBeSecret = false }, { name = "numTotal", type = "number", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["C_TransmogSets.GetIsFavorite"] = {
    key = "C_TransmogSets.GetIsFavorite",
    name = "GetIsFavorite",
    category = "general",
    subcategory = "c_transmogsets",
    funcPath = "C_TransmogSets.GetIsFavorite",
    params = { { name = "transmogSetID", type = "number", default = nil } },
    returns = { { name = "isFavorite", type = "bool", canBeSecret = false }, { name = "isGroupFavorite", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_TransmogSets.GetLatestSource"] = {
    key = "C_TransmogSets.GetLatestSource",
    name = "GetLatestSource",
    category = "general",
    subcategory = "c_transmogsets",
    funcPath = "C_TransmogSets.GetLatestSource",
    params = {  },
    returns = { { name = "sourceID", type = "number", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["C_TransmogSets.GetSetInfo"] = {
    key = "C_TransmogSets.GetSetInfo",
    name = "GetSetInfo",
    category = "general",
    subcategory = "c_transmogsets",
    funcPath = "C_TransmogSets.GetSetInfo",
    params = { { name = "transmogSetID", type = "number", default = nil } },
    returns = { { name = "set", type = "TransmogSetInfo", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_TransmogSets.GetSetNewSources"] = {
    key = "C_TransmogSets.GetSetNewSources",
    name = "GetSetNewSources",
    category = "general",
    subcategory = "c_transmogsets",
    funcPath = "C_TransmogSets.GetSetNewSources",
    params = { { name = "transmogSetID", type = "number", default = nil } },
    returns = { { name = "sourceIDs", type = "table", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_TransmogSets.GetSetPrimaryAppearances"] = {
    key = "C_TransmogSets.GetSetPrimaryAppearances",
    name = "GetSetPrimaryAppearances",
    category = "general",
    subcategory = "c_transmogsets",
    funcPath = "C_TransmogSets.GetSetPrimaryAppearances",
    params = { { name = "transmogSetID", type = "number", default = nil } },
    returns = { { name = "apppearances", type = "table", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_TransmogSets.GetSetsContainingSourceID"] = {
    key = "C_TransmogSets.GetSetsContainingSourceID",
    name = "GetSetsContainingSourceID",
    category = "general",
    subcategory = "c_transmogsets",
    funcPath = "C_TransmogSets.GetSetsContainingSourceID",
    params = { { name = "sourceID", type = "number", default = nil } },
    returns = { { name = "setIDs", type = "table", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_TransmogSets.GetSetsFilter"] = {
    key = "C_TransmogSets.GetSetsFilter",
    name = "GetSetsFilter",
    category = "general",
    subcategory = "c_transmogsets",
    funcPath = "C_TransmogSets.GetSetsFilter",
    params = { { name = "index", type = "luaIndex", default = nil } },
    returns = { { name = "isChecked", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_TransmogSets.GetSourceIDsForSlot"] = {
    key = "C_TransmogSets.GetSourceIDsForSlot",
    name = "GetSourceIDsForSlot",
    category = "general",
    subcategory = "c_transmogsets",
    funcPath = "C_TransmogSets.GetSourceIDsForSlot",
    params = { { name = "transmogSetID", type = "number", default = nil }, { name = "slot", type = "luaIndex", default = nil } },
    returns = { { name = "sources", type = "table", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_TransmogSets.GetSourcesForSlot"] = {
    key = "C_TransmogSets.GetSourcesForSlot",
    name = "GetSourcesForSlot",
    category = "general",
    subcategory = "c_transmogsets",
    funcPath = "C_TransmogSets.GetSourcesForSlot",
    params = { { name = "transmogSetID", type = "number", default = nil }, { name = "slot", type = "luaIndex", default = nil } },
    returns = { { name = "sources", type = "table", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_TransmogSets.GetTransmogSetsClassFilter"] = {
    key = "C_TransmogSets.GetTransmogSetsClassFilter",
    name = "GetTransmogSetsClassFilter",
    category = "general",
    subcategory = "c_transmogsets",
    funcPath = "C_TransmogSets.GetTransmogSetsClassFilter",
    params = {  },
    returns = { { name = "classID", type = "number", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["C_TransmogSets.GetUsableSets"] = {
    key = "C_TransmogSets.GetUsableSets",
    name = "GetUsableSets",
    category = "general",
    subcategory = "c_transmogsets",
    funcPath = "C_TransmogSets.GetUsableSets",
    params = {  },
    returns = { { name = "sets", type = "table", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["C_TransmogSets.GetValidBaseSetsCountsForCharacter"] = {
    key = "C_TransmogSets.GetValidBaseSetsCountsForCharacter",
    name = "GetValidBaseSetsCountsForCharacter",
    category = "general",
    subcategory = "c_transmogsets",
    funcPath = "C_TransmogSets.GetValidBaseSetsCountsForCharacter",
    params = {  },
    returns = { { name = "numCollected", type = "number", canBeSecret = false }, { name = "numTotal", type = "number", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["C_TransmogSets.GetValidClassForSet"] = {
    key = "C_TransmogSets.GetValidClassForSet",
    name = "GetValidClassForSet",
    category = "general",
    subcategory = "c_transmogsets",
    funcPath = "C_TransmogSets.GetValidClassForSet",
    params = { { name = "transmogSetID", type = "number", default = nil } },
    returns = { { name = "classID", type = "number", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_TransmogSets.GetVariantSets"] = {
    key = "C_TransmogSets.GetVariantSets",
    name = "GetVariantSets",
    category = "general",
    subcategory = "c_transmogsets",
    funcPath = "C_TransmogSets.GetVariantSets",
    params = { { name = "transmogSetID", type = "number", default = nil } },
    returns = { { name = "sets", type = "table", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_TransmogSets.HasUsableSets"] = {
    key = "C_TransmogSets.HasUsableSets",
    name = "HasUsableSets",
    category = "general",
    subcategory = "c_transmogsets",
    funcPath = "C_TransmogSets.HasUsableSets",
    params = {  },
    returns = { { name = "hasUsableSets", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["C_TransmogSets.IsBaseSetCollected"] = {
    key = "C_TransmogSets.IsBaseSetCollected",
    name = "IsBaseSetCollected",
    category = "general",
    subcategory = "c_transmogsets",
    funcPath = "C_TransmogSets.IsBaseSetCollected",
    params = { { name = "transmogSetID", type = "number", default = nil } },
    returns = { { name = "isCollected", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_TransmogSets.IsNewSource"] = {
    key = "C_TransmogSets.IsNewSource",
    name = "IsNewSource",
    category = "general",
    subcategory = "c_transmogsets",
    funcPath = "C_TransmogSets.IsNewSource",
    params = { { name = "sourceID", type = "number", default = nil } },
    returns = { { name = "isNew", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_TransmogSets.IsSetVisible"] = {
    key = "C_TransmogSets.IsSetVisible",
    name = "IsSetVisible",
    category = "general",
    subcategory = "c_transmogsets",
    funcPath = "C_TransmogSets.IsSetVisible",
    params = { { name = "transmogSetID", type = "number", default = nil } },
    returns = { { name = "isVisible", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_TransmogSets.IsUsingDefaultBaseSetsFilters"] = {
    key = "C_TransmogSets.IsUsingDefaultBaseSetsFilters",
    name = "IsUsingDefaultBaseSetsFilters",
    category = "general",
    subcategory = "c_transmogsets",
    funcPath = "C_TransmogSets.IsUsingDefaultBaseSetsFilters",
    params = {  },
    returns = { { name = "isUsingDefaultBaseSetsFilters", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["C_TransmogSets.IsUsingDefaultSetsFilters"] = {
    key = "C_TransmogSets.IsUsingDefaultSetsFilters",
    name = "IsUsingDefaultSetsFilters",
    category = "general",
    subcategory = "c_transmogsets",
    funcPath = "C_TransmogSets.IsUsingDefaultSetsFilters",
    params = {  },
    returns = { { name = "isUsingDefaultSetsFilters", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["C_TransmogSets.SetBaseSetsFilter"] = {
    key = "C_TransmogSets.SetBaseSetsFilter",
    name = "SetBaseSetsFilter",
    category = "general",
    subcategory = "c_transmogsets",
    funcPath = "C_TransmogSets.SetBaseSetsFilter",
    params = { { name = "index", type = "luaIndex", default = nil }, { name = "isChecked", type = "bool", default = nil } },
    returns = {  },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_TransmogSets.SetDefaultBaseSetsFilters"] = {
    key = "C_TransmogSets.SetDefaultBaseSetsFilters",
    name = "SetDefaultBaseSetsFilters",
    category = "general",
    subcategory = "c_transmogsets",
    funcPath = "C_TransmogSets.SetDefaultBaseSetsFilters",
    params = {  },
    returns = {  },
    midnightImpact = "NORMAL",
}

APIDefs["C_TransmogSets.SetDefaultSetsFilters"] = {
    key = "C_TransmogSets.SetDefaultSetsFilters",
    name = "SetDefaultSetsFilters",
    category = "general",
    subcategory = "c_transmogsets",
    funcPath = "C_TransmogSets.SetDefaultSetsFilters",
    params = {  },
    returns = {  },
    midnightImpact = "NORMAL",
}

APIDefs["C_TransmogSets.SetHasNewSources"] = {
    key = "C_TransmogSets.SetHasNewSources",
    name = "SetHasNewSources",
    category = "general",
    subcategory = "c_transmogsets",
    funcPath = "C_TransmogSets.SetHasNewSources",
    params = { { name = "transmogSetID", type = "number", default = nil } },
    returns = { { name = "hasNewSources", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_TransmogSets.SetHasNewSourcesForSlot"] = {
    key = "C_TransmogSets.SetHasNewSourcesForSlot",
    name = "SetHasNewSourcesForSlot",
    category = "general",
    subcategory = "c_transmogsets",
    funcPath = "C_TransmogSets.SetHasNewSourcesForSlot",
    params = { { name = "transmogSetID", type = "number", default = nil }, { name = "slot", type = "luaIndex", default = nil } },
    returns = { { name = "hasNewSources", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_TransmogSets.SetIsFavorite"] = {
    key = "C_TransmogSets.SetIsFavorite",
    name = "SetIsFavorite",
    category = "general",
    subcategory = "c_transmogsets",
    funcPath = "C_TransmogSets.SetIsFavorite",
    params = { { name = "transmogSetID", type = "number", default = nil }, { name = "isFavorite", type = "bool", default = nil } },
    returns = {  },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_TransmogSets.SetSetsFilter"] = {
    key = "C_TransmogSets.SetSetsFilter",
    name = "SetSetsFilter",
    category = "general",
    subcategory = "c_transmogsets",
    funcPath = "C_TransmogSets.SetSetsFilter",
    params = { { name = "index", type = "luaIndex", default = nil }, { name = "isChecked", type = "bool", default = nil } },
    returns = {  },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_TransmogSets.SetTransmogSetsClassFilter"] = {
    key = "C_TransmogSets.SetTransmogSetsClassFilter",
    name = "SetTransmogSetsClassFilter",
    category = "general",
    subcategory = "c_transmogsets",
    funcPath = "C_TransmogSets.SetTransmogSetsClassFilter",
    params = { { name = "classID", type = "number", default = nil } },
    returns = {  },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}
