-- UI/API.lua
-- !Mechanic - API Test Bench (Phase 7 + Phase 11 Enhancements)
--
-- Centralized API exploration, testing, and documentation.
-- Features: Virtual scrolling, search, impact filtering, namespace grouping.

local ADDON_NAME, ns = ...
local Mechanic = LibStub("AceAddon-3.0"):GetAddon(ADDON_NAME)
local L = LibStub("AceLocale-3.0"):GetLocale(ADDON_NAME, true)
local APIModule = {}
Mechanic.API = APIModule

APIModule.frame = nil
APIModule.selectedAPI = nil
APIModule.paramInputs = {}
APIModule.lastResults = {}
APIModule.allItems = {} -- Full list of nav items (built once)
APIModule.filteredItems = {} -- Current filtered list

-- Filter state
APIModule.searchText = ""
APIModule.impactFilter = nil -- nil = all, or "HIGH", "CONDITIONAL", "RESTRICTED"
APIModule.namespaceFilter = nil -- nil = all, or specific namespace key
APIModule.hideRestricted = true -- Hide all protected/restricted APIs (default: on)

-- Import definitions
local API_DEFINITIONS = ns.APIDefinitions
local API_REGISTRY = ns.APIRegistry
local ICON_PATH = [[Interface\AddOns\Mechanic\Assets\Icons\]]

--------------------------------------------------------------------------------
-- Common Parameter Examples (auto-applied based on param name patterns)
--------------------------------------------------------------------------------

local COMMON_PARAM_EXAMPLES = {
	-- Action Bar (1-12 = main bar, 13-24 = bar 2, etc.)
	actionID = {
		{ value = 1, label = "Slot 1" },
		{ value = 2, label = "Slot 2" },
		{ value = 6, label = "Slot 6" },
		{ value = 12, label = "Slot 12" },
	},
	slotID = {
		{ value = 1, label = "Slot 1" },
		{ value = 6, label = "Slot 6" },
		{ value = 12, label = "Slot 12" },
	},
	-- Common spellIDs (class-agnostic utility spells)
	spellID = {
		{ value = 6603, label = "Attack" },
		{ value = 8690, label = "Hearthstone" },
		{ value = 818, label = "Basic Camp" },
	},
	-- Unit tokens
	unit = {
		{ value = "player", label = "Player" },
		{ value = "target", label = "Target" },
		{ value = "focus", label = "Focus" },
	},
	target = {
		{ value = "player", label = "Player" },
		{ value = "target", label = "Target" },
		{ value = "mouseover", label = "Mouseover" },
	},
	unitToken = {
		{ value = "player", label = "Player" },
		{ value = "target", label = "Target" },
		{ value = "pet", label = "Pet" },
	},
	-- Index-based params
	index = {
		{ value = 1, label = "1" },
		{ value = 2, label = "2" },
		{ value = 5, label = "5" },
	},
	pageIndex = {
		{ value = 1, label = "Page 1" },
		{ value = 2, label = "Page 2" },
		{ value = 6, label = "Page 6" },
	},
	-- Pet action bar
	petActionID = {
		{ value = 1, label = "Pet 1" },
		{ value = 2, label = "Pet 2" },
		{ value = 10, label = "Pet 10" },
	},
	-- Flyout
	flyoutID = {
		{ value = 1, label = "Flyout 1" },
		{ value = 2, label = "Flyout 2" },
	},
	-- Factions (common TWW factions)
	factionID = {
		{ value = 2570, label = "Hallowfall Arathi" },
		{ value = 2590, label = "Council of Dornogal" },
		{ value = 2600, label = "Brann" },
	},
	majorFactionID = {
		{ value = 2570, label = "Hallowfall" },
		{ value = 2590, label = "Dornogal" },
	},
	-- Items (common consumables)
	itemID = {
		{ value = 6948, label = "Hearthstone" },
		{ value = 110560, label = "Garrison HS" },
	},
	-- Quest
	questID = {
		{ value = 1, label = "Quest 1" },
	},
	-- Bag/Container
	bagID = {
		{ value = 0, label = "Backpack" },
		{ value = 1, label = "Bag 1" },
		{ value = 4, label = "Bag 4" },
	},
	-- Equipment slots (common)
	equipmentSlotIndex = {
		{ value = 1, label = "Head" },
		{ value = 5, label = "Chest" },
		{ value = 16, label = "Main Hand" },
	},
	-- Boolean
	enable = {
		{ value = true, label = "True" },
		{ value = false, label = "False" },
	},
	enabled = {
		{ value = true, label = "True" },
		{ value = false, label = "False" },
	},
	useNeutral = {
		{ value = true, label = "True" },
		{ value = false, label = "False" },
	},
	-- Bonus bar
	bonusBarIndex = {
		{ value = 1, label = "Bar 1" },
		{ value = 2, label = "Bar 2" },
		{ value = 5, label = "Druid" },
	},
	-- Numbers (generic fallback for maxDisplayCount, etc.)
	maxDisplayCount = {
		{ value = 99, label = "99" },
		{ value = 999, label = "999" },
		{ value = 9999, label = "9999" },
	},
	-- Currency
	currencyID = {
		{ value = 1792, label = "Honor" },
		{ value = 1602, label = "Conquest" },
		{ value = 2245, label = "Flightstones" },
	},
	-- Talent
	talentID = {
		{ value = 1, label = "Talent 1" },
	},
	-- Achievement
	achievementID = {
		{ value = 6, label = "Level 10" },
		{ value = 7, label = "Level 20" },
	},
}

-- Get examples for a parameter (explicit examples take priority)
local function GetParamExamples(param)
	-- If param has explicit examples, use those
	if param.examples and #param.examples > 0 then
		return param.examples
	end
	-- Check for common examples by exact name match
	local examples = COMMON_PARAM_EXAMPLES[param.name]
	if examples then
		return examples
	end
	-- Check for partial name matches (case-insensitive)
	local lowerName = param.name:lower()
	for key, exs in pairs(COMMON_PARAM_EXAMPLES) do
		if lowerName:find(key:lower()) then
			return exs
		end
	end
	return nil
end

--------------------------------------------------------------------------------
-- Midnight Impact Explanations
--------------------------------------------------------------------------------

local IMPACT_EXPLANATIONS = {
	RESTRICTED = "This API is fully protected in 12.0. Calls will be blocked or return nil.",
	CONDITIONAL = "This API works but may return secret values under certain conditions.",
	HIGH = "Major changes expected. Review usage carefully before Midnight.",
	SAFE = "No significant changes expected for this API.",
}

-- Parse secret behavior notation into human-readable text
local function ParseSecretBehavior(note)
	if not note then
		return nil
	end

	local explanations = {}

	-- SecretArguments patterns
	if note:find("SecretArguments=AllowedWhenUntainted") then
		table.insert(explanations, "Arguments accepted when code is untainted (no addon interference)")
	end
	if note:find("SecretArguments=AllowedWhenTainted") then
		table.insert(explanations, "Arguments accepted even when tainted")
	end

	-- SecretWhen patterns
	if note:find("SecretWhenActionCooldownRestricted") then
		table.insert(explanations, "Returns secret when action cooldown info is restricted")
	end
	if note:find("SecretWhenUnitCastingInfoRestricted") then
		table.insert(explanations, "Returns secret when unit casting info is restricted")
	end
	if note:find("SecretWhenCurveSecret") then
		table.insert(explanations, "Returns secret when curve parameter is secret")
	end
	if note:find("SecretWhenSoftTargetRestricted") then
		table.insert(explanations, "Returns secret when soft target info is restricted")
	end

	if #explanations == 0 then
		return nil
	end
	return explanations
end

--------------------------------------------------------------------------------
-- Initialization
--------------------------------------------------------------------------------

