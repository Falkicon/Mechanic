--------------------------------------------------------------------------------
-- FenUI - InfoPanel Widget
--
-- A panel for displaying structured informational content with sections.
-- Used for help dialogs, about boxes, release notes, feature announcements.
--
-- Builds on Panel and Section widgets to provide a complete solution.
--------------------------------------------------------------------------------

local FenUI = FenUI
local InfoPanelMixin = {}

function InfoPanelMixin:InitInfoPanel(config)
	config = config or {}
	self.infoConfig = config
	self.sectionFrames = {}

	-- Default padding for InfoPanel if not specified (more breathing room)
	local padding = config.padding or 12
	self:SetPadding(padding)

	-- Use the Panel's content area
	local content = self:GetContentFrame()

	-- Create scroll panel for content
	local scrollBarWidth = FenUI:GetLayout("scrollBarWidth") or 20
	local scrollPanel = FenUI:CreateScrollPanel(content, {
		padding = 0,
		showScrollBar = true,
	})
	scrollPanel:SetAllPoints()
	self.scrollFrame = scrollPanel.scrollFrame
	self.scrollChild = scrollPanel.scrollChild

	-- Adjust scroll panel if close button is shown
	if config.showCloseButton then
		scrollPanel:SetPoint("BOTTOMRIGHT", content, "BOTTOMRIGHT", 0, 40)
	end

	-- Update scroll child width and layout sections on size change
	self.scrollFrame:SetScript("OnSizeChanged", function(sf, width)
		self.scrollChild:SetWidth(width)
		self:LayoutSections()
	end)

	-- Close button at bottom is now optional and disabled by default
	if config.showCloseButton then
		local closeBtn = FenUI:CreateButton(self.safeZone, {
			text = "Close",
			width = 100,
			onClick = function()
				self:Hide()
			end,
		})
		closeBtn:SetPoint("BOTTOM", 0, 8)
		self.closeBtn = closeBtn

		-- Adjust scroll frame to leave room for the button if it's shown
		self.scrollFrame:SetPoint("BOTTOMRIGHT", -scrollBarWidth, 40)
	end

	-- Initialize sections if provided
	if config.sections then
		self:SetSections(config.sections)
	end
end

function InfoPanelMixin:SetSections(sections)
	-- Clear existing sections
	for _, sectionFrame in ipairs(self.sectionFrames) do
		sectionFrame:Hide()
		sectionFrame:ClearAllPoints()
	end
	wipe(self.sectionFrames)

	-- Create new sections
	for i, sectionData in ipairs(sections) do
		local section = FenUI:CreateSection(self.scrollChild, {
			heading = sectionData.heading,
			body = sectionData.body,
			headingColor = sectionData.headingColor,
			bodyColor = sectionData.bodyColor,
		})
		section:SetPoint("LEFT", 0, 0)
		section:SetPoint("RIGHT", 0, 0)
		self.sectionFrames[i] = section
	end

	self:LayoutSections()
end

function InfoPanelMixin:LayoutSections()
	local yOffset = 0
	local sectionGap = 20 -- Fixed 20px gap between sections for better readability

	-- First pass: set widths and update heights
	local scrollChildWidth = self.scrollChild:GetWidth()
	for i, section in ipairs(self.sectionFrames) do
		-- Set explicit width first so text wrapping calculates correctly
		section:SetWidth(scrollChildWidth)
		section:UpdateHeight()
	end

	-- Second pass: position sections with proper heights
	for i, section in ipairs(self.sectionFrames) do
		section:ClearAllPoints()
		section:SetPoint("TOPLEFT", self.scrollChild, "TOPLEFT", 0, -yOffset)

		-- Get the calculated height from the section's content
		local sectionHeight = section:GetHeight()
		yOffset = yOffset + sectionHeight + sectionGap
	end

	-- Set scroll child height
	self.scrollChild:SetHeight(math.max(1, yOffset))
end

function InfoPanelMixin:AddSection(heading, body)
	local section = FenUI:CreateSection(self.scrollChild, {
		heading = heading,
		body = body,
	})
	section:SetPoint("LEFT", 0, 0)
	section:SetPoint("RIGHT", 0, 0)
	table.insert(self.sectionFrames, section)
	self:LayoutSections()
end

function InfoPanelMixin:ClearSections()
	for _, sectionFrame in ipairs(self.sectionFrames) do
		sectionFrame:Hide()
		sectionFrame:ClearAllPoints()
	end
	wipe(self.sectionFrames)
	self.scrollChild:SetHeight(1)
end

function InfoPanelMixin:ScrollToTop()
	if self.scrollFrame then
		self.scrollFrame:SetVerticalScroll(0)
	end
end

--------------------------------------------------------------------------------
-- Factory
--------------------------------------------------------------------------------

--- Create an info panel for displaying structured content
---@param parent Frame Parent frame
---@param config table { title, width, height, sections, movable, closable }
---@return Frame infoPanel
function FenUI:CreateInfoPanel(parent, config)
	config = config or {}

	-- Set defaults
	config.width = config.width or 450
	config.height = config.height or 400
	config.movable = config.movable ~= false
	config.closable = config.closable ~= false

	-- Create base panel
	local panel = FenUI:CreatePanel(parent or UIParent, config)
	panel:SetFrameStrata("DIALOG")
	panel:SetPoint("CENTER")

	-- Apply InfoPanel mixin
	FenUI.Mixin(panel, InfoPanelMixin)
	panel:InitInfoPanel(config)

	-- Re-layout sections when panel is shown to ensure proper text wrapping
	panel:HookScript("OnShow", function(self)
		C_Timer.After(0, function()
			self:LayoutSections()
		end)
	end)

	-- Hide by default (caller shows when ready)
	panel:Hide()

	return panel
end

FenUI.InfoPanelMixin = InfoPanelMixin
