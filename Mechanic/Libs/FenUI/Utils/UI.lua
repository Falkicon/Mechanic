--------------------------------------------------------------------------------
-- FenUI.Utils.UI
-- UI helpers, frame resolution, and visibility guards.
--------------------------------------------------------------------------------

local Utils = FenUI.Utils

--- Returns the current mouse focus frame.
---@return Frame|nil focus
function Utils:GetMouseFocus()
	if C_UI and C_UI.GetMouseFocus then
		return C_UI.GetMouseFocus()
	elseif _G.GetMouseFocus then
		return _G.GetMouseFocus()
	else
		local foci = GetMouseFoci()
		return foci and foci[1]
	end
end

--- Safe frame hiding that avoids combat taint and handles secret visibility.
---@param frame Frame|nil
function Utils:HideSafe(frame)
	if not frame then
		return
	end
	if InCombatLockdown() or self.IS_MIDNIGHT then
		frame:SetAlpha(0)
	else
		frame:Hide()
		frame:SetAlpha(0)
	end
end

--- Strips Blizzard decorations (borders, masks) from a frame.
---@param frame Frame|nil
function Utils:StripBlizzardDecorations(frame)
	if not frame then
		return
	end
	local regions = { frame:GetRegions() }
	local inCombat = InCombatLockdown()

	for _, region in ipairs(regions) do
		if region:IsObjectType("MaskTexture") or region:IsObjectType("Texture") then
			local name = region:GetDebugName()
			if name and (name:find("Border") or name:find("Overlay") or name:find("Mask")) then
				if inCombat then
					region:SetAlpha(0)
				else
					region:Hide()
				end
			end
		end
	end
end

--- Applies standardized icon crop to a texture.
---@param texture Texture|nil
---@param w number
---@param h number
function Utils:ApplyIconCrop(texture, w, h)
	if not texture or not w or not h then
		return
	end
	local ratio = w / h
	if ratio > 1 then
		local scale = h / w
		local range = 0.84 * scale
		local mid = 0.5
		texture:SetTexCoord(0.08, 0.92, mid - range / 2, mid + range / 2)
	elseif ratio < 1 then
		local scale = w / h
		local range = 0.84 * scale
		local mid = 0.5
		texture:SetTexCoord(mid - range / 2, mid + range / 2, 0.08, 0.92)
	else
		texture:SetTexCoord(0.08, 0.92, 0.08, 0.92)
	end
end

--- Aggressively hides a texture.
---@param texture Texture|nil
function Utils:HideTexture(texture)
	if not texture then
		return
	end
	texture:SetAlpha(0)
	texture:Hide()
	if texture.SetTexture then
		texture:SetTexture(nil)
	end
	if texture.SetAtlas then
		texture:SetAtlas(nil)
	end
end

--- Wrapper for Blizzard EasyMenu or modern MenuUtil.
---@param menuList table Array of menu definitions (EasyMenu format)
---@param anchor Frame|string|nil Anchor point or frame (default: "cursor")
function Utils:ShowMenu(menuList, anchor)
	if not menuList or #menuList == 0 then
		return
	end

	-- 1. Modern Client (11.0+) - MenuUtil
	local mu = _G.MenuUtil
	if mu and mu.CreateContextMenu then
		mu.CreateContextMenu(UIParent, function(owner, rootDescription)
			for _, info in ipairs(menuList) do
				if info.isTitle then
					rootDescription:CreateTitle(info.text)
				elseif info.hasArrow then
					-- Submenu support (recursive)
					local submenu = rootDescription:CreateButton(info.text)
					-- Note: Minimal implementation for now, enough for basic needs
				elseif info.text == nil or info.text == "" then
					rootDescription:CreateDivider()
				else
					local btn = rootDescription:CreateButton(info.text, info.func)
					if info.notCheckable == false or info.checked ~= nil then
						-- Checkbox/Radio support if needed
						-- luacheck: ignore 542
					end
				end
			end
		end)
		return
	end

	-- 2. Legacy Fallback - EasyMenu
	local em = _G.EasyMenu
	if em then
		if not self.menuFrame then
			self.menuFrame = CreateFrame("Frame", "FenUIMenuFrame", UIParent, "UIDropDownMenuTemplate")
		end
		em(menuList, self.menuFrame, anchor or "cursor", 0, 0, "MENU")
		return
	end

	-- 3. Last resort (should not happen if libraries are present)
	print("|cffff4444[FenUI Error]|r No menu system available (EasyMenu and MenuUtil both missing).")
