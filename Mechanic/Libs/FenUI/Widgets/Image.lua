--------------------------------------------------------------------------------
-- FenUI v2 - Image Widget
--
-- Full-featured image component with:
-- - Conditional variants (faction, class, race, spec, custom resolver)
-- - Sizing modes (fit, fill, contain, cover)
-- - Fill mode (fill = true) - stretches to parent bounds
-- - Fallback/placeholder handling
-- - Tinting with token colors
-- - Interactive handlers (onClick, onEnter, onLeave)
-- - Masking (circle, rounded, custom)
-- - Atlas texture support
--------------------------------------------------------------------------------

local FenUI = FenUI

--------------------------------------------------------------------------------
-- Built-in Condition Resolvers
--------------------------------------------------------------------------------

local CONDITION_RESOLVERS = {
	faction = function()
		return UnitFactionGroup("player") or "Neutral"
	end,
	class = function()
		return select(2, UnitClass("player"))
	end,
	race = function()
		return select(2, UnitRace("player"))
	end,
	spec = function()
		return C_SpecializationInfo.GetSpecialization() or 1
	end,
}

--------------------------------------------------------------------------------
-- Sizing Mode Implementations
--------------------------------------------------------------------------------

-- Calculate texture coords and size for sizing modes
-- Returns: width, height, texCoords (or nil for full texture)
local function CalculateSizing(mode, frameWidth, frameHeight, texWidth, texHeight)
	if not texWidth or texWidth == 0 or not texHeight or texHeight == 0 then
		return frameWidth, frameHeight, nil
	end

	local frameAspect = frameWidth / frameHeight
	local texAspect = texWidth / texHeight

	if mode == "fill" then
		-- Stretch to fill exactly (no aspect preservation)
		return frameWidth, frameHeight, nil
	elseif mode == "fit" then
		-- Scale to fit within bounds, preserve aspect, may have gaps
		if texAspect > frameAspect then
			-- Texture is wider, fit to width
			local h = frameWidth / texAspect
			return frameWidth, h, nil
		else
			-- Texture is taller, fit to height
			local w = frameHeight * texAspect
			return w, frameHeight, nil
		end
	elseif mode == "contain" then
		-- Same as fit - scale to fit, preserve aspect
		if texAspect > frameAspect then
			local h = frameWidth / texAspect
			return frameWidth, h, nil
		else
			local w = frameHeight * texAspect
			return w, frameHeight, nil
		end
	elseif mode == "cover" then
		-- Scale to cover bounds, preserve aspect, crop if needed
		if texAspect > frameAspect then
			-- Texture is wider, fit to height and crop width
			local scale = frameHeight / texHeight
			local scaledWidth = texWidth * scale
			local cropX = (scaledWidth - frameWidth) / 2 / scaledWidth
			return frameWidth, frameHeight, { cropX, 0, 1 - cropX, 1 }
		else
			-- Texture is taller, fit to width and crop height
			local scale = frameWidth / texWidth
			local scaledHeight = texHeight * scale
			local cropY = (scaledHeight - frameHeight) / 2 / scaledHeight
			return frameWidth, frameHeight, { 0, cropY, 1, 1 - cropY }
		end
	end

	-- Default: fill
	return frameWidth, frameHeight, nil
end

--------------------------------------------------------------------------------
-- Mask Textures
--------------------------------------------------------------------------------

local MASK_TEXTURES = {
	circle = "Interface\\CHARACTERFRAME\\TempPortraitAlphaMask",
	rounded = "Interface\\BUTTONS\\WHITE8X8", -- Fallback, WoW doesn't have built-in rounded
}

--------------------------------------------------------------------------------
-- Image Mixin
--------------------------------------------------------------------------------

local ImageMixin = {}

function ImageMixin:Init(config)
	self:InitImage(config)
end

