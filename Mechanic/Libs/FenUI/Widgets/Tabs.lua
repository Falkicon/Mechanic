--------------------------------------------------------------------------------
-- FenUI v2 - Tabs Widget
--
-- Tab group creation with:
-- - Config object API (simple)
-- - Builder pattern API (fluent)
-- - Lifecycle hooks (onChange, onTabCreate, onTabFocus)
-- - Support for disabled states and positioning
--------------------------------------------------------------------------------

local FenUI = FenUI

--------------------------------------------------------------------------------
-- Tab Button Mixin
--------------------------------------------------------------------------------

local TabButtonMixin = {}

function TabButtonMixin:SetSelected(selected)
	self.isSelected = selected
	self:UpdateVisual()
end

function TabButtonMixin:GetSelected()
	return self.isSelected
end

function TabButtonMixin:SetDisabled(disabled)
	self.isDisabled = disabled
	if disabled then
		self:Disable()
	else
		self:Enable()
	end
	self:UpdateVisual()
end

function TabButtonMixin:GetDisabled()
	return self.isDisabled
end

function TabButtonMixin:UpdateVisual(state)
	-- Determine state if not explicitly provided
	if not state then
		if self.isDisabled then
			state = "disabled"
		elseif self.isSelected then
			state = "selected"
		elseif self.isHovered then
			state = "hover"
		else
			state = "normal"
		end
	end

	-- Quiet at rest, gold only for the selected tab (label + underline)
	local textColor, bgToken, showHighlight

	if state == "disabled" then
		textColor, bgToken, showHighlight = "textDisabled", nil, false
	elseif state == "selected" then
		textColor, bgToken, showHighlight = "interactiveSelected", nil, true
	elseif state == "hover" then
		textColor, bgToken, showHighlight = "textStrong", "surfaceRowHover", false
	else -- normal
		textColor, bgToken, showHighlight = "textMuted", nil, false
	end

	-- Apply text color
	local r, g, b = FenUI:GetColorRGB(textColor)
	self.text:SetTextColor(r, g, b)

	-- Apply background (translucent wash on hover only)
	if self.bg then
		if bgToken then
			self.bg:SetColorTexture(FenUI:GetColor(bgToken))
			self.bg:Show()
		else
			self.bg:Hide()
		end
	end

	-- Show/hide underline highlight
	if self.highlight then
		self.highlight:SetShown(showHighlight)
	end

	-- Update badge visual
	if self.badge then
		if self.badge:GetObjectType() == "FontString" then
			local token = self.isDisabled and "interactiveDisabled" or (self.badgeColorToken or "feedbackSuccess")
			self.badge:SetTextColor(FenUI:GetColorRGB(token))
		else
			-- Icon badges keep their own colors unless a tint is requested
			local token = self.isDisabled and "imageTintMuted" or (self.badgeColorToken or "imageTintDefault")
			self.badge:SetVertexColor(FenUI:GetColorRGB(token))
		end
	end
end

function TabButtonMixin:SetTabText(text)
	self.text:SetText(text)
	self:UpdateWidth()
end

function TabButtonMixin:UpdateWidth()
	local textWidth = self.text:GetStringWidth()
	local badgeWidth = 0
	if self.badge and self.badge:IsShown() then
		local gap = FenUI:GetSpacing("spacingTight")
		if self.badge.GetStringWidth then
			badgeWidth = self.badge:GetStringWidth() + gap
		else
			badgeWidth = self.badge:GetWidth() + gap
		end
	end
	-- Center text + badge as one unit so the badge never spills past the edge
	self.text:ClearAllPoints()
	self.text:SetPoint("CENTER", -math.floor(badgeWidth / 2), 0)
	-- Whole pixels keep the underline and neighbouring tabs crisp
	self:SetWidth(math.ceil(textWidth + badgeWidth + FenUI:GetSpacing("reg") * 2))
end

function TabButtonMixin:SetBadge(content, colorToken)
	self.badgeColorToken = colorToken

	local isTexture = false
	if
		type(content) == "string"
		and (content:find("^atlas:") or content:find("^Interface") or content:find("%.tga$") or content:find("%.blp$"))
	then
		isTexture = true
	end

	-- Clean up existing badge if type mismatch
	if self.badge then
		local existingIsTexture = self.badge:GetObjectType() == "Texture"
		if existingIsTexture ~= isTexture then
			self.badge:Hide()
			self.badge = nil
		end
	end

	if not self.badge then
		if isTexture then
			self.badge = self:CreateTexture(nil, "OVERLAY")
			self.badge:SetSize(12, 12)
			self.badge:SetPoint("LEFT", self.text, "RIGHT", FenUI:GetSpacing("spacingTight"), 0)
		else
			self.badge = self:CreateFontString(nil, "OVERLAY")
			self.badge:SetFontObject(FenUI:GetFont("fontSmall"))
			self.badge:SetPoint("LEFT", self.text, "RIGHT", FenUI:GetSpacing("spacingTight"), 0)
		end
	end

	if content then
		if isTexture then
			local texturePath = content
			if texturePath:find("^atlas:") then
				self.badge:SetAtlas(texturePath:sub(7))
			else
				self.badge:SetTexture(texturePath)
			end
		else
			self.badge:SetText(content)
		end
		self.badge:Show()
	else
		self.badge:Hide()
	end

	self:UpdateVisual()
	self:UpdateWidth()
