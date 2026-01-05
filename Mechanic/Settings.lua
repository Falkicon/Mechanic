-- Settings.lua
-- !Mechanic - AceConfig Settings Panel (Phase 3)
--
-- Integrates with Blizzard's addon settings and provides options for all modules.

local ADDON_NAME, ns = ...
local Mechanic = LibStub("AceAddon-3.0"):GetAddon(ADDON_NAME)
local L = LibStub("AceLocale-3.0"):GetLocale("!Mechanic", true) or {}
local AceConfig = LibStub("AceConfig-3.0")
local AceConfigDialog = LibStub("AceConfigDialog-3.0")
local LDBIcon = LibStub("LibDBIcon-1.0", true)

function Mechanic:SetupOptions()
	local options = {
		type = "group",
		name = "!Mechanic",
		args = {
			general = {
				type = "group",
				name = L["General"] or "General",
				order = 1,
				args = {
					header = {
						type = "header",
						name = "General Settings",
						order = 1,
					},
					bufferSize = {
						type = "range",
						name = L["Console Buffer Size"] or "Console Buffer Size",
						desc = "Maximum number of log entries to keep",
						min = 100,
						max = 3000,
						step = 100,
						order = 2,
						get = function()
							return self.db.profile.bufferSize
						end,
						set = function(_, v)
							self.db.profile.bufferSize = v
						end,
					},
					showTimestamps = {
						type = "toggle",
						name = L["Show Timestamps"] or "Show Timestamps",
						desc = "Prefix console entries with time",
						order = 3,
						get = function()
							return self.db.profile.showTimestamps
						end,
						set = function(_, v)
							self.db.profile.showTimestamps = v
						end,
					},
					minimapIcon = {
						type = "toggle",
						name = L["Show Minimap Icon"] or "Show Minimap Icon",
						desc = "Show the minimap button for quick access",
						order = 4,
						get = function()
							return not self.db.profile.minimap.hide
						end,
						set = function(_, v)
							self.db.profile.minimap.hide = not v
							if LDBIcon then
								if v then
									LDBIcon:Show("Mechanic")
								else
									LDBIcon:Hide("Mechanic")
								end
							end
						end,
					},
				},
			},
			copy = {
				type = "group",
				name = L["Copy Options"] or "Copy Options",
				order = 2,
				args = {
					header = {
						type = "header",
						name = "Copy Behavior",
						order = 1,
					},
					includeEnvHeader = {
						type = "toggle",
						name = L["Include Environment Header"] or "Include Environment Header",
						desc = "Add WoW version, character info to copies",
						order = 2,
						get = function()
							return self.db.profile.includeEnvHeader
						end,
						set = function(_, v)
							self.db.profile.includeEnvHeader = v
						end,
					},
					includeCharacterInfo = {
						type = "toggle",
						name = L["Include Character Info"] or "Include Character Info",
						desc = "Add character name and class to header",
						order = 3,
						disabled = function()
							return not self.db.profile.includeEnvHeader
						end,
						get = function()
							return self.db.profile.includeCharacterInfo
						end,
						set = function(_, v)
							self.db.profile.includeCharacterInfo = v
						end,
					},
					includeTimestamp = {
						type = "toggle",
						name = L["Include Timestamp"] or "Include Timestamp",
						desc = "Add export timestamp to header",
						order = 4,
						disabled = function()
							return not self.db.profile.includeEnvHeader
						end,
						get = function()
							return self.db.profile.includeTimestamp
						end,
						set = function(_, v)
							self.db.profile.includeTimestamp = v
						end,
					},
				},
			},
			performance = {
				type = "group",
				name = L["Performance"] or "Performance",
				order = 3,
				args = {
					header = {
						type = "header",
						name = "Performance Settings",
						order = 1,
					},
					autoRefresh = {
						type = "toggle",
						name = L["Auto-Refresh"] or "Auto-Refresh",
						desc = "Automatically refresh performance data when tab is visible",
						order = 2,
						get = function()
							return self.db.profile.autoRefresh
						end,
						set = function(_, v)
							self.db.profile.autoRefresh = v
							-- Update module if initialized
							if self.Perf and self.Perf.frame then
								self.Perf.autoRefresh = v
								if v and self.Perf.visible then
									self.Perf:StartAutoRefresh()
								elseif not v then
									self.Perf:StopAutoRefresh()
								end
								if self.Perf.autoRefreshButton then
									self.Perf.autoRefreshButton:SetText(
										v and "▶ Auto-Refresh: ON" or "⏸ Auto-Refresh: OFF"
									)
								end
							end
						end,
					},
					refreshInterval = {
						type = "range",
						name = L["Refresh Interval"] or "Refresh Interval",
						desc = "Seconds between auto-refreshes",
						min = 0.5,
						max = 5,
						step = 0.5,
						order = 3,
						get = function()
							return self.db.profile.refreshInterval
						end,
						set = function(_, v)
							self.db.profile.refreshInterval = v
							-- Restart timer with new interval if active
							if self.Perf and self.Perf.refreshTimer then
								self.Perf:StopAutoRefresh()
								if self.Perf.autoRefresh and self.Perf.visible then
									self.Perf:StartAutoRefresh()
								end
							end
						end,
					},
					trackEventFrequency = {
						type = "toggle",
						name = L["Track Event Frequency"] or "Track Event Frequency",
						desc = "Monitor event fire rates (adds overhead, requires reload)",
						order = 4,
						get = function()
							return self.db.profile.trackEventFrequency
						end,
						set = function(_, v)
							self.db.profile.trackEventFrequency = v
							-- Update tracking
							if self.Perf then
								if v then
									self.Perf:EnableEventTracking()
								else
									self.Perf:DisableEventTracking()
								end
							end
						end,
					},
				},
			},
			registeredAddons = {
				type = "group",
				name = L["Registered Addons"] or "Registered Addons",
				order = 10,
				args = {
					-- Dynamically populated from MechanicLib:GetRegistered()
				},
			},
		},
	}

	-- Add registered addon settings
	self:PopulateRegisteredAddonSettings(options.args.registeredAddons.args)

	AceConfig:RegisterOptionsTable("Mechanic", options)
	self.optionsFrame = AceConfigDialog:AddToBlizOptions("Mechanic", "!Mechanic")
end

function Mechanic:PopulateRegisteredAddonSettings(args)
	local MechanicLib = LibStub("MechanicLib-1.0", true)
	if not MechanicLib then
		args.noLib = {
			type = "description",
			name = "MechanicLib not loaded.",
			order = 1,
		}
		return
	end

	local order = 1
	for addonName, capabilities in pairs(MechanicLib:GetRegistered()) do
		if capabilities.settings then
			args[addonName] = {
				type = "group",
				name = string.format("%s %s", tostring(addonName or "Unknown"), tostring(capabilities.version or "")),
				order = order,
				args = capabilities.settings,
			}
			order = order + 1
		end
	end

	if order == 1 then
		args.noAddons = {
			type = "description",
			name = "No addons have registered settings with Mechanic.",
			order = 1,
		}
	end
end

--- Refreshes registered addon settings (call after new registrations)
function Mechanic:RefreshRegisteredAddonSettings()
	-- Re-register options table with updated addon settings
	-- This is a bit heavy but ensures new registrations appear
	self:SetupOptions()
end
