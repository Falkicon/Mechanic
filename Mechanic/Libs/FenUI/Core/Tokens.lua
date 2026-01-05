--------------------------------------------------------------------------------
-- FenUI v2 - Design Tokens
--
-- Three-tier design token system:
-- 1. GLOBAL (primitives) - Raw color/spacing values
-- 2. SEMANTIC (purpose-based) - Contextual meaning tokens
-- 3. COMPONENT (widget-specific) - Per-widget overrides
--
-- Themes override semantic tokens, not global primitives.
--------------------------------------------------------------------------------

local FenUI = FenUI

--------------------------------------------------------------------------------
-- Global Tokens (Primitives)
-- These are raw values that never change. Semantic tokens reference these.
--------------------------------------------------------------------------------

FenUI.Tokens = {
	-- Color primitives (raw RGBA values)
	colors = {
		-- Gold spectrum
		gold300 = { 1.0, 0.95, 0.6, 1 },
		gold400 = { 1.0, 0.9, 0.4, 1 },
		gold500 = { 1.0, 0.82, 0, 1 },
		gold600 = { 0.8, 0.65, 0, 1 },
		gold700 = { 0.6, 0.5, 0.2, 1 },

		-- Gray spectrum (dark to light)
		-- Neutral grays (lighter values)
		gray50 = { 0.98, 0.98, 0.98, 1 },
		gray100 = { 0.9, 0.9, 0.9, 1 },
		gray200 = { 0.8, 0.8, 0.8, 1 },
		gray300 = { 0.7, 0.7, 0.7, 1 },
		gray400 = { 0.6, 0.6, 0.6, 1 },
		gray500 = { 0.5, 0.5, 0.5, 1 },
		gray600 = { 0.4, 0.4, 0.4, 1 },
		gray700 = { 0.3, 0.3, 0.3, 1 },
		-- Warm grays (modern Blizzard dark mode palette)
		gray800 = { 0.23, 0.21, 0.19, 1 }, -- #3A3531 - Main panel background
		gray900 = { 0.17, 0.15, 0.14, 1 }, -- Approx #2B2724 - Inset/recessed areas
		gray950 = { 0.12, 0.11, 0.10, 1 }, -- Approx #1F1C1A - Deep inset/alternating rows

		-- Feedback colors
		red400 = { 0.9, 0.4, 0.4, 1 },
		red500 = { 0.8, 0.2, 0.2, 1 },
		red600 = { 0.6, 0.15, 0.15, 1 },

		green400 = { 0.4, 0.9, 0.4, 1 },
		green500 = { 0.2, 0.8, 0.2, 1 },
		green600 = { 0.15, 0.6, 0.15, 1 },

		blue400 = { 0.4, 0.6, 0.9, 1 },
		blue500 = { 0.2, 0.4, 0.8, 1 },
		blue600 = { 0.15, 0.3, 0.6, 1 },

		yellow400 = { 1.0, 0.9, 0.4, 1 },
		yellow500 = { 0.9, 0.8, 0.2, 1 },
		yellow600 = { 0.7, 0.6, 0.15, 1 },

		-- Special
		white = { 1, 1, 1, 1 },
		black = { 0, 0, 0, 1 },
		transparent = { 0, 0, 0, 0 },
	},

	-- Spacing primitives (in pixels)
	spacing = {
		none = 0,
		xs = 4,
		sm = 8,
		reg = 12,
		md = 16,
		lg = 24,
		xl = 32,
		xxl = 48,
	},

	-- Font primitives (WoW font object names)
	fonts = {
		heading = "GameFontNormalLarge",
		headingMed = "GameFontNormal",
		body = "GameFontNormal",
		bodySmall = "GameFontNormalSmall",
		highlight = "GameFontHighlight",
		highlightSmall = "GameFontHighlightSmall",
		disabled = "GameFontDisable",
		mono = "ChatFontNormal", -- Safe default (Arial Narrow), will be upgraded if available
	},
}

--------------------------------------------------------------------------------
-- Semantic Tokens (Purpose-Based)
-- These describe PURPOSE, not appearance. Themes override these.
--------------------------------------------------------------------------------

