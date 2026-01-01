-- Generated APIDefinitions for namespace: C_CovenantPreview
local _, ns = ...
local APIDefs = ns.APIDefinitions

APIDefs["C_CovenantPreview.GetCovenantInfoForPlayerChoiceResponseID"] = {
	key = "C_CovenantPreview.GetCovenantInfoForPlayerChoiceResponseID",
	name = "GetCovenantInfoForPlayerChoiceResponseID",
	category = "combat_midnight",
	subcategory = "c_covenantpreview",
	func = _G["C_CovenantPreview"] and _G["C_CovenantPreview"]["GetCovenantInfoForPlayerChoiceResponseID"],
	funcPath = "C_CovenantPreview.GetCovenantInfoForPlayerChoiceResponseID",
	params = { { name = "playerChoiceResponseID", type = "number", default = nil } },
	returns = { { name = "previewInfo", type = "CovenantPreviewInfo", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}
