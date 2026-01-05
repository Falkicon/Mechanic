-- Generated APIDefinitions for namespace: C_LFGList
local _, ns = ...
local APIDefs = ns.APIDefinitions

APIDefs["C_LFGList.CanActiveEntryUseAutoAccept"] = {
    key = "C_LFGList.CanActiveEntryUseAutoAccept",
    name = "CanActiveEntryUseAutoAccept",
    category = "general",
    subcategory = "c_lfglist",
    func = _G["C_LFGList"] and _G["C_LFGList"]["CanActiveEntryUseAutoAccept"],
    funcPath = "C_LFGList.CanActiveEntryUseAutoAccept",
    params = {  },
    returns = { { name = "canUseAutoAccept", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["C_LFGList.CanCreateQuestGroup"] = {
    key = "C_LFGList.CanCreateQuestGroup",
    name = "CanCreateQuestGroup",
    category = "combat_midnight",
    subcategory = "c_lfglist",
    func = _G["C_LFGList"] and _G["C_LFGList"]["CanCreateQuestGroup"],
    funcPath = "C_LFGList.CanCreateQuestGroup",
    params = { { name = "questID", type = "number", default = nil } },
    returns = { { name = "canCreate", type = "bool", canBeSecret = false } },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_LFGList.CanCreateScenarioGroup"] = {
    key = "C_LFGList.CanCreateScenarioGroup",
    name = "CanCreateScenarioGroup",
    category = "combat_midnight",
    subcategory = "c_lfglist",
    func = _G["C_LFGList"] and _G["C_LFGList"]["CanCreateScenarioGroup"],
    funcPath = "C_LFGList.CanCreateScenarioGroup",
    params = { { name = "scenarioID", type = "number", default = nil } },
    returns = { { name = "canCreate", type = "bool", canBeSecret = false } },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_LFGList.ClearApplicationTextFields"] = {
    key = "C_LFGList.ClearApplicationTextFields",
    name = "ClearApplicationTextFields",
    category = "general",
    subcategory = "c_lfglist",
    func = _G["C_LFGList"] and _G["C_LFGList"]["ClearApplicationTextFields"],
    funcPath = "C_LFGList.ClearApplicationTextFields",
    params = {  },
    returns = {  },
    midnightImpact = "NORMAL",
}

APIDefs["C_LFGList.ClearCreationTextFields"] = {
    key = "C_LFGList.ClearCreationTextFields",
    name = "ClearCreationTextFields",
    category = "general",
    subcategory = "c_lfglist",
    func = _G["C_LFGList"] and _G["C_LFGList"]["ClearCreationTextFields"],
    funcPath = "C_LFGList.ClearCreationTextFields",
    params = {  },
    returns = {  },
    midnightImpact = "NORMAL",
}

APIDefs["C_LFGList.ClearSearchTextFields"] = {
    key = "C_LFGList.ClearSearchTextFields",
    name = "ClearSearchTextFields",
    category = "general",
    subcategory = "c_lfglist",
    func = _G["C_LFGList"] and _G["C_LFGList"]["ClearSearchTextFields"],
    funcPath = "C_LFGList.ClearSearchTextFields",
    params = {  },
    returns = {  },
    midnightImpact = "NORMAL",
}

APIDefs["C_LFGList.CopyActiveEntryInfoToCreationFields"] = {
    key = "C_LFGList.CopyActiveEntryInfoToCreationFields",
    name = "CopyActiveEntryInfoToCreationFields",
    category = "general",
    subcategory = "c_lfglist",
    func = _G["C_LFGList"] and _G["C_LFGList"]["CopyActiveEntryInfoToCreationFields"],
    funcPath = "C_LFGList.CopyActiveEntryInfoToCreationFields",
    params = {  },
    returns = {  },
    midnightImpact = "NORMAL",
}

APIDefs["C_LFGList.CreateListing"] = {
    key = "C_LFGList.CreateListing",
    name = "CreateListing",
    category = "combat_midnight",
    subcategory = "c_lfglist",
    func = _G["C_LFGList"] and _G["C_LFGList"]["CreateListing"],
    funcPath = "C_LFGList.CreateListing",
    params = { { name = "createData", type = "LfgListingCreateData", default = nil } },
    returns = { { name = "success", type = "bool", canBeSecret = false } },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_LFGList.CreateScenarioListing"] = {
    key = "C_LFGList.CreateScenarioListing",
    name = "CreateScenarioListing",
    category = "combat_midnight",
    subcategory = "c_lfglist",
    func = _G["C_LFGList"] and _G["C_LFGList"]["CreateScenarioListing"],
    funcPath = "C_LFGList.CreateScenarioListing",
    params = { { name = "activityID", type = "number", default = nil }, { name = "itemLevel", type = "number", default = nil }, { name = "autoAccept", type = "bool", default = nil }, { name = "privateGroup", type = "bool", default = nil }, { name = "scenarioID", type = "number", default = nil } },
    returns = { { name = "canCreate", type = "bool", canBeSecret = false } },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_LFGList.DoesEntryTitleMatchPrebuiltTitle"] = {
    key = "C_LFGList.DoesEntryTitleMatchPrebuiltTitle",
    name = "DoesEntryTitleMatchPrebuiltTitle",
    category = "combat_midnight",
    subcategory = "c_lfglist",
    func = _G["C_LFGList"] and _G["C_LFGList"]["DoesEntryTitleMatchPrebuiltTitle"],
    funcPath = "C_LFGList.DoesEntryTitleMatchPrebuiltTitle",
    params = { { name = "activityID", type = "number", default = nil }, { name = "groupID", type = "number", default = nil }, { name = "playstyle", type = "LFGEntryPlaystyle", default = nil }, { name = "generalPlaystyle", type = "LFGEntryGeneralPlaystyle", default = nil } },
    returns = { { name = "matches", type = "bool", canBeSecret = false } },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_LFGList.GetActiveEntryInfo"] = {
    key = "C_LFGList.GetActiveEntryInfo",
    name = "GetActiveEntryInfo",
    category = "general",
    subcategory = "c_lfglist",
    func = _G["C_LFGList"] and _G["C_LFGList"]["GetActiveEntryInfo"],
    funcPath = "C_LFGList.GetActiveEntryInfo",
    params = {  },
    returns = { { name = "entryData", type = "LfgEntryData", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["C_LFGList.GetActivityFullName"] = {
    key = "C_LFGList.GetActivityFullName",
    name = "GetActivityFullName",
    category = "combat_midnight",
    subcategory = "c_lfglist",
    func = _G["C_LFGList"] and _G["C_LFGList"]["GetActivityFullName"],
    funcPath = "C_LFGList.GetActivityFullName",
    params = { { name = "activityID", type = "number", default = nil }, { name = "questID", type = "number", default = nil }, { name = "showWarmode", type = "bool", default = nil } },
    returns = { { name = "fullName", type = "string", canBeSecret = false } },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_LFGList.GetActivityGroupInfo"] = {
    key = "C_LFGList.GetActivityGroupInfo",
    name = "GetActivityGroupInfo",
    category = "combat_midnight",
    subcategory = "c_lfglist",
    func = _G["C_LFGList"] and _G["C_LFGList"]["GetActivityGroupInfo"],
    funcPath = "C_LFGList.GetActivityGroupInfo",
    params = { { name = "groupID", type = "number", default = nil } },
    returns = { { name = "name", type = "string", canBeSecret = false }, { name = "orderIndex", type = "number", canBeSecret = false } },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_LFGList.GetActivityInfoTable"] = {
    key = "C_LFGList.GetActivityInfoTable",
    name = "GetActivityInfoTable",
    category = "combat_midnight",
    subcategory = "c_lfglist",
    func = _G["C_LFGList"] and _G["C_LFGList"]["GetActivityInfoTable"],
    funcPath = "C_LFGList.GetActivityInfoTable",
    params = { { name = "activityID", type = "number", default = nil }, { name = "questID", type = "number", default = nil }, { name = "showWarmode", type = "bool", default = nil } },
    returns = { { name = "activityInfo", type = "GroupFinderActivityInfo", canBeSecret = false } },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_LFGList.GetAdvancedFilter"] = {
    key = "C_LFGList.GetAdvancedFilter",
    name = "GetAdvancedFilter",
    category = "general",
    subcategory = "c_lfglist",
    func = _G["C_LFGList"] and _G["C_LFGList"]["GetAdvancedFilter"],
    funcPath = "C_LFGList.GetAdvancedFilter",
    params = {  },
    returns = { { name = "options", type = "AdvancedFilterOptions", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["C_LFGList.GetApplicantBestDungeonScore"] = {
    key = "C_LFGList.GetApplicantBestDungeonScore",
    name = "GetApplicantBestDungeonScore",
    category = "combat_midnight",
    subcategory = "c_lfglist",
    func = _G["C_LFGList"] and _G["C_LFGList"]["GetApplicantBestDungeonScore"],
    funcPath = "C_LFGList.GetApplicantBestDungeonScore",
    params = { { name = "localID", type = "number", default = nil }, { name = "applicantIndex", type = "luaIndex", default = nil } },
    returns = { { name = "bestDungeonScoreForListing", type = "BestDungeonScoreMapInfo", canBeSecret = false } },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_LFGList.GetApplicantDungeonScoreForListing"] = {
    key = "C_LFGList.GetApplicantDungeonScoreForListing",
    name = "GetApplicantDungeonScoreForListing",
    category = "combat_midnight",
    subcategory = "c_lfglist",
    func = _G["C_LFGList"] and _G["C_LFGList"]["GetApplicantDungeonScoreForListing"],
    funcPath = "C_LFGList.GetApplicantDungeonScoreForListing",
    params = { { name = "localID", type = "number", default = nil }, { name = "applicantIndex", type = "luaIndex", default = nil }, { name = "activityID", type = "number", default = nil } },
    returns = { { name = "bestDungeonScoreForListing", type = "BestDungeonScoreMapInfo", canBeSecret = false } },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_LFGList.GetApplicantInfo"] = {
    key = "C_LFGList.GetApplicantInfo",
    name = "GetApplicantInfo",
    category = "combat_midnight",
    subcategory = "c_lfglist",
    func = _G["C_LFGList"] and _G["C_LFGList"]["GetApplicantInfo"],
    funcPath = "C_LFGList.GetApplicantInfo",
    params = { { name = "applicantID", type = "number", default = nil } },
    returns = { { name = "applicantData", type = "LfgApplicantData", canBeSecret = false } },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_LFGList.GetApplicantPvpRatingInfoForListing"] = {
    key = "C_LFGList.GetApplicantPvpRatingInfoForListing",
    name = "GetApplicantPvpRatingInfoForListing",
    category = "combat_midnight",
    subcategory = "c_lfglist",
    func = _G["C_LFGList"] and _G["C_LFGList"]["GetApplicantPvpRatingInfoForListing"],
    funcPath = "C_LFGList.GetApplicantPvpRatingInfoForListing",
    params = { { name = "localID", type = "number", default = nil }, { name = "applicantIndex", type = "luaIndex", default = nil }, { name = "activityID", type = "number", default = nil } },
    returns = { { name = "pvpRatingInfo", type = "PvpRatingInfo", canBeSecret = false } },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_LFGList.GetAvailableActivityGroups"] = {
    key = "C_LFGList.GetAvailableActivityGroups",
    name = "GetAvailableActivityGroups",
    category = "combat_midnight",
    subcategory = "c_lfglist",
    func = _G["C_LFGList"] and _G["C_LFGList"]["GetAvailableActivityGroups"],
    funcPath = "C_LFGList.GetAvailableActivityGroups",
    params = { { name = "categoryID", type = "number", default = nil }, { name = "filter", type = "number", default = 0 } },
    returns = { { name = "activityIDs", type = "table", canBeSecret = false } },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_LFGList.GetFilteredSearchResults"] = {
    key = "C_LFGList.GetFilteredSearchResults",
    name = "GetFilteredSearchResults",
    category = "general",
    subcategory = "c_lfglist",
    func = _G["C_LFGList"] and _G["C_LFGList"]["GetFilteredSearchResults"],
    funcPath = "C_LFGList.GetFilteredSearchResults",
    params = {  },
    returns = { { name = "totalResultsFound", type = "number", canBeSecret = false }, { name = "filteredResults", type = "table", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["C_LFGList.GetGroupLeaverCountsByRole"] = {
    key = "C_LFGList.GetGroupLeaverCountsByRole",
    name = "GetGroupLeaverCountsByRole",
    category = "general",
    subcategory = "c_lfglist",
    func = _G["C_LFGList"] and _G["C_LFGList"]["GetGroupLeaverCountsByRole"],
    funcPath = "C_LFGList.GetGroupLeaverCountsByRole",
    params = {  },
    returns = { { name = "tankLeavers", type = "number", canBeSecret = false }, { name = "healerLeavers", type = "number", canBeSecret = false }, { name = "damageLeavers", type = "number", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["C_LFGList.GetKeystoneForActivity"] = {
    key = "C_LFGList.GetKeystoneForActivity",
    name = "GetKeystoneForActivity",
    category = "combat_midnight",
    subcategory = "c_lfglist",
    func = _G["C_LFGList"] and _G["C_LFGList"]["GetKeystoneForActivity"],
    funcPath = "C_LFGList.GetKeystoneForActivity",
    params = { { name = "activityID", type = "number", default = nil } },
    returns = { { name = "level", type = "number", canBeSecret = false } },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_LFGList.GetLfgCategoryInfo"] = {
    key = "C_LFGList.GetLfgCategoryInfo",
    name = "GetLfgCategoryInfo",
    category = "combat_midnight",
    subcategory = "c_lfglist",
    func = _G["C_LFGList"] and _G["C_LFGList"]["GetLfgCategoryInfo"],
    funcPath = "C_LFGList.GetLfgCategoryInfo",
    params = { { name = "categoryID", type = "number", default = nil } },
    returns = { { name = "categoryData", type = "LfgCategoryData", canBeSecret = false } },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_LFGList.GetOwnedKeystoneActivityAndGroupAndLevel"] = {
    key = "C_LFGList.GetOwnedKeystoneActivityAndGroupAndLevel",
    name = "GetOwnedKeystoneActivityAndGroupAndLevel",
    category = "combat_midnight",
    subcategory = "c_lfglist",
    func = _G["C_LFGList"] and _G["C_LFGList"]["GetOwnedKeystoneActivityAndGroupAndLevel"],
    funcPath = "C_LFGList.GetOwnedKeystoneActivityAndGroupAndLevel",
    params = { { name = "getTimewalking", type = "bool", default = false } },
    returns = { { name = "activityID", type = "number", canBeSecret = false }, { name = "groupID", type = "number", canBeSecret = false }, { name = "keystoneLevel", type = "number", canBeSecret = false } },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_LFGList.GetPlaystyleString"] = {
    key = "C_LFGList.GetPlaystyleString",
    name = "GetPlaystyleString",
    category = "combat_midnight",
    subcategory = "c_lfglist",
    func = _G["C_LFGList"] and _G["C_LFGList"]["GetPlaystyleString"],
    funcPath = "C_LFGList.GetPlaystyleString",
    params = { { name = "playstyle", type = "LFGEntryPlaystyle", default = nil }, { name = "generalPlaystyle", type = "LFGEntryGeneralPlaystyle", default = nil }, { name = "activityInfo", type = "GroupFinderActivityInfo", default = nil } },
    returns = { { name = "playstyleString", type = "string", canBeSecret = false } },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_LFGList.GetPremadeGroupFinderStyle"] = {
    key = "C_LFGList.GetPremadeGroupFinderStyle",
    name = "GetPremadeGroupFinderStyle",
    category = "general",
    subcategory = "c_lfglist",
    func = _G["C_LFGList"] and _G["C_LFGList"]["GetPremadeGroupFinderStyle"],
    funcPath = "C_LFGList.GetPremadeGroupFinderStyle",
    params = {  },
    returns = { { name = "style", type = "PremadeGroupFinderStyle", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["C_LFGList.GetSearchResultInfo"] = {
    key = "C_LFGList.GetSearchResultInfo",
    name = "GetSearchResultInfo",
    category = "combat_midnight",
    subcategory = "c_lfglist",
    func = _G["C_LFGList"] and _G["C_LFGList"]["GetSearchResultInfo"],
    funcPath = "C_LFGList.GetSearchResultInfo",
    params = { { name = "searchResultID", type = "number", default = nil } },
    returns = { { name = "searchResultData", type = "LfgSearchResultData", canBeSecret = false } },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_LFGList.GetSearchResultLeaderInfo"] = {
    key = "C_LFGList.GetSearchResultLeaderInfo",
    name = "GetSearchResultLeaderInfo",
    category = "combat_midnight",
    subcategory = "c_lfglist",
    func = _G["C_LFGList"] and _G["C_LFGList"]["GetSearchResultLeaderInfo"],
    funcPath = "C_LFGList.GetSearchResultLeaderInfo",
    params = { { name = "searchResultID", type = "number", default = nil } },
    returns = { { name = "leaderInfo", type = "LfgSearchResultPlayerInfo", canBeSecret = false } },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_LFGList.GetSearchResultPlayerInfo"] = {
    key = "C_LFGList.GetSearchResultPlayerInfo",
    name = "GetSearchResultPlayerInfo",
    category = "combat_midnight",
    subcategory = "c_lfglist",
    func = _G["C_LFGList"] and _G["C_LFGList"]["GetSearchResultPlayerInfo"],
    funcPath = "C_LFGList.GetSearchResultPlayerInfo",
    params = { { name = "searchResultID", type = "number", default = nil }, { name = "memberIndex", type = "luaIndex", default = nil } },
    returns = { { name = "playerInfo", type = "LfgSearchResultPlayerInfo", canBeSecret = false } },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_LFGList.GetSearchResults"] = {
    key = "C_LFGList.GetSearchResults",
    name = "GetSearchResults",
    category = "general",
    subcategory = "c_lfglist",
    func = _G["C_LFGList"] and _G["C_LFGList"]["GetSearchResults"],
    funcPath = "C_LFGList.GetSearchResults",
    params = {  },
    returns = { { name = "totalResultsFound", type = "number", canBeSecret = false }, { name = "results", type = "table", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["C_LFGList.HasActiveEntryInfo"] = {
    key = "C_LFGList.HasActiveEntryInfo",
    name = "HasActiveEntryInfo",
    category = "general",
    subcategory = "c_lfglist",
    func = _G["C_LFGList"] and _G["C_LFGList"]["HasActiveEntryInfo"],
    funcPath = "C_LFGList.HasActiveEntryInfo",
    params = {  },
    returns = { { name = "hasActiveEntryInfo", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["C_LFGList.HasSearchResultInfo"] = {
    key = "C_LFGList.HasSearchResultInfo",
    name = "HasSearchResultInfo",
    category = "combat_midnight",
    subcategory = "c_lfglist",
    func = _G["C_LFGList"] and _G["C_LFGList"]["HasSearchResultInfo"],
    funcPath = "C_LFGList.HasSearchResultInfo",
    params = { { name = "searchResultID", type = "number", default = nil } },
    returns = { { name = "hasSearchResultInfo", type = "bool", canBeSecret = false } },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_LFGList.IsPlayerAuthenticatedForLFG"] = {
    key = "C_LFGList.IsPlayerAuthenticatedForLFG",
    name = "IsPlayerAuthenticatedForLFG",
    category = "combat_midnight",
    subcategory = "c_lfglist",
    func = _G["C_LFGList"] and _G["C_LFGList"]["IsPlayerAuthenticatedForLFG"],
    funcPath = "C_LFGList.IsPlayerAuthenticatedForLFG",
    params = { { name = "activityCategoryID", type = "number", default = nil } },
    returns = { { name = "isAuthenticated", type = "bool", canBeSecret = false } },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_LFGList.IsPremadeGroupFinderEnabled"] = {
    key = "C_LFGList.IsPremadeGroupFinderEnabled",
    name = "IsPremadeGroupFinderEnabled",
    category = "general",
    subcategory = "c_lfglist",
    func = _G["C_LFGList"] and _G["C_LFGList"]["IsPremadeGroupFinderEnabled"],
    funcPath = "C_LFGList.IsPremadeGroupFinderEnabled",
    params = {  },
    returns = { { name = "enabled", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["C_LFGList.ReportGroupAsAdvertisement"] = {
    key = "C_LFGList.ReportGroupAsAdvertisement",
    name = "ReportGroupAsAdvertisement",
    category = "combat_midnight",
    subcategory = "c_lfglist",
    func = _G["C_LFGList"] and _G["C_LFGList"]["ReportGroupAsAdvertisement"],
    funcPath = "C_LFGList.ReportGroupAsAdvertisement",
    params = { { name = "searchResultID", type = "number", default = nil } },
    returns = {  },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_LFGList.SaveAdvancedFilter"] = {
    key = "C_LFGList.SaveAdvancedFilter",
    name = "SaveAdvancedFilter",
    category = "combat_midnight",
    subcategory = "c_lfglist",
    func = _G["C_LFGList"] and _G["C_LFGList"]["SaveAdvancedFilter"],
    funcPath = "C_LFGList.SaveAdvancedFilter",
    params = { { name = "options", type = "AdvancedFilterOptions", default = nil } },
    returns = {  },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_LFGList.Search"] = {
    key = "C_LFGList.Search",
    name = "Search",
    category = "combat_midnight",
    subcategory = "c_lfglist",
    func = _G["C_LFGList"] and _G["C_LFGList"]["Search"],
    funcPath = "C_LFGList.Search",
    params = { { name = "categoryID", type = "number", default = nil }, { name = "filter", type = "number", default = 0 }, { name = "preferredFilters", type = "number", default = 0 }, { name = "languageFilter", type = "WowLocale", default = nil }, { name = "searchCrossFactionListings", type = "bool", default = false }, { name = "advancedFilter", type = "AdvancedFilterOptions", default = nil }, { name = "activityIDsFilter", type = "table", default = nil } },
    returns = {  },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_LFGList.SetEntryTitle"] = {
    key = "C_LFGList.SetEntryTitle",
    name = "SetEntryTitle",
    category = "combat_midnight",
    subcategory = "c_lfglist",
    func = _G["C_LFGList"] and _G["C_LFGList"]["SetEntryTitle"],
    funcPath = "C_LFGList.SetEntryTitle",
    params = { { name = "activityID", type = "number", default = nil }, { name = "groupID", type = "number", default = nil }, { name = "playstyle", type = "LFGEntryPlaystyle", default = nil }, { name = "generalPlaystyle", type = "LFGEntryGeneralPlaystyle", default = nil } },
    returns = {  },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_LFGList.SetSearchToActivity"] = {
    key = "C_LFGList.SetSearchToActivity",
    name = "SetSearchToActivity",
    category = "combat_midnight",
    subcategory = "c_lfglist",
    func = _G["C_LFGList"] and _G["C_LFGList"]["SetSearchToActivity"],
    funcPath = "C_LFGList.SetSearchToActivity",
    params = { { name = "activityID", type = "number", default = nil } },
    returns = {  },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_LFGList.SetSearchToQuestID"] = {
    key = "C_LFGList.SetSearchToQuestID",
    name = "SetSearchToQuestID",
    category = "combat_midnight",
    subcategory = "c_lfglist",
    func = _G["C_LFGList"] and _G["C_LFGList"]["SetSearchToQuestID"],
    funcPath = "C_LFGList.SetSearchToQuestID",
    params = { { name = "questID", type = "number", default = nil } },
    returns = {  },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_LFGList.SetSearchToScenarioID"] = {
    key = "C_LFGList.SetSearchToScenarioID",
    name = "SetSearchToScenarioID",
    category = "combat_midnight",
    subcategory = "c_lfglist",
    func = _G["C_LFGList"] and _G["C_LFGList"]["SetSearchToScenarioID"],
    funcPath = "C_LFGList.SetSearchToScenarioID",
    params = { { name = "scenarioID", type = "number", default = nil } },
    returns = {  },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_LFGList.UpdateListing"] = {
    key = "C_LFGList.UpdateListing",
    name = "UpdateListing",
    category = "combat_midnight",
    subcategory = "c_lfglist",
    func = _G["C_LFGList"] and _G["C_LFGList"]["UpdateListing"],
    funcPath = "C_LFGList.UpdateListing",
    params = { { name = "createData", type = "LfgListingCreateData", default = nil } },
    returns = { { name = "success", type = "bool", canBeSecret = false } },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_LFGList.ValidateRequiredDungeonScore"] = {
    key = "C_LFGList.ValidateRequiredDungeonScore",
    name = "ValidateRequiredDungeonScore",
    category = "combat_midnight",
    subcategory = "c_lfglist",
    func = _G["C_LFGList"] and _G["C_LFGList"]["ValidateRequiredDungeonScore"],
    funcPath = "C_LFGList.ValidateRequiredDungeonScore",
    params = { { name = "dungeonScore", type = "number", default = nil } },
    returns = { { name = "passes", type = "bool", canBeSecret = false } },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_LFGList.ValidateRequiredPvpRatingForActivity"] = {
    key = "C_LFGList.ValidateRequiredPvpRatingForActivity",
    name = "ValidateRequiredPvpRatingForActivity",
    category = "combat_midnight",
    subcategory = "c_lfglist",
    func = _G["C_LFGList"] and _G["C_LFGList"]["ValidateRequiredPvpRatingForActivity"],
    funcPath = "C_LFGList.ValidateRequiredPvpRatingForActivity",
    params = { { name = "activityID", type = "number", default = nil }, { name = "rating", type = "number", default = nil } },
    returns = { { name = "passes", type = "bool", canBeSecret = false } },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}
