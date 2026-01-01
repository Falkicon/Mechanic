-- Generated APIDefinitions for namespace: C_Bank
local _, ns = ...
local APIDefs = ns.APIDefinitions

APIDefs["C_Bank.AutoDepositItemsIntoBank"] = {
	key = "C_Bank.AutoDepositItemsIntoBank",
	name = "AutoDepositItemsIntoBank",
	category = "combat_midnight",
	subcategory = "c_bank",
	func = _G["C_Bank"] and _G["C_Bank"]["AutoDepositItemsIntoBank"],
	funcPath = "C_Bank.AutoDepositItemsIntoBank",
	params = { { name = "bankType", type = "BankType", default = nil } },
	returns = {},
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Bank.CanDepositMoney"] = {
	key = "C_Bank.CanDepositMoney",
	name = "CanDepositMoney",
	category = "combat_midnight",
	subcategory = "c_bank",
	func = _G["C_Bank"] and _G["C_Bank"]["CanDepositMoney"],
	funcPath = "C_Bank.CanDepositMoney",
	params = { { name = "bankType", type = "BankType", default = nil } },
	returns = { { name = "canDepositMoney", type = "bool", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Bank.CanPurchaseBankTab"] = {
	key = "C_Bank.CanPurchaseBankTab",
	name = "CanPurchaseBankTab",
	category = "combat_midnight",
	subcategory = "c_bank",
	func = _G["C_Bank"] and _G["C_Bank"]["CanPurchaseBankTab"],
	funcPath = "C_Bank.CanPurchaseBankTab",
	params = { { name = "bankType", type = "BankType", default = nil } },
	returns = { { name = "canPurchaseBankTab", type = "bool", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Bank.CanUseBank"] = {
	key = "C_Bank.CanUseBank",
	name = "CanUseBank",
	category = "combat_midnight",
	subcategory = "c_bank",
	func = _G["C_Bank"] and _G["C_Bank"]["CanUseBank"],
	funcPath = "C_Bank.CanUseBank",
	params = {
		{
			name = "bankType",
			type = "BankType",
			default = nil,
			examples = { { value = 2, label = "BagBrother" }, { value = 0, label = "BagBrother" } },
		},
	},
	returns = { { name = "canUseBank", type = "bool", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Bank.CanViewBank"] = {
	key = "C_Bank.CanViewBank",
	name = "CanViewBank",
	category = "combat_midnight",
	subcategory = "c_bank",
	func = _G["C_Bank"] and _G["C_Bank"]["CanViewBank"],
	funcPath = "C_Bank.CanViewBank",
	params = {
		{
			name = "bankType",
			type = "BankType",
			default = nil,
			examples = { { value = 0, label = "AllTheThings" }, { value = 2, label = "AllTheThings" } },
		},
	},
	returns = { { name = "canViewBank", type = "bool", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Bank.CanWithdrawMoney"] = {
	key = "C_Bank.CanWithdrawMoney",
	name = "CanWithdrawMoney",
	category = "combat_midnight",
	subcategory = "c_bank",
	func = _G["C_Bank"] and _G["C_Bank"]["CanWithdrawMoney"],
	funcPath = "C_Bank.CanWithdrawMoney",
	params = { { name = "bankType", type = "BankType", default = nil } },
	returns = { { name = "canWithdrawMoney", type = "bool", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Bank.DepositMoney"] = {
	key = "C_Bank.DepositMoney",
	name = "DepositMoney",
	category = "combat_midnight",
	subcategory = "c_bank",
	func = _G["C_Bank"] and _G["C_Bank"]["DepositMoney"],
	funcPath = "C_Bank.DepositMoney",
	params = {
		{ name = "bankType", type = "BankType", default = nil, examples = { { value = 2, label = "BagBrother" } } },
		{ name = "amount", type = "WOWMONEY", default = nil },
	},
	returns = {},
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Bank.DoesBankTypeSupportAutoDeposit"] = {
	key = "C_Bank.DoesBankTypeSupportAutoDeposit",
	name = "DoesBankTypeSupportAutoDeposit",
	category = "combat_midnight",
	subcategory = "c_bank",
	func = _G["C_Bank"] and _G["C_Bank"]["DoesBankTypeSupportAutoDeposit"],
	funcPath = "C_Bank.DoesBankTypeSupportAutoDeposit",
	params = { { name = "bankType", type = "BankType", default = nil } },
	returns = { { name = "doesBankTypeSupportAutoDeposit", type = "bool", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Bank.DoesBankTypeSupportMoneyTransfer"] = {
	key = "C_Bank.DoesBankTypeSupportMoneyTransfer",
	name = "DoesBankTypeSupportMoneyTransfer",
	category = "combat_midnight",
	subcategory = "c_bank",
	func = _G["C_Bank"] and _G["C_Bank"]["DoesBankTypeSupportMoneyTransfer"],
	funcPath = "C_Bank.DoesBankTypeSupportMoneyTransfer",
	params = { { name = "bankType", type = "BankType", default = nil } },
	returns = { { name = "doesBankTypeSupportMoneyTransfer", type = "bool", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Bank.FetchBankLockedReason"] = {
	key = "C_Bank.FetchBankLockedReason",
	name = "FetchBankLockedReason",
	category = "combat_midnight",
	subcategory = "c_bank",
	func = _G["C_Bank"] and _G["C_Bank"]["FetchBankLockedReason"],
	funcPath = "C_Bank.FetchBankLockedReason",
	params = { { name = "bankType", type = "BankType", default = nil } },
	returns = { { name = "reason", type = "BankLockedReason", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Bank.FetchDepositedMoney"] = {
	key = "C_Bank.FetchDepositedMoney",
	name = "FetchDepositedMoney",
	category = "combat_midnight",
	subcategory = "c_bank",
	func = _G["C_Bank"] and _G["C_Bank"]["FetchDepositedMoney"],
	funcPath = "C_Bank.FetchDepositedMoney",
	params = {
		{ name = "bankType", type = "BankType", default = nil, examples = { { value = 2, label = "BagBrother" } } },
	},
	returns = { { name = "amount", type = "WOWMONEY", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Bank.FetchNextPurchasableBankTabData"] = {
	key = "C_Bank.FetchNextPurchasableBankTabData",
	name = "FetchNextPurchasableBankTabData",
	category = "combat_midnight",
	subcategory = "c_bank",
	func = _G["C_Bank"] and _G["C_Bank"]["FetchNextPurchasableBankTabData"],
	funcPath = "C_Bank.FetchNextPurchasableBankTabData",
	params = { { name = "bankType", type = "BankType", default = nil } },
	returns = { { name = "nextPurchasableTabData", type = "PurchasableBankTabData", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Bank.FetchNumPurchasedBankTabs"] = {
	key = "C_Bank.FetchNumPurchasedBankTabs",
	name = "FetchNumPurchasedBankTabs",
	category = "combat_midnight",
	subcategory = "c_bank",
	func = _G["C_Bank"] and _G["C_Bank"]["FetchNumPurchasedBankTabs"],
	funcPath = "C_Bank.FetchNumPurchasedBankTabs",
	params = { { name = "bankType", type = "BankType", default = nil } },
	returns = { { name = "numPurchasedBankTabs", type = "number", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Bank.FetchPurchasedBankTabData"] = {
	key = "C_Bank.FetchPurchasedBankTabData",
	name = "FetchPurchasedBankTabData",
	category = "combat_midnight",
	subcategory = "c_bank",
	func = _G["C_Bank"] and _G["C_Bank"]["FetchPurchasedBankTabData"],
	funcPath = "C_Bank.FetchPurchasedBankTabData",
	params = { { name = "bankType", type = "BankType", default = nil } },
	returns = { { name = "purchasedBankTabData", type = "table", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Bank.FetchPurchasedBankTabIDs"] = {
	key = "C_Bank.FetchPurchasedBankTabIDs",
	name = "FetchPurchasedBankTabIDs",
	category = "combat_midnight",
	subcategory = "c_bank",
	func = _G["C_Bank"] and _G["C_Bank"]["FetchPurchasedBankTabIDs"],
	funcPath = "C_Bank.FetchPurchasedBankTabIDs",
	params = { { name = "bankType", type = "BankType", default = nil } },
	returns = { { name = "purchasedBankTabIDs", type = "table", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Bank.HasMaxBankTabs"] = {
	key = "C_Bank.HasMaxBankTabs",
	name = "HasMaxBankTabs",
	category = "combat_midnight",
	subcategory = "c_bank",
	func = _G["C_Bank"] and _G["C_Bank"]["HasMaxBankTabs"],
	funcPath = "C_Bank.HasMaxBankTabs",
	params = { { name = "bankType", type = "BankType", default = nil } },
	returns = { { name = "hasMaxBankTabs", type = "bool", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Bank.IsItemAllowedInBankType"] = {
	key = "C_Bank.IsItemAllowedInBankType",
	name = "IsItemAllowedInBankType",
	category = "combat_midnight",
	subcategory = "c_bank",
	func = _G["C_Bank"] and _G["C_Bank"]["IsItemAllowedInBankType"],
	funcPath = "C_Bank.IsItemAllowedInBankType",
	params = {
		{ name = "bankType", type = "BankType", default = nil },
		{ name = "itemLocation", type = "ItemLocation", default = nil },
	},
	returns = { { name = "isItemAllowedInBankType", type = "bool", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Bank.PurchaseBankTab"] = {
	key = "C_Bank.PurchaseBankTab",
	name = "PurchaseBankTab",
	category = "combat_midnight",
	subcategory = "c_bank",
	func = _G["C_Bank"] and _G["C_Bank"]["PurchaseBankTab"],
	funcPath = "C_Bank.PurchaseBankTab",
	params = { { name = "bankType", type = "BankType", default = nil } },
	returns = {},
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Bank.UpdateBankTabSettings"] = {
	key = "C_Bank.UpdateBankTabSettings",
	name = "UpdateBankTabSettings",
	category = "combat_midnight",
	subcategory = "c_bank",
	func = _G["C_Bank"] and _G["C_Bank"]["UpdateBankTabSettings"],
	funcPath = "C_Bank.UpdateBankTabSettings",
	params = {
		{ name = "bankType", type = "BankType", default = nil },
		{ name = "tabID", type = "BagIndex", default = nil },
		{ name = "tabName", type = "cstring", default = nil },
		{ name = "tabIcon", type = "cstring", default = nil },
		{ name = "depositFlags", type = "BagSlotFlags", default = nil },
	},
	returns = {},
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Bank.WithdrawMoney"] = {
	key = "C_Bank.WithdrawMoney",
	name = "WithdrawMoney",
	category = "combat_midnight",
	subcategory = "c_bank",
	func = _G["C_Bank"] and _G["C_Bank"]["WithdrawMoney"],
	funcPath = "C_Bank.WithdrawMoney",
	params = {
		{ name = "bankType", type = "BankType", default = nil, examples = { { value = 2, label = "BagBrother" } } },
		{ name = "amount", type = "WOWMONEY", default = nil },
	},
	returns = {},
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}
