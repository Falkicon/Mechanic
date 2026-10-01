-- Generated APIDefinitions for namespace: C_Bank
local _, ns = ...
local APIDefs = ns.APIDefinitions

APIDefs["C_Bank.AreAnyBankTypesViewable"] = {
    key = "C_Bank.AreAnyBankTypesViewable",
    name = "AreAnyBankTypesViewable",
    category = "item",
    subcategory = "c_bank",
    funcPath = "C_Bank.AreAnyBankTypesViewable",
    params = {  },
    returns = { { name = "areAnyBankTypesViewable", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["C_Bank.AutoDepositItemsIntoBank"] = {
    key = "C_Bank.AutoDepositItemsIntoBank",
    name = "AutoDepositItemsIntoBank",
    category = "item",
    subcategory = "c_bank",
    funcPath = "C_Bank.AutoDepositItemsIntoBank",
    params = { { name = "bankType", type = "BankType", default = nil } },
    returns = {  },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Bank.CanDepositMoney"] = {
    key = "C_Bank.CanDepositMoney",
    name = "CanDepositMoney",
    category = "item",
    subcategory = "c_bank",
    funcPath = "C_Bank.CanDepositMoney",
    params = { { name = "bankType", type = "BankType", default = nil } },
    returns = { { name = "canDepositMoney", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Bank.CanPurchaseBankTab"] = {
    key = "C_Bank.CanPurchaseBankTab",
    name = "CanPurchaseBankTab",
    category = "item",
    subcategory = "c_bank",
    funcPath = "C_Bank.CanPurchaseBankTab",
    params = { { name = "bankType", type = "BankType", default = nil } },
    returns = { { name = "canPurchaseBankTab", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Bank.CanUseBank"] = {
    key = "C_Bank.CanUseBank",
    name = "CanUseBank",
    category = "item",
    subcategory = "c_bank",
    funcPath = "C_Bank.CanUseBank",
    params = { { name = "bankType", type = "BankType", default = nil } },
    returns = { { name = "canUseBank", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Bank.CanViewBank"] = {
    key = "C_Bank.CanViewBank",
    name = "CanViewBank",
    category = "item",
    subcategory = "c_bank",
    funcPath = "C_Bank.CanViewBank",
    params = { { name = "bankType", type = "BankType", default = nil } },
    returns = { { name = "canViewBank", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Bank.CanWithdrawMoney"] = {
    key = "C_Bank.CanWithdrawMoney",
    name = "CanWithdrawMoney",
    category = "item",
    subcategory = "c_bank",
    funcPath = "C_Bank.CanWithdrawMoney",
    params = { { name = "bankType", type = "BankType", default = nil } },
    returns = { { name = "canWithdrawMoney", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Bank.CloseBankFrame"] = {
    key = "C_Bank.CloseBankFrame",
    name = "CloseBankFrame",
    category = "item",
    subcategory = "c_bank",
    funcPath = "C_Bank.CloseBankFrame",
    params = {  },
    returns = {  },
    midnightImpact = "NORMAL",
}

APIDefs["C_Bank.DepositMoney"] = {
    key = "C_Bank.DepositMoney",
    name = "DepositMoney",
    category = "item",
    subcategory = "c_bank",
    funcPath = "C_Bank.DepositMoney",
    params = { { name = "bankType", type = "BankType", default = nil }, { name = "amount", type = "WOWMONEY", default = nil } },
    returns = {  },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Bank.DoesBankTypeSupportAutoDeposit"] = {
    key = "C_Bank.DoesBankTypeSupportAutoDeposit",
    name = "DoesBankTypeSupportAutoDeposit",
    category = "item",
    subcategory = "c_bank",
    funcPath = "C_Bank.DoesBankTypeSupportAutoDeposit",
    params = { { name = "bankType", type = "BankType", default = nil } },
    returns = { { name = "doesBankTypeSupportAutoDeposit", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Bank.DoesBankTypeSupportMoneyTransfer"] = {
    key = "C_Bank.DoesBankTypeSupportMoneyTransfer",
    name = "DoesBankTypeSupportMoneyTransfer",
    category = "item",
    subcategory = "c_bank",
    funcPath = "C_Bank.DoesBankTypeSupportMoneyTransfer",
    params = { { name = "bankType", type = "BankType", default = nil } },
    returns = { { name = "doesBankTypeSupportMoneyTransfer", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Bank.FetchBankLockedReason"] = {
    key = "C_Bank.FetchBankLockedReason",
    name = "FetchBankLockedReason",
    category = "item",
    subcategory = "c_bank",
    funcPath = "C_Bank.FetchBankLockedReason",
    params = { { name = "bankType", type = "BankType", default = nil } },
    returns = { { name = "reason", type = "BankLockedReason", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Bank.FetchDepositedMoney"] = {
    key = "C_Bank.FetchDepositedMoney",
    name = "FetchDepositedMoney",
    category = "item",
    subcategory = "c_bank",
    funcPath = "C_Bank.FetchDepositedMoney",
    params = { { name = "bankType", type = "BankType", default = nil } },
    returns = { { name = "amount", type = "WOWMONEY", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Bank.FetchNextPurchasableBankTabData"] = {
    key = "C_Bank.FetchNextPurchasableBankTabData",
    name = "FetchNextPurchasableBankTabData",
    category = "item",
    subcategory = "c_bank",
    funcPath = "C_Bank.FetchNextPurchasableBankTabData",
    params = { { name = "bankType", type = "BankType", default = nil } },
    returns = { { name = "nextPurchasableTabData", type = "PurchasableBankTabData", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Bank.FetchNumPurchasedBankTabs"] = {
    key = "C_Bank.FetchNumPurchasedBankTabs",
    name = "FetchNumPurchasedBankTabs",
    category = "item",
    subcategory = "c_bank",
    funcPath = "C_Bank.FetchNumPurchasedBankTabs",
    params = { { name = "bankType", type = "BankType", default = nil } },
    returns = { { name = "numPurchasedBankTabs", type = "number", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Bank.FetchPurchasedBankTabData"] = {
    key = "C_Bank.FetchPurchasedBankTabData",
    name = "FetchPurchasedBankTabData",
    category = "item",
    subcategory = "c_bank",
    funcPath = "C_Bank.FetchPurchasedBankTabData",
    params = { { name = "bankType", type = "BankType", default = nil } },
    returns = { { name = "purchasedBankTabData", type = "table", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Bank.FetchPurchasedBankTabIDs"] = {
    key = "C_Bank.FetchPurchasedBankTabIDs",
    name = "FetchPurchasedBankTabIDs",
    category = "item",
    subcategory = "c_bank",
    funcPath = "C_Bank.FetchPurchasedBankTabIDs",
    params = { { name = "bankType", type = "BankType", default = nil } },
    returns = { { name = "purchasedBankTabIDs", type = "table", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Bank.FetchViewableBankTypes"] = {
    key = "C_Bank.FetchViewableBankTypes",
    name = "FetchViewableBankTypes",
    category = "item",
    subcategory = "c_bank",
    funcPath = "C_Bank.FetchViewableBankTypes",
    params = {  },
    returns = { { name = "viewableBankTypes", type = "table", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["C_Bank.HasMaxBankTabs"] = {
    key = "C_Bank.HasMaxBankTabs",
    name = "HasMaxBankTabs",
    category = "item",
    subcategory = "c_bank",
    funcPath = "C_Bank.HasMaxBankTabs",
    params = { { name = "bankType", type = "BankType", default = nil } },
    returns = { { name = "hasMaxBankTabs", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Bank.IsItemAllowedInBankType"] = {
    key = "C_Bank.IsItemAllowedInBankType",
    name = "IsItemAllowedInBankType",
    category = "item",
    subcategory = "c_bank",
    funcPath = "C_Bank.IsItemAllowedInBankType",
    params = { { name = "bankType", type = "BankType", default = nil }, { name = "itemLocation", type = "ItemLocation", default = nil } },
    returns = { { name = "isItemAllowedInBankType", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Bank.PurchaseBankTab"] = {
    key = "C_Bank.PurchaseBankTab",
    name = "PurchaseBankTab",
    category = "item",
    subcategory = "c_bank",
    funcPath = "C_Bank.PurchaseBankTab",
    params = { { name = "bankType", type = "BankType", default = nil } },
    returns = {  },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Bank.UpdateBankTabSettings"] = {
    key = "C_Bank.UpdateBankTabSettings",
    name = "UpdateBankTabSettings",
    category = "item",
    subcategory = "c_bank",
    funcPath = "C_Bank.UpdateBankTabSettings",
    params = { { name = "bankType", type = "BankType", default = nil }, { name = "tabID", type = "BagIndex", default = nil }, { name = "tabName", type = "cstring", default = nil }, { name = "tabIcon", type = "cstring", default = nil }, { name = "depositFlags", type = "BagSlotFlags", default = nil } },
    returns = {  },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Bank.WithdrawMoney"] = {
    key = "C_Bank.WithdrawMoney",
    name = "WithdrawMoney",
    category = "item",
    subcategory = "c_bank",
    funcPath = "C_Bank.WithdrawMoney",
    params = { { name = "bankType", type = "BankType", default = nil }, { name = "amount", type = "WOWMONEY", default = nil } },
    returns = {  },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}