function Mechanic:InitializeAPI()
	if APIModule.frame then
		return
	end

	-- Build namespace categories from registry (only once)
	ns.BuildNamespaceCategories()

	local parent = self.frame.moduleContent
	local frame = CreateFrame("Frame", nil, parent)
	frame:SetAllPoints()
	APIModule.frame = frame

	-- Main layout: Left nav (search + virtual list) | Right content
	APIModule:BuildLayout(frame)

	-- Build initial nav items from registry
	APIModule:BuildAllNavItems()
	APIModule:ApplyFilters()
end

function APIModule:BuildLayout(parent)
	-- Create a manual split layout since we need custom nav content
	local navWidth = 310

	-- Navigation panel (left)
	local navPanel = CreateFrame("Frame", nil, parent)
	navPanel:SetPoint("TOPLEFT", 0, 0)
	navPanel:SetPoint("BOTTOMLEFT", 0, 0)
	navPanel:SetWidth(navWidth)
	self.navPanel = navPanel

	-- Nav background
	local navBg = navPanel:CreateTexture(nil, "BACKGROUND")
	navBg:SetAllPoints()
	local r, g, b = FenUI:GetColorRGB("surfaceInset")
	navBg:SetColorTexture(r, g, b, 0.6)

	-- Nav separator
	local navSep = navPanel:CreateTexture(nil, "BORDER")
	navSep:SetPoint("TOPRIGHT")
	navSep:SetPoint("BOTTOMRIGHT")
	navSep:SetWidth(1)
	navSep:SetColorTexture(FenUI:GetColorRGB("borderSubtle"))

	-- Search input (top of nav)
	local searchRow = CreateFrame("Frame", nil, navPanel)
	searchRow:SetPoint("TOPLEFT", 4, -4)
	searchRow:SetPoint("TOPRIGHT", -4, -4)
	searchRow:SetHeight(28)

	-- Search handler with debounce
	local searchTimer = nil
	local function onSearchChange(text)
		if searchTimer then
			searchTimer:Cancel()
		end
		searchTimer = C_Timer.NewTimer(0.15, function()
			APIModule.searchText = text or ""
			APIModule:ApplyFilters()
		end)
	end

	local searchInput = FenUI:CreateInput(searchRow, {
		width = navWidth - 8,
		height = 24,
		placeholder = "Search APIs...",
		onChange = onSearchChange,
	})
	searchInput:SetPoint("LEFT", 0, 0)
	searchInput:SetPoint("RIGHT", 0, 0)
	self.searchInput = searchInput

	-- Filter row (impact dropdown + namespace dropdown)
	local filterRow = CreateFrame("Frame", nil, navPanel)
	filterRow:SetPoint("TOPLEFT", searchRow, "BOTTOMLEFT", 0, -4)
	filterRow:SetPoint("TOPRIGHT", searchRow, "BOTTOMRIGHT", 0, -4)
	filterRow:SetHeight(24)

	-- Impact filter dropdown
	local impactItems = {
		{ value = nil, text = "All Impacts" },
		{ value = "HIGH", text = "|cffff4444High|r" },
		{ value = "CONDITIONAL", text = "|cffffaa00Conditional|r" },
		{ value = "RESTRICTED", text = "|cffff8800Restricted|r" },
	}
	local impactDropdown = FenUI:CreateDropdown(filterRow, {
		width = 100,
		height = 22,
		items = impactItems,
		defaultText = "All Impacts",
		onSelect = function(value)
			APIModule.impactFilter = value
			APIModule:ApplyFilters()
		end,
	})
	impactDropdown:SetPoint("LEFT", 0, 0)
	self.impactDropdown = impactDropdown

	-- Namespace filter (searchable picker)
	local nsPicker = FenUI:CreateSearchablePicker(filterRow, {
		width = 120,
		height = 22,
		popupWidth = 240,
		popupHeight = 320,
		defaultText = "All Namespaces",
		items = {},
		onSelect = function(value, item)
			APIModule.namespaceFilter = value
			APIModule:ApplyFilters()
		end,
	})
	nsPicker:SetPoint("LEFT", impactDropdown, "RIGHT", 4, 0)
	self.nsPicker = nsPicker

	-- Safe Only toggle button
	local safeToggle = CreateFrame("Button", nil, filterRow)
	safeToggle:SetSize(56, 22)
	safeToggle:SetPoint("LEFT", nsPicker, "RIGHT", 4, 0)

	-- Background
	local toggleBg = safeToggle:CreateTexture(nil, "BACKGROUND")
	toggleBg:SetAllPoints()
	toggleBg:SetColorTexture(0.15, 0.15, 0.15, 0.9)
	safeToggle.bg = toggleBg

	-- Border
	local toggleBorder = safeToggle:CreateTexture(nil, "BORDER")
	toggleBorder:SetPoint("TOPLEFT", -1, 1)
	toggleBorder:SetPoint("BOTTOMRIGHT", 1, -1)
	toggleBorder:SetColorTexture(0.3, 0.3, 0.3, 1)
	safeToggle.border = toggleBorder

	-- Label
	local toggleText = safeToggle:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
	toggleText:SetPoint("CENTER", 0, 0)
	toggleText:SetText(L["Safe"] or "Safe")
	safeToggle.label = toggleText

	-- Update visual state
	local function UpdateToggleVisual()
		if APIModule.hideRestricted then
			safeToggle.bg:SetColorTexture(0.2, 0.5, 0.2, 0.9)
			safeToggle.border:SetColorTexture(0.3, 0.7, 0.3, 1)
			safeToggle.label:SetText(L["Safe"] or "Safe")
			safeToggle.label:SetTextColor(1, 1, 1)
		else
			safeToggle.bg:SetColorTexture(0.15, 0.15, 0.15, 0.9)
			safeToggle.border:SetColorTexture(0.3, 0.3, 0.3, 1)
			safeToggle.label:SetText(L["Safe"] or "Safe")
			safeToggle.label:SetTextColor(0.5, 0.5, 0.5)
		end
	end

	safeToggle:SetScript("OnClick", function()
		APIModule.hideRestricted = not APIModule.hideRestricted
		UpdateToggleVisual()
		APIModule:ApplyFilters()
	end)

	-- Tooltip
	safeToggle:SetScript("OnEnter", function(self)
		self.bg:SetColorTexture(0.25, 0.25, 0.25, 0.9)
		GameTooltip:SetOwner(self, "ANCHOR_RIGHT")
		GameTooltip:SetText(L["Safe APIs Only"] or "Safe APIs Only", 1, 1, 1)
		GameTooltip:AddLine(" ")
		GameTooltip:AddLine("When enabled, hides APIs with Midnight", 0.7, 0.7, 0.7, true)
		GameTooltip:AddLine("protection (RESTRICTED, CONDITIONAL, HIGH).", 0.7, 0.7, 0.7, true)
		GameTooltip:AddLine(" ")
		GameTooltip:AddLine("Shows only NORMAL impact APIs that can", 0.7, 0.7, 0.7, true)
		GameTooltip:AddLine("be called without restrictions.", 0.7, 0.7, 0.7, true)
		GameTooltip:Show()
	end)
	safeToggle:SetScript("OnLeave", function(self)
		UpdateToggleVisual()
		GameTooltip:Hide()
	end)

	UpdateToggleVisual()
	self.safeToggle = safeToggle

	-- Stats label
	local statsLabel = navPanel:CreateFontString(nil, "OVERLAY", "GameFontDisableSmall")
	statsLabel:SetPoint("TOPLEFT", filterRow, "BOTTOMLEFT", 2, -4)
	statsLabel:SetJustifyH("LEFT")
	self.statsLabel = statsLabel

	-- Virtual list for API navigation
	local listTop = 28 + 4 + 24 + 4 + 14 -- search + gap + filter + gap + stats
	local virtualList = FenUI:CreateVirtualList(navPanel, {
		itemHeight = 22,
		items = {},
		onSelect = function(key, item)
			APIModule:OnAPISelected(key)
		end,
		renderItem = function(row, item, isSelected)
			APIModule:RenderNavItem(row, item, isSelected)
		end,
	})
	virtualList:SetPoint("TOPLEFT", 2, -listTop)
	virtualList:SetPoint("BOTTOMRIGHT", -2, 2)
	self.virtualList = virtualList

	-- Content panel (right)
	local contentPanel = CreateFrame("Frame", nil, parent)
	contentPanel:SetPoint("TOPLEFT", navPanel, "TOPRIGHT", 4, 0)
	contentPanel:SetPoint("BOTTOMRIGHT", 0, 0)
	self.contentPanel = contentPanel

	-- Toolbar (in content area)
	local toolbar = FenUI:CreateToolbar(contentPanel, {
		height = 32,
		padding = 4,
	})
	toolbar:SetPoint("TOPLEFT", 0, 0)
	toolbar:SetPoint("TOPRIGHT", 0, 0)
	self.toolbar = toolbar

	toolbar:AddSpacer("flex")

	-- Export Button
	toolbar:AddImageButton({
		texture = ICON_PATH .. "icon-export",
		size = 24,
		tooltip = L["Export Button"] or "Export",
		onClick = function()
			APIModule:Export()
		end,
	})

	-- Help Button
	toolbar:AddImageButton({
		texture = ICON_PATH .. "icon-help",
		size = 24,
		tooltip = L["Help"] or "Help",
		onClick = function()
			Mechanic.Utils:ShowHelpDialog("api")
		end,
	})

	-- Content area (below toolbar)
	local contentArea = CreateFrame("Frame", nil, contentPanel)
	contentArea:SetPoint("TOPLEFT", toolbar, "BOTTOMLEFT", 0, -4)
	contentArea:SetPoint("BOTTOMRIGHT", 0, 0)
	self.contentArea = contentArea

	-- Content frames cache (one per selected API)
	self.contentFrames = {}

	-- Populate namespace list after categories are built
	C_Timer.After(0, function()
		APIModule:BuildNamespaceList()
	end)
