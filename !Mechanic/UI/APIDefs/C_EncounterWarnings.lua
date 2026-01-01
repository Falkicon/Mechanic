-- Generated APIDefinitions for namespace: C_EncounterWarnings
local _, ns = ...
local APIDefs = ns.APIDefinitions

APIDefs["C_EncounterWarnings.GetEditModeWarningInfo"] = {
	key = "C_EncounterWarnings.GetEditModeWarningInfo",
	name = "GetEditModeWarningInfo",
	category = "combat_midnight",
	subcategory = "c_encounterwarnings",
	func = _G["C_EncounterWarnings"] and _G["C_EncounterWarnings"]["GetEditModeWarningInfo"],
	funcPath = "C_EncounterWarnings.GetEditModeWarningInfo",
	params = { { name = "severity", type = "EncounterEventSeverity", default = nil } },
	returns = { { name = "warningInfo", type = "EncounterWarningInfo", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_EncounterWarnings.GetSoundKitForSeverity"] = {
	key = "C_EncounterWarnings.GetSoundKitForSeverity",
	name = "GetSoundKitForSeverity",
	category = "combat_midnight",
	subcategory = "c_encounterwarnings",
	func = _G["C_EncounterWarnings"] and _G["C_EncounterWarnings"]["GetSoundKitForSeverity"],
	funcPath = "C_EncounterWarnings.GetSoundKitForSeverity",
	params = { { name = "severity", type = "EncounterEventSeverity", default = nil } },
	returns = { { name = "soundKitID", type = "number", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_EncounterWarnings.PlaySound"] = {
	key = "C_EncounterWarnings.PlaySound",
	name = "PlaySound",
	category = "combat_midnight",
	subcategory = "c_encounterwarnings",
	func = _G["C_EncounterWarnings"] and _G["C_EncounterWarnings"]["PlaySound"],
	funcPath = "C_EncounterWarnings.PlaySound",
	params = {
		{
			name = "severity",
			type = "EncounterEventSeverity",
			default = nil,
			examples = {
				{ value = 856, label = "WeakAurasOptions" },
				{ value = 857, label = "WeakAurasOptions" },
				{ value = 852, label = "WeakAurasOptions" },
			},
		},
	},
	returns = { { name = "soundHandle", type = "number", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}
