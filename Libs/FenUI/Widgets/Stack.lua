--------------------------------------------------------------------------------
-- FenUI v2 - Stack/Flex Layout Widget
-- 
-- A Flexbox-inspired layout system that provides declarative horizontal 
-- and vertical stacking with alignment, justification, gap control, 
-- and optional wrapping.
--------------------------------------------------------------------------------

local FenUI = FenUI

--------------------------------------------------------------------------------
-- Constants and Helpers
--------------------------------------------------------------------------------

local ALIGN_MAP = {
    start = "START",
    center = "CENTER",
    ["end"] = "END",
    stretch = "STRETCH",
}

local JUSTIFY_MAP = {
    start = "START",
    center = "CENTER",
    ["end"] = "END",
    ["space-between"] = "SPACE_BETWEEN",
    ["space-around"] = "SPACE_AROUND",
}

--------------------------------------------------------------------------------
-- Stack Mixin
--------------------------------------------------------------------------------

local StackMixin = {}

function StackMixin:Init(config)
    self.config = config or {}
    self.children = {}
    
    -- Core properties
    self.direction = config.direction or "vertical"
    self.gap = config.gap or 0
    self.align = config.align or "start"
    self.justify = config.justify or "start"
    self.wrap = config.wrap or false
    self.rowGap = config.rowGap or self.gap
    
    -- Initialize Layout layers (inherited via factory)
    if self.InitLayout then
        self:InitLayout(config)
    end
    
    -- Hook for layout updates
    -- We use a wrapper to ensure we don't break Layout's own OnSizeChanged
    -- which is responsible for updating background anchors.
    self:HookScript("OnSizeChanged", function()
        self:Layout()
    end)
    
    -- If children were provided in config, add them
    if config.children then
        for _, child in ipairs(config.children) do
            if type(child) == "table" and child.frame then
                self:AddChild(child.frame, child.config)
            else
                self:AddChild(child)
            end
        end
    end
end

--- Add a child to the stack
---@param frame Frame The child frame
---@param config table|nil Optional child-level overrides (align, grow, shrink)
function StackMixin:AddChild(frame, config)
    if not frame then return end
    
    local childData = {
        frame = frame,
        config = config or {},
    }
    
    table.insert(self.children, childData)
    
    -- Ensure parent is set directly to self (the stack container)
    -- This avoids coordinate system confusion with Layout's internal contentFrame.
    frame:SetParent(self)
    
    -- Auto-show children when added to a stack
    frame:Show()
    
    -- Hook child size and visibility changes
    if not frame.stackHooked then
        frame:HookScript("OnSizeChanged", function()
            if self.Layout then self:Layout() end
        end)
        frame:HookScript("OnShow", function()
            if self.Layout then self:Layout() end
        end)
        frame:HookScript("OnHide", function()
            if self.Layout then self:Layout() end
        end)
        frame.stackHooked = true
    end
    
    self:Layout()
end

--- Remove a child from the stack
---@param frame Frame
function StackMixin:RemoveChild(frame)
    for i, childData in ipairs(self.children) do
        if childData.frame == frame then
            table.remove(self.children, i)
            break
        end
    end
    self:Layout()
end

--- Clear all children
function StackMixin:ClearChildren()
    self.children = {}
    self:Layout()
end

