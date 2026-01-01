-- Generated APIDefinitions for namespace: C_ChatInfo
local _, ns = ...
local APIDefs = ns.APIDefinitions

APIDefs["C_ChatInfo.CanPlayerSpeakLanguage"] = {
	key = "C_ChatInfo.CanPlayerSpeakLanguage",
	name = "CanPlayerSpeakLanguage",
	category = "combat_midnight",
	subcategory = "c_chatinfo",
	func = _G["C_ChatInfo"] and _G["C_ChatInfo"]["CanPlayerSpeakLanguage"],
	funcPath = "C_ChatInfo.CanPlayerSpeakLanguage",
	params = { { name = "languageId", type = "number", default = nil } },
	returns = { { name = "canSpeakLanguage", type = "bool", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_ChatInfo.DropCautionaryChatMessage"] = {
	key = "C_ChatInfo.DropCautionaryChatMessage",
	name = "DropCautionaryChatMessage",
	category = "combat_midnight",
	subcategory = "c_chatinfo",
	func = _G["C_ChatInfo"] and _G["C_ChatInfo"]["DropCautionaryChatMessage"],
	funcPath = "C_ChatInfo.DropCautionaryChatMessage",
	params = { { name = "confirmNumber", type = "number", default = nil } },
	returns = {},
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_ChatInfo.GetChannelInfoFromIdentifier"] = {
	key = "C_ChatInfo.GetChannelInfoFromIdentifier",
	name = "GetChannelInfoFromIdentifier",
	category = "combat_midnight",
	subcategory = "c_chatinfo",
	func = _G["C_ChatInfo"] and _G["C_ChatInfo"]["GetChannelInfoFromIdentifier"],
	funcPath = "C_ChatInfo.GetChannelInfoFromIdentifier",
	params = { { name = "channelIdentifier", type = "cstring", default = nil } },
	returns = { { name = "info", type = "ChatChannelInfo", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_ChatInfo.GetChannelRosterInfo"] = {
	key = "C_ChatInfo.GetChannelRosterInfo",
	name = "GetChannelRosterInfo",
	category = "combat_midnight",
	subcategory = "c_chatinfo",
	func = _G["C_ChatInfo"] and _G["C_ChatInfo"]["GetChannelRosterInfo"],
	funcPath = "C_ChatInfo.GetChannelRosterInfo",
	params = {
		{ name = "channelIndex", type = "luaIndex", default = nil },
		{ name = "rosterIndex", type = "luaIndex", default = nil },
	},
	returns = {
		{ name = "name", type = "string", canBeSecret = false },
		{ name = "owner", type = "bool", canBeSecret = false },
		{ name = "moderator", type = "bool", canBeSecret = false },
		{ name = "guid", type = "WOWGUID", canBeSecret = false },
	},
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_ChatInfo.GetChannelRuleset"] = {
	key = "C_ChatInfo.GetChannelRuleset",
	name = "GetChannelRuleset",
	category = "combat_midnight",
	subcategory = "c_chatinfo",
	func = _G["C_ChatInfo"] and _G["C_ChatInfo"]["GetChannelRuleset"],
	funcPath = "C_ChatInfo.GetChannelRuleset",
	params = { { name = "channelIndex", type = "luaIndex", default = nil } },
	returns = { { name = "ruleset", type = "ChatChannelRuleset", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_ChatInfo.GetChannelRulesetForChannelID"] = {
	key = "C_ChatInfo.GetChannelRulesetForChannelID",
	name = "GetChannelRulesetForChannelID",
	category = "combat_midnight",
	subcategory = "c_chatinfo",
	func = _G["C_ChatInfo"] and _G["C_ChatInfo"]["GetChannelRulesetForChannelID"],
	funcPath = "C_ChatInfo.GetChannelRulesetForChannelID",
	params = { { name = "channelID", type = "number", default = nil } },
	returns = { { name = "ruleset", type = "ChatChannelRuleset", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_ChatInfo.GetChannelShortcut"] = {
	key = "C_ChatInfo.GetChannelShortcut",
	name = "GetChannelShortcut",
	category = "combat_midnight",
	subcategory = "c_chatinfo",
	func = _G["C_ChatInfo"] and _G["C_ChatInfo"]["GetChannelShortcut"],
	funcPath = "C_ChatInfo.GetChannelShortcut",
	params = { { name = "channelIndex", type = "luaIndex", default = nil } },
	returns = { { name = "shortcut", type = "cstring", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_ChatInfo.GetChannelShortcutForChannelID"] = {
	key = "C_ChatInfo.GetChannelShortcutForChannelID",
	name = "GetChannelShortcutForChannelID",
	category = "combat_midnight",
	subcategory = "c_chatinfo",
	func = _G["C_ChatInfo"] and _G["C_ChatInfo"]["GetChannelShortcutForChannelID"],
	funcPath = "C_ChatInfo.GetChannelShortcutForChannelID",
	params = { { name = "channelID", type = "number", default = nil } },
	returns = { { name = "shortcut", type = "cstring", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_ChatInfo.GetChatLineSenderGUID"] = {
	key = "C_ChatInfo.GetChatLineSenderGUID",
	name = "GetChatLineSenderGUID",
	category = "combat_midnight",
	subcategory = "c_chatinfo",
	func = _G["C_ChatInfo"] and _G["C_ChatInfo"]["GetChatLineSenderGUID"],
	funcPath = "C_ChatInfo.GetChatLineSenderGUID",
	params = { { name = "chatLine", type = "number", default = nil } },
	returns = { { name = "guid", type = "WOWGUID", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted, SecretInChatMessagingLockdown",
}

APIDefs["C_ChatInfo.GetChatLineSenderName"] = {
	key = "C_ChatInfo.GetChatLineSenderName",
	name = "GetChatLineSenderName",
	category = "combat_midnight",
	subcategory = "c_chatinfo",
	func = _G["C_ChatInfo"] and _G["C_ChatInfo"]["GetChatLineSenderName"],
	funcPath = "C_ChatInfo.GetChatLineSenderName",
	params = { { name = "chatLine", type = "number", default = nil } },
	returns = { { name = "name", type = "string", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted, SecretInChatMessagingLockdown",
}

APIDefs["C_ChatInfo.GetChatLineText"] = {
	key = "C_ChatInfo.GetChatLineText",
	name = "GetChatLineText",
	category = "combat_midnight",
	subcategory = "c_chatinfo",
	func = _G["C_ChatInfo"] and _G["C_ChatInfo"]["GetChatLineText"],
	funcPath = "C_ChatInfo.GetChatLineText",
	params = { { name = "chatLine", type = "number", default = nil } },
	returns = { { name = "text", type = "string", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted, SecretInChatMessagingLockdown",
}

APIDefs["C_ChatInfo.GetChatTypeName"] = {
	key = "C_ChatInfo.GetChatTypeName",
	name = "GetChatTypeName",
	category = "combat_midnight",
	subcategory = "c_chatinfo",
	func = _G["C_ChatInfo"] and _G["C_ChatInfo"]["GetChatTypeName"],
	funcPath = "C_ChatInfo.GetChatTypeName",
	params = { { name = "typeID", type = "number", default = nil } },
	returns = { { name = "name", type = "string", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_ChatInfo.GetClubStreamIDs"] = {
	key = "C_ChatInfo.GetClubStreamIDs",
	name = "GetClubStreamIDs",
	category = "combat_midnight",
	subcategory = "c_chatinfo",
	func = _G["C_ChatInfo"] and _G["C_ChatInfo"]["GetClubStreamIDs"],
	funcPath = "C_ChatInfo.GetClubStreamIDs",
	params = { { name = "clubID", type = "ClubId", default = nil } },
	returns = { { name = "ids", type = "table", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_ChatInfo.GetColorForChatType"] = {
	key = "C_ChatInfo.GetColorForChatType",
	name = "GetColorForChatType",
	category = "combat_midnight",
	subcategory = "c_chatinfo",
	func = _G["C_ChatInfo"] and _G["C_ChatInfo"]["GetColorForChatType"],
	funcPath = "C_ChatInfo.GetColorForChatType",
	params = { { name = "chatType", type = "cstring", default = nil } },
	returns = { { name = "color", type = "colorRGB", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_ChatInfo.IsAddonMessagePrefixRegistered"] = {
	key = "C_ChatInfo.IsAddonMessagePrefixRegistered",
	name = "IsAddonMessagePrefixRegistered",
	category = "combat_midnight",
	subcategory = "c_chatinfo",
	func = _G["C_ChatInfo"] and _G["C_ChatInfo"]["IsAddonMessagePrefixRegistered"],
	funcPath = "C_ChatInfo.IsAddonMessagePrefixRegistered",
	params = {
		{
			name = "prefix",
			type = "cstring",
			default = nil,
			examples = { { value = "BigWigs", label = "DBM-Core" }, { value = "Transcriptor", label = "DBM-Core" } },
		},
	},
	returns = { { name = "isRegistered", type = "bool", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_ChatInfo.IsChannelRegional"] = {
	key = "C_ChatInfo.IsChannelRegional",
	name = "IsChannelRegional",
	category = "combat_midnight",
	subcategory = "c_chatinfo",
	func = _G["C_ChatInfo"] and _G["C_ChatInfo"]["IsChannelRegional"],
	funcPath = "C_ChatInfo.IsChannelRegional",
	params = { { name = "channelIndex", type = "luaIndex", default = nil } },
	returns = { { name = "isRegional", type = "bool", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_ChatInfo.IsChannelRegionalForChannelID"] = {
	key = "C_ChatInfo.IsChannelRegionalForChannelID",
	name = "IsChannelRegionalForChannelID",
	category = "combat_midnight",
	subcategory = "c_chatinfo",
	func = _G["C_ChatInfo"] and _G["C_ChatInfo"]["IsChannelRegionalForChannelID"],
	funcPath = "C_ChatInfo.IsChannelRegionalForChannelID",
	params = { { name = "channelID", type = "number", default = nil } },
	returns = { { name = "isRegional", type = "bool", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_ChatInfo.IsChatLineCensored"] = {
	key = "C_ChatInfo.IsChatLineCensored",
	name = "IsChatLineCensored",
	category = "combat_midnight",
	subcategory = "c_chatinfo",
	func = _G["C_ChatInfo"] and _G["C_ChatInfo"]["IsChatLineCensored"],
	funcPath = "C_ChatInfo.IsChatLineCensored",
	params = { { name = "chatLine", type = "number", default = nil } },
	returns = { { name = "isCensored", type = "bool", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_ChatInfo.IsPartyChannelType"] = {
	key = "C_ChatInfo.IsPartyChannelType",
	name = "IsPartyChannelType",
	category = "combat_midnight",
	subcategory = "c_chatinfo",
	func = _G["C_ChatInfo"] and _G["C_ChatInfo"]["IsPartyChannelType"],
	funcPath = "C_ChatInfo.IsPartyChannelType",
	params = { { name = "channelType", type = "ChatChannelType", default = nil } },
	returns = { { name = "isPartyChannelType", type = "bool", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_ChatInfo.IsTimerunningPlayer"] = {
	key = "C_ChatInfo.IsTimerunningPlayer",
	name = "IsTimerunningPlayer",
	category = "combat_midnight",
	subcategory = "c_chatinfo",
	func = _G["C_ChatInfo"] and _G["C_ChatInfo"]["IsTimerunningPlayer"],
	funcPath = "C_ChatInfo.IsTimerunningPlayer",
	params = { { name = "playerGUID", type = "WOWGUID", default = nil } },
	returns = { { name = "isTimerunning", type = "bool", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenTainted",
}

APIDefs["C_ChatInfo.IsValidChatLine"] = {
	key = "C_ChatInfo.IsValidChatLine",
	name = "IsValidChatLine",
	category = "combat_midnight",
	subcategory = "c_chatinfo",
	func = _G["C_ChatInfo"] and _G["C_ChatInfo"]["IsValidChatLine"],
	funcPath = "C_ChatInfo.IsValidChatLine",
	params = { { name = "chatLine", type = "number", default = nil } },
	returns = { { name = "isValid", type = "bool", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_ChatInfo.IsValidCombatFilterName"] = {
	key = "C_ChatInfo.IsValidCombatFilterName",
	name = "IsValidCombatFilterName",
	category = "combat_midnight",
	subcategory = "c_chatinfo",
	func = _G["C_ChatInfo"] and _G["C_ChatInfo"]["IsValidCombatFilterName"],
	funcPath = "C_ChatInfo.IsValidCombatFilterName",
	params = { { name = "name", type = "cstring", default = nil } },
	returns = { { name = "isApproved", type = "bool", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_ChatInfo.PerformEmote"] = {
	key = "C_ChatInfo.PerformEmote",
	name = "PerformEmote",
	category = "combat_midnight",
	subcategory = "c_chatinfo",
	func = _G["C_ChatInfo"] and _G["C_ChatInfo"]["PerformEmote"],
	funcPath = "C_ChatInfo.PerformEmote",
	params = {
		{ name = "emoteName", type = "cstring", default = nil },
		{ name = "targetName", type = "cstring", default = nil },
		{ name = "suppressMoveError", type = "bool", default = false },
	},
	returns = { { name = "success", type = "bool", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_ChatInfo.RegisterAddonMessagePrefix"] = {
	key = "C_ChatInfo.RegisterAddonMessagePrefix",
	name = "RegisterAddonMessagePrefix",
	category = "combat_midnight",
	subcategory = "c_chatinfo",
	func = _G["C_ChatInfo"] and _G["C_ChatInfo"]["RegisterAddonMessagePrefix"],
	funcPath = "C_ChatInfo.RegisterAddonMessagePrefix",
	params = {
		{
			name = "prefix",
			type = "cstring",
			default = nil,
			examples = {
				{ value = "ATT", label = "AllTheThings" },
				{ value = "ATTC", label = "AllTheThings" },
				{ value = "AstralKeys", label = "AstralKeys" },
			},
		},
	},
	returns = { { name = "result", type = "RegisterAddonMessagePrefixResult", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_ChatInfo.ReplaceIconAndGroupExpressions"] = {
	key = "C_ChatInfo.ReplaceIconAndGroupExpressions",
	name = "ReplaceIconAndGroupExpressions",
	category = "combat_midnight",
	subcategory = "c_chatinfo",
	func = _G["C_ChatInfo"] and _G["C_ChatInfo"]["ReplaceIconAndGroupExpressions"],
	funcPath = "C_ChatInfo.ReplaceIconAndGroupExpressions",
	params = {
		{ name = "input", type = "string", default = nil },
		{ name = "noIconReplacement", type = "bool", default = nil },
		{ name = "noGroupReplacement", type = "bool", default = nil },
	},
	returns = { { name = "output", type = "string", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenTainted",
}

APIDefs["C_ChatInfo.RequestCanLocalWhisperTarget"] = {
	key = "C_ChatInfo.RequestCanLocalWhisperTarget",
	name = "RequestCanLocalWhisperTarget",
	category = "combat_midnight",
	subcategory = "c_chatinfo",
	func = _G["C_ChatInfo"] and _G["C_ChatInfo"]["RequestCanLocalWhisperTarget"],
	funcPath = "C_ChatInfo.RequestCanLocalWhisperTarget",
	params = { { name = "whisperTarget", type = "WOWGUID", default = nil } },
	returns = {},
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_ChatInfo.SendAddonMessage"] = {
	key = "C_ChatInfo.SendAddonMessage",
	name = "SendAddonMessage",
	category = "combat_midnight",
	subcategory = "c_chatinfo",
	func = _G["C_ChatInfo"] and _G["C_ChatInfo"]["SendAddonMessage"],
	funcPath = "C_ChatInfo.SendAddonMessage",
	params = {
		{
			name = "prefix",
			type = "cstring",
			default = nil,
			examples = {
				{ value = "ATTC", label = "AllTheThings" },
				{ value = "ATTC", label = "AllTheThings" },
				{ value = "ATTC", label = "AllTheThings" },
			},
		},
		{ name = "message", type = "cstring", default = nil },
		{ name = "chatType", type = "cstring", default = nil },
		{ name = "target", type = "cstring", default = nil },
	},
	returns = { { name = "result", type = "SendAddonMessageResult", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=NotAllowed",
}

APIDefs["C_ChatInfo.SendAddonMessageLogged"] = {
	key = "C_ChatInfo.SendAddonMessageLogged",
	name = "SendAddonMessageLogged",
	category = "combat_midnight",
	subcategory = "c_chatinfo",
	func = _G["C_ChatInfo"] and _G["C_ChatInfo"]["SendAddonMessageLogged"],
	funcPath = "C_ChatInfo.SendAddonMessageLogged",
	params = {
		{
			name = "prefix",
			type = "cstring",
			default = nil,
			examples = {
				{ value = "priority", label = "DBM-Core" },
				{ value = "priority", label = "DBM-Core" },
				{ value = "prio", label = "NoAutoClose" },
			},
		},
		{ name = "message", type = "cstring", default = nil },
		{ name = "chatType", type = "cstring", default = nil },
		{ name = "target", type = "cstring", default = nil },
	},
	returns = { { name = "result", type = "SendAddonMessageResult", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=NotAllowed",
}

APIDefs["C_ChatInfo.SendCautionaryChatMessage"] = {
	key = "C_ChatInfo.SendCautionaryChatMessage",
	name = "SendCautionaryChatMessage",
	category = "combat_midnight",
	subcategory = "c_chatinfo",
	func = _G["C_ChatInfo"] and _G["C_ChatInfo"]["SendCautionaryChatMessage"],
	funcPath = "C_ChatInfo.SendCautionaryChatMessage",
	params = { { name = "confirmNumber", type = "number", default = nil } },
	returns = {},
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_ChatInfo.SendChatMessage"] = {
	key = "C_ChatInfo.SendChatMessage",
	name = "SendChatMessage",
	category = "combat_midnight",
	subcategory = "c_chatinfo",
	func = _G["C_ChatInfo"] and _G["C_ChatInfo"]["SendChatMessage"],
	funcPath = "C_ChatInfo.SendChatMessage",
	params = {
		{
			name = "message",
			type = "cstring",
			default = nil,
			examples = {
				{ value = [=[format("%%t " .. unitTag .. "(%d%%)%s"]=], label = "Leatrix_Plus" },
				{ value = [=[format("%%t " .. unitTag .. "(%d%%)%s"]=], label = "Leatrix_Plus" },
				{ value = "Quickly take orbs to these positions and click.", label = "Leatrix_Plus" },
			},
		},
		{ name = "chatType", type = "SendChatMessageType", default = nil },
		{ name = "languageID", type = "number", default = nil },
		{ name = "target", type = "cstring", default = nil },
	},
	returns = {},
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_ChatInfo.SwapChatChannelsByChannelIndex"] = {
	key = "C_ChatInfo.SwapChatChannelsByChannelIndex",
	name = "SwapChatChannelsByChannelIndex",
	category = "combat_midnight",
	subcategory = "c_chatinfo",
	func = _G["C_ChatInfo"] and _G["C_ChatInfo"]["SwapChatChannelsByChannelIndex"],
	funcPath = "C_ChatInfo.SwapChatChannelsByChannelIndex",
	params = {
		{ name = "firstChannelIndex", type = "luaIndex", default = nil },
		{ name = "secondChannelIndex", type = "luaIndex", default = nil },
	},
	returns = {},
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_ChatInfo.UncensorChatLine"] = {
	key = "C_ChatInfo.UncensorChatLine",
	name = "UncensorChatLine",
	category = "combat_midnight",
	subcategory = "c_chatinfo",
	func = _G["C_ChatInfo"] and _G["C_ChatInfo"]["UncensorChatLine"],
	funcPath = "C_ChatInfo.UncensorChatLine",
	params = { { name = "chatLine", type = "number", default = nil } },
	returns = {},
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}
