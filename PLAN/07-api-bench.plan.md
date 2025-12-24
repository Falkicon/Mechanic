# Phase 7: API Test Bench ✅ COMPLETE

Centralized WoW API exploration, documentation, and validation tab that replaces per-addon API diagnostics.

> **Status**: This phase has been fully implemented. See `UI/API.lua` and `UI/APIDefinitions.lua`.

---

## Prerequisites

- Phase 1-4 complete
- Phase 5 complete (rich test results pattern)
- Phase 6 complete (SplitNavLayout helper, Tools tab pattern)
- Understanding of Midnight secret values (Guide 13)

## Reference

- [MASTER_PLAN.md](MASTER_PLAN.md) - Sections 4 (UI Layout), 5 (Copy System)
- [13-midnight-secret-values.doc.md](../../ADDON_DEV/Addon_Dev_Guide/13-midnight-secret-values.doc.md) - SECRET detection patterns
- Phase 6 SplitNavLayout pattern

---

## Scope

### In Scope
- New "API" top-level tab
- Left-nav organized by API category/namespace
- Individual API test runner with parameter inputs
- Return value display with secret detection
- Category batch testing ("Run All in Category")
- Copy-friendly status reports per category
- Persistent notes per API in SavedVariables
- Pre-defined API definitions for critical Midnight-affected APIs

### Out of Scope
- Live API monitoring (future enhancement)
- API change detection between game sessions (future)
- Automated API discovery (manual definitions only)
- Classic/Era API variants (Retail focus)

---

## Detailed Requirements

### 1. API Tab Structure

**File**: `UI/API.lua` (new file)

The API tab uses the SplitNavLayout with categories on the left and API details on the right:

```
+---------------------------+---------------------------------------------+
| API Categories            | C_Spell.GetSpellCooldown                    |
|---------------------------|---------------------------------------------|
| v Combat (Midnight)       | Namespace: C_Spell                          |
|   > C_UnitAuras           | Category: Combat (Midnight)                 |
|   > UnitHealth/Power      | Midnight Impact: HIGH - duration becomes    |
|   > C_Spell (cooldowns)   |                  secret in instance combat  |
| v Spells                  |--------------------------------------------|
|   > C_Spell.GetSpellInfo  | Parameters:                                 |
|   > GetSpellCharges       |   spellID: [12345          ] (number)      |
| v Action Bars             |                                             |
|   > C_ActionBar           | [Run]  [Run Category]  [Copy Report]        |
| v Items                   |                                             |
|   > C_Item                |--------------------------------------------|
| v Unit Info               | Last Run: 12:34:56 | Status: PASS           |
|   > Unit* functions       |                                             |
| v Cooldowns               | Returns:                                    |
|   > GetSpellCooldown      |   cooldownInfo (table):                     |
| > Auras                   |     .startTime = 12345.67 (secret: NO)     |
|   > C_UnitAuras           |     .duration = 1.5 (secret: NO)           |
|                           |     .enabled = true                         |
|                           |     .modRate = 1.0                          |
|                           |                                             |
|                           | Notes:                                      |
|                           | [Returns secret duration in M+ combat.     ]|
|                           | [Use C_ActionBar.GetActionCooldownRemaining]|
|                           | [for duration objects instead.             ]|
+---------------------------+---------------------------------------------+
```

**Example Presets Feature**:
Parameters with `examples` arrays show quick-select buttons:
```
Parameters:
  spellID: [61304          ] (number) [GCD] [Frostbolt] [Vigor] ▼
```
- Quick buttons for first 3 examples (clickable, fills input)
- Dropdown (▼) shows all available examples
- Useful for testing common spell IDs, unit tokens, etc.

### 2. API Categories

Organize APIs by functional area and Midnight impact:

```lua
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
```

### 3. API Definition Schema

**File**: `UI/APIDefinitions.lua` (new file)

Each testable API is defined with metadata, parameters, and expected returns:

```lua
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
                description = "Spell ID to check cooldown" 
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
                description = "Unit token" 
            },
            { 
                name = "displayable", 
                type = "boolean", 
                default = false,
                examples = {
                    { value = false, label = "Raw (may be secret)" },
                    { value = true, label = "Displayable (safe)" },
                },
                description = "If true, returns displayable (non-secret) value" 
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
                description = "Unit token" 
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
                description = "Aura index" 
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
                description = "Filter string" 
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
```

### 4. API Tab Implementation

**File**: `UI/API.lua`

