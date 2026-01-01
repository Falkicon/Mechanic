-- Generated APIDefinitions for namespace: C_PlayerInteractionManager
local _, ns = ...
local APIDefs = ns.APIDefinitions

APIDefs["C_PlayerInteractionManager.ClearInteraction"] = {
	key = "C_PlayerInteractionManager.ClearInteraction",
	name = "ClearInteraction",
	category = "combat_midnight",
	subcategory = "c_playerinteractionmanager",
	func = _G["C_PlayerInteractionManager"] and _G["C_PlayerInteractionManager"]["ClearInteraction"],
	funcPath = "C_PlayerInteractionManager.ClearInteraction",
	params = { { name = "type", type = "PlayerInteractionType", default = nil } },
	returns = {},
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_PlayerInteractionManager.ConfirmationInteraction"] = {
	key = "C_PlayerInteractionManager.ConfirmationInteraction",
	name = "ConfirmationInteraction",
	category = "combat_midnight",
	subcategory = "c_playerinteractionmanager",
	func = _G["C_PlayerInteractionManager"] and _G["C_PlayerInteractionManager"]["ConfirmationInteraction"],
	funcPath = "C_PlayerInteractionManager.ConfirmationInteraction",
	params = { { name = "type", type = "PlayerInteractionType", default = nil } },
	returns = {},
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_PlayerInteractionManager.InteractUnit"] = {
	key = "C_PlayerInteractionManager.InteractUnit",
	name = "InteractUnit",
	category = "combat_midnight",
	subcategory = "c_playerinteractionmanager",
	func = _G["C_PlayerInteractionManager"] and _G["C_PlayerInteractionManager"]["InteractUnit"],
	funcPath = "C_PlayerInteractionManager.InteractUnit",
	params = {
		{ name = "unit", type = "string", default = nil },
		{ name = "exactMatch", type = "bool", default = false },
		{ name = "looseTargeting", type = "bool", default = true },
	},
	returns = { { name = "success", type = "bool", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_PlayerInteractionManager.IsInteractingWithNpcOfType"] = {
	key = "C_PlayerInteractionManager.IsInteractingWithNpcOfType",
	name = "IsInteractingWithNpcOfType",
	category = "combat_midnight",
	subcategory = "c_playerinteractionmanager",
	func = _G["C_PlayerInteractionManager"] and _G["C_PlayerInteractionManager"]["IsInteractingWithNpcOfType"],
	funcPath = "C_PlayerInteractionManager.IsInteractingWithNpcOfType",
	params = {
		{
			name = "type",
			type = "PlayerInteractionType",
			default = nil,
			examples = {
				{ value = 0, label = "Narcissus" },
				{ value = 8, label = "Plumber" },
				{ value = 10, label = "Plumber" },
			},
		},
	},
	returns = { { name = "interacting", type = "bool", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_PlayerInteractionManager.IsValidNPCInteraction"] = {
	key = "C_PlayerInteractionManager.IsValidNPCInteraction",
	name = "IsValidNPCInteraction",
	category = "combat_midnight",
	subcategory = "c_playerinteractionmanager",
	func = _G["C_PlayerInteractionManager"] and _G["C_PlayerInteractionManager"]["IsValidNPCInteraction"],
	funcPath = "C_PlayerInteractionManager.IsValidNPCInteraction",
	params = { { name = "type", type = "PlayerInteractionType", default = nil } },
	returns = { { name = "isValidInteraction", type = "bool", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}
