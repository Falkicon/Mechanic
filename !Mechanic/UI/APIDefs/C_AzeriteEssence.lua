-- Generated APIDefinitions for namespace: C_AzeriteEssence
local _, ns = ...
local APIDefs = ns.APIDefinitions

APIDefs["C_AzeriteEssence.ActivateEssence"] = {
	key = "C_AzeriteEssence.ActivateEssence",
	name = "ActivateEssence",
	category = "combat_midnight",
	subcategory = "c_azeriteessence",
	func = _G["C_AzeriteEssence"] and _G["C_AzeriteEssence"]["ActivateEssence"],
	funcPath = "C_AzeriteEssence.ActivateEssence",
	params = {
		{ name = "essenceID", type = "number", default = nil },
		{ name = "milestoneID", type = "number", default = nil },
	},
	returns = {},
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_AzeriteEssence.CanActivateEssence"] = {
	key = "C_AzeriteEssence.CanActivateEssence",
	name = "CanActivateEssence",
	category = "combat_midnight",
	subcategory = "c_azeriteessence",
	func = _G["C_AzeriteEssence"] and _G["C_AzeriteEssence"]["CanActivateEssence"],
	funcPath = "C_AzeriteEssence.CanActivateEssence",
	params = {
		{ name = "essenceID", type = "number", default = nil },
		{ name = "milestoneID", type = "number", default = nil },
	},
	returns = { { name = "canActivate", type = "bool", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_AzeriteEssence.CanDeactivateEssence"] = {
	key = "C_AzeriteEssence.CanDeactivateEssence",
	name = "CanDeactivateEssence",
	category = "combat_midnight",
	subcategory = "c_azeriteessence",
	func = _G["C_AzeriteEssence"] and _G["C_AzeriteEssence"]["CanDeactivateEssence"],
	funcPath = "C_AzeriteEssence.CanDeactivateEssence",
	params = { { name = "milestoneID", type = "number", default = nil } },
	returns = { { name = "canDeactivate", type = "bool", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_AzeriteEssence.GetEssenceHyperlink"] = {
	key = "C_AzeriteEssence.GetEssenceHyperlink",
	name = "GetEssenceHyperlink",
	category = "combat_midnight",
	subcategory = "c_azeriteessence",
	func = _G["C_AzeriteEssence"] and _G["C_AzeriteEssence"]["GetEssenceHyperlink"],
	funcPath = "C_AzeriteEssence.GetEssenceHyperlink",
	params = {
		{ name = "essenceID", type = "number", default = nil, examples = { { value = "i", label = "MRT" } } },
		{ name = "rank", type = "number", default = nil },
	},
	returns = { { name = "link", type = "cstring", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_AzeriteEssence.GetEssenceInfo"] = {
	key = "C_AzeriteEssence.GetEssenceInfo",
	name = "GetEssenceInfo",
	category = "combat_midnight",
	subcategory = "c_azeriteessence",
	func = _G["C_AzeriteEssence"] and _G["C_AzeriteEssence"]["GetEssenceInfo"],
	funcPath = "C_AzeriteEssence.GetEssenceInfo",
	params = { { name = "essenceID", type = "number", default = nil } },
	returns = { { name = "info", type = "AzeriteEssenceInfo", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_AzeriteEssence.GetMilestoneEssence"] = {
	key = "C_AzeriteEssence.GetMilestoneEssence",
	name = "GetMilestoneEssence",
	category = "combat_midnight",
	subcategory = "c_azeriteessence",
	func = _G["C_AzeriteEssence"] and _G["C_AzeriteEssence"]["GetMilestoneEssence"],
	funcPath = "C_AzeriteEssence.GetMilestoneEssence",
	params = {
		{
			name = "milestoneID",
			type = "number",
			default = nil,
			examples = { { value = "milestone.ID", label = "MRT" }, { value = 115, label = "Narcissus" } },
		},
	},
	returns = { { name = "essenceID", type = "number", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_AzeriteEssence.GetMilestoneInfo"] = {
	key = "C_AzeriteEssence.GetMilestoneInfo",
	name = "GetMilestoneInfo",
	category = "combat_midnight",
	subcategory = "c_azeriteessence",
	func = _G["C_AzeriteEssence"] and _G["C_AzeriteEssence"]["GetMilestoneInfo"],
	funcPath = "C_AzeriteEssence.GetMilestoneInfo",
	params = { { name = "milestoneID", type = "number", default = nil } },
	returns = { { name = "info", type = "AzeriteMilestoneInfo", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_AzeriteEssence.GetMilestoneSpell"] = {
	key = "C_AzeriteEssence.GetMilestoneSpell",
	name = "GetMilestoneSpell",
	category = "combat_midnight",
	subcategory = "c_azeriteessence",
	func = _G["C_AzeriteEssence"] and _G["C_AzeriteEssence"]["GetMilestoneSpell"],
	funcPath = "C_AzeriteEssence.GetMilestoneSpell",
	params = { { name = "milestoneID", type = "number", default = nil } },
	returns = { { name = "spellID", type = "number", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_AzeriteEssence.SetPendingActivationEssence"] = {
	key = "C_AzeriteEssence.SetPendingActivationEssence",
	name = "SetPendingActivationEssence",
	category = "combat_midnight",
	subcategory = "c_azeriteessence",
	func = _G["C_AzeriteEssence"] and _G["C_AzeriteEssence"]["SetPendingActivationEssence"],
	funcPath = "C_AzeriteEssence.SetPendingActivationEssence",
	params = { { name = "essenceID", type = "number", default = nil } },
	returns = {},
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_AzeriteEssence.UnlockMilestone"] = {
	key = "C_AzeriteEssence.UnlockMilestone",
	name = "UnlockMilestone",
	category = "combat_midnight",
	subcategory = "c_azeriteessence",
	func = _G["C_AzeriteEssence"] and _G["C_AzeriteEssence"]["UnlockMilestone"],
	funcPath = "C_AzeriteEssence.UnlockMilestone",
	params = { { name = "milestoneID", type = "number", default = nil } },
	returns = {},
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}