function ImageMixin:InitImage(config)
	self.config = config or {}

	-- Create main texture
	if not self.texture then
		self.texture = self:CreateTexture(nil, config.drawLayer or "ARTWORK")
		self.texture:SetAllPoints()

		-- Improve sharpness for small icons
		if self.texture.SetFilterMode then
			self.texture:SetFilterMode("TRILINEAR")
		end
		if self.texture.SetTexelSnappingBias then
			self.texture:SetTexelSnappingBias(0.0)
		end
		if self.texture.SetSnapToPixelGrid then
			self.texture:SetSnapToPixelGrid(true)
		end
	end

	-- Frame sizing - fill mode vs explicit size
	if config.fill then
		-- Fill mode: anchor to all parent edges
		self:ClearAllPoints()
		self:SetPoint("TOPLEFT")
		self:SetPoint("BOTTOMRIGHT")
		self.isFillMode = true
	else
		-- Explicit size mode
		local size = config.size or 64
		local width = config.width or size
		local height = config.height or width
		self:SetSize(width, height)
		self.isFillMode = false
	end

	-- Store sizing mode
	self.sizingMode = config.sizing or "fill"

	-- Apply mask if specified
	if config.mask then
		self:SetMask(config.mask)
	end

	-- Interactive setup
	if config.onClick or config.onEnter or config.onLeave or config.tooltip then
		self:EnableMouse(true)

		if config.onClick then
			self:SetScript("OnMouseUp", function(_, button)
				if button == "LeftButton" then
					config.onClick(self)
				end
			end)
		end

		self:SetScript("OnEnter", function()
			if config.onEnter then
				config.onEnter(self)
			end
			if config.tooltip then
				GameTooltip:SetOwner(self, "ANCHOR_RIGHT")
				GameTooltip:SetText(config.tooltip)
				GameTooltip:Show()
			end
		end)

		self:SetScript("OnLeave", function()
			if config.onLeave then
				config.onLeave(self)
			end
			if config.tooltip then
				GameTooltip:Hide()
			end
		end)
	end

	-- Apply alpha
	if config.alpha then
		self.texture:SetAlpha(config.alpha)
	end

	-- Resolve and apply texture
	self:Refresh()

	-- Apply tint after texture is set
	if config.tint then
		self:SetTint(config.tint)
	end
end

--- Resolve the texture path based on condition or direct config
---@return string|nil texturePath
function ImageMixin:ResolveTexture()
	local config = self.config

	-- Conditional resolution
	if config.condition or config.resolver then
		local resolver = config.resolver

		-- Use built-in resolver if condition name provided
		if config.condition and CONDITION_RESOLVERS[config.condition] then
			resolver = CONDITION_RESOLVERS[config.condition]
		end

		if resolver and config.variants then
			local key = resolver()
			local texture = config.variants[key]

			if texture then
				return texture, false -- not atlas
			end
		end

		-- Fallback
		return config.fallback, false
	end

	-- Direct texture
	if config.texture then
		return config.texture, false
	end

	-- Atlas texture
	if config.atlas then
		return config.atlas, true
	end

	-- Fallback
	return config.fallback, false
end

--- Refresh the image (re-resolve conditional and apply)
function ImageMixin:Refresh()
	local texturePath, isAtlas = self:ResolveTexture()

	if not texturePath then
		-- No texture, hide
		self.texture:Hide()
		return
	end

	self.texture:Show()

	if isAtlas then
		self.texture:SetAtlas(texturePath)
	else
		self.texture:SetTexture(texturePath)
	end

	-- Apply sizing mode
	self:ApplySizing()
end

--- Set the sizing mode
---@param mode string "fill", "fit", "contain", "cover"
function ImageMixin:SetSizing(mode)
	self.sizingMode = mode
	self:ApplySizing()
end

--- Apply sizing mode calculations
function ImageMixin:ApplySizing()
	local frameWidth, frameHeight = self:GetSize()

	-- For now, we can't easily get texture dimensions in WoW
	-- So sizing modes are simplified:
	-- - fill: stretch to frame size
	-- - fit/contain: assume square texture, scale proportionally
	-- - cover: fill and potentially use SetTexCoord for cropping

	local mode = self.sizingMode

	if mode == "fill" then
		self.texture:SetAllPoints()
		self.texture:SetTexCoord(0, 1, 0, 1)
	elseif mode == "fit" or mode == "contain" then
		-- For custom aspect ratio handling, would need texture dimension callback
		-- Default to fill behavior
		self.texture:SetAllPoints()
		self.texture:SetTexCoord(0, 1, 0, 1)
	elseif mode == "cover" then
		self.texture:SetAllPoints()
		self.texture:SetTexCoord(0, 1, 0, 1)
	end
end

