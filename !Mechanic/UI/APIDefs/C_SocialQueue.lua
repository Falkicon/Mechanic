-- Generated APIDefinitions for namespace: C_SocialQueue
local _, ns = ...
local APIDefs = ns.APIDefinitions

APIDefs["C_SocialQueue.GetAllGroups"] = {
	key = "C_SocialQueue.GetAllGroups",
	name = "GetAllGroups",
	category = "combat_midnight",
	subcategory = "c_socialqueue",
	func = _G["C_SocialQueue"] and _G["C_SocialQueue"]["GetAllGroups"],
	funcPath = "C_SocialQueue.GetAllGroups",
	params = {
		{ name = "allowNonJoinable", type = "bool", default = false },
		{ name = "allowNonQueuedGroups", type = "bool", default = false },
	},
	returns = { { name = "groupGUIDs", type = "table", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_SocialQueue.GetGroupForPlayer"] = {
	key = "C_SocialQueue.GetGroupForPlayer",
	name = "GetGroupForPlayer",
	category = "combat_midnight",
	subcategory = "c_socialqueue",
	func = _G["C_SocialQueue"] and _G["C_SocialQueue"]["GetGroupForPlayer"],
	funcPath = "C_SocialQueue.GetGroupForPlayer",
	params = { { name = "playerGUID", type = "WOWGUID", default = nil } },
	returns = {
		{ name = "groupGUID", type = "WOWGUID", canBeSecret = false },
		{ name = "isSoloQueueParty", type = "bool", canBeSecret = false },
	},
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_SocialQueue.GetGroupInfo"] = {
	key = "C_SocialQueue.GetGroupInfo",
	name = "GetGroupInfo",
	category = "combat_midnight",
	subcategory = "c_socialqueue",
	func = _G["C_SocialQueue"] and _G["C_SocialQueue"]["GetGroupInfo"],
	funcPath = "C_SocialQueue.GetGroupInfo",
	params = { { name = "groupGUID", type = "WOWGUID", default = nil } },
	returns = {
		{ name = "canJoin", type = "bool", canBeSecret = false },
		{ name = "numQueues", type = "number", canBeSecret = false },
		{ name = "needTank", type = "bool", canBeSecret = false },
		{ name = "needHealer", type = "bool", canBeSecret = false },
		{ name = "needDamage", type = "bool", canBeSecret = false },
		{ name = "isSoloQueueParty", type = "bool", canBeSecret = false },
		{ name = "questSessionActive", type = "bool", canBeSecret = false },
		{ name = "leaderGUID", type = "WOWGUID", canBeSecret = false },
	},
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_SocialQueue.GetGroupMembers"] = {
	key = "C_SocialQueue.GetGroupMembers",
	name = "GetGroupMembers",
	category = "combat_midnight",
	subcategory = "c_socialqueue",
	func = _G["C_SocialQueue"] and _G["C_SocialQueue"]["GetGroupMembers"],
	funcPath = "C_SocialQueue.GetGroupMembers",
	params = { { name = "groupGUID", type = "WOWGUID", default = nil } },
	returns = { { name = "groupMembers", type = "table", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_SocialQueue.GetGroupQueues"] = {
	key = "C_SocialQueue.GetGroupQueues",
	name = "GetGroupQueues",
	category = "combat_midnight",
	subcategory = "c_socialqueue",
	func = _G["C_SocialQueue"] and _G["C_SocialQueue"]["GetGroupQueues"],
	funcPath = "C_SocialQueue.GetGroupQueues",
	params = { { name = "groupGUID", type = "WOWGUID", default = nil } },
	returns = { { name = "queues", type = "table", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_SocialQueue.RequestToJoin"] = {
	key = "C_SocialQueue.RequestToJoin",
	name = "RequestToJoin",
	category = "combat_midnight",
	subcategory = "c_socialqueue",
	func = _G["C_SocialQueue"] and _G["C_SocialQueue"]["RequestToJoin"],
	funcPath = "C_SocialQueue.RequestToJoin",
	params = {
		{ name = "groupGUID", type = "WOWGUID", default = nil },
		{ name = "applyAsTank", type = "bool", default = false },
		{ name = "applyAsHealer", type = "bool", default = false },
		{ name = "applyAsDamage", type = "bool", default = false },
	},
	returns = { { name = "requestSuccessful", type = "bool", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_SocialQueue.SignalToastDisplayed"] = {
	key = "C_SocialQueue.SignalToastDisplayed",
	name = "SignalToastDisplayed",
	category = "combat_midnight",
	subcategory = "c_socialqueue",
	func = _G["C_SocialQueue"] and _G["C_SocialQueue"]["SignalToastDisplayed"],
	funcPath = "C_SocialQueue.SignalToastDisplayed",
	params = {
		{ name = "groupGUID", type = "WOWGUID", default = nil },
		{ name = "priority", type = "number", default = nil },
	},
	returns = {},
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}