--- Calculate positions and sizes for all children
function StackMixin:Layout()
    if self.isLayouting or #self.children == 0 then return end
    self.isLayouting = true
    
    local isVertical = self.direction == "vertical"
    local gap = self:ResolveGap(self.gap)
    local rowGap = self:ResolveGap(self.rowGap)
    local padding = self.GetPadding and self:GetPadding() or { top = 0, bottom = 0, left = 0, right = 0 }
    
    -- Use config values as primary source of truth for size to avoid 0-size measurement 
    -- issues before the UI engine has fully resolved the frame.
    local initialWidth = tonumber(self.config.width) or self:GetWidth()
    local initialHeight = tonumber(self.config.height) or self:GetHeight()
    
    local totalWidth = initialWidth - (padding.left + padding.right)
    local totalHeight = initialHeight - (padding.top + padding.bottom)
    
    -- Measure Phase: Collect visible children and their sizes
    local childrenToLayout = {}
    local maxCrossSize = 0
    local totalMainSize = 0
    local needsDeferredLayout = false

    for _, childData in ipairs(self.children) do
        local frame = childData.frame
        if frame:IsShown() then
            local w, h = frame:GetSize()
            
            -- If child has 0 size, try to get its intrinsic size if it's a FenUI widget
            if w <= 0 then
                if frame.GetWidth and frame:GetWidth() > 0 then w = frame:GetWidth()
                elseif frame.config and frame.config.width and tonumber(frame.config.width) then w = tonumber(frame.config.width)
                elseif frame:IsObjectType("Button") then w = 100 -- Default button width
                else needsDeferredLayout = true
                end
            end
            
            if h <= 0 then
                if frame.GetHeight and frame:GetHeight() > 0 then h = frame:GetHeight()
                elseif frame.config and frame.config.height and tonumber(frame.config.height) then h = tonumber(frame.config.height)
                elseif frame:IsObjectType("Button") then h = 24 -- Default button height
                else needsDeferredLayout = true
                end
            end

            table.insert(childrenToLayout, {
                frame = frame,
                config = childData.config,
                width = w,
                height = h,
            })
            
            if isVertical then
                maxCrossSize = math.max(maxCrossSize, w)
                totalMainSize = totalMainSize + h
            else
                maxCrossSize = math.max(maxCrossSize, h)
                totalMainSize = totalMainSize + w
            end
        end
    end
    
    -- If we have children with 0 size and no fallback, defer layout for one frame
    if needsDeferredLayout and not self.hasDeferredOnce then
        self.hasDeferredOnce = true
        C_Timer.After(0, function()
            self.isLayouting = nil
            self:Layout()
        end)
        self.isLayouting = nil
        return
    end
    
    local numChildren = #childrenToLayout
    if numChildren == 0 then 
        self.isLayouting = nil
        return 
    end
    
    totalMainSize = totalMainSize + (gap * (numChildren - 1))

    -- Auto-sizing support: If container has no size, shrink-wrap to content
    local isAutoWidth = self.config.width == "auto" or (not self.config.width and initialWidth <= 0)
    local isAutoHeight = self.config.height == "auto" or (not self.config.height and initialHeight <= 0)

    if isVertical then
        if isAutoHeight then 
            totalHeight = totalMainSize
            self:SetHeight(totalHeight + padding.top + padding.bottom)
        end
        if isAutoWidth then
            totalWidth = maxCrossSize
            self:SetWidth(totalWidth + padding.left + padding.right)
        end
    else
        if isAutoWidth then
            totalWidth = totalMainSize
            self:SetWidth(totalWidth + padding.left + padding.right)
        end
        if isAutoHeight then
            totalHeight = maxCrossSize
            self:SetHeight(totalHeight + padding.top + padding.bottom)
        end
    end

    -- Skip actual positioning if we still don't have valid dimensions
    if totalWidth <= 0 or totalHeight <= 0 then 
        self.isLayouting = nil
        return 
    end

    if self.wrap then
        self:LayoutWrapped(childrenToLayout, totalWidth, totalHeight, padding, gap, rowGap, isVertical)
    else
        self:LayoutStandard(childrenToLayout, totalWidth, totalHeight, padding, gap, isVertical)
    end
    
    self.isLayouting = nil
end

