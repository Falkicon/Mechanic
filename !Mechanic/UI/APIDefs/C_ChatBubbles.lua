-- Generated APIDefinitions for namespace: C_ChatBubbles
local _, ns = ...
local APIDefs = ns.APIDefinitions

APIDefs["C_ChatBubbles.GetAllChatBubbles"] = {
	key = "C_ChatBubbles.GetAllChatBubbles",
	name = "GetAllChatBubbles",
	category = "combat_midnight",
	subcategory = "c_chatbubbles",
	func = _G["C_ChatBubbles"] and _G["C_ChatBubbles"]["GetAllChatBubbles"],
	funcPath = "C_ChatBubbles.GetAllChatBubbles",
	params = { { name = "includeForbidden", type = "bool", default = false } },
	returns = { { name = "chatBubbles", type = "table", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}
