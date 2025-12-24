--------------------------------------------------------------------------------
-- FenUI v2 - Tabs Widget
-- 
-- Tab group creation with:
-- - Config object API (simple)
-- - Builder pattern API (fluent)
-- - Lifecycle hooks (onChange, onTabCreate, onTabFocus)
-- - Support for disabled states and positioning
--------------------------------------------------------------------------------

local FenUI = FenUI

--------------------------------------------------------------------------------
-- Tab Button Mixin
--------------------------------------------------------------------------------

local TabButtonMixin = {}

function TabButtonMixin:SetSelected(selected)
    self.isSelected = selected
    self:UpdateVisual()
end

function TabButtonMixin:GetSelected()
    return self.isSelected
end

function TabButtonMixin:SetDisabled(disabled)
    self.isDisabled = disabled
    if disabled then
        self:Disable()
    else
        self:Enable()
    end
    self:UpdateVisual()
end

function TabButtonMixin:GetDisabled()
    return self.isDisabled
end

function TabButtonMixin:UpdateVisual()
    local r, g, b = FenUI:GetColorRGB("textDefault")
    
    if self.isDisabled then
        r, g, b = FenUI:GetColorRGB("interactiveDisabled")
        if self.highlight then self.highlight:Hide() end
    elseif self.isSelected then
        r, g, b = FenUI:GetColorRGB("interactiveSelected")
        if self.highlight then self.highlight:Show() end
    elseif self.isFocused then
        r, g, b = FenUI:GetColorRGB("interactiveHover")
        if self.highlight then self.highlight:Hide() end
    else
        if self.highlight then self.highlight:Hide() end
    end
    
    self.text:SetTextColor(r, g, b)
    if self.badge then
        local br, bg, bb = FenUI:GetColorRGB(self.isDisabled and "interactiveDisabled" or "feedbackSuccess")
        self.badge:SetTextColor(br, bg, bb)
    end
end

function TabButtonMixin:SetTabText(text)
    self.text:SetText(text)
    self:UpdateWidth()
end

function TabButtonMixin:UpdateWidth()
    local textWidth = self.text:GetStringWidth()
    local badgeWidth = (self.badge and self.badge:IsShown()) and (self.badge:GetStringWidth() + 6) or 0
    self:SetWidth(textWidth + badgeWidth + 24)
end

function TabButtonMixin:SetBadge(text)
    if not self.badge then
        self.badge = self:CreateFontString(nil, "OVERLAY")
        self.badge:SetFontObject(FenUI:GetFont("fontSmall"))
        self.badge:SetPoint("LEFT", self.text, "RIGHT", 4, 0)
        local r, g, b = FenUI:GetColorRGB("feedbackSuccess")
        self.badge:SetTextColor(r, g, b)
    end
    
    if text then
        self.badge:SetText(text)
        self.badge:Show()
    else
        self.badge:Hide()
    end
    
    self:UpdateWidth()
end

function TabButtonMixin:GetBadge()
    return self.badge and self.badge:GetText()
end

--------------------------------------------------------------------------------
-- Tab Group Mixin
--------------------------------------------------------------------------------

local TabGroupMixin = {}

function TabGroupMixin:Init(config)
    self.config = config or {}
    self.tabs = {}
    self.tabOrder = {}
    self.selectedKey = nil
    self.hooks = {
        onChange = config.onChange,
        onTabCreate = config.onTabCreate,
        onTabFocus = config.onTabFocus,
    }
    
    -- Create tabs from config
    if config.tabs then
        for _, tabDef in ipairs(config.tabs) do
            local tab = self:AddTab(tabDef.key, tabDef.text, tabDef.icon)
            if tabDef.disabled then
                tab:SetDisabled(true)
            end
        end
    end
    
    -- Select first tab by default
    if #self.tabOrder > 0 and not self.selectedKey then
        -- Find first non-disabled tab
        for _, key in ipairs(self.tabOrder) do
            if not self.tabs[key].isDisabled then
                self:Select(key)
                break
            end
        end
    end
end

function TabGroupMixin:AddTab(key, text, icon)
    if self.tabs[key] then
        FenUI:Debug("Tab already exists:", key)
        return self.tabs[key]
    end
    
    local tab = CreateFrame("Button", nil, self)
    FenUI.Mixin(tab, TabButtonMixin)
    
    tab.key = key
    
    -- Create text
    tab.text = tab:CreateFontString(nil, "OVERLAY")
    tab.text:SetFontObject(FenUI:GetFont("fontButton"))
    tab.text:SetPoint("CENTER")
    
    -- Create highlight/underline
    tab.highlight = tab:CreateTexture(nil, "HIGHLIGHT")
    tab.highlight:SetColorTexture(FenUI:GetColorRGB("interactiveSelected"))
    tab.highlight:SetHeight(2)
    
    -- Position highlight based on group position
    if self.config.position == "bottom" then
        tab.highlight:SetPoint("TOPLEFT", 4, 0)
        tab.highlight:SetPoint("TOPRIGHT", -4, 0)
    else
        tab.highlight:SetPoint("BOTTOMLEFT", 4, 0)
        tab.highlight:SetPoint("BOTTOMRIGHT", -4, 0)
    end
    tab.highlight:Hide()
    
    -- Scripts
    tab:SetScript("OnClick", function()
        self:Select(key)
    end)
    
    tab:SetScript("OnEnter", function(btn)
        if not btn.isDisabled and not btn.isSelected then
            local r, g, b = FenUI:GetColorRGB("interactiveHover")
            btn.text:SetTextColor(r, g, b)
        end
    end)
    
    tab:SetScript("OnLeave", function(btn)
        btn:UpdateVisual()
    end)
    
    -- Focus support
    tab:SetScript("OnReceiveDrag", function()
        self:SetFocus(key)
    end)
    
    -- Set text and size
    tab:SetTabText(text)
    tab:SetHeight(self.config.height or 28)
    
    -- Store
    self.tabs[key] = tab
    table.insert(self.tabOrder, key)
    
    -- Update layout
    self:RepositionTabs()
    
    -- Fire hook
    if self.hooks.onTabCreate then
        self.hooks.onTabCreate(tab, key)
    end
    
    return tab