function StackMixin:LayoutStandard(childrenToLayout, totalWidth, totalHeight, padding, gap, isVertical)
    local numChildren = #childrenToLayout
    local totalFixedSize = 0
    local totalGrow = 0
    
    for _, layoutData in ipairs(childrenToLayout) do
        local grow = layoutData.config.grow or 0
        if grow == 0 then
            totalFixedSize = totalFixedSize + (isVertical and layoutData.height or layoutData.width)
        end
        totalGrow = totalGrow + grow
    end
    
    totalFixedSize = totalFixedSize + (gap * (numChildren - 1))
    
    local availableSize = (isVertical and totalHeight or totalWidth)
    local remainingSize = availableSize - totalFixedSize
    local flexUnit = totalGrow > 0 and math.max(0, remainingSize / totalGrow) or 0
    
    -- Justification Setup
    local startOffset = 0
    local justifiedGap = gap
    
    if totalGrow == 0 and remainingSize > 0 then
        if self.justify == "center" then
            startOffset = remainingSize / 2
        elseif self.justify == "end" then
            startOffset = remainingSize
        elseif self.justify == "space-between" and numChildren > 1 then
            justifiedGap = gap + (remainingSize / (numChildren - 1))
        elseif self.justify == "space-around" then
            justifiedGap = gap + (remainingSize / numChildren)
            startOffset = (justifiedGap - gap) / 2
        end
    end

    local currentOffset = startOffset
    for _, layoutData in ipairs(childrenToLayout) do
        local frame = layoutData.frame
        local childConfig = layoutData.config
        local align = childConfig.align or self.align
        
        local childWidth = layoutData.width
        local childHeight = layoutData.height
        
        if childConfig.grow and childConfig.grow > 0 then
            local growSize = flexUnit * childConfig.grow
            if isVertical then
                childHeight = childHeight + growSize
            else
                childWidth = childWidth + growSize
            end
        end
        
        frame:ClearAllPoints()
        
        -- Use an explicit coordinate system relative to the container frame.
        -- We anchor to the container (self) instead of an internal content frame
        -- to ensure absolute control over positioning.
        if isVertical then
            if align == "start" then
                frame:SetPoint("TOPLEFT", self, "TOPLEFT", padding.left, -(padding.top + currentOffset))
            elseif align == "center" then
                frame:SetPoint("TOP", self, "TOP", (padding.left - padding.right) / 2, -(padding.top + currentOffset))
            elseif align == "end" then
                frame:SetPoint("TOPRIGHT", self, "TOPRIGHT", -padding.right, -(padding.top + currentOffset))
            elseif align == "stretch" then
                frame:SetPoint("TOPLEFT", self, "TOPLEFT", padding.left, -(padding.top + currentOffset))
                childWidth = totalWidth
            end
            
            frame:SetWidth(math.max(1, childWidth))
            frame:SetHeight(math.max(1, childHeight))
            
            currentOffset = currentOffset + childHeight + justifiedGap
        else
            if align == "start" then
                frame:SetPoint("TOPLEFT", self, "TOPLEFT", padding.left + currentOffset, -padding.top)
            elseif align == "center" then
                frame:SetPoint("LEFT", self, "LEFT", padding.left + currentOffset, (padding.bottom - padding.top) / 2)
            elseif align == "end" then
                frame:SetPoint("BOTTOMLEFT", self, "BOTTOMLEFT", padding.left + currentOffset, padding.bottom)
            elseif align == "stretch" then
                frame:SetPoint("TOPLEFT", self, "TOPLEFT", padding.left + currentOffset, -padding.top)
                childHeight = totalHeight
            end
            
            frame:SetWidth(math.max(1, childWidth))
            frame:SetHeight(math.max(1, childHeight))
            
            currentOffset = currentOffset + childWidth + justifiedGap
        end
    end
end

function StackMixin:LayoutWrapped(childrenToLayout, totalWidth, totalHeight, padding, gap, rowGap, isVertical)
    local lines = {}
    local currentLine = { children = {}, size = 0, maxSize = 0 }
    table.insert(lines, currentLine)
    
    local mainMaxSize = isVertical and totalHeight or totalWidth
    
    -- Group into lines
    for _, layoutData in ipairs(childrenToLayout) do
        local childSize = isVertical and layoutData.height or layoutData.width
        local childCrossSize = isVertical and layoutData.width or layoutData.height
        
        if #currentLine.children > 0 and currentLine.size + gap + childSize > mainMaxSize then
            currentLine = { children = {}, size = 0, maxSize = 0 }
            table.insert(lines, currentLine)
        end
        
        if #currentLine.children > 0 then
            currentLine.size = currentLine.size + gap
        end
        
        table.insert(currentLine.children, layoutData)
        currentLine.size = currentLine.size + childSize
        currentLine.maxSize = math.max(currentLine.maxSize, childCrossSize)
    end
    
    -- Position lines and children
    local crossOffset = 0
    for i, line in ipairs(lines) do
        local mainOffset = 0
        local numInLine = #line.children
        local remainingInLine = mainMaxSize - line.size
        
        -- Justification within line
        local startOffset = 0
        local justifiedGap = gap
        
        if remainingInLine > 0 then
            if self.justify == "center" then
                startOffset = remainingInLine / 2
            elseif self.justify == "end" then
                startOffset = remainingInLine
            elseif self.justify == "space-between" and numInLine > 1 then
                justifiedGap = gap + (remainingInLine / (numInLine - 1))
            elseif self.justify == "space-around" then
                justifiedGap = gap + (remainingInLine / numInLine)
                startOffset = (justifiedGap - gap) / 2
            end
        end
        
        mainOffset = startOffset
        
        for _, layoutData in ipairs(line.children) do
            local frame = layoutData.frame
            local align = layoutData.config.align or self.align
            local childWidth = layoutData.width
            local childHeight = layoutData.height
            
            frame:ClearAllPoints()
            
            if isVertical then
                -- Vertical Wrap: Columns
                if align == "start" then
                    frame:SetPoint("TOPLEFT", padding.left + crossOffset, -(padding.top + mainOffset))
                elseif align == "center" then
                    frame:SetPoint("TOPLEFT", padding.left + crossOffset + (line.maxSize - childWidth) / 2, -(padding.top + mainOffset))
                elseif align == "end" then
                    frame:SetPoint("TOPLEFT", padding.left + crossOffset + (line.maxSize - childWidth), -(padding.top + mainOffset))
                elseif align == "stretch" then
                    frame:SetPoint("TOPLEFT", padding.left + crossOffset, -(padding.top + mainOffset))
                    childWidth = line.maxSize
                end
                
                frame:SetWidth(math.max(1, childWidth))
                frame:SetHeight(math.max(1, childHeight))
                mainOffset = mainOffset + childHeight + justifiedGap
            else
                -- Horizontal Wrap: Rows
                if align == "start" then
                    frame:SetPoint("TOPLEFT", padding.left + mainOffset, -(padding.top + crossOffset))
                elseif align == "center" then
                    frame:SetPoint("TOPLEFT", padding.left + mainOffset, -(padding.top + crossOffset + (line.maxSize - childHeight) / 2))
                elseif align == "end" then
                    frame:SetPoint("TOPLEFT", padding.left + mainOffset, -(padding.top + crossOffset + (line.maxSize - childHeight)))
                elseif align == "stretch" then
                    frame:SetPoint("TOPLEFT", padding.left + mainOffset, -(padding.top + crossOffset))
                    childHeight = line.maxSize
                end
                
                frame:SetWidth(math.max(1, childWidth))
                frame:SetHeight(math.max(1, childHeight))
                mainOffset = mainOffset + childWidth + justifiedGap
            end
        end
        
        crossOffset = crossOffset + line.maxSize + rowGap
    end
