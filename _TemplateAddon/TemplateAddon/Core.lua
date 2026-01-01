-- Core.lua
-- Main addon logic and initialization.

-- TODO: Search and replace 'TemplateAddon' with your addon name throughout this file.

local ADDON_NAME, ns = ...
local TemplateAddon = LibStub("AceAddon-3.0"):NewAddon(ADDON_NAME, "AceConsole-3.0", "AceEvent-3.0", "AceHook-3.0")
_G[ADDON_NAME] = TemplateAddon

-- Localization
local L = LibStub("AceLocale-3.0"):GetLocale(ADDON_NAME)

-- Default settings
local defaults = {
	profile = {
		debug = false,
	},
}

function TemplateAddon:OnInitialize()
	-- Initialize database
	self.db = LibStub("AceDB-3.0"):New("TemplateAddonDB", defaults, true)

	-- Register slash commands
	self:RegisterChatCommand("ta", "SlashCommand")
	self:RegisterChatCommand("templateaddon", "SlashCommand")

	self:Print(L["Initialized. Type /ta for help."])

	if ns.IS_DEV_MODE then
		self:Print("|cffff0000" .. L["Development Mode Active"] .. "|r")
	end
end

function TemplateAddon:OnEnable()
	-- Called when the addon is enabled
end

function TemplateAddon:OnDisable()
	-- Called when the addon is disabled
end

function TemplateAddon:SlashCommand(input)
	if not input or input:trim() == "" then
		self:Print(L["Usage: /ta [command]"])
		return
	end

	local command, nexteditpos = self:GetArgs(input, 1)

	if command == "debug" then
		self.db.profile.debug = not self.db.profile.debug
		self:Print(L["Debug mode: %s"]:format(self.db.profile.debug and "|cff00ff00On|r" or "|cffff0000Off|r"))
	else
		self:Print(L["Unknown command: %s"]:format(command))
	end
end
