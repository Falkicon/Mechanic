-- Generated APIDefinitions for namespace: C_ReportSystem
local _, ns = ...
local APIDefs = ns.APIDefinitions

APIDefs["C_ReportSystem.CanReportPlayer"] = {
	key = "C_ReportSystem.CanReportPlayer",
	name = "CanReportPlayer",
	category = "combat_midnight",
	subcategory = "c_reportsystem",
	func = _G["C_ReportSystem"] and _G["C_ReportSystem"]["CanReportPlayer"],
	funcPath = "C_ReportSystem.CanReportPlayer",
	params = { { name = "playerLocation", type = "PlayerLocation", default = nil } },
	returns = { { name = "canReport", type = "bool", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_ReportSystem.CanReportPlayerForLanguage"] = {
	key = "C_ReportSystem.CanReportPlayerForLanguage",
	name = "CanReportPlayerForLanguage",
	category = "combat_midnight",
	subcategory = "c_reportsystem",
	func = _G["C_ReportSystem"] and _G["C_ReportSystem"]["CanReportPlayerForLanguage"],
	funcPath = "C_ReportSystem.CanReportPlayerForLanguage",
	params = { { name = "playerLocation", type = "PlayerLocation", default = nil } },
	returns = { { name = "canReport", type = "bool", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_ReportSystem.GetMajorCategoriesForReportType"] = {
	key = "C_ReportSystem.GetMajorCategoriesForReportType",
	name = "GetMajorCategoriesForReportType",
	category = "combat_midnight",
	subcategory = "c_reportsystem",
	func = _G["C_ReportSystem"] and _G["C_ReportSystem"]["GetMajorCategoriesForReportType"],
	funcPath = "C_ReportSystem.GetMajorCategoriesForReportType",
	params = { { name = "reportType", type = "ReportType", default = nil } },
	returns = { { name = "majorCategories", type = "table", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_ReportSystem.GetMajorCategoryString"] = {
	key = "C_ReportSystem.GetMajorCategoryString",
	name = "GetMajorCategoryString",
	category = "combat_midnight",
	subcategory = "c_reportsystem",
	func = _G["C_ReportSystem"] and _G["C_ReportSystem"]["GetMajorCategoryString"],
	funcPath = "C_ReportSystem.GetMajorCategoryString",
	params = { { name = "majorCategory", type = "ReportMajorCategory", default = nil } },
	returns = { { name = "majorCategoryString", type = "cstring", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_ReportSystem.GetMinorCategoriesForReportTypeAndMajorCategory"] = {
	key = "C_ReportSystem.GetMinorCategoriesForReportTypeAndMajorCategory",
	name = "GetMinorCategoriesForReportTypeAndMajorCategory",
	category = "combat_midnight",
	subcategory = "c_reportsystem",
	func = _G["C_ReportSystem"] and _G["C_ReportSystem"]["GetMinorCategoriesForReportTypeAndMajorCategory"],
	funcPath = "C_ReportSystem.GetMinorCategoriesForReportTypeAndMajorCategory",
	params = {
		{ name = "reportType", type = "ReportType", default = nil },
		{ name = "majorCategory", type = "ReportMajorCategory", default = nil },
	},
	returns = { { name = "minorCategories", type = "table", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_ReportSystem.GetMinorCategoryString"] = {
	key = "C_ReportSystem.GetMinorCategoryString",
	name = "GetMinorCategoryString",
	category = "combat_midnight",
	subcategory = "c_reportsystem",
	func = _G["C_ReportSystem"] and _G["C_ReportSystem"]["GetMinorCategoryString"],
	funcPath = "C_ReportSystem.GetMinorCategoryString",
	params = { { name = "minorCategory", type = "ReportMinorCategory", default = nil } },
	returns = { { name = "minorCategoryString", type = "cstring", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_ReportSystem.RequiresScreenshotForReportType"] = {
	key = "C_ReportSystem.RequiresScreenshotForReportType",
	name = "RequiresScreenshotForReportType",
	category = "combat_midnight",
	subcategory = "c_reportsystem",
	func = _G["C_ReportSystem"] and _G["C_ReportSystem"]["RequiresScreenshotForReportType"],
	funcPath = "C_ReportSystem.RequiresScreenshotForReportType",
	params = {
		{ name = "reportType", type = "ReportType", default = nil },
		{ name = "majorCategory", type = "ReportMajorCategory", default = nil },
	},
	returns = { { name = "requiresScreenshot", type = "bool", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_ReportSystem.SendReport"] = {
	key = "C_ReportSystem.SendReport",
	name = "SendReport",
	category = "combat_midnight",
	subcategory = "c_reportsystem",
	func = _G["C_ReportSystem"] and _G["C_ReportSystem"]["SendReport"],
	funcPath = "C_ReportSystem.SendReport",
	params = {
		{ name = "reportInfo", type = "ReportInfo", default = nil },
		{ name = "playerLocation", type = "PlayerLocation", default = nil },
	},
	returns = {},
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_ReportSystem.SetScreenshotPreviewTexture"] = {
	key = "C_ReportSystem.SetScreenshotPreviewTexture",
	name = "SetScreenshotPreviewTexture",
	category = "combat_midnight",
	subcategory = "c_reportsystem",
	func = _G["C_ReportSystem"] and _G["C_ReportSystem"]["SetScreenshotPreviewTexture"],
	funcPath = "C_ReportSystem.SetScreenshotPreviewTexture",
	params = { { name = "textureObject", type = "SimpleTexture", default = nil } },
	returns = {},
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}
