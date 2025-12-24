--------------------------------------------------------------------------------
-- FenUI v2 - Buttons Widget
-- 
-- Themed button creation with:
-- - Standard buttons
-- - Close buttons
-- - Lifecycle hooks (onClick, onEnter, onLeave)
--------------------------------------------------------------------------------

local FenUI = FenUI

--------------------------------------------------------------------------------
-- Button Mixin
--------------------------------------------------------------------------------

local ButtonMixin = {}

function ButtonMixin:Init(config)
    self.config = config or {}
    self.hooks = {
        onClick = config.onClick,
        onEnter = config.onEnter,
        onLeave = config.onLeave,
    }
    
    -- Set up text
    if config.text then
        self:SetText(config.text)
    end
    
    -- Set size
    if config.width then
        self:SetWidth(config.width)
    end
    if config.height then
        self:SetHeight(config.height)
    end
    
    -- Apply initial visual
    self:UpdateVisual()
end

function ButtonMixin:UpdateVisual()
    local textObj = self:GetFontString()
    if not textObj then return end
    
    if not self:IsEnabled() then
        local r, g, b = FenUI:GetColor("interactiveDisabled")
        textObj:SetTextColor(r, g, b)
    else
        local r, g, b = FenUI:GetColor("interactiveDefault")
        textObj:SetTextColor(r, g, b)
    end
end

function ButtonMixin:SetOnClick(callback)
    self.hooks.onClick = callback
end

function ButtonMixin:SetOnEnter(callback)
    self.hooks.onEnter = callback
end

function ButtonMixin:SetOnLeave(callback)
    self.hooks.onLeave = callback
end

--------------------------------------------------------------------------------
-- Button Factory
--------------------------------------------------------------------------------

--- Create a themed button
---@param parent Frame Parent frame
---@param config table|string Configuration table or just text
---@return Button button
function FenUI:CreateButton(parent, config)
    -- Allow simple string as text
    if type(config) == "string" then
        config = { text = config }
    end
    config = config or {}
    
    -- Create button with template
    local button = CreateFrame("Button", config.name, parent, "UIPanelButtonTemplate")
    
    -- Apply mixin
    FenUI.Mixin(button, ButtonMixin)
    
    -- Set default size
    button:SetSize(config.width or 100, config.height or 24)
    
    -- Initialize
    button:Init(config)
    
    -- Set up scripts
    button:SetScript("OnClick", function(self, mouseButton, down)
        if self.hooks.onClick then
            self.hooks.onClick(self, mouseButton, down)
        end
    end)
    
    button:HookScript("OnEnter", function(self)
        if self:IsEnabled() then
            local textObj = self:GetFontString()
            if textObj then
                local r, g, b = FenUI:GetColor("interactiveHover")
                textObj:SetTextColor(r, g, b)
            end
        end
        if self.hooks.onEnter then
            self.hooks.onEnter(self)
        end
    end)
    
    button:HookScript("OnLeave", function(self)
        self:UpdateVisual()
        if self.hooks.onLeave then
            self.hooks.onLeave(self)
        end
    end)
    
    button:HookScript("OnMouseDown", function(self)
        if self:IsEnabled() then
            local textObj = self:GetFontString()
            if textObj then
                local r, g, b = FenUI:GetColor("interactiveActive")
                textObj:SetTextColor(r, g, b)
            end
        end
    end)
    
    button:HookScript("OnMouseUp", function(self)
        if self:IsMouseOver() and self:IsEnabled() then
            local textObj = self:GetFontString()
            if textObj then
                local r, g, b = FenUI:GetColor("interactiveHover")
                textObj:SetTextColor(r, g, b)
            end
        else
            self:UpdateVisual()
        end
    end)
    
    return button
end

--------------------------------------------------------------------------------
-- Close Button Factory
--------------------------------------------------------------------------------

--- Create a close button
---@param parent Frame Parent frame
---@param config table|nil Configuration
---@return Button closeButton
function FenUI:CreateCloseButton(parent, config)
    config = config or {}
    
    local button = CreateFrame("Button", config.name, parent, "UIPanelCloseButton")
    
    -- Position
    if config.point then
        button:SetPoint(unpack(config.point))
    else
        button:SetPoint("TOPRIGHT", config.xOffset or -2, config.yOffset or -2)
    end
    
    -- Set up click handler
    if config.onClose then
        button:SetScript("OnClick", function()
            config.onClose()
        end)
    elseif parent then
        button:SetScript("OnClick", function()
            parent:Hide()
        end)
    end
    
    return button
end

--------------------------------------------------------------------------------
-- Icon Button Factory
--------------------------------------------------------------------------------

