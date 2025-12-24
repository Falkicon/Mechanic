-- UI/MainFrame.lua
-- !Mechanic - Main UI Panel

local ADDON_NAME, ns = ...
local Mechanic = LibStub("AceAddon-3.0"):GetAddon(ADDON_NAME)

function Mechanic:CreateMainFrame()
	if self.frame then
		return
	end

	local frame = FenUI:CreatePanel(UIParent, {
		name = "MechanicMainFrame",
		title = "!Mechanic",
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
			{ key = "console", text = "Console" },
			{ key = "errors", text = "Errors" },
			{ key = "tests", text = "Tests" },
			{ key = "tools", text = "Tools" },
			{ key = "api", text = "API" },
			{ key = "inspect", text = "Inspect" },
			{ key = "perf", text = "Performance" },
		},
		onChange = function(key)
			self:OnTabChanged(key)
		end,
	})
	tabs:SetPoint("TOPLEFT", 0, -25)
	tabs:SetPoint("TOPRIGHT", 0, -25)
	frame.tabs = tabs

	-- Anchor content to tabs and status bar
	contentFrame:SetPoint("TOPLEFT", tabs, "BOTTOMLEFT", 0, -4)
	contentFrame:SetPoint("BOTTOMRIGHT", statusBar, "TOPRIGHT", 0, 4)

	-- Reload button on status bar
	local reloadBtn = FenUI:CreateIconButton(statusBar, {
		icon = "Interface\\Buttons\\UI-RefreshButton",
		tooltip = "Reload UI (ReloadUI)",
		onClick = function()
			ReloadUI()
		end,
	})
	reloadBtn:SetPoint("RIGHT", -8, 0)

	-- Select initial tab
	tabs:SelectTab(self.db.profile.activeTab or "console")
end

function Mechanic:OnTabChanged(key)
	self.db.profile.activeTab = key

	-- Hide all module frames
	if self.Console and self.Console.frame then
		self.Console.frame:Hide()
	end
	if self.Errors and self.Errors.frame then
		self.Errors.frame:Hide()
	end
	if self.Tests and self.Tests.frame then
		self.Tests.frame:Hide()
	end
	if self.Tools and self.Tools.frame then
		self.Tools.frame:Hide()
		self.Tools:OnHide()
	end
	if self.API and self.API.frame then
		self.API.frame:Hide()
		self.API:OnHide()
	end
	if self.Inspect and self.Inspect.frame then
		self.Inspect.frame:Hide()
		self.Inspect:OnHide()
	end
	if self.Perf and self.Perf.frame then
		self.Perf.frame:Hide()
		self.Perf:OnHide()
	end

	-- Show selected module
	if key == "console" then
		if not self.Console or not self.Console.frame then
			self:InitializeConsole()
		end
		if self.Console and self.Console.frame then
			self.Console.frame:Show()
		end
	elseif key == "errors" then
		if not self.Errors or not self.Errors.frame then
			self:InitializeErrors()
		end
		if self.Errors and self.Errors.frame then
			self.Errors.frame:Show()
		end
	elseif key == "tests" then
		if not self.Tests or not self.Tests.frame then
			self:InitializeTests()
		end
		if self.Tests and self.Tests.frame then
			self.Tests.frame:Show()
		end
	elseif key == "tools" then
		if not self.Tools or not self.Tools.frame then
			self:InitializeTools()
		end
		if self.Tools and self.Tools.frame then
			self.Tools.frame:Show()
			self.Tools:OnShow()
		end
	elseif key == "api" then
		if not self.API or not self.API.frame then
			self:InitializeAPI()
		end
		if self.API and self.API.frame then
			self.API.frame:Show()
			self.API:OnShow()
		end
	elseif key == "inspect" then
		if not self.Inspect or not self.Inspect.frame then
			self:InitializeInspect()
		end
		if self.Inspect and self.Inspect.frame then
			self.Inspect.frame:Show()
			self.Inspect:OnShow()
		end
	elseif key == "perf" then
		if not self.Perf or not self.Perf.frame then
			self:InitializePerformance()
		end
		if self.Perf and self.Perf.frame then
			self.Perf.frame:Show()
			self.Perf:OnShow()
		end
	end
end

function Mechanic:GetStatusItems()
	local version, build, _, interface = GetBuildInfo()
	local client = self:GetClientType()

	local MechanicLib = LibStub("MechanicLib-1.0", true)
	local registeredCount = 0
	if MechanicLib then
		for _ in pairs(MechanicLib:GetRegistered()) do
			registeredCount = registeredCount + 1
		end
	end

	return {
		{ label = "WoW", value = version .. " (" .. build .. ")" },
		{ label = "Interface", value = interface },
		{ label = "Client", value = client },
		{ label = "Addons", value = registeredCount },
	}
end

function Mechanic:UpdateStatusBar()
	if self.frame and self.frame.statusBar then
		self.frame.statusBar:SetValues(self:GetStatusItems())
	end
end