end

function APIModule:BuildNamespaceList()
	local items = { { key = "all", text = "All Namespaces", value = nil } }
	for _, nsKey in ipairs(ns.APINamespaces or {}) do
		local cat = ns.APICategoryLookup[nsKey]
		local displayText = nsKey
		if cat and cat.stats then
			local highCount = cat.stats.high + cat.stats.conditional
			if highCount > 0 then
				displayText = string.format("%s |cff888888(%d)|r", nsKey, highCount)
			end
		end
		table.insert(items, { key = nsKey, text = displayText, value = nsKey })
	end
	-- Update the SearchablePicker with items
	if self.nsPicker and self.nsPicker.SetItems then
		self.nsPicker:SetItems(items)
	end
end

--------------------------------------------------------------------------------
-- Navigation Building (from Registry)
--------------------------------------------------------------------------------

function APIModule:BuildAllNavItems()
	local items = {}
	local namespaceAPIs = {} -- Group by namespace

	-- Group APIs by namespace from registry
	for apiKey, entry in pairs(API_REGISTRY) do
		local nsKey = entry.ns or "Global"
		if not namespaceAPIs[nsKey] then
			namespaceAPIs[nsKey] = {}
		end
		table.insert(namespaceAPIs[nsKey], {
			key = apiKey,
			name = entry.name,
			namespace = nsKey,
			impact = entry.impact or "RESTRICTED",
		})
	end

	-- Sort namespaces
	local sortedNamespaces = {}
	for nsKey in pairs(namespaceAPIs) do
		table.insert(sortedNamespaces, nsKey)
	end
	table.sort(sortedNamespaces)

	-- Build flat item list with namespace headers
	for _, nsKey in ipairs(sortedNamespaces) do
		local apis = namespaceAPIs[nsKey]

		-- Sort APIs within namespace by name
		table.sort(apis, function(a, b)
			return (a.name or a.key) < (b.name or b.key)
		end)

		-- Add namespace header
		table.insert(items, {
			key = "ns_" .. nsKey,
			text = nsKey,
			namespace = nsKey,
			isHeader = true,
			isCategory = true,
		})

		-- Add APIs
		for _, api in ipairs(apis) do
			table.insert(items, {
				key = api.key,
				text = api.name or api.key,
				namespace = nsKey,
				impact = api.impact,
				isAPI = true,
				indent = 1,
			})
		end
	end

	self.allItems = items
end

function APIModule:ApplyFilters()
	local filtered = {}
	local searchLower = self.searchText and self.searchText:lower() or ""
	local impactFilter = self.impactFilter
	local nsFilter = self.namespaceFilter
	local hideRestricted = self.hideRestricted

	local pendingHeader = nil

	for _, item in ipairs(self.allItems) do
		if item.isHeader then
			-- Check if this namespace should be shown
			if not nsFilter or item.namespace == nsFilter then
				pendingHeader = item
			else
				pendingHeader = nil
			end
		elseif item.isAPI then
			-- Check namespace filter
			if nsFilter and item.namespace ~= nsFilter then
				-- Skip
			else
				-- Check "Safe Only" filter (hide restricted/protected APIs)
				if hideRestricted and item.impact and item.impact ~= "NORMAL" then
					-- Skip protected APIs when "Safe Only" is checked
				else
					-- Check impact filter
					local passImpact = not impactFilter or item.impact == impactFilter

					-- Check search filter
					local passSearch = searchLower == "" or
						(item.text and item.text:lower():find(searchLower, 1, true)) or
						(item.key and item.key:lower():find(searchLower, 1, true))

						if passImpact and passSearch then
						-- Add pending header if this is first visible item in namespace
						if pendingHeader then
							table.insert(filtered, pendingHeader)
							pendingHeader = nil
						end
						table.insert(filtered, item)
					end
				end
			end
		end
	end

	self.filteredItems = filtered

	-- Update virtual list
	if self.virtualList then
		self.virtualList:SetItems(filtered)
	end

	-- Update stats label
	local apiCount = 0
	for _, item in ipairs(filtered) do
		if item.isAPI then
			apiCount = apiCount + 1
		end
	end
	if self.statsLabel then
		self.statsLabel:SetText(string.format("%d APIs", apiCount))
	end
end

function APIModule:RenderNavItem(row, item, isSelected)
	-- Update selection highlight
	if isSelected then
		local selR, selG, selB = FenUI:GetColorRGB("surfaceRowSelected")
		row.bg:SetColorTexture(selR, selG, selB, 1)
		row.bg:Show()
	else
		row.bg:Hide()
	end

	if item.isHeader or item.isCategory then
		-- Namespace header styling
		local r, g, b = FenUI:GetColorRGB("textMuted")
		row.text:SetTextColor(r, g, b)
		row.text:SetText(item.text)
		row.text:ClearAllPoints()
		row.text:SetPoint("LEFT", 4, 0)
		row:Disable()
	else
		-- API item styling with impact color
		local impactColor = self:GetImpactColor(item.impact)
		local displayText = string.format("%s%s|r", impactColor, item.text or item.key)
		row.text:SetText(displayText)

		local indent = (item.indent or 0) * 12 + 8
		row.text:ClearAllPoints()
		row.text:SetPoint("LEFT", indent, 0)

		if isSelected then
			local r, g, b = FenUI:GetColorRGB("textDefault")
			row.text:SetTextColor(r, g, b)
		else
			row.text:SetTextColor(1, 1, 1)
		end
		row:Enable()
	end
end

function APIModule:GetImpactColor(impact)
	local lookup = ns.APIImpactLookup
	if lookup and lookup[impact] then
		return lookup[impact].color
	end
	-- Fallback colors
	if impact == "HIGH" then
		return "|cffff4444"
	elseif impact == "CONDITIONAL" then
		return "|cffffaa00"
	elseif impact == "RESTRICTED" then
		return "|cffff8800"
	end
	return "|cffffffff"
end

--------------------------------------------------------------------------------
-- API Selection & Details
--------------------------------------------------------------------------------

