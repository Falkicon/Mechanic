-- UI/Tools.lua
-- !Mechanic - Tools Tab Module (Phase 6)
--
-- Provides a centralized location for addon-registered diagnostic tools.
-- Uses left-nav pattern: addon list on left, custom UI on right.

local ADDON_NAME, ns = ...
local Mechanic = LibStub("AceAddon-3.0"):GetAddon(ADDON_NAME)
local ToolsModule = {}
Mechanic.Tools = ToolsModule

ToolsModule.layout = nil
ToolsModule.selectedAddon = nil
ToolsModule.activePanel = nil

function Mechanic:InitializeTools()
	if ToolsModule.frame then
		return
	end

	local parent = self.frame.moduleContent
	local frame = CreateFrame("Frame", nil, parent)
	frame:SetAllPoints()
	ToolsModule.frame = frame

	-- Create split nav layout
	local SplitNavLayout = ns.SplitNavLayout
	ToolsModule.layout = SplitNavLayout:Create(frame, {
		navWidth = 200,
		onSelect = function(key)
			ToolsModule:OnAddonSelected(key)
		end,
	})

	-- Populate nav with registered addons
	ToolsModule:RefreshAddonList()
end

function ToolsModule:RefreshAddonList()
	local MechanicLib = LibStub("MechanicLib-1.0", true)
	if not MechanicLib then
		return
	end

	local items = {}
	for addonName, capabilities in pairs(MechanicLib:GetRegistered()) do
		if capabilities.tools and capabilities.tools.createPanel then
			table.insert(items, {
				key = addonName,
				text = addonName,
			})
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

	self.layout:SetItems(items)

	-- Select first real addon if available
	if #items > 0 and items[1].key ~= "_empty" and not self.selectedAddon then
		self.layout:Select(items[1].key)
	end
end

function ToolsModule:OnAddonSelected(addonName)
	-- Destroy previous panel if it exists
	if self.activePanel and self.selectedAddon then
		local MechanicLib = LibStub("MechanicLib-1.0", true)
		local prevCaps = MechanicLib and MechanicLib:GetRegistered()[self.selectedAddon]
		if prevCaps and prevCaps.tools and prevCaps.tools.destroyPanel then
			pcall(prevCaps.tools.destroyPanel, self.activePanel)
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
				"No addons have registered diagnostic tools.\n\nAddons can register tools via:\nMechanicLib:Register(name, { tools = { ... } })"
			)
			contentFrame.emptyText = emptyText
		end
		self.activePanel = nil
		return
	end

	-- Get addon capabilities
	local MechanicLib = LibStub("MechanicLib-1.0", true)
	local capabilities = MechanicLib and MechanicLib:GetRegistered()[addonName]
	if not capabilities or not capabilities.tools then
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
	if capabilities.tools.createPanel then
		local ok, err = pcall(capabilities.tools.createPanel, contentFrame)
		if not ok then
			Mechanic:Print(string.format("Error creating tools panel for %s: %s", addonName, tostring(err)))
		end
	end
end

function ToolsModule:OnShow()
	self:RefreshAddonList()
end

function ToolsModule:OnHide()
	-- Optional: cleanup
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
		for addonName, capabilities in pairs(MechanicLib:GetRegistered()) do
			if capabilities.tools and capabilities.tools.createPanel then
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
