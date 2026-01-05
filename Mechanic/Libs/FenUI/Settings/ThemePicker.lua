--------------------------------------------------------------------------------
-- FenUI v2 - Theme Picker
--
-- Settings integration for theme selection:
-- - AceConfig-compatible option generator
-- - Standalone theme picker widget
--------------------------------------------------------------------------------

local FenUI = FenUI

--------------------------------------------------------------------------------
-- AceConfig Integration
--------------------------------------------------------------------------------

--- Create an AceConfig-compatible option table for theme selection
---@param config table Configuration
---@return table aceConfigOption
function FenUI:CreateThemeOption(config)
	config = config or {}

	local option = {
		type = "select",
		name = config.name or "UI Theme",
		desc = config.desc or "Select the visual theme for FenUI components",
		order = config.order or 1,
		values = function()
			local values = {}
			for _, themeName in ipairs(FenUI:GetThemeList()) do
				local theme = FenUI:GetTheme(themeName)
				values[themeName] = theme and theme.name or themeName
			end
			return values
		end,
		get = config.get or function()
			return FenUI:GetGlobalTheme()
		end,
		set = config.set or function(info, value)
			FenUI:SetGlobalTheme(value)
		end,
	}

	return option
end

--- Create a complete AceConfig options group for FenUI settings
---@param config table Configuration
---@return table aceConfigGroup
function FenUI:CreateSettingsGroup(config)
	config = config or {}

	local group = {
		type = "group",
		name = config.name or "FenUI",
		order = config.order or 100,
		args = {
			themeHeader = {
				type = "header",
				name = "Theme Settings",
				order = 1,
			},
			theme = FenUI:CreateThemeOption({
				order = 2,
				get = config.themeGet,
				set = config.themeSet,
			}),
			themeDesc = {
				type = "description",
				name = function()
					local theme = FenUI:GetTheme()
					return theme and theme.description or ""
				end,
				order = 3,
			},
			debugHeader = {
				type = "header",
				name = "Debug",
				order = 10,
			},
			debugMode = {
				type = "toggle",
				name = "Debug Mode",
				desc = "Enable debug output in chat",
				order = 11,
				get = function()
					return FenUI.debugMode
				end,
				set = function(info, value)
					FenUI:SetDebugMode(value)
				end,
			},
			validationWarnings = {
				type = "toggle",
				name = "Validation Warnings",
				desc = "Show warnings if Blizzard dependencies change",
				order = 12,
				get = function()
					return FenUIDB and FenUIDB.showValidationWarnings
				end,
				set = function(info, value)
					if FenUIDB then
						FenUIDB.showValidationWarnings = value
					end
				end,
			},
			validate = {
				type = "execute",
				name = "Run Validation",
				desc = "Check Blizzard API dependencies",
				order = 13,
				func = function()
					if FenUI.Validation then
						local results = FenUI.Validation:Run(false)
						FenUI.Validation:PrintReport(results)
					end
				end,
			},
		},
	}

	return group
end

--------------------------------------------------------------------------------
-- Standalone Theme Picker Widget
--------------------------------------------------------------------------------

local ThemePickerMixin = {}

function ThemePickerMixin:Init(config)
	self.config = config or {}
	self.savedVars = config.savedVars
	self.savedVarKey = config.savedVarKey or "theme"
	self.onChange = config.onChange

	self:Refresh()
end

function ThemePickerMixin:Refresh()
	-- Clear existing buttons
	if self.buttons then
		for _, btn in pairs(self.buttons) do
			btn:Hide()
		end
	end
	self.buttons = {}

	-- Create theme buttons
	local themes = FenUI:GetThemeList()
	local currentTheme = self:GetCurrentTheme()

	local yOffset = 0
	for _, themeName in ipairs(themes) do
		local theme = FenUI:GetTheme(themeName)
		local btn = self:CreateThemeButton(themeName, theme, yOffset)
		btn:SetSelected(themeName == currentTheme)
		self.buttons[themeName] = btn
		yOffset = yOffset - 28
	end

	-- Update container height
	self:SetHeight(math.abs(yOffset) + 10)
end

