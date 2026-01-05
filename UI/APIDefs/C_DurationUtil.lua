-- Generated APIDefinitions for namespace: C_DurationUtil
local _, ns = ...
local APIDefs = ns.APIDefinitions

APIDefs["C_DurationUtil.CreateDuration"] = {
    key = "C_DurationUtil.CreateDuration",
    name = "CreateDuration",
    category = "general",
    subcategory = "c_durationutil",
    func = _G["C_DurationUtil"] and _G["C_DurationUtil"]["CreateDuration"],
    funcPath = "C_DurationUtil.CreateDuration",
    params = {  },
    returns = { { name = "duration", type = "LuaDurationObject", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["C_DurationUtil.GetCurrentTime"] = {
    key = "C_DurationUtil.GetCurrentTime",
    name = "GetCurrentTime",
    category = "general",
    subcategory = "c_durationutil",
    func = _G["C_DurationUtil"] and _G["C_DurationUtil"]["GetCurrentTime"],
    funcPath = "C_DurationUtil.GetCurrentTime",
    params = {  },
    returns = { { name = "currentTime", type = "FrameTime", canBeSecret = false } },
    midnightImpact = "NORMAL",
}
