-- Generated APIDefinitions for namespace: C_CurveUtil
local _, ns = ...
local APIDefs = ns.APIDefinitions

APIDefs["C_CurveUtil.CreateColorCurve"] = {
    key = "C_CurveUtil.CreateColorCurve",
    name = "CreateColorCurve",
    category = "general",
    subcategory = "c_curveutil",
    func = _G["C_CurveUtil"] and _G["C_CurveUtil"]["CreateColorCurve"],
    funcPath = "C_CurveUtil.CreateColorCurve",
    params = {  },
    returns = { { name = "curve", type = "LuaColorCurveObject", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["C_CurveUtil.CreateCurve"] = {
    key = "C_CurveUtil.CreateCurve",
    name = "CreateCurve",
    category = "general",
    subcategory = "c_curveutil",
    func = _G["C_CurveUtil"] and _G["C_CurveUtil"]["CreateCurve"],
    funcPath = "C_CurveUtil.CreateCurve",
    params = {  },
    returns = { { name = "curve", type = "LuaCurveObject", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["C_CurveUtil.EvaluateGameCurve"] = {
    key = "C_CurveUtil.EvaluateGameCurve",
    name = "EvaluateGameCurve",
    category = "combat_midnight",
    subcategory = "c_curveutil",
    func = _G["C_CurveUtil"] and _G["C_CurveUtil"]["EvaluateGameCurve"],
    funcPath = "C_CurveUtil.EvaluateGameCurve",
    params = { { name = "curveID", type = "number", default = nil }, { name = "x", type = "number", default = nil } },
    returns = { { name = "y", type = "number", canBeSecret = false } },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}
