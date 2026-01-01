-- Generated APIDefinitions for namespace: C_Club
local _, ns = ...
local APIDefs = ns.APIDefinitions

APIDefs["C_Club.AcceptInvitation"] = {
	key = "C_Club.AcceptInvitation",
	name = "AcceptInvitation",
	category = "combat_midnight",
	subcategory = "c_club",
	func = _G["C_Club"] and _G["C_Club"]["AcceptInvitation"],
	funcPath = "C_Club.AcceptInvitation",
	params = { { name = "clubId", type = "ClubId", default = nil } },
	returns = {},
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Club.AddClubStreamChatChannel"] = {
	key = "C_Club.AddClubStreamChatChannel",
	name = "AddClubStreamChatChannel",
	category = "combat_midnight",
	subcategory = "c_club",
	func = _G["C_Club"] and _G["C_Club"]["AddClubStreamChatChannel"],
	funcPath = "C_Club.AddClubStreamChatChannel",
	params = {
		{ name = "clubId", type = "ClubId", default = nil },
		{ name = "streamId", type = "ClubStreamId", default = nil },
	},
	returns = {},
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Club.AdvanceStreamViewMarker"] = {
	key = "C_Club.AdvanceStreamViewMarker",
	name = "AdvanceStreamViewMarker",
	category = "combat_midnight",
	subcategory = "c_club",
	func = _G["C_Club"] and _G["C_Club"]["AdvanceStreamViewMarker"],
	funcPath = "C_Club.AdvanceStreamViewMarker",
	params = {
		{ name = "clubId", type = "ClubId", default = nil },
		{ name = "streamId", type = "ClubStreamId", default = nil },
	},
	returns = {},
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Club.AreMembersReady"] = {
	key = "C_Club.AreMembersReady",
	name = "AreMembersReady",
	category = "combat_midnight",
	subcategory = "c_club",
	func = _G["C_Club"] and _G["C_Club"]["AreMembersReady"],
	funcPath = "C_Club.AreMembersReady",
	params = { { name = "clubId", type = "ClubId", default = nil } },
	returns = { { name = "membersReady", type = "bool", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Club.AssignMemberRole"] = {
	key = "C_Club.AssignMemberRole",
	name = "AssignMemberRole",
	category = "combat_midnight",
	subcategory = "c_club",
	func = _G["C_Club"] and _G["C_Club"]["AssignMemberRole"],
	funcPath = "C_Club.AssignMemberRole",
	params = {
		{ name = "clubId", type = "ClubId", default = nil },
		{ name = "memberId", type = "number", default = nil },
		{ name = "roleId", type = "ClubRoleIdentifier", default = nil },
	},
	returns = {},
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Club.CanResolvePlayerLocationFromClubMessageData"] = {
	key = "C_Club.CanResolvePlayerLocationFromClubMessageData",
	name = "CanResolvePlayerLocationFromClubMessageData",
	category = "combat_midnight",
	subcategory = "c_club",
	func = _G["C_Club"] and _G["C_Club"]["CanResolvePlayerLocationFromClubMessageData"],
	funcPath = "C_Club.CanResolvePlayerLocationFromClubMessageData",
	params = {
		{ name = "clubId", type = "ClubId", default = nil },
		{ name = "streamId", type = "ClubStreamId", default = nil },
		{ name = "epoch", type = "BigUInteger", default = nil },
		{ name = "position", type = "BigUInteger", default = nil },
	},
	returns = { { name = "canResolve", type = "bool", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Club.CompareBattleNetDisplayName"] = {
	key = "C_Club.CompareBattleNetDisplayName",
	name = "CompareBattleNetDisplayName",
	category = "combat_midnight",
	subcategory = "c_club",
	func = _G["C_Club"] and _G["C_Club"]["CompareBattleNetDisplayName"],
	funcPath = "C_Club.CompareBattleNetDisplayName",
	params = {
		{ name = "clubId", type = "ClubId", default = nil },
		{ name = "lhsMemberId", type = "number", default = nil },
		{ name = "rhsMemberId", type = "number", default = nil },
	},
	returns = { { name = "comparison", type = "number", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Club.CreateClub"] = {
	key = "C_Club.CreateClub",
	name = "CreateClub",
	category = "combat_midnight",
	subcategory = "c_club",
	func = _G["C_Club"] and _G["C_Club"]["CreateClub"],
	funcPath = "C_Club.CreateClub",
	params = {
		{ name = "name", type = "string", default = nil },
		{ name = "shortName", type = "string", default = nil },
		{ name = "description", type = "string", default = nil },
		{ name = "clubType", type = "ClubType", default = nil },
		{ name = "avatarId", type = "number", default = nil },
		{ name = "isCrossFaction", type = "bool", default = nil },
	},
	returns = {},
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Club.CreateStream"] = {
	key = "C_Club.CreateStream",
	name = "CreateStream",
	category = "combat_midnight",
	subcategory = "c_club",
	func = _G["C_Club"] and _G["C_Club"]["CreateStream"],
	funcPath = "C_Club.CreateStream",
	params = {
		{ name = "clubId", type = "ClubId", default = nil },
		{ name = "name", type = "string", default = nil },
		{ name = "subject", type = "string", default = nil },
		{ name = "leadersAndModeratorsOnly", type = "bool", default = nil },
	},
	returns = {},
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Club.CreateTicket"] = {
	key = "C_Club.CreateTicket",
	name = "CreateTicket",
	category = "combat_midnight",
	subcategory = "c_club",
	func = _G["C_Club"] and _G["C_Club"]["CreateTicket"],
	funcPath = "C_Club.CreateTicket",
	params = {
		{ name = "clubId", type = "ClubId", default = nil },
		{ name = "allowedRedeemCount", type = "number", default = nil },
		{ name = "duration", type = "number", default = nil },
		{ name = "defaultStreamId", type = "ClubStreamId", default = nil },
		{ name = "isCrossFaction", type = "bool", default = nil },
	},
	returns = {},
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Club.DeclineInvitation"] = {
	key = "C_Club.DeclineInvitation",
	name = "DeclineInvitation",
	category = "combat_midnight",
	subcategory = "c_club",
	func = _G["C_Club"] and _G["C_Club"]["DeclineInvitation"],
	funcPath = "C_Club.DeclineInvitation",
	params = { { name = "clubId", type = "ClubId", default = nil } },
	returns = {},
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Club.DestroyClub"] = {
	key = "C_Club.DestroyClub",
	name = "DestroyClub",
	category = "combat_midnight",
	subcategory = "c_club",
	func = _G["C_Club"] and _G["C_Club"]["DestroyClub"],
	funcPath = "C_Club.DestroyClub",
	params = { { name = "clubId", type = "ClubId", default = nil } },
	returns = {},
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Club.DestroyMessage"] = {
	key = "C_Club.DestroyMessage",
	name = "DestroyMessage",
	category = "combat_midnight",
	subcategory = "c_club",
	func = _G["C_Club"] and _G["C_Club"]["DestroyMessage"],
	funcPath = "C_Club.DestroyMessage",
	params = {
		{ name = "clubId", type = "ClubId", default = nil },
		{ name = "streamId", type = "ClubStreamId", default = nil },
		{ name = "messageId", type = "ClubMessageIdentifier", default = nil },
	},
	returns = {},
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Club.DestroyStream"] = {
	key = "C_Club.DestroyStream",
	name = "DestroyStream",
	category = "combat_midnight",
	subcategory = "c_club",
	func = _G["C_Club"] and _G["C_Club"]["DestroyStream"],
	funcPath = "C_Club.DestroyStream",
	params = {
		{ name = "clubId", type = "ClubId", default = nil },
		{ name = "streamId", type = "ClubStreamId", default = nil },
	},
	returns = {},
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Club.DestroyTicket"] = {
	key = "C_Club.DestroyTicket",
	name = "DestroyTicket",
	category = "combat_midnight",
	subcategory = "c_club",
	func = _G["C_Club"] and _G["C_Club"]["DestroyTicket"],
	funcPath = "C_Club.DestroyTicket",
	params = {
		{ name = "clubId", type = "ClubId", default = nil },
		{ name = "ticketId", type = "string", default = nil },
	},
	returns = {},
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Club.DoesCommunityHaveMembersOfTheOppositeFaction"] = {
	key = "C_Club.DoesCommunityHaveMembersOfTheOppositeFaction",
	name = "DoesCommunityHaveMembersOfTheOppositeFaction",
	category = "combat_midnight",
	subcategory = "c_club",
	func = _G["C_Club"] and _G["C_Club"]["DoesCommunityHaveMembersOfTheOppositeFaction"],
	funcPath = "C_Club.DoesCommunityHaveMembersOfTheOppositeFaction",
	params = { { name = "clubId", type = "ClubId", default = nil } },
	returns = { { name = "hasMembersOfOppositeFaction", type = "bool", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Club.EditClub"] = {
	key = "C_Club.EditClub",
	name = "EditClub",
	category = "combat_midnight",
	subcategory = "c_club",
	func = _G["C_Club"] and _G["C_Club"]["EditClub"],
	funcPath = "C_Club.EditClub",
	params = {
		{ name = "clubId", type = "ClubId", default = nil },
		{ name = "name", type = "string", default = nil },
		{ name = "shortName", type = "string", default = nil },
		{ name = "description", type = "string", default = nil },
		{ name = "avatarId", type = "number", default = nil },
		{ name = "broadcast", type = "string", default = nil },
		{ name = "crossFaction", type = "bool", default = nil },
	},
	returns = {},
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Club.EditMessage"] = {
	key = "C_Club.EditMessage",
	name = "EditMessage",
	category = "combat_midnight",
	subcategory = "c_club",
	func = _G["C_Club"] and _G["C_Club"]["EditMessage"],
	funcPath = "C_Club.EditMessage",
	params = {
		{ name = "clubId", type = "ClubId", default = nil },
		{ name = "streamId", type = "ClubStreamId", default = nil },
		{ name = "messageId", type = "ClubMessageIdentifier", default = nil },
		{ name = "message", type = "string", default = nil },
	},
	returns = {},
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Club.EditStream"] = {
	key = "C_Club.EditStream",
	name = "EditStream",
	category = "combat_midnight",
	subcategory = "c_club",
	func = _G["C_Club"] and _G["C_Club"]["EditStream"],
	funcPath = "C_Club.EditStream",
	params = {
		{ name = "clubId", type = "ClubId", default = nil },
		{ name = "streamId", type = "ClubStreamId", default = nil },
		{ name = "name", type = "string", default = nil },
		{ name = "subject", type = "string", default = nil },
		{ name = "leadersAndModeratorsOnly", type = "bool", default = nil },
	},
	returns = {},
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Club.FocusMembers"] = {
	key = "C_Club.FocusMembers",
	name = "FocusMembers",
	category = "combat_midnight",
	subcategory = "c_club",
	func = _G["C_Club"] and _G["C_Club"]["FocusMembers"],
	funcPath = "C_Club.FocusMembers",
	params = { { name = "clubId", type = "ClubId", default = nil } },
	returns = {},
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Club.FocusStream"] = {
	key = "C_Club.FocusStream",
	name = "FocusStream",
	category = "combat_midnight",
	subcategory = "c_club",
	func = _G["C_Club"] and _G["C_Club"]["FocusStream"],
	funcPath = "C_Club.FocusStream",
	params = {
		{ name = "clubId", type = "ClubId", default = nil },
		{ name = "streamId", type = "ClubStreamId", default = nil },
	},
	returns = { { name = "focused", type = "bool", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Club.GetAssignableRoles"] = {
	key = "C_Club.GetAssignableRoles",
	name = "GetAssignableRoles",
	category = "combat_midnight",
	subcategory = "c_club",
	func = _G["C_Club"] and _G["C_Club"]["GetAssignableRoles"],
	funcPath = "C_Club.GetAssignableRoles",
	params = {
		{ name = "clubId", type = "ClubId", default = nil },
		{ name = "memberId", type = "number", default = nil },
	},
	returns = { { name = "assignableRoles", type = "table", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Club.GetAvatarIdList"] = {
	key = "C_Club.GetAvatarIdList",
	name = "GetAvatarIdList",
	category = "combat_midnight",
	subcategory = "c_club",
	func = _G["C_Club"] and _G["C_Club"]["GetAvatarIdList"],
	funcPath = "C_Club.GetAvatarIdList",
	params = { { name = "clubType", type = "ClubType", default = nil } },
	returns = { { name = "avatarIds", type = "table", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Club.GetClubInfo"] = {
	key = "C_Club.GetClubInfo",
	name = "GetClubInfo",
	category = "combat_midnight",
	subcategory = "c_club",
	func = _G["C_Club"] and _G["C_Club"]["GetClubInfo"],
	funcPath = "C_Club.GetClubInfo",
	params = { { name = "clubId", type = "ClubId", default = nil } },
	returns = { { name = "info", type = "ClubInfo", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Club.GetClubLimits"] = {
	key = "C_Club.GetClubLimits",
	name = "GetClubLimits",
	category = "combat_midnight",
	subcategory = "c_club",
	func = _G["C_Club"] and _G["C_Club"]["GetClubLimits"],
	funcPath = "C_Club.GetClubLimits",
	params = { { name = "clubType", type = "ClubType", default = nil } },
	returns = { { name = "clubLimits", type = "ClubLimits", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Club.GetClubMembers"] = {
	key = "C_Club.GetClubMembers",
	name = "GetClubMembers",
	category = "combat_midnight",
	subcategory = "c_club",
	func = _G["C_Club"] and _G["C_Club"]["GetClubMembers"],
	funcPath = "C_Club.GetClubMembers",
	params = {
		{ name = "clubId", type = "ClubId", default = nil },
		{ name = "streamId", type = "ClubStreamId", default = nil },
	},
	returns = { { name = "members", type = "table", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Club.GetClubPrivileges"] = {
	key = "C_Club.GetClubPrivileges",
	name = "GetClubPrivileges",
	category = "combat_midnight",
	subcategory = "c_club",
	func = _G["C_Club"] and _G["C_Club"]["GetClubPrivileges"],
	funcPath = "C_Club.GetClubPrivileges",
	params = { { name = "clubId", type = "ClubId", default = nil } },
	returns = { { name = "privilegeInfo", type = "ClubPrivilegeInfo", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Club.GetClubStreamNotificationSettings"] = {
	key = "C_Club.GetClubStreamNotificationSettings",
	name = "GetClubStreamNotificationSettings",
	category = "combat_midnight",
	subcategory = "c_club",
	func = _G["C_Club"] and _G["C_Club"]["GetClubStreamNotificationSettings"],
	funcPath = "C_Club.GetClubStreamNotificationSettings",
	params = { { name = "clubId", type = "ClubId", default = nil } },
	returns = { { name = "settings", type = "table", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Club.GetCommunityNameResultText"] = {
	key = "C_Club.GetCommunityNameResultText",
	name = "GetCommunityNameResultText",
	category = "combat_midnight",
	subcategory = "c_club",
	func = _G["C_Club"] and _G["C_Club"]["GetCommunityNameResultText"],
	funcPath = "C_Club.GetCommunityNameResultText",
	params = { { name = "result", type = "ValidateNameResult", default = nil } },
	returns = { { name = "errorCode", type = "cstring", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Club.GetInvitationCandidates"] = {
	key = "C_Club.GetInvitationCandidates",
	name = "GetInvitationCandidates",
	category = "combat_midnight",
	subcategory = "c_club",
	func = _G["C_Club"] and _G["C_Club"]["GetInvitationCandidates"],
	funcPath = "C_Club.GetInvitationCandidates",
	params = {
		{ name = "filter", type = "string", default = nil },
		{ name = "maxResults", type = "number", default = nil },
		{ name = "cursorPosition", type = "number", default = nil },
		{ name = "allowFullMatch", type = "bool", default = nil },
		{ name = "clubId", type = "ClubId", default = nil },
	},
	returns = { { name = "candidates", type = "table", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Club.GetInvitationInfo"] = {
	key = "C_Club.GetInvitationInfo",
	name = "GetInvitationInfo",
	category = "combat_midnight",
	subcategory = "c_club",
	func = _G["C_Club"] and _G["C_Club"]["GetInvitationInfo"],
	funcPath = "C_Club.GetInvitationInfo",
	params = { { name = "clubId", type = "ClubId", default = nil } },
	returns = { { name = "invitation", type = "ClubSelfInvitationInfo", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Club.GetInvitationsForClub"] = {
	key = "C_Club.GetInvitationsForClub",
	name = "GetInvitationsForClub",
	category = "combat_midnight",
	subcategory = "c_club",
	func = _G["C_Club"] and _G["C_Club"]["GetInvitationsForClub"],
	funcPath = "C_Club.GetInvitationsForClub",
	params = { { name = "clubId", type = "ClubId", default = nil } },
	returns = { { name = "invitations", type = "table", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Club.GetLastTicketResponse"] = {
	key = "C_Club.GetLastTicketResponse",
	name = "GetLastTicketResponse",
	category = "combat_midnight",
	subcategory = "c_club",
	func = _G["C_Club"] and _G["C_Club"]["GetLastTicketResponse"],
	funcPath = "C_Club.GetLastTicketResponse",
	params = { { name = "ticket", type = "string", default = nil } },
	returns = {
		{ name = "error", type = "ClubErrorType", canBeSecret = false },
		{ name = "info", type = "ClubInfo", canBeSecret = false },
		{ name = "showError", type = "bool", canBeSecret = false },
	},
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Club.GetMemberInfo"] = {
	key = "C_Club.GetMemberInfo",
	name = "GetMemberInfo",
	category = "combat_midnight",
	subcategory = "c_club",
	func = _G["C_Club"] and _G["C_Club"]["GetMemberInfo"],
	funcPath = "C_Club.GetMemberInfo",
	params = {
		{ name = "clubId", type = "ClubId", default = nil },
		{ name = "memberId", type = "number", default = nil },
	},
	returns = { { name = "info", type = "ClubMemberInfo", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Club.GetMemberInfoForSelf"] = {
	key = "C_Club.GetMemberInfoForSelf",
	name = "GetMemberInfoForSelf",
	category = "combat_midnight",
	subcategory = "c_club",
	func = _G["C_Club"] and _G["C_Club"]["GetMemberInfoForSelf"],
	funcPath = "C_Club.GetMemberInfoForSelf",
	params = { { name = "clubId", type = "ClubId", default = nil } },
	returns = { { name = "info", type = "ClubMemberInfo", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Club.GetMessageInfo"] = {
	key = "C_Club.GetMessageInfo",
	name = "GetMessageInfo",
	category = "combat_midnight",
	subcategory = "c_club",
	func = _G["C_Club"] and _G["C_Club"]["GetMessageInfo"],
	funcPath = "C_Club.GetMessageInfo",
	params = {
		{ name = "clubId", type = "ClubId", default = nil },
		{ name = "streamId", type = "ClubStreamId", default = nil },
		{ name = "messageId", type = "ClubMessageIdentifier", default = nil },
	},
	returns = { { name = "message", type = "ClubMessageInfo", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Club.GetMessageRanges"] = {
	key = "C_Club.GetMessageRanges",
	name = "GetMessageRanges",
	category = "combat_midnight",
	subcategory = "c_club",
	func = _G["C_Club"] and _G["C_Club"]["GetMessageRanges"],
	funcPath = "C_Club.GetMessageRanges",
	params = {
		{ name = "clubId", type = "ClubId", default = nil },
		{ name = "streamId", type = "ClubStreamId", default = nil },
	},
	returns = { { name = "ranges", type = "table", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Club.GetMessagesBefore"] = {
	key = "C_Club.GetMessagesBefore",
	name = "GetMessagesBefore",
	category = "combat_midnight",
	subcategory = "c_club",
	func = _G["C_Club"] and _G["C_Club"]["GetMessagesBefore"],
	funcPath = "C_Club.GetMessagesBefore",
	params = {
		{ name = "clubId", type = "ClubId", default = nil },
		{ name = "streamId", type = "ClubStreamId", default = nil },
		{ name = "newest", type = "ClubMessageIdentifier", default = nil },
		{ name = "count", type = "number", default = nil },
	},
	returns = { { name = "messages", type = "table", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Club.GetMessagesInRange"] = {
	key = "C_Club.GetMessagesInRange",
	name = "GetMessagesInRange",
	category = "combat_midnight",
	subcategory = "c_club",
	func = _G["C_Club"] and _G["C_Club"]["GetMessagesInRange"],
	funcPath = "C_Club.GetMessagesInRange",
	params = {
		{ name = "clubId", type = "ClubId", default = nil },
		{ name = "streamId", type = "ClubStreamId", default = nil },
		{ name = "oldest", type = "ClubMessageIdentifier", default = nil },
		{ name = "newest", type = "ClubMessageIdentifier", default = nil },
	},
	returns = { { name = "messages", type = "table", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Club.GetStreamInfo"] = {
	key = "C_Club.GetStreamInfo",
	name = "GetStreamInfo",
	category = "combat_midnight",
	subcategory = "c_club",
	func = _G["C_Club"] and _G["C_Club"]["GetStreamInfo"],
	funcPath = "C_Club.GetStreamInfo",
	params = {
		{ name = "clubId", type = "ClubId", default = nil },
		{ name = "streamId", type = "ClubStreamId", default = nil },
	},
	returns = { { name = "streamInfo", type = "ClubStreamInfo", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Club.GetStreamViewMarker"] = {
	key = "C_Club.GetStreamViewMarker",
	name = "GetStreamViewMarker",
	category = "combat_midnight",
	subcategory = "c_club",
	func = _G["C_Club"] and _G["C_Club"]["GetStreamViewMarker"],
	funcPath = "C_Club.GetStreamViewMarker",
	params = {
		{ name = "clubId", type = "ClubId", default = nil },
		{ name = "streamId", type = "ClubStreamId", default = nil },
	},
	returns = { { name = "lastReadTime", type = "BigUInteger", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Club.GetStreams"] = {
	key = "C_Club.GetStreams",
	name = "GetStreams",
	category = "combat_midnight",
	subcategory = "c_club",
	func = _G["C_Club"] and _G["C_Club"]["GetStreams"],
	funcPath = "C_Club.GetStreams",
	params = { { name = "clubId", type = "ClubId", default = nil } },
	returns = { { name = "streams", type = "table", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Club.GetTickets"] = {
	key = "C_Club.GetTickets",
	name = "GetTickets",
	category = "combat_midnight",
	subcategory = "c_club",
	func = _G["C_Club"] and _G["C_Club"]["GetTickets"],
	funcPath = "C_Club.GetTickets",
	params = { { name = "clubId", type = "ClubId", default = nil } },
	returns = { { name = "tickets", type = "table", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Club.IsAccountMuted"] = {
	key = "C_Club.IsAccountMuted",
	name = "IsAccountMuted",
	category = "combat_midnight",
	subcategory = "c_club",
	func = _G["C_Club"] and _G["C_Club"]["IsAccountMuted"],
	funcPath = "C_Club.IsAccountMuted",
	params = { { name = "clubId", type = "ClubId", default = nil } },
	returns = { { name = "accountMuted", type = "bool", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Club.IsBeginningOfStream"] = {
	key = "C_Club.IsBeginningOfStream",
	name = "IsBeginningOfStream",
	category = "combat_midnight",
	subcategory = "c_club",
	func = _G["C_Club"] and _G["C_Club"]["IsBeginningOfStream"],
	funcPath = "C_Club.IsBeginningOfStream",
	params = {
		{ name = "clubId", type = "ClubId", default = nil },
		{ name = "streamId", type = "ClubStreamId", default = nil },
		{ name = "messageId", type = "ClubMessageIdentifier", default = nil },
	},
	returns = { { name = "isBeginningOfStream", type = "bool", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Club.IsSubscribedToStream"] = {
	key = "C_Club.IsSubscribedToStream",
	name = "IsSubscribedToStream",
	category = "combat_midnight",
	subcategory = "c_club",
	func = _G["C_Club"] and _G["C_Club"]["IsSubscribedToStream"],
	funcPath = "C_Club.IsSubscribedToStream",
	params = {
		{ name = "clubId", type = "ClubId", default = nil },
		{ name = "streamId", type = "ClubStreamId", default = nil },
	},
	returns = { { name = "subscribed", type = "bool", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Club.KickMember"] = {
	key = "C_Club.KickMember",
	name = "KickMember",
	category = "combat_midnight",
	subcategory = "c_club",
	func = _G["C_Club"] and _G["C_Club"]["KickMember"],
	funcPath = "C_Club.KickMember",
	params = {
		{ name = "clubId", type = "ClubId", default = nil },
		{ name = "memberId", type = "number", default = nil },
	},
	returns = {},
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Club.LeaveClub"] = {
	key = "C_Club.LeaveClub",
	name = "LeaveClub",
	category = "combat_midnight",
	subcategory = "c_club",
	func = _G["C_Club"] and _G["C_Club"]["LeaveClub"],
	funcPath = "C_Club.LeaveClub",
	params = { { name = "clubId", type = "ClubId", default = nil } },
	returns = {},
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Club.RedeemTicket"] = {
	key = "C_Club.RedeemTicket",
	name = "RedeemTicket",
	category = "combat_midnight",
	subcategory = "c_club",
	func = _G["C_Club"] and _G["C_Club"]["RedeemTicket"],
	funcPath = "C_Club.RedeemTicket",
	params = { { name = "ticketId", type = "string", default = nil } },
	returns = {},
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Club.RequestInvitationsForClub"] = {
	key = "C_Club.RequestInvitationsForClub",
	name = "RequestInvitationsForClub",
	category = "combat_midnight",
	subcategory = "c_club",
	func = _G["C_Club"] and _G["C_Club"]["RequestInvitationsForClub"],
	funcPath = "C_Club.RequestInvitationsForClub",
	params = { { name = "clubId", type = "ClubId", default = nil } },
	returns = {},
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Club.RequestMoreMessagesBefore"] = {
	key = "C_Club.RequestMoreMessagesBefore",
	name = "RequestMoreMessagesBefore",
	category = "combat_midnight",
	subcategory = "c_club",
	func = _G["C_Club"] and _G["C_Club"]["RequestMoreMessagesBefore"],
	funcPath = "C_Club.RequestMoreMessagesBefore",
	params = {
		{ name = "clubId", type = "ClubId", default = nil },
		{ name = "streamId", type = "ClubStreamId", default = nil },
		{ name = "messageId", type = "ClubMessageIdentifier", default = nil },
		{ name = "count", type = "number", default = nil },
	},
	returns = { { name = "alreadyHasMessages", type = "bool", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Club.RequestTicket"] = {
	key = "C_Club.RequestTicket",
	name = "RequestTicket",
	category = "combat_midnight",
	subcategory = "c_club",
	func = _G["C_Club"] and _G["C_Club"]["RequestTicket"],
	funcPath = "C_Club.RequestTicket",
	params = { { name = "ticketId", type = "string", default = nil } },
	returns = {},
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Club.RequestTickets"] = {
	key = "C_Club.RequestTickets",
	name = "RequestTickets",
	category = "combat_midnight",
	subcategory = "c_club",
	func = _G["C_Club"] and _G["C_Club"]["RequestTickets"],
	funcPath = "C_Club.RequestTickets",
	params = { { name = "clubId", type = "ClubId", default = nil } },
	returns = {},
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Club.RevokeInvitation"] = {
	key = "C_Club.RevokeInvitation",
	name = "RevokeInvitation",
	category = "combat_midnight",
	subcategory = "c_club",
	func = _G["C_Club"] and _G["C_Club"]["RevokeInvitation"],
	funcPath = "C_Club.RevokeInvitation",
	params = {
		{ name = "clubId", type = "ClubId", default = nil },
		{ name = "memberId", type = "number", default = nil },
	},
	returns = {},
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Club.SendBattleTagFriendRequest"] = {
	key = "C_Club.SendBattleTagFriendRequest",
	name = "SendBattleTagFriendRequest",
	category = "combat_midnight",
	subcategory = "c_club",
	func = _G["C_Club"] and _G["C_Club"]["SendBattleTagFriendRequest"],
	funcPath = "C_Club.SendBattleTagFriendRequest",
	params = {
		{ name = "guildClubId", type = "ClubId", default = nil },
		{ name = "memberId", type = "number", default = nil },
	},
	returns = {},
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Club.SendCharacterInvitation"] = {
	key = "C_Club.SendCharacterInvitation",
	name = "SendCharacterInvitation",
	category = "combat_midnight",
	subcategory = "c_club",
	func = _G["C_Club"] and _G["C_Club"]["SendCharacterInvitation"],
	funcPath = "C_Club.SendCharacterInvitation",
	params = {
		{ name = "clubId", type = "ClubId", default = nil },
		{ name = "character", type = "string", default = nil },
	},
	returns = {},
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Club.SendInvitation"] = {
	key = "C_Club.SendInvitation",
	name = "SendInvitation",
	category = "combat_midnight",
	subcategory = "c_club",
	func = _G["C_Club"] and _G["C_Club"]["SendInvitation"],
	funcPath = "C_Club.SendInvitation",
	params = {
		{ name = "clubId", type = "ClubId", default = nil },
		{ name = "memberId", type = "number", default = nil },
	},
	returns = {},
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Club.SendMessage"] = {
	key = "C_Club.SendMessage",
	name = "SendMessage",
	category = "combat_midnight",
	subcategory = "c_club",
	func = _G["C_Club"] and _G["C_Club"]["SendMessage"],
	funcPath = "C_Club.SendMessage",
	params = {
		{
			name = "clubId",
			type = "ClubId",
			default = nil,
			examples = {
				{ value = "CACHE_BANK_OPENED", label = "Bagnon" },
				{ value = "CACHE_BANK_CLOSED", label = "Bagnon" },
				{ value = "CACHE_VAULT_OPENED", label = "Bagnon" },
			},
		},
		{ name = "streamId", type = "ClubStreamId", default = nil },
		{ name = "message", type = "string", default = nil },
	},
	returns = {},
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Club.SetAutoAdvanceStreamViewMarker"] = {
	key = "C_Club.SetAutoAdvanceStreamViewMarker",
	name = "SetAutoAdvanceStreamViewMarker",
	category = "combat_midnight",
	subcategory = "c_club",
	func = _G["C_Club"] and _G["C_Club"]["SetAutoAdvanceStreamViewMarker"],
	funcPath = "C_Club.SetAutoAdvanceStreamViewMarker",
	params = {
		{ name = "clubId", type = "ClubId", default = nil },
		{ name = "streamId", type = "ClubStreamId", default = nil },
	},
	returns = {},
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Club.SetAvatarTexture"] = {
	key = "C_Club.SetAvatarTexture",
	name = "SetAvatarTexture",
	category = "combat_midnight",
	subcategory = "c_club",
	func = _G["C_Club"] and _G["C_Club"]["SetAvatarTexture"],
	funcPath = "C_Club.SetAvatarTexture",
	params = {
		{ name = "texture", type = "SimpleTexture", default = nil },
		{ name = "avatarId", type = "number", default = nil },
		{ name = "clubType", type = "ClubType", default = nil },
	},
	returns = {},
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Club.SetClubMemberNote"] = {
	key = "C_Club.SetClubMemberNote",
	name = "SetClubMemberNote",
	category = "combat_midnight",
	subcategory = "c_club",
	func = _G["C_Club"] and _G["C_Club"]["SetClubMemberNote"],
	funcPath = "C_Club.SetClubMemberNote",
	params = {
		{ name = "clubId", type = "ClubId", default = nil },
		{ name = "memberId", type = "number", default = nil },
		{ name = "note", type = "string", default = nil },
	},
	returns = {},
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Club.SetClubPresenceSubscription"] = {
	key = "C_Club.SetClubPresenceSubscription",
	name = "SetClubPresenceSubscription",
	category = "combat_midnight",
	subcategory = "c_club",
	func = _G["C_Club"] and _G["C_Club"]["SetClubPresenceSubscription"],
	funcPath = "C_Club.SetClubPresenceSubscription",
	params = { { name = "clubId", type = "ClubId", default = nil } },
	returns = {},
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Club.SetClubStreamNotificationSettings"] = {
	key = "C_Club.SetClubStreamNotificationSettings",
	name = "SetClubStreamNotificationSettings",
	category = "combat_midnight",
	subcategory = "c_club",
	func = _G["C_Club"] and _G["C_Club"]["SetClubStreamNotificationSettings"],
	funcPath = "C_Club.SetClubStreamNotificationSettings",
	params = {
		{ name = "clubId", type = "ClubId", default = nil },
		{ name = "settings", type = "table", default = nil },
	},
	returns = {},
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Club.SetCommunityID"] = {
	key = "C_Club.SetCommunityID",
	name = "SetCommunityID",
	category = "combat_midnight",
	subcategory = "c_club",
	func = _G["C_Club"] and _G["C_Club"]["SetCommunityID"],
	funcPath = "C_Club.SetCommunityID",
	params = { { name = "communityID", type = "BigUInteger", default = nil } },
	returns = {},
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Club.SetFavorite"] = {
	key = "C_Club.SetFavorite",
	name = "SetFavorite",
	category = "combat_midnight",
	subcategory = "c_club",
	func = _G["C_Club"] and _G["C_Club"]["SetFavorite"],
	funcPath = "C_Club.SetFavorite",
	params = {
		{
			name = "clubId",
			type = "ClubId",
			default = nil,
			examples = { { value = "NarciAnimationInfo.IsFavorite(id)", label = "Narcissus" } },
		},
		{ name = "isFavorite", type = "bool", default = nil },
	},
	returns = {},
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Club.SetSocialQueueingEnabled"] = {
	key = "C_Club.SetSocialQueueingEnabled",
	name = "SetSocialQueueingEnabled",
	category = "combat_midnight",
	subcategory = "c_club",
	func = _G["C_Club"] and _G["C_Club"]["SetSocialQueueingEnabled"],
	funcPath = "C_Club.SetSocialQueueingEnabled",
	params = { { name = "clubId", type = "ClubId", default = nil }, { name = "enabled", type = "bool", default = nil } },
	returns = {},
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Club.ShouldAllowClubType"] = {
	key = "C_Club.ShouldAllowClubType",
	name = "ShouldAllowClubType",
	category = "combat_midnight",
	subcategory = "c_club",
	func = _G["C_Club"] and _G["C_Club"]["ShouldAllowClubType"],
	funcPath = "C_Club.ShouldAllowClubType",
	params = { { name = "clubType", type = "ClubType", default = nil } },
	returns = { { name = "clubTypeIsAllowed", type = "bool", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Club.UnfocusAllStreams"] = {
	key = "C_Club.UnfocusAllStreams",
	name = "UnfocusAllStreams",
	category = "combat_midnight",
	subcategory = "c_club",
	func = _G["C_Club"] and _G["C_Club"]["UnfocusAllStreams"],
	funcPath = "C_Club.UnfocusAllStreams",
	params = { { name = "unsubscribe", type = "bool", default = nil } },
	returns = {},
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Club.UnfocusMembers"] = {
	key = "C_Club.UnfocusMembers",
	name = "UnfocusMembers",
	category = "combat_midnight",
	subcategory = "c_club",
	func = _G["C_Club"] and _G["C_Club"]["UnfocusMembers"],
	funcPath = "C_Club.UnfocusMembers",
	params = { { name = "clubId", type = "ClubId", default = nil } },
	returns = {},
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Club.UnfocusStream"] = {
	key = "C_Club.UnfocusStream",
	name = "UnfocusStream",
	category = "combat_midnight",
	subcategory = "c_club",
	func = _G["C_Club"] and _G["C_Club"]["UnfocusStream"],
	funcPath = "C_Club.UnfocusStream",
	params = {
		{ name = "clubId", type = "ClubId", default = nil },
		{ name = "streamId", type = "ClubStreamId", default = nil },
	},
	returns = {},
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Club.ValidateText"] = {
	key = "C_Club.ValidateText",
	name = "ValidateText",
	category = "combat_midnight",
	subcategory = "c_club",
	func = _G["C_Club"] and _G["C_Club"]["ValidateText"],
	funcPath = "C_Club.ValidateText",
	params = {
		{ name = "clubType", type = "ClubType", default = nil },
		{ name = "text", type = "string", default = nil },
		{ name = "clubFieldType", type = "ClubFieldType", default = nil },
	},
	returns = { { name = "result", type = "ValidateNameResult", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}
