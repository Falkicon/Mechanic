-- UI/InspectProperties.lua
-- !Mechanic - Inspect Tab: Property Editor Component (Phase 11)

local ADDON_NAME, ns = ...
local Mechanic = LibStub("AceAddon-3.0"):GetAddon(ADDON_NAME)
local L = LibStub("AceLocale-3.0"):GetLocale("!Mechanic", true)
local InspectModule = Mechanic.Inspect

local Properties = {}
InspectModule.Properties = Properties

-- Constants
local HEADER_HEIGHT = 24
local SECTION_MARGIN = 4
local INPUT_HEIGHT = 20
local LABEL_WIDTH = 70 -- Increased for longer labels

-- Section Registry
Properties.sections = {}
Properties.sortedSections = {}

function Properties:RegisterSection(key, config)
	-- config = { 
	--   title = string, 
	--   order = number, 
	--   shouldShow = function(frame), 
	--   createUI = function(parent, frame),
	--   getExportData = function(frame), 
	--   getExportLua = function(frame) 
	-- }
	self.sections[key] = config
	self:SortSections()
end

function Properties:SortSections()
	self.sortedSections = {}
	for key, config in pairs(self.sections) do
		table.insert(self.sortedSections, { key = key, config = config })
	end
	table.sort(self.sortedSections, function(a, b)
		return (a.config.order or 999) < (b.config.order or 999)
	end)
end

function Properties:Initialize(parent)
	self.parent = parent
	
	-- Header
	local header = CreateFrame("Frame", nil, parent)
	header:SetPoint("TOPLEFT", 0, 0)
	header:SetPoint("TOPRIGHT", 0, 0)
	header:SetHeight(HEADER_HEIGHT)
	self.header = header
	
	local headerBg = header:CreateTexture(nil, "BACKGROUND")
	headerBg:SetAllPoints()
	headerBg:SetColorTexture(0, 0, 0, 0.4)
	
	local title = header:CreateFontString(nil, "OVERLAY", "GameFontNormal")
	title:SetPoint("LEFT", 8, 0)
	title:SetText(L and L["Properties"] or "Properties")
	self.title = title

	-- FenUI Badge
	local badge = header:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
	badge:SetPoint("LEFT", title, "RIGHT", 8, 0)
	badge:SetText("|cff00ccff[FenUI]|r")
	badge:Hide()
	self.badge = badge

	-- Icons Container (Top Right)
	local icons = CreateFrame("Frame", nil, header)
	icons:SetPoint("RIGHT", -4, 0)
	icons:SetSize(60, HEADER_HEIGHT)
	self.icons = icons

	-- Export Button
	local exportBtn = FenUI:CreateImageButton(icons, {
		texture = [[Interface\AddOns\!Mechanic\Assets\Icons\icon-export]],
		size = 18,
		tooltip = L and L["Export Changes"] or "Export Changes",
		onClick = function()
			self:ExportChanges()
		end,
	})
	exportBtn:SetPoint("RIGHT", 0, 0)
	self.exportBtn = exportBtn

	-- Reset Button
	local resetBtn = FenUI:CreateImageButton(icons, {
		texture = [[Interface\AddOns\!Mechanic\Assets\Icons\icon-refresh]],
		size = 18,
		tooltip = L and L["Reset All Changes"] or "Reset All Changes",
		onClick = function()
			self:ResetChanges()
		end,
	})
	resetBtn:SetPoint("RIGHT", exportBtn, "LEFT", -4, 0)
	self.resetBtn = resetBtn

	-- Scrollable content
	local scrollFrame = CreateFrame("ScrollFrame", nil, parent, "UIPanelScrollFrameTemplate")
	scrollFrame:SetPoint("TOPLEFT", 0, -HEADER_HEIGHT)
	scrollFrame:SetPoint("BOTTOMRIGHT", -24, 0)
	self.scrollFrame = scrollFrame
	
	local content = CreateFrame("Frame", nil, scrollFrame)
	content:SetWidth(parent:GetWidth() - 24)
	scrollFrame:SetScrollChild(content)
	self.content = content

	-- Track changes
	self.originalValues = {}
	self.pendingChanges = {}

	-- Initialize default sections
	self:InitializeDefaultSections()
end

