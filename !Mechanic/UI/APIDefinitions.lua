-- UI/APIDefinitions.lua
-- Base schemas and category definitions for the API Test Bench

local ADDON_NAME, ns = ...

---@class APIParamExample
---@field value any The example value
---@field label string Display label for the example

---@class APIParam
---@field name string Parameter name
---@field type string "number" | "string" | "boolean" | "unit" | "spellID" | "UnitToken"
---@field default any Default value for testing
---@field examples APIParamExample[]? Quick-select presets for common test cases
---@field description string? Help text

---@class APIReturn
---@field name string Return value name
---@field type string Expected type
---@field fields string[]? For table returns, expected field names
---@field canBeSecret boolean? Whether this can become secret

---@class APIDefinition
---@field key string Fully qualified name (e.g. "C_Spell.GetSpellCooldown")
---@field name string Short name
---@field category string "combat_midnight" | "general"
---@field subcategory string? E.g. "c_spell"
---@field func function? The actual function (nil if protected)
---@field funcPath string? String path to function for display
---@field params APIParam[]
---@field returns APIReturn[]
---@field midnightImpact string "HIGH" | "CONDITIONAL" | "RESTRICTED" | "NORMAL"
---@field midnightNote string? Additional info on Midnight behavior
---@field alternatives string[]? Alternative APIs to use
---@field protected boolean? True if API is fully protected (can't call from addon)

---@class APIRegistryEntry
---@field ns string The namespace/file where the full definition lives
---@field cat string The category key
---@field impact string The midnight impact level
---@field name string The short name of the API

ns.APIDefinitions = ns.APIDefinitions or {}
---@type table<string, APIRegistryEntry>
ns.APIRegistry = ns.APIRegistry or {}

-- API categories with priority ordering
local API_CATEGORIES = {
	{
		key = "combat_midnight",
		name = "Combat (Midnight)",
		description = "APIs most affected by Midnight secret values",
		priority = 1,
	},
	{
		key = "general",
		name = "General",
		description = "Standard WoW APIs",
		priority = 2,
	},
}

-- Export categories to namespace
ns.APICategories = API_CATEGORIES

-- Build lookup tables
ns.APICategoryLookup = {}
for _, cat in ipairs(ns.APICategories) do
	ns.APICategoryLookup[cat.key] = cat
end

return ns.APIDefinitions
