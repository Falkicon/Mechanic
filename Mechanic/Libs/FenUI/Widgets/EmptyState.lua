--------------------------------------------------------------------------------
-- FenUI v2 - EmptyState Widget
--
-- Centered overlay for empty content areas with two-slot architecture.
--
-- Slots:
-- - top: Typically an Image, icon, or custom frame
-- - bottom: Typically text (title + subtitle), or custom composite
--
-- Features:
-- - Background (color, gradient, or image)
-- - Slot-based content injection
-- - Backwards compatible with icon/title/subtitle props
-- - Creates Image component for conditional icons
--------------------------------------------------------------------------------

local FenUI = FenUI

--------------------------------------------------------------------------------
-- EmptyState Mixin
--------------------------------------------------------------------------------

local EmptyStateMixin = {}

function EmptyStateMixin:Init(config)
	self.config = config or {}
	self.slots = {}

	-- 1. Background
	self.bg = self:CreateTexture(nil, "BACKGROUND")
	self.bg:SetAllPoints()

	if config.backgroundGradient then
		local g = config.backgroundGradient
		local fromR, fromG, fromB, fromA = FenUI:GetColor(g.from or "black")
		local toR, toG, toB, toA = FenUI:GetColor(g.to or "transparent")
		self.bg:SetGradient(
			g.direction or "VERTICAL",
			CreateColor(fromR, fromG, fromB, fromA),
			CreateColor(toR, toG, toB, toA)
		)
	elseif config.backgroundImage then
		self.bg:SetTexture(config.backgroundImage)
	elseif config.background then
		local r, g, b, a = FenUI:GetColor(config.background)
		self.bg:SetColorTexture(r, g, b, a)
	else
		self.bg:Hide()
	end

	-- 2. Content Container (centered)
	self.content = CreateFrame("Frame", nil, self)
	self.content:SetPoint("CENTER")
	local contentWidth = config.width or (self:GetParent() and self:GetParent():GetWidth()) or 300
	self.content:SetSize(contentWidth, 200)

	-- 3. Create slots container frames
	self.topSlot = CreateFrame("Frame", nil, self.content)
	self.topSlot:SetPoint("TOP", self.content, "TOP", 0, 0)

	self.bottomSlot = CreateFrame("Frame", nil, self.content)

	-- Gap between slots
	local gap = config.gap or 16
	if type(gap) == "string" then
		gap = FenUI:GetSpacing(gap) or 16
	end
	self.slotGap = gap

	-- 4. Populate slots based on config (backwards compatibility)
	self:PopulateFromConfig(config)

	-- 5. Layout slots
	self:LayoutSlots()
end

--- Populate slots from config (backwards compatibility layer)
function EmptyStateMixin:PopulateFromConfig(config)
	-- TOP SLOT: Image or icon
	if config.image then
		-- New image config - create Image component
		if FenUI.CreateImage then
			local imageConfig = type(config.image) == "table" and config.image or { texture = config.image }
			-- Apply default size if not specified (default reduced to 32)
			imageConfig.width = imageConfig.width or config.iconSize or 32
			imageConfig.height = imageConfig.height or imageConfig.width

			local img = FenUI:CreateImage(self.topSlot, imageConfig)
			img:SetPoint("CENTER")
			self.topSlot:SetSize(imageConfig.width, imageConfig.height)
			self.slots.top = img
		end
	elseif config.icon then
		-- Legacy icon prop - create simple texture or Image component (default reduced to 32)
		local iconSize = config.iconSize or 32

		if FenUI.CreateImage then
			local img = FenUI:CreateImage(self.topSlot, {
				texture = config.icon,
				width = iconSize,
				height = iconSize,
			})
			img:SetPoint("CENTER")
			self.slots.top = img
		else
			-- Fallback to raw texture
			local icon = self.topSlot:CreateTexture(nil, "ARTWORK")
			icon:SetTexture(config.icon)
			icon:SetSize(iconSize, iconSize)
			icon:SetPoint("CENTER")
			self.slots.top = icon
		end

		self.topSlot:SetSize(iconSize, iconSize)
	end

	-- BOTTOM SLOT: Title and/or subtitle
	if config.title or config.subtitle then
		local textHeight = 0

		-- Title
		if config.title then
			self.titleText = self.bottomSlot:CreateFontString(nil, "OVERLAY")
			self.titleText:SetFontObject(FenUI:GetFont("fontHeading"))
			self.titleText:SetText(config.title)
			self.titleText:SetPoint("TOP", self.bottomSlot, "TOP", 0, 0)
			self.titleText:SetJustifyH("CENTER")

			local r, g, b = FenUI:GetColorRGB(config.titleToken or "textEmptyTitle")
			self.titleText:SetTextColor(r, g, b)

			textHeight = textHeight + self.titleText:GetStringHeight()
		end

		-- Subtitle
		if config.subtitle then
			self.subtitleText = self.bottomSlot:CreateFontString(nil, "OVERLAY")
			self.subtitleText:SetFontObject(FenUI:GetFont("fontSmall"))
			self.subtitleText:SetText(config.subtitle)
			self.subtitleText:SetJustifyH("CENTER")
			self.subtitleText:SetWidth(self.content:GetWidth() - 20)

			local r, g, b = FenUI:GetColorRGB(config.subtitleToken or "textEmptySubtitle")
			self.subtitleText:SetTextColor(r, g, b)

			if self.titleText then
				self.subtitleText:SetPoint("TOP", self.titleText, "BOTTOM", 0, -4)
			else
				self.subtitleText:SetPoint("TOP", self.bottomSlot, "TOP", 0, 0)
			end

			textHeight = textHeight + self.subtitleText:GetStringHeight() + 4
		end

		self.bottomSlot:SetSize(self.content:GetWidth(), textHeight)
	end
