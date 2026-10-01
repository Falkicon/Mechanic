-- Generated APIDefinitions for namespace: C_FrameManager
local _, ns = ...
local APIDefs = ns.APIDefinitions

APIDefs["C_FrameManager.GetFrameVisibilityState"] = {
    key = "C_FrameManager.GetFrameVisibilityState",
    name = "GetFrameVisibilityState",
    category = "ui",
    subcategory = "c_framemanager",
    funcPath = "C_FrameManager.GetFrameVisibilityState",
    params = { { name = "frameType", type = "UIFrameType", default = nil } },
    returns = { { name = "shouldShow", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}
