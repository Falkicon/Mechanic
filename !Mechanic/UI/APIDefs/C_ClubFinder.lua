-- Generated APIDefinitions for namespace: C_ClubFinder
local _, ns = ...
local APIDefs = ns.APIDefinitions

APIDefs["C_ClubFinder.ApplicantAcceptClubInvite"] = {
	key = "C_ClubFinder.ApplicantAcceptClubInvite",
	name = "ApplicantAcceptClubInvite",
	category = "combat_midnight",
	subcategory = "c_clubfinder",
	func = _G["C_ClubFinder"] and _G["C_ClubFinder"]["ApplicantAcceptClubInvite"],
	funcPath = "C_ClubFinder.ApplicantAcceptClubInvite",
	params = { { name = "clubFinderGUID", type = "WOWGUID", default = nil } },
	returns = {},
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_ClubFinder.ApplicantDeclineClubInvite"] = {
	key = "C_ClubFinder.ApplicantDeclineClubInvite",
	name = "ApplicantDeclineClubInvite",
	category = "combat_midnight",
	subcategory = "c_clubfinder",
	func = _G["C_ClubFinder"] and _G["C_ClubFinder"]["ApplicantDeclineClubInvite"],
	funcPath = "C_ClubFinder.ApplicantDeclineClubInvite",
	params = { { name = "clubFinderGUID", type = "WOWGUID", default = nil } },
	returns = {},
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_ClubFinder.CancelMembershipRequest"] = {
	key = "C_ClubFinder.CancelMembershipRequest",
	name = "CancelMembershipRequest",
	category = "combat_midnight",
	subcategory = "c_clubfinder",
	func = _G["C_ClubFinder"] and _G["C_ClubFinder"]["CancelMembershipRequest"],
	funcPath = "C_ClubFinder.CancelMembershipRequest",
	params = { { name = "clubFinderGUID", type = "WOWGUID", default = nil } },
	returns = {},
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_ClubFinder.DoesPlayerBelongToClubFromClubGUID"] = {
	key = "C_ClubFinder.DoesPlayerBelongToClubFromClubGUID",
	name = "DoesPlayerBelongToClubFromClubGUID",
	category = "combat_midnight",
	subcategory = "c_clubfinder",
	func = _G["C_ClubFinder"] and _G["C_ClubFinder"]["DoesPlayerBelongToClubFromClubGUID"],
	funcPath = "C_ClubFinder.DoesPlayerBelongToClubFromClubGUID",
	params = { { name = "clubFinderGUID", type = "WOWGUID", default = nil } },
	returns = { { name = "belongsToClub", type = "bool", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_ClubFinder.GetClubTypeFromFinderGUID"] = {
	key = "C_ClubFinder.GetClubTypeFromFinderGUID",
	name = "GetClubTypeFromFinderGUID",
	category = "combat_midnight",
	subcategory = "c_clubfinder",
	func = _G["C_ClubFinder"] and _G["C_ClubFinder"]["GetClubTypeFromFinderGUID"],
	funcPath = "C_ClubFinder.GetClubTypeFromFinderGUID",
	params = { { name = "clubFinderGUID", type = "WOWGUID", default = nil } },
	returns = { { name = "clubType", type = "ClubFinderRequestType", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_ClubFinder.GetFocusIndexFromFlag"] = {
	key = "C_ClubFinder.GetFocusIndexFromFlag",
	name = "GetFocusIndexFromFlag",
	category = "combat_midnight",
	subcategory = "c_clubfinder",
	func = _G["C_ClubFinder"] and _G["C_ClubFinder"]["GetFocusIndexFromFlag"],
	funcPath = "C_ClubFinder.GetFocusIndexFromFlag",
	params = { { name = "flags", type = "number", default = nil } },
	returns = { { name = "index", type = "number", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_ClubFinder.GetPlayerClubApplicationStatus"] = {
	key = "C_ClubFinder.GetPlayerClubApplicationStatus",
	name = "GetPlayerClubApplicationStatus",
	category = "combat_midnight",
	subcategory = "c_clubfinder",
	func = _G["C_ClubFinder"] and _G["C_ClubFinder"]["GetPlayerClubApplicationStatus"],
	funcPath = "C_ClubFinder.GetPlayerClubApplicationStatus",
	params = { { name = "clubFinderGUID", type = "WOWGUID", default = nil } },
	returns = { { name = "clubStatus", type = "PlayerClubRequestStatus", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_ClubFinder.GetPostingIDFromClubFinderGUID"] = {
	key = "C_ClubFinder.GetPostingIDFromClubFinderGUID",
	name = "GetPostingIDFromClubFinderGUID",
	category = "combat_midnight",
	subcategory = "c_clubfinder",
	func = _G["C_ClubFinder"] and _G["C_ClubFinder"]["GetPostingIDFromClubFinderGUID"],
	funcPath = "C_ClubFinder.GetPostingIDFromClubFinderGUID",
	params = { { name = "clubFinderGUID", type = "WOWGUID", default = nil } },
	returns = { { name = "postingID", type = "number", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_ClubFinder.GetRecruitingClubInfoFromClubID"] = {
	key = "C_ClubFinder.GetRecruitingClubInfoFromClubID",
	name = "GetRecruitingClubInfoFromClubID",
	category = "combat_midnight",
	subcategory = "c_clubfinder",
	func = _G["C_ClubFinder"] and _G["C_ClubFinder"]["GetRecruitingClubInfoFromClubID"],
	funcPath = "C_ClubFinder.GetRecruitingClubInfoFromClubID",
	params = { { name = "clubId", type = "ClubId", default = nil } },
	returns = { { name = "clubInfo", type = "RecruitingClubInfo", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_ClubFinder.GetRecruitingClubInfoFromFinderGUID"] = {
	key = "C_ClubFinder.GetRecruitingClubInfoFromFinderGUID",
	name = "GetRecruitingClubInfoFromFinderGUID",
	category = "combat_midnight",
	subcategory = "c_clubfinder",
	func = _G["C_ClubFinder"] and _G["C_ClubFinder"]["GetRecruitingClubInfoFromFinderGUID"],
	funcPath = "C_ClubFinder.GetRecruitingClubInfoFromFinderGUID",
	params = { { name = "clubFinderGUID", type = "WOWGUID", default = nil } },
	returns = { { name = "clubInfo", type = "RecruitingClubInfo", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_ClubFinder.GetStatusOfPostingFromClubId"] = {
	key = "C_ClubFinder.GetStatusOfPostingFromClubId",
	name = "GetStatusOfPostingFromClubId",
	category = "combat_midnight",
	subcategory = "c_clubfinder",
	func = _G["C_ClubFinder"] and _G["C_ClubFinder"]["GetStatusOfPostingFromClubId"],
	funcPath = "C_ClubFinder.GetStatusOfPostingFromClubId",
	params = { { name = "postingID", type = "ClubId", default = nil } },
	returns = { { name = "postingFlags", type = "table", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_ClubFinder.HasAlreadyAppliedToLinkedPosting"] = {
	key = "C_ClubFinder.HasAlreadyAppliedToLinkedPosting",
	name = "HasAlreadyAppliedToLinkedPosting",
	category = "combat_midnight",
	subcategory = "c_clubfinder",
	func = _G["C_ClubFinder"] and _G["C_ClubFinder"]["HasAlreadyAppliedToLinkedPosting"],
	funcPath = "C_ClubFinder.HasAlreadyAppliedToLinkedPosting",
	params = { { name = "clubFinderGUID", type = "WOWGUID", default = nil } },
	returns = { { name = "hasAlreadyApplied", type = "bool", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_ClubFinder.HasPostingBeenDelisted"] = {
	key = "C_ClubFinder.HasPostingBeenDelisted",
	name = "HasPostingBeenDelisted",
	category = "combat_midnight",
	subcategory = "c_clubfinder",
	func = _G["C_ClubFinder"] and _G["C_ClubFinder"]["HasPostingBeenDelisted"],
	funcPath = "C_ClubFinder.HasPostingBeenDelisted",
	params = { { name = "postingID", type = "ClubId", default = nil } },
	returns = { { name = "postingDelisted", type = "bool", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_ClubFinder.IsListingEnabledFromFlags"] = {
	key = "C_ClubFinder.IsListingEnabledFromFlags",
	name = "IsListingEnabledFromFlags",
	category = "combat_midnight",
	subcategory = "c_clubfinder",
	func = _G["C_ClubFinder"] and _G["C_ClubFinder"]["IsListingEnabledFromFlags"],
	funcPath = "C_ClubFinder.IsListingEnabledFromFlags",
	params = { { name = "flags", type = "number", default = nil } },
	returns = { { name = "isListed", type = "bool", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_ClubFinder.IsPostingBanned"] = {
	key = "C_ClubFinder.IsPostingBanned",
	name = "IsPostingBanned",
	category = "combat_midnight",
	subcategory = "c_clubfinder",
	func = _G["C_ClubFinder"] and _G["C_ClubFinder"]["IsPostingBanned"],
	funcPath = "C_ClubFinder.IsPostingBanned",
	params = { { name = "postingID", type = "ClubId", default = nil } },
	returns = { { name = "postingBanned", type = "bool", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_ClubFinder.IsValidSearchString"] = {
	key = "C_ClubFinder.IsValidSearchString",
	name = "IsValidSearchString",
	category = "combat_midnight",
	subcategory = "c_clubfinder",
	func = _G["C_ClubFinder"] and _G["C_ClubFinder"]["IsValidSearchString"],
	funcPath = "C_ClubFinder.IsValidSearchString",
	params = { { name = "name", type = "cstring", default = nil } },
	returns = { { name = "isApproved", type = "bool", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_ClubFinder.LookupClubPostingFromClubFinderGUID"] = {
	key = "C_ClubFinder.LookupClubPostingFromClubFinderGUID",
	name = "LookupClubPostingFromClubFinderGUID",
	category = "combat_midnight",
	subcategory = "c_clubfinder",
	func = _G["C_ClubFinder"] and _G["C_ClubFinder"]["LookupClubPostingFromClubFinderGUID"],
	funcPath = "C_ClubFinder.LookupClubPostingFromClubFinderGUID",
	params = {
		{ name = "clubFinderGUID", type = "WOWGUID", default = nil },
		{ name = "isLinkedPosting", type = "bool", default = nil },
	},
	returns = {},
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_ClubFinder.PlayerRequestPendingClubsList"] = {
	key = "C_ClubFinder.PlayerRequestPendingClubsList",
	name = "PlayerRequestPendingClubsList",
	category = "combat_midnight",
	subcategory = "c_clubfinder",
	func = _G["C_ClubFinder"] and _G["C_ClubFinder"]["PlayerRequestPendingClubsList"],
	funcPath = "C_ClubFinder.PlayerRequestPendingClubsList",
	params = { { name = "type", type = "ClubFinderRequestType", default = nil } },
	returns = {},
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_ClubFinder.PostClub"] = {
	key = "C_ClubFinder.PostClub",
	name = "PostClub",
	category = "combat_midnight",
	subcategory = "c_clubfinder",
	func = _G["C_ClubFinder"] and _G["C_ClubFinder"]["PostClub"],
	funcPath = "C_ClubFinder.PostClub",
	params = {
		{ name = "clubId", type = "ClubId", default = nil },
		{ name = "itemLevelRequirement", type = "number", default = nil },
		{ name = "name", type = "string", default = nil },
		{ name = "description", type = "string", default = nil },
		{ name = "avatarId", type = "number", default = nil },
		{ name = "specs", type = "table", default = nil },
		{ name = "type", type = "ClubFinderRequestType", default = nil },
		{ name = "crossFaction", type = "bool", default = false },
	},
	returns = { { name = "succesful", type = "bool", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_ClubFinder.RequestApplicantList"] = {
	key = "C_ClubFinder.RequestApplicantList",
	name = "RequestApplicantList",
	category = "combat_midnight",
	subcategory = "c_clubfinder",
	func = _G["C_ClubFinder"] and _G["C_ClubFinder"]["RequestApplicantList"],
	funcPath = "C_ClubFinder.RequestApplicantList",
	params = { { name = "type", type = "ClubFinderRequestType", default = nil } },
	returns = {},
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_ClubFinder.RequestClubsList"] = {
	key = "C_ClubFinder.RequestClubsList",
	name = "RequestClubsList",
	category = "combat_midnight",
	subcategory = "c_clubfinder",
	func = _G["C_ClubFinder"] and _G["C_ClubFinder"]["RequestClubsList"],
	funcPath = "C_ClubFinder.RequestClubsList",
	params = {
		{ name = "guildListRequested", type = "bool", default = nil },
		{ name = "searchString", type = "string", default = nil },
		{ name = "specIDs", type = "table", default = nil },
	},
	returns = {},
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_ClubFinder.RequestMembershipToClub"] = {
	key = "C_ClubFinder.RequestMembershipToClub",
	name = "RequestMembershipToClub",
	category = "combat_midnight",
	subcategory = "c_clubfinder",
	func = _G["C_ClubFinder"] and _G["C_ClubFinder"]["RequestMembershipToClub"],
	funcPath = "C_ClubFinder.RequestMembershipToClub",
	params = {
		{ name = "clubFinderGUID", type = "WOWGUID", default = nil },
		{ name = "comment", type = "string", default = nil },
		{ name = "specIDs", type = "table", default = nil },
	},
	returns = {},
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_ClubFinder.RequestNextCommunityPage"] = {
	key = "C_ClubFinder.RequestNextCommunityPage",
	name = "RequestNextCommunityPage",
	category = "combat_midnight",
	subcategory = "c_clubfinder",
	func = _G["C_ClubFinder"] and _G["C_ClubFinder"]["RequestNextCommunityPage"],
	funcPath = "C_ClubFinder.RequestNextCommunityPage",
	params = {
		{ name = "startingIndex", type = "number", default = nil },
		{ name = "pageSize", type = "number", default = nil },
	},
	returns = {},
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_ClubFinder.RequestNextGuildPage"] = {
	key = "C_ClubFinder.RequestNextGuildPage",
	name = "RequestNextGuildPage",
	category = "combat_midnight",
	subcategory = "c_clubfinder",
	func = _G["C_ClubFinder"] and _G["C_ClubFinder"]["RequestNextGuildPage"],
	funcPath = "C_ClubFinder.RequestNextGuildPage",
	params = {
		{ name = "startingIndex", type = "number", default = nil },
		{ name = "pageSize", type = "number", default = nil },
	},
	returns = {},
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_ClubFinder.RequestPostingInformationFromClubId"] = {
	key = "C_ClubFinder.RequestPostingInformationFromClubId",
	name = "RequestPostingInformationFromClubId",
	category = "combat_midnight",
	subcategory = "c_clubfinder",
	func = _G["C_ClubFinder"] and _G["C_ClubFinder"]["RequestPostingInformationFromClubId"],
	funcPath = "C_ClubFinder.RequestPostingInformationFromClubId",
	params = { { name = "clubId", type = "ClubId", default = nil } },
	returns = { { name = "success", type = "bool", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_ClubFinder.RespondToApplicant"] = {
	key = "C_ClubFinder.RespondToApplicant",
	name = "RespondToApplicant",
	category = "combat_midnight",
	subcategory = "c_clubfinder",
	func = _G["C_ClubFinder"] and _G["C_ClubFinder"]["RespondToApplicant"],
	funcPath = "C_ClubFinder.RespondToApplicant",
	params = {
		{ name = "clubFinderGUID", type = "WOWGUID", default = nil },
		{ name = "playerGUID", type = "WOWGUID", default = nil },
		{ name = "shouldAccept", type = "bool", default = nil },
		{ name = "requestType", type = "ClubFinderRequestType", default = nil },
		{ name = "playerName", type = "string", default = nil },
		{ name = "forceAccept", type = "bool", default = nil },
		{ name = "reported", type = "bool", default = nil },
	},
	returns = {},
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_ClubFinder.ReturnClubApplicantList"] = {
	key = "C_ClubFinder.ReturnClubApplicantList",
	name = "ReturnClubApplicantList",
	category = "combat_midnight",
	subcategory = "c_clubfinder",
	func = _G["C_ClubFinder"] and _G["C_ClubFinder"]["ReturnClubApplicantList"],
	funcPath = "C_ClubFinder.ReturnClubApplicantList",
	params = { { name = "clubId", type = "ClubId", default = nil } },
	returns = { { name = "info", type = "table", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_ClubFinder.ReturnPendingClubApplicantList"] = {
	key = "C_ClubFinder.ReturnPendingClubApplicantList",
	name = "ReturnPendingClubApplicantList",
	category = "combat_midnight",
	subcategory = "c_clubfinder",
	func = _G["C_ClubFinder"] and _G["C_ClubFinder"]["ReturnPendingClubApplicantList"],
	funcPath = "C_ClubFinder.ReturnPendingClubApplicantList",
	params = { { name = "clubId", type = "ClubId", default = nil } },
	returns = { { name = "info", type = "table", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_ClubFinder.SendChatWhisper"] = {
	key = "C_ClubFinder.SendChatWhisper",
	name = "SendChatWhisper",
	category = "combat_midnight",
	subcategory = "c_clubfinder",
	func = _G["C_ClubFinder"] and _G["C_ClubFinder"]["SendChatWhisper"],
	funcPath = "C_ClubFinder.SendChatWhisper",
	params = {
		{ name = "clubFinderGUID", type = "WOWGUID", default = nil },
		{ name = "playerGUID", type = "WOWGUID", default = nil },
		{ name = "applicantType", type = "ClubFinderRequestType", default = nil },
		{ name = "name", type = "string", default = nil },
	},
	returns = {},
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_ClubFinder.SetAllRecruitmentSettings"] = {
	key = "C_ClubFinder.SetAllRecruitmentSettings",
	name = "SetAllRecruitmentSettings",
	category = "combat_midnight",
	subcategory = "c_clubfinder",
	func = _G["C_ClubFinder"] and _G["C_ClubFinder"]["SetAllRecruitmentSettings"],
	funcPath = "C_ClubFinder.SetAllRecruitmentSettings",
	params = { { name = "value", type = "number", default = nil } },
	returns = {},
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_ClubFinder.SetPlayerApplicantLocaleFlags"] = {
	key = "C_ClubFinder.SetPlayerApplicantLocaleFlags",
	name = "SetPlayerApplicantLocaleFlags",
	category = "combat_midnight",
	subcategory = "c_clubfinder",
	func = _G["C_ClubFinder"] and _G["C_ClubFinder"]["SetPlayerApplicantLocaleFlags"],
	funcPath = "C_ClubFinder.SetPlayerApplicantLocaleFlags",
	params = { { name = "localeFlags", type = "number", default = nil } },
	returns = {},
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_ClubFinder.SetPlayerApplicantSettings"] = {
	key = "C_ClubFinder.SetPlayerApplicantSettings",
	name = "SetPlayerApplicantSettings",
	category = "combat_midnight",
	subcategory = "c_clubfinder",
	func = _G["C_ClubFinder"] and _G["C_ClubFinder"]["SetPlayerApplicantSettings"],
	funcPath = "C_ClubFinder.SetPlayerApplicantSettings",
	params = { { name = "index", type = "number", default = nil }, { name = "checked", type = "bool", default = nil } },
	returns = {},
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_ClubFinder.SetRecruitmentLocale"] = {
	key = "C_ClubFinder.SetRecruitmentLocale",
	name = "SetRecruitmentLocale",
	category = "combat_midnight",
	subcategory = "c_clubfinder",
	func = _G["C_ClubFinder"] and _G["C_ClubFinder"]["SetRecruitmentLocale"],
	funcPath = "C_ClubFinder.SetRecruitmentLocale",
	params = { { name = "locale", type = "number", default = nil } },
	returns = {},
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_ClubFinder.SetRecruitmentSettings"] = {
	key = "C_ClubFinder.SetRecruitmentSettings",
	name = "SetRecruitmentSettings",
	category = "combat_midnight",
	subcategory = "c_clubfinder",
	func = _G["C_ClubFinder"] and _G["C_ClubFinder"]["SetRecruitmentSettings"],
	funcPath = "C_ClubFinder.SetRecruitmentSettings",
	params = { { name = "index", type = "number", default = nil }, { name = "checked", type = "bool", default = nil } },
	returns = {},
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}
