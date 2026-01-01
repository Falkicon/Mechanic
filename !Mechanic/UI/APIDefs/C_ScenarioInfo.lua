-- Generated APIDefinitions for namespace: C_ScenarioInfo
local _, ns = ...
local APIDefs = ns.APIDefinitions

APIDefs["C_ScenarioInfo.GetCriteriaInfo"] = {
	key = "C_ScenarioInfo.GetCriteriaInfo",
	name = "GetCriteriaInfo",
	category = "combat_midnight",
	subcategory = "c_scenarioinfo",
	func = _G["C_ScenarioInfo"] and _G["C_ScenarioInfo"]["GetCriteriaInfo"],
	funcPath = "C_ScenarioInfo.GetCriteriaInfo",
	params = {
		{
			name = "criteriaIndex",
			type = "number",
			default = nil,
			examples = { { value = "t", label = "AllTheThings" } },
		},
	},
	returns = { { name = "scenarioCriteriaInfo", type = "ScenarioCriteriaInfo", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_ScenarioInfo.GetCriteriaInfoByStep"] = {
	key = "C_ScenarioInfo.GetCriteriaInfoByStep",
	name = "GetCriteriaInfoByStep",
	category = "combat_midnight",
	subcategory = "c_scenarioinfo",
	func = _G["C_ScenarioInfo"] and _G["C_ScenarioInfo"]["GetCriteriaInfoByStep"],
	funcPath = "C_ScenarioInfo.GetCriteriaInfoByStep",
	params = {
		{ name = "stepID", type = "number", default = nil },
		{ name = "criteriaIndex", type = "number", default = nil },
	},
	returns = { { name = "scenarioCriteriaInfo", type = "ScenarioCriteriaInfo", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_ScenarioInfo.GetJailersTowerTypeString"] = {
	key = "C_ScenarioInfo.GetJailersTowerTypeString",
	name = "GetJailersTowerTypeString",
	category = "combat_midnight",
	subcategory = "c_scenarioinfo",
	func = _G["C_ScenarioInfo"] and _G["C_ScenarioInfo"]["GetJailersTowerTypeString"],
	funcPath = "C_ScenarioInfo.GetJailersTowerTypeString",
	params = { { name = "runType", type = "JailersTowerType", default = nil } },
	returns = { { name = "typeString", type = "cstring", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_ScenarioInfo.GetScenarioStepInfo"] = {
	key = "C_ScenarioInfo.GetScenarioStepInfo",
	name = "GetScenarioStepInfo",
	category = "combat_midnight",
	subcategory = "c_scenarioinfo",
	func = _G["C_ScenarioInfo"] and _G["C_ScenarioInfo"]["GetScenarioStepInfo"],
	funcPath = "C_ScenarioInfo.GetScenarioStepInfo",
	params = { { name = "scenarioStepID", type = "number", default = nil } },
	returns = { { name = "scenarioStepInfo", type = "ScenarioStepInfo", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}
