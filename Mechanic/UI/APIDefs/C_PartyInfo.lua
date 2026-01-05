-- Generated APIDefinitions for namespace: C_PartyInfo
local _, ns = ...
local APIDefs = ns.APIDefinitions

APIDefs["C_PartyInfo.AllowedToDoPartyConversion"] = {
    key = "C_PartyInfo.AllowedToDoPartyConversion",
    name = "AllowedToDoPartyConversion",
    category = "combat_midnight",
    subcategory = "c_partyinfo",
    func = _G["C_PartyInfo"] and _G["C_PartyInfo"]["AllowedToDoPartyConversion"],
    funcPath = "C_PartyInfo.AllowedToDoPartyConversion",
    params = { { name = "toRaid", type = "bool", default = nil } },
    returns = { { name = "allowed", type = "bool", canBeSecret = false } },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_PartyInfo.CanFormCrossFactionParties"] = {
    key = "C_PartyInfo.CanFormCrossFactionParties",
    name = "CanFormCrossFactionParties",
    category = "social",
    subcategory = "c_partyinfo",
    func = _G["C_PartyInfo"] and _G["C_PartyInfo"]["CanFormCrossFactionParties"],
    funcPath = "C_PartyInfo.CanFormCrossFactionParties",
    params = {  },
    returns = { { name = "canFormCrossFactionParties", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["C_PartyInfo.CanInvite"] = {
    key = "C_PartyInfo.CanInvite",
    name = "CanInvite",
    category = "social",
    subcategory = "c_partyinfo",
    func = _G["C_PartyInfo"] and _G["C_PartyInfo"]["CanInvite"],
    funcPath = "C_PartyInfo.CanInvite",
    params = {  },
    returns = { { name = "allowedToInvite", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["C_PartyInfo.CanStartInstanceAbandonVote"] = {
    key = "C_PartyInfo.CanStartInstanceAbandonVote",
    name = "CanStartInstanceAbandonVote",
    category = "social",
    subcategory = "c_partyinfo",
    func = _G["C_PartyInfo"] and _G["C_PartyInfo"]["CanStartInstanceAbandonVote"],
    funcPath = "C_PartyInfo.CanStartInstanceAbandonVote",
    params = {  },
    returns = { { name = "canStart", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["C_PartyInfo.ChallengeModeRestrictionsActive"] = {
    key = "C_PartyInfo.ChallengeModeRestrictionsActive",
    name = "ChallengeModeRestrictionsActive",
    category = "social",
    subcategory = "c_partyinfo",
    func = _G["C_PartyInfo"] and _G["C_PartyInfo"]["ChallengeModeRestrictionsActive"],
    funcPath = "C_PartyInfo.ChallengeModeRestrictionsActive",
    params = {  },
    returns = { { name = "restrictionsActive", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["C_PartyInfo.ConfirmConvertToRaid"] = {
    key = "C_PartyInfo.ConfirmConvertToRaid",
    name = "ConfirmConvertToRaid",
    category = "social",
    subcategory = "c_partyinfo",
    func = _G["C_PartyInfo"] and _G["C_PartyInfo"]["ConfirmConvertToRaid"],
    funcPath = "C_PartyInfo.ConfirmConvertToRaid",
    params = {  },
    returns = {  },
    midnightImpact = "NORMAL",
}

APIDefs["C_PartyInfo.ConfirmInviteTravelPass"] = {
    key = "C_PartyInfo.ConfirmInviteTravelPass",
    name = "ConfirmInviteTravelPass",
    category = "combat_midnight",
    subcategory = "c_partyinfo",
    func = _G["C_PartyInfo"] and _G["C_PartyInfo"]["ConfirmInviteTravelPass"],
    funcPath = "C_PartyInfo.ConfirmInviteTravelPass",
    params = { { name = "targetName", type = "cstring", default = nil }, { name = "targetGUID", type = "WOWGUID", default = nil } },
    returns = {  },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_PartyInfo.ConfirmInviteUnit"] = {
    key = "C_PartyInfo.ConfirmInviteUnit",
    name = "ConfirmInviteUnit",
    category = "combat_midnight",
    subcategory = "c_partyinfo",
    func = _G["C_PartyInfo"] and _G["C_PartyInfo"]["ConfirmInviteUnit"],
    funcPath = "C_PartyInfo.ConfirmInviteUnit",
    params = { { name = "targetName", type = "cstring", default = nil } },
    returns = {  },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_PartyInfo.ConfirmLeaveParty"] = {
    key = "C_PartyInfo.ConfirmLeaveParty",
    name = "ConfirmLeaveParty",
    category = "combat_midnight",
    subcategory = "c_partyinfo",
    func = _G["C_PartyInfo"] and _G["C_PartyInfo"]["ConfirmLeaveParty"],
    funcPath = "C_PartyInfo.ConfirmLeaveParty",
    params = { { name = "category", type = "luaIndex", default = nil } },
    returns = {  },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_PartyInfo.ConfirmRequestInviteFromUnit"] = {
    key = "C_PartyInfo.ConfirmRequestInviteFromUnit",
    name = "ConfirmRequestInviteFromUnit",
    category = "combat_midnight",
    subcategory = "c_partyinfo",
    func = _G["C_PartyInfo"] and _G["C_PartyInfo"]["ConfirmRequestInviteFromUnit"],
    funcPath = "C_PartyInfo.ConfirmRequestInviteFromUnit",
    params = { { name = "targetName", type = "cstring", default = nil }, { name = "tank", type = "bool", default = nil }, { name = "healer", type = "bool", default = nil }, { name = "dps", type = "bool", default = nil } },
    returns = {  },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_PartyInfo.ConvertToParty"] = {
    key = "C_PartyInfo.ConvertToParty",
    name = "ConvertToParty",
    category = "social",
    subcategory = "c_partyinfo",
    func = _G["C_PartyInfo"] and _G["C_PartyInfo"]["ConvertToParty"],
    funcPath = "C_PartyInfo.ConvertToParty",
    params = {  },
    returns = {  },
    midnightImpact = "NORMAL",
}

APIDefs["C_PartyInfo.ConvertToRaid"] = {
    key = "C_PartyInfo.ConvertToRaid",
    name = "ConvertToRaid",
    category = "social",
    subcategory = "c_partyinfo",
    func = _G["C_PartyInfo"] and _G["C_PartyInfo"]["ConvertToRaid"],
    funcPath = "C_PartyInfo.ConvertToRaid",
    params = {  },
    returns = {  },
    midnightImpact = "NORMAL",
}

APIDefs["C_PartyInfo.DelveTeleportOut"] = {
    key = "C_PartyInfo.DelveTeleportOut",
    name = "DelveTeleportOut",
    category = "social",
    subcategory = "c_partyinfo",
    func = _G["C_PartyInfo"] and _G["C_PartyInfo"]["DelveTeleportOut"],
    funcPath = "C_PartyInfo.DelveTeleportOut",
    params = {  },
    returns = {  },
    midnightImpact = "NORMAL",
}

APIDefs["C_PartyInfo.DoCountdown"] = {
    key = "C_PartyInfo.DoCountdown",
    name = "DoCountdown",
    category = "combat_midnight",
    subcategory = "c_partyinfo",
    func = _G["C_PartyInfo"] and _G["C_PartyInfo"]["DoCountdown"],
    funcPath = "C_PartyInfo.DoCountdown",
    params = { { name = "seconds", type = "number", default = nil } },
    returns = { { name = "success", type = "bool", canBeSecret = false } },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_PartyInfo.GetActiveCategories"] = {
    key = "C_PartyInfo.GetActiveCategories",
    name = "GetActiveCategories",
    category = "social",
    subcategory = "c_partyinfo",
    func = _G["C_PartyInfo"] and _G["C_PartyInfo"]["GetActiveCategories"],
    funcPath = "C_PartyInfo.GetActiveCategories",
    params = {  },
    returns = { { name = "categories", type = "table", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["C_PartyInfo.GetAvailableLootMethods"] = {
    key = "C_PartyInfo.GetAvailableLootMethods",
    name = "GetAvailableLootMethods",
    category = "social",
    subcategory = "c_partyinfo",
    func = _G["C_PartyInfo"] and _G["C_PartyInfo"]["GetAvailableLootMethods"],
    funcPath = "C_PartyInfo.GetAvailableLootMethods",
    params = {  },
    returns = { { name = "methods", type = "table", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["C_PartyInfo.GetInstanceAbandonShutdownTime"] = {
    key = "C_PartyInfo.GetInstanceAbandonShutdownTime",
    name = "GetInstanceAbandonShutdownTime",
    category = "social",
    subcategory = "c_partyinfo",
    func = _G["C_PartyInfo"] and _G["C_PartyInfo"]["GetInstanceAbandonShutdownTime"],
    funcPath = "C_PartyInfo.GetInstanceAbandonShutdownTime",
    params = {  },
    returns = { { name = "durationSeconds", type = "number", canBeSecret = false }, { name = "timeLeftSeconds", type = "number", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["C_PartyInfo.GetInstanceAbandonVoteCooldownTime"] = {
    key = "C_PartyInfo.GetInstanceAbandonVoteCooldownTime",
    name = "GetInstanceAbandonVoteCooldownTime",
    category = "social",
    subcategory = "c_partyinfo",
    func = _G["C_PartyInfo"] and _G["C_PartyInfo"]["GetInstanceAbandonVoteCooldownTime"],
    funcPath = "C_PartyInfo.GetInstanceAbandonVoteCooldownTime",
    params = {  },
    returns = { { name = "durationSeconds", type = "number", canBeSecret = false }, { name = "timeLeftSeconds", type = "number", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["C_PartyInfo.GetInstanceAbandonVoteRequirements"] = {
    key = "C_PartyInfo.GetInstanceAbandonVoteRequirements",
    name = "GetInstanceAbandonVoteRequirements",
    category = "social",
    subcategory = "c_partyinfo",
    func = _G["C_PartyInfo"] and _G["C_PartyInfo"]["GetInstanceAbandonVoteRequirements"],
    funcPath = "C_PartyInfo.GetInstanceAbandonVoteRequirements",
    params = {  },
    returns = { { name = "votesRequired", type = "number", canBeSecret = false }, { name = "keystoneOwnerVoteWeight", type = "number", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["C_PartyInfo.GetInstanceAbandonVoteResponse"] = {
    key = "C_PartyInfo.GetInstanceAbandonVoteResponse",
    name = "GetInstanceAbandonVoteResponse",
    category = "social",
    subcategory = "c_partyinfo",
    func = _G["C_PartyInfo"] and _G["C_PartyInfo"]["GetInstanceAbandonVoteResponse"],
    funcPath = "C_PartyInfo.GetInstanceAbandonVoteResponse",
    params = {  },
    returns = { { name = "response", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["C_PartyInfo.GetInstanceAbandonVoteTime"] = {
    key = "C_PartyInfo.GetInstanceAbandonVoteTime",
    name = "GetInstanceAbandonVoteTime",
    category = "social",
    subcategory = "c_partyinfo",
    func = _G["C_PartyInfo"] and _G["C_PartyInfo"]["GetInstanceAbandonVoteTime"],
    funcPath = "C_PartyInfo.GetInstanceAbandonVoteTime",
    params = {  },
    returns = { { name = "durationSeconds", type = "number", canBeSecret = false }, { name = "timeLeftSeconds", type = "number", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["C_PartyInfo.GetInviteConfirmationInvalidQueues"] = {
    key = "C_PartyInfo.GetInviteConfirmationInvalidQueues",
    name = "GetInviteConfirmationInvalidQueues",
    category = "combat_midnight",
    subcategory = "c_partyinfo",
    func = _G["C_PartyInfo"] and _G["C_PartyInfo"]["GetInviteConfirmationInvalidQueues"],
    funcPath = "C_PartyInfo.GetInviteConfirmationInvalidQueues",
    params = { { name = "inviteGUID", type = "WOWGUID", default = nil } },
    returns = { { name = "invalidQueues", type = "table", canBeSecret = false } },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_PartyInfo.GetInviteReferralInfo"] = {
    key = "C_PartyInfo.GetInviteReferralInfo",
    name = "GetInviteReferralInfo",
    category = "combat_midnight",
    subcategory = "c_partyinfo",
    func = _G["C_PartyInfo"] and _G["C_PartyInfo"]["GetInviteReferralInfo"],
    funcPath = "C_PartyInfo.GetInviteReferralInfo",
    params = { { name = "inviteGUID", type = "WOWGUID", default = nil } },
    returns = { { name = "outReferredByGuid", type = "WOWGUID", canBeSecret = false }, { name = "outReferredByName", type = "cstring", canBeSecret = false }, { name = "outRelationType", type = "PartyRequestJoinRelation", canBeSecret = false }, { name = "outIsQuickJoin", type = "bool", canBeSecret = false }, { name = "outClubId", type = "ClubId", canBeSecret = false } },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_PartyInfo.GetLootMethod"] = {
    key = "C_PartyInfo.GetLootMethod",
    name = "GetLootMethod",
    category = "social",
    subcategory = "c_partyinfo",
    func = _G["C_PartyInfo"] and _G["C_PartyInfo"]["GetLootMethod"],
    funcPath = "C_PartyInfo.GetLootMethod",
    params = {  },
    returns = { { name = "method", type = "LootMethod", canBeSecret = false }, { name = "masterLootPartyID", type = "number", canBeSecret = false }, { name = "masterLooterRaidID", type = "number", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["C_PartyInfo.GetMinItemLevel"] = {
    key = "C_PartyInfo.GetMinItemLevel",
    name = "GetMinItemLevel",
    category = "combat_midnight",
    subcategory = "c_partyinfo",
    func = _G["C_PartyInfo"] and _G["C_PartyInfo"]["GetMinItemLevel"],
    funcPath = "C_PartyInfo.GetMinItemLevel",
    params = { { name = "avgItemLevelCategory", type = "AvgItemLevelCategories", default = nil } },
    returns = { { name = "minItemLevel", type = "number", canBeSecret = false }, { name = "playerNameWithLowestItemLevel", type = "cstring", canBeSecret = false } },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_PartyInfo.GetMinLevel"] = {
    key = "C_PartyInfo.GetMinLevel",
    name = "GetMinLevel",
    category = "combat_midnight",
    subcategory = "c_partyinfo",
    func = _G["C_PartyInfo"] and _G["C_PartyInfo"]["GetMinLevel"],
    funcPath = "C_PartyInfo.GetMinLevel",
    params = { { name = "category", type = "luaIndex", default = nil } },
    returns = { { name = "minLevel", type = "number", canBeSecret = false } },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_PartyInfo.GetNumInstanceAbandonGroupVoteResponses"] = {
    key = "C_PartyInfo.GetNumInstanceAbandonGroupVoteResponses",
    name = "GetNumInstanceAbandonGroupVoteResponses",
    category = "social",
    subcategory = "c_partyinfo",
    func = _G["C_PartyInfo"] and _G["C_PartyInfo"]["GetNumInstanceAbandonGroupVoteResponses"],
    funcPath = "C_PartyInfo.GetNumInstanceAbandonGroupVoteResponses",
    params = {  },
    returns = { { name = "count", type = "number", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["C_PartyInfo.GetRestrictPings"] = {
    key = "C_PartyInfo.GetRestrictPings",
    name = "GetRestrictPings",
    category = "social",
    subcategory = "c_partyinfo",
    func = _G["C_PartyInfo"] and _G["C_PartyInfo"]["GetRestrictPings"],
    funcPath = "C_PartyInfo.GetRestrictPings",
    params = {  },
    returns = { { name = "restrictTo", type = "RestrictPingsTo", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["C_PartyInfo.InviteUnit"] = {
    key = "C_PartyInfo.InviteUnit",
    name = "InviteUnit",
    category = "combat_midnight",
    subcategory = "c_partyinfo",
    func = _G["C_PartyInfo"] and _G["C_PartyInfo"]["InviteUnit"],
    funcPath = "C_PartyInfo.InviteUnit",
    params = { { name = "targetName", type = "cstring", default = nil } },
    returns = {  },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_PartyInfo.IsChallengeModeActive"] = {
    key = "C_PartyInfo.IsChallengeModeActive",
    name = "IsChallengeModeActive",
    category = "social",
    subcategory = "c_partyinfo",
    func = _G["C_PartyInfo"] and _G["C_PartyInfo"]["IsChallengeModeActive"],
    funcPath = "C_PartyInfo.IsChallengeModeActive",
    params = {  },
    returns = { { name = "active", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["C_PartyInfo.IsChallengeModeKeystoneOwner"] = {
    key = "C_PartyInfo.IsChallengeModeKeystoneOwner",
    name = "IsChallengeModeKeystoneOwner",
    category = "social",
    subcategory = "c_partyinfo",
    func = _G["C_PartyInfo"] and _G["C_PartyInfo"]["IsChallengeModeKeystoneOwner"],
    funcPath = "C_PartyInfo.IsChallengeModeKeystoneOwner",
    params = {  },
    returns = { { name = "isKeystoneOwner", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["C_PartyInfo.IsCrossFactionParty"] = {
    key = "C_PartyInfo.IsCrossFactionParty",
    name = "IsCrossFactionParty",
    category = "combat_midnight",
    subcategory = "c_partyinfo",
    func = _G["C_PartyInfo"] and _G["C_PartyInfo"]["IsCrossFactionParty"],
    funcPath = "C_PartyInfo.IsCrossFactionParty",
    params = { { name = "category", type = "luaIndex", default = nil } },
    returns = { { name = "isCrossFactionParty", type = "bool", canBeSecret = false } },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_PartyInfo.IsDelveComplete"] = {
    key = "C_PartyInfo.IsDelveComplete",
    name = "IsDelveComplete",
    category = "social",
    subcategory = "c_partyinfo",
    func = _G["C_PartyInfo"] and _G["C_PartyInfo"]["IsDelveComplete"],
    funcPath = "C_PartyInfo.IsDelveComplete",
    params = {  },
    returns = { { name = "isDelveComplete", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["C_PartyInfo.IsDelveInProgress"] = {
    key = "C_PartyInfo.IsDelveInProgress",
    name = "IsDelveInProgress",
    category = "social",
    subcategory = "c_partyinfo",
    func = _G["C_PartyInfo"] and _G["C_PartyInfo"]["IsDelveInProgress"],
    funcPath = "C_PartyInfo.IsDelveInProgress",
    params = {  },
    returns = { { name = "isDelveComplete", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["C_PartyInfo.IsPartyFull"] = {
    key = "C_PartyInfo.IsPartyFull",
    name = "IsPartyFull",
    category = "combat_midnight",
    subcategory = "c_partyinfo",
    func = _G["C_PartyInfo"] and _G["C_PartyInfo"]["IsPartyFull"],
    funcPath = "C_PartyInfo.IsPartyFull",
    params = { { name = "category", type = "luaIndex", default = nil } },
    returns = { { name = "isFull", type = "bool", canBeSecret = false } },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_PartyInfo.IsPartyInJailersTower"] = {
    key = "C_PartyInfo.IsPartyInJailersTower",
    name = "IsPartyInJailersTower",
    category = "social",
    subcategory = "c_partyinfo",
    func = _G["C_PartyInfo"] and _G["C_PartyInfo"]["IsPartyInJailersTower"],
    funcPath = "C_PartyInfo.IsPartyInJailersTower",
    params = {  },
    returns = { { name = "isPartyInJailersTower", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["C_PartyInfo.IsPartyWalkIn"] = {
    key = "C_PartyInfo.IsPartyWalkIn",
    name = "IsPartyWalkIn",
    category = "social",
    subcategory = "c_partyinfo",
    func = _G["C_PartyInfo"] and _G["C_PartyInfo"]["IsPartyWalkIn"],
    funcPath = "C_PartyInfo.IsPartyWalkIn",
    params = {  },
    returns = { { name = "isPartyWalkIn", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["C_PartyInfo.LeaveParty"] = {
    key = "C_PartyInfo.LeaveParty",
    name = "LeaveParty",
    category = "combat_midnight",
    subcategory = "c_partyinfo",
    func = _G["C_PartyInfo"] and _G["C_PartyInfo"]["LeaveParty"],
    funcPath = "C_PartyInfo.LeaveParty",
    params = { { name = "category", type = "luaIndex", default = nil } },
    returns = {  },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_PartyInfo.RequestInviteFromUnit"] = {
    key = "C_PartyInfo.RequestInviteFromUnit",
    name = "RequestInviteFromUnit",
    category = "combat_midnight",
    subcategory = "c_partyinfo",
    func = _G["C_PartyInfo"] and _G["C_PartyInfo"]["RequestInviteFromUnit"],
    funcPath = "C_PartyInfo.RequestInviteFromUnit",
    params = { { name = "targetName", type = "cstring", default = nil }, { name = "tank", type = "bool", default = nil }, { name = "healer", type = "bool", default = nil }, { name = "dps", type = "bool", default = nil } },
    returns = {  },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_PartyInfo.SetInstanceAbandonVoteResponse"] = {
    key = "C_PartyInfo.SetInstanceAbandonVoteResponse",
    name = "SetInstanceAbandonVoteResponse",
    category = "combat_midnight",
    subcategory = "c_partyinfo",
    func = _G["C_PartyInfo"] and _G["C_PartyInfo"]["SetInstanceAbandonVoteResponse"],
    funcPath = "C_PartyInfo.SetInstanceAbandonVoteResponse",
    params = { { name = "response", type = "bool", default = nil } },
    returns = {  },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_PartyInfo.SetLootMethod"] = {
    key = "C_PartyInfo.SetLootMethod",
    name = "SetLootMethod",
    category = "combat_midnight",
    subcategory = "c_partyinfo",
    func = _G["C_PartyInfo"] and _G["C_PartyInfo"]["SetLootMethod"],
    funcPath = "C_PartyInfo.SetLootMethod",
    params = { { name = "method", type = "LootMethod", default = nil }, { name = "lootMaster", type = "string", default = nil } },
    returns = { { name = "success", type = "bool", canBeSecret = false } },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_PartyInfo.SetRestrictPings"] = {
    key = "C_PartyInfo.SetRestrictPings",
    name = "SetRestrictPings",
    category = "combat_midnight",
    subcategory = "c_partyinfo",
    func = _G["C_PartyInfo"] and _G["C_PartyInfo"]["SetRestrictPings"],
    funcPath = "C_PartyInfo.SetRestrictPings",
    params = { { name = "restrictTo", type = "RestrictPingsTo", default = nil } },
    returns = {  },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_PartyInfo.StartInstanceAbandonVote"] = {
    key = "C_PartyInfo.StartInstanceAbandonVote",
    name = "StartInstanceAbandonVote",
    category = "social",
    subcategory = "c_partyinfo",
    func = _G["C_PartyInfo"] and _G["C_PartyInfo"]["StartInstanceAbandonVote"],
    funcPath = "C_PartyInfo.StartInstanceAbandonVote",
    params = {  },
    returns = {  },
    midnightImpact = "NORMAL",
}