function Properties:Update(frame)
	self.currentFrame = frame
	self.originalValues = {}
	self.pendingChanges = {}

	-- Clear current content
	if self.sectionFrames then
		for _, f in ipairs(self.sectionFrames) do
			f:Hide()
		end
	end
	self.sectionFrames = {}

	if not frame then return end

	-- Capture original values
	self:CaptureOriginalValues(frame)

	-- Update FenUI Badge
	if self:IsFenUIComponent(frame) then
		self.badge:Show()
	else
		self.badge:Hide()
	end

	-- Build UI sections
	local yOffset = -SECTION_MARGIN
	for _, entry in ipairs(self.sortedSections) do
		local config = entry.config
		if config.shouldShow(frame) then
			local sectionFrame = self:GetOrCreateSectionFrame(entry.key, config.title)
			sectionFrame:SetPoint("TOPLEFT", self.content, "TOPLEFT", 4, yOffset)
			sectionFrame:Show()
			
			-- Populate section
			local sectionHeight = config.createUI(sectionFrame.inner, frame)
			sectionFrame:SetHeight(sectionHeight + 20) -- title + padding
			
			yOffset = yOffset - sectionFrame:GetHeight() - SECTION_MARGIN
		end
	end

	self.content:SetHeight(math.abs(yOffset))
end

function Properties:CaptureOriginalValues(frame)
	if not frame then return end
	
	-- Store common values
	if frame.GetWidth then
		self.originalValues.width = frame:GetWidth()
		self.originalValues.height = frame:GetHeight()
	end
	if frame.GetAlpha then
		self.originalValues.alpha = frame:GetAlpha()
	end
	if frame.IsShown then
		self.originalValues.shown = frame:IsShown()
	end
	if frame.GetFrameLevel then
		self.originalValues.level = frame:GetFrameLevel()
	end
	if frame.GetFrameStrata then
		self.originalValues.strata = frame:GetFrameStrata()
	end
	if frame.GetScale then
		self.originalValues.scale = frame:GetScale()
	end
	
	-- Object specific
	if frame.GetObjectType then
		local objType = frame:GetObjectType()
		if objType == "Texture" then
			local r, g, b, a = frame:GetVertexColor()
			self.originalValues.vertexColor = {r=r, g=g, b=b, a=a}
		elseif objType == "FontString" then
			local r, g, b, a = frame:GetTextColor()
			self.originalValues.textColor = {r=r, g=g, b=b, a=a}
			self.originalValues.text = frame:GetText()
		end
	end
end

function Properties:TrackChange(key, value)
	if value == self.originalValues[key] then
		self.pendingChanges[key] = nil
	else
		self.pendingChanges[key] = {
			before = self.originalValues[key],
			after = value
		}
	end
end

function Properties:GetOrCreateSectionFrame(key, title)
	self.sectionCache = self.sectionCache or {}
	if not self.sectionCache[key] then
		local f = CreateFrame("Frame", nil, self.content)
		f:SetWidth(self.content:GetWidth() - 8)
		
		local t = f:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
		t:SetPoint("TOPLEFT", 0, 0)
		t:SetText(title)
		f.title = t
		
		local inner = CreateFrame("Frame", nil, f)
		inner:SetPoint("TOPLEFT", 0, -16)
		inner:SetPoint("BOTTOMRIGHT", 0, 0)
		f.inner = inner
		
		self.sectionCache[key] = f
	else
		-- Clear existing widgets in this section to avoid accumulation
		local inner = self.sectionCache[key].inner
		local children = { inner:GetChildren() }
		for _, child in ipairs(children) do
			child:Hide()
			child:SetParent(nil) -- Force detachment to avoid accumulation
		end
	end
	table.insert(self.sectionFrames, self.sectionCache[key])
	return self.sectionCache[key]
end

--------------------------------------------------------------------------------
-- Input Widget Factory
--------------------------------------------------------------------------------

Properties.inputs = {}

function Properties.inputs:Number(parent, label, value, onChange)
	local container = CreateFrame("Frame", nil, parent)
	container:SetSize(parent:GetWidth(), INPUT_HEIGHT)
	
	local lbl = container:CreateFontString(nil, "OVERLAY", "GameFontHighlightSmall")
	lbl:SetPoint("LEFT", 0, 0)
	lbl:SetWidth(LABEL_WIDTH)
	lbl:SetJustifyH("LEFT")
	lbl:SetText(label)
	
	local input = FenUI:CreateInput(container, {
		text = tostring(math.floor((value or 0) + 0.5)),
	})
	input:SetPoint("LEFT", lbl, "RIGHT", 4, 0)
	input:SetPoint("RIGHT", 0, 0)
	input:SetHeight(INPUT_HEIGHT - 2)
	
	if input.editBox then
		input.editBox:SetScript("OnEnterPressed", function(eb)
			eb:ClearFocus()
			local newVal = tonumber(eb:GetText())
			if newVal then
				onChange(newVal)
			end
		end)
	end
	
	return container
