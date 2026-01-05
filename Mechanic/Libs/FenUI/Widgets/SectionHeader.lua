--------------------------------------------------------------------------------
-- FenUI - SectionHeader Widget
--
-- Simple non-interactive header for lists and navigation panels.
-- Matches Blizzard Options UI category headers.
--------------------------------------------------------------------------------

local FenUI = FenUI
local SectionHeaderMixin = {}

function SectionHeaderMixin:Init(config)
	config = config or {}
	self.config = config

	-- 1. FontString Setup
	local fs = self:CreateFontString(nil, "OVERLAY", config.font or "GameFontNormalLarge")
	fs:SetText(config.text or "")
	fs:SetJustifyH(config.align or "LEFT")

	-- Apply muted color by default (gray)
	local r, g, b = FenUI:GetColorRGB(config.color or "textMuted")
	fs:SetTextColor(r, g, b)

	self.text = fs

	-- 2. Layout & Spacing
	local topMargin = FenUI:GetSpacing(config.spacing or "md")
	local bottomMargin = FenUI:GetSpacing(config.bottomMargin or "xs") -- 4px breathing room
	local leftIndent = config.indent or 8 -- Indent to match nav buttons

	-- We anchor the text relative to the container
	fs:SetPoint("LEFT", leftIndent, 0)
	fs:SetPoint("RIGHT", 0, 0)

	-- Set frame height based on font string + margins
	self:SetHeight(fs:GetHeight() + topMargin + bottomMargin)

	-- Anchor text to the bottom of the frame (with its own margin)
	-- so the frame's total height creates the top spacing
	fs:ClearAllPoints()
	fs:SetPoint("BOTTOMLEFT", leftIndent, bottomMargin)
	fs:SetPoint("BOTTOMRIGHT", 0, bottomMargin)
end

function SectionHeaderMixin:SetText(text)
	self.text:SetText(text)
end

--------------------------------------------------------------------------------
-- Factory
--------------------------------------------------------------------------------

function FenUI:CreateSectionHeader(parent, config)
	local header = CreateFrame("Frame", nil, parent)
	FenUI.Mixin(header, SectionHeaderMixin)
	header:Init(config)
	return header
end
