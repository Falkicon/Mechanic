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

APIDefs["C_PartyInfo.ConfirmInviteTravelPass"] = {
	key = "C_PartyInfo.ConfirmInviteTravelPass",
	name = "ConfirmInviteTravelPass",
	category = "combat_midnight",
	subcategory = "c_partyinfo",
	func = _G["C_PartyInfo"] and _G["C_PartyInfo"]["ConfirmInviteTravelPass"],
	funcPath = "C_PartyInfo.ConfirmInviteTravelPass",
	params = {
		{ name = "targetName", type = "cstring", default = nil },
		{ name = "targetGUID", type = "WOWGUID", default = nil },
	},
	returns = {},
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
	returns = {},
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
	returns = {},
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
	params = {
		{ name = "targetName", type = "cstring", default = nil },
		{ name = "tank", type = "bool", default = nil },
		{ name = "healer", type = "bool", default = nil },
		{ name = "dps", type = "bool", default = nil },
	},
	returns = {},
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_PartyInfo.DoCountdown"] = {
	key = "C_PartyInfo.DoCountdown",
	name = "DoCountdown",
	category = "combat_midnight",
	subcategory = "c_partyinfo",
	func = _G["C_PartyInfo"] and _G["C_PartyInfo"]["DoCountdown"],
	funcPath = "C_PartyInfo.DoCountdown",
	params = {
		{
			name = "seconds",
			type = "number",
			default = nil,
			examples = { { value = 0, label = "MRT" }, { value = 10, label = "BigWigs_Plugins" } },
		},
	},
	returns = { { name = "success", type = "bool", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
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
	returns = {
		{ name = "outReferredByGuid", type = "WOWGUID", canBeSecret = false },
		{ name = "outReferredByName", type = "cstring", canBeSecret = false },
		{ name = "outRelationType", type = "PartyRequestJoinRelation", canBeSecret = false },
		{ name = "outIsQuickJoin", type = "bool", canBeSecret = false },
		{ name = "outClubId", type = "ClubId", canBeSecret = false },
	},
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_PartyInfo.GetMinItemLevel"] = {
	key = "C_PartyInfo.GetMinItemLevel",
	name = "GetMinItemLevel",
	category = "combat_midnight",
	subcategory = "c_partyinfo",
	func = _G["C_PartyInfo"] and _G["C_PartyInfo"]["GetMinItemLevel"],
	funcPath = "C_PartyInfo.GetMinItemLevel",
	params = { { name = "avgItemLevelCategory", type = "AvgItemLevelCategories", default = nil } },
	returns = {
		{ name = "minItemLevel", type = "number", canBeSecret = false },
		{ name = "playerNameWithLowestItemLevel", type = "cstring", canBeSecret = false },
	},
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

APIDefs["C_PartyInfo.InviteUnit"] = {
	key = "C_PartyInfo.InviteUnit",
	name = "InviteUnit",
	category = "combat_midnight",
	subcategory = "c_partyinfo",
	func = _G["C_PartyInfo"] and _G["C_PartyInfo"]["InviteUnit"],
	funcPath = "C_PartyInfo.InviteUnit",
	params = {
		{
			name = "targetName",
			type = "cstring",
			default = nil,
			examples = { { value = "arg2", label = "Leatrix_Plus" }, { value = "unit", label = "Details" } },
		},
	},
	returns = {},
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
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

APIDefs["C_PartyInfo.LeaveParty"] = {
	key = "C_PartyInfo.LeaveParty",
	name = "LeaveParty",
	category = "combat_midnight",
	subcategory = "c_partyinfo",
	func = _G["C_PartyInfo"] and _G["C_PartyInfo"]["LeaveParty"],
	funcPath = "C_PartyInfo.LeaveParty",
	params = { { name = "category", type = "luaIndex", default = nil } },
	returns = {},
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
	params = {
		{
			name = "targetName",
			type = "cstring",
			default = nil,
			examples = { { value = "addon.Unit(AstralMenuFrameUnit1.unit)", label = "AstralKeys" } },
		},
		{ name = "tank", type = "bool", default = nil },
		{ name = "healer", type = "bool", default = nil },
		{ name = "dps", type = "bool", default = nil },
	},
	returns = {},
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
	returns = {},
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
	params = {
		{
			name = "method",
			type = "LootMethod",
			default = nil,
			examples = {
				{ value = "self.ref.id", label = "AllTheThings" },
				{ value = "self.ref.id", label = "AllTheThings" },
				{ value = "master", label = "AllTheThings" },
			},
		},
		{ name = "lootMaster", type = "string", default = nil },
	},
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
	returns = {},
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}