end

function Properties.inputs:Checkbox(parent, label, value, onChange)
	local container = CreateFrame("Frame", nil, parent)
	container:SetSize(parent:GetWidth(), INPUT_HEIGHT)
	
	local cb = FenUI:CreateCheckbox(container, {
		label = label,
		checked = value,
		onChange = function(_, checked)
			onChange(checked)
		end
	})
	cb:SetPoint("LEFT", 0, 0)
	
	return container
end

function Properties.inputs:Slider(parent, label, value, min, max, step, onChange)
	local container = CreateFrame("Frame", nil, parent)
	container:SetSize(parent:GetWidth(), INPUT_HEIGHT + 10)
	
	local lbl = container:CreateFontString(nil, "OVERLAY", "GameFontHighlightSmall")
	lbl:SetPoint("TOPLEFT", 0, 0)
	lbl:SetWidth(LABEL_WIDTH)
	lbl:SetJustifyH("LEFT")
	lbl:SetText(label)

	local slider = CreateFrame("Slider", nil, container, "OptionsSliderTemplate")
	slider:SetPoint("TOPLEFT", lbl, "TOPRIGHT", 4, 0)
	slider:SetPoint("RIGHT", -30, 0)
	slider:SetHeight(12)
	slider:SetMinMaxValues(min or 0, max or 1)
	slider:SetValueStep(step or 0.01)
	slider:SetValue(value or 0)
	slider:SetObeyStepOnDrag(true)

	local valText = container:CreateFontString(nil, "OVERLAY", "GameFontHighlightSmall")
	valText:SetPoint("LEFT", slider, "RIGHT", 4, 0)
	valText:SetText(string.format("%.2f", value or 0))

	slider:SetScript("OnValueChanged", function(s, val)
		valText:SetText(string.format("%.2f", val))
		onChange(val)
	end)
	
	return container
end

function Properties.inputs:Dropdown(parent, label, options, selected, onChange)
	local container = CreateFrame("Frame", nil, parent)
	container:SetSize(parent:GetWidth(), INPUT_HEIGHT)
	
	local lbl = container:CreateFontString(nil, "OVERLAY", "GameFontHighlightSmall")
	lbl:SetPoint("LEFT", 0, 0)
	lbl:SetWidth(LABEL_WIDTH)
	lbl:SetJustifyH("LEFT")
	lbl:SetText(label)

	local btn = CreateFrame("Button", nil, container, "UIMenuButtonStretchTemplate")
	btn:SetPoint("LEFT", lbl, "RIGHT", 4, 0)
	btn:SetPoint("RIGHT", 0, 0)
	btn:SetHeight(INPUT_HEIGHT)
	
	local btnText = btn:CreateFontString(nil, "OVERLAY", "GameFontHighlightSmall")
	btnText:SetPoint("CENTER")
	btnText:SetText(selected or "Select...")
	btn.text = btnText

	btn:SetScript("OnClick", function()
		if MenuUtil and MenuUtil.CreateContextMenu then
			MenuUtil.CreateContextMenu(btn, function(owner, rootDescription)
				for _, opt in ipairs(options) do
					rootDescription:CreateButton(opt, function()
						btn.text:SetText(opt)
						onChange(opt)
					end)
				end
			end)
		end
	end)
	
	return container
end

