--------------------------------------------------------------------------------
-- FenUI - Section Widget
--
-- A content primitive for structured information display.
-- Consists of a heading (bold) and body text (normal).
-- Used for help dialogs, about boxes, release notes, feature descriptions.
--------------------------------------------------------------------------------

local FenUI = FenUI
local SectionMixin = {}

function SectionMixin:Init(config)
	config = config or {}
	self.config = config

	-- 1. Heading FontString
	local heading = self:CreateFontString(nil, "OVERLAY", config.headingFont or "GameFontNormalLarge")
	heading:SetText(config.heading or "")
	heading:SetJustifyH("LEFT")
	heading:SetWordWrap(false)

	local hr, hg, hb = FenUI:GetColorRGB(config.headingColor or "textHeading")
	heading:SetTextColor(hr, hg, hb)

	heading:SetPoint("TOPLEFT", 0, 0)
	heading:SetPoint("TOPRIGHT", 0, 0)
	self.heading = heading

	-- 2. Body FontString
	local body = self:CreateFontString(nil, "OVERLAY", config.bodyFont or "GameFontHighlight")
	body:SetText(config.body or "")
	body:SetJustifyH("LEFT")
	body:SetJustifyV("TOP")
	body:SetWordWrap(true)
	body:SetNonSpaceWrap(true)

	local br, bg, bb = FenUI:GetColorRGB(config.bodyColor or "textDefault")
	body:SetTextColor(br, bg, bb)

	-- Spacing between heading and body (default to 4px for visual breathing room)
	local gap = FenUI:GetSpacing(config.gap or 0)
	if gap == 0 then
		gap = 4 -- Default small gap
	end
	body:SetPoint("TOPLEFT", heading, "BOTTOMLEFT", 0, -gap)
	body:SetPoint("TOPRIGHT", heading, "BOTTOMRIGHT", 0, -gap)
	self.body = body
	self.bodyGap = gap

	-- 3. Calculate initial height
	self:UpdateHeight()

	-- 4. Handle resize (body text wrapping may change)
	self:SetScript("OnSizeChanged", function(s, width)
		-- Width changed, need to update body wrapping
		if s.lastWidth ~= width then
			s.lastWidth = width
			-- Delay the update slightly to ensure layout is complete
			C_Timer.After(0, function()
				if s:IsVisible() then
					s:UpdateHeight()
				end
			end)
		end
	end)

	-- Also update on show to ensure proper layout
	self:SetScript("OnShow", function(s)
		C_Timer.After(0, function()
			s:UpdateHeight()
		end)
	end)
end

function SectionMixin:UpdateHeight()
	-- CRITICAL: FontStrings need explicit width for word wrap to work
	local parentWidth = self:GetWidth()
	if parentWidth and parentWidth > 0 then
		self.body:SetWidth(parentWidth)
	end

	local headingHeight = self.heading:GetStringHeight()
	local bodyHeight = self.body:GetStringHeight()
	local gap = self.bodyGap or FenUI:GetSpacing(self.config.gap or 0)
	if gap == 0 then
		gap = 4
	end

	self:SetHeight(headingHeight + gap + bodyHeight)
end

function SectionMixin:SetHeading(text)
	self.heading:SetText(text)
	self:UpdateHeight()
end

function SectionMixin:SetBody(text)
	self.body:SetText(text)
	self:UpdateHeight()
end

function SectionMixin:SetContent(heading, body)
	self.heading:SetText(heading or "")
	self.body:SetText(body or "")
	self:UpdateHeight()
end

function SectionMixin:GetHeight()
	local gap = self.bodyGap or FenUI:GetSpacing(self.config.gap or 0)
	if gap == 0 then
		gap = 4
	end
	return self.heading:GetStringHeight() + gap + self.body:GetStringHeight()
end

--------------------------------------------------------------------------------
-- Factory
--------------------------------------------------------------------------------

--- Create a section with heading and body text
---@param parent Frame Parent frame
---@param config table { heading, body, headingFont, bodyFont, headingColor, bodyColor, gap }
---@return Frame section
function FenUI:CreateSection(parent, config)
	local section = CreateFrame("Frame", nil, parent)
	FenUI.Mixin(section, SectionMixin)
	section:Init(config)
	return section
end

FenUI.SectionMixin = SectionMixin