--- Create an icon button (no text, just icon)
---@param parent Frame Parent frame
---@param config table Configuration
---@return Button iconButton
function FenUI:CreateIconButton(parent, config)
    config = config or {}
    
    local button = CreateFrame("Button", config.name, parent)
    button:SetSize(config.size or 24, config.size or 24)
    
    -- Create icon texture
    button.icon = button:CreateTexture(nil, "ARTWORK")
    button.icon:SetAllPoints()
    if config.icon then
        button.icon:SetTexture(config.icon)
    end
    if config.atlas then
        button.icon:SetAtlas(config.atlas)
    end
    
    -- Create highlight
    button.highlight = button:CreateTexture(nil, "HIGHLIGHT")
    button.highlight:SetAllPoints()
    button.highlight:SetColorTexture(1, 1, 1, 0.2)
    
    -- Set up click handler
    if config.onClick then
        button:SetScript("OnClick", function(self, mouseButton, down)
            config.onClick(self, mouseButton, down)
        end)
    end
    
    -- Tooltip
    if config.tooltip then
        button:SetScript("OnEnter", function(self)
            GameTooltip:SetOwner(self, "ANCHOR_RIGHT")
            GameTooltip:SetText(config.tooltip)
            GameTooltip:Show()
        end)
        button:SetScript("OnLeave", function()
            GameTooltip:Hide()
        end)
    end
    
    return button
end

--------------------------------------------------------------------------------
-- Checkbox Factory
--------------------------------------------------------------------------------

local CheckboxMixin = {}

function CheckboxMixin:SetChecked(checked)
    self.checked = checked
    self.checkmark:SetShown(checked)
    if self.hooks.onChange then
        self.hooks.onChange(self, checked)
    end
end

function CheckboxMixin:GetChecked()
    return self.checked
end

function CheckboxMixin:Toggle()
    self:SetChecked(not self.checked)
end

function CheckboxMixin:SetLabel(text)
    self.label:SetText(text)
end

--- Create a checkbox
---@param parent Frame Parent frame
---@param config table Configuration
---@return Frame checkbox
function FenUI:CreateCheckbox(parent, config)
    config = config or {}
    
    local checkbox = CreateFrame("Frame", config.name, parent)
    FenUI.Mixin(checkbox, CheckboxMixin)
    
    checkbox.hooks = {
        onChange = config.onChange,
    }
    checkbox.checked = config.checked or false
    
    -- Box
    checkbox.box = CreateFrame("Button", nil, checkbox)
    checkbox.box:SetSize(16, 16)
    checkbox.box:SetPoint("LEFT")
    
    -- Box background
    checkbox.boxBg = checkbox.box:CreateTexture(nil, "BACKGROUND")
    checkbox.boxBg:SetAllPoints()
    checkbox.boxBg:SetColorTexture(FenUI:GetColor("surfaceInset"))
    
    -- Box border
    checkbox.boxBorder = checkbox.box:CreateTexture(nil, "BORDER")
    checkbox.boxBorder:SetAllPoints()
    checkbox.boxBorder:SetColorTexture(FenUI:GetColor("borderInteractive"))
    checkbox.boxBorder:SetDrawLayer("BORDER", 1)
    
    -- Checkmark
    checkbox.checkmark = checkbox.box:CreateFontString(nil, "OVERLAY")
    checkbox.checkmark:SetFontObject("GameFontNormal")
    checkbox.checkmark:SetText("✓")
    checkbox.checkmark:SetPoint("CENTER", 0, 1)
    local r, g, b = FenUI:GetColor("interactiveDefault")
    checkbox.checkmark:SetTextColor(r, g, b)
    checkbox.checkmark:SetShown(checkbox.checked)
    
    -- Label
    checkbox.label = checkbox:CreateFontString(nil, "OVERLAY")
    checkbox.label:SetFontObject(FenUI:GetFont("fontBody"))
    checkbox.label:SetPoint("LEFT", checkbox.box, "RIGHT", 6, 0)
    local tr, tg, tb = FenUI:GetColor("textDefault")
    checkbox.label:SetTextColor(tr, tg, tb)
    if config.label then
        checkbox.label:SetLabel(config.label)
    end
    
    -- Size
    checkbox:SetHeight(20)
    if config.width then
        checkbox:SetWidth(config.width)
    else
        checkbox:SetWidth(200)
    end
    
    -- Click handler
    checkbox.box:SetScript("OnClick", function()
        checkbox:Toggle()
    end)
    
    -- Hover effect
    checkbox.box:SetScript("OnEnter", function()
        local hr, hg, hb = FenUI:GetColor("interactiveHover")
        checkbox.boxBorder:SetColorTexture(hr, hg, hb, 1)
    end)
    
    checkbox.box:SetScript("OnLeave", function()
        local br, bg, bb = FenUI:GetColor("borderInteractive")
        checkbox.boxBorder:SetColorTexture(br, bg, bb, 1)
    end)
    
    return checkbox
end

--------------------------------------------------------------------------------
-- Export Mixins
--------------------------------------------------------------------------------

FenUI.ButtonMixin = ButtonMixin
FenUI.CheckboxMixin = CheckboxMixin
