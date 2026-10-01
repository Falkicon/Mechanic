-- UI/MainFrame.lua
-- !Mechanic - Main UI Panel

local ADDON_NAME, ns = ...
local Mechanic = LibStub("AceAddon-3.0"):GetAddon(ADDON_NAME)
local L = LibStub("AceLocale-3.0"):GetLocale(ADDON_NAME, true)
local ICON_PATH = [[Interface\AddOns\Mechanic\Assets\Icons\]]

-- Tab key -> module table name on Mechanic and the method that builds its frame
local TAB_MODULES = {
	console = { module = "Console", initialize = "InitializeConsole" },
	errors = { module = "Errors", initialize = "InitializeErrors" },
	tests = { module = "Tests", initialize = "InitializeTests" },
	tools = { module = "Tools", initialize = "InitializeTools" },
	api = { module = "API", initialize = "InitializeAPI" },
	inspect = { module = "Inspect", initialize = "InitializeInspect" },
	perf = { module = "Perf", initialize = "InitializePerformance" },
}

-- Modules that own a tab and therefore receive OnShow/OnHide from the main frame
local LIFECYCLE_MODULES = { "Console", "Errors", "Tests", "Tools", "API", "Inspect", "Perf" }

function Mechanic:CreateMainFrame()
	if self.frame then
		return
	end

	self.initializing = true -- Prevent OnTabChanged from saving to DB during setup

	local frame = FenUI:CreatePanel(UIParent, {
		name = "MechanicMainFrame",
		title = L["Mechanic: Developer tools for World of Warcraft"],
		width = self.db.profile.size.width,
		height = self.db.profile.size.height,
		movable = true,
		resizable = true,
		closable = true,
	})

	-- mechanic:ignore-combat (dev tool panel must be accessible during combat for debugging)
	frame:SetFrameStrata("HIGH")
	self.frame = frame

	-- Save position
	frame:SetPoint(self.db.profile.position.point, self.db.profile.position.x, self.db.profile.position.y)
	frame:SetScript("OnDragStop", function(s)
		s:StopMovingOrSizing()
		local point, _, _, x, y = s:GetPoint()
		self.db.profile.position.point = point
		self.db.profile.position.x = x
		self.db.profile.position.y = y
	end)

	-- Save size
	frame:SetScript("OnSizeChanged", function(s, w, h)
		if w > 0 and h > 0 then
			self.db.profile.size.width = w
			self.db.profile.size.height = h
		end
	end)

	-- Status bar with environment info
	local statusBar = FenUI:CreateStatusRow(frame.safeZone, {
		height = 24,
		items = self:GetStatusItems(),
	})
	statusBar:SetPoint("BOTTOMLEFT", 0, 0)
	statusBar:SetPoint("BOTTOMRIGHT", 0, 0)
	frame.statusBar = statusBar

	-- Raised footer: header surface plus a hairline, mirroring the title strip
	local statusBg = statusBar:CreateTexture(nil, "BACKGROUND", nil, -7)
	statusBg:SetAllPoints()
	statusBg:SetColorTexture(FenUI:GetColor("surfaceHeader"))
	local statusDivider = statusBar:CreateTexture(nil, "BORDER")
	statusDivider:SetPoint("TOPLEFT")
	statusDivider:SetPoint("TOPRIGHT")
	statusDivider:SetHeight(FenUI.GetPixelSize and FenUI:GetPixelSize(statusBar) or 1)
	statusDivider:SetColorTexture(FenUI:GetColor("borderSubtle"))

	-- Content container for modules
	local contentFrame = CreateFrame("Frame", nil, frame.safeZone)
	frame.moduleContent = contentFrame

	-- Tab group
	local tabs = FenUI:CreateTabGroup(frame.safeZone, {
		tabs = {
			{ key = "inspect", text = L["Inspect"] },
			{ key = "console", text = L["Console"] },
			{ key = "errors", text = L["Errors"] },
			{ key = "tests", text = L["Tests"] },
			{ key = "perf", text = L["Performance"] },
			{ key = "tools", text = L["Tools"] },
			{ key = "api", text = L["API"] },
		},
		-- onChange set later after initial selection to prevent overwriting saved state during init
	})
	tabs:SetPoint("TOPLEFT", 0, 0)
	tabs:SetPoint("TOPRIGHT", 0, 0)
	frame.tabs = tabs

	-- Anchor content to tabs and status bar
	contentFrame:SetPoint("TOPLEFT", tabs, "BOTTOMLEFT", 0, -4)
	contentFrame:SetPoint("BOTTOMRIGHT", statusBar, "TOPRIGHT", 0, 4)

	-- Reload button on status bar
	local reloadBtn = FenUI:CreateImageButton(statusBar, {
		texture = ICON_PATH .. "icon-reload",
		size = 20,
		tooltip = L["Reload UI"],
		onClick = function()
			ReloadUI()
		end,
	})
	reloadBtn:SetPoint("RIGHT", -8, 0)

	-- "Register Mechanic" toggle checkbox (dogfooding)
	local registerSelfCheckbox = FenUI:CreateCheckbox(statusBar, {
		label = L["Register Mechanic"] or "Register Mechanic",
		checked = self.db.profile.registerSelf,
		boxSize = 14,
		checkedTexture = ICON_PATH .. "icon-checkbox-checked",
		uncheckedTexture = ICON_PATH .. "icon-checkbox-unchecked",
		onChange = function(_, checked)
			self:SetRegisterSelf(checked)
		end,
	})

	-- Match status bar font and color
	registerSelfCheckbox.label:SetFontObject(FenUI:GetFont("fontSmall"))
	registerSelfCheckbox.label:SetTextColor(FenUI:GetColorRGB("textMuted"))
	registerSelfCheckbox.checkmark:SetFontObject(FenUI:GetFont("fontSmall"))

	-- Lighten the checkbox textures
	if registerSelfCheckbox.boxBg then
		registerSelfCheckbox.boxBg:SetVertexColor(FenUI:GetColor("textMuted"))
	end

	-- Anchor to the last status item for a unified left-aligned look
	local lastStatusItem = statusBar.items and statusBar.items[#statusBar.items]
	if lastStatusItem then
		registerSelfCheckbox:SetPoint("LEFT", lastStatusItem.valueFS, "RIGHT", 32, 0)
	else
		registerSelfCheckbox:SetPoint("LEFT", statusBar, "LEFT", 400, 0)
	end
	frame.registerSelfCheckbox = registerSelfCheckbox

	-- Select initial tab
	local initialTab = self.db.profile.activeTab or "console"

	-- 1. Set the hook first so future manual clicks work
	tabs.hooks.onChange = function(key)
		self:OnTabChanged(key)
	end

	-- 2. Force selection in widget
	tabs:SelectTab(initialTab)

	-- 3. Force module initialization and showing for the first load
	self:OnTabChanged(initialTab)

	self.initializing = false -- Setup complete, now saves will work

	-- Initial badge state
	self:UpdateErrorBadge()

	-- Parent visibility changes do not call the modules' Lua lifecycle methods.
	-- Forward them so closing the panel stops polling and pick-mode handlers.
	local function notifyShownModules(method)
		for _, name in ipairs(LIFECYCLE_MODULES) do
			local module = self[name]
			if module and module.frame and module.frame:IsShown() and module[method] then
				module[method](module)
			end
		end
	end
	frame:HookScript("OnHide", function()
		notifyShownModules("OnHide")
	end)
	frame:HookScript("OnShow", function()
		notifyShownModules("OnShow")
	end)
end

function Mechanic:OnTabChanged(key)
	if not self.initializing and self.db.profile.activeTab == key then
		return
	end

	if not self.initializing then
		self.db.profile.activeTab = key
	end

	-- Hide all module frames
	for _, name in ipairs(LIFECYCLE_MODULES) do
		local module = self[name]
		if module and module.frame then
			module.frame:Hide()
			if module.OnHide then
				module:OnHide()
			end
		end
	end

	-- Show selected module
	local tab = TAB_MODULES[key]
	if not tab then
		return
	end
	if not self[tab.module] or not self[tab.module].frame then
		self[tab.initialize](self)
	end
	local module = self[tab.module]
	if module and module.frame then
		module.frame:Show()
		if module.OnShow then
			module:OnShow()
		end
	end
end

function Mechanic:GetStatusItems()
	local MechanicLib = LibStub("MechanicLib-1.0", true)
	local registeredCount = 0
	if MechanicLib then
		for _ in pairs(MechanicLib:GetRegistered()) do
			registeredCount = registeredCount + 1
		end
	end

	return {
		{ label = "WoW", value = self.Utils:GetVersionString() },
		{ label = "Interface", value = self.Utils:GetInterfaceString() },
		{ label = "Registered Addons", value = registeredCount },
	}
end

function Mechanic:UpdateStatusBar()
	if self.frame and self.frame.statusBar then
		self.frame.statusBar:SetValues(self:GetStatusItems())

		-- Re-anchor the checkbox to the new last item
		if self.frame.registerSelfCheckbox then
			local statusBar = self.frame.statusBar
			local lastStatusItem = statusBar.items and statusBar.items[#statusBar.items]
			if lastStatusItem then
				self.frame.registerSelfCheckbox:ClearAllPoints()
				self.frame.registerSelfCheckbox:SetPoint("LEFT", lastStatusItem.valueFS, "RIGHT", 32, 0)
			end
		end
	end
end

