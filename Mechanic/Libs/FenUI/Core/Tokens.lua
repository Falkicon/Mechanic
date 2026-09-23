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

		-- Obsidian spectrum (neutral near-black, default FenUI palette)
		obsidian950 = { 0.059, 0.067, 0.075, 1 }, -- #0F1113 Inset / recessed wells
		obsidian900 = { 0.086, 0.094, 0.106, 1 }, -- #16181B Panel body
		obsidian850 = { 0.114, 0.125, 0.141, 1 }, -- #1D2024 Header strips, raised bars
		obsidian800 = { 0.133, 0.149, 0.165, 1 }, -- #22262A Controls (buttons, dropdowns)
		obsidian750 = { 0.173, 0.188, 0.208, 1 }, -- #2C3035 Default borders, control hover
		obsidian700 = { 0.200, 0.220, 0.243, 1 }, -- #33383E Interactive borders, scroll thumb
		obsidian600 = { 0.290, 0.314, 0.345, 1 }, -- #4A5058 Hover borders, thumb hover
		obsidian500 = { 0.431, 0.459, 0.486, 1 }, -- #6E757C Disabled text, placeholders
		obsidian400 = { 0.608, 0.631, 0.659, 1 }, -- #9BA1A8 Secondary text
		obsidian200 = { 0.800, 0.816, 0.831, 1 }, -- #CCD0D4 Strong secondary text
		obsidian100 = { 0.894, 0.902, 0.910, 1 }, -- #E4E6E8 Body text
		obsidian50 = { 0.957, 0.961, 0.965, 1 }, -- #F4F5F6 Headings, emphasized text

		-- Accent washes and on-accent
		goldWash10 = { 1.0, 0.82, 0, 0.10 }, -- Selected rows
		goldWash18 = { 1.0, 0.82, 0, 0.18 }, -- Selected + hover
		onGold = { 0.102, 0.078, 0, 1 }, -- #1A1400 Text on gold fills

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

		-- Overlays (translucent, work on any surface)
		whiteOverlay03 = { 1, 1, 1, 0.025 },
		whiteOverlay05 = { 1, 1, 1, 0.05 },
		whiteOverlay08 = { 1, 1, 1, 0.08 },

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

	-- Radius primitives (corner radius in UI units)
	radius = {
		none = 0,
		sm = 3,
		md = 6,
	},

	-- Font primitives (WoW font object names)
	-- The FenUIFont* objects are the type scale, created in Core/Fonts.lua
	-- (Friz Quadrata, white, drop shadow; widgets tint them with text tokens):
	--   caption 10 · small 11 · body 12 · heading 14 · title 16 · display 20
	fonts = {
		caption = "FenUIFontCaption",
		small = "FenUIFontSmall",
		body = "FenUIFontBody",
		heading = "FenUIFontHeading",
		title = "FenUIFontTitle",
		display = "FenUIFontDisplay",
		-- Legacy primitive names (kept for compatibility)
		headingMed = "FenUIFontHeading",
		bodySmall = "FenUIFontSmall",
		-- Gold variants (used by the Classic theme)
		headingGold = "GameFontNormalLarge",
		bodyGold = "GameFontNormal",
		bodySmallGold = "GameFontNormalSmall",
		highlight = "FenUIFontBody",
		highlightSmall = "FenUIFontSmall",
		disabled = "GameFontDisable",
		mono = "ChatFontNormal", -- Safe default (Arial Narrow), will be upgraded if available
	},
}

--------------------------------------------------------------------------------
-- Semantic Tokens (Purpose-Based)
-- These describe PURPOSE, not appearance. Themes override these.
--------------------------------------------------------------------------------