end

function TabButtonMixin:GetBadge()
	-- Texture badges have no text
	if self.badge and self.badge:GetObjectType() == "FontString" then
		return self.badge:GetText()
	end
end

--------------------------------------------------------------------------------
-- Tab Group Mixin
--------------------------------------------------------------------------------

local TabGroupMixin = {}

function TabGroupMixin:Init(config)
	self.config = config or {}
	self.tabs = {}
	self.tabOrder = {}
	self.selectedKey = nil
	self.hooks = {
		onChange = config.onChange,
		onTabCreate = config.onTabCreate,
		onTabFocus = config.onTabFocus,
	}

	-- Create tabs from config
	if config.tabs then
		for _, tabDef in ipairs(config.tabs) do
			local key = tabDef.key or tabDef.id
			local tab = self:AddTab(key, tabDef.text, tabDef.icon)
			if tabDef.disabled then
				tab:SetDisabled(true)
			end
		end
	end

	-- Select first tab by default
	if #self.tabOrder > 0 and not self.selectedKey then
		-- Find first non-disabled tab
		for _, key in ipairs(self.tabOrder) do
			if not self.tabs[key].isDisabled then
				self:Select(key)
				break
			end
		end
	end
end

function TabGroupMixin:AddTab(key, text, icon)
	if self.tabs[key] then
		FenUI:Debug("Tab already exists:", key)
		return self.tabs[key]
	end

	local tab = CreateFrame("Button", nil, self)
	FenUI.Mixin(tab, TabButtonMixin)

	tab.key = key

	-- Create background (for hover/selected states)
	tab.bg = tab:CreateTexture(nil, "BACKGROUND")
	tab.bg:SetAllPoints()
	tab.bg:Hide() -- Hidden by default (normal state has no background)

	-- Create text
	tab.text = tab:CreateFontString(nil, "OVERLAY")
	tab.text:SetFontObject(FenUI:GetFont("fontButton"))
	tab.text:SetPoint("CENTER", 0, 0)

	-- Create underline highlight (for selected state)
	tab.highlight = tab:CreateTexture(nil, "ARTWORK")
	local hr, hg, hb = FenUI:GetColorRGB("interactiveSelected")
	tab.highlight:SetColorTexture(hr, hg, hb, 1)
	tab.highlight:SetHeight(FenUI:GetPixelSize(tab, 2))

	-- Position highlight based on group position
	if self.config.position == "bottom" then
		tab.highlight:SetPoint("TOPLEFT", 0, 0)
		tab.highlight:SetPoint("TOPRIGHT", 0, 0)
	else
		tab.highlight:SetPoint("BOTTOMLEFT", 0, 0)
		tab.highlight:SetPoint("BOTTOMRIGHT", 0, 0)
	end
	tab.highlight:Hide()

	-- Scripts
	tab:SetScript("OnClick", function()
		self:Select(key)
	end)

	tab:SetScript("OnEnter", function(btn)
		if not btn.isDisabled and not btn.isSelected then
			btn.isHovered = true
			btn:UpdateVisual("hover")
		end
	end)

	tab:SetScript("OnLeave", function(btn)
		btn.isHovered = false
		btn:UpdateVisual()
	end)

	-- Focus support
	tab:SetScript("OnReceiveDrag", function()
		self:SetFocus(key)
	end)

	-- Set text and size
	tab:SetTabText(text)
	tab:SetHeight(self.config.height or FenUI:GetLayout("tabHeight"))

	-- Store
	self.tabs[key] = tab
	table.insert(self.tabOrder, key)

	-- Update layout
	self:RepositionTabs()

	-- Fire hook
	if self.hooks.onTabCreate then
		self.hooks.onTabCreate(tab, key)
	end

	return tab
end

function TabGroupMixin:SetTabDisabled(key, disabled)
	local tab = self.tabs[key]
	if tab then
		tab:SetDisabled(disabled)
		if disabled and self.selectedKey == key then
			-- Move selection to the first enabled tab so visuals, GetSelected()
			-- and onChange stay in agreement
			tab:SetSelected(false)
			for _, k in ipairs(self.tabOrder) do
				if not self.tabs[k].isDisabled then
					self:Select(k) -- fires onChange(k, key)
					break
				end
			end
			if self.selectedKey == key then
				-- No enabled tab left
				self.selectedKey = nil
				if self.hooks.onChange then
					self.hooks.onChange(nil, key)
				end
			end
		end
	end
