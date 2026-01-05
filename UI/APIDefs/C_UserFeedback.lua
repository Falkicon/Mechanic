-- Generated APIDefinitions for namespace: C_UserFeedback
local _, ns = ...
local APIDefs = ns.APIDefinitions

APIDefs["C_UserFeedback.SubmitBug"] = {
    key = "C_UserFeedback.SubmitBug",
    name = "SubmitBug",
    category = "combat_midnight",
    subcategory = "c_userfeedback",
    func = _G["C_UserFeedback"] and _G["C_UserFeedback"]["SubmitBug"],
    funcPath = "C_UserFeedback.SubmitBug",
    params = { { name = "bugInfo", type = "cstring", default = nil }, { name = "suppressNotification", type = "bool", default = false } },
    returns = { { name = "success", type = "bool", canBeSecret = false } },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_UserFeedback.SubmitSuggestion"] = {
    key = "C_UserFeedback.SubmitSuggestion",
    name = "SubmitSuggestion",
    category = "combat_midnight",
    subcategory = "c_userfeedback",
    func = _G["C_UserFeedback"] and _G["C_UserFeedback"]["SubmitSuggestion"],
    funcPath = "C_UserFeedback.SubmitSuggestion",
    params = { { name = "suggestion", type = "cstring", default = nil } },
    returns = { { name = "success", type = "bool", canBeSecret = false } },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}