```lua
-- UI/API.lua
-- !Mechanic - API Test Bench (Phase 7)
--
-- Centralized API exploration, testing, and documentation.

local ADDON_NAME, ns = ...
local Mechanic = LibStub("AceAddon-3.0"):GetAddon(ADDON_NAME)
local APIModule = {}
Mechanic.API = APIModule

APIModule.layout = nil
APIModule.selectedAPI = nil
APIModule.paramInputs = {}
APIModule.lastResults = {}

-- Import definitions
local API_DEFINITIONS = ns.APIDefinitions
local API_CATEGORIES = ns.APICategories

--------------------------------------------------------------------------------
-- Initialization
--------------------------------------------------------------------------------

function Mechanic:InitializeAPI()
    if APIModule.frame then return end

    local parent = self.frame.moduleContent
    local frame = CreateFrame("Frame", nil, parent)
    frame:SetAllPoints()
    APIModule.frame = frame

    -- Build nav tree from categories
    local navItems = APIModule:BuildNavTree()

    -- Create split nav layout
    local SplitNavLayout = ns.SplitNavLayout
    APIModule.layout = SplitNavLayout:Create(frame, {
        navWidth = 220,
        items = navItems,
        onSelect = function(key)
            APIModule:OnAPISelected(key)
        end,
    })

    -- Select first actual API by default (skip category headers)
    if navItems[1] then
        for _, item in ipairs(navItems) do
            if not item.isCategory then
                APIModule.layout:Select(item.key)
                break
            end
        end
    end
end

function APIModule:BuildNavTree()
    local items = {}
    
    for _, category in ipairs(API_CATEGORIES) do
        -- Add category header (non-selectable, or selects first child)
        table.insert(items, {
            key = "cat_" .. category.key,
            text = category.name,
            isCategory = true,
        })
        
        -- Add APIs in this category
        for apiKey, apiDef in pairs(API_DEFINITIONS) do
            if apiDef.category == category.key then
                local impactColor = self:GetImpactColor(apiDef.midnightImpact)
                table.insert(items, {
                    key = apiKey,
                    text = "  " .. impactColor .. apiDef.name .. "|r",
                    isAPI = true,
                })
            end
        end
    end
    
    return items
end

function APIModule:GetImpactColor(impact)
    if impact == "HIGH" then
        return "|cffff4444"  -- Red
    elseif impact == "MEDIUM" then
        return "|cffffaa00"  -- Orange
    elseif impact == "LOW" then
        return "|cffffff00"  -- Yellow
    else
        return "|cff00ff00"  -- Green
    end
end

--------------------------------------------------------------------------------
-- API Selection & Details
--------------------------------------------------------------------------------

function APIModule:OnAPISelected(key)
    -- Skip category headers
    if key:find("^cat_") then return end
    
    local apiDef = API_DEFINITIONS[key]
    if not apiDef then return end
    
    self.selectedAPI = key
    
    -- Get or create content frame
    local contentFrame = self.layout:GetContentFrame(key)
    self:BuildAPIPanel(contentFrame, apiDef)
end

function APIModule:BuildAPIPanel(parent, apiDef)
    -- Clear previous content
    for _, child in ipairs({parent:GetChildren()}) do
        child:Hide()
    end
    wipe(self.paramInputs)
    
    local yOffset = -8
    
    -- Header: API name and path
    local nameLabel = self:GetOrCreateLabel(parent, "nameLabel", "GameFontNormalHuge")
    nameLabel:SetPoint("TOPLEFT", 8, yOffset)
    nameLabel:SetText(apiDef.funcPath)
    yOffset = yOffset - 24
    
    -- Namespace and category
    local infoLabel = self:GetOrCreateLabel(parent, "infoLabel", "GameFontHighlight")
    infoLabel:SetPoint("TOPLEFT", 8, yOffset)
    local catName = ns.APICategoryLookup[apiDef.category] 
        and ns.APICategoryLookup[apiDef.category].name or apiDef.category
    infoLabel:SetText("Category: " .. catName)
    yOffset = yOffset - 18
    
    -- Midnight impact
    local impactColor = self:GetImpactColor(apiDef.midnightImpact)
    local impactLabel = self:GetOrCreateLabel(parent, "impactLabel", "GameFontHighlight")
    impactLabel:SetPoint("TOPLEFT", 8, yOffset)
    impactLabel:SetText("Midnight Impact: " .. impactColor .. apiDef.midnightImpact .. "|r")
    yOffset = yOffset - 18
    
    -- Midnight note
    if apiDef.midnightNote then
        local noteLabel = self:GetOrCreateLabel(parent, "noteLabel", "GameFontHighlightSmall")
        noteLabel:SetPoint("TOPLEFT", 8, yOffset)
        noteLabel:SetPoint("RIGHT", -8, 0)
        noteLabel:SetText("|cffaaaaaa" .. apiDef.midnightNote .. "|r")
        noteLabel:SetJustifyH("LEFT")
        noteLabel:SetWordWrap(true)
        yOffset = yOffset - (noteLabel:GetStringHeight() + 8)
    end
    
    -- Separator
    yOffset = yOffset - 8
    local sep1 = self:GetOrCreateSeparator(parent, "sep1")
    sep1:SetPoint("TOPLEFT", 8, yOffset)
    sep1:SetPoint("RIGHT", -8, 0)
    yOffset = yOffset - 12
    
    -- Parameters section
    local paramsHeader = self:GetOrCreateLabel(parent, "paramsHeader", "GameFontNormal")
    paramsHeader:SetPoint("TOPLEFT", 8, yOffset)
    paramsHeader:SetText("Parameters:")
    yOffset = yOffset - 20
    
    for i, param in ipairs(apiDef.params) do
        local paramRow = self:CreateParamInput(parent, param, i, yOffset)
        yOffset = yOffset - 28
    end
    
    -- Buttons
    yOffset = yOffset - 8
    local buttonRow = self:GetOrCreateFrame(parent, "buttonRow")
    buttonRow:SetPoint("TOPLEFT", 8, yOffset)
    buttonRow:SetSize(400, 30)
    
    local runBtn = self:GetOrCreateButton(buttonRow, "runBtn", "Run")
    runBtn:SetPoint("LEFT", 0, 0)
    runBtn:SetSize(80, 24)
    runBtn:SetScript("OnClick", function()
        self:RunAPI(apiDef)
    end)
    
    local runCatBtn = self:GetOrCreateButton(buttonRow, "runCatBtn", "Run Category")
    runCatBtn:SetPoint("LEFT", runBtn, "RIGHT", 8, 0)
    runCatBtn:SetSize(110, 24)
    runCatBtn:SetScript("OnClick", function()
        self:RunCategory(apiDef.category)
    end)
    
    local copyBtn = self:GetOrCreateButton(buttonRow, "copyBtn", "Copy Report")
    copyBtn:SetPoint("LEFT", runCatBtn, "RIGHT", 8, 0)
    copyBtn:SetSize(100, 24)
    copyBtn:SetScript("OnClick", function()
        self:CopyAPIReport(apiDef)
    end)
    
    yOffset = yOffset - 40
    
    -- Separator
    local sep2 = self:GetOrCreateSeparator(parent, "sep2")
    sep2:SetPoint("TOPLEFT", 8, yOffset)
    sep2:SetPoint("RIGHT", -8, 0)
    yOffset = yOffset - 12
    
    -- Results section
    local resultsHeader = self:GetOrCreateLabel(parent, "resultsHeader", "GameFontNormal")
    resultsHeader:SetPoint("TOPLEFT", 8, yOffset)
    resultsHeader:SetText("Results:")
    yOffset = yOffset - 20
    
    -- Status line
    local statusLabel = self:GetOrCreateLabel(parent, "statusLabel", "GameFontHighlight")
    statusLabel:SetPoint("TOPLEFT", 8, yOffset)
    statusLabel:SetText("Not yet run")
    parent.statusLabel = statusLabel
    yOffset = yOffset - 20
    
    -- Results display (MultiLineEditBox)
    -- Note: FenUI:CreateMultiLineEditBox should exist from Phase 1-4
    -- Fallback: CreateFrame("EditBox", nil, parent, "InputBoxTemplate") with SetMultiLine(true)
    local resultsBox = FenUI:CreateMultiLineEditBox(parent, {
        readOnly = true,
        background = "surfaceInset",
    })
    resultsBox:SetPoint("TOPLEFT", 8, yOffset)
    resultsBox:SetPoint("BOTTOMRIGHT", -8, 80)
    parent.resultsBox = resultsBox
    
    -- Notes section (at bottom)
    local notesHeader = self:GetOrCreateLabel(parent, "notesHeader", "GameFontNormal")
    notesHeader:SetPoint("BOTTOMLEFT", 8, 70)
    notesHeader:SetText("Notes:")
    
    local notesBox = self:GetOrCreateEditBox(parent, "notesBox")
    notesBox:SetPoint("BOTTOMLEFT", 8, 8)
    notesBox:SetPoint("BOTTOMRIGHT", -8, 8)
    notesBox:SetHeight(55)
    notesBox:SetMultiLine(true)
    notesBox:SetAutoFocus(false)
    
    -- Load saved notes
    local savedNotes = Mechanic.db.profile.apiTests 
        and Mechanic.db.profile.apiTests[apiDef.key]
        and Mechanic.db.profile.apiTests[apiDef.key].notes or ""
    notesBox:SetText(savedNotes)
    
    notesBox:SetScript("OnTextChanged", function(self)
        APIModule:SaveNotes(apiDef.key, self:GetText())
    end)
    parent.notesBox = notesBox
    
    -- Restore last results if available
    if self.lastResults[apiDef.key] then
        self:DisplayResults(parent, apiDef, self.lastResults[apiDef.key])
    end
end

function APIModule:CreateParamInput(parent, param, index, yOffset)
    local row = self:GetOrCreateFrame(parent, "param_" .. index)
    row:SetPoint("TOPLEFT", 16, yOffset)
    row:SetSize(500, 24)
    
    local label = row.label or row:CreateFontString(nil, "OVERLAY", "GameFontHighlight")
    label:SetPoint("LEFT", 0, 0)
    label:SetWidth(120)
    label:SetJustifyH("LEFT")
    label:SetText(param.name .. ":")
    row.label = label
    
    local input = row.input or CreateFrame("EditBox", nil, row, "InputBoxTemplate")
    input:SetPoint("LEFT", label, "RIGHT", 8, 0)
    input:SetSize(150, 20)
    input:SetAutoFocus(false)
    input:SetText(tostring(param.default or ""))
    row.input = input
    
    local typeLabel = row.typeLabel or row:CreateFontString(nil, "OVERLAY", "GameFontDisableSmall")
    typeLabel:SetPoint("LEFT", input, "RIGHT", 8, 0)
    typeLabel:SetText("(" .. param.type .. ")")
    row.typeLabel = typeLabel
    
    -- Examples dropdown (if examples provided)
    if param.examples and #param.examples > 0 then
        local examplesBtn = row.examplesBtn or CreateFrame("Button", nil, row, "UIPanelButtonTemplate")
        examplesBtn:SetPoint("LEFT", typeLabel, "RIGHT", 8, 0)
        examplesBtn:SetSize(24, 20)
        examplesBtn:SetText("▼")
        examplesBtn:SetScript("OnClick", function()
            self:ShowExamplesMenu(param, input)
        end)
        row.examplesBtn = examplesBtn
        
        -- Quick example buttons for common cases (show first 3)
        local xOffset = 36
        for i, example in ipairs(param.examples) do
            if i > 3 then break end  -- Limit to 3 quick buttons
            local quickBtn = row["quickBtn" .. i] or CreateFrame("Button", nil, row)
            quickBtn:SetPoint("LEFT", typeLabel, "RIGHT", xOffset, 0)
            
            -- Create text first so we can measure it
            local btnText = quickBtn.btnText or quickBtn:CreateFontString(nil, "OVERLAY", "GameFontHighlightSmall")
            btnText:SetPoint("CENTER")
            btnText:SetText("|cff88ccff" .. example.label .. "|r")
            quickBtn.btnText = btnText
            
            -- Size button based on text width (now that text exists)
            local textWidth = btnText:GetStringWidth()
            quickBtn:SetSize(math.max(textWidth + 16, 40), 18)
            
            quickBtn:SetScript("OnClick", function()
                input:SetText(tostring(example.value))
            end)
            quickBtn:SetScript("OnEnter", function(self)
                self.btnText:SetText("|cffffffff" .. example.label .. "|r")
            end)
            quickBtn:SetScript("OnLeave", function(self)
                self.btnText:SetText("|cff88ccff" .. example.label .. "|r")
            end)
            
            row["quickBtn" .. i] = quickBtn
            xOffset = xOffset + quickBtn:GetWidth() + 4
        end
    end
    
    -- Store reference for value retrieval
    self.paramInputs[param.name] = input
    
    row:Show()
    return row
end

function APIModule:ShowExamplesMenu(param, inputBox)
    -- Create dropdown menu for all examples
    local menu = {}
    for _, example in ipairs(param.examples) do
        table.insert(menu, {
            text = example.label .. " (" .. tostring(example.value) .. ")",
            func = function()
                inputBox:SetText(tostring(example.value))
                CloseDropDownMenus()
            end,
            notCheckable = true,
        })
    end
    
    -- EasyMenu is a Blizzard global available in Retail
    -- Creates a dropdown at cursor position
    local menuFrame = self.examplesMenuFrame
    if not menuFrame then
        menuFrame = CreateFrame("Frame", "MechanicAPIExamplesMenu", UIParent, "UIDropDownMenuTemplate")
        self.examplesMenuFrame = menuFrame
    end
    EasyMenu(menu, menuFrame, "cursor", 0, 0, "MENU")
end

--------------------------------------------------------------------------------
-- API Execution
--------------------------------------------------------------------------------

function APIModule:RunAPI(apiDef)
    if apiDef.protected then
        self:DisplayProtectedError(apiDef)
        return
    end
    
    if not apiDef.func then
        self:DisplayMissingFuncError(apiDef)
        return
    end
    
    -- Gather parameters
    local params = {}
    for _, paramDef in ipairs(apiDef.params) do
        local input = self.paramInputs[paramDef.name]
        local value = input and input:GetText() or paramDef.default
        
        -- Type conversion
        if paramDef.type == "number" then
            value = tonumber(value)
        elseif paramDef.type == "boolean" then
            value = value == "true" or value == "1"
        end
        
        table.insert(params, value)
    end
    
    -- Execute API
    local startTime = debugprofilestop()
    local success, results = self:SafeCallAPI(apiDef.func, unpack(params))
    local endTime = debugprofilestop()
    local duration = (endTime - startTime) / 1000  -- Convert to ms
    
    -- Store results
    local resultData = {
        success = success,
        results = results,
        duration = duration,
        timestamp = GetTime(),
        params = params,
    }
    self.lastResults[apiDef.key] = resultData
    
    -- Save to DB
    self:SaveAPIResult(apiDef.key, resultData)
    
    -- Display
    local contentFrame = self.layout:GetContentFrame(apiDef.key)
    self:DisplayResults(contentFrame, apiDef, resultData)
end

function APIModule:SafeCallAPI(func, ...)
    local results = { pcall(func, ...) }
    local success = table.remove(results, 1)
    return success, results
end

function APIModule:DisplayResults(parent, apiDef, resultData)
    local statusLabel = parent.statusLabel
    local resultsBox = parent.resultsBox
    
    if not statusLabel or not resultsBox then return end
    
    -- Status line
    local timeStr = date("%H:%M:%S", resultData.timestamp)
    local statusText
    local secretCount = 0
    
    if not resultData.success then
        statusText = "|cffff0000ERROR|r"
    else
        -- Check for secrets in results
        secretCount = self:CountSecrets(resultData.results)
        if secretCount > 0 then
            statusText = "|cffaa00ffSECRET|r (" .. secretCount .. " secret values)"
        else
            statusText = "|cff00ff00PASS|r"
        end
    end
    
    statusLabel:SetText(string.format("Last Run: %s | Status: %s | Duration: %.2fms",
        timeStr, statusText, resultData.duration))
    
    -- Results display
    local lines = {}
    
    if not resultData.success then
        table.insert(lines, "Error: " .. tostring(resultData.results[1]))
    else
        table.insert(lines, "Returns:")
        for i, retDef in ipairs(apiDef.returns) do
            local value = resultData.results[i]
            local valueStr = self:FormatValue(value, retDef)
            table.insert(lines, string.format("  %s = %s", retDef.name, valueStr))
        end
    end
    
    resultsBox:SetText(table.concat(lines, "\n"))
end

function APIModule:FormatValue(value, retDef)
    if value == nil then
        return "nil"
    end
    
    -- Check if secret
    local isSecret = issecretvalue and issecretvalue(value)
    local secretTag = isSecret and " |cffaa00ff(SECRET)|r" or ""
    
    if type(value) == "table" then
        local parts = {}
        table.insert(parts, "{")
        
        if retDef and retDef.fields then
            for _, fieldName in ipairs(retDef.fields) do
                local fieldValue = value[fieldName]
                local fieldSecret = issecretvalue and issecretvalue(fieldValue)
                local fieldSecretTag = fieldSecret and " |cffaa00ff(SECRET)|r" or ""
                table.insert(parts, string.format("  .%s = %s%s",
                    fieldName, tostring(fieldValue), fieldSecretTag))
            end
        else
            for k, v in pairs(value) do
                local fieldSecret = issecretvalue and issecretvalue(v)
                local fieldSecretTag = fieldSecret and " |cffaa00ff(SECRET)|r" or ""
                table.insert(parts, string.format("  .%s = %s%s",
                    tostring(k), tostring(v), fieldSecretTag))
            end
        end
        
        table.insert(parts, "}")
        return table.concat(parts, "\n")
    end
    
    return tostring(value) .. secretTag
end

function APIModule:CountSecrets(results)
    local count = 0
    for _, value in ipairs(results) do
        if issecretvalue and issecretvalue(value) then
            count = count + 1
        elseif type(value) == "table" then
            for _, v in pairs(value) do
                if issecretvalue and issecretvalue(v) then
                    count = count + 1
                end
            end
        end
    end
    return count
end

--------------------------------------------------------------------------------
-- Category Batch Testing
--------------------------------------------------------------------------------

function APIModule:RunCategory(categoryKey)
    local results = {}
    
    for apiKey, apiDef in pairs(API_DEFINITIONS) do
        if apiDef.category == categoryKey and not apiDef.protected then
            self:RunAPI(apiDef)
            results[apiKey] = self.lastResults[apiKey]
        end
    end
    
    Mechanic:Print(string.format("Ran %d APIs in category", self:TableCount(results)))
end

--------------------------------------------------------------------------------
-- Copy Report
--------------------------------------------------------------------------------

function APIModule:CopyAPIReport(apiDef)
    local lines = {}
    
    -- Header
    table.insert(lines, "=== Mechanic API Report: " .. apiDef.funcPath .. " ===")
    local header = Mechanic:GetEnvironmentHeader()
    if header then
        table.insert(lines, header)
    end
    table.insert(lines, "---")
    
    -- API info
    table.insert(lines, "API: " .. apiDef.funcPath)
    table.insert(lines, "Category: " .. apiDef.category)
    table.insert(lines, "Midnight Impact: " .. apiDef.midnightImpact)
    if apiDef.midnightNote then
        table.insert(lines, "Note: " .. apiDef.midnightNote)
    end
    table.insert(lines, "")
    
    -- Results
    local resultData = self.lastResults[apiDef.key]
    if resultData then
        table.insert(lines, "Last Test:")
        table.insert(lines, "  Time: " .. date("%Y-%m-%d %H:%M:%S", resultData.timestamp))
        table.insert(lines, "  Duration: " .. string.format("%.2fms", resultData.duration))
        table.insert(lines, "  Status: " .. (resultData.success and "SUCCESS" or "ERROR"))
        table.insert(lines, "  Secret Values: " .. self:CountSecrets(resultData.results or {}))
        table.insert(lines, "")
        table.insert(lines, "Results:")
        table.insert(lines, self:FormatResultsPlainText(apiDef, resultData))
    else
        table.insert(lines, "Not yet tested.")
    end
    
    -- Notes
    local notes = Mechanic.db.profile.apiTests 
        and Mechanic.db.profile.apiTests[apiDef.key]
        and Mechanic.db.profile.apiTests[apiDef.key].notes
    if notes and notes ~= "" then
        table.insert(lines, "")
        table.insert(lines, "Notes:")
        table.insert(lines, notes)
    end
    
    Mechanic:ShowCopyDialog(table.concat(lines, "\n"))
end

function APIModule:FormatResultsPlainText(apiDef, resultData)
    local lines = {}
    
    if not resultData.success then
        table.insert(lines, "  Error: " .. tostring(resultData.results[1]))
    else
        for i, retDef in ipairs(apiDef.returns) do
            local value = resultData.results[i]
            local valueStr = self:FormatValuePlainText(value, retDef)
            table.insert(lines, string.format("  %s = %s", retDef.name, valueStr))
        end
    end
    
    return table.concat(lines, "\n")
end

function APIModule:FormatValuePlainText(value, retDef)
    if value == nil then
        return "nil"
    end
    
    local isSecret = issecretvalue and issecretvalue(value)
    local secretTag = isSecret and " (SECRET)" or ""
    
    if type(value) == "table" then
        local parts = {}
        if retDef and retDef.fields then
            for _, fieldName in ipairs(retDef.fields) do
                local fieldValue = value[fieldName]
                local fieldSecret = issecretvalue and issecretvalue(fieldValue)
                local fieldSecretTag = fieldSecret and " (SECRET)" or ""
                table.insert(parts, string.format("    .%s = %s%s",
                    fieldName, tostring(fieldValue), fieldSecretTag))
            end
        else
            for k, v in pairs(value) do
                local fieldSecret = issecretvalue and issecretvalue(v)
                local fieldSecretTag = fieldSecret and " (SECRET)" or ""
                table.insert(parts, string.format("    .%s = %s%s",
                    tostring(k), tostring(v), fieldSecretTag))
            end
        end
        return "{\n" .. table.concat(parts, "\n") .. "\n  }"
    end
    
    return tostring(value) .. secretTag
end

function APIModule:GetCategoryReport(categoryKey)
    local lines = {}
    local catName = ns.APICategoryLookup[categoryKey] 
        and ns.APICategoryLookup[categoryKey].name or categoryKey
    
    table.insert(lines, "=== Mechanic API Report: " .. catName .. " ===")
    local header = Mechanic:GetEnvironmentHeader()
    if header then
        table.insert(lines, header)
    end
    table.insert(lines, "---")
    
    local passCount, secretCount, errorCount, untestedCount = 0, 0, 0, 0
    
    for apiKey, apiDef in pairs(API_DEFINITIONS) do
        if apiDef.category == categoryKey then
            local resultData = self.lastResults[apiKey]
            local status, detail
            
            if not resultData then
                status = "----"
                untestedCount = untestedCount + 1
            elseif not resultData.success then
                status = "FAIL"
                errorCount = errorCount + 1
            elseif self:CountSecrets(resultData.results or {}) > 0 then
                status = "SCRT"
                secretCount = secretCount + 1
            else
                status = "PASS"
                passCount = passCount + 1
            end
            
            table.insert(lines, string.format("[%s] %s", status, apiDef.funcPath))
        end
    end
    
    table.insert(lines, "---")
    table.insert(lines, string.format("Summary: %d PASS, %d SECRET, %d FAIL, %d untested",
        passCount, secretCount, errorCount, untestedCount))
    
    return table.concat(lines, "\n")
end

--------------------------------------------------------------------------------
-- Persistence
--------------------------------------------------------------------------------

function APIModule:SaveAPIResult(apiKey, resultData)
    Mechanic.db.profile.apiTests = Mechanic.db.profile.apiTests or {}
    Mechanic.db.profile.apiTests[apiKey] = Mechanic.db.profile.apiTests[apiKey] or {}
    
    local saved = Mechanic.db.profile.apiTests[apiKey]
    saved.lastRun = resultData.timestamp
    saved.lastResult = resultData.success and (self:CountSecrets(resultData.results or {}) > 0 and "secret" or "pass") or "error"
    saved.lastParams = resultData.params
end

function APIModule:SaveNotes(apiKey, notes)
    Mechanic.db.profile.apiTests = Mechanic.db.profile.apiTests or {}
    Mechanic.db.profile.apiTests[apiKey] = Mechanic.db.profile.apiTests[apiKey] or {}
    Mechanic.db.profile.apiTests[apiKey].notes = notes
end

--------------------------------------------------------------------------------
-- Helpers
--------------------------------------------------------------------------------

function APIModule:GetOrCreateLabel(parent, key, font)
    if parent[key] then return parent[key] end
    local label = parent:CreateFontString(nil, "OVERLAY", font or "GameFontNormal")
    parent[key] = label
    return label
end

function APIModule:GetOrCreateSeparator(parent, key)
    if parent[key] then return parent[key] end
    local sep = parent:CreateTexture(nil, "BACKGROUND")
    sep:SetHeight(1)
    sep:SetColorTexture(1, 1, 1, 0.2)
    parent[key] = sep
    return sep
end

function APIModule:GetOrCreateFrame(parent, key)
    if parent[key] then return parent[key] end
    local frame = CreateFrame("Frame", nil, parent)
    parent[key] = frame
    return frame
end

function APIModule:GetOrCreateButton(parent, key, text)
    if parent[key] then 
        parent[key]:SetText(text)
        return parent[key] 
    end
    local btn = CreateFrame("Button", nil, parent, "UIPanelButtonTemplate")
    btn:SetText(text)
    parent[key] = btn
    return btn
end

function APIModule:GetOrCreateEditBox(parent, key)
    if parent[key] then return parent[key] end
    local box = CreateFrame("EditBox", nil, parent, "InputBoxTemplate")
    parent[key] = box
    return box
end

function APIModule:TableCount(t)
    local count = 0
    for _ in pairs(t) do count = count + 1 end
    return count
end

function APIModule:DisplayProtectedError(apiDef)
    local contentFrame = self.layout:GetContentFrame(apiDef.key)
    if contentFrame and contentFrame.statusLabel then
        contentFrame.statusLabel:SetText("|cffff0000PROTECTED|r - Cannot call from addon code")
    end
    if contentFrame and contentFrame.resultsBox then
        contentFrame.resultsBox:SetText("This API is protected and cannot be called from addon code in Midnight.\n\nConsider using the reskin strategy with Blizzard frames.")
    end
end

function APIModule:DisplayMissingFuncError(apiDef)
    local contentFrame = self.layout:GetContentFrame(apiDef.key)
    if contentFrame and contentFrame.statusLabel then
        contentFrame.statusLabel:SetText("|cffff8800MISSING|r - Function not found")
    end
    if contentFrame and contentFrame.resultsBox then
        contentFrame.resultsBox:SetText("Function not available: " .. apiDef.funcPath .. "\n\nThis may be a newer API not yet available in this WoW version.")
    end
end

--------------------------------------------------------------------------------
-- Tab Lifecycle
--------------------------------------------------------------------------------

function APIModule:OnShow()
    -- Refresh nav in case APIs changed
end

function APIModule:OnHide()
    -- Cleanup if needed
end

function APIModule:GetCopyText(includeHeader)
    if self.selectedAPI then
        local apiDef = API_DEFINITIONS[self.selectedAPI]
        if apiDef then
            return self:GetCategoryReport(apiDef.category)
        end
    end
    return "No API selected."
end
```

