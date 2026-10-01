-- Generated APIDefinitions for namespace: C_LimitedInput
local _, ns = ...
local APIDefs = ns.APIDefinitions

APIDefs["C_LimitedInput.LimitedInputAllowed"] = {
    key = "C_LimitedInput.LimitedInputAllowed",
    name = "LimitedInputAllowed",
    category = "general",
    subcategory = "c_limitedinput",
    funcPath = "C_LimitedInput.LimitedInputAllowed",
    params = { { name = "type", type = "LimitedInputType", default = nil } },
    returns = { { name = "allowed", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}
