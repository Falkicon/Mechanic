-- Generated APIDefinitions for namespace: C_ClubFinder
local _, ns = ...
local APIDefs = ns.APIDefinitions

APIDefs["C_ClubFinder.ApplicantAcceptClubInvite"] = {
    key = "C_ClubFinder.ApplicantAcceptClubInvite",
    name = "ApplicantAcceptClubInvite",
    category = "social",
    subcategory = "c_clubfinder",
    funcPath = "C_ClubFinder.ApplicantAcceptClubInvite",
    params = { { name = "clubFinderGUID", type = "WOWGUID", default = nil } },
    returns = {  },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_ClubFinder.ApplicantDeclineClubInvite"] = {
    key = "C_ClubFinder.ApplicantDeclineClubInvite",
    name = "ApplicantDeclineClubInvite",
    category = "social",
    subcategory = "c_clubfinder",
    funcPath = "C_ClubFinder.ApplicantDeclineClubInvite",
    params = { { name = "clubFinderGUID", type = "WOWGUID", default = nil } },
    returns = {  },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_ClubFinder.CancelMembershipRequest"] = {
    key = "C_ClubFinder.CancelMembershipRequest",
    name = "CancelMembershipRequest",
    category = "social",
    subcategory = "c_clubfinder",
    funcPath = "C_ClubFinder.CancelMembershipRequest",
    params = { { name = "clubFinderGUID", type = "WOWGUID", default = nil } },
    returns = {  },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_ClubFinder.CheckAllPlayerApplicantSettings"] = {
    key = "C_ClubFinder.CheckAllPlayerApplicantSettings",
    name = "CheckAllPlayerApplicantSettings",
    category = "social",
    subcategory = "c_clubfinder",
    funcPath = "C_ClubFinder.CheckAllPlayerApplicantSettings",
    params = {  },
    returns = {  },
    midnightImpact = "NORMAL",
}

APIDefs["C_ClubFinder.ClearAllFinderCache"] = {
    key = "C_ClubFinder.ClearAllFinderCache",
    name = "ClearAllFinderCache",
    category = "social",
    subcategory = "c_clubfinder",
    funcPath = "C_ClubFinder.ClearAllFinderCache",
    params = {  },
    returns = {  },
    midnightImpact = "NORMAL",
}

APIDefs["C_ClubFinder.ClearClubApplicantsCache"] = {
    key = "C_ClubFinder.ClearClubApplicantsCache",
    name = "ClearClubApplicantsCache",
    category = "social",
    subcategory = "c_clubfinder",
    funcPath = "C_ClubFinder.ClearClubApplicantsCache",
    params = {  },
    returns = {  },
    midnightImpact = "NORMAL",
}

APIDefs["C_ClubFinder.ClearClubFinderPostingsCache"] = {
    key = "C_ClubFinder.ClearClubFinderPostingsCache",
    name = "ClearClubFinderPostingsCache",
    category = "social",
    subcategory = "c_clubfinder",
    funcPath = "C_ClubFinder.ClearClubFinderPostingsCache",
    params = {  },
    returns = {  },
    midnightImpact = "NORMAL",
}

