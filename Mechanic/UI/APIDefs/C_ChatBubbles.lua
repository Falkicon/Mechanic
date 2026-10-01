-- Generated APIDefinitions for namespace: C_ChatBubbles
local _, ns = ...
local APIDefs = ns.APIDefinitions

APIDefs["C_ChatBubbles.GetAllChatBubbles"] = {
    key = "C_ChatBubbles.GetAllChatBubbles",
    name = "GetAllChatBubbles",
    category = "social",
    subcategory = "c_chatbubbles",
    funcPath = "C_ChatBubbles.GetAllChatBubbles",
    params = { { name = "includeForbidden", type = "bool", default = false } },
    returns = { { name = "chatBubbles", type = "table", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}
