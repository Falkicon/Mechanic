-- Generated APIDefinitions for namespace: C_FrameManager
local _, ns = ...
local APIDefs = ns.APIDefinitions

APIDefs["C_FrameManager.GetFrameVisibilityState"] = {
	key = "C_FrameManager.GetFrameVisibilityState",
	name = "GetFrameVisibilityState",
	category = "combat_midnight",
	subcategory = "c_framemanager",
	func = _G["C_FrameManager"] and _G["C_FrameManager"]["GetFrameVisibilityState"],
	funcPath = "C_FrameManager.GetFrameVisibilityState",
	params = { { name = "frameType", type = "UIFrameType", default = nil } },
	returns = { { name = "shouldShow", type = "bool", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}
