-- Generated APIDefinitions for namespace: C_ScrappingMachineUI
local _, ns = ...
local APIDefs = ns.APIDefinitions

APIDefs["C_ScrappingMachineUI.CloseScrappingMachine"] = {
    key = "C_ScrappingMachineUI.CloseScrappingMachine",
    name = "CloseScrappingMachine",
    category = "general",
    subcategory = "c_scrappingmachineui",
    funcPath = "C_ScrappingMachineUI.CloseScrappingMachine",
    params = {  },
    returns = {  },
    midnightImpact = "NORMAL",
}

APIDefs["C_ScrappingMachineUI.DropPendingScrapItemFromCursor"] = {
    key = "C_ScrappingMachineUI.DropPendingScrapItemFromCursor",
    name = "DropPendingScrapItemFromCursor",
    category = "general",
    subcategory = "c_scrappingmachineui",
    funcPath = "C_ScrappingMachineUI.DropPendingScrapItemFromCursor",
    params = { { name = "index", type = "number", default = nil } },
    returns = {  },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_ScrappingMachineUI.GetCurrentPendingScrapItemLocationByIndex"] = {
    key = "C_ScrappingMachineUI.GetCurrentPendingScrapItemLocationByIndex",
    name = "GetCurrentPendingScrapItemLocationByIndex",
    category = "general",
    subcategory = "c_scrappingmachineui",
    funcPath = "C_ScrappingMachineUI.GetCurrentPendingScrapItemLocationByIndex",
    params = { { name = "index", type = "number", default = nil } },
    returns = { { name = "itemLoc", type = "ItemLocation", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_ScrappingMachineUI.GetScrapSpellID"] = {
    key = "C_ScrappingMachineUI.GetScrapSpellID",
    name = "GetScrapSpellID",
    category = "general",
    subcategory = "c_scrappingmachineui",
    funcPath = "C_ScrappingMachineUI.GetScrapSpellID",
    params = {  },
    returns = { { name = "spellID", type = "number", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["C_ScrappingMachineUI.GetScrappingMachineName"] = {
    key = "C_ScrappingMachineUI.GetScrappingMachineName",
    name = "GetScrappingMachineName",
    category = "general",
    subcategory = "c_scrappingmachineui",
    funcPath = "C_ScrappingMachineUI.GetScrappingMachineName",
    params = {  },
    returns = { { name = "name", type = "string", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["C_ScrappingMachineUI.HasScrappableItems"] = {
    key = "C_ScrappingMachineUI.HasScrappableItems",
    name = "HasScrappableItems",
    category = "general",
    subcategory = "c_scrappingmachineui",
    funcPath = "C_ScrappingMachineUI.HasScrappableItems",
    params = {  },
    returns = { { name = "hasScrappableItems", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["C_ScrappingMachineUI.RemoveAllScrapItems"] = {
    key = "C_ScrappingMachineUI.RemoveAllScrapItems",
    name = "RemoveAllScrapItems",
    category = "general",
    subcategory = "c_scrappingmachineui",
    funcPath = "C_ScrappingMachineUI.RemoveAllScrapItems",
    params = {  },
    returns = {  },
    midnightImpact = "NORMAL",
}

APIDefs["C_ScrappingMachineUI.RemoveCurrentScrappingItem"] = {
    key = "C_ScrappingMachineUI.RemoveCurrentScrappingItem",
    name = "RemoveCurrentScrappingItem",
    category = "general",
    subcategory = "c_scrappingmachineui",
    funcPath = "C_ScrappingMachineUI.RemoveCurrentScrappingItem",
    params = {  },
    returns = {  },
    midnightImpact = "NORMAL",
}

APIDefs["C_ScrappingMachineUI.RemoveItemToScrap"] = {
    key = "C_ScrappingMachineUI.RemoveItemToScrap",
    name = "RemoveItemToScrap",
    category = "general",
    subcategory = "c_scrappingmachineui",
    funcPath = "C_ScrappingMachineUI.RemoveItemToScrap",
    params = { { name = "index", type = "number", default = nil } },
    returns = {  },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_ScrappingMachineUI.ScrapItems"] = {
    key = "C_ScrappingMachineUI.ScrapItems",
    name = "ScrapItems",
    category = "general",
    subcategory = "c_scrappingmachineui",
    funcPath = "C_ScrappingMachineUI.ScrapItems",
    params = {  },
    returns = {  },
    midnightImpact = "NORMAL",
}

APIDefs["C_ScrappingMachineUI.ValidateScrappingList"] = {
    key = "C_ScrappingMachineUI.ValidateScrappingList",
    name = "ValidateScrappingList",
    category = "general",
    subcategory = "c_scrappingmachineui",
    funcPath = "C_ScrappingMachineUI.ValidateScrappingList",
    params = {  },
    returns = {  },
    midnightImpact = "NORMAL",
}
