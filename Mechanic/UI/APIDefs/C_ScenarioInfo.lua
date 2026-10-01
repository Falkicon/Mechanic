-- Generated APIDefinitions for namespace: C_ScenarioInfo
local _, ns = ...
local APIDefs = ns.APIDefinitions

APIDefs["C_ScenarioInfo.GetCriteriaInfo"] = {
    key = "C_ScenarioInfo.GetCriteriaInfo",
    name = "GetCriteriaInfo",
    category = "general",
    subcategory = "c_scenarioinfo",
    funcPath = "C_ScenarioInfo.GetCriteriaInfo",
    params = { { name = "criteriaIndex", type = "number", default = nil } },
    returns = { { name = "scenarioCriteriaInfo", type = "ScenarioCriteriaInfo", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_ScenarioInfo.GetCriteriaInfoByStep"] = {
    key = "C_ScenarioInfo.GetCriteriaInfoByStep",
    name = "GetCriteriaInfoByStep",
    category = "general",
    subcategory = "c_scenarioinfo",
    funcPath = "C_ScenarioInfo.GetCriteriaInfoByStep",
    params = { { name = "stepID", type = "number", default = nil }, { name = "criteriaIndex", type = "number", default = nil } },
    returns = { { name = "scenarioCriteriaInfo", type = "ScenarioCriteriaInfo", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_ScenarioInfo.GetJailersTowerTypeString"] = {
    key = "C_ScenarioInfo.GetJailersTowerTypeString",
    name = "GetJailersTowerTypeString",
    category = "general",
    subcategory = "c_scenarioinfo",
    funcPath = "C_ScenarioInfo.GetJailersTowerTypeString",
    params = { { name = "runType", type = "JailersTowerType", default = nil } },
    returns = { { name = "typeString", type = "cstring", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_ScenarioInfo.GetScenarioInfo"] = {
    key = "C_ScenarioInfo.GetScenarioInfo",
    name = "GetScenarioInfo",
    category = "general",
    subcategory = "c_scenarioinfo",
    funcPath = "C_ScenarioInfo.GetScenarioInfo",
    params = {  },
    returns = { { name = "scenarioInfo", type = "ScenarioInformation", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["C_ScenarioInfo.GetScenarioStepInfo"] = {
    key = "C_ScenarioInfo.GetScenarioStepInfo",
    name = "GetScenarioStepInfo",
    category = "general",
    subcategory = "c_scenarioinfo",
    funcPath = "C_ScenarioInfo.GetScenarioStepInfo",
    params = { { name = "scenarioStepID", type = "number", default = nil } },
    returns = { { name = "scenarioStepInfo", type = "ScenarioStepInfo", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}