end

--- Resolve a size value (number or responsive string) to pixels.
--- Supports:
--- - number: direct pixels
--- - "50%": percentage of relativeTo
--- - "10vh": 10% of viewport height
--- - "10vw": 10% of viewport width
--- - "100px": explicit pixels
--- - "auto": returns -1 (marker for intrinsic sizing)
---@param value number|string The value to resolve
---@param relativeTo number The pixel value to calculate percentages against
---@param isHeight boolean Whether this is a height calculation (for vh/vw)
---@return number pixels
function Utils:ParseSize(value, relativeTo, isHeight)
	if not value then
		return 0
	end
	if type(value) == "number" then
		return value
	end

	if type(value) == "string" then
		if value == "auto" then
			return -1
		end

		-- 1. Pixels (e.g. "100px")
		local px = value:match("^(%d+)px$")
		if px then
			return tonumber(px)
		end

		-- 2. Percentages (e.g. "50%")
		local pct = value:match("^(%d+)%%$")
		if pct then
			return (tonumber(pct) / 100) * (relativeTo or 0)
		end

		-- 3. Viewport Units (vh/vw)
		local vUnit = value:match("^(%d+)v[hw]$")
		if vUnit then
			local unitType = value:match("v([hw])$")
			local viewportSize = (unitType == "h") and UIParent:GetHeight() or UIParent:GetWidth()
			return (tonumber(vUnit) / 100) * viewportSize
		end
	end

	return tonumber(value) or 0
end

--- Parses an aspect ratio string or number.
--- Supports: 1.777, "16:9", "4/3"
---@param value string|number
---@return number|nil
function Utils:ParseAspectRatio(value)
	if not value then
		return nil
	end
	if type(value) == "number" then
		return value
	end
	if type(value) == "string" then
		-- 16:9 or 4/3
		local w, h = value:match("^(%d+)[:/](%d+)$")
		if w and h then
			return tonumber(w) / tonumber(h)
		end
		return tonumber(value)
	end
	return nil
end

--- Internal storage for resize hooks to avoid multiple hooks on same parent
local parentResizeHooks = {}

--- Hooks a parent's OnSizeChanged to notify children.
---@param child Frame The child frame to notify
---@param parent Frame The parent frame to watch
function Utils:HookParentResize(child, parent)
	if not parent or parent == UIParent then
		return
	end

	if not parentResizeHooks[parent] then
		parentResizeHooks[parent] = {}
		parent:HookScript("OnSizeChanged", function()
			for _, c in ipairs(parentResizeHooks[parent]) do
				if c.UpdateDynamicSize then
					c:UpdateDynamicSize()
				end
			end
		end)
	end

	-- Add child to registry if not already there
	local found = false
	for _, c in ipairs(parentResizeHooks[parent]) do
		if c == child then
			found = true
			break
		end
	end

	if not found then
		table.insert(parentResizeHooks[parent], child)
	end
end

--- Generic sizing handler for widgets.
---@param frame Frame The widget frame
---@param width number|string
---@param height number|string
---@param constraints table|nil { minWidth, maxWidth, minHeight, maxHeight, aspectRatio, aspectBase }
function Utils:ApplySize(frame, width, height, constraints)
	if not frame then
		return
	end

	frame.dynamicSize = { width = width, height = height }
	frame._fenui_constraints = constraints

	-- Parse aspect ratio if provided as string
	if constraints and constraints.aspectRatio then
		constraints.aspectRatio = self:ParseAspectRatio(constraints.aspectRatio)
	end

	-- Initial application
	self:UpdateDynamicSize(frame)

	-- Check if we need to watch parent for responsive updates
	local isResponsive = (type(width) == "string" and (width:find("%%") or width:find("v[hw]")))
		or (type(height) == "string" and (height:find("%%") or height:find("v[hw]")))

	if isResponsive then
		local parent = frame:GetParent() or UIParent
		self:HookParentResize(frame, parent)
	end

	-- Check if we need to watch children for intrinsic (auto) sizing
	if width == "auto" or height == "auto" then
		-- This will be handled by the widget's content observer
		frame.isAutoSizing = true
	end