APIDefs["C_ClubFinder.DoesPlayerBelongToClubFromClubGUID"] = {
    key = "C_ClubFinder.DoesPlayerBelongToClubFromClubGUID",
    name = "DoesPlayerBelongToClubFromClubGUID",
    category = "social",
    subcategory = "c_clubfinder",
    funcPath = "C_ClubFinder.DoesPlayerBelongToClubFromClubGUID",
    params = { { name = "clubFinderGUID", type = "WOWGUID", default = nil } },
    returns = { { name = "belongsToClub", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_ClubFinder.GetClubFinderDisableReason"] = {
    key = "C_ClubFinder.GetClubFinderDisableReason",
    name = "GetClubFinderDisableReason",
    category = "social",
    subcategory = "c_clubfinder",
    funcPath = "C_ClubFinder.GetClubFinderDisableReason",
    params = {  },
    returns = { { name = "disableReason", type = "ClubFinderDisableReason", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["C_ClubFinder.GetClubRecruitmentSettings"] = {
    key = "C_ClubFinder.GetClubRecruitmentSettings",
    name = "GetClubRecruitmentSettings",
    category = "social",
    subcategory = "c_clubfinder",
    funcPath = "C_ClubFinder.GetClubRecruitmentSettings",
    params = {  },
    returns = { { name = "settings", type = "ClubSettingsInfo", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["C_ClubFinder.GetClubTypeFromFinderGUID"] = {
    key = "C_ClubFinder.GetClubTypeFromFinderGUID",
    name = "GetClubTypeFromFinderGUID",
    category = "social",
    subcategory = "c_clubfinder",
    funcPath = "C_ClubFinder.GetClubTypeFromFinderGUID",
    params = { { name = "clubFinderGUID", type = "WOWGUID", default = nil } },
    returns = { { name = "clubType", type = "ClubFinderRequestType", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_ClubFinder.GetFocusIndexFromFlag"] = {
    key = "C_ClubFinder.GetFocusIndexFromFlag",
    name = "GetFocusIndexFromFlag",
    category = "social",
    subcategory = "c_clubfinder",
    funcPath = "C_ClubFinder.GetFocusIndexFromFlag",
    params = { { name = "flags", type = "number", default = nil } },
    returns = { { name = "index", type = "number", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_ClubFinder.GetPlayerApplicantLocaleFlags"] = {
    key = "C_ClubFinder.GetPlayerApplicantLocaleFlags",
    name = "GetPlayerApplicantLocaleFlags",
    category = "social",
    subcategory = "c_clubfinder",
    funcPath = "C_ClubFinder.GetPlayerApplicantLocaleFlags",
    params = {  },
    returns = { { name = "localeFlags", type = "number", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["C_ClubFinder.GetPlayerApplicantSettings"] = {
    key = "C_ClubFinder.GetPlayerApplicantSettings",
    name = "GetPlayerApplicantSettings",
    category = "social",
    subcategory = "c_clubfinder",
    funcPath = "C_ClubFinder.GetPlayerApplicantSettings",
    params = {  },
    returns = { { name = "settings", type = "ClubSettingsInfo", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["C_ClubFinder.GetPlayerClubApplicationStatus"] = {
    key = "C_ClubFinder.GetPlayerClubApplicationStatus",
    name = "GetPlayerClubApplicationStatus",
    category = "social",
    subcategory = "c_clubfinder",
    funcPath = "C_ClubFinder.GetPlayerClubApplicationStatus",
    params = { { name = "clubFinderGUID", type = "WOWGUID", default = nil } },
    returns = { { name = "clubStatus", type = "PlayerClubRequestStatus", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_ClubFinder.GetPlayerSettingsFocusFlagsSelectedCount"] = {
    key = "C_ClubFinder.GetPlayerSettingsFocusFlagsSelectedCount",
    name = "GetPlayerSettingsFocusFlagsSelectedCount",
    category = "social",
    subcategory = "c_clubfinder",
    funcPath = "C_ClubFinder.GetPlayerSettingsFocusFlagsSelectedCount",
    params = {  },
    returns = { { name = "focusCount", type = "number", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["C_ClubFinder.GetPostingIDFromClubFinderGUID"] = {
    key = "C_ClubFinder.GetPostingIDFromClubFinderGUID",
    name = "GetPostingIDFromClubFinderGUID",
    category = "social",
    subcategory = "c_clubfinder",
    funcPath = "C_ClubFinder.GetPostingIDFromClubFinderGUID",
    params = { { name = "clubFinderGUID", type = "WOWGUID", default = nil } },
    returns = { { name = "postingID", type = "number", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_ClubFinder.GetRecruitingClubInfoFromClubID"] = {
    key = "C_ClubFinder.GetRecruitingClubInfoFromClubID",
    name = "GetRecruitingClubInfoFromClubID",
    category = "social",
    subcategory = "c_clubfinder",
    funcPath = "C_ClubFinder.GetRecruitingClubInfoFromClubID",
    params = { { name = "clubId", type = "ClubId", default = nil } },
    returns = { { name = "clubInfo", type = "RecruitingClubInfo", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_ClubFinder.GetRecruitingClubInfoFromFinderGUID"] = {
    key = "C_ClubFinder.GetRecruitingClubInfoFromFinderGUID",
    name = "GetRecruitingClubInfoFromFinderGUID",
    category = "social",
    subcategory = "c_clubfinder",
    funcPath = "C_ClubFinder.GetRecruitingClubInfoFromFinderGUID",
    params = { { name = "clubFinderGUID", type = "WOWGUID", default = nil } },
    returns = { { name = "clubInfo", type = "RecruitingClubInfo", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_ClubFinder.GetStatusOfPostingFromClubId"] = {
    key = "C_ClubFinder.GetStatusOfPostingFromClubId",
    name = "GetStatusOfPostingFromClubId",
    category = "social",
    subcategory = "c_clubfinder",
    funcPath = "C_ClubFinder.GetStatusOfPostingFromClubId",
    params = { { name = "postingID", type = "ClubId", default = nil } },
    returns = { { name = "postingFlags", type = "table", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_ClubFinder.GetTotalMatchingCommunityListSize"] = {
    key = "C_ClubFinder.GetTotalMatchingCommunityListSize",
    name = "GetTotalMatchingCommunityListSize",
    category = "social",
    subcategory = "c_clubfinder",
    funcPath = "C_ClubFinder.GetTotalMatchingCommunityListSize",
    params = {  },
    returns = { { name = "totalSize", type = "number", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["C_ClubFinder.GetTotalMatchingGuildListSize"] = {
    key = "C_ClubFinder.GetTotalMatchingGuildListSize",
    name = "GetTotalMatchingGuildListSize",
    category = "social",
    subcategory = "c_clubfinder",
    funcPath = "C_ClubFinder.GetTotalMatchingGuildListSize",
    params = {  },
    returns = { { name = "totalSize", type = "number", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["C_ClubFinder.HasAlreadyAppliedToLinkedPosting"] = {
    key = "C_ClubFinder.HasAlreadyAppliedToLinkedPosting",
    name = "HasAlreadyAppliedToLinkedPosting",
    category = "social",
    subcategory = "c_clubfinder",
    funcPath = "C_ClubFinder.HasAlreadyAppliedToLinkedPosting",
    params = { { name = "clubFinderGUID", type = "WOWGUID", default = nil } },
    returns = { { name = "hasAlreadyApplied", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_ClubFinder.HasPostingBeenDelisted"] = {
    key = "C_ClubFinder.HasPostingBeenDelisted",
    name = "HasPostingBeenDelisted",
    category = "social",
    subcategory = "c_clubfinder",
    funcPath = "C_ClubFinder.HasPostingBeenDelisted",
    params = { { name = "postingID", type = "ClubId", default = nil } },
    returns = { { name = "postingDelisted", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_ClubFinder.IsCommunityFinderEnabled"] = {
    key = "C_ClubFinder.IsCommunityFinderEnabled",
    name = "IsCommunityFinderEnabled",
    category = "social",
    subcategory = "c_clubfinder",
    funcPath = "C_ClubFinder.IsCommunityFinderEnabled",
    params = {  },
    returns = { { name = "isEnabled", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["C_ClubFinder.IsEnabled"] = {
    key = "C_ClubFinder.IsEnabled",
    name = "IsEnabled",
    category = "social",
    subcategory = "c_clubfinder",
    funcPath = "C_ClubFinder.IsEnabled",
    params = {  },
    returns = { { name = "isEnabled", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["C_ClubFinder.IsListingEnabledFromFlags"] = {
    key = "C_ClubFinder.IsListingEnabledFromFlags",
    name = "IsListingEnabledFromFlags",
    category = "social",
    subcategory = "c_clubfinder",
    funcPath = "C_ClubFinder.IsListingEnabledFromFlags",
    params = { { name = "flags", type = "number", default = nil } },
    returns = { { name = "isListed", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_ClubFinder.IsPostingBanned"] = {
    key = "C_ClubFinder.IsPostingBanned",
    name = "IsPostingBanned",
    category = "social",
    subcategory = "c_clubfinder",
    funcPath = "C_ClubFinder.IsPostingBanned",
    params = { { name = "postingID", type = "ClubId", default = nil } },
    returns = { { name = "postingBanned", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_ClubFinder.IsValidSearchString"] = {
    key = "C_ClubFinder.IsValidSearchString",
    name = "IsValidSearchString",
    category = "social",
    subcategory = "c_clubfinder",
    funcPath = "C_ClubFinder.IsValidSearchString",
    params = { { name = "name", type = "cstring", default = nil } },
    returns = { { name = "isApproved", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_ClubFinder.LookupClubPostingFromClubFinderGUID"] = {
    key = "C_ClubFinder.LookupClubPostingFromClubFinderGUID",
    name = "LookupClubPostingFromClubFinderGUID",
    category = "social",
    subcategory = "c_clubfinder",
    funcPath = "C_ClubFinder.LookupClubPostingFromClubFinderGUID",
    params = { { name = "clubFinderGUID", type = "WOWGUID", default = nil }, { name = "isLinkedPosting", type = "bool", default = nil } },
    returns = {  },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_ClubFinder.PlayerGetClubInvitationList"] = {
    key = "C_ClubFinder.PlayerGetClubInvitationList",
    name = "PlayerGetClubInvitationList",
    category = "social",
    subcategory = "c_clubfinder",
    funcPath = "C_ClubFinder.PlayerGetClubInvitationList",
    params = {  },
    returns = { { name = "inviteList", type = "table", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["C_ClubFinder.PlayerRequestPendingClubsList"] = {
    key = "C_ClubFinder.PlayerRequestPendingClubsList",
    name = "PlayerRequestPendingClubsList",
    category = "social",
    subcategory = "c_clubfinder",
    funcPath = "C_ClubFinder.PlayerRequestPendingClubsList",
    params = { { name = "type", type = "ClubFinderRequestType", default = nil } },
    returns = {  },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_ClubFinder.PlayerReturnPendingCommunitiesList"] = {
    key = "C_ClubFinder.PlayerReturnPendingCommunitiesList",
    name = "PlayerReturnPendingCommunitiesList",
    category = "social",
    subcategory = "c_clubfinder",
    funcPath = "C_ClubFinder.PlayerReturnPendingCommunitiesList",
    params = {  },
    returns = { { name = "info", type = "table", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["C_ClubFinder.PlayerReturnPendingGuildsList"] = {
    key = "C_ClubFinder.PlayerReturnPendingGuildsList",
    name = "PlayerReturnPendingGuildsList",
    category = "social",
    subcategory = "c_clubfinder",
    funcPath = "C_ClubFinder.PlayerReturnPendingGuildsList",
    params = {  },
    returns = { { name = "info", type = "table", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["C_ClubFinder.PostClub"] = {
    key = "C_ClubFinder.PostClub",
    name = "PostClub",
    category = "social",
    subcategory = "c_clubfinder",
    funcPath = "C_ClubFinder.PostClub",
    params = { { name = "clubId", type = "ClubId", default = nil }, { name = "itemLevelRequirement", type = "number", default = nil }, { name = "name", type = "string", default = nil }, { name = "description", type = "string", default = nil }, { name = "avatarId", type = "number", default = nil }, { name = "specs", type = "table", default = nil }, { name = "type", type = "ClubFinderRequestType", default = nil }, { name = "crossFaction", type = "bool", default = false } },
    returns = { { name = "succesful", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_ClubFinder.RequestApplicantList"] = {
    key = "C_ClubFinder.RequestApplicantList",
    name = "RequestApplicantList",
    category = "social",
    subcategory = "c_clubfinder",
    funcPath = "C_ClubFinder.RequestApplicantList",
    params = { { name = "type", type = "ClubFinderRequestType", default = nil } },
    returns = {  },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_ClubFinder.RequestClubsList"] = {
    key = "C_ClubFinder.RequestClubsList",
    name = "RequestClubsList",
    category = "social",
    subcategory = "c_clubfinder",
    funcPath = "C_ClubFinder.RequestClubsList",
    params = { { name = "guildListRequested", type = "bool", default = nil }, { name = "searchString", type = "string", default = nil }, { name = "specIDs", type = "table", default = nil } },
    returns = {  },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_ClubFinder.RequestMembershipToClub"] = {
    key = "C_ClubFinder.RequestMembershipToClub",
    name = "RequestMembershipToClub",
    category = "social",
    subcategory = "c_clubfinder",
    funcPath = "C_ClubFinder.RequestMembershipToClub",
    params = { { name = "clubFinderGUID", type = "WOWGUID", default = nil }, { name = "comment", type = "string", default = nil }, { name = "specIDs", type = "table", default = nil } },
    returns = {  },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_ClubFinder.RequestNextCommunityPage"] = {
    key = "C_ClubFinder.RequestNextCommunityPage",
    name = "RequestNextCommunityPage",
    category = "social",
    subcategory = "c_clubfinder",
    funcPath = "C_ClubFinder.RequestNextCommunityPage",
    params = { { name = "startingIndex", type = "number", default = nil }, { name = "pageSize", type = "number", default = nil } },
    returns = {  },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_ClubFinder.RequestNextGuildPage"] = {
    key = "C_ClubFinder.RequestNextGuildPage",
    name = "RequestNextGuildPage",
    category = "social",
    subcategory = "c_clubfinder",
    funcPath = "C_ClubFinder.RequestNextGuildPage",
    params = { { name = "startingIndex", type = "number", default = nil }, { name = "pageSize", type = "number", default = nil } },
    returns = {  },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_ClubFinder.RequestPostingInformationFromClubId"] = {
    key = "C_ClubFinder.RequestPostingInformationFromClubId",
    name = "RequestPostingInformationFromClubId",
    category = "social",
    subcategory = "c_clubfinder",
    funcPath = "C_ClubFinder.RequestPostingInformationFromClubId",
    params = { { name = "clubId", type = "ClubId", default = nil } },
    returns = { { name = "success", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_ClubFinder.RequestSubscribedClubPostingIDs"] = {
    key = "C_ClubFinder.RequestSubscribedClubPostingIDs",
    name = "RequestSubscribedClubPostingIDs",
    category = "social",
    subcategory = "c_clubfinder",
    funcPath = "C_ClubFinder.RequestSubscribedClubPostingIDs",
    params = {  },
    returns = {  },
    midnightImpact = "NORMAL",
}

APIDefs["C_ClubFinder.ResetClubPostingMapCache"] = {
    key = "C_ClubFinder.ResetClubPostingMapCache",
    name = "ResetClubPostingMapCache",
    category = "social",
    subcategory = "c_clubfinder",
    funcPath = "C_ClubFinder.ResetClubPostingMapCache",
    params = {  },
    returns = {  },
    midnightImpact = "NORMAL",
}

APIDefs["C_ClubFinder.RespondToApplicant"] = {
    key = "C_ClubFinder.RespondToApplicant",
    name = "RespondToApplicant",
    category = "social",
    subcategory = "c_clubfinder",
    funcPath = "C_ClubFinder.RespondToApplicant",
    params = { { name = "clubFinderGUID", type = "WOWGUID", default = nil }, { name = "playerGUID", type = "WOWGUID", default = nil }, { name = "shouldAccept", type = "bool", default = nil }, { name = "requestType", type = "ClubFinderRequestType", default = nil }, { name = "playerName", type = "string", default = nil }, { name = "forceAccept", type = "bool", default = nil }, { name = "reported", type = "bool", default = nil } },
    returns = {  },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_ClubFinder.ReturnClubApplicantList"] = {
    key = "C_ClubFinder.ReturnClubApplicantList",
    name = "ReturnClubApplicantList",
    category = "social",
    subcategory = "c_clubfinder",
    funcPath = "C_ClubFinder.ReturnClubApplicantList",
    params = { { name = "clubId", type = "ClubId", default = nil } },
    returns = { { name = "info", type = "table", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_ClubFinder.ReturnMatchingCommunityList"] = {
    key = "C_ClubFinder.ReturnMatchingCommunityList",
    name = "ReturnMatchingCommunityList",
    category = "social",
    subcategory = "c_clubfinder",
    funcPath = "C_ClubFinder.ReturnMatchingCommunityList",
    params = {  },
    returns = { { name = "recruitingClubs", type = "table", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["C_ClubFinder.ReturnMatchingGuildList"] = {
    key = "C_ClubFinder.ReturnMatchingGuildList",
    name = "ReturnMatchingGuildList",
    category = "social",
    subcategory = "c_clubfinder",
    funcPath = "C_ClubFinder.ReturnMatchingGuildList",
    params = {  },
    returns = { { name = "recruitingClubs", type = "table", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["C_ClubFinder.ReturnPendingClubApplicantList"] = {
    key = "C_ClubFinder.ReturnPendingClubApplicantList",
    name = "ReturnPendingClubApplicantList",
    category = "social",
    subcategory = "c_clubfinder",
    funcPath = "C_ClubFinder.ReturnPendingClubApplicantList",
    params = { { name = "clubId", type = "ClubId", default = nil } },
    returns = { { name = "info", type = "table", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_ClubFinder.SendChatWhisper"] = {
    key = "C_ClubFinder.SendChatWhisper",
    name = "SendChatWhisper",
    category = "social",
    subcategory = "c_clubfinder",
    funcPath = "C_ClubFinder.SendChatWhisper",
    params = { { name = "clubFinderGUID", type = "WOWGUID", default = nil }, { name = "playerGUID", type = "WOWGUID", default = nil }, { name = "applicantType", type = "ClubFinderRequestType", default = nil }, { name = "name", type = "string", default = nil } },
    returns = {  },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_ClubFinder.SetAllRecruitmentSettings"] = {
    key = "C_ClubFinder.SetAllRecruitmentSettings",
    name = "SetAllRecruitmentSettings",
    category = "social",
    subcategory = "c_clubfinder",
    funcPath = "C_ClubFinder.SetAllRecruitmentSettings",
    params = { { name = "value", type = "number", default = nil } },
    returns = {  },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_ClubFinder.SetPlayerApplicantLocaleFlags"] = {
    key = "C_ClubFinder.SetPlayerApplicantLocaleFlags",
    name = "SetPlayerApplicantLocaleFlags",
    category = "social",
    subcategory = "c_clubfinder",
    funcPath = "C_ClubFinder.SetPlayerApplicantLocaleFlags",
    params = { { name = "localeFlags", type = "number", default = nil } },
    returns = {  },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_ClubFinder.SetPlayerApplicantSettings"] = {
    key = "C_ClubFinder.SetPlayerApplicantSettings",
    name = "SetPlayerApplicantSettings",
    category = "social",
    subcategory = "c_clubfinder",
    funcPath = "C_ClubFinder.SetPlayerApplicantSettings",
    params = { { name = "index", type = "number", default = nil }, { name = "checked", type = "bool", default = nil } },
    returns = {  },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_ClubFinder.SetRecruitmentLocale"] = {
    key = "C_ClubFinder.SetRecruitmentLocale",
    name = "SetRecruitmentLocale",
    category = "social",
    subcategory = "c_clubfinder",
    funcPath = "C_ClubFinder.SetRecruitmentLocale",
    params = { { name = "locale", type = "number", default = nil } },
    returns = {  },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_ClubFinder.SetRecruitmentSettings"] = {
    key = "C_ClubFinder.SetRecruitmentSettings",
    name = "SetRecruitmentSettings",
    category = "social",
    subcategory = "c_clubfinder",
    funcPath = "C_ClubFinder.SetRecruitmentSettings",
    params = { { name = "index", type = "number", default = nil }, { name = "checked", type = "bool", default = nil } },
    returns = {  },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_ClubFinder.ShouldShowClubFinder"] = {
    key = "C_ClubFinder.ShouldShowClubFinder",
    name = "ShouldShowClubFinder",
    category = "social",
    subcategory = "c_clubfinder",
    funcPath = "C_ClubFinder.ShouldShowClubFinder",
    params = {  },
    returns = { { name = "shouldShow", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
}
