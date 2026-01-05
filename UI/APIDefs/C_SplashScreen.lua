-- Generated APIDefinitions for namespace: C_SplashScreen
local _, ns = ...
local APIDefs = ns.APIDefinitions

APIDefs["C_SplashScreen.AcknowledgeSplash"] = {
    key = "C_SplashScreen.AcknowledgeSplash",
    name = "AcknowledgeSplash",
    category = "general",
    subcategory = "c_splashscreen",
    func = _G["C_SplashScreen"] and _G["C_SplashScreen"]["AcknowledgeSplash"],
    funcPath = "C_SplashScreen.AcknowledgeSplash",
    params = {  },
    returns = {  },
    midnightImpact = "NORMAL",
}

APIDefs["C_SplashScreen.CanViewSplashScreen"] = {
    key = "C_SplashScreen.CanViewSplashScreen",
    name = "CanViewSplashScreen",
    category = "general",
    subcategory = "c_splashscreen",
    func = _G["C_SplashScreen"] and _G["C_SplashScreen"]["CanViewSplashScreen"],
    funcPath = "C_SplashScreen.CanViewSplashScreen",
    params = {  },
    returns = { { name = "canView", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["C_SplashScreen.RequestLatestSplashScreen"] = {
    key = "C_SplashScreen.RequestLatestSplashScreen",
    name = "RequestLatestSplashScreen",
    category = "combat_midnight",
    subcategory = "c_splashscreen",
    func = _G["C_SplashScreen"] and _G["C_SplashScreen"]["RequestLatestSplashScreen"],
    funcPath = "C_SplashScreen.RequestLatestSplashScreen",
    params = { { name = "fromGameMenu", type = "bool", default = nil } },
    returns = {  },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_SplashScreen.SendSplashScreenActionLaunchedTelem"] = {
    key = "C_SplashScreen.SendSplashScreenActionLaunchedTelem",
    name = "SendSplashScreenActionLaunchedTelem",
    category = "general",
    subcategory = "c_splashscreen",
    func = _G["C_SplashScreen"] and _G["C_SplashScreen"]["SendSplashScreenActionLaunchedTelem"],
    funcPath = "C_SplashScreen.SendSplashScreenActionLaunchedTelem",
    params = {  },
    returns = {  },
    midnightImpact = "NORMAL",
}

APIDefs["C_SplashScreen.SendSplashScreenCloseTelem"] = {
    key = "C_SplashScreen.SendSplashScreenCloseTelem",
    name = "SendSplashScreenCloseTelem",
    category = "general",
    subcategory = "c_splashscreen",
    func = _G["C_SplashScreen"] and _G["C_SplashScreen"]["SendSplashScreenCloseTelem"],
    funcPath = "C_SplashScreen.SendSplashScreenCloseTelem",
    params = {  },
    returns = {  },
    midnightImpact = "NORMAL",
}
