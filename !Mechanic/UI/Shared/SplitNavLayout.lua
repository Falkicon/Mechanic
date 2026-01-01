-- UI/Shared/SplitNavLayout.lua
-- !Mechanic - Reusable Split Navigation Layout Helper (Phase 6)
--
-- Provides a standard left-nav / right-content split layout pattern.
-- Now powered by FenUI:CreateSplitLayout for semantic consistency.

local ADDON_NAME, ns = ...
local SplitNavLayout = {}
ns.SplitNavLayout = SplitNavLayout

---Create a split navigation layout
---@param parent Frame Parent frame
---@param config SplitNavConfig
---@return table layout Layout controller object
function SplitNavLayout:Create(parent, config)
	config = config or {}

	-- Create the semantic split layout from FenUI
	local layout = FenUI:CreateSplitLayout(parent, {
		navWidth = config.navWidth or 200,
		defaultKey = config.defaultKey,
		onSelect = config.onSelect,
		items = config.items,
		-- Removed default Inset border to avoid "double bevel"
		border = config.border,
		background = config.background or "surfacePanel",
		padding = config.padding or 0,
		gap = config.gap or 4,
	})
	layout:SetAllPoints()

	-- Support persistence (original !Mechanic logic)
	local MechanicObj = _G.Mechanic
	layout.storageKey = config.storageKey
	layout.addonProfile = MechanicObj and MechanicObj.db and MechanicObj.db.profile
	layout.initializing = true

	if layout.storageKey and layout.addonProfile and layout.addonProfile.activeSubTabs then
		local savedKey = layout.addonProfile.activeSubTabs[layout.storageKey]
		if savedKey then
			layout:Select(savedKey, true)
		end
	end

	-- Override Select to include persistence
	local originalSelect = layout.Select
	function layout:Select(key, force)
		originalSelect(self, key, force)

		if self.storageKey and self.addonProfile and not self.initializing then
			self.addonProfile.activeSubTabs = self.addonProfile.activeSubTabs or {}
			self.addonProfile.activeSubTabs[self.storageKey] = key
		end
	end

	layout.initializing = false
	return layout
end

return SplitNavLayout