### 5. MainFrame Updates

**File**: `UI/MainFrame.lua`

```lua
-- Add API tab to tab group
tabs = {
    { key = "console", text = "Console" },
    { key = "errors", text = "Errors" },
    { key = "tests", text = "Tests" },
    { key = "tools", text = "Tools" },
    { key = "api", text = "API" },           -- NEW
    { key = "perf", text = "Performance" },
}

-- Add to OnTabChanged
elseif key == "api" then
    if not self.API or not self.API.frame then
        self:InitializeAPI()
    end
    if self.API and self.API.frame then
        self.API.frame:Show()
        self.API:OnShow()
    end
```

### 6. Slash Command

**File**: `Core.lua`

```lua
elseif cmd == "api" then
    self:ShowTab("api")
```

### 7. SavedVariables Schema

**File**: `Core.lua` (defaults)

```lua
local defaults = {
    profile = {
        -- ... existing ...
        
        -- NEW: API test data
        apiTests = {
            -- ["C_Spell.GetSpellCooldown"] = {
            --     lastRun = timestamp,
            --     lastResult = "pass" | "secret" | "error",
            --     lastParams = { 12345 },
            --     notes = "User notes about this API",
            -- },
        },
    },
}
```

---

## Testing Checklist

### API Tab
- [ ] Tab appears in header
- [ ] Categories render in left nav
- [ ] APIs colored by Midnight impact
- [ ] Selecting API shows details panel

