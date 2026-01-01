-- Generated APIDefinitions for namespace: C_PlayerMentorship
local _, ns = ...
local APIDefs = ns.APIDefinitions

APIDefs["C_PlayerMentorship.GetMentorshipStatus"] = {
	key = "C_PlayerMentorship.GetMentorshipStatus",
	name = "GetMentorshipStatus",
	category = "combat_midnight",
	subcategory = "c_playermentorship",
	func = _G["C_PlayerMentorship"] and _G["C_PlayerMentorship"]["GetMentorshipStatus"],
	funcPath = "C_PlayerMentorship.GetMentorshipStatus",
	params = { { name = "playerLocation", type = "PlayerLocation", default = nil } },
	returns = { { name = "status", type = "PlayerMentorshipStatus", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}