end

--- Internal storage for intrinsic size observers
local sizeObservers = {}

--- Registers an observer to update parent size when child size changes.
---@param parent Frame The frame to resize
---@param child Frame The child frame to watch
function Utils:ObserveIntrinsicSize(parent, child)
	if not parent or not child then
		return
	end

	if not sizeObservers[child] then
		sizeObservers[child] = {}
		child:HookScript("OnSizeChanged", function()
			for _, p in ipairs(sizeObservers[child]) do
				if p.UpdateDynamicSize then
					p:UpdateDynamicSize()
				end
			end
		end)
	end

	-- Add parent to registry if not already there
	local found = false
	for _, p in ipairs(sizeObservers[child]) do
		if p == parent then
			found = true
			break
		end
	end

	if not found then
		table.insert(sizeObservers[child], parent)
	end
end

--- Updates a frame's size based on its dynamicSize config.
---@param frame Frame
function Utils:UpdateDynamicSize(frame)
	if not frame or not frame.dynamicSize then
		return
	end

	local parent = frame:GetParent() or UIParent
	local pW, pH = parent:GetWidth(), parent:GetHeight()
	local constraints = frame._fenui_constraints

	local finalW, finalH

	-- 1. Resolve base sizes
	-- Width
	if frame.dynamicSize.width == "auto" then
		if frame.GetContentFrame then
			local content = frame:GetContentFrame()
			local p = frame:GetPadding()
			local m = frame:GetMargin()
			finalW = content:GetWidth() + p.left + p.right + m.left + m.right
		end
	elseif frame.dynamicSize.width then
		finalW = self:ParseSize(frame.dynamicSize.width, pW, false)
	end

	-- Height
	if frame.dynamicSize.height == "auto" then
		if frame.GetContentFrame then
			local content = frame:GetContentFrame()
			local p = frame:GetPadding()
			local m = frame:GetMargin()
			finalH = content:GetHeight() + p.top + p.bottom + m.top + m.bottom
		end
	elseif frame.dynamicSize.height then
		finalH = self:ParseSize(frame.dynamicSize.height, pH, true)
	end

	-- 2. Apply initial constraints
	if finalW and constraints then
		if constraints.minWidth then
			finalW = math.max(finalW, self:ParseSize(constraints.minWidth, pW, false))
		end
		if constraints.maxWidth then
			finalW = math.min(finalW, self:ParseSize(constraints.maxWidth, pW, false))
		end
	end

	if finalH and constraints then
		if constraints.minHeight then
			finalH = math.max(finalH, self:ParseSize(constraints.minHeight, pH, true))
		end
		if constraints.maxHeight then
			finalH = math.min(finalH, self:ParseSize(constraints.maxHeight, pH, true))
		end
	end

	-- 3. Apply Aspect Ratio
	if constraints and constraints.aspectRatio then
		local ratio = constraints.aspectRatio
		local base = constraints.aspectBase or "width"

		if base == "width" and finalW then
			finalH = finalW / ratio
			-- Re-apply height constraints
			if constraints.minHeight then
				finalH = math.max(finalH, self:ParseSize(constraints.minHeight, pH, true))
			end
			if constraints.maxHeight then
				finalH = math.min(finalH, self:ParseSize(constraints.maxHeight, pH, true))
			end
		elseif base == "height" and finalH then
			finalW = finalH * ratio
			-- Re-apply width constraints
			if constraints.minWidth then
				finalW = math.max(finalW, self:ParseSize(constraints.minWidth, pW, false))
			end
			if constraints.maxWidth then
				finalW = math.min(finalW, self:ParseSize(constraints.maxWidth, pW, false))
			end
		end
	end

	-- 4. Apply to frame (instant=true to bypass animation system)
	if finalW then
		frame:SetWidth(math.max(1, finalW), true)
	end
	if finalH then
		frame:SetHeight(math.max(1, finalH), true)
	end
end

--- Generic widget factory to ensure single instance per parent.
---@param parent table
---@param key string
---@param creator function
---@return any widget
function Utils:GetOrCreateWidget(parent, key, creator)
	if parent[key] then
		return parent[key]
	end
	local widget = creator(parent)
	parent[key] = widget
	return widget
end
