--------------------------------------------------------------------------------
-- FenUI v2 - MultiLineEditBox Widget
--
-- Wrapper around native EditBox with multi-line and scroll support.
-- Ideal for console output and copyable text areas.
--------------------------------------------------------------------------------

local FenUI = FenUI

--------------------------------------------------------------------------------
-- MultiLineEditBox Mixin
--------------------------------------------------------------------------------

local MultiLineEditBoxMixin = {}

function MultiLineEditBoxMixin:Init(config)
	self.config = config or {}

	-- Create scroll panel
	local scrollBarWidth = FenUI:GetLayout("scrollBarWidth") or 20
	local padding = FenUI:GetSpacing("spacingTight")
	self.scrollPanel = FenUI:CreateScrollPanel(self, {
		padding = padding,
		showScrollBar = true,
	})
	self.scrollPanel:SetAllPoints()
	self.scrollFrame = self.scrollPanel.scrollFrame

	-- Create edit box
	self.editBox = CreateFrame("EditBox", nil, self.scrollFrame)
	self.editBox:SetMultiLine(true)
	self.editBox:SetMaxLetters(0)

	local fontToken = config.font or "fontBody"
	local fontObject = FenUI:GetFont(fontToken) or "ChatFontNormal"
	self.editBox:SetFontObject(fontObject)

	self.editBox:SetWidth(self.scrollFrame:GetWidth())
	self.editBox:SetAutoFocus(false)

	-- Hide the original scrollChild created by CreateScrollPanel to prevent
	-- it from intercepting mouse events (text selection) meant for the EditBox
	local originalScrollChild = self.scrollPanel.scrollChild
	if originalScrollChild and originalScrollChild ~= self.editBox then
		originalScrollChild:Hide()
		originalScrollChild:EnableMouse(false)
	end

	self.scrollFrame:SetScrollChild(self.editBox)

	-- Update ScrollPanel child reference
	self.scrollPanel.scrollChild = self.editBox

	-- Create hidden measurement font string
	self.measureFS = self:CreateFontString(nil, "ARTWORK")
	self.measureFS:Hide()
	local font, size, flags = self.editBox:GetFont()
	if font then
		self.measureFS:SetFont(font, size, flags)
		-- Match line spacing too, or wrapped text measures short and clips
		if self.editBox.GetSpacing then
			self.measureFS:SetSpacing(self.editBox:GetSpacing() or 0)
		end
	end
	self.measureFS:SetWidth(math.max(1, self.scrollFrame:GetWidth()))

	-- Helper to get text height
	function self:GetTextHeight()
		self.measureFS:SetText(self.editBox:GetText() or "")
		return self.measureFS:GetHeight()
	end

	-- Configure behavior
	if config.readOnly then
		self:SetReadOnly(true)
	end

	if config.label then
		self:SetLabel(config.label)
	end

	-- Initial text
	if config.text then
		self:SetText(config.text)
	end

	-- Handle size changes
	self:HookScript("OnSizeChanged", function(_, width, height)
		-- Match the scroll frame's real viewport (padding on both sides + scrollbar)
		local editBoxWidth = math.max(1, width - padding * 2 - scrollBarWidth)
		self.editBox:SetWidth(editBoxWidth)
		self.measureFS:SetWidth(editBoxWidth)

		-- Ensure editBox is at least as tall as the scroll frame so it's clickable
		-- and can handle text selection in empty space.
		if height and height > padding * 2 then
			self.editBox:SetHeight(math.max(height - padding * 2, self:GetTextHeight()))
		end
	end)

	-- Keep the cursor in view when navigating with arrow keys or typing
	-- past the visible area
	self.editBox:SetScript("OnCursorChanged", function(eb, _, y, _, h)
		if not eb:HasFocus() then
			return
		end
		local sf = self.scrollFrame
		local top = -y
		local bottom = top + h
		local scroll = sf:GetVerticalScroll()
		local viewHeight = sf:GetHeight()
		if top < scroll then
			sf:SetVerticalScroll(top)
		elseif bottom > scroll + viewHeight then
			sf:SetVerticalScroll(bottom - viewHeight)
		end
	end)

	-- Mouse handlers for focus
	-- TRAP: Using OnMouseDown on parent frames intercepts the event required for
	-- the native EditBox to start text selection/highlighting.
	-- SOLUTION: Use OnMouseUp on the scrollFrame to allow clicking empty space to focus.
	self.scrollFrame:SetScript("OnMouseUp", function()
		if not self.editBox:HasFocus() then
			self.editBox:SetFocus()
			self.editBox:SetCursorPosition(self.editBox:GetNumLetters())
		end
	end)

	-- Auto-scroll to bottom on text change (optional)
	self.editBox:SetScript("OnTextChanged", function(eb, userInput)
		-- Read-only enforcement: revert user changes but allow programmatic updates
		if self.readOnly and userInput then
			-- Revert without jumping the view or losing the caret
			local scroll = self.scrollFrame:GetVerticalScroll()
			local cursor = eb:GetCursorPosition()
			self.reverting = true
			eb:SetText(self.currentText or "")
			self.reverting = false
			eb:SetCursorPosition(math.min(cursor, eb:GetNumLetters()))
			self.scrollFrame:SetVerticalScroll(scroll)
			return
		end

		if not self.paused and not self.reverting then
			self.scrollFrame:SetVerticalScroll(self.scrollFrame:GetVerticalScrollRange())
		end
	end)

	-- Tab behavior
	self.editBox:SetScript("OnTabPressed", function(eb)
		-- Insert() is not user input, so the read-only revert wouldn't catch it
		if self.readOnly then
			return
		end
		eb:Insert("    ")
	end)

	-- Escape to clear focus
	self.editBox:SetScript("OnEscapePressed", function(eb)
		eb:ClearFocus()
	end)
