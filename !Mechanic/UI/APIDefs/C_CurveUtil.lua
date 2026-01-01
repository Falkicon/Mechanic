-- Generated APIDefinitions for namespace: C_CurveUtil
local _, ns = ...
local APIDefs = ns.APIDefinitions

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
