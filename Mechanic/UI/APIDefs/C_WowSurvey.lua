-- Generated APIDefinitions for namespace: C_WowSurvey
local _, ns = ...
local APIDefs = ns.APIDefinitions

APIDefs["C_WowSurvey.OpenSurvey"] = {
    key = "C_WowSurvey.OpenSurvey",
    name = "OpenSurvey",
    category = "general",
    subcategory = "c_wowsurvey",
    func = _G["C_WowSurvey"] and _G["C_WowSurvey"]["OpenSurvey"],
    funcPath = "C_WowSurvey.OpenSurvey",
    params = {  },
    returns = {  },
    midnightImpact = "NORMAL",
}

APIDefs["C_WowSurvey.TriggerSurveyServe"] = {
    key = "C_WowSurvey.TriggerSurveyServe",
    name = "TriggerSurveyServe",
    category = "combat_midnight",
    subcategory = "c_wowsurvey",
    func = _G["C_WowSurvey"] and _G["C_WowSurvey"]["TriggerSurveyServe"],
    funcPath = "C_WowSurvey.TriggerSurveyServe",
    params = { { name = "deliveryMoment", type = "SurveyDeliveryMoment", default = nil } },
    returns = {  },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}