function Properties.inputs:Color(parent, label, r, g, b, a, onChange)
	local container = CreateFrame("Frame", nil, parent)
	container:SetSize(parent:GetWidth(), INPUT_HEIGHT)
	
	local lbl = container:CreateFontString(nil, "OVERLAY", "GameFontHighlightSmall")
	lbl:SetPoint("LEFT", 0, 0)
	lbl:SetWidth(LABEL_WIDTH)
	lbl:SetJustifyH("LEFT")
	lbl:SetText(label)

	local swatch = CreateFrame("Button", nil, container)
	swatch:SetSize(20, 20)
	swatch:SetPoint("LEFT", lbl, "RIGHT", 4, 0)
	
	local bg = swatch:CreateTexture(nil, "BACKGROUND")
	bg:SetAllPoints()
	bg:SetColorTexture(1, 1, 1, 1)
	
	local tex = swatch:CreateTexture(nil, "OVERLAY")
	tex:SetAllPoints()
	tex:SetColorTexture(r or 1, g or 1, b or 1, a or 1)
	swatch.tex = tex

	swatch:SetScript("OnClick", function()
		local curR, curG, curB, curA = tex:GetVertexColor()
		local info = {
			r = curR, g = curG, b = curB, opacity = curA,
			hasOpacity = true,
			swatchFunc = function()
				local nr, ng, nb = ColorPickerFrame:GetColorRGB()
				local na = ColorPickerFrame:GetColorAlpha()
				tex:SetColorTexture(nr, ng, nb, na)
				onChange(nr, ng, nb, na)
			end,
			opacityFunc = function()
				local nr, ng, nb = ColorPickerFrame:GetColorRGB()
				local na = ColorPickerFrame:GetColorAlpha()
				tex:SetColorTexture(nr, ng, nb, na)
				onChange(nr, ng, nb, na)
			end,
			cancelFunc = function(prev)
				tex:SetColorTexture(prev.r, prev.g, prev.b, prev.opacity)
				onChange(prev.r, prev.g, prev.b, prev.opacity)
			end
		}
		if ColorPickerFrame.SetupColorPickerAndShow then
			ColorPickerFrame:SetupColorPickerAndShow(info)
		else
			ColorPickerFrame.func = info.swatchFunc
			ColorPickerFrame.opacityFunc = info.opacityFunc
			ColorPickerFrame.cancelFunc = info.cancelFunc
			ColorPickerFrame.hasOpacity = info.hasOpacity
			ColorPickerFrame.opacity = info.opacity
			ColorPickerFrame:SetColorRGB(info.r, info.g, info.b)
			ColorPickerFrame:Show()
		end
	end)
	
	return container
end

function Properties.inputs:Text(parent, label, value, onChange)
	local container = CreateFrame("Frame", nil, parent)
	container:SetSize(parent:GetWidth(), INPUT_HEIGHT)
	
	local lbl = container:CreateFontString(nil, "OVERLAY", "GameFontHighlightSmall")
	lbl:SetPoint("LEFT", 0, 0)
	lbl:SetWidth(LABEL_WIDTH)
	lbl:SetJustifyH("LEFT")
	lbl:SetText(label)
	
	local input = FenUI:CreateInput(container, {
		text = tostring(value or ""),
	})
	input:SetPoint("LEFT", lbl, "RIGHT", 4, 0)
	input:SetPoint("RIGHT", 0, 0)
	input:SetHeight(INPUT_HEIGHT - 2)
	
	if input.editBox then
		input.editBox:SetScript("OnEnterPressed", function(eb)
			eb:ClearFocus()
			onChange(eb:GetText())
		end)
	end
	
	return container
end

--------------------------------------------------------------------------------
-- Default Sections
--------------------------------------------------------------------------------