function APIModule:OnAPISelected(key)
	-- Skip namespace headers
	if key:find("^ns_") then
		return
	end

	local apiDef = API_DEFINITIONS[key]
	if not apiDef then
		return
	end

	self.selectedAPI = key

	-- Get or create content frame
	local contentFrame = self:GetContentFrame(key)
	self:BuildAPIPanel(contentFrame, apiDef)

	-- Update virtual list selection
	if self.virtualList then
		self.virtualList:Select(key, true)
	end
end

function APIModule:GetContentFrame(key)
	if not self.contentFrames[key] then
		local frame = CreateFrame("Frame", nil, self.contentArea)
		frame:SetAllPoints()
		frame:Hide()
		self.contentFrames[key] = frame
	end

	-- Hide all other content frames
	for k, f in pairs(self.contentFrames) do
		if k == key then
			f:Show()
		else
			f:Hide()
		end
	end

	return self.contentFrames[key]
end

function APIModule:BuildAPIPanel(parent, apiDef)
	-- Clear previous content
	for _, child in ipairs({ parent:GetChildren() }) do
		child:Hide()
	end
	wipe(self.paramInputs)

	local yOffset = -8

	-- Header: API name and path
	local nameLabel = Mechanic.Utils:GetOrCreateWidget(parent, "nameLabel", function(p)
		return p:CreateFontString(nil, "OVERLAY", "GameFontNormalHuge")
	end)
	nameLabel:SetPoint("TOPLEFT", 8, yOffset)
	nameLabel:SetText(apiDef.funcPath)
	nameLabel:Show()
	yOffset = yOffset - 24

	-- Namespace and category
	local infoLabel = Mechanic.Utils:GetOrCreateWidget(parent, "infoLabel", function(p)
		return p:CreateFontString(nil, "OVERLAY", "GameFontHighlight")
	end)
	infoLabel:SetPoint("TOPLEFT", 8, yOffset)
	local nsName = apiDef.category or "Unknown"
	infoLabel:SetText(string.format("Namespace: %s", tostring(nsName)))
	infoLabel:Show()
	yOffset = yOffset - 18

	-- Midnight impact
	local impactColor = self:GetImpactColor(apiDef.midnightImpact)
	local impactLabel = Mechanic.Utils:GetOrCreateWidget(parent, "impactLabel", function(p)
		return p:CreateFontString(nil, "OVERLAY", "GameFontHighlight")
	end)
	impactLabel:SetPoint("TOPLEFT", 8, yOffset)
	impactLabel:SetText(
		string.format(
			"Midnight Impact: %s%s|r",
			tostring(impactColor or "|cffffffff"),
			tostring(apiDef.midnightImpact or "Unknown")
		)
	)
	impactLabel:Show()
	yOffset = yOffset - 18

	-- Impact explanation (human-readable)
	local impactExplanation = IMPACT_EXPLANATIONS[apiDef.midnightImpact]
	if impactExplanation then
		local explainLabel = Mechanic.Utils:GetOrCreateWidget(parent, "impactExplainLabel", function(p)
			local label = p:CreateFontString(nil, "OVERLAY", "GameFontHighlightSmall")
			label:SetJustifyH("LEFT")
			label:SetWordWrap(true)
			return label
		end)
		explainLabel:SetPoint("TOPLEFT", 16, yOffset)
		explainLabel:SetPoint("RIGHT", -8, 0)
		explainLabel:SetText(string.format("|cff88ff88%s|r", impactExplanation))
		explainLabel:Show()
		yOffset = yOffset - (explainLabel:GetStringHeight() + 4)
	else
		-- Hide if no explanation
		local explainLabel = parent.impactExplainLabel
		if explainLabel then
			explainLabel:Hide()
		end
	end

	-- Parsed secret behavior (human-readable bullet points)
	local secretExplanations = ParseSecretBehavior(apiDef.midnightNote)
	if secretExplanations and #secretExplanations > 0 then
		local secretLabel = Mechanic.Utils:GetOrCreateWidget(parent, "secretExplainLabel", function(p)
			local label = p:CreateFontString(nil, "OVERLAY", "GameFontHighlightSmall")
			label:SetJustifyH("LEFT")
			label:SetWordWrap(true)
			return label
		end)
		secretLabel:SetPoint("TOPLEFT", 16, yOffset)
		secretLabel:SetPoint("RIGHT", -8, 0)
		local bulletText = "|cffaaaaaa• " .. table.concat(secretExplanations, "\n• ") .. "|r"
		secretLabel:SetText(bulletText)
		secretLabel:Show()
		yOffset = yOffset - (secretLabel:GetStringHeight() + 4)
	else
		local secretLabel = parent.secretExplainLabel
		if secretLabel then
			secretLabel:Hide()
		end
	end

	-- Raw midnight note (collapsed/smaller, for reference)
	if apiDef.midnightNote then
		local noteLabel = Mechanic.Utils:GetOrCreateWidget(parent, "noteLabel", function(p)
			local label = p:CreateFontString(nil, "OVERLAY", "GameFontDisableSmall")
			label:SetJustifyH("LEFT")
			label:SetWordWrap(true)
			return label
		end)
		noteLabel:SetPoint("TOPLEFT", 16, yOffset)
		noteLabel:SetPoint("RIGHT", -8, 0)
		noteLabel:SetText(string.format("|cff666666Raw: %s|r", tostring(apiDef.midnightNote)))
		noteLabel:Show()
		yOffset = yOffset - (noteLabel:GetStringHeight() + 8)
	else
		local noteLabel = parent.noteLabel
		if noteLabel then
			noteLabel:Hide()
		end
	end

	-- Separator
	yOffset = yOffset - 8
	local sep1 = Mechanic.Utils:GetOrCreateWidget(parent, "sep1", function(p)
		local sep = p:CreateTexture(nil, "BACKGROUND")
		sep:SetHeight(1)
		sep:SetColorTexture(1, 1, 1, 0.2)
		return sep
	end)
	sep1:SetPoint("TOPLEFT", 8, yOffset)
	sep1:SetPoint("RIGHT", -8, 0)
	sep1:Show()
	yOffset = yOffset - 12

	-- Parameters section
	local paramsHeader = Mechanic.Utils:GetOrCreateWidget(parent, "paramsHeader", function(p)
		return p:CreateFontString(nil, "OVERLAY", "GameFontNormal")
	end)
	paramsHeader:SetPoint("TOPLEFT", 8, yOffset)
	paramsHeader:SetText(L["Parameters:"])
	paramsHeader:Show()
	yOffset = yOffset - 20

	for i, param in ipairs(apiDef.params) do
		local paramRow = self:CreateParamInput(parent, param, i, yOffset)
		yOffset = yOffset - 28
	end

	-- Buttons
	yOffset = yOffset - 8
	local buttonRow = Mechanic.Utils:GetOrCreateWidget(parent, "buttonRow", function(p)
		return CreateFrame("Frame", nil, p)
	end)
	buttonRow:SetPoint("TOPLEFT", 8, yOffset)
	buttonRow:SetSize(400, 30)
	buttonRow:Show()

	local runBtn = Mechanic.Utils:GetOrCreateWidget(buttonRow, "runBtn", function(p)
		return FenUI:CreateImageButton(p, {
			texture = ICON_PATH .. "icon-play",
			size = 24,
			tooltip = L["Run"],
			onClick = function()
				self:RunAPI(apiDef)
			end,
		})
	end)
	runBtn:SetPoint("LEFT", 0, 0)
	runBtn:Show()

	local runCatBtn = Mechanic.Utils:GetOrCreateWidget(buttonRow, "runCatBtn", function(p)
		return FenUI:CreateImageButton(p, {
			texture = ICON_PATH .. "icon-play-auto",
			size = 24,
			tooltip = L["Run Namespace"] or "Run all APIs in this namespace",
			onClick = function()
				-- Get namespace from registry (has ns field) rather than definitions
				local registryEntry = API_REGISTRY[apiDef.key]
				local nsToRun = registryEntry and registryEntry.ns or apiDef.category
				self:RunNamespace(nsToRun)
			end,
		})
	end)
	runCatBtn:SetPoint("LEFT", runBtn, "RIGHT", 12, 0)
	runCatBtn:Show()

	local copyBtn = Mechanic.Utils:GetOrCreateWidget(buttonRow, "copyBtn", function(p)
		return FenUI:CreateImageButton(p, {
			texture = ICON_PATH .. "icon-export",
			size = 24,
			tooltip = L["Copy Report"],
			onClick = function()
				self:CopyAPIReport(apiDef)
			end,
		})
	end)
	copyBtn:SetPoint("LEFT", runCatBtn, "RIGHT", 12, 0)
	copyBtn:Show()

	-- Namespace run status (shows result of Run Namespace)
	local nsStatusLabel = Mechanic.Utils:GetOrCreateWidget(buttonRow, "nsStatusLabel", function(p)
		local label = p:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
		label:SetTextColor(0.7, 0.7, 0.7)
		return label
	end)
	nsStatusLabel:SetPoint("LEFT", copyBtn, "RIGHT", 16, 0)
	nsStatusLabel:SetText("")
	nsStatusLabel:Show()
	parent.nsStatusLabel = nsStatusLabel

	yOffset = yOffset - 40

	-- Separator
	local sep2 = Mechanic.Utils:GetOrCreateWidget(parent, "sep2", function(p)
		local sep = p:CreateTexture(nil, "BACKGROUND")
		sep:SetHeight(1)
		sep:SetColorTexture(1, 1, 1, 0.2)
		return sep
	end)
	sep2:SetPoint("TOPLEFT", 8, yOffset)
	sep2:SetPoint("RIGHT", -8, 0)
	sep2:Show()
	yOffset = yOffset - 12

	-- Results section
	local resultsHeader = Mechanic.Utils:GetOrCreateWidget(parent, "resultsHeader", function(p)
		return p:CreateFontString(nil, "OVERLAY", "GameFontNormal")
	end)
	resultsHeader:SetPoint("TOPLEFT", 8, yOffset)
	resultsHeader:SetText(L["Results:"])
	resultsHeader:Show()
	yOffset = yOffset - 20

	-- Status line
	local statusLabel = Mechanic.Utils:GetOrCreateWidget(parent, "statusLabel", function(p)
		return p:CreateFontString(nil, "OVERLAY", "GameFontHighlight")
	end)
	statusLabel:SetPoint("TOPLEFT", 8, yOffset)
	statusLabel:SetText(L["Not yet run"])
	statusLabel:Show()
	parent.statusLabel = statusLabel
	yOffset = yOffset - 20

	-- Results display (MultiLineEditBox)
	local resultsBox = Mechanic.Utils:GetOrCreateWidget(parent, "resultsBox", function(p)
		return FenUI:CreateMultiLineEditBox(p, {
			readOnly = true,
			background = "surfaceInset",
			font = "fontMono",
		})
	end)
	resultsBox:SetPoint("TOPLEFT", 8, yOffset)
	resultsBox:SetPoint("BOTTOMRIGHT", -8, 80)
	resultsBox:Show()
	parent.resultsBox = resultsBox

	-- Notes section (at bottom)
	local notesHeader = Mechanic.Utils:GetOrCreateWidget(parent, "notesHeader", function(p)
		return p:CreateFontString(nil, "OVERLAY", "GameFontNormal")
	end)
	notesHeader:SetPoint("BOTTOMLEFT", 8, 70)
	notesHeader:SetText(L["Notes:"])
	notesHeader:Show()

	local apiNotesBox = Mechanic.Utils:GetOrCreateWidget(parent, "notesBox", function(p)
		local box = FenUI:CreateMultiLineEditBox(p, {
			background = "surfaceInset",
			font = "fontMono",
		})
		box:SetHeight(55)
		return box
	end)
	apiNotesBox:SetPoint("BOTTOMLEFT", 8, 8)
	apiNotesBox:SetPoint("BOTTOMRIGHT", -8, 8)
	apiNotesBox:Show()

	-- Load saved notes
	local savedNotes = Mechanic.db.profile.apiTests
			and Mechanic.db.profile.apiTests[apiDef.key]
			and Mechanic.db.profile.apiTests[apiDef.key].notes
		or ""
	apiNotesBox:SetText(savedNotes)

	apiNotesBox.editBox:SetScript("OnTextChanged", function(eb)
		APIModule:SaveNotes(apiDef.key, eb:GetText())
	end)
	parent.notesBox = apiNotesBox

	-- Restore last results if available
	if self.lastResults[apiDef.key] then
		self:DisplayResults(parent, apiDef, self.lastResults[apiDef.key])
	end
