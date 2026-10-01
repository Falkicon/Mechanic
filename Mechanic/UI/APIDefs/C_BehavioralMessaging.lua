-- Generated APIDefinitions for namespace: C_BehavioralMessaging
local _, ns = ...
local APIDefs = ns.APIDefinitions

APIDefs["C_BehavioralMessaging.SendNotificationReceipt"] = {
    key = "C_BehavioralMessaging.SendNotificationReceipt",
    name = "SendNotificationReceipt",
    category = "general",
    subcategory = "c_behavioralmessaging",
    funcPath = "C_BehavioralMessaging.SendNotificationReceipt",
    params = { { name = "dbId", type = "NotificationDbId", default = nil }, { name = "openTimeSeconds", type = "number", default = nil }, { name = "readTimeSeconds", type = "number", default = nil } },
    returns = {  },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}