### API Execution
- [ ] Run button executes API
- [ ] Parameters read from inputs
- [ ] Results displayed with formatting
- [ ] Secret values detected and flagged
- [ ] Duration measured and displayed
- [ ] Error handling works

### Category Testing
- [ ] Run Category executes all APIs in category
- [ ] Results saved for each API
- [ ] Status counts accurate

### Copy Report
- [ ] Single API report formatted correctly
- [ ] Category report includes all APIs
- [ ] No color codes in copy output
- [ ] Notes included in report

### Persistence
- [ ] Notes saved to SavedVariables
- [ ] Last run data saved
- [ ] Notes restored on reload

### Protected APIs
- [ ] Protected APIs show clear error
- [ ] Suggestion for alternatives shown

---

## Validation Workflow

```powershell
# Validate TOC
mcp_AddonDevTools_validate_tocs()

# Lint for errors
mcp_AddonDevTools_lint_addon({ name = "!Mechanic" })

# Format code
mcp_AddonDevTools_format_addon({ addon_name = "!Mechanic" })
```

**Manual Testing**:
1. Open API tab, verify categories display
2. Select C_Spell.GetSpellCooldown
3. Run with default parameters
4. Verify results show secret status
5. Add notes, reload, verify persistence
6. Run Category, verify all execute
7. Copy Report, verify format
8. Test in PTR/Beta to verify secret detection

---

## Future Enhancements (Out of Scope)

- **Live Monitoring**: Track API behavior over time
- **API Discovery**: Auto-detect available APIs
- **Diff Reports**: Compare results between sessions
- **Classic Support**: API variants for Classic/Era
- **Import/Export**: Share API notes between developers

---

## Completion Criteria

Phase 7 is complete when:
- [ ] API tab functional with all defined APIs
- [ ] Secret detection working on PTR/Beta
- [ ] Copy reports useful for bug reports
- [ ] Notes persist across sessions
- [ ] Documentation updated in MASTER_PLAN.md