end

function APIModule:CreateParamInput(parent, param, index, yOffset)
	local row = Mechanic.Utils:GetOrCreateWidget(parent, string.format("param_%d", index), function(p)
		return CreateFrame("Frame", nil, p)
	end)
	row:SetPoint("TOPLEFT", 16, yOffset)
	row:SetSize(500, 24)
	row:Show()

	local label = Mechanic.Utils:GetOrCreateWidget(row, "label", function(p)
		local fs = p:CreateFontString(nil, "OVERLAY", "GameFontHighlight")
		fs:SetWidth(120)
		fs:SetJustifyH("LEFT")
		return fs
	end)
	label:SetPoint("LEFT", 0, 0)
	label:SetText(string.format("%s:", param.name))
	label:Show()

	local input = Mechanic.Utils:GetOrCreateWidget(row, "input", function(p)
		return FenUI:CreateInput(p, {
			width = 150,
			height = 20,
		})
	end)
	input:SetPoint("LEFT", label, "RIGHT", 8, 0)

	-- Get examples (explicit or auto-generated from common patterns)
	local examples = GetParamExamples(param)

	-- Default value: use param.default if set, otherwise use first example if available
	local defaultValue = param.default
	if defaultValue == nil and examples and #examples > 0 then
		defaultValue = examples[1].value
	end
	input:SetText(tostring(defaultValue or ""))
	input:Show()

	local typeLabel = Mechanic.Utils:GetOrCreateWidget(row, "typeLabel", function(p)
		return p:CreateFontString(nil, "OVERLAY", "GameFontDisableSmall")
	end)
	typeLabel:SetPoint("LEFT", input, "RIGHT", 8, 0)
	typeLabel:SetText(string.format("(%s)", param.type))
	typeLabel:Show()

	-- Examples dropdown (if examples available)
	if examples and #examples > 0 then
		local examplesBtn = Mechanic.Utils:GetOrCreateWidget(row, "examplesBtn", function(p)
			return FenUI:CreateDropdown(p, {
				width = 24,
				height = 20,
				items = examples,
				fixedText = true,
				defaultText = "v",
				onSelect = function(val)
					input:SetText(tostring(val))
				end,
			})
		end)
		examplesBtn:SetPoint("LEFT", typeLabel, "RIGHT", 8, 0)
		examplesBtn:Show()

		-- Quick example buttons for common cases (show first 3)
		local xOffset = 36
		for i, example in ipairs(examples) do
			if i > 3 then
				break
			end
			local quickBtn = Mechanic.Utils:GetOrCreateWidget(row, string.format("quickBtn%d", i), function(p)
				return FenUI:CreateButton(p, {
					text = string.format("|cff88ccff%s|r", example.label),
					width = 40,
					height = 18,
					onClick = function()
						input:SetText(tostring(example.value))
					end,
				})
			end)
			quickBtn:SetPoint("LEFT", typeLabel, "RIGHT", xOffset, 0)

			local textWidth = quickBtn:GetFontString():GetStringWidth()
			quickBtn:SetWidth(math.max(textWidth + 12, 40))
			quickBtn:Show()

			xOffset = xOffset + quickBtn:GetWidth() + 4
		end
	end

	-- Store reference for value retrieval
	self.paramInputs[param.name] = input

	return row
end

--------------------------------------------------------------------------------
-- API Execution
--------------------------------------------------------------------------------