FenUI.Tokens.semantic = {
	-- SURFACES (backgrounds) - Modern Blizzard Dark Mode Hierarchy
	-- Based on 11.0+ Settings Panel and FlatPanelBackgroundTemplate
	surfacePanel = "gray800", -- Main panel/window backgrounds (#3A3531)
	surfaceElevated = "gray700", -- Elevated elements (dropdowns, tooltips)
	surfaceInset = "gray900", -- Inset/recessed areas (#2B2724)
	surfaceDeep = "gray950", -- Deep recessed areas, alternating rows (#1F1C1A)
	surfaceOverlay = "gray800", -- Modal overlays

	-- TEXT
	textDefault = "gray100", -- Primary readable text
	textMuted = "gray500", -- Secondary/less important text
	textDisabled = "gray600", -- Disabled state text
	textOnAccent = "gray950", -- Text on accent-colored backgrounds
	textHeading = "gold500", -- Headings and titles
	textLink = "blue400", -- Clickable links

	-- BORDERS
	borderDefault = "gray700", -- Standard borders
	borderSubtle = "gray800", -- Subtle/decorative borders
	borderFocus = "gold500", -- Focus indicators
	borderInteractive = "gray500", -- Interactive element borders
	borderSelected = "gold600", -- Selected state borders

	-- INTERACTIVE ELEMENTS (buttons, tabs, etc.)
	interactiveDefault = "gold500", -- Default interactive color
	interactiveHover = "gold400", -- Hover state
	interactiveActive = "gold600", -- Active/pressed state
	interactiveDisabled = "gray600", -- Disabled state
	interactiveSelected = "gold500", -- Selected state

	-- GRID / LISTS
	surfaceRowAlt = "gray950", -- Alternating row background (deep)
	surfaceRowHover = "gray800", -- Row hover state (Panel level)
	surfaceRowSelected = "gray700", -- Selected row state (Elevated level)

	-- FEEDBACK STATES
	feedbackSuccess = "green500", -- Success messages/states
	feedbackSuccessSubtle = "green600", -- Subtle success
	feedbackError = "red500", -- Error messages/states
	feedbackErrorSubtle = "red600", -- Subtle error
	feedbackWarning = "yellow500", -- Warning messages/states
	feedbackWarningSubtle = "yellow600", -- Subtle warning
	feedbackInfo = "blue500", -- Informational messages
	feedbackInfoSubtle = "blue600", -- Subtle info

	-- EMPTY STATE
	textEmptyTitle = "textMuted", -- Empty state title text
	textEmptySubtitle = "textDisabled", -- Empty state subtitle text

	-- IMAGE
	imageTintDefault = "white", -- Default image tint (no tint)
	imageTintMuted = "gray600", -- Muted/disabled image tint
	imagePlaceholder = "gray800", -- Placeholder background color

	-- BACKGROUND (Layout component)
	backgroundDefault = "surfacePanel", -- Default container background
	backgroundElevated = "surfaceElevated", -- Elevated/floating elements
	backgroundInset = "surfaceInset", -- Inset/recessed areas
	backgroundDeep = "surfaceDeep", -- Deep recessed areas
	backgroundCard = "surfaceElevated", -- Card components
	backgroundDialog = "surfacePanel", -- Dialog/modal windows

	-- SCROLLBAR
	surfaceScrollTrack = "gray950", -- Scroll track background
	interactiveScrollThumb = "gray600", -- Scroll thumb (normal)
	interactiveScrollThumbHover = "gray500", -- Scroll thumb (hover)

	-- SHADOW
	shadowColor = "black", -- Shadow color (inner/drop)
	shadowAlphaInner = 0.5, -- Inner shadow opacity (note: stored as number, not token)
	shadowAlphaDrop = 0.4, -- Drop shadow opacity

	-- SPACING (contextual)
	spacingPanel = "md", -- Panel internal padding
	spacingSection = "md", -- Between sections
	spacingElement = "sm", -- Between related elements
	spacingTight = "xs", -- Tight groupings (e.g., icon + label)
	spacingInset = "sm", -- Inset content padding

	-- MARGINS (external spacing)
	marginPanel = "lg", -- Space between panel border and main content
	marginContainer = "sm", -- Space between adjacent containers

	-- INSETS (internal spacing)
	insetContent = "sm", -- Standard internal padding for containers

	-- FONTS (contextual)
	fontHeading = "heading", -- Window/section headings
	fontTitle = "headingMed", -- Panel title bar text (smaller than heading)
	fontBody = "body", -- Normal body text
	fontSmall = "bodySmall", -- Small/caption text
	fontButton = "highlight", -- Button labels
	fontMono = "mono", -- Monospaced text (console, code)
}

--------------------------------------------------------------------------------
-- Border Packs (Visual Definitions)
-- Simple solid-color borders for clean, maintainable styling.
-- These use SetColorTexture instead of complex texture assets.
--------------------------------------------------------------------------------

FenUI.Tokens.borders = {
	-- Clean, sharp dark border (matches modern Blizzard Settings UI)
	ModernDark = {
		colorOnly = true, -- Use solid color borders (no texture file needed)
		edgeSize = 1, -- Visual thickness of the edge lines
		contentInset = 2, -- Space between border edge and content
		bgInset = 1, -- Space between border edge and background
		colorToken = "borderDefault", -- Token for border color
	},

	-- Recessed inset style (for inputs, scroll areas)
	Inset = {
		colorOnly = true,
		edgeSize = 1,
		contentInset = 1,
		bgInset = 0,
		colorToken = "borderSubtle",
	},

	-- No border (for borderless containers)
	None = {
		colorOnly = true,
		edgeSize = 0,
		contentInset = 0,
		bgInset = 0,
		colorToken = "transparent",
	},
}

--------------------------------------------------------------------------------
-- Layout Constants (pixel values for common UI patterns)
-- These are NOT design tokens - they're structural measurements
--------------------------------------------------------------------------------

FenUI.Tokens.layout = {
	-- Panel structure
	panelPadding = 24, -- Default internal edge padding (24px safe for Blizzard borders)
	headerHeight = 24, -- Standard Blizzard header bar height
	footerHeight = 32, -- Standard footer area height

	-- Content structure
	tabHeight = 28, -- Tab button height
	rowHeight = 24, -- Standard list row height
	iconSize = 20, -- Standard icon size
	iconSizeLarge = 32, -- Large icon size

	-- Layout margins (standard gaps from container edges)
	marginPanel = 24, -- Space from Panel border to first inner element (24px safe for Blizzard borders)
	marginInset = 8, -- Space between inset content and its border

	-- Scroll
	scrollBarWidth = 20, -- Scroll bar width
	scrollPadding = 5, -- Padding inside scroll areas

	-- Buttons
	buttonHeight = 24, -- Standard button height
	buttonHeightLarge = 32, -- Large button height
	buttonMinWidth = 80, -- Minimum button width

	-- Shadows
	shadowSizeInner = 24, -- Inner shadow edge size (Blizzard default)
	shadowSizeDrop = 16, -- Drop shadow offset/blur size
	shadowOffsetX = 4, -- Default drop shadow X offset
	shadowOffsetY = -4, -- Default drop shadow Y offset
}

--------------------------------------------------------------------------------
-- Current Theme Token Overrides
-- These are applied on top of semantic tokens when a theme is active
--------------------------------------------------------------------------------

FenUI.Tokens.currentOverrides = {}

--------------------------------------------------------------------------------
-- Token Resolution Functions
--------------------------------------------------------------------------------

--- Resolve a primitive color token to RGBA values
---@param tokenName string The color token name (e.g., "gold500")
---@return number, number, number, number r, g, b, a values
local function ResolvePrimitiveColor(tokenName)
	local color = FenUI.Tokens.colors[tokenName]
	if color then
		return color[1], color[2], color[3], color[4] or 1
	end
	-- Fallback to white if token not found
	FenUI:Debug("Unknown color token:", tokenName)
	return 1, 1, 1, 1
end

--- Resolve a spacing token to a pixel value
---@param tokenName string The spacing token name (e.g., "md")
---@return number pixels
local function ResolvePrimitiveSpacing(tokenName)
	local spacing = FenUI.Tokens.spacing[tokenName]
	if spacing then
		return spacing
	end
	FenUI:Debug("Unknown spacing token:", tokenName)
	return 0
end

--- Resolve a font token to a font object name
---@param tokenName string The font token name
---@return string fontObjectName
local function ResolvePrimitiveFont(tokenName)
	local font = FenUI.Tokens.fonts[tokenName]
	if font then
		return font
	end
	FenUI:Debug("Unknown font token:", tokenName)
	return "GameFontNormal"
end

--------------------------------------------------------------------------------
-- Public Token API
--------------------------------------------------------------------------------

--- Get a color by semantic token name
--- Resolves through: overrides -> semantic -> primitive
---@param semanticToken string The semantic token name (e.g., "surfacePanel")
---@return number, number, number, number r, g, b, a values
function FenUI:GetColor(semanticToken)
	-- Check for theme overrides first
	local primitiveToken = self.Tokens.currentOverrides[semanticToken] or self.Tokens.semantic[semanticToken]

	if primitiveToken then
		return ResolvePrimitiveColor(primitiveToken)
	end

	-- If it's already a primitive token name, resolve directly
	if self.Tokens.colors[semanticToken] then
		return ResolvePrimitiveColor(semanticToken)
	end

	FenUI:Debug("Unknown semantic color token:", semanticToken)
	return 1, 1, 1, 1
end

--- Get a color as a table {r, g, b, a}
---@param semanticToken string
---@return table color {r, g, b, a}
function FenUI:GetColorTable(semanticToken)
	local r, g, b, a = self:GetColor(semanticToken)
	return { r, g, b, a }
end

--- Get a color without alpha (for APIs like SetTextColor that expect 3 values)
---@param semanticToken string
---@return number, number, number r, g, b values
function FenUI:GetColorRGB(semanticToken)
	local r, g, b = self:GetColor(semanticToken)
	return r, g, b
end

--- Get a color as a table without alpha {r, g, b}
---@param semanticToken string
---@return table color {r, g, b}
function FenUI:GetColorTableRGB(semanticToken)
	local r, g, b = self:GetColor(semanticToken)
	return { r, g, b }
end

--- Apply a token color directly to a FontString
---@param fontString FontString The font string to color
---@param semanticToken string The color token
function FenUI:SetTextColor(fontString, semanticToken)
	if fontString and fontString.SetTextColor then
		fontString:SetTextColor(self:GetColorRGB(semanticToken))
	end
end

--- Apply a token color directly to a Texture
---@param texture Texture The texture to color
---@param semanticToken string The color token
function FenUI:SetVertexColor(texture, semanticToken)
	if texture and texture.SetVertexColor then
		texture:SetVertexColor(self:GetColor(semanticToken))
	end
end

--- Get a color as a hex string (without alpha)
---@param semanticToken string
---@return string hexColor (e.g., "ff0000")
function FenUI:GetColorHex(semanticToken)
	local r, g, b = self:GetColor(semanticToken)
	return string.format("%02x%02x%02x", r * 255, g * 255, b * 255)
end

--- Get spacing by semantic token name or raw value
---@param semanticToken string|number The semantic token name (e.g., "spacingPanel") or raw pixel value
---@return number pixels
function FenUI:GetSpacing(semanticToken)
	if type(semanticToken) == "number" then
		return semanticToken
	end

	-- Check for theme overrides first
	local primitiveToken = self.Tokens.currentOverrides[semanticToken] or self.Tokens.semantic[semanticToken]

	if primitiveToken then
		return ResolvePrimitiveSpacing(primitiveToken)
	end

	-- If it's already a primitive token name, resolve directly
	if self.Tokens.spacing[semanticToken] then
		return ResolvePrimitiveSpacing(semanticToken)
	end

	FenUI:Debug("Unknown semantic spacing token:", semanticToken)
	return 0
end

--- Get a layout constant by name
---@param layoutName string The layout constant name (e.g., "panelPadding")
---@return number pixels
function FenUI:GetLayout(layoutName)
	local value = self.Tokens.layout and self.Tokens.layout[layoutName]
	if value then
		return value
	end
	FenUI:Debug("Unknown layout constant:", layoutName)
	return 0
end

--- Get font by semantic token name
---@param semanticToken string The semantic token name (e.g., "fontHeading")
---@return string fontObjectName
function FenUI:GetFont(semanticToken)
	-- Check for theme overrides first
	local primitiveToken = self.Tokens.currentOverrides[semanticToken] or self.Tokens.semantic[semanticToken]

	if primitiveToken then
		return ResolvePrimitiveFont(primitiveToken)
	end

	-- If it's already a primitive token name, resolve directly
	if self.Tokens.fonts[semanticToken] then
		return ResolvePrimitiveFont(semanticToken)
	end

	FenUI:Debug("Unknown semantic font token:", semanticToken)
	return "GameFontNormal"
end

--- Apply token overrides (used by ThemeManager)
---@param overrides table<string, string> Token overrides (semantic -> primitive)
function FenUI:ApplyTokenOverrides(overrides)
	wipe(self.Tokens.currentOverrides)
	if overrides then
		for semantic, primitive in pairs(overrides) do
			self.Tokens.currentOverrides[semantic] = primitive
		end
	end
	FenUI:Debug("Applied token overrides:", overrides and #overrides or 0, "tokens")
end

--- Clear all token overrides
function FenUI:ClearTokenOverrides()
	wipe(self.Tokens.currentOverrides)
	FenUI:Debug("Cleared token overrides")
end

--- Get all semantic token names for a category
---@param prefix string Token prefix (e.g., "surface", "text", "border")
---@return table<string, string> tokens
function FenUI:GetTokensByPrefix(prefix)
	local tokens = {}
	for name, value in pairs(self.Tokens.semantic) do
		if name:find("^" .. prefix) then
			tokens[name] = value
		end
	end
	return tokens
end