end

function StackMixin:ResolveGap(gapValue)
    if type(gapValue) == "string" then
        local val = FenUI:GetSpacing(gapValue)
        if val == 0 then val = FenUI:GetLayout(gapValue) end
        return val
    elseif type(gapValue) == "number" then
        return gapValue
    elseif type(gapValue) == "table" then
        return gapValue.row or gapValue.gap or 0
    end
    return 0
end

--------------------------------------------------------------------------------
-- Factory
--------------------------------------------------------------------------------

--- Create a stack layout container
---@param parent Frame Parent frame
---@param config table Configuration
---@return Frame stack
function FenUI:CreateStack(parent, config)
    config = config or {}
    
    -- Inherit from Layout for border/background support
    local stack = self:CreateLayout(parent, config)
    
    -- Mix in Stack properties
    stack.InitLayout = stack.Init -- Save Layout:Init
    FenUI.Mixin(stack, StackMixin)
    
    -- Re-initialize as Stack
    stack:Init(config)
    
    return stack
end

--- Create a flex layout container (Stack with wrap enabled)
---@param parent Frame Parent frame
---@param config table Configuration
---@return Frame flex
function FenUI:CreateFlex(parent, config)
    config = config or {}
    config.wrap = true
    return self:CreateStack(parent, config)
end

--------------------------------------------------------------------------------
-- Builder API
--------------------------------------------------------------------------------

local StackBuilder = {}
StackBuilder.__index = StackBuilder

function StackBuilder:new(parent)
    local obj = setmetatable({}, StackBuilder)
    obj.parent = parent
    obj.config = {
        children = {}
    }
    return obj
end

function StackBuilder:direction(val) self.config.direction = val; return self end
function StackBuilder:gap(val) self.config.gap = val; return self end
function StackBuilder:align(val) self.config.align = val; return self end
function StackBuilder:justify(val) self.config.justify = val; return self end
function StackBuilder:wrap(val) self.config.wrap = val; return self end
function StackBuilder:padding(val) self.config.padding = val; return self end
function StackBuilder:width(val) self.config.width = val; return self end
function StackBuilder:height(val) self.config.height = val; return self end
function StackBuilder:minWidth(val) self.config.minWidth = val; return self end
function StackBuilder:maxWidth(val) self.config.maxWidth = val; return self end
function StackBuilder:minHeight(val) self.config.minHeight = val; return self end
function StackBuilder:maxHeight(val) self.config.maxHeight = val; return self end
function StackBuilder:aspectRatio(ratio, base) self.config.aspectRatio = ratio; self.config.aspectBase = base; return self end

function StackBuilder:child(frame, childConfig)
    table.insert(self.config.children, { frame = frame, config = childConfig })
    return self
end

function StackBuilder:build()
    return FenUI:CreateStack(self.parent, self.config)
end

function FenUI.Stack(parent)
    return StackBuilder:new(parent)
end

function FenUI.Flex(parent)
    local builder = StackBuilder:new(parent)
    builder:wrap(true)
    return builder
end