--- Set a new texture directly
---@param path string Texture path
function ImageMixin:SetTexture(path)
	self.config.texture = path
	self.config.atlas = nil
	self.config.condition = nil
	self.config.variants = nil
	self:Refresh()
end

--- Set an Atlas texture
---@param atlasName string Atlas name
function ImageMixin:SetAtlas(atlasName)
	self.config.atlas = atlasName
	self.config.texture = nil
	self.config.condition = nil
	self.config.variants = nil
	self:Refresh()
end

--- Set conditional variants
---@param condition string Condition name ("faction", "class", "race", "spec")
---@param variants table<string, string> Variant textures
function ImageMixin:SetConditional(condition, variants)
	self.config.condition = condition
	self.config.variants = variants
	self.config.texture = nil
	self.config.atlas = nil
	self:Refresh()
end

--- Apply tinting to the image
---@param tokenOrColor string|table Token name or {r, g, b, a} table
function ImageMixin:SetTint(tokenOrColor)
	if type(tokenOrColor) == "string" then
		-- Token name
		local r, g, b, a = FenUI:GetColor(tokenOrColor)
		self.texture:SetVertexColor(r, g, b, a)
	elseif type(tokenOrColor) == "table" then
		-- Direct color
		self.texture:SetVertexColor(
			tokenOrColor[1] or 1,
			tokenOrColor[2] or 1,
			tokenOrColor[3] or 1,
			tokenOrColor[4] or 1
		)
	end
end

--- Clear tinting (reset to white)
function ImageMixin:ClearTint()
	self.texture:SetVertexColor(1, 1, 1, 1)
end

--- Apply a mask to the image
---@param maskType string "circle", "rounded", or texture path
function ImageMixin:SetMask(maskType)
	local maskTexture = MASK_TEXTURES[maskType] or maskType

	if maskTexture and maskTexture ~= "Interface\\BUTTONS\\WHITE8X8" then
		-- Create mask frame if needed
		if not self.maskTexture then
			self.maskTexture = self:CreateMaskTexture()
			self.maskTexture:SetAllPoints()
		end

		self.maskTexture:SetTexture(maskTexture)
		self.texture:AddMaskTexture(self.maskTexture)
	end
end

--- Clear mask
function ImageMixin:ClearMask()
	if self.maskTexture then
		self.texture:RemoveMaskTexture(self.maskTexture)
	end
end

--- Get the underlying texture object
---@return Texture
function ImageMixin:GetTexture()
	return self.texture
end

--- Set image alpha
---@param alpha number 0-1
function ImageMixin:SetImageAlpha(alpha)
	self.texture:SetAlpha(alpha)
end

--- Set fill mode (stretch to parent bounds)
---@param enabled boolean
function ImageMixin:SetFill(enabled)
	if enabled then
		self:ClearAllPoints()
		self:SetPoint("TOPLEFT")
		self:SetPoint("BOTTOMRIGHT")
		self.isFillMode = true
	else
		-- Restore explicit size from config
		self:ClearAllPoints()
		local width = self.config.width or 64
		local height = self.config.height or width
		self:SetSize(width, height)
		self.isFillMode = false
	end
end

--- Get whether fill mode is active
---@return boolean
function ImageMixin:GetFill()
	return self.isFillMode or false
end

--------------------------------------------------------------------------------
-- Factory
--------------------------------------------------------------------------------

--- Create an image component
---@param parent Frame Parent frame
---@param config table Configuration
---@return Frame image
function FenUI:CreateImage(parent, config)
	local image = CreateFrame("Frame", nil, parent)
	FenUI.Mixin(image, ImageMixin)
	image:Init(config or {})
	return image
end

--------------------------------------------------------------------------------
-- Register Condition Resolver
--------------------------------------------------------------------------------

--- Register a custom condition resolver
---@param name string Condition name
---@param resolver function Resolver function returning a variant key
function FenUI:RegisterImageCondition(name, resolver)
	if type(resolver) == "function" then
		CONDITION_RESOLVERS[name] = resolver
	end
end

--- Get available condition names
---@return table<string, function> resolvers
function FenUI:GetImageConditions()
	local conditions = {}
	for name, _ in pairs(CONDITION_RESOLVERS) do
		table.insert(conditions, name)
	end
	return conditions
end

--------------------------------------------------------------------------------
-- Export Mixin
--------------------------------------------------------------------------------

FenUI.ImageMixin = ImageMixin
