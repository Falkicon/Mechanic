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
---@field category string Namespace key (e.g. "C_Spell", "Global")
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
---@field cat string The category key (legacy, kept for compat)
---@field impact string The midnight impact level
---@field name string The short name of the API

ns.APIDefinitions = ns.APIDefinitions or {}
---@type table<string, APIRegistryEntry>
ns.APIRegistry = ns.APIRegistry or {}

--------------------------------------------------------------------------------
-- Impact Level Definitions (for filtering and display)
--------------------------------------------------------------------------------

ns.APIImpactLevels = {
	{ key = "HIGH", name = "High Impact", color = "|cffff4444", priority = 1 },
	{ key = "CONDITIONAL", name = "Conditional", color = "|cffffaa00", priority = 2 },
	{ key = "RESTRICTED", name = "Restricted", color = "|cffff8800", priority = 3 },
	{ key = "NORMAL", name = "Normal", color = "|cffffffff", priority = 4 },
}

ns.APIImpactLookup = {}
for _, level in ipairs(ns.APIImpactLevels) do
	ns.APIImpactLookup[level.key] = level
end

--------------------------------------------------------------------------------
-- Dynamic Namespace Categories (built from registry at runtime)
--------------------------------------------------------------------------------

-- Will be populated by BuildNamespaceCategories()
ns.APICategories = {}
ns.APICategoryLookup = {}
ns.APINamespaces = {} -- Ordered list of namespace keys

-- Build namespace categories from the registry
-- Called after APIDefinitions_Registry.lua is loaded
function ns.BuildNamespaceCategories()
	local namespaceSet = {}
	local namespaceStats = {} -- Track counts per namespace

	-- Scan registry for unique namespaces
	for apiKey, entry in pairs(ns.APIRegistry) do
		local nsKey = entry.ns or "Global"
		if not namespaceSet[nsKey] then
			namespaceSet[nsKey] = true
			namespaceStats[nsKey] = { total = 0, high = 0, conditional = 0, restricted = 0 }
		end
		namespaceStats[nsKey].total = namespaceStats[nsKey].total + 1
		local impact = entry.impact or "RESTRICTED"
		if impact == "HIGH" then
			namespaceStats[nsKey].high = namespaceStats[nsKey].high + 1
		elseif impact == "CONDITIONAL" then
			namespaceStats[nsKey].conditional = namespaceStats[nsKey].conditional + 1
		else
			namespaceStats[nsKey].restricted = namespaceStats[nsKey].restricted + 1
		end
	end

	-- Build sorted list of namespaces
	local namespaces = {}
	for nsKey in pairs(namespaceSet) do
		table.insert(namespaces, nsKey)
	end
	table.sort(namespaces)

	-- Build categories array
	ns.APICategories = {}
	ns.APICategoryLookup = {}
	ns.APINamespaces = namespaces

	for i, nsKey in ipairs(namespaces) do
		local stats = namespaceStats[nsKey]
		local category = {
			key = nsKey,
			name = nsKey,
			description = string.format("%d APIs (%d high, %d conditional)", stats.total, stats.high, stats.conditional),
			priority = i,
			stats = stats,
		}
		table.insert(ns.APICategories, category)
		ns.APICategoryLookup[nsKey] = category
	end

	return ns.APICategories
end

return ns.APIDefinitions