function ThemePickerMixin:CreateThemeButton(themeName, theme, yOffset)
	local btn = CreateFrame("Button", nil, self)
	btn:SetHeight(24)
	btn:SetPoint("TOPLEFT", 0, yOffset)
	btn:SetPoint("TOPRIGHT", 0, yOffset)

	btn.themeName = themeName

	-- Background
	btn.bg = btn:CreateTexture(nil, "BACKGROUND")
	btn.bg:SetAllPoints()
	btn.bg:SetColorTexture(0, 0, 0, 0)

	-- Selection indicator
	btn.selected = btn:CreateTexture(nil, "BORDER")
	btn.selected:SetPoint("LEFT", 4, 0)
	btn.selected:SetSize(4, 16)
	btn.selected:SetColorTexture(FenUI:GetColor("interactiveSelected"))
	btn.selected:Hide()

	-- Text
	btn.text = btn:CreateFontString(nil, "OVERLAY")
	btn.text:SetFontObject(FenUI:GetFont("fontBody"))
	btn.text:SetPoint("LEFT", 14, 0)
	btn.text:SetText(theme and theme.name or themeName)
	local r, g, b = FenUI:GetColor("textDefault")
	btn.text:SetTextColor(r, g, b)

	-- Description
	if theme and theme.description then
		btn.desc = btn:CreateFontString(nil, "OVERLAY")
		btn.desc:SetFontObject(FenUI:GetFont("fontSmall"))
		btn.desc:SetPoint("LEFT", btn.text, "RIGHT", 8, 0)
		btn.desc:SetText("- " .. theme.description)
		local mr, mg, mb = FenUI:GetColor("textMuted")
		btn.desc:SetTextColor(mr, mg, mb)
	end

	function btn:SetSelected(selected)
		self.isSelected = selected
		self.selected:SetShown(selected)
		if selected then
			local sr, sg, sb = FenUI:GetColor("interactiveSelected")
			self.text:SetTextColor(sr, sg, sb)
		else
			local tr, tg, tb = FenUI:GetColor("textDefault")
			self.text:SetTextColor(tr, tg, tb)
		end
	end

	-- Hover
	btn:SetScript("OnEnter", function(self)
		self.bg:SetColorTexture(FenUI:GetColor("surfaceElevated"))
		if not self.isSelected then
			local hr, hg, hb = FenUI:GetColor("interactiveHover")
			self.text:SetTextColor(hr, hg, hb)
		end
	end)

	btn:SetScript("OnLeave", function(self)
		self.bg:SetColorTexture(0, 0, 0, 0)
		if not self.isSelected then
			local tr, tg, tb = FenUI:GetColor("textDefault")
			self.text:SetTextColor(tr, tg, tb)
		end
	end)

	-- Click
	btn:SetScript("OnClick", function(self)
		self:GetParent():SelectTheme(self.themeName)
	end)

	return btn
end

function ThemePickerMixin:GetCurrentTheme()
	if self.savedVars and self.savedVarKey then
		return self.savedVars[self.savedVarKey] or FenUI:GetGlobalTheme()
	end
	return FenUI:GetGlobalTheme()
end

function ThemePickerMixin:SelectTheme(themeName)
	-- Update all buttons
	for name, btn in pairs(self.buttons) do
		btn:SetSelected(name == themeName)
	end

	-- Save to saved vars
	if self.savedVars and self.savedVarKey then
		self.savedVars[self.savedVarKey] = themeName
	end

	-- Set global theme
	FenUI:SetGlobalTheme(themeName)

	-- Fire callback
	if self.onChange then
		self.onChange(themeName)
	end
end

--- Create a standalone theme picker widget
---@param parent Frame Parent frame
---@param savedVars table SavedVariables table to store selection
---@param savedVarKey string Key in savedVars for the theme
---@param onChange function Callback when theme changes
---@return Frame themePicker
function FenUI:CreateThemePicker(parent, savedVars, savedVarKey, onChange)
	local picker = CreateFrame("Frame", nil, parent)
	FenUI.Mixin(picker, ThemePickerMixin)

	picker:SetWidth(parent and parent:GetWidth() or 200)

	picker:Init({
		savedVars = savedVars,
		savedVarKey = savedVarKey,
		onChange = onChange,
	})

	return picker
end

--------------------------------------------------------------------------------
-- Export
--------------------------------------------------------------------------------

FenUI.ThemePickerMixin = ThemePickerMixin
