-- Generated APIDefinitions for namespace: C_CovenantPreview
local _, ns = ...
local APIDefs = ns.APIDefinitions

APIDefs["C_CovenantPreview.CloseFromUI"] = {
    key = "C_CovenantPreview.CloseFromUI",
    name = "CloseFromUI",
    category = "general",
    subcategory = "c_covenantpreview",
    funcPath = "C_CovenantPreview.CloseFromUI",
    params = {  },
    returns = {  },
    midnightImpact = "NORMAL",
}

APIDefs["C_CovenantPreview.GetCovenantInfoForPlayerChoiceResponseID"] = {
    key = "C_CovenantPreview.GetCovenantInfoForPlayerChoiceResponseID",
    name = "GetCovenantInfoForPlayerChoiceResponseID",
    category = "general",
    subcategory = "c_covenantpreview",
    funcPath = "C_CovenantPreview.GetCovenantInfoForPlayerChoiceResponseID",
    params = { { name = "playerChoiceResponseID", type = "number", default = nil } },
    returns = { { name = "previewInfo", type = "CovenantPreviewInfo", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}
