-- UI/Tools.lua
-- !Mechanic - Tools Tab Module (Phase 6)
--
-- Provides a centralized location for addon-registered diagnostic tools.
-- Uses left-nav pattern: addon list on left, custom UI on right.

local ADDON_NAME, ns = ...
local Mechanic = LibStub("AceAddon-3.0"):GetAddon(ADDON_NAME)
local L = LibStub("AceLocale-3.0"):GetLocale(ADDON_NAME, true)
local ICON_PATH = [[Interface\AddOns\!Mechanic\Assets\Icons\]]
local ToolsModule = {}
Mechanic.Tools = ToolsModule

ToolsModule.layout = nil
ToolsModule.selectedAddon = nil
ToolsModule.activePanel = nil
ToolsModule.navDirty = true

function Mechanic:InitializeTools()
	if ToolsModule.frame then
		return
	end

	local parent = self.frame.moduleContent
	local frame = CreateFrame("Frame", nil, parent)
	frame:SetAllPoints()
	ToolsModule.frame = frame

	-- Create toolbar for Export button
	local toolbar = FenUI:CreateToolbar(frame, {
		height = 32,
		padding = 4,
	})
	toolbar:SetPoint("TOPLEFT", 0, 0)
	toolbar:SetPoint("TOPRIGHT", 0, 0)

	toolbar:AddSpacer("flex")

	local exportBtn = toolbar:AddImageButton({
		texture = ICON_PATH .. "icon-export",
		size = 24,
		tooltip = L["Export Button"],
		onClick = function()
			self:Export()
		end,
	})
	ToolsModule.exportButton = exportBtn

	-- Help Button
	toolbar:AddImageButton({
		texture = ICON_PATH .. "icon-help",
		size = 24,
		tooltip = L["Help"],
		onClick = function()
			Mechanic.Utils:ShowHelpDialog("tools")
		end,
	})

	-- Create split nav layout
	local SplitNavLayout = ns.SplitNavLayout
	ToolsModule.layout = SplitNavLayout:Create(frame, {
		navWidth = 200,
		items = ToolsModule:GetAddonList(),
		storageKey = "tools",
		onSelect = function(key)
			ToolsModule:OnAddonSelected(key)
		end,
	})

	-- Anchor layout below toolbar
	ToolsModule.layout:ClearAllPoints()
	ToolsModule.layout:SetPoint("TOPLEFT", toolbar, "BOTTOMLEFT", 0, -4)
	ToolsModule.layout:SetPoint("BOTTOMRIGHT", 0, 0)

	-- Manually trigger initial selection now that layout is assigned
	local initialKey = ToolsModule.layout:GetSelectedKey()
	if initialKey then
		ToolsModule:OnAddonSelected(initialKey)
	end

	-- Populate nav with registered addons
	ToolsModule:RefreshAddonList()
end

function ToolsModule:GetAddonList()
	local MechanicLib = LibStub("MechanicLib-1.0", true)
	if not MechanicLib then
		return {}
	end

	local items = {}
	for addonName in pairs(MechanicLib:GetRegistered()) do
		if MechanicLib:HasCapability(addonName, "tools") then
			local tools = MechanicLib:GetCapability(addonName, "tools")
			if tools and tools.createPanel then
				table.insert(items, {
					key = addonName,
					text = addonName,
				})
			end
		end
	end

	-- Sort alphabetically
	table.sort(items, function(a, b)
		return a.text < b.text
	end)

	if #items == 0 then
		-- Show empty state
		items = { { key = "_empty", text = "(No tools registered)" } }
	end

	return items
end

function ToolsModule:RefreshAddonList()
	local items = self:GetAddonList()

	if not self.layout then
		return
	end

	self.layout:SetItems(items)
	self.navDirty = false

	-- Select first real addon if available
	if #items > 0 and items[1].key ~= "_empty" and not self.layout:GetSelectedKey() then
		self.layout:Select(items[1].key)
	end
end

function ToolsModule:OnAddonSelected(addonName)
	-- Guard: layout might not be assigned yet during initialization
	if not self.layout then
		return
	end

	-- Destroy previous panel if it exists
	if self.activePanel and self.selectedAddon then
		local MechanicLib = LibStub("MechanicLib-1.0", true)
		if MechanicLib and MechanicLib:HasCapability(self.selectedAddon, "tools") then
			local tools = MechanicLib:GetCapability(self.selectedAddon, "tools")
			if tools and tools.destroyPanel then
				pcall(tools.destroyPanel, self.activePanel)
			end
		end
	end

	self.selectedAddon = addonName

	-- Handle empty state
	if addonName == "_empty" then
		local contentFrame = self.layout:GetContentFrame("_empty")
		local emptyText = contentFrame.emptyText
		if not emptyText then
			emptyText = contentFrame:CreateFontString(nil, "OVERLAY", "GameFontDisableLarge")
			emptyText:SetPoint("CENTER")
			emptyText:SetText(
				L["No addons have registered diagnostic tools.\n\nAddons can register tools via:\nMechanicLib:Register(name, { tools = { ... } })"]
			)
			contentFrame.emptyText = emptyText
		end
		self.activePanel = nil
		return
	end

	-- Get addon capabilities
	local MechanicLib = LibStub("MechanicLib-1.0", true)
	if not MechanicLib or not MechanicLib:HasCapability(addonName, "tools") then
		return
	end

	local tools = MechanicLib:GetCapability(addonName, "tools")
	if not tools then
		return
	end

	-- Get or create content frame for this addon
	local contentFrame = self.layout:GetContentFrame(addonName)
	self.activePanel = contentFrame

	-- Clear previous content
	for _, child in ipairs({ contentFrame:GetChildren() }) do
		child:Hide()
		child:SetParent(nil)
	end

	-- Let addon create its panel
	if tools.createPanel then
		local ok, err = pcall(tools.createPanel, contentFrame)
		if not ok then
			Mechanic:Print(string.format("Error creating tools panel for %s: %s", addonName, tostring(err)))
		end
	end
end

function ToolsModule:OnShow()
	if self.navDirty then
		self:RefreshAddonList()
	end
end

function ToolsModule:OnHide()
	-- Optional: cleanup
end

function ToolsModule:OnHide() end

function ToolsModule:Export()
	local navName = (self.selectedAddon and self.selectedAddon ~= "_empty") and self.selectedAddon
		or (L["All"] or "All")
	local title = string.format(
		"%s : %s : %s",
		tostring(L["Tools"] or "Tools"),
		tostring(navName or "All"),
		tostring(L["Export"] or "Export")
	)

	local text = self:GetCopyText(Mechanic.db.profile.includeEnvHeader)
	Mechanic.Utils:ShowExportDialog(title, text)
end

function ToolsModule:GetCopyText(includeHeader)
	local lines = {}
	if includeHeader then
		local header = Mechanic:GetEnvironmentHeader()
		if header then
			table.insert(lines, header)
			table.insert(lines, "---")
		end
	end

	table.insert(lines, "Tools Tab")
	table.insert(lines, string.format("Selected: %s", self.selectedAddon or "None"))
	table.insert(lines, "")
	table.insert(lines, "Registered tool providers:")

	local MechanicLib = LibStub("MechanicLib-1.0", true)
	if MechanicLib then
		local registered = {}
		for addonName in pairs(MechanicLib:GetRegistered()) do
			if MechanicLib:HasCapability(addonName, "tools") then
				table.insert(registered, addonName)
			end
		end
		table.sort(registered)
		for _, name in ipairs(registered) do
			table.insert(lines, string.format("  - %s", name))
		end
	end

	return table.concat(lines, "\n")
end
