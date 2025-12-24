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
    self:SetScript("OnSizeChanged", function(_, width)
        self.editBox:SetWidth(width - 30)
    end)
    
    -- Click to focus
    self:SetScript("OnMouseDown", function()
        self.editBox:SetFocus()
    end)
    
    -- Auto-scroll to bottom on text change (optional)
    self.editBox:SetScript("OnTextChanged", function(eb)
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
    self.editBox:SetText(text or "")
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

function MultiLineEditBoxMixin:SetReadOnly(readOnly)
    self.editBox:SetEnabled(not readOnly)
    -- Even when "disabled", we want it to be selectable.
    -- Native EditBox:SetEnabled(false) makes it non-selectable.
    -- Instead, we use a script to prevent typing.
    if readOnly then
        self.editBox:SetScript("OnChar", function() return end)
        self.editBox:SetScript("OnKeyDown", function(_, key)
            if key == "C" and IsControlKeyDown() then
                -- Allow Ctrl+C
                return
            elseif key == "A" and IsControlKeyDown() then
                -- Allow Ctrl+A
                self:SelectAll()
                return
            end
        end)
    else
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