FenUI.Tokens.semantic = {
	-- SURFACES (backgrounds) - "Obsidian": neutral near-black elevation steps.
	-- Depth comes from lightness steps, not extra borders: inset < panel < header < control.
	surfacePanel = "obsidian900", -- Main panel/window body (#16181B)
	surfaceHeader = "obsidian850", -- Title bars, tab strips, toolbars (#1D2024)
	surfaceElevated = "obsidian800", -- Elevated elements (dropdowns, tooltips, cards)
	surfaceInset = "obsidian950", -- Inset/recessed wells: lists, inputs, scroll areas (#0F1113)
	surfaceDeep = "obsidian950", -- Deepest recess
	surfaceOverlay = "obsidian850", -- Modal overlays

	-- CONTROLS (buttons, dropdowns)
	surfaceControl = "obsidian800",
	surfaceControlHover = "obsidian750",
	surfaceControlPressed = "obsidian850",

	-- TEXT
	textDefault = "obsidian100", -- Primary readable text
	textStrong = "obsidian50", -- Emphasized text, hovered labels
	textMuted = "obsidian400", -- Secondary/less important text
	textDisabled = "obsidian500", -- Disabled state text, placeholders
	textOnAccent = "onGold", -- Text on gold fills
	textHeading = "obsidian50", -- Section headings (neutral; gold is reserved)
	textTitle = "gold500", -- Window titles (the one heading that stays gold)
	textLink = "blue400", -- Clickable links
	textDanger = "red400", -- Destructive action labels (readable on dark surfaces)

	-- BORDERS
	borderDefault = "obsidian750", -- Window frames, cards
	borderSubtle = "obsidian800", -- Dividers, inset edges (distinct from surfacePanel)
	borderFocus = "gold500", -- Focus indicators
	borderInteractive = "obsidian700", -- Control borders at rest
	borderInteractiveHover = "obsidian600", -- Control borders on hover
	borderSelected = "gold600", -- Selected state borders

	-- INTERACTIVE ELEMENTS
	-- Gold is the accent: use it for the one thing that matters (selection, focus,
	-- primary action), not for every label.
	interactiveDefault = "gold500", -- Accent (selected tab, checkmark, primary fill)
	interactiveHover = "gold400", -- Accent hover
	interactiveActive = "gold600", -- Accent pressed
	interactiveDisabled = "obsidian500", -- Disabled state
	interactiveSelected = "gold500", -- Selected state

	-- GRID / LISTS
	surfaceRowAlt = "whiteOverlay03", -- Alternating row tint (translucent)
	surfaceRowHover = "whiteOverlay05", -- Row hover (translucent so it reads on any surface)
	surfaceRowSelected = "goldWash10", -- Selected row wash (pair with accentBar)
	surfaceRowSelectedHover = "goldWash18", -- Selected row under the cursor
	accentBar = "gold500", -- 2px leading edge on selected rows

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
	imageTintMuted = "obsidian500", -- Muted/disabled image tint
	imagePlaceholder = "obsidian800", -- Placeholder background color

	-- BACKGROUND (Layout component)
	backgroundDefault = "surfacePanel", -- Default container background
	backgroundElevated = "surfaceElevated", -- Elevated/floating elements
	backgroundInset = "surfaceInset", -- Inset/recessed areas
	backgroundDeep = "surfaceDeep", -- Deep recessed areas
	backgroundCard = "surfaceElevated", -- Card components
	backgroundDialog = "surfacePanel", -- Dialog/modal windows

	-- SCROLLBAR
	surfaceScrollTrack = "transparent", -- Scroll track background (thin thumb floats on the surface)
	interactiveScrollThumb = "obsidian700", -- Scroll thumb (normal)
	interactiveScrollThumbHover = "obsidian600", -- Scroll thumb (hover/drag)

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

	-- FONTS (type scale) - pick by role, not by size:
	fontCaption = "caption", -- 10: metadata, counts, timestamps
	fontSmall = "small", -- 11: dense lists, secondary text, form labels, status bars
	fontBody = "body", -- 12: default text, inputs
	fontButton = "body", -- 12: button and tab labels
	fontHeading = "heading", -- 14: section headings, window title
	fontWindowTitle = "heading", -- 14: panel title bar (gold via textTitle)
	fontTitle = "title", -- 16: page/panel titles ("Select a test")
	fontDisplay = "display", -- 20: hero text (an API name, a big number)
	fontMono = "mono", -- Monospaced/data text (console, code)

	-- RADIUS
	radiusControl = "sm", -- Buttons, inputs, dropdowns, chips, checkboxes
	radiusContainer = "md", -- Windows, cards, dialogs
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
		radius = "radiusContainer", -- Rounded window/card corners
	},

	-- Rounded card (bordered container on a panel)
	Card = {
		colorOnly = true,
		edgeSize = 1,
		contentInset = 2,
		bgInset = 1,
		colorToken = "borderSubtle",
		radius = "radiusContainer",
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
	scrollBarWidth = 14, -- Scroll bar gutter width
	scrollThumbWidth = 6, -- Visible thumb width (centered in the gutter)
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

--- Follow a token through theme overrides and semantic aliases until it names
--- a primitive. Semantic tokens may point at other semantic tokens
--- (e.g. textEmptyTitle -> textMuted -> gray500); themes override any link.
---@param token string
---@param primitives table The primitive table to resolve into (colors/spacing/fonts)
---@return string|nil primitiveName
local function ResolveTokenChain(token, primitives)
	local overrides = FenUI.Tokens.currentOverrides
	local semantic = FenUI.Tokens.semantic
	local current = token
	for _ = 1, 8 do -- Depth guard against accidental cycles
		local nextToken = overrides[current] or semantic[current]
		if nextToken == nil or type(nextToken) ~= "string" then
			break
		end
		current = nextToken
		if primitives[current] ~= nil and overrides[current] == nil and semantic[current] == nil then
			break
		end
	end
	if primitives[current] ~= nil then
		return current
	end
	return nil
end

--------------------------------------------------------------------------------
-- Public Token API
--------------------------------------------------------------------------------

--- Get a color by semantic token name
--- Resolves through: overrides -> semantic -> primitive
---@param semanticToken string The semantic token name (e.g., "surfacePanel")
---@return number, number, number, number r, g, b, a values
function FenUI:GetColor(semanticToken)
	local primitiveToken = ResolveTokenChain(semanticToken, self.Tokens.colors)
	if primitiveToken then
		return ResolvePrimitiveColor(primitiveToken)
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
	return string.format("%02x%02x%02x", math.floor(r * 255 + 0.5), math.floor(g * 255 + 0.5), math.floor(b * 255 + 0.5))
end

--- Get spacing by semantic token name or raw value
---@param semanticToken string|number The semantic token name (e.g., "spacingPanel") or raw pixel value
---@return number pixels
function FenUI:GetSpacing(semanticToken)
	if type(semanticToken) == "number" then
		return semanticToken
	end

	local primitiveToken = ResolveTokenChain(semanticToken, self.Tokens.spacing)
	if primitiveToken then
		return ResolvePrimitiveSpacing(primitiveToken)
	end

	FenUI:Debug("Unknown semantic spacing token:", semanticToken)
	return 0
end

--- Get a corner radius (UI units) by token or raw number
---@param token string|number e.g. "radiusControl", "md", or 4
---@return number
function FenUI:GetRadius(token)
	if type(token) == "number" then
		return token
	end
	local primitiveToken = ResolveTokenChain(token, self.Tokens.radius)
	if primitiveToken then
		return self.Tokens.radius[primitiveToken]
	end
	FenUI:Debug("Unknown radius token:", token)
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
	local primitiveToken = ResolveTokenChain(semanticToken, self.Tokens.fonts)
	if primitiveToken then
		return ResolvePrimitiveFont(primitiveToken)
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
	local count = 0
	for _ in pairs(self.Tokens.currentOverrides) do
		count = count + 1
	end
	FenUI:Debug("Applied token overrides:", count, "tokens")
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