end

function MultiLineEditBoxMixin:SetText(text)
	self.currentText = text or ""
	self.editBox:SetText(self.currentText)
end

function MultiLineEditBoxMixin:GetText()
	return self.editBox:GetText()
end

function MultiLineEditBoxMixin:Clear()
	-- Go through SetText so read-only mode doesn't restore the old text
	self:SetText("")
end

function MultiLineEditBoxMixin:SelectAll()
	self.editBox:SetFocus()
	self.editBox:HighlightText()
end

function MultiLineEditBoxMixin:ScrollToTop()
	self.scrollFrame:SetVerticalScroll(0)
end

function MultiLineEditBoxMixin:ScrollToBottom()
	self.scrollFrame:SetVerticalScroll(self.scrollFrame:GetVerticalScrollRange())
end

function MultiLineEditBoxMixin:SetReadOnly(readOnly)
	self.readOnly = readOnly

	-- Ensure the edit box is always enabled so it can receive focus for selection/copying.
	-- Native EditBox:SetEnabled(false) makes it non-selectable.
	self.editBox:SetEnabled(true)

	if readOnly then
		-- Block character input (typing)
		self.editBox:SetScript("OnChar", function() end)

		-- Handle key presses to allow navigation/copy but block modification
		self.editBox:SetScript("OnKeyDown", function(eb, key)
			-- Allow modifiers (needed for Shift+Arrow selection, Ctrl+C, etc.)
			if
				key == "LSHIFT"
				or key == "RSHIFT"
				or key == "LCTRL"
				or key == "RCTRL"
				or key == "LALT"
				or key == "RALT"
			then
				return
			end

			-- Allow Ctrl+C (Copy) and Ctrl+A (Select All)
			if IsControlKeyDown() then
				if key == "C" then
					return
				end
				if key == "A" then
					self:SelectAll()
					return
				end
			end

			-- Allow navigation keys
			if
				key == "LEFT"
				or key == "RIGHT"
				or key == "UP"
				or key == "DOWN"
				or key == "HOME"
				or key == "END"
				or key == "PAGEUP"
				or key == "PAGEDOWN"
				or key == "ESCAPE"
			then
				return
			end

			-- Block everything else (Backspace, Delete, Enter, etc.)
			eb:SetPropagateKeyboardInput(false)
		end)
	else
		-- Restore default behavior
		self.editBox:SetScript("OnChar", nil)
		self.editBox:SetScript("OnKeyDown", nil)
	end
end

function MultiLineEditBoxMixin:SetLabel(text)
	if not self.label then
		self.label = self:CreateFontString(nil, "OVERLAY", FenUI:GetFont("fontSmall"))
		self.label:SetPoint("BOTTOMLEFT", self, "TOPLEFT", 0, 2)
	end
	self.label:SetText(text)
end

--------------------------------------------------------------------------------
-- Factory
--------------------------------------------------------------------------------

--- Create a multi-line edit box with scroll support
---@param parent Frame Parent frame
---@param config table Configuration
---@return Frame editBox
function FenUI:CreateMultiLineEditBox(parent, config)
	config = config or {}

	-- We use a Layout as the container for border/background
	local container = self:CreateLayout(parent, {
		name = config.name,
		border = config.border or "Inset",
		background = config.background or "surfaceInset",
		width = config.width or 400,
		height = config.height or (config.numLines and (config.numLines * 14 + 10)) or 200,
	})

	FenUI.Mixin(container, MultiLineEditBoxMixin)
	container:Init(config)

	return container
end

FenUI.MultiLineEditBoxMixin = MultiLineEditBoxMixin
