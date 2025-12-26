-- UI/MainFrame.lua
-- !Mechanic - Main UI Panel

local ADDON_NAME, ns = ...
local Mechanic = LibStub("AceAddon-3.0"):GetAddon(ADDON_NAME)
local L = LibStub("AceLocale-3.0"):GetLocale(ADDON_NAME, true)

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
	tabs:SetPoint("TOPLEFT", 0, -25)
	tabs:SetPoint("TOPRIGHT", 0, -25)
	frame.tabs = tabs

	-- Anchor content to tabs and status bar
	contentFrame:SetPoint("TOPLEFT", tabs, "BOTTOMLEFT", 0, -4)
	contentFrame:SetPoint("BOTTOMRIGHT", statusBar, "TOPRIGHT", 0, 4)

	-- Reload button on status bar
	local reloadBtn = FenUI:CreateButton(statusBar, {
		text = L["Reload UI"],
		width = 90,
		height = 20,
		onClick = function()
			ReloadUI()
		end,
	})
	reloadBtn:SetPoint("RIGHT", -8, 0)

	-- "Register Mechanic" toggle checkbox (dogfooding)
	local registerSelfCheckbox = FenUI:CreateCheckbox(statusBar, {
		label = L["Register Mechanic"] or "Register Mechanic",
		checked = self.db.profile.registerSelf,
		onChange = function(_, checked)
			self:SetRegisterSelf(checked)
		end,
	})
	registerSelfCheckbox:SetPoint("RIGHT", reloadBtn, "LEFT", -16, 0)
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
end

function Mechanic:OnTabChanged(key)
	if not self.initializing and self.db.profile.activeTab == key then
		return
	end

	if not self.initializing then
		self.db.profile.activeTab = key
	end

	-- Hide all module frames
	if self.Console and self.Console.frame then
		self.Console.frame:Hide()
		if self.Console.OnHide then
			self.Console:OnHide()
		end
	end
	if self.Errors and self.Errors.frame then
		self.Errors.frame:Hide()
		if self.Errors.OnHide then
			self.Errors:OnHide()
		end
	end
	if self.Tests and self.Tests.frame then
		self.Tests.frame:Hide()
		if self.Tests.OnHide then
			self.Tests:OnHide()
		end
	end
	if self.Tools and self.Tools.frame then
		self.Tools.frame:Hide()
		if self.Tools.OnHide then
			self.Tools:OnHide()
		end
	end
	if self.API and self.API.frame then
		self.API.frame:Hide()
		if self.API.OnHide then
			self.API:OnHide()
		end
	end
	if self.Inspect and self.Inspect.frame then
		self.Inspect.frame:Hide()
		if self.Inspect.OnHide then
			self.Inspect:OnHide()
		end
	end
	if self.Perf and self.Perf.frame then
		self.Perf.frame:Hide()
		if self.Perf.OnHide then
			self.Perf:OnHide()
		end
	end

	-- Show selected module
	if key == "console" then
		if not self.Console or not self.Console.frame then
			self:InitializeConsole()
		end
		if self.Console and self.Console.frame then
			self.Console.frame:Show()
			if self.Console.OnShow then
				self.Console:OnShow()
			end
		end
	elseif key == "errors" then
		if not self.Errors or not self.Errors.frame then
			self:InitializeErrors()
		end
		if self.Errors and self.Errors.frame then
			self.Errors.frame:Show()
			if self.Errors.OnShow then
				self.Errors:OnShow()
			end
		end
	elseif key == "tests" then
		if not self.Tests or not self.Tests.frame then
			self:InitializeTests()
		end
		if self.Tests and self.Tests.frame then
			self.Tests.frame:Show()
			if self.Tests.OnShow then
				self.Tests:OnShow()
			end
		end
	elseif key == "tools" then
		if not self.Tools or not self.Tools.frame then
			self:InitializeTools()
		end
		if self.Tools and self.Tools.frame then
			self.Tools.frame:Show()
			if self.Tools.OnShow then
				self.Tools:OnShow()
			end
		end
	elseif key == "api" then
		if not self.API or not self.API.frame then
			self:InitializeAPI()
		end
		if self.API and self.API.frame then
			self.API.frame:Show()
			if self.API.OnShow then
				self.API:OnShow()
			end
		end
	elseif key == "inspect" then
		if not self.Inspect or not self.Inspect.frame then
			self:InitializeInspect()
		end
		if self.Inspect and self.Inspect.frame then
			self.Inspect.frame:Show()
			if self.Inspect.OnShow then
				self.Inspect:OnShow()
			end
		end
	elseif key == "perf" then
		if not self.Perf or not self.Perf.frame then
			self:InitializePerformance()
		end
		if self.Perf and self.Perf.frame then
			self.Perf.frame:Show()
			if self.Perf.OnShow then
				self.Perf:OnShow()
			end
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
	end
end
