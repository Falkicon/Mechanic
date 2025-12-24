-- UI/APIDefinitions.lua
-- API definitions for the API Test Bench

local ADDON_NAME, ns = ...

---@class APIParamExample
---@field value any The example value
---@field label string Display label for the example

---@class APIParam
---@field name string Parameter name
---@field type string "number" | "string" | "boolean" | "unit" | "spellID"
---@field default any Default value for testing
---@field examples APIParamExample[]? Quick-select presets for common test cases
---@field description string? Help text

---@class APIReturn
---@field name string Return value name
---@field type string Expected type
---@field fields string[]? For table returns, expected field names
---@field canBeSecret boolean? Whether this can become secret

---@class APIDefinition
---@field key string Unique identifier (namespace.function)
---@field name string Display name
---@field category string Category key
---@field subcategory string Subcategory key
---@field func function? The actual function (nil if protected)
---@field funcPath string String path for display (e.g., "C_Spell.GetSpellCooldown")
---@field params APIParam[] Parameter definitions
---@field returns APIReturn[] Return value definitions
---@field midnightImpact string "HIGH" | "MEDIUM" | "LOW" | "NONE"
---@field midnightNote string? Explanation of Midnight behavior
---@field alternatives string[]? Alternative APIs to use
---@field protected boolean? True if API is fully protected (can't call from addon)

-- API categories with priority ordering
local API_CATEGORIES = {
	{
		key = "combat_midnight",
		name = "Combat (Midnight)",
		description = "APIs most affected by Midnight secret values",
		priority = 1,
		subcategories = {
			{ key = "c_unitauras", name = "C_UnitAuras" },
			{ key = "unit_health_power", name = "UnitHealth/Power" },
			{ key = "c_spell_cooldowns", name = "C_Spell (cooldowns)" },
		},
	},
	{
		key = "spells",
		name = "Spells",
		description = "Spell information and state",
		priority = 2,
		subcategories = {
			{ key = "c_spell_info", name = "C_Spell.GetSpellInfo" },
			{ key = "c_spell_charges", name = "GetSpellCharges" },
			{ key = "c_spell_usable", name = "IsSpellUsable" },
		},
	},
	{
		key = "action_bars",
		name = "Action Bars",
		description = "Action bar slots and cooldowns",
		priority = 3,
		subcategories = {
			{ key = "c_actionbar", name = "C_ActionBar" },
		},
	},
	{
		key = "items",
		name = "Items",
		description = "Item information",
		priority = 4,
		subcategories = {
			{ key = "c_item", name = "C_Item" },
		},
	},
	{
		key = "unit_info",
		name = "Unit Info",
		description = "Unit properties and state",
		priority = 5,
		subcategories = {
			{ key = "unit_functions", name = "Unit* functions" },
		},
	},
	{
		key = "auras",
		name = "Auras",
		description = "Buff/debuff information",
		priority = 6,
		subcategories = {
			{ key = "c_unitauras_general", name = "C_UnitAuras (general)" },
		},
	},
}

ns.APIDefinitions = {
	-- ============================================================
	-- COMBAT (MIDNIGHT) - High Priority
	-- ============================================================

	["C_Spell.GetSpellCooldown"] = {
		key = "C_Spell.GetSpellCooldown",
		name = "GetSpellCooldown",
		category = "combat_midnight",
		subcategory = "c_spell_cooldowns",
		func = C_Spell and C_Spell.GetSpellCooldown,
		funcPath = "C_Spell.GetSpellCooldown",
		params = {
			{
				name = "spellID",
				type = "number",
				default = 61304,
				examples = {
					{ value = 61304, label = "GCD" },
					{ value = 116, label = "Frostbolt" },
					{ value = 376747, label = "Skyriding Vigor (whitelisted)" },
				},
				description = "Spell ID to check cooldown",
			},
		},
		returns = {
			{
				name = "cooldownInfo",
				type = "table",
				fields = { "startTime", "duration", "enabled", "modRate" },
				canBeSecret = true,
			},
		},
		midnightImpact = "HIGH",
		midnightNote = "duration and startTime become secret in instance combat. Use Cooldown:SetCooldown() passthrough or C_ActionBar.GetActionCooldownRemaining() for duration objects.",
		alternatives = { "C_ActionBar.GetActionCooldownRemaining" },
	},

	["UnitHealth"] = {
		key = "UnitHealth",
		name = "UnitHealth",
		category = "combat_midnight",
		subcategory = "unit_health_power",
		func = UnitHealth,
		funcPath = "UnitHealth",
		params = {
			{
				name = "unit",
				type = "unit",
				default = "player",
				examples = {
					{ value = "player", label = "Player" },
					{ value = "target", label = "Target" },
					{ value = "focus", label = "Focus" },
					{ value = "party1", label = "Party 1" },
				},
				description = "Unit token",
			},
			{
				name = "displayable",
				type = "boolean",
				default = false,
				examples = {
					{ value = false, label = "Raw (may be secret)" },
					{ value = true, label = "Displayable (safe)" },
				},
				description = "If true, returns displayable (non-secret) value",
			},
		},
		returns = {
			{ name = "health", type = "number", canBeSecret = true },
		},
		midnightImpact = "HIGH",
		midnightNote = "Returns secret in instance combat. Pass true as second arg for displayable value. Use UnitHealthPercent() for percentages.",
		alternatives = { "UnitHealth(unit, true)", "UnitHealthPercent" },
	},

	["UnitHealthMax"] = {
		key = "UnitHealthMax",
		name = "UnitHealthMax",
		category = "combat_midnight",
		subcategory = "unit_health_power",
		func = UnitHealthMax,
		funcPath = "UnitHealthMax",
		params = {
			{ name = "unit", type = "unit", default = "player", description = "Unit token" },
		},
		returns = {
			{ name = "maxHealth", type = "number", canBeSecret = true },
		},
		midnightImpact = "HIGH",
		midnightNote = "Returns secret in instance combat. StatusBar:SetMinMaxValues() accepts secret passthrough.",
	},

	["C_UnitAuras.GetAuraDataByIndex"] = {
		key = "C_UnitAuras.GetAuraDataByIndex",
		name = "GetAuraDataByIndex",
		category = "combat_midnight",
		subcategory = "c_unitauras",
		func = C_UnitAuras and C_UnitAuras.GetAuraDataByIndex,
		funcPath = "C_UnitAuras.GetAuraDataByIndex",
		params = {
			{
				name = "unit",
				type = "unit",
				default = "player",
				examples = {
					{ value = "player", label = "Player" },
					{ value = "target", label = "Target" },
				},
				description = "Unit token",
			},
			{
				name = "index",
				type = "number",
				default = 1,
				examples = {
					{ value = 1, label = "First" },
					{ value = 2, label = "Second" },
					{ value = 3, label = "Third" },
				},
				description = "Aura index",
			},
			{
				name = "filter",
				type = "string",
				default = "HELPFUL",
				examples = {
					{ value = "HELPFUL", label = "Buffs" },
					{ value = "HARMFUL", label = "Debuffs" },
					{ value = "HELPFUL|PLAYER", label = "Player Buffs" },
				},
				description = "Filter string",
			},
		},
		returns = {
			{
				name = "auraData",
				type = "table",
				fields = { "name", "icon", "applications", "duration", "expirationTime", "spellId", "auraInstanceID" },
				canBeSecret = true,
			},
		},
		midnightImpact = "HIGH",
		midnightNote = "spellId, duration, expirationTime, applications all become secret. auraInstanceID may also be secret, breaking cache lookups.",
	},

	["C_UnitAuras.GetPlayerAuraBySpellID"] = {
		key = "C_UnitAuras.GetPlayerAuraBySpellID",
		name = "GetPlayerAuraBySpellID",
		category = "combat_midnight",
		subcategory = "c_unitauras",
		func = C_UnitAuras and C_UnitAuras.GetPlayerAuraBySpellID,
		funcPath = "C_UnitAuras.GetPlayerAuraBySpellID",
		params = {
			{ name = "spellID", type = "number", default = 1459, description = "Spell ID to find" },
		},
		returns = {
			{ name = "auraData", type = "table", canBeSecret = true },
		},
		midnightImpact = "HIGH",
		midnightNote = "Fully protected in Midnight - cannot call from addon code in combat. Use reskin strategy with Blizzard frames.",
		protected = true,
	},

	-- ============================================================
	-- SPELLS - Medium Priority
	-- ============================================================

	["C_Spell.GetSpellInfo"] = {
		key = "C_Spell.GetSpellInfo",
		name = "GetSpellInfo",
		category = "spells",
		subcategory = "c_spell_info",
		func = C_Spell and C_Spell.GetSpellInfo,
		funcPath = "C_Spell.GetSpellInfo",
		params = {
			{ name = "spellID", type = "number", default = 116, description = "Spell ID (116 = Frostbolt)" },
		},
		returns = {
			{
				name = "spellInfo",
				type = "table",
				fields = { "name", "iconID", "castTime", "minRange", "maxRange", "spellID" },
				canBeSecret = false,
			},
		},
		midnightImpact = "LOW",
		midnightNote = "Generally readable. Cache results outside combat for safety.",
	},

	["C_Spell.GetSpellCharges"] = {
		key = "C_Spell.GetSpellCharges",
		name = "GetSpellCharges",
		category = "spells",
		subcategory = "c_spell_charges",
		func = C_Spell and C_Spell.GetSpellCharges,
		funcPath = "C_Spell.GetSpellCharges",
		params = {
			{ name = "spellID", type = "number", default = 61304, description = "Spell ID" },
		},
		returns = {
			{
				name = "chargeInfo",
				type = "table",
				fields = { "currentCharges", "maxCharges", "cooldownStartTime", "cooldownDuration" },
				canBeSecret = true,
			},
		},
		midnightImpact = "HIGH",
		midnightNote = "currentCharges, cooldownDuration become secret. Use IsSpellUsable() as binary proxy.",
		alternatives = { "IsSpellUsable" },
	},

	["C_Spell.IsSpellUsable"] = {
		key = "C_Spell.IsSpellUsable",
		name = "IsSpellUsable",
		category = "spells",
		subcategory = "c_spell_usable",
		func = C_Spell and C_Spell.IsSpellUsable,
		funcPath = "C_Spell.IsSpellUsable",
		params = {
			{ name = "spellID", type = "number", default = 116, description = "Spell ID" },
		},
		returns = {
			{ name = "isUsable", type = "boolean", canBeSecret = false },
			{ name = "insufficientPower", type = "boolean", canBeSecret = false },
		},
		midnightImpact = "NONE",
		midnightNote = "Remains readable. Good binary proxy for charge availability.",
	},

	-- ============================================================
	-- ACTION BARS
	-- ============================================================

	["C_ActionBar.GetActionCooldownRemaining"] = {
		key = "C_ActionBar.GetActionCooldownRemaining",
		name = "GetActionCooldownRemaining",
		category = "action_bars",
		subcategory = "c_actionbar",
		func = C_ActionBar and C_ActionBar.GetActionCooldownRemaining,
		funcPath = "C_ActionBar.GetActionCooldownRemaining",
		params = {
			{ name = "slot", type = "number", default = 1, description = "Action bar slot (1-120)" },
		},
		returns = {
			{ name = "durationObject", type = "Duration", canBeSecret = false },
		},
		midnightImpact = "NONE",
		midnightNote = "Returns Duration object that works with passthrough widgets. Preferred for Midnight.",
	},

	-- ============================================================
	-- ITEMS
	-- ============================================================

	["C_Item.GetItemInfo"] = {
		key = "C_Item.GetItemInfo",
		name = "GetItemInfo",
		category = "items",
		subcategory = "c_item",
		func = C_Item and C_Item.GetItemInfo,
		funcPath = "C_Item.GetItemInfo",
		params = {
			{ name = "itemID", type = "number", default = 6948, description = "Item ID (6948 = Hearthstone)" },
		},
		returns = {
			{
				name = "itemInfo",
				type = "table",
				fields = { "itemName", "itemLink", "itemQuality", "itemLevel", "itemIcon" },
				canBeSecret = false,
			},
		},
		midnightImpact = "LOW",
		midnightNote = "Generally unaffected by Midnight restrictions.",
	},

	-- ============================================================
	-- UNIT INFO
	-- ============================================================

	["UnitClass"] = {
		key = "UnitClass",
		name = "UnitClass",
		category = "unit_info",
		subcategory = "unit_functions",
		func = UnitClass,
		funcPath = "UnitClass",
		params = {
			{ name = "unit", type = "unit", default = "player", description = "Unit token" },
		},
		returns = {
			{ name = "className", type = "string", canBeSecret = false },
			{ name = "classFile", type = "string", canBeSecret = false },
			{ name = "classID", type = "number", canBeSecret = false },
		},
		midnightImpact = "NONE",
		midnightNote = "Unaffected.",
	},

	["UnitName"] = {
		key = "UnitName",
		name = "UnitName",
		category = "unit_info",
		subcategory = "unit_functions",
		func = UnitName,
		funcPath = "UnitName",
		params = {
			{ name = "unit", type = "unit", default = "player", description = "Unit token" },
		},
		returns = {
			{ name = "name", type = "string", canBeSecret = false },
			{ name = "realm", type = "string", canBeSecret = false },
		},
		midnightImpact = "NONE",
		midnightNote = "Unaffected.",
	},
}

-- Export categories to namespace
ns.APICategories = API_CATEGORIES

-- Build lookup tables
ns.APICategoryLookup = {}
ns.APISubcategoryLookup = {}

for _, cat in ipairs(ns.APICategories) do
	ns.APICategoryLookup[cat.key] = cat
	for _, subcat in ipairs(cat.subcategories or {}) do
		ns.APISubcategoryLookup[subcat.key] = {
			category = cat,
			subcategory = subcat,
		}
	end
end

return ns.APIDefinitions