function Properties:InitializeDefaultSections()
	local _L = function(key, default) return (L and L[key]) or default or key end

	-- 1. Geometry Section
	self:RegisterSection("geometry", {
		title = _L("Geometry"),
		order = 10,
		shouldShow = function(frame) return frame.GetWidth ~= nil end,
		createUI = function(parent, frame)
			local y = 0
			
			local wInput = self.inputs:Number(parent, _L("Width"), frame:GetWidth(), function(val)
				frame:SetWidth(val)
				self:TrackChange("width", val)
			end)
			wInput:SetPoint("TOPLEFT", 0, y)
			y = y - INPUT_HEIGHT
			
			local hInput = self.inputs:Number(parent, _L("Height"), frame:GetHeight(), function(val)
				frame:SetHeight(val)
				self:TrackChange("height", val)
			end)
			hInput:SetPoint("TOPLEFT", 0, y)
			y = y - INPUT_HEIGHT
			
			return math.abs(y)
		end,
		getExportData = function(frame)
			local data = {}
			if self.pendingChanges.width then
				table.insert(data, { property = _L("Width"), before = self.pendingChanges.width.before, after = self.pendingChanges.width.after })
			end
			if self.pendingChanges.height then
				table.insert(data, { property = _L("Height"), before = self.pendingChanges.height.before, after = self.pendingChanges.height.after })
			end
			return data
		end,
		getExportLua = function(frame)
			if self.pendingChanges.width or self.pendingChanges.height then
				local w = self.pendingChanges.width and self.pendingChanges.width.after or frame:GetWidth()
				local h = self.pendingChanges.height and self.pendingChanges.height.after or frame:GetHeight()
				return string.format("frame:SetSize(%d, %d)", w, h)
			end
		end
	})

	-- 2. Visibility Section
	self:RegisterSection("visibility", {
		title = _L("Visibility"),
		order = 20,
		shouldShow = function(frame) return frame.IsShown ~= nil end,
		createUI = function(parent, frame)
			local y = 0
			
			local shownInput = self.inputs:Checkbox(parent, _L("Shown"), frame:IsShown(), function(val)
				if val then frame:Show() else frame:Hide() end
				self:TrackChange("shown", val)
			end)
			shownInput:SetPoint("TOPLEFT", 0, y)
			y = y - INPUT_HEIGHT
			
			local alphaInput = self.inputs:Slider(parent, _L("Alpha"), frame:GetAlpha(), 0, 1, 0.05, function(val)
				frame:SetAlpha(val)
				self:TrackChange("alpha", val)
			end)
			alphaInput:SetPoint("TOPLEFT", 0, y)
			y = y - (INPUT_HEIGHT + 10)
			
			return math.abs(y)
		end,
		getExportData = function(frame)
			local data = {}
			if self.pendingChanges.shown then
				table.insert(data, { property = _L("Shown"), before = tostring(self.pendingChanges.shown.before), after = tostring(self.pendingChanges.shown.after) })
			end
			if self.pendingChanges.alpha then
				table.insert(data, { property = _L("Alpha"), before = string.format("%.2f", self.pendingChanges.alpha.before), after = string.format("%.2f", self.pendingChanges.alpha.after) })
			end
			return #data > 0 and data or nil
		end,
		getExportLua = function(frame)
			local lua = {}
			if self.pendingChanges.shown then
				table.insert(lua, self.pendingChanges.shown.after and "frame:Show()" or "frame:Hide()")
			end
			if self.pendingChanges.alpha then
				table.insert(lua, string.format("frame:SetAlpha(%.2f)", self.pendingChanges.alpha.after))
			end
			return #lua > 0 and table.concat(lua, "\n") or nil
		end
	})

	-- 3. Layering Section
	self:RegisterSection("layering", {
		title = _L("Layering"),
		order = 30,
		shouldShow = function(frame) return frame.GetFrameLevel ~= nil end,
		createUI = function(parent, frame)
			local y = 0
			
			local levelInput = self.inputs:Number(parent, _L("Level"), frame:GetFrameLevel(), function(val)
				frame:SetFrameLevel(val)
				self:TrackChange("level", val)
			end)
			levelInput:SetPoint("TOPLEFT", 0, y)
			y = y - INPUT_HEIGHT
			
			local strataOptions = {
				"BACKGROUND", "LOW", "MEDIUM", "HIGH", "DIALOG", "FULLSCREEN", "FULLSCREEN_DIALOG", "TOOLTIP"
			}
			local strataInput = self.inputs:Dropdown(parent, _L("Strata"), strataOptions, frame:GetFrameStrata(), function(val)
				frame:SetFrameStrata(val)
				self:TrackChange("strata", val)
			end)
			strataInput:SetPoint("TOPLEFT", 0, y)
			y = y - INPUT_HEIGHT
			
			return math.abs(y)
		end,
		getExportData = function(frame)
			local data = {}
			if self.pendingChanges.level then
				table.insert(data, { property = _L("Frame Level"), before = self.pendingChanges.level.before, after = self.pendingChanges.level.after })
			end
			if self.pendingChanges.strata then
				table.insert(data, { property = _L("Frame Strata"), before = self.pendingChanges.strata.before, after = self.pendingChanges.strata.after })
			end
			return #data > 0 and data or nil
		end,
		getExportLua = function(frame)
			local lua = {}
			if self.pendingChanges.level then
				table.insert(lua, string.format("frame:SetFrameLevel(%d)", self.pendingChanges.level.after))
			end
			if self.pendingChanges.strata then
				table.insert(lua, string.format("frame:SetFrameStrata('%s')", self.pendingChanges.strata.after))
			end
			return #lua > 0 and table.concat(lua, "\n") or nil
		end
	})

	-- 4. Scale Section
	self:RegisterSection("scale", {
		title = _L("Scale"),
		order = 40,
		shouldShow = function(frame) return frame.GetScale ~= nil end,
		createUI = function(parent, frame)
			local y = 0
			
			local scaleInput = self.inputs:Slider(parent, _L("Scale"), frame:GetScale(), 0.1, 5, 0.1, function(val)
				frame:SetScale(val)
				self:TrackChange("scale", val)
			end)
			scaleInput:SetPoint("TOPLEFT", 0, y)
			y = y - (INPUT_HEIGHT + 10)
			
			return math.abs(y)
		end,
		getExportData = function(frame)
			if self.pendingChanges.scale then
				return {{ property = _L("Scale"), before = string.format("%.2f", self.pendingChanges.scale.before), after = string.format("%.2f", self.pendingChanges.scale.after) }}
			end
		end,
		getExportLua = function(frame)
			if self.pendingChanges.scale then
				return string.format("frame:SetScale(%.2f)", self.pendingChanges.scale.after)
			end
		end
	})

	-- 5. Texture Section
	self:RegisterSection("texture", {
		title = _L("Texture"),
		order = 50,
		shouldShow = function(frame) return frame.GetObjectType and frame:GetObjectType() == "Texture" end,
		createUI = function(parent, frame)
			local y = 0
			
			local r, g, b, a = frame:GetVertexColor()
			local colorInput = self.inputs:Color(parent, _L("Vertex Color"), r, g, b, a, function(nr, ng, nb, na)
				frame:SetVertexColor(nr, ng, nb, na)
				self:TrackChange("vertexColor", {r=nr, g=ng, b=nb, a=na})
			end)
			colorInput:SetPoint("TOPLEFT", 0, y)
			y = y - INPUT_HEIGHT
			
			return math.abs(y)
		end,
		getExportData = function(frame)
			if self.pendingChanges.vertexColor then
				local before = self.originalValues.vertexColor or {r=1,g=1,b=1,a=1}
				local after = self.pendingChanges.vertexColor.after
				return {{ 
					property = _L("Vertex Color"), 
					before = string.format("%.2f,%.2f,%.2f,%.2f", before.r, before.g, before.b, before.a), 
					after = string.format("%.2f,%.2f,%.2f,%.2f", after.r, after.g, after.b, after.a) 
				}}
			end
		end,
		getExportLua = function(frame)
			if self.pendingChanges.vertexColor then
				local c = self.pendingChanges.vertexColor.after
				return string.format("frame:SetVertexColor(%.2f, %.2f, %.2f, %.2f)", c.r, c.g, c.b, c.a)
			end
		end
	})

	-- 6. FontString Section
	self:RegisterSection("fontstring", {
		title = _L("FontString"),
		order = 60,
		shouldShow = function(frame) return frame.GetObjectType and frame:GetObjectType() == "FontString" end,
		createUI = function(parent, frame)
			local y = 0
			
			local textInput = self.inputs:Text(parent, _L("Text"), frame:GetText(), function(val)
				frame:SetText(val)
				self:TrackChange("text", val)
			end)
			textInput:SetPoint("TOPLEFT", 0, y)
			y = y - INPUT_HEIGHT

			local r, g, b, a = frame:GetTextColor()
			local colorInput = self.inputs:Color(parent, _L("Text Color"), r, g, b, a, function(nr, ng, nb, na)
				frame:SetTextColor(nr, ng, nb, na)
				self:TrackChange("textColor", {r=nr, g=ng, b=nb, a=na})
			end)
			colorInput:SetPoint("TOPLEFT", 0, y)
			y = y - INPUT_HEIGHT
			
			return math.abs(y)
		end,
		getExportData = function(frame)
			local data = {}
			if self.pendingChanges.text then
				table.insert(data, { property = _L("Text"), before = self.pendingChanges.text.before, after = self.pendingChanges.text.after })
			end
			if self.pendingChanges.textColor then
				local before = self.originalValues.textColor or {r=1,g=1,b=1,a=1}
				local after = self.pendingChanges.textColor.after
				table.insert(data, { 
					property = _L("Text Color"), 
					before = string.format("%.2f,%.2f,%.2f,%.2f", before.r, before.g, before.b, before.a), 
					after = string.format("%.2f,%.2f,%.2f,%.2f", after.r, after.g, after.b, after.a) 
				})
			end
			return #data > 0 and data or nil
		end,
		getExportLua = function(frame)
			local lua = {}
			if self.pendingChanges.text then
				table.insert(lua, string.format("frame:SetText('%s')", self.pendingChanges.text.after))
			end
			if self.pendingChanges.textColor then
				local c = self.pendingChanges.textColor.after
				table.insert(lua, string.format("frame:SetTextColor(%.2f, %.2f, %.2f, %.2f)", c.r, c.g, c.b, c.a))
			end
			return #lua > 0 and table.concat(lua, "\n") or nil
		end
	})