end

function TabGroupMixin:SetTabDisabled(key, disabled)
    local tab = self.tabs[key]
    if tab then
        tab:SetDisabled(disabled)
    end
end

function TabGroupMixin:SetTabVisible(key, visible)
    local tab = self.tabs[key]
    if tab then
        tab:SetShown(visible)
        self:RepositionTabs()
    end
end

function TabGroupMixin:SetTabBadge(key, text)
    local tab = self.tabs[key]
    if tab then
        tab:SetBadge(text)
        self:RepositionTabs()
    end
end

function TabGroupMixin:RepositionTabs()
    local prevTab = nil
    local spacing = FenUI:GetSpacing("spacingElement")
    
    for _, key in ipairs(self.tabOrder) do
        local tab = self.tabs[key]
        if tab:IsShown() then
            tab:ClearAllPoints()
            if prevTab then
                tab:SetPoint("LEFT", prevTab, "RIGHT", spacing, 0)
            else
                tab:SetPoint("LEFT", 0, 0)
            end
            prevTab = tab
        end
    end
end

function TabGroupMixin:Select(key)
    local tab = self.tabs[key]
    if not tab or tab.isDisabled then
        return
    end
    
    local previousKey = self.selectedKey
    self.selectedKey = key
    
    -- Update all tabs
    for k, t in pairs(self.tabs) do
        t:SetSelected(k == key)
    end
    
    -- Fire callback
    if self.hooks.onChange and key ~= previousKey then
        self.hooks.onChange(key, previousKey)
    end
end

-- Alias for backward compatibility and idiomatic naming
function TabGroupMixin:SelectTab(key)
    self:Select(key)
end

function TabGroupMixin:SetFocus(key)
    for k, t in pairs(self.tabs) do
        t.isFocused = (k == key)
        t:UpdateVisual()
    end
    if self.hooks.onTabFocus then
        self.hooks.onTabFocus(key)
    end
end

function TabGroupMixin:GetSelected()
    return self.selectedKey
end

function TabGroupMixin:GetTab(key)
    return self.tabs[key]
end

function TabGroupMixin:GetTabs()
    return self.tabs
end

--------------------------------------------------------------------------------
-- Factory
--------------------------------------------------------------------------------

--- Create a tab group
---@param parent Frame Parent frame
---@param config table Configuration { tabs, position, height, onChange, etc }
---@return Frame tabGroup
function FenUI:CreateTabGroup(parent, config)
    config = config or {}
    
    local tabGroup = CreateFrame("Frame", config.name, parent)
    FenUI.Mixin(tabGroup, TabGroupMixin)
    
    tabGroup:SetHeight(config.height or 32)
    if config.width then
        tabGroup:SetWidth(config.width)
    end
    
    tabGroup:Init(config)
    
    return tabGroup
end

--------------------------------------------------------------------------------
-- Builder
--------------------------------------------------------------------------------

local TabGroupBuilder = {}
TabGroupBuilder.__index = TabGroupBuilder

function TabGroupBuilder:new(parent)
    local builder = setmetatable({}, TabGroupBuilder)
    builder._parent = parent
    builder._config = { tabs = {} }
    return builder
end

function TabGroupBuilder:name(name)
    self._config.name = name
    return self
end

function TabGroupBuilder:position(pos)
    self._config.position = pos
    return self
end

function TabGroupBuilder:height(h)
    self._config.height = h
    return self
end

function TabGroupBuilder:tab(key, text, icon, disabled)
    table.insert(self._config.tabs, { key = key, text = text, icon = icon, disabled = disabled })
    return self
end

function TabGroupBuilder:onChange(callback)
    self._config.onChange = callback
    return self
end

function TabGroupBuilder:build()
    return FenUI:CreateTabGroup(self._parent, self._config)
end

function FenUI.TabGroup(parent)
    return TabGroupBuilder:new(parent)
end

--------------------------------------------------------------------------------
-- Export Mixins
--------------------------------------------------------------------------------

FenUI.TabButtonMixin = TabButtonMixin
FenUI.TabGroupMixin = TabGroupMixin
