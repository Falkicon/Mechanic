-- Generated APIDefinitions for namespace: C_CampaignInfo
local _, ns = ...
local APIDefs = ns.APIDefinitions

APIDefs["C_CampaignInfo.GetCampaignChapterInfo"] = {
	key = "C_CampaignInfo.GetCampaignChapterInfo",
	name = "GetCampaignChapterInfo",
	category = "combat_midnight",
	subcategory = "c_campaigninfo",
	func = _G["C_CampaignInfo"] and _G["C_CampaignInfo"]["GetCampaignChapterInfo"],
	funcPath = "C_CampaignInfo.GetCampaignChapterInfo",
	params = { { name = "campaignChapterID", type = "number", default = nil } },
	returns = { { name = "campaignChapterInfo", type = "CampaignChapterInfo", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_CampaignInfo.GetCampaignID"] = {
	key = "C_CampaignInfo.GetCampaignID",
	name = "GetCampaignID",
	category = "combat_midnight",
	subcategory = "c_campaigninfo",
	func = _G["C_CampaignInfo"] and _G["C_CampaignInfo"]["GetCampaignID"],
	funcPath = "C_CampaignInfo.GetCampaignID",
	params = { { name = "questID", type = "number", default = nil } },
	returns = { { name = "campaignID", type = "number", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_CampaignInfo.GetCampaignInfo"] = {
	key = "C_CampaignInfo.GetCampaignInfo",
	name = "GetCampaignInfo",
	category = "combat_midnight",
	subcategory = "c_campaigninfo",
	func = _G["C_CampaignInfo"] and _G["C_CampaignInfo"]["GetCampaignInfo"],
	funcPath = "C_CampaignInfo.GetCampaignInfo",
	params = { { name = "campaignID", type = "number", default = nil } },
	returns = { { name = "campaignInfo", type = "CampaignInfo", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_CampaignInfo.GetChapterIDs"] = {
	key = "C_CampaignInfo.GetChapterIDs",
	name = "GetChapterIDs",
	category = "combat_midnight",
	subcategory = "c_campaigninfo",
	func = _G["C_CampaignInfo"] and _G["C_CampaignInfo"]["GetChapterIDs"],
	funcPath = "C_CampaignInfo.GetChapterIDs",
	params = { { name = "campaignID", type = "number", default = nil } },
	returns = { { name = "chapterIDs", type = "table", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_CampaignInfo.GetCurrentChapterID"] = {
	key = "C_CampaignInfo.GetCurrentChapterID",
	name = "GetCurrentChapterID",
	category = "combat_midnight",
	subcategory = "c_campaigninfo",
	func = _G["C_CampaignInfo"] and _G["C_CampaignInfo"]["GetCurrentChapterID"],
	funcPath = "C_CampaignInfo.GetCurrentChapterID",
	params = { { name = "campaignID", type = "number", default = nil } },
	returns = { { name = "currentChapterID", type = "number", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_CampaignInfo.GetFailureReason"] = {
	key = "C_CampaignInfo.GetFailureReason",
	name = "GetFailureReason",
	category = "combat_midnight",
	subcategory = "c_campaigninfo",
	func = _G["C_CampaignInfo"] and _G["C_CampaignInfo"]["GetFailureReason"],
	funcPath = "C_CampaignInfo.GetFailureReason",
	params = { { name = "campaignID", type = "number", default = nil } },
	returns = { { name = "failureReason", type = "CampaignFailureReason", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_CampaignInfo.GetState"] = {
	key = "C_CampaignInfo.GetState",
	name = "GetState",
	category = "combat_midnight",
	subcategory = "c_campaigninfo",
	func = _G["C_CampaignInfo"] and _G["C_CampaignInfo"]["GetState"],
	funcPath = "C_CampaignInfo.GetState",
	params = { { name = "campaignID", type = "number", default = nil } },
	returns = { { name = "state", type = "CampaignState", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_CampaignInfo.IsCampaignQuest"] = {
	key = "C_CampaignInfo.IsCampaignQuest",
	name = "IsCampaignQuest",
	category = "combat_midnight",
	subcategory = "c_campaigninfo",
	func = _G["C_CampaignInfo"] and _G["C_CampaignInfo"]["IsCampaignQuest"],
	funcPath = "C_CampaignInfo.IsCampaignQuest",
	params = { { name = "questID", type = "number", default = nil } },
	returns = { { name = "isCampaignQuest", type = "bool", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_CampaignInfo.SortAsNormalQuest"] = {
	key = "C_CampaignInfo.SortAsNormalQuest",
	name = "SortAsNormalQuest",
	category = "combat_midnight",
	subcategory = "c_campaigninfo",
	func = _G["C_CampaignInfo"] and _G["C_CampaignInfo"]["SortAsNormalQuest"],
	funcPath = "C_CampaignInfo.SortAsNormalQuest",
	params = { { name = "campaignID", type = "number", default = nil } },
	returns = { { name = "sortAsNormalQuest", type = "bool", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}