end

function TabGroupMixin:SetTabVisible(key, visible)
	local tab = self.tabs[key]
	if tab then
		tab:SetShown(visible)
		self:RepositionTabs()
	end
end

function TabGroupMixin:SetTabBadge(key, content, colorToken)
	local tab = self.tabs[key]
	if tab then
		tab:SetBadge(content, colorToken)
		self:RepositionTabs()
	end
end

function TabGroupMixin:RepositionTabs()
	local prevTab = nil
	local spacing = FenUI:GetSpacing("spacingElement")

	for _, key in ipairs(self.tabOrder) do
		local tab = self.tabs[key]
		if tab:IsShown() then
			tab:ClearAllPoints()
			if prevTab then
				tab:SetPoint("LEFT", prevTab, "RIGHT", spacing, 0)
			else
				tab:SetPoint("LEFT", 0, 0)
			end
			prevTab = tab
		end
	end
end

function TabGroupMixin:Select(key)
	local tab = self.tabs[key]
	if not tab or tab.isDisabled then
		return
	end

	local previousKey = self.selectedKey
	self.selectedKey = key

	-- Update all tabs
	for k, t in pairs(self.tabs) do
		t:SetSelected(k == key)
	end

	-- Fire callback
	if self.hooks.onChange and key ~= previousKey then
		self.hooks.onChange(key, previousKey)
	end
end

-- Alias for backward compatibility and idiomatic naming
function TabGroupMixin:SelectTab(key)
	self:Select(key)
end

function TabGroupMixin:SetFocus(key)
	for k, t in pairs(self.tabs) do
		t.isFocused = (k == key)
		t:UpdateVisual()
	end
	if self.hooks.onTabFocus then
		self.hooks.onTabFocus(key)
	end
end

function TabGroupMixin:GetSelected()
	return self.selectedKey
end

function TabGroupMixin:GetTab(key)
	return self.tabs[key]
end

function TabGroupMixin:GetTabs()
	return self.tabs
end

--------------------------------------------------------------------------------
-- Factory
--------------------------------------------------------------------------------

--- Create a tab group
---@param parent Frame Parent frame
---@param config table Configuration { tabs, position, height, onChange, etc }
---@return Frame tabGroup
function FenUI:CreateTabGroup(parent, config)
	config = config or {}

	local tabGroup = CreateFrame("Frame", config.name, parent)
	FenUI.Mixin(tabGroup, TabGroupMixin)

	tabGroup:SetHeight(config.height or FenUI:GetLayout("tabHeight"))
	if config.width then
		tabGroup:SetWidth(config.width)
	end

	-- Hairline baseline under (or over, for bottom tabs) the whole strip; the
	-- selected tab's underline sits on top of it
	tabGroup.baseline = tabGroup:CreateTexture(nil, "BACKGROUND")
	tabGroup.baseline:SetColorTexture(FenUI:GetColor("borderSubtle"))
	tabGroup.baseline:SetHeight(FenUI:GetPixelSize(tabGroup))
	local edge = config.position == "bottom" and "TOP" or "BOTTOM"
	tabGroup.baseline:SetPoint(edge .. "LEFT")
	tabGroup.baseline:SetPoint(edge .. "RIGHT")
	if config.showBaseline == false then
		tabGroup.baseline:Hide()
	end

	tabGroup:Init(config)

	return tabGroup
end

--------------------------------------------------------------------------------
-- Builder
--------------------------------------------------------------------------------

local TabGroupBuilder = {}
TabGroupBuilder.__index = TabGroupBuilder

function TabGroupBuilder:new(parent)
	local builder = setmetatable({}, TabGroupBuilder)
	builder._parent = parent
	builder._config = { tabs = {} }
	return builder
end

function TabGroupBuilder:name(name)
	self._config.name = name
	return self
end

function TabGroupBuilder:position(pos)
	self._config.position = pos
	return self
end

function TabGroupBuilder:height(h)
	self._config.height = h
	return self
end

function TabGroupBuilder:tab(key, text, icon, disabled)
	table.insert(self._config.tabs, { key = key, text = text, icon = icon, disabled = disabled })
	return self
end

function TabGroupBuilder:onChange(callback)
	self._config.onChange = callback
	return self
end

function TabGroupBuilder:build()
	return FenUI:CreateTabGroup(self._parent, self._config)
end

function FenUI.TabGroup(parent)
	return TabGroupBuilder:new(parent)
end

--------------------------------------------------------------------------------
-- Export Mixins
--------------------------------------------------------------------------------

FenUI.TabButtonMixin = TabButtonMixin
FenUI.TabGroupMixin = TabGroupMixin
