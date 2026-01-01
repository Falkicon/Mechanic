-- Generated APIDefinitions for namespace: C_PlayerChoice
local _, ns = ...
local APIDefs = ns.APIDefinitions

APIDefs["C_PlayerChoice.SendPlayerChoiceResponse"] = {
	key = "C_PlayerChoice.SendPlayerChoiceResponse",
	name = "SendPlayerChoiceResponse",
	category = "combat_midnight",
	subcategory = "c_playerchoice",
	func = _G["C_PlayerChoice"] and _G["C_PlayerChoice"]["SendPlayerChoiceResponse"],
	funcPath = "C_PlayerChoice.SendPlayerChoiceResponse",
	params = {
		{
			name = "responseID",
			type = "number",
			default = nil,
			examples = { { value = "self.id", label = "Plumber" } },
		},
	},
	returns = {},
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}