end

--------------------------------------------------------------------------------
-- Actions
--------------------------------------------------------------------------------

function Properties:ExportChanges()
	if not next(self.pendingChanges) then
		Mechanic:Print(L and L["No changes to export."] or "No changes to export.")
		return
	end

	local lines = {}
	table.insert(lines, "## !Mechanic Frame Edit Export")
	table.insert(lines, "")
	table.insert(lines, "**Target Frame**")
	
	local path = InspectModule.pathInput:GetText()
	table.insert(lines, string.format("- Path: `%s`", path))
	
	local frame = self.currentFrame
	if frame.GetObjectType then
		table.insert(lines, string.format("- Type: %s", frame:GetObjectType()))
	end
	
	table.insert(lines, "")
	table.insert(lines, "**Changes**")
	table.insert(lines, "| Property | Before | After |")
	table.insert(lines, "|----------|--------|-------|")
	
	local luaLines = {}
	local _L = function(key, default) return (L and L[key]) or default or key end

	for _, entry in ipairs(self.sortedSections) do
		if entry.config.getExportData then
			local data = entry.config.getExportData(frame)
			if data then
				for _, d in ipairs(data) do
					table.insert(lines, string.format("| %s | %s | %s |", d.property, tostring(d.before), tostring(d.after)))
				end
			end
		end
		if entry.config.getExportLua then
			local lua = entry.config.getExportLua(frame)
			if lua then
				table.insert(luaLines, lua)
			end
		end
	end
	
	table.insert(lines, "")
	table.insert(lines, "**Lua Implementation**")
	table.insert(lines, "```lua")
	table.insert(lines, string.format("-- Resolve the frame: %s", path))
	table.insert(lines, string.format("local frame = %s", path))
	table.insert(lines, "")
	table.insert(lines, "-- Apply changes")
	for _, l in ipairs(luaLines) do
		table.insert(lines, l)
	end
	table.insert(lines, "```")
	
	table.insert(lines, "")
	table.insert(lines, "**Context**")
	table.insert(lines, string.format("- Exported: %s", date("%Y-%m-%d %H:%M:%S")))
	table.insert(lines, string.format("- !Mechanic Version: %s", Mechanic.version))

	local title = string.format("%s - %s", _L("Export"), path)
	Mechanic.Utils:ShowExportDialog(title, table.concat(lines, "\n"))
end

function Properties:ResetChanges()
	if not self.currentFrame or not next(self.pendingChanges) then return end
	
	local frame = self.currentFrame
	for key, change in pairs(self.pendingChanges) do
		local val = change.before
		if key == "width" then frame:SetWidth(val)
		elseif key == "height" then frame:SetHeight(val)
		elseif key == "shown" then if val then frame:Show() else frame:Hide() end
		elseif key == "alpha" then frame:SetAlpha(val)
		elseif key == "scale" then frame:SetScale(val)
		elseif key == "level" then frame:SetFrameLevel(val)
		elseif key == "strata" then frame:SetFrameStrata(val)
		elseif key == "vertexColor" then frame:SetVertexColor(val.r, val.g, val.b, val.a)
		elseif key == "textColor" then frame:SetTextColor(val.r, val.g, val.b, val.a)
		elseif key == "text" then frame:SetText(val)
		end
	end
	
	self:Update(frame)
end

function Properties:IsFenUIComponent(frame)
	return frame.fenUISupportsLayout 
		or frame.config 
		or frame.fenUILayout
		or frame.fenUIFrameId
end

return Properties
