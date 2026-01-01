-- Generated APIDefinitions for namespace: C_SplashScreen
local _, ns = ...
local APIDefs = ns.APIDefinitions

APIDefs["C_SplashScreen.RequestLatestSplashScreen"] = {
	key = "C_SplashScreen.RequestLatestSplashScreen",
	name = "RequestLatestSplashScreen",
	category = "combat_midnight",
	subcategory = "c_splashscreen",
	func = _G["C_SplashScreen"] and _G["C_SplashScreen"]["RequestLatestSplashScreen"],
	funcPath = "C_SplashScreen.RequestLatestSplashScreen",
	params = { { name = "fromGameMenu", type = "bool", default = nil } },
	returns = {},
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}