function APIModule:RunAPI(apiDef)
	-- For protected APIs, save the metadata without executing
	if apiDef.protected then
		local resultData = {
			success = false,
			results = {},
			duration = 0,
			timestamp = GetTime(),
			params = {},
			status = "protected",
			midnightImpact = apiDef.midnightImpact,
			midnightNote = apiDef.midnightNote,
		}
		self.lastResults[apiDef.key] = resultData
		self:SaveAPIResult(apiDef.key, resultData)
		self:DisplayProtectedError(apiDef)
		return
	end

	if not apiDef.func then
		local resultData = {
			success = false,
			results = {},
			duration = 0,
			timestamp = GetTime(),
			params = {},
			status = "missing_func",
		}
		self.lastResults[apiDef.key] = resultData
		self:SaveAPIResult(apiDef.key, resultData)
		self:DisplayMissingFuncError(apiDef)
		return
	end

	-- Gather and validate parameters
	local params = {}
	local missingParams = {}
	for _, paramDef in ipairs(apiDef.params) do
		local input = self.paramInputs[paramDef.name]
		local rawValue = input and input:GetText() or ""
		local value = rawValue ~= "" and rawValue or paramDef.default

		if paramDef.type == "number" or paramDef.type == "luaIndex" then
			value = tonumber(value)
		elseif paramDef.type == "boolean" then
			value = value == "true" or value == "1"
		end
		
		-- Check for required params that are nil/empty (no default provided)
		if value == nil and paramDef.default == nil then
			table.insert(missingParams, paramDef.name)
		end

		table.insert(params, value)
	end
	
	-- If required parameters are missing, show error instead of running
	if #missingParams > 0 then
		local resultData = {
			success = false,
			results = { "Missing required parameter(s): " .. table.concat(missingParams, ", ") },
			duration = 0,
			timestamp = GetTime(),
			params = params,
			status = "missing_params",
		}
		self.lastResults[apiDef.key] = resultData
		self:SaveAPIResult(apiDef.key, resultData)
		
		local contentFrame = self:GetContentFrame(apiDef.key)
		self:DisplayResults(contentFrame, apiDef, resultData)
		return
	end

	-- Execute API
	local startTime = debugprofilestop()
	local success, results = Mechanic.Utils:SafeCall(apiDef.func, unpack(params))
	local endTime = debugprofilestop()
	local duration = (endTime - startTime)

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
	local contentFrame = self:GetContentFrame(apiDef.key)
	self:DisplayResults(contentFrame, apiDef, resultData)
end

function APIModule:DisplayResults(parent, apiDef, resultData)
	local statusLabel = parent.statusLabel
	local resultsBox = parent.resultsBox

	if not statusLabel or not resultsBox then
		return
	end

	-- Status line
	local timeStr = date("%H:%M:%S")
	local statusText

	if not resultData.success then
		statusText = "|cffff0000ERROR|r"
	else
		local secretCount = Mechanic.Utils:CountSecrets(resultData.results)
		if secretCount > 0 then
			statusText = string.format("|cffaa00ffSECRET|r (%d secret values)", secretCount)
		else
			statusText = "|cff00ff00PASS|r"
		end
	end

	statusLabel:SetText(
		string.format(
			"Last Run: %s | Status: %s | Duration: %.2fms",
			tostring(timeStr or "Unknown"),
			tostring(statusText or "Unknown"),
			resultData.duration or 0
		)
	)

	-- Results display
	local lines = {}
	if not resultData.success then
		local errorMsg = "Unknown Error"
		if resultData.results and resultData.results[1] then
			errorMsg = tostring(resultData.results[1])
		elseif resultData.status == "missing_params" then
			errorMsg = "Missing required parameters"
		elseif resultData.status == "protected" then
			errorMsg = "Protected API - cannot call from addon code"
		end
		table.insert(lines, string.format("Error: %s", errorMsg))
	else
		table.insert(lines, "Returns:")
		for i, retDef in ipairs(apiDef.returns) do
			local value = resultData.results and resultData.results[i]
			local valueStr = Mechanic.Utils:FormatValue(value, { fields = retDef.fields })
			table.insert(
				lines,
				string.format("  %s = %s", tostring(retDef.name or "Unknown"), tostring(valueStr or "nil"))
			)
		end
	end

	resultsBox:SetText(table.concat(lines, "\n"))
end

--------------------------------------------------------------------------------
-- Namespace Batch Testing
--------------------------------------------------------------------------------

