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
    
    -- Create scroll frame
    self.scrollFrame = CreateFrame("ScrollFrame", nil, self, "UIPanelScrollFrameTemplate")
    self.scrollFrame:SetPoint("TOPLEFT", 4, -4)
    self.scrollFrame:SetPoint("BOTTOMRIGHT", -26, 4)
    
    -- Create edit box
    self.editBox = CreateFrame("EditBox", nil, self.scrollFrame)
    self.editBox:SetMultiLine(true)
    self.editBox:SetMaxLetters(0)
    self.editBox:SetFontObject(FenUI:GetFont("fontMono") or "ChatFontNormal")
    self.editBox:SetWidth(self.scrollFrame:GetWidth())
    self.editBox:SetHeight(self.scrollFrame:GetHeight())
    self.editBox:SetAutoFocus(false)
    
    self.scrollFrame:SetScrollChild(self.editBox)
    
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
    self:SetScript("OnSizeChanged", function(_, width, height)
        self.editBox:SetWidth(width - 30)
        -- NOTE: We no longer set EditBox height manually here.
        -- In 12.0, manual height updates during interaction can break drag-selection.
        -- The UIPanelScrollFrameTemplate handles the ScrollChild's scrollable area.
    end)
    
    -- Click to focus
    self:SetScript("OnMouseDown", function()
        if not self.editBox:HasFocus() then
            self.editBox:SetFocus()
        end
    end)
    
    self.scrollFrame:SetScript("OnMouseDown", function()
        if not self.editBox:HasFocus() then
            self.editBox:SetFocus()
        end
    end)
    
    -- Auto-scroll to bottom on text change (optional)
    self.editBox:SetScript("OnTextChanged", function(eb, userInput)
        -- Read-only enforcement: revert user changes but allow programmatic updates
        if self.readOnly and userInput then
            eb:SetText(self.currentText or "")
            return
        end
        
        -- NOTE: We no longer set EditBox height manually here.
        -- This avoids the "GetTextHeight is nil" error and prevents selection breakage.

        if not self.paused then
            self.scrollFrame:SetVerticalScroll(self.scrollFrame:GetVerticalScrollRange())
        end
    end)
    
    -- Tab behavior
    self.editBox:SetScript("OnTabPressed", function(eb)
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
    self.editBox:SetText("")
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
            if key == "LSHIFT" or key == "RSHIFT" or key == "LCTRL" or key == "RCTRL" or key == "LALT" or key == "RALT" then
                return
            end

            -- Allow Ctrl+C (Copy) and Ctrl+A (Select All)
            if IsControlKeyDown() then
                if key == "C" then return end
                if key == "A" then 
                    self:SelectAll()
                    return 
                end
            end
            
            -- Allow navigation keys
            if key == "LEFT" or key == "RIGHT" or key == "UP" or key == "DOWN" or
               key == "HOME" or key == "END" or key == "PAGEUP" or key == "PAGEDOWN" or
               key == "ESCAPE" then
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
        self.label = self:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
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