end

--- Layout slots vertically with gap
function EmptyStateMixin:LayoutSlots()
	local totalHeight = 0
	local topHeight = self.topSlot:GetHeight() or 0
	local bottomHeight = self.bottomSlot:GetHeight() or 0

	-- Calculate total content height
	if topHeight > 0 then
		totalHeight = totalHeight + topHeight
	end
	if bottomHeight > 0 then
		if topHeight > 0 then
			totalHeight = totalHeight + self.slotGap
		end
		totalHeight = totalHeight + bottomHeight
	end

	-- Update content container height
	self.content:SetHeight(math.max(totalHeight, 50))

	-- Position slots
	self.topSlot:ClearAllPoints()
	self.topSlot:SetPoint("TOP", self.content, "TOP", 0, 0)

	self.bottomSlot:ClearAllPoints()
	if topHeight > 0 then
		self.bottomSlot:SetPoint("TOP", self.topSlot, "BOTTOM", 0, -self.slotGap)
	else
		self.bottomSlot:SetPoint("TOP", self.content, "TOP", 0, 0)
	end
end

--- Set content for a slot
---@param slotName string "top" or "bottom"
---@param frame Frame|nil Frame to place in slot, or nil to clear
function EmptyStateMixin:SetSlot(slotName, frame)
	local slotFrame = slotName == "top" and self.topSlot or self.bottomSlot

	-- Clear existing content
	self:ClearSlot(slotName)

	if frame then
		frame:SetParent(slotFrame)
		frame:SetPoint("CENTER")
		self.slots[slotName] = frame

		-- Update slot size to match frame
		local width, height = frame:GetSize()
		if width > 0 and height > 0 then
			slotFrame:SetSize(width, height)
		end
	end

	self:LayoutSlots()
end

--- Clear a slot's content
---@param slotName string "top" or "bottom"
function EmptyStateMixin:ClearSlot(slotName)
	local existing = self.slots[slotName]
	if existing then
		if existing.Hide then
			existing:Hide()
		end
		self.slots[slotName] = nil
	end

	local slotFrame = slotName == "top" and self.topSlot or self.bottomSlot
	slotFrame:SetSize(0, 0)
end

--- Get the frame in a slot
---@param slotName string "top" or "bottom"
---@return Frame|nil
function EmptyStateMixin:GetSlot(slotName)
	return self.slots[slotName]
end

--- Update title text
---@param text string
function EmptyStateMixin:SetTitle(text)
	if self.titleText then
		self.titleText:SetText(text)
		self:LayoutSlots()
	end
end

--- Update subtitle text
---@param text string
function EmptyStateMixin:SetSubtitle(text)
	if self.subtitleText then
		self.subtitleText:SetText(text)
		self:LayoutSlots()
	end
end

--- Refresh the image (re-resolve conditional)
function EmptyStateMixin:RefreshImage()
	local topContent = self.slots.top
	if topContent and topContent.Refresh then
		topContent:Refresh()
	end
end

--- Show/hide the empty state
---@param visible boolean
function EmptyStateMixin:SetVisible(visible)
	self:SetShown(visible)
end

--------------------------------------------------------------------------------
-- Factory
--------------------------------------------------------------------------------

--- Create an empty state component
---@param parent Frame Parent frame
---@param config table Configuration { background, image, icon, title, subtitle, gap, etc }
---@return Frame emptyState
function FenUI:CreateEmptyState(parent, config)
	local empty = CreateFrame("Frame", nil, parent)
	empty:SetAllPoints()
	FenUI.Mixin(empty, EmptyStateMixin)
	empty:Init(config or {})
	return empty
end