function APIModule:RunNamespace(namespace)
	local count = 0
	local totalInNamespace = 0
	local protectedCount = 0
	local results = {}
	for apiKey, apiDef in pairs(API_DEFINITIONS) do
		-- Get ns from registry (definitions don't have it)
		local registryEntry = API_REGISTRY[apiKey]
		local apiNs = registryEntry and registryEntry.ns
		-- Match on registry ns field
		if apiNs == namespace then
			totalInNamespace = totalInNamespace + 1
			if apiDef.protected then
				protectedCount = protectedCount + 1
			else
				-- Run silently without switching content frame
				self:RunAPISilent(apiDef)
				count = count + 1
				table.insert(results, apiDef.name or apiKey)
			end
		end
	end
	
	-- Provide informative message in the UI
	local statusMsg, statusColor
	if count > 0 then
		statusMsg = string.format("Ran %d APIs", count)
		statusColor = {0.3, 1, 0.3} -- Green
	elseif totalInNamespace == 0 then
		statusMsg = "No APIs found"
		statusColor = {1, 0.5, 0.5} -- Red
	else
		statusMsg = string.format("All %d protected", protectedCount)
		statusColor = {1, 0.7, 0.3} -- Orange
	end
	
	-- Update the status label in the current content frame
	if self.selectedAPI then
		local contentFrame = self.contentFrames[self.selectedAPI]
		if contentFrame and contentFrame.nsStatusLabel then
			contentFrame.nsStatusLabel:SetText(statusMsg)
			contentFrame.nsStatusLabel:SetTextColor(unpack(statusColor))
		end
	end
	
	-- Refresh the current content frame if an API is selected
	if self.selectedAPI then
		local apiDef = API_DEFINITIONS[self.selectedAPI]
		if apiDef then
			local contentFrame = self.contentFrames[self.selectedAPI]
			if contentFrame then
				local resultData = self.lastResults[self.selectedAPI]
				if resultData then
					self:DisplayResults(contentFrame, apiDef, resultData)
				end
			end
		end
	end
end

--- Run an API silently (no UI switch, just store results)
function APIModule:RunAPISilent(apiDef)
	if not apiDef or not apiDef.func then
		return
	end
	
	-- Use defaults for parameters
	local params = {}
	for _, paramDef in ipairs(apiDef.params) do
		local value = paramDef.default
		if paramDef.type == "number" then
			value = tonumber(value)
		elseif paramDef.type == "boolean" then
			value = value == "true" or value == "1"
		end
		table.insert(params, value)
	end
	
	-- Execute API
	local startTime = debugprofilestop()
	local success, results = Mechanic.Utils:SafeCall(apiDef.func, unpack(params))
	local endTime = debugprofilestop()
	local duration = (endTime - startTime)
	
	-- Store results (but don't display)
	local resultData = {
		success = success,
		results = results,
		duration = duration,
		timestamp = GetTime(),
		params = params,
	}
	self.lastResults[apiDef.key] = resultData
	self:SaveAPIResult(apiDef.key, resultData)
end

--------------------------------------------------------------------------------
-- Programmatic API Execution (for CLI queue)
--------------------------------------------------------------------------------

--- Execute an API test programmatically (called from Core.lua for queue processing)
--- @param apiDef table The API definition from ns.APIDefinitions
--- @param inputParams table Optional table of { paramName = value } to use instead of defaults
--- @return table resultData The test result
function APIModule:ExecuteAPITest(apiDef, inputParams)
	if not apiDef then
		return { success = false, error = "No API definition provided" }
	end
	
	-- Handle protected APIs
	if apiDef.protected then
		local resultData = {
			success = false,
			results = { "Protected API - cannot call from addon code" },
			duration = 0,
			timestamp = GetTime(),
			params = {},
			status = "protected",
			midnightImpact = apiDef.midnightImpact,
			midnightNote = apiDef.midnightNote,
		}
		self.lastResults[apiDef.key] = resultData
		self:SaveAPIResult(apiDef.key, resultData)
		return resultData
	end
	
	-- Handle missing function reference
	if not apiDef.func then
		local resultData = {
			success = false,
			results = { "Function not available in current client" },
			duration = 0,
			timestamp = GetTime(),
			params = {},
			status = "missing_func",
		}
		self.lastResults[apiDef.key] = resultData
		self:SaveAPIResult(apiDef.key, resultData)
		return resultData
	end
	
	-- Build parameters (use inputParams if provided, otherwise defaults)
	inputParams = inputParams or {}
	local params = {}
	local missingParams = {}
	
	for _, paramDef in ipairs(apiDef.params or {}) do
		local value
		
		-- Check inputParams first (by name)
		if inputParams[paramDef.name] ~= nil then
			value = inputParams[paramDef.name]
		else
			-- Fall back to default
			value = paramDef.default
		end
		
		-- Type conversion
		if value ~= nil then
			if paramDef.type == "number" or paramDef.type == "luaIndex" then
				value = tonumber(value)
			elseif paramDef.type == "boolean" then
				if type(value) == "string" then
					value = value == "true" or value == "1"
				end
			end
		end
		
		-- Check for required params that are nil (no default, no input)
		if value == nil and paramDef.default == nil then
			table.insert(missingParams, paramDef.name)
		end
		
		table.insert(params, value)
	end
	
	-- If required parameters are missing, return error
	if #missingParams > 0 then
		local resultData = {
			success = false,
			results = { "Missing required parameter(s): " .. table.concat(missingParams, ", ") },
			duration = 0,
			timestamp = GetTime(),
			params = params,
			status = "missing_params",
		}
		self.lastResults[apiDef.key] = resultData
		self:SaveAPIResult(apiDef.key, resultData)
		return resultData
	end
	
	-- Execute API
	local startTime = debugprofilestop()
	local success, results = Mechanic.Utils:SafeCall(apiDef.func, unpack(params))
	local endTime = debugprofilestop()
	local duration = (endTime - startTime)
	
	-- Determine status
	local secretCount = success and Mechanic.Utils:CountSecrets(results or {}) or 0
	local status
	if not success then
		status = "error"
	elseif secretCount > 0 then
		status = "secret"
	else
		status = "pass"
	end
	
	-- Build result data
	local resultData = {
		success = success,
		results = results,
		duration = duration,
		timestamp = GetTime(),
		params = params,
		status = status,
		secretCount = secretCount,
	}
	
	self.lastResults[apiDef.key] = resultData
	self:SaveAPIResult(apiDef.key, resultData)
	
	return resultData
end

--------------------------------------------------------------------------------
-- Copy Report
--------------------------------------------------------------------------------

function APIModule:CopyAPIReport(apiDef)
	local lines = {}

	table.insert(lines, string.format("=== Mechanic API Report: %s ===", tostring(apiDef.funcPath or "Unknown")))
	local header = Mechanic:GetEnvironmentHeader()
	if header then
		table.insert(lines, header)
	end
	table.insert(lines, "---")

	table.insert(lines, string.format("API: %s", tostring(apiDef.funcPath or "Unknown")))
	table.insert(lines, string.format("Category: %s", tostring(apiDef.category or "Unknown")))
	table.insert(lines, string.format("Midnight Impact: %s", tostring(apiDef.midnightImpact or "Unknown")))
	if apiDef.midnightNote then
		table.insert(lines, string.format("Note: %s", tostring(apiDef.midnightNote)))
	end
	table.insert(lines, "")

	local resultData = self.lastResults[apiDef.key]
	if resultData then
		table.insert(lines, "Last Test:")
		table.insert(lines, string.format("  Duration: %.2fms", resultData.duration or 0))
		table.insert(lines, string.format("  Status: %s", (resultData.success and "SUCCESS" or "ERROR")))
		table.insert(lines, string.format("  Secret Values: %d", Mechanic.Utils:CountSecrets(resultData.results or {})))
		table.insert(lines, "")
		table.insert(lines, "Results:")

		if not resultData.success then
			table.insert(lines, string.format("  Error: %s", tostring(resultData.results[1] or "Unknown Error")))
		else
			for i, retDef in ipairs(apiDef.returns) do
				local value = resultData.results[i]
				local valueStr = Mechanic.Utils:FormatValue(value, { fields = retDef.fields, plain = true })
				table.insert(
					lines,
					string.format("  %s = %s", tostring(retDef.name or "Unknown"), tostring(valueStr or "nil"))
				)
			end
		end
	else
		table.insert(lines, "Not yet tested.")
	end

	local notes = Mechanic.db.profile.apiTests
		and Mechanic.db.profile.apiTests[apiDef.key]
		and Mechanic.db.profile.apiTests[apiDef.key].notes
	if notes and notes ~= "" then
		table.insert(lines, "")
		table.insert(lines, "Notes:")
		table.insert(lines, notes)
	end

	Mechanic.Utils:ShowExportDialog("API Report", table.concat(lines, "\n"))
end

function APIModule:GetCategoryReport(namespace)
	local lines = {}
	local nsName = ns.APICategoryLookup[namespace] and ns.APICategoryLookup[namespace].name or namespace

	table.insert(lines, string.format("=== Mechanic API Report: %s ===", tostring(nsName or "Unknown")))
	local header = Mechanic:GetEnvironmentHeader()
	if header then
		table.insert(lines, header)
	end
	table.insert(lines, "---")

	local passCount, secretCount, errorCount, untestedCount = 0, 0, 0, 0
	local apis = {}
	for apiKey, apiDef in pairs(API_DEFINITIONS) do
		if apiDef.category == namespace then
			table.insert(apis, apiDef)
		end
	end
	table.sort(apis, function(a, b)
		return (a.name or a.funcPath or "") < (b.name or b.funcPath or "")
	end)

	for _, apiDef in ipairs(apis) do
		local resultData = self.lastResults[apiDef.key]
		local status
		if not resultData then
			status = "----"
			untestedCount = untestedCount + 1
		elseif not resultData.success then
			status = "FAIL"
			errorCount = errorCount + 1
		elseif Mechanic.Utils:CountSecrets(resultData.results or {}) > 0 then
			status = "SCRT"
			secretCount = secretCount + 1
		else
			status = "PASS"
			passCount = passCount + 1
		end
		table.insert(lines, string.format("[%s] %s", status, tostring(apiDef.funcPath or "Unknown")))
	end

	table.insert(lines, "---")
	table.insert(
		lines,
		string.format(
			"Summary: %d PASS, %d SECRET, %d FAIL, %d untested",
			passCount or 0,
			secretCount or 0,
			errorCount or 0,
			untestedCount or 0
		)
	)

	return table.concat(lines, "\n")
end

--------------------------------------------------------------------------------
-- Persistence
--------------------------------------------------------------------------------

--- Serialize a value for SavedVariables (handles functions, userdata, etc.)
local function SerializeForSV(value, depth)
	depth = depth or 0
	if depth > 10 then return "<max depth>" end
	
	local vtype = type(value)
	if vtype == "nil" then
		return nil
	elseif vtype == "boolean" or vtype == "number" then
		return value
	elseif vtype == "string" then
		-- Truncate very long strings
		if #value > 1000 then
			return value:sub(1, 1000) .. "...[truncated]"
		end
		return value
	elseif vtype == "table" then
		local result = {}
		local count = 0
		for k, v in pairs(value) do
			count = count + 1
			if count > 50 then
				result["_truncated"] = true
				break
			end
			local keyType = type(k)
			if keyType == "string" or keyType == "number" then
				result[k] = SerializeForSV(v, depth + 1)
			end
		end
		return result
	elseif vtype == "function" then
		return "<function>"
	elseif vtype == "userdata" then
		return "<userdata>"
	else
		return tostring(value)
	end
end

function APIModule:SaveAPIResult(apiKey, resultData)
	Mechanic.db.profile.apiTests = Mechanic.db.profile.apiTests or {}
	Mechanic.db.profile.apiTests[apiKey] = Mechanic.db.profile.apiTests[apiKey] or {}

	local saved = Mechanic.db.profile.apiTests[apiKey]
	local secretCount = Mechanic.Utils:CountSecrets(resultData.results or {})
	
	saved.lastRun = resultData.timestamp
	saved.lastRunTime = date("%Y-%m-%d %H:%M:%S")
	saved.duration = resultData.duration
	saved.success = resultData.success
	
	-- Handle explicit status (protected, missing_func) or derive from results
	if resultData.status then
		saved.status = resultData.status
	else
		saved.status = resultData.success
				and (secretCount > 0 and "secret" or "pass")
			or "error"
	end
	
	saved.secretCount = secretCount
	saved.lastParams = resultData.params
	
	-- Store Midnight metadata for protected APIs
	if resultData.midnightImpact then
		saved.midnightImpact = resultData.midnightImpact
	end
	if resultData.midnightNote then
		saved.midnightNote = resultData.midnightNote
	end
	
	-- Store serialized results (safe for SavedVariables)
	if resultData.results then
		saved.results = SerializeForSV(resultData.results)
	end
	
	-- Store API definition info for agent-friendly output
	local apiDef = ns.APIDefinitions and ns.APIDefinitions[apiKey]
	if apiDef then
		-- Build signature string: (param1: type, param2: type) -> return1: type, return2: type
		local paramParts = {}
		for _, p in ipairs(apiDef.params or {}) do
			local pStr = p.name .. ": " .. (p.type or "any")
			if p.default ~= nil then
				pStr = pStr .. " = " .. tostring(p.default)
			end
			table.insert(paramParts, pStr)
		end
		
		local returnParts = {}
		for _, r in ipairs(apiDef.returns or {}) do
			local rStr = r.name .. ": " .. (r.type or "any")
			if r.nilable then
				rStr = rStr .. "?"
			end
			table.insert(returnParts, rStr)
		end
		
		local signature = "(" .. table.concat(paramParts, ", ") .. ")"
		if #returnParts > 0 then
			signature = signature .. " -> " .. table.concat(returnParts, ", ")
		end
		
		saved.signature = signature
		saved.params_def = apiDef.params  -- Full param definitions
		saved.returns_def = apiDef.returns  -- Full return definitions
		saved.funcPath = apiDef.funcPath or apiKey
		saved.category = apiDef.category
	end
	
	-- Cap total stored results to prevent SV bloat
	local count = 0
	for _ in pairs(Mechanic.db.profile.apiTests) do
		count = count + 1
	end
	if count > 200 then
		-- Remove oldest entries
		local oldest = nil
		local oldestTime = math.huge
		for key, data in pairs(Mechanic.db.profile.apiTests) do
			if data.lastRun and data.lastRun < oldestTime then
				oldestTime = data.lastRun
				oldest = key
			end
		end
		if oldest then
			Mechanic.db.profile.apiTests[oldest] = nil
		end
	end
end

function APIModule:SaveNotes(apiKey, notes)
	Mechanic.db.profile.apiTests = Mechanic.db.profile.apiTests or {}
	Mechanic.db.profile.apiTests[apiKey] = Mechanic.db.profile.apiTests[apiKey] or {}
	Mechanic.db.profile.apiTests[apiKey].notes = notes
end

--- Get all API test results for CLI/agent export
--- @return table Summary of all API test results
function APIModule:GetAPIResults()
	local results = {
		timestamp = date("%Y-%m-%d %H:%M:%S"),
		gameVersion = GetBuildInfo(),
		totalAPIs = 0,
		testedAPIs = 0,
		summary = {
			pass = 0,
			secret = 0,
			error = 0,
		},
		tests = {},
	}
	
	-- Count total APIs from registry
	for _ in pairs(API_REGISTRY) do
		results.totalAPIs = results.totalAPIs + 1
	end
	
	-- Collect test results
	local apiTests = Mechanic.db.profile.apiTests or {}
	for apiKey, data in pairs(apiTests) do
		if data.lastRun then
			results.testedAPIs = results.testedAPIs + 1
			
			local status = data.status or "unknown"
			if results.summary[status] then
				results.summary[status] = results.summary[status] + 1
			end
			
			-- Get namespace from registry
			local registryEntry = API_REGISTRY[apiKey]
			local namespace = registryEntry and registryEntry.ns or "Unknown"
			
			results.tests[apiKey] = {
				namespace = namespace,
				status = status,
				success = data.success,
				duration = data.duration,
				secretCount = data.secretCount,
				lastRunTime = data.lastRunTime,
				params = data.lastParams,
				results = data.results,
			}
		end
	end
	
	return results
end

--- Clear all stored API test results
function APIModule:ClearAPIResults()
	Mechanic.db.profile.apiTests = {}
	Mechanic:Print("API test results cleared.")
end

--------------------------------------------------------------------------------
-- Error Handling
--------------------------------------------------------------------------------

function APIModule:DisplayProtectedError(apiDef)
	local contentFrame = self:GetContentFrame(apiDef.key)
	if contentFrame and contentFrame.statusLabel then
		contentFrame.statusLabel:SetText(
			string.format("|cffff0000%s|r - %s", L["PROTECTED"] or "PROTECTED", L["Cannot call from addon code"] or "Cannot call from addon code")
		)
	end
	if contentFrame and contentFrame.resultsBox then
		contentFrame.resultsBox:SetText(
			L["This API is protected and cannot be called from addon code in Midnight.\n\nConsider using the reskin strategy with Blizzard frames."]
				or "This API is protected and cannot be called from addon code in Midnight.\n\nConsider using the reskin strategy with Blizzard frames."
		)
	end
end

function APIModule:DisplayMissingFuncError(apiDef)
	local contentFrame = self:GetContentFrame(apiDef.key)
	if contentFrame and contentFrame.statusLabel then
		contentFrame.statusLabel:SetText(string.format("|cffff8800%s|r - %s", L["MISSING"] or "MISSING", L["Function not found"] or "Function not found"))
	end
	if contentFrame and contentFrame.resultsBox then
		contentFrame.resultsBox:SetText(
			string.format(
				L["Function not available: %s\n\nThis may be a newer API not yet available in this WoW version."]
					or "Function not available: %s\n\nThis may be a newer API not yet available in this WoW version.",
				apiDef.funcPath or apiDef.key
			)
		)
	end
end

--------------------------------------------------------------------------------
-- Tab Lifecycle
--------------------------------------------------------------------------------

function APIModule:OnShow()
	-- Refresh filters if needed
	if self.virtualList then
		self:ApplyFilters()
	end

	-- Show selected content
	if self.selectedAPI then
		local contentFrame = self:GetContentFrame(self.selectedAPI)
		local apiDef = API_DEFINITIONS[self.selectedAPI]
		if contentFrame and apiDef then
			self:BuildAPIPanel(contentFrame, apiDef)
		end
	end
end

function APIModule:OnHide() end

function APIModule:Export()
	local namespace = self.selectedAPI and API_DEFINITIONS[self.selectedAPI] and API_DEFINITIONS[self.selectedAPI].category
	local navName = namespace or "All"
	local title = string.format("API : %s : Export", navName)

	local text = self:GetCopyText(Mechanic.db.profile.includeEnvHeader)
	Mechanic.Utils:ShowExportDialog(title, text)
end

function APIModule:GetCopyText(includeHeader)
	if self.selectedAPI then
		local apiDef = API_DEFINITIONS[self.selectedAPI]
		if apiDef then
			return self:GetCategoryReport(apiDef.category)
		end
	end
	return L["No API selected."] or "No API selected."
end

