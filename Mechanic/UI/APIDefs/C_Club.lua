-- Generated APIDefinitions for namespace: C_Club
local _, ns = ...
local APIDefs = ns.APIDefinitions

APIDefs["C_Club.AcceptInvitation"] = {
    key = "C_Club.AcceptInvitation",
    name = "AcceptInvitation",
    category = "social",
    subcategory = "c_club",
    funcPath = "C_Club.AcceptInvitation",
    params = { { name = "clubId", type = "ClubId", default = nil } },
    returns = {  },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Club.AddClubStreamChatChannel"] = {
    key = "C_Club.AddClubStreamChatChannel",
    name = "AddClubStreamChatChannel",
    category = "social",
    subcategory = "c_club",
    funcPath = "C_Club.AddClubStreamChatChannel",
    params = { { name = "clubId", type = "ClubId", default = nil }, { name = "streamId", type = "ClubStreamId", default = nil } },
    returns = {  },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Club.AdvanceStreamViewMarker"] = {
    key = "C_Club.AdvanceStreamViewMarker",
    name = "AdvanceStreamViewMarker",
    category = "social",
    subcategory = "c_club",
    funcPath = "C_Club.AdvanceStreamViewMarker",
    params = { { name = "clubId", type = "ClubId", default = nil }, { name = "streamId", type = "ClubStreamId", default = nil } },
    returns = {  },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Club.AreMembersReady"] = {
    key = "C_Club.AreMembersReady",
    name = "AreMembersReady",
    category = "social",
    subcategory = "c_club",
    funcPath = "C_Club.AreMembersReady",
    params = { { name = "clubId", type = "ClubId", default = nil } },
    returns = { { name = "membersReady", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Club.AssignMemberRole"] = {
    key = "C_Club.AssignMemberRole",
    name = "AssignMemberRole",
    category = "social",
    subcategory = "c_club",
    funcPath = "C_Club.AssignMemberRole",
    params = { { name = "clubId", type = "ClubId", default = nil }, { name = "memberId", type = "number", default = nil }, { name = "roleId", type = "ClubRoleIdentifier", default = nil } },
    returns = {  },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Club.CanResolvePlayerLocationFromClubMessageData"] = {
    key = "C_Club.CanResolvePlayerLocationFromClubMessageData",
    name = "CanResolvePlayerLocationFromClubMessageData",
    category = "social",
    subcategory = "c_club",
    funcPath = "C_Club.CanResolvePlayerLocationFromClubMessageData",
    params = { { name = "clubId", type = "ClubId", default = nil }, { name = "streamId", type = "ClubStreamId", default = nil }, { name = "epoch", type = "BigUInteger", default = nil }, { name = "position", type = "BigUInteger", default = nil } },
    returns = { { name = "canResolve", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Club.ClearAutoAdvanceStreamViewMarker"] = {
    key = "C_Club.ClearAutoAdvanceStreamViewMarker",
    name = "ClearAutoAdvanceStreamViewMarker",
    category = "social",
    subcategory = "c_club",
    funcPath = "C_Club.ClearAutoAdvanceStreamViewMarker",
    params = {  },
    returns = {  },
    midnightImpact = "NORMAL",
}

APIDefs["C_Club.ClearClubPresenceSubscription"] = {
    key = "C_Club.ClearClubPresenceSubscription",
    name = "ClearClubPresenceSubscription",
    category = "social",
    subcategory = "c_club",
    funcPath = "C_Club.ClearClubPresenceSubscription",
    params = {  },
    returns = {  },
    midnightImpact = "NORMAL",
}

APIDefs["C_Club.CompareBattleNetDisplayName"] = {
    key = "C_Club.CompareBattleNetDisplayName",
    name = "CompareBattleNetDisplayName",
    category = "social",
    subcategory = "c_club",
    funcPath = "C_Club.CompareBattleNetDisplayName",
    params = { { name = "clubId", type = "ClubId", default = nil }, { name = "lhsMemberId", type = "number", default = nil }, { name = "rhsMemberId", type = "number", default = nil } },
    returns = { { name = "comparison", type = "number", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Club.CreateClub"] = {
    key = "C_Club.CreateClub",
    name = "CreateClub",
    category = "social",
    subcategory = "c_club",
    funcPath = "C_Club.CreateClub",
    params = { { name = "name", type = "string", default = nil }, { name = "shortName", type = "string", default = nil }, { name = "description", type = "string", default = nil }, { name = "clubType", type = "ClubType", default = nil }, { name = "avatarId", type = "number", default = nil }, { name = "isCrossFaction", type = "bool", default = nil } },
    returns = {  },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Club.CreateStream"] = {
    key = "C_Club.CreateStream",
    name = "CreateStream",
    category = "social",
    subcategory = "c_club",
    funcPath = "C_Club.CreateStream",
    params = { { name = "clubId", type = "ClubId", default = nil }, { name = "name", type = "string", default = nil }, { name = "subject", type = "string", default = nil }, { name = "leadersAndModeratorsOnly", type = "bool", default = nil } },
    returns = {  },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Club.CreateTicket"] = {
    key = "C_Club.CreateTicket",
    name = "CreateTicket",
    category = "social",
    subcategory = "c_club",
    funcPath = "C_Club.CreateTicket",
    params = { { name = "clubId", type = "ClubId", default = nil }, { name = "allowedRedeemCount", type = "number", default = nil }, { name = "duration", type = "number", default = nil }, { name = "defaultStreamId", type = "ClubStreamId", default = nil }, { name = "isCrossFaction", type = "bool", default = nil } },
    returns = {  },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Club.DeclineInvitation"] = {
    key = "C_Club.DeclineInvitation",
    name = "DeclineInvitation",
    category = "social",
    subcategory = "c_club",
    funcPath = "C_Club.DeclineInvitation",
    params = { { name = "clubId", type = "ClubId", default = nil } },
    returns = {  },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Club.DestroyClub"] = {
    key = "C_Club.DestroyClub",
    name = "DestroyClub",
    category = "social",
    subcategory = "c_club",
    funcPath = "C_Club.DestroyClub",
    params = { { name = "clubId", type = "ClubId", default = nil } },
    returns = {  },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Club.DestroyMessage"] = {
    key = "C_Club.DestroyMessage",
    name = "DestroyMessage",
    category = "social",
    subcategory = "c_club",
    funcPath = "C_Club.DestroyMessage",
    params = { { name = "clubId", type = "ClubId", default = nil }, { name = "streamId", type = "ClubStreamId", default = nil }, { name = "messageId", type = "ClubMessageIdentifier", default = nil } },
    returns = {  },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Club.DestroyStream"] = {
    key = "C_Club.DestroyStream",
    name = "DestroyStream",
    category = "social",
    subcategory = "c_club",
    funcPath = "C_Club.DestroyStream",
    params = { { name = "clubId", type = "ClubId", default = nil }, { name = "streamId", type = "ClubStreamId", default = nil } },
    returns = {  },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Club.DestroyTicket"] = {
    key = "C_Club.DestroyTicket",
    name = "DestroyTicket",
    category = "social",
    subcategory = "c_club",
    funcPath = "C_Club.DestroyTicket",
    params = { { name = "clubId", type = "ClubId", default = nil }, { name = "ticketId", type = "string", default = nil } },
    returns = {  },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Club.DoesAnyCommunityHaveUnreadMessages"] = {
    key = "C_Club.DoesAnyCommunityHaveUnreadMessages",
    name = "DoesAnyCommunityHaveUnreadMessages",
    category = "social",
    subcategory = "c_club",
    funcPath = "C_Club.DoesAnyCommunityHaveUnreadMessages",
    params = {  },
    returns = { { name = "hasUnreadMessages", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["C_Club.DoesCommunityHaveMembersOfTheOppositeFaction"] = {
    key = "C_Club.DoesCommunityHaveMembersOfTheOppositeFaction",
    name = "DoesCommunityHaveMembersOfTheOppositeFaction",
    category = "social",
    subcategory = "c_club",
    funcPath = "C_Club.DoesCommunityHaveMembersOfTheOppositeFaction",
    params = { { name = "clubId", type = "ClubId", default = nil } },
    returns = { { name = "hasMembersOfOppositeFaction", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Club.EditClub"] = {
    key = "C_Club.EditClub",
    name = "EditClub",
    category = "social",
    subcategory = "c_club",
    funcPath = "C_Club.EditClub",
    params = { { name = "clubId", type = "ClubId", default = nil }, { name = "name", type = "string", default = nil }, { name = "shortName", type = "string", default = nil }, { name = "description", type = "string", default = nil }, { name = "avatarId", type = "number", default = nil }, { name = "broadcast", type = "string", default = nil }, { name = "crossFaction", type = "bool", default = nil } },
    returns = {  },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Club.EditMessage"] = {
    key = "C_Club.EditMessage",
    name = "EditMessage",
    category = "social",
    subcategory = "c_club",
    funcPath = "C_Club.EditMessage",
    params = { { name = "clubId", type = "ClubId", default = nil }, { name = "streamId", type = "ClubStreamId", default = nil }, { name = "messageId", type = "ClubMessageIdentifier", default = nil }, { name = "message", type = "string", default = nil } },
    returns = {  },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Club.EditStream"] = {
    key = "C_Club.EditStream",
    name = "EditStream",
    category = "social",
    subcategory = "c_club",
    funcPath = "C_Club.EditStream",
    params = { { name = "clubId", type = "ClubId", default = nil }, { name = "streamId", type = "ClubStreamId", default = nil }, { name = "name", type = "string", default = nil }, { name = "subject", type = "string", default = nil }, { name = "leadersAndModeratorsOnly", type = "bool", default = nil } },
    returns = {  },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Club.Flush"] = {
    key = "C_Club.Flush",
    name = "Flush",
    category = "social",
    subcategory = "c_club",
    funcPath = "C_Club.Flush",
    params = {  },
    returns = {  },
    midnightImpact = "NORMAL",
}

APIDefs["C_Club.FocusCommunityStreams"] = {
    key = "C_Club.FocusCommunityStreams",
    name = "FocusCommunityStreams",
    category = "social",
    subcategory = "c_club",
    funcPath = "C_Club.FocusCommunityStreams",
    params = {  },
    returns = {  },
    midnightImpact = "NORMAL",
}

APIDefs["C_Club.FocusMembers"] = {
    key = "C_Club.FocusMembers",
    name = "FocusMembers",
    category = "social",
    subcategory = "c_club",
    funcPath = "C_Club.FocusMembers",
    params = { { name = "clubId", type = "ClubId", default = nil } },
    returns = {  },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Club.FocusStream"] = {
    key = "C_Club.FocusStream",
    name = "FocusStream",
    category = "social",
    subcategory = "c_club",
    funcPath = "C_Club.FocusStream",
    params = { { name = "clubId", type = "ClubId", default = nil }, { name = "streamId", type = "ClubStreamId", default = nil } },
    returns = { { name = "focused", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Club.GetAssignableRoles"] = {
    key = "C_Club.GetAssignableRoles",
    name = "GetAssignableRoles",
    category = "social",
    subcategory = "c_club",
    funcPath = "C_Club.GetAssignableRoles",
    params = { { name = "clubId", type = "ClubId", default = nil }, { name = "memberId", type = "number", default = nil } },
    returns = { { name = "assignableRoles", type = "table", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Club.GetAvatarIdList"] = {
    key = "C_Club.GetAvatarIdList",
    name = "GetAvatarIdList",
    category = "social",
    subcategory = "c_club",
    funcPath = "C_Club.GetAvatarIdList",
    params = { { name = "clubType", type = "ClubType", default = nil } },
    returns = { { name = "avatarIds", type = "table", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Club.GetClubCapacity"] = {
    key = "C_Club.GetClubCapacity",
    name = "GetClubCapacity",
    category = "social",
    subcategory = "c_club",
    funcPath = "C_Club.GetClubCapacity",
    params = {  },
    returns = { { name = "capacity", type = "number", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["C_Club.GetClubInfo"] = {
    key = "C_Club.GetClubInfo",
    name = "GetClubInfo",
    category = "social",
    subcategory = "c_club",
    funcPath = "C_Club.GetClubInfo",
    params = { { name = "clubId", type = "ClubId", default = nil } },
    returns = { { name = "info", type = "ClubInfo", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Club.GetClubLimits"] = {
    key = "C_Club.GetClubLimits",
    name = "GetClubLimits",
    category = "social",
    subcategory = "c_club",
    funcPath = "C_Club.GetClubLimits",
    params = { { name = "clubType", type = "ClubType", default = nil } },
    returns = { { name = "clubLimits", type = "ClubLimits", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Club.GetClubMembers"] = {
    key = "C_Club.GetClubMembers",
    name = "GetClubMembers",
    category = "social",
    subcategory = "c_club",
    funcPath = "C_Club.GetClubMembers",
    params = { { name = "clubId", type = "ClubId", default = nil }, { name = "streamId", type = "ClubStreamId", default = nil } },
    returns = { { name = "members", type = "table", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Club.GetClubPrivileges"] = {
    key = "C_Club.GetClubPrivileges",
    name = "GetClubPrivileges",
    category = "social",
    subcategory = "c_club",
    funcPath = "C_Club.GetClubPrivileges",
    params = { { name = "clubId", type = "ClubId", default = nil } },
    returns = { { name = "privilegeInfo", type = "ClubPrivilegeInfo", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Club.GetClubStreamNotificationSettings"] = {
    key = "C_Club.GetClubStreamNotificationSettings",
    name = "GetClubStreamNotificationSettings",
    category = "social",
    subcategory = "c_club",
    funcPath = "C_Club.GetClubStreamNotificationSettings",
    params = { { name = "clubId", type = "ClubId", default = nil } },
    returns = { { name = "settings", type = "table", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Club.GetCommunityNameResultText"] = {
    key = "C_Club.GetCommunityNameResultText",
    name = "GetCommunityNameResultText",
    category = "social",
    subcategory = "c_club",
    funcPath = "C_Club.GetCommunityNameResultText",
    params = { { name = "result", type = "ValidateNameResult", default = nil } },
    returns = { { name = "errorCode", type = "cstring", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Club.GetGuildClubId"] = {
    key = "C_Club.GetGuildClubId",
    name = "GetGuildClubId",
    category = "social",
    subcategory = "c_club",
    funcPath = "C_Club.GetGuildClubId",
    params = {  },
    returns = { { name = "guildClubId", type = "ClubId", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["C_Club.GetInfoFromLastCommunityChatLine"] = {
    key = "C_Club.GetInfoFromLastCommunityChatLine",
    name = "GetInfoFromLastCommunityChatLine",
    category = "social",
    subcategory = "c_club",
    funcPath = "C_Club.GetInfoFromLastCommunityChatLine",
    params = {  },
    returns = { { name = "messageInfo", type = "ClubMessageInfo", canBeSecret = false }, { name = "clubId", type = "ClubId", canBeSecret = false }, { name = "streamId", type = "ClubStreamId", canBeSecret = false }, { name = "clubType", type = "ClubType", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["C_Club.GetInvitationCandidates"] = {
    key = "C_Club.GetInvitationCandidates",
    name = "GetInvitationCandidates",
    category = "social",
    subcategory = "c_club",
    funcPath = "C_Club.GetInvitationCandidates",
    params = { { name = "filter", type = "string", default = nil }, { name = "maxResults", type = "number", default = nil }, { name = "cursorPosition", type = "number", default = nil }, { name = "allowFullMatch", type = "bool", default = nil }, { name = "clubId", type = "ClubId", default = nil } },
    returns = { { name = "candidates", type = "table", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Club.GetInvitationInfo"] = {
    key = "C_Club.GetInvitationInfo",
    name = "GetInvitationInfo",
    category = "social",
    subcategory = "c_club",
    funcPath = "C_Club.GetInvitationInfo",
    params = { { name = "clubId", type = "ClubId", default = nil } },
    returns = { { name = "invitation", type = "ClubSelfInvitationInfo", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Club.GetInvitationsForClub"] = {
    key = "C_Club.GetInvitationsForClub",
    name = "GetInvitationsForClub",
    category = "social",
    subcategory = "c_club",
    funcPath = "C_Club.GetInvitationsForClub",
    params = { { name = "clubId", type = "ClubId", default = nil } },
    returns = { { name = "invitations", type = "table", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Club.GetInvitationsForSelf"] = {
    key = "C_Club.GetInvitationsForSelf",
    name = "GetInvitationsForSelf",
    category = "social",
    subcategory = "c_club",
    funcPath = "C_Club.GetInvitationsForSelf",
    params = {  },
    returns = { { name = "invitations", type = "table", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["C_Club.GetLastTicketResponse"] = {
    key = "C_Club.GetLastTicketResponse",
    name = "GetLastTicketResponse",
    category = "social",
    subcategory = "c_club",
    funcPath = "C_Club.GetLastTicketResponse",
    params = { { name = "ticket", type = "string", default = nil } },
    returns = { { name = "error", type = "ClubErrorType", canBeSecret = false }, { name = "info", type = "ClubInfo", canBeSecret = false }, { name = "showError", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Club.GetMemberInfo"] = {
    key = "C_Club.GetMemberInfo",
    name = "GetMemberInfo",
    category = "social",
    subcategory = "c_club",
    funcPath = "C_Club.GetMemberInfo",
    params = { { name = "clubId", type = "ClubId", default = nil }, { name = "memberId", type = "number", default = nil } },
    returns = { { name = "info", type = "ClubMemberInfo", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Club.GetMemberInfoForSelf"] = {
    key = "C_Club.GetMemberInfoForSelf",
    name = "GetMemberInfoForSelf",
    category = "social",
    subcategory = "c_club",
    funcPath = "C_Club.GetMemberInfoForSelf",
    params = { { name = "clubId", type = "ClubId", default = nil } },
    returns = { { name = "info", type = "ClubMemberInfo", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Club.GetMessageInfo"] = {
    key = "C_Club.GetMessageInfo",
    name = "GetMessageInfo",
    category = "social",
    subcategory = "c_club",
    funcPath = "C_Club.GetMessageInfo",
    params = { { name = "clubId", type = "ClubId", default = nil }, { name = "streamId", type = "ClubStreamId", default = nil }, { name = "messageId", type = "ClubMessageIdentifier", default = nil } },
    returns = { { name = "message", type = "ClubMessageInfo", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Club.GetMessageRanges"] = {
    key = "C_Club.GetMessageRanges",
    name = "GetMessageRanges",
    category = "social",
    subcategory = "c_club",
    funcPath = "C_Club.GetMessageRanges",
    params = { { name = "clubId", type = "ClubId", default = nil }, { name = "streamId", type = "ClubStreamId", default = nil } },
    returns = { { name = "ranges", type = "table", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Club.GetMessagesBefore"] = {
    key = "C_Club.GetMessagesBefore",
    name = "GetMessagesBefore",
    category = "social",
    subcategory = "c_club",
    funcPath = "C_Club.GetMessagesBefore",
    params = { { name = "clubId", type = "ClubId", default = nil }, { name = "streamId", type = "ClubStreamId", default = nil }, { name = "newest", type = "ClubMessageIdentifier", default = nil }, { name = "count", type = "number", default = nil } },
    returns = { { name = "messages", type = "table", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Club.GetMessagesInRange"] = {
    key = "C_Club.GetMessagesInRange",
    name = "GetMessagesInRange",
    category = "social",
    subcategory = "c_club",
    funcPath = "C_Club.GetMessagesInRange",
    params = { { name = "clubId", type = "ClubId", default = nil }, { name = "streamId", type = "ClubStreamId", default = nil }, { name = "oldest", type = "ClubMessageIdentifier", default = nil }, { name = "newest", type = "ClubMessageIdentifier", default = nil } },
    returns = { { name = "messages", type = "table", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Club.GetStreamInfo"] = {
    key = "C_Club.GetStreamInfo",
    name = "GetStreamInfo",
    category = "social",
    subcategory = "c_club",
    funcPath = "C_Club.GetStreamInfo",
    params = { { name = "clubId", type = "ClubId", default = nil }, { name = "streamId", type = "ClubStreamId", default = nil } },
    returns = { { name = "streamInfo", type = "ClubStreamInfo", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Club.GetStreamViewMarker"] = {
    key = "C_Club.GetStreamViewMarker",
    name = "GetStreamViewMarker",
    category = "social",
    subcategory = "c_club",
    funcPath = "C_Club.GetStreamViewMarker",
    params = { { name = "clubId", type = "ClubId", default = nil }, { name = "streamId", type = "ClubStreamId", default = nil } },
    returns = { { name = "lastReadTime", type = "BigUInteger", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Club.GetStreams"] = {
    key = "C_Club.GetStreams",
    name = "GetStreams",
    category = "social",
    subcategory = "c_club",
    funcPath = "C_Club.GetStreams",
    params = { { name = "clubId", type = "ClubId", default = nil } },
    returns = { { name = "streams", type = "table", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Club.GetSubscribedClubs"] = {
    key = "C_Club.GetSubscribedClubs",
    name = "GetSubscribedClubs",
    category = "social",
    subcategory = "c_club",
    funcPath = "C_Club.GetSubscribedClubs",
    params = {  },
    returns = { { name = "clubs", type = "table", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["C_Club.GetTickets"] = {
    key = "C_Club.GetTickets",
    name = "GetTickets",
    category = "social",
    subcategory = "c_club",
    funcPath = "C_Club.GetTickets",
    params = { { name = "clubId", type = "ClubId", default = nil } },
    returns = { { name = "tickets", type = "table", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Club.IsAccountMuted"] = {
    key = "C_Club.IsAccountMuted",
    name = "IsAccountMuted",
    category = "social",
    subcategory = "c_club",
    funcPath = "C_Club.IsAccountMuted",
    params = { { name = "clubId", type = "ClubId", default = nil } },
    returns = { { name = "accountMuted", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Club.IsBeginningOfStream"] = {
    key = "C_Club.IsBeginningOfStream",
    name = "IsBeginningOfStream",
    category = "social",
    subcategory = "c_club",
    funcPath = "C_Club.IsBeginningOfStream",
    params = { { name = "clubId", type = "ClubId", default = nil }, { name = "streamId", type = "ClubStreamId", default = nil }, { name = "messageId", type = "ClubMessageIdentifier", default = nil } },
    returns = { { name = "isBeginningOfStream", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Club.IsEnabled"] = {
    key = "C_Club.IsEnabled",
    name = "IsEnabled",
    category = "social",
    subcategory = "c_club",
    funcPath = "C_Club.IsEnabled",
    params = {  },
    returns = { { name = "clubsEnabled", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["C_Club.IsRestricted"] = {
    key = "C_Club.IsRestricted",
    name = "IsRestricted",
    category = "social",
    subcategory = "c_club",
    funcPath = "C_Club.IsRestricted",
    params = {  },
    returns = { { name = "restrictionReason", type = "ClubRestrictionReason", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["C_Club.IsSubscribedToStream"] = {
    key = "C_Club.IsSubscribedToStream",
    name = "IsSubscribedToStream",
    category = "social",
    subcategory = "c_club",
    funcPath = "C_Club.IsSubscribedToStream",
    params = { { name = "clubId", type = "ClubId", default = nil }, { name = "streamId", type = "ClubStreamId", default = nil } },
    returns = { { name = "subscribed", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Club.KickMember"] = {
    key = "C_Club.KickMember",
    name = "KickMember",
    category = "social",
    subcategory = "c_club",
    funcPath = "C_Club.KickMember",
    params = { { name = "clubId", type = "ClubId", default = nil }, { name = "memberId", type = "number", default = nil } },
    returns = {  },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Club.LeaveClub"] = {
    key = "C_Club.LeaveClub",
    name = "LeaveClub",
    category = "social",
    subcategory = "c_club",
    funcPath = "C_Club.LeaveClub",
    params = { { name = "clubId", type = "ClubId", default = nil } },
    returns = {  },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Club.RedeemTicket"] = {
    key = "C_Club.RedeemTicket",
    name = "RedeemTicket",
    category = "social",
    subcategory = "c_club",
    funcPath = "C_Club.RedeemTicket",
    params = { { name = "ticketId", type = "string", default = nil } },
    returns = {  },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Club.RequestInvitationsForClub"] = {
    key = "C_Club.RequestInvitationsForClub",
    name = "RequestInvitationsForClub",
    category = "social",
    subcategory = "c_club",
    funcPath = "C_Club.RequestInvitationsForClub",
    params = { { name = "clubId", type = "ClubId", default = nil } },
    returns = {  },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Club.RequestMoreMessagesBefore"] = {
    key = "C_Club.RequestMoreMessagesBefore",
    name = "RequestMoreMessagesBefore",
    category = "social",
    subcategory = "c_club",
    funcPath = "C_Club.RequestMoreMessagesBefore",
    params = { { name = "clubId", type = "ClubId", default = nil }, { name = "streamId", type = "ClubStreamId", default = nil }, { name = "messageId", type = "ClubMessageIdentifier", default = nil }, { name = "count", type = "number", default = nil } },
    returns = { { name = "alreadyHasMessages", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Club.RequestTicket"] = {
    key = "C_Club.RequestTicket",
    name = "RequestTicket",
    category = "social",
    subcategory = "c_club",
    funcPath = "C_Club.RequestTicket",
    params = { { name = "ticketId", type = "string", default = nil } },
    returns = {  },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Club.RequestTickets"] = {
    key = "C_Club.RequestTickets",
    name = "RequestTickets",
    category = "social",
    subcategory = "c_club",
    funcPath = "C_Club.RequestTickets",
    params = { { name = "clubId", type = "ClubId", default = nil } },
    returns = {  },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Club.RevokeInvitation"] = {
    key = "C_Club.RevokeInvitation",
    name = "RevokeInvitation",
    category = "social",
    subcategory = "c_club",
    funcPath = "C_Club.RevokeInvitation",
    params = { { name = "clubId", type = "ClubId", default = nil }, { name = "memberId", type = "number", default = nil } },
    returns = {  },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Club.SendBattleTagFriendRequest"] = {
    key = "C_Club.SendBattleTagFriendRequest",
    name = "SendBattleTagFriendRequest",
    category = "social",
    subcategory = "c_club",
    funcPath = "C_Club.SendBattleTagFriendRequest",
    params = { { name = "guildClubId", type = "ClubId", default = nil }, { name = "memberId", type = "number", default = nil } },
    returns = {  },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Club.SendCharacterInvitation"] = {
    key = "C_Club.SendCharacterInvitation",
    name = "SendCharacterInvitation",
    category = "social",
    subcategory = "c_club",
    funcPath = "C_Club.SendCharacterInvitation",
    params = { { name = "clubId", type = "ClubId", default = nil }, { name = "character", type = "string", default = nil } },
    returns = {  },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Club.SendInvitation"] = {
    key = "C_Club.SendInvitation",
    name = "SendInvitation",
    category = "social",
    subcategory = "c_club",
    funcPath = "C_Club.SendInvitation",
    params = { { name = "clubId", type = "ClubId", default = nil }, { name = "memberId", type = "number", default = nil } },
    returns = {  },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Club.SendMessage"] = {
    key = "C_Club.SendMessage",
    name = "SendMessage",
    category = "social",
    subcategory = "c_club",
    funcPath = "C_Club.SendMessage",
    params = { { name = "clubId", type = "ClubId", default = nil }, { name = "streamId", type = "ClubStreamId", default = nil }, { name = "message", type = "string", default = nil } },
    returns = {  },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Club.SetAutoAdvanceStreamViewMarker"] = {
    key = "C_Club.SetAutoAdvanceStreamViewMarker",
    name = "SetAutoAdvanceStreamViewMarker",
    category = "social",
    subcategory = "c_club",
    funcPath = "C_Club.SetAutoAdvanceStreamViewMarker",
    params = { { name = "clubId", type = "ClubId", default = nil }, { name = "streamId", type = "ClubStreamId", default = nil } },
    returns = {  },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Club.SetAvatarTexture"] = {
    key = "C_Club.SetAvatarTexture",
    name = "SetAvatarTexture",
    category = "social",
    subcategory = "c_club",
    funcPath = "C_Club.SetAvatarTexture",
    params = { { name = "texture", type = "SimpleTexture", default = nil }, { name = "avatarId", type = "number", default = nil }, { name = "clubType", type = "ClubType", default = nil } },
    returns = {  },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Club.SetClubMemberNote"] = {
    key = "C_Club.SetClubMemberNote",
    name = "SetClubMemberNote",
    category = "social",
    subcategory = "c_club",
    funcPath = "C_Club.SetClubMemberNote",
    params = { { name = "clubId", type = "ClubId", default = nil }, { name = "memberId", type = "number", default = nil }, { name = "note", type = "string", default = nil } },
    returns = {  },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Club.SetClubPresenceSubscription"] = {
    key = "C_Club.SetClubPresenceSubscription",
    name = "SetClubPresenceSubscription",
    category = "social",
    subcategory = "c_club",
    funcPath = "C_Club.SetClubPresenceSubscription",
    params = { { name = "clubId", type = "ClubId", default = nil } },
    returns = {  },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Club.SetClubStreamNotificationSettings"] = {
    key = "C_Club.SetClubStreamNotificationSettings",
    name = "SetClubStreamNotificationSettings",
    category = "social",
    subcategory = "c_club",
    funcPath = "C_Club.SetClubStreamNotificationSettings",
    params = { { name = "clubId", type = "ClubId", default = nil }, { name = "settings", type = "table", default = nil } },
    returns = {  },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Club.SetCommunityID"] = {
    key = "C_Club.SetCommunityID",
    name = "SetCommunityID",
    category = "social",
    subcategory = "c_club",
    funcPath = "C_Club.SetCommunityID",
    params = { { name = "communityID", type = "BigUInteger", default = nil } },
    returns = {  },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Club.SetFavorite"] = {
    key = "C_Club.SetFavorite",
    name = "SetFavorite",
    category = "social",
    subcategory = "c_club",
    funcPath = "C_Club.SetFavorite",
    params = { { name = "clubId", type = "ClubId", default = nil }, { name = "isFavorite", type = "bool", default = nil } },
    returns = {  },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Club.SetSocialQueueingEnabled"] = {
    key = "C_Club.SetSocialQueueingEnabled",
    name = "SetSocialQueueingEnabled",
    category = "social",
    subcategory = "c_club",
    funcPath = "C_Club.SetSocialQueueingEnabled",
    params = { { name = "clubId", type = "ClubId", default = nil }, { name = "enabled", type = "bool", default = nil } },
    returns = {  },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Club.ShouldAllowClubType"] = {
    key = "C_Club.ShouldAllowClubType",
    name = "ShouldAllowClubType",
    category = "social",
    subcategory = "c_club",
    funcPath = "C_Club.ShouldAllowClubType",
    params = { { name = "clubType", type = "ClubType", default = nil } },
    returns = { { name = "clubTypeIsAllowed", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Club.UnfocusAllStreams"] = {
    key = "C_Club.UnfocusAllStreams",
    name = "UnfocusAllStreams",
    category = "social",
    subcategory = "c_club",
    funcPath = "C_Club.UnfocusAllStreams",
    params = { { name = "unsubscribe", type = "bool", default = nil } },
    returns = {  },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Club.UnfocusMembers"] = {
    key = "C_Club.UnfocusMembers",
    name = "UnfocusMembers",
    category = "social",
    subcategory = "c_club",
    funcPath = "C_Club.UnfocusMembers",
    params = { { name = "clubId", type = "ClubId", default = nil } },
    returns = {  },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Club.UnfocusStream"] = {
    key = "C_Club.UnfocusStream",
    name = "UnfocusStream",
    category = "social",
    subcategory = "c_club",
    funcPath = "C_Club.UnfocusStream",
    params = { { name = "clubId", type = "ClubId", default = nil }, { name = "streamId", type = "ClubStreamId", default = nil } },
    returns = {  },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Club.ValidateText"] = {
    key = "C_Club.ValidateText",
    name = "ValidateText",
    category = "social",
    subcategory = "c_club",
    funcPath = "C_Club.ValidateText",
    params = { { name = "clubType", type = "ClubType", default = nil }, { name = "text", type = "string", default = nil }, { name = "clubFieldType", type = "ClubFieldType", default = nil } },
    returns = { { name = "result", type = "ValidateNameResult", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}
