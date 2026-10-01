-- Generated APIDefinitions for namespace: C_WowSurvey
local _, ns = ...
local APIDefs = ns.APIDefinitions

APIDefs["C_WowSurvey.OpenSurvey"] = {
    key = "C_WowSurvey.OpenSurvey",
    name = "OpenSurvey",
    category = "general",
    subcategory = "c_wowsurvey",
    funcPath = "C_WowSurvey.OpenSurvey",
    params = {  },
    returns = {  },
    midnightImpact = "NORMAL",
}

APIDefs["C_WowSurvey.TriggerSurveyServe"] = {
    key = "C_WowSurvey.TriggerSurveyServe",
    name = "TriggerSurveyServe",
    category = "general",
    subcategory = "c_wowsurvey",
    funcPath = "C_WowSurvey.TriggerSurveyServe",
    params = { { name = "deliveryMoment", type = "SurveyDeliveryMoment", default = nil } },
    returns = {  },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}
