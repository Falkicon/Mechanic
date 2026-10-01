-- UI/InspectProperties.lua
-- !Mechanic - Inspect Tab: Property Editor Component (Phase 11)

local ADDON_NAME, ns = ...
local Mechanic = LibStub("AceAddon-3.0"):GetAddon(ADDON_NAME)
local L = LibStub("AceLocale-3.0"):GetLocale("Mechanic", true)
local InspectModule = Mechanic.Inspect
local SafeValue = ns.SafeValue
local ICON_PATH = [[Interface\AddOns\Mechanic\Assets\Icons\]]

local Properties = {}
InspectModule.Properties = Properties

-- Constants
local HEADER_HEIGHT = 24
local SECTION_MARGIN = 4
local INPUT_HEIGHT = 20
local LABEL_WIDTH = 70
local RESET_BTN_SIZE = 14
local SECTION_SCRATCH_HEIGHT = 1000 -- provisional height while a section is populated

-- Section Registry
Properties.sections = {}
Properties.sortedSections = {}

local function _L(key, default)
	return (L and L[key]) or default or key
end

-- Protected getter: returns up to four results with secret values replaced by nil.
local function read(frame, method, ...)
	if type(frame) ~= "table" or not frame[method] then
		return nil
	end
	local r = { pcall(frame[method], frame, ...) }
	if not r[1] then
		return nil
	end
	for i = 2, 5 do
		if SafeValue.IsSecret(r[i]) then
			r[i] = nil
		end
	end
	return r[2], r[3], r[4], r[5]
end

function Properties:RegisterSection(key, config)
	self.sections[key] = config
	self:SortSections()
end

function Properties:SortSections()
	self.sortedSections = {}
	for key, config in pairs(self.sections) do
		table.insert(self.sortedSections, { key = key, config = config })
	end
	table.sort(self.sortedSections, function(a, b)
		local orderA, orderB = a.config.order or 999, b.config.order or 999
		if orderA ~= orderB then
			return orderA < orderB
		end
		return a.key < b.key
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
	headerBg:SetColorTexture(FenUI:GetColor("surfaceHeader"))

	-- Hairline divider (matches InspectModule:CreateColumnHeader)
	local headerDivider = header:CreateTexture(nil, "BORDER")
	headerDivider:SetPoint("BOTTOMLEFT")
	headerDivider:SetPoint("BOTTOMRIGHT")
	headerDivider:SetHeight(FenUI:GetPixelSize(header))
	headerDivider:SetColorTexture(FenUI:GetColor("borderSubtle"))

	local title = header:CreateFontString(nil, "OVERLAY", FenUI:GetFont("fontBody"))
	title:SetTextColor(FenUI:GetColorRGB("textHeading"))
	title:SetPoint("LEFT", 8, 0)
	title:SetText(_L("Properties"))
	self.title = title

	-- FenUI Badge
	local badge = header:CreateFontString(nil, "OVERLAY", FenUI:GetFont("fontSmall"))
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
		texture = ICON_PATH .. "icon-export",
		size = 18,
		tooltip = _L("Export Changes"),
		onClick = function()
			self:ExportChanges()
		end,
	})
	exportBtn:SetPoint("RIGHT", 0, 0)
	self.exportBtn = exportBtn

	-- Reset Button
	local resetBtn = FenUI:CreateImageButton(icons, {
		texture = ICON_PATH .. "icon-reload",
		size = 18,
		tooltip = _L("Reset All Changes"),
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
	FenUI:SkinScrollFrame(scrollFrame, { offset = 5 })
	self.scrollFrame = scrollFrame

	local content = CreateFrame("Frame", nil, scrollFrame)
	content:SetWidth(parent:GetWidth() - 24)
	scrollFrame:SetScrollChild(content)
	self.content = content

	-- Released input rows are parked on a hidden frame and reused (frames are never freed)
	self.poolHolder = CreateFrame("Frame", nil, parent)
	self.poolHolder:Hide()

	-- Track changes
	self.originalValues = {}
	self.pendingChanges = {}
	self.activeEditKey = nil
	self.editBoxRegistry = {}
	self.resetBtnRegistry = {}

	self:InitializeDefaultSections()
end

function Properties:Update(frame, isRefresh)
	if not frame then
		self.currentFrame = nil
		self:HideAllSections()
		return
	end

	-- Only wipe history if we are selecting a NEW frame
	if not isRefresh or frame ~= self.currentFrame then
		self.currentFrame = frame
		self.originalValues = {}
		self.pendingChanges = {}
		self.activeEditKey = nil
		self:CaptureOriginalValues(frame)
	end

	-- Clear current content (visuals)
	self:HideAllSections()
	self.sectionFrames = {}
	self.editBoxRegistry = {}
	self.resetBtnRegistry = {}

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
			-- Give the section a real height before populating: its inner frame is
			-- anchored top-to-bottom, and with a zero-height section it has no valid
			-- rect, so rows sized from inner:GetWidth() came out 0px wide (invisible).
			sectionFrame:SetHeight(SECTION_SCRATCH_HEIGHT)
			sectionFrame:Show()

			-- Populate section; one failing section must not blank the others
			local ok, sectionHeight = pcall(config.createUI, sectionFrame.inner, frame)
			if ok then
				sectionFrame:SetHeight(sectionHeight + 20) -- title + padding
				yOffset = yOffset - sectionFrame:GetHeight() - SECTION_MARGIN
			else
				self:ReleaseSectionRows(sectionFrame)
				sectionFrame:Hide()
			end
		end
	end

	self.content:SetHeight(math.abs(yOffset))

	-- Restore focus if needed
	if self.activeEditKey and self.editBoxRegistry[self.activeEditKey] then
		local eb = self.editBoxRegistry[self.activeEditKey]
		C_Timer.After(0.01, function()
			if eb and eb:IsVisible() then
				eb:SetFocus()
				eb:SetCursorPosition(string.len(eb:GetText()))
			end
		end)
	end
end

function Properties:HideAllSections()
	if self.sectionFrames then
		for _, f in ipairs(self.sectionFrames) do
			f:Hide()
		end
	end
end

function Properties:CaptureOriginalValues(frame)
	if not frame then
		return
	end

	local original = self.originalValues

	-- Store common values (secret values are left unset and therefore untracked)
	if frame.GetWidth then
		original.width = read(frame, "GetWidth")
		original.height = read(frame, "GetHeight")
	end
	if frame.GetAlpha then
		original.alpha = read(frame, "GetAlpha")
	end
	if frame.IsShown then
		original.shown = read(frame, "IsShown")
	end
	if frame.GetFrameLevel then
		original.level = read(frame, "GetFrameLevel")
	end
	if frame.GetFrameStrata then
		original.strata = read(frame, "GetFrameStrata")
	end
	if frame.GetScale then
		original.scale = read(frame, "GetScale")
	end

	-- Object specific
	local objType = read(frame, "GetObjectType")
	if objType == "Texture" then
		local r, g, b, a = read(frame, "GetVertexColor")
		if r ~= nil and g ~= nil and b ~= nil then
			original.vertexColor = { r = r, g = g, b = b, a = a or 1 }
		end
	elseif objType == "FontString" then
		local r, g, b, a = read(frame, "GetTextColor")
		if r ~= nil and g ~= nil and b ~= nil then
			original.textColor = { r = r, g = g, b = b, a = a or 1 }
		end
		original.text = read(frame, "GetText")
	end
end

function Properties:TrackChange(key, value)
	if self.originalValues[key] == nil then
		return
	end

	local isOriginal
	if type(value) == "table" and type(self.originalValues[key]) == "table" then
		isOriginal = (math.abs((value.r or 0) - (self.originalValues[key].r or 0)) < 0.01)
			and (math.abs((value.g or 0) - (self.originalValues[key].g or 0)) < 0.01)
			and (math.abs((value.b or 0) - (self.originalValues[key].b or 0)) < 0.01)
			and (math.abs((value.a or 1) - (self.originalValues[key].a or 1)) < 0.01)
	else
		isOriginal = (value == self.originalValues[key])
	end

	if isOriginal then
		self.pendingChanges[key] = nil
	else
		self.pendingChanges[key] = {
			before = self.originalValues[key],
			after = value,
		}
	end

	-- Update individual reset button visibility without full rebuild
	if self.resetBtnRegistry[key] then
		if not isOriginal then
			self.resetBtnRegistry[key]:Show()
		else
			self.resetBtnRegistry[key]:Hide()
		end
	end
end

--- Run a setter on the inspected frame. Refuses protected frames during combat
--- and survives invalid values; on refusal the rows are rebuilt from live values.
function Properties:Apply(frame, setter, ...)
	if not InspectModule:CanModify(frame) then
		Mechanic:Print("Cannot edit a protected frame during combat.")
		self:Update(frame, true)
		return false
	end
	local ok, err = pcall(setter, frame, ...)
	if not ok then
		Mechanic:Print("Could not apply change: " .. tostring(err))
		self:Update(frame, true)
		return false
	end
	return true
end

-- Park a finished row for reuse instead of orphaning it
function Properties:ReleaseRow(row)
	row:Hide()
	if not row.kind then
		return
	end
	row:ClearAllPoints()
	row:SetParent(self.poolHolder)
	self.rowPool = self.rowPool or {}
	self.rowPool[row.kind] = self.rowPool[row.kind] or {}
	table.insert(self.rowPool[row.kind], row)
end

function Properties:ReleaseSectionRows(sectionFrame)
	for _, child in ipairs({ sectionFrame.inner:GetChildren() }) do
		self:ReleaseRow(child)
	end
end

function Properties:AcquireRow(kind, parent, build)
	local pool = self.rowPool and self.rowPool[kind]
	local row = pool and table.remove(pool)
	if not row then
		row = CreateFrame("Frame", nil, parent)
		row.kind = kind
		row.state = {}
		build(row)
	end
	row:SetParent(parent)
	row:ClearAllPoints()
	row:SetSize(parent:GetWidth(), INPUT_HEIGHT)
	row:Show()
	return row
end

function Properties:GetOrCreateSectionFrame(key, title)
	self.sectionCache = self.sectionCache or {}
	if not self.sectionCache[key] then
		local f = CreateFrame("Frame", nil, self.content)
		f:SetWidth(self.content:GetWidth() - 8)

		local t = f:CreateFontString(nil, "OVERLAY", FenUI:GetFont("fontSmall"))
		t:SetTextColor(FenUI:GetColorRGB("textMuted"))
		t:SetPoint("TOPLEFT", 0, 0)
		t:SetText(title)
		f.title = t

		local inner = CreateFrame("Frame", nil, f)
		-- Explicit size (not a TOPLEFT/BOTTOMRIGHT pair): rows read inner:GetWidth()
		-- while building, and an anchor-derived width is 0 until layout resolves,
		-- which left the first build after a reload with invisible 0px rows.
		inner:SetPoint("TOPLEFT", 0, -16)
		inner:SetSize(f:GetWidth(), SECTION_SCRATCH_HEIGHT)
		f.inner = inner

		self.sectionCache[key] = f
	else
		self:ReleaseSectionRows(self.sectionCache[key])
	end
	table.insert(self.sectionFrames, self.sectionCache[key])
	return self.sectionCache[key]
end

--------------------------------------------------------------------------------
-- Input Widget Factory
--
-- Rows are pooled per kind. Each row is built once; its scripts read
-- row.state, which every Number/Checkbox/... call reconfigures in place.
--------------------------------------------------------------------------------

Properties.inputs = {}

-- Label button + reset button + tooltip shared by every row kind
local function buildCommon(row, withLabel)
	if withLabel then
		local btn = CreateFrame("Button", nil, row)
		btn:SetSize(LABEL_WIDTH, INPUT_HEIGHT)
		btn:SetPoint("LEFT", 0, 0)

		local lbl = btn:CreateFontString(nil, "OVERLAY", FenUI:GetFont("fontSmall"))
		lbl:SetAllPoints()
		lbl:SetJustifyH("LEFT")
		row.lblDefaultColor = { lbl:GetTextColor() }

		btn:SetScript("OnClick", function()
			if row.state.onReset then
				Properties.activeEditKey = nil
				row.state.onReset()
			end
		end)
		btn:SetScript("OnEnter", function()
			if row.state.onReset then
				lbl:SetTextColor(0, 0.8, 1) -- Highlight color
			end
		end)
		btn:SetScript("OnLeave", function()
			lbl:SetTextColor(unpack(row.lblDefaultColor))
		end)
		row.lblBtn, row.lbl = btn, lbl
	end

	local resetBtn = FenUI:CreateImageButton(row, {
		texture = ICON_PATH .. "icon-reload",
		size = RESET_BTN_SIZE,
		tooltip = _L("Reset"),
		onClick = function()
			Properties.activeEditKey = nil -- Clear active edit on manual reset
			if row.state.onReset then
				row.state.onReset()
			end
		end,
	})
	resetBtn:SetPoint("RIGHT", 0, 0)
	resetBtn:SetAlpha(0.4)
	resetBtn:SetScript("OnEnter", function(s)
		s:SetAlpha(1)
	end)
	resetBtn:SetScript("OnLeave", function(s)
		s:SetAlpha(0.4)
	end)
	row.resetBtn = resetBtn

	row:SetScript("OnEnter", function(s)
		if s.state.tooltip then
			GameTooltip:SetOwner(s, "ANCHOR_RIGHT")
			GameTooltip:SetText(s.state.tooltip, 1, 1, 1, 1, true)
			GameTooltip:Show()
		end
	end)
	row:SetScript("OnLeave", function()
		GameTooltip:Hide()
	end)
end

local function configureCommon(row, label, key, onReset, tooltip)
	local st = row.state
	st.key, st.onReset, st.tooltip = key, onReset, tooltip

	if row.lbl then
		row.lbl:SetText(label)
		row.lbl:SetTextColor(unpack(row.lblDefaultColor))
	end

	Properties.resetBtnRegistry[key] = row.resetBtn
	row.resetBtn:SetShown(onReset ~= nil and Properties.pendingChanges[key] ~= nil)
end

-- Right edge of a row's main control leaves room for the reset button
local function rightInset(onReset)
	return onReset and (-RESET_BTN_SIZE - 4) or 0
end

local function buildKeyboardNav(row, editBox)
	editBox:SetScript("OnKeyDown", function(eb, keyName)
		local st = row.state
		local step, shiftStep = st.step or 1, st.shiftStep
		local delta = 0
		if keyName == "UP" then
			delta = IsShiftKeyDown() and (shiftStep or 10) or step
		elseif keyName == "DOWN" then
			delta = -(IsShiftKeyDown() and (shiftStep or 10) or step)
		end

		if delta ~= 0 then
			local curNum = tonumber(eb:GetText()) or st.value or 0
			local newVal = curNum + delta

			-- Round to avoid float precision issues
			if step < 1 then
				newVal = math.floor(newVal * 100 + 0.5) / 100
			end

			eb:SetText(string.format(step < 1 and "%.2f" or "%d", newVal))
			Properties.activeEditKey = st.key
			st.onChange(newVal)
			return true
		end
	end)
end

local function buildTextEntry(row, numeric)
	buildCommon(row, true)

	local input = FenUI:CreateInput(row, {})
	input:SetHeight(INPUT_HEIGHT - 2)
	row.input = input

	local editBox = input.editBox
	if editBox then
		editBox:SetScript("OnEnterPressed", function(eb)
			eb:ClearFocus()
			local st = row.state
			if numeric then
				local newVal = tonumber(eb:GetText())
				if newVal then
					st.onChange(newVal)
				end
			else
				st.onChange(eb:GetText())
			end
		end)
		editBox:HookScript("OnEditFocusGained", function()
			Properties.activeEditKey = row.state.key
		end)
		if numeric then
			buildKeyboardNav(row, editBox)
		end
	end
end

local function placeEntry(row, onReset)
	row.input:ClearAllPoints()
	row.input:SetPoint("LEFT", row.lblBtn, "RIGHT", 4, 0)
	row.input:SetPoint("RIGHT", rightInset(onReset), 0)
end

function Properties.inputs:Number(parent, label, value, key, onChange, onReset, tooltip, step, shiftStep)
	local row = Properties:AcquireRow("Number", parent, function(r)
		buildTextEntry(r, true)
	end)

	local stepVal = step or 1
	local st = row.state
	st.onChange, st.value, st.step, st.shiftStep = onChange, value, stepVal, shiftStep
	configureCommon(row, label, key, onReset, tooltip)
	placeEntry(row, onReset)
	row.input:SetText(value and string.format(stepVal < 1 and "%.2f" or "%d", value) or "?")
	if row.input.editBox then
		Properties.editBoxRegistry[key] = row.input.editBox
	end
	return row
end

function Properties.inputs:Text(parent, label, value, key, onChange, onReset, tooltip)
	local row = Properties:AcquireRow("Text", parent, function(r)
		buildTextEntry(r, false)
	end)

	row.state.onChange = onChange
	configureCommon(row, label, key, onReset, tooltip)
	placeEntry(row, onReset)
	row.input:SetText(tostring(value or ""))
	if row.input.editBox then
		Properties.editBoxRegistry[key] = row.input.editBox
	end
	return row
end

function Properties.inputs:Checkbox(parent, label, value, key, onChange, onReset, tooltip)
	local row = Properties:AcquireRow("Checkbox", parent, function(r)
		buildCommon(r, false)

		local cb = FenUI:CreateCheckbox(r, {
			label = "",
			checked = false,
			boxSize = 14,
			checkedTexture = ICON_PATH .. "icon-checkbox-checked",
			uncheckedTexture = ICON_PATH .. "icon-checkbox-unchecked",
			onChange = function(_, checked)
				r.state.onChange(checked)
			end,
		})
		cb:SetPoint("LEFT", 0, 0)
		cb.label:SetFontObject(FenUI:GetFont("fontSmall"))
		r.lblDefaultColor = { cb.label:GetTextColor() }
		r.cb = cb

		local labelBtn = CreateFrame("Button", nil, r)
		labelBtn:SetPoint("TOPLEFT", cb.label, "TOPLEFT")
		labelBtn:SetPoint("BOTTOMRIGHT", cb.label, "BOTTOMRIGHT")
		labelBtn:SetScript("OnClick", function()
			if r.state.onReset then
				r.state.onReset()
			end
		end)
		labelBtn:SetScript("OnEnter", function()
			if r.state.onReset then
				cb.label:SetTextColor(0, 0.8, 1)
			end
		end)
		labelBtn:SetScript("OnLeave", function()
			cb.label:SetTextColor(unpack(r.lblDefaultColor))
		end)
	end)

	row.state.onChange = onChange
	configureCommon(row, label, key, onReset, tooltip)
	row.cb:SetLabel(label)
	row.cb.label:SetTextColor(unpack(row.lblDefaultColor))
	row.cb:SetChecked(value and true or false, true)
	return row
end

function Properties.inputs:Dropdown(parent, label, options, selected, key, onChange, onReset, tooltip)
	local row = Properties:AcquireRow("Dropdown", parent, function(r)
		buildCommon(r, true)

		-- FenUI dropdown (flat control + chevron; menu opens anchored beneath it)
		local dropdown = FenUI:CreateDropdown(r, {
			items = {},
			defaultText = "Select...",
			height = INPUT_HEIGHT - 2,
			onSelect = function(opt)
				r.state.onChange(opt)
			end,
		})
		dropdown.button.text:SetFontObject(FenUI:GetFont("fontSmall"))
		r.dropdown = dropdown
	end)

	row.state.onChange = onChange
	configureCommon(row, label, key, onReset, tooltip)
	row.dropdown:SetItems(options)
	row.dropdown.button:SetText(tostring(selected or "Select..."))
	row.dropdown:ClearAllPoints()
	row.dropdown:SetPoint("LEFT", row.lblBtn, "RIGHT", 4, 0)
	row.dropdown:SetPoint("RIGHT", rightInset(onReset), 0)
	return row
end

function Properties.inputs:Color(parent, label, r, g, b, a, key, onChange, onReset, tooltip)
	local row = Properties:AcquireRow("Color", parent, function(rw)
		buildCommon(rw, true)

		local swatch = CreateFrame("Button", nil, rw)
		swatch:SetSize(20, 20)
		swatch:SetPoint("LEFT", rw.lblBtn, "RIGHT", 4, 0)

		local bg = swatch:CreateTexture(nil, "BACKGROUND")
		bg:SetAllPoints()
		bg:SetColorTexture(1, 1, 1, 1)

		local tex = swatch:CreateTexture(nil, "OVERLAY")
		tex:SetAllPoints()
		rw.swatchTex = tex

		swatch:SetScript("OnClick", function()
			local st = rw.state
			local curR, curG, curB, curA = read(tex, "GetVertexColor")
			local function apply(nr, ng, nb, na)
				tex:SetColorTexture(nr, ng, nb, na)
				st.onChange(nr, ng, nb, na)
			end
			local function applyPicker()
				local nr, ng, nb = ColorPickerFrame:GetColorRGB()
				apply(nr, ng, nb, ColorPickerFrame:GetColorAlpha())
			end
			local info = {
				r = curR or 1,
				g = curG or 1,
				b = curB or 1,
				opacity = curA or 1,
				hasOpacity = true,
				swatchFunc = applyPicker,
				opacityFunc = applyPicker,
				cancelFunc = function(prev)
					apply(prev.r, prev.g, prev.b, prev.opacity)
				end,
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
	end)

	row.state.onChange = onChange
	configureCommon(row, label, key, onReset, tooltip)
	row.swatchTex:SetColorTexture(r or 1, g or 1, b or 1, a or 1)
	return row
end

--------------------------------------------------------------------------------
-- Default Sections
--------------------------------------------------------------------------------

-- Lua expression for a "Parent.3.child" path, or nil when it cannot be resolved by name
local function pathToLua(path)
	if type(path) ~= "string" or path == "" or path:find("[<>?]") then
		return nil
	end
	local expr
	for segment in path:gmatch("[^%.]+") do
		if not expr then
			expr = segment:match("^[%a_][%w_]*$") and segment or string.format("_G[%q]", segment)
		elseif segment:match("^[%a_][%w_]*$") then
			expr = expr .. "." .. segment
		elseif segment:match("^%d+$") then
			expr = expr .. "[" .. segment .. "]"
		else
			expr = expr .. string.format("[%q]", segment)
		end
	end
	return expr
end

function Properties:InitializeDefaultSections()
	-- Shared by every section: apply a setter, track it, or restore the original
	local function change(frame, key, setter, value)
		if self:Apply(frame, setter, value) then
			self:TrackChange(key, value)
		end
	end
	local function restore(frame, key, setter)
		local val = self.originalValues[key]
		if val ~= nil and self:Apply(frame, setter, val) then
			self.pendingChanges[key] = nil
			self:Update(frame, true)
		end
	end

	-- 1. Geometry Section
	self:RegisterSection("geometry", {
		title = _L("Geometry"),
		order = 10,
		shouldShow = function(frame)
			return frame.GetWidth ~= nil
		end,
		createUI = function(parent, frame)
			local y = 0

			local wInput = self.inputs:Number(parent, _L("Width"), read(frame, "GetWidth"), "width", function(val)
				change(frame, "width", frame.SetWidth, val)
			end, function()
				restore(frame, "width", frame.SetWidth)
			end, nil, 1, 10)
			wInput:SetPoint("TOPLEFT", 0, y)
			y = y - INPUT_HEIGHT

			local hInput = self.inputs:Number(parent, _L("Height"), read(frame, "GetHeight"), "height", function(val)
				change(frame, "height", frame.SetHeight, val)
			end, function()
				restore(frame, "height", frame.SetHeight)
			end, nil, 1, 10)
			hInput:SetPoint("TOPLEFT", 0, y)
			y = y - INPUT_HEIGHT

			return math.abs(y)
		end,
		getExportData = function()
			local data = {}
			if self.pendingChanges.width then
				table.insert(data, {
					property = _L("Width"),
					before = self.pendingChanges.width.before,
					after = self.pendingChanges.width.after,
				})
			end
			if self.pendingChanges.height then
				table.insert(data, {
					property = _L("Height"),
					before = self.pendingChanges.height.before,
					after = self.pendingChanges.height.after,
				})
			end
			return data
		end,
		getExportLua = function(frame)
			if self.pendingChanges.width or self.pendingChanges.height then
				local w = self.pendingChanges.width and self.pendingChanges.width.after or read(frame, "GetWidth") or 0
				local h = self.pendingChanges.height and self.pendingChanges.height.after or read(frame, "GetHeight") or 0
				return string.format("frame:SetSize(%s, %s)", w, h)
			end
		end,
	})

	-- 2. Visibility Section
	local function setShown(frame, shown)
		if shown then
			frame:Show()
		else
			frame:Hide()
		end
	end
	self:RegisterSection("visibility", {
		title = _L("Visibility"),
		order = 20,
		shouldShow = function(frame)
			return frame.IsShown ~= nil
		end,
		createUI = function(parent, frame)
			local y = 0

			local shownInput = self.inputs:Checkbox(
				parent,
				_L("Shown"),
				read(frame, "IsShown"),
				"shown",
				function(val)
					change(frame, "shown", setShown, val)
				end,
				function()
					restore(frame, "shown", setShown)
				end
			)
			shownInput:SetPoint("TOPLEFT", 0, y)
			y = y - INPUT_HEIGHT

			local alphaInput = self.inputs:Number(parent, _L("Alpha"), read(frame, "GetAlpha"), "alpha", function(val)
				change(frame, "alpha", frame.SetAlpha, math.max(0, math.min(1, val))) -- Clamp alpha
			end, function()
				restore(frame, "alpha", frame.SetAlpha)
			end, nil, 0.01, 0.1)
			alphaInput:SetPoint("TOPLEFT", 0, y)
			y = y - INPUT_HEIGHT

			return math.abs(y)
		end,
		getExportData = function()
			local data = {}
			if self.pendingChanges.shown then
				table.insert(data, {
					property = _L("Shown"),
					before = tostring(self.pendingChanges.shown.before),
					after = tostring(self.pendingChanges.shown.after),
				})
			end
			if self.pendingChanges.alpha then
				table.insert(data, {
					property = _L("Alpha"),
					before = string.format("%.2f", self.pendingChanges.alpha.before),
					after = string.format("%.2f", self.pendingChanges.alpha.after),
				})
			end
			return #data > 0 and data or nil
		end,
		getExportLua = function()
			local lua = {}
			if self.pendingChanges.shown then
				table.insert(lua, self.pendingChanges.shown.after and "frame:Show()" or "frame:Hide()")
			end
			if self.pendingChanges.alpha then
				table.insert(lua, string.format("frame:SetAlpha(%.2f)", self.pendingChanges.alpha.after))
			end
			return #lua > 0 and table.concat(lua, "\n") or nil
		end,
	})

	-- 3. Layering Section
	self:RegisterSection("layering", {
		title = _L("Layering"),
		order = 30,
		shouldShow = function(frame)
			return frame.GetFrameLevel ~= nil
		end,
		createUI = function(parent, frame)
			local y = 0

			local levelInput = self.inputs:Number(
				parent,
				_L("Level"),
				read(frame, "GetFrameLevel"),
				"level",
				function(val)
					change(frame, "level", frame.SetFrameLevel, val)
				end,
				function()
					restore(frame, "level", frame.SetFrameLevel)
				end,
				"Controls depth within the same strata. Higher numbers appear on top.",
				1,
				10
			)
			levelInput:SetPoint("TOPLEFT", 0, y)
			y = y - INPUT_HEIGHT

			local strataOptions = {
				"BACKGROUND",
				"LOW",
				"MEDIUM",
				"HIGH",
				"DIALOG",
				"FULLSCREEN",
				"FULLSCREEN_DIALOG",
				"TOOLTIP",
			}
			local strataInput = self.inputs:Dropdown(
				parent,
				_L("Strata"),
				strataOptions,
				read(frame, "GetFrameStrata"),
				"strata",
				function(val)
					change(frame, "strata", frame.SetFrameStrata, val)
				end,
				function()
					restore(frame, "strata", frame.SetFrameStrata)
				end,
				"Major render layers. DIALOG > HIGH > MEDIUM > LOW > BACKGROUND."
			)
			strataInput:SetPoint("TOPLEFT", 0, y)
			y = y - INPUT_HEIGHT

			return math.abs(y)
		end,
		getExportData = function()
			local data = {}
			if self.pendingChanges.level then
				table.insert(data, {
					property = _L("Frame Level"),
					before = self.pendingChanges.level.before,
					after = self.pendingChanges.level.after,
				})
			end
			if self.pendingChanges.strata then
				table.insert(data, {
					property = _L("Frame Strata"),
					before = self.pendingChanges.strata.before,
					after = self.pendingChanges.strata.after,
				})
			end
			return #data > 0 and data or nil
		end,
		getExportLua = function()
			local lua = {}
			if self.pendingChanges.level then
				table.insert(lua, string.format("frame:SetFrameLevel(%d)", self.pendingChanges.level.after))
			end
			if self.pendingChanges.strata then
				table.insert(lua, string.format("frame:SetFrameStrata(%q)", self.pendingChanges.strata.after))
			end
			return #lua > 0 and table.concat(lua, "\n") or nil
		end,
	})

	-- 4. Scale Section
	self:RegisterSection("scale", {
		title = _L("Scale"),
		order = 40,
		shouldShow = function(frame)
			return frame.GetScale ~= nil
		end,
		createUI = function(parent, frame)
			local y = 0

			local scaleInput = self.inputs:Number(parent, _L("Scale"), read(frame, "GetScale"), "scale", function(val)
				change(frame, "scale", frame.SetScale, val)
			end, function()
				restore(frame, "scale", frame.SetScale)
			end, nil, 0.1, 1)
			scaleInput:SetPoint("TOPLEFT", 0, y)
			y = y - INPUT_HEIGHT

			return math.abs(y)
		end,
		getExportData = function()
			if self.pendingChanges.scale then
				return {
					{
						property = _L("Scale"),
						before = string.format("%.2f", self.pendingChanges.scale.before),
						after = string.format("%.2f", self.pendingChanges.scale.after),
					},
				}
			end
		end,
		getExportLua = function()
			if self.pendingChanges.scale then
				return string.format("frame:SetScale(%.2f)", self.pendingChanges.scale.after)
			end
		end,
	})

	-- Color rows (texture vertex color, font string text color)
	local function colorChange(frame, key, setter)
		return function(nr, ng, nb, na)
			if self:Apply(frame, setter, nr, ng, nb, na) then
				self:TrackChange(key, { r = nr, g = ng, b = nb, a = na })
			end
		end
	end
	local function colorRestore(frame, key, setter)
		return function()
			local val = self.originalValues[key]
			if val and self:Apply(frame, setter, val.r, val.g, val.b, val.a) then
				self.pendingChanges[key] = nil
				self:Update(frame, true)
			end
		end
	end
	local function colorExport(key, label)
		return function()
			if self.pendingChanges[key] then
				local before = self.originalValues[key] or { r = 1, g = 1, b = 1, a = 1 }
				local after = self.pendingChanges[key].after
				return {
					{
						property = _L(label),
						before = string.format("%.2f,%.2f,%.2f,%.2f", before.r, before.g, before.b, before.a),
						after = string.format("%.2f,%.2f,%.2f,%.2f", after.r, after.g, after.b, after.a),
					},
				}
			end
		end
	end

	-- 5. Texture Section
	self:RegisterSection("texture", {
		title = _L("Texture"),
		order = 50,
		shouldShow = function(frame)
			return read(frame, "GetObjectType") == "Texture"
		end,
		createUI = function(parent, frame)
			local y = 0

			local r, g, b, a = read(frame, "GetVertexColor")
			local colorInput = self.inputs:Color(
				parent,
				_L("Vertex Color"),
				r,
				g,
				b,
				a,
				"vertexColor",
				colorChange(frame, "vertexColor", frame.SetVertexColor),
				colorRestore(frame, "vertexColor", frame.SetVertexColor)
			)
			colorInput:SetPoint("TOPLEFT", 0, y)
			y = y - INPUT_HEIGHT

			return math.abs(y)
		end,
		getExportData = colorExport("vertexColor", "Vertex Color"),
		getExportLua = function()
			if self.pendingChanges.vertexColor then
				local c = self.pendingChanges.vertexColor.after
				return string.format("frame:SetVertexColor(%.2f, %.2f, %.2f, %.2f)", c.r, c.g, c.b, c.a)
			end
		end,
	})

	-- 6. FontString Section
	self:RegisterSection("fontstring", {
		title = _L("FontString"),
		order = 60,
		shouldShow = function(frame)
			return read(frame, "GetObjectType") == "FontString"
		end,
		createUI = function(parent, frame)
			local y = 0

			local textInput = self.inputs:Text(parent, _L("Text"), read(frame, "GetText"), "text", function(val)
				change(frame, "text", frame.SetText, val)
			end, function()
				restore(frame, "text", frame.SetText)
			end)
			textInput:SetPoint("TOPLEFT", 0, y)
			y = y - INPUT_HEIGHT

			local r, g, b, a = read(frame, "GetTextColor")
			local colorInput = self.inputs:Color(
				parent,
				_L("Text Color"),
				r,
				g,
				b,
				a,
				"textColor",
				colorChange(frame, "textColor", frame.SetTextColor),
				colorRestore(frame, "textColor", frame.SetTextColor)
			)
			colorInput:SetPoint("TOPLEFT", 0, y)
			y = y - INPUT_HEIGHT

			return math.abs(y)
		end,
		getExportData = function()
			local data = {}
			if self.pendingChanges.text then
				table.insert(data, {
					property = _L("Text"),
					before = self.pendingChanges.text.before,
					after = self.pendingChanges.text.after,
				})
			end
			local color = colorExport("textColor", "Text Color")()
			if color then
				table.insert(data, color[1])
			end
			return #data > 0 and data or nil
		end,
		getExportLua = function()
			local lua = {}
			if self.pendingChanges.text then
				table.insert(lua, string.format("frame:SetText(%q)", self.pendingChanges.text.after))
			end
			if self.pendingChanges.textColor then
				local c = self.pendingChanges.textColor.after
				table.insert(lua, string.format("frame:SetTextColor(%.2f, %.2f, %.2f, %.2f)", c.r, c.g, c.b, c.a))
			end
			return #lua > 0 and table.concat(lua, "\n") or nil
		end,
	})
end

--------------------------------------------------------------------------------
-- Actions
--------------------------------------------------------------------------------

function Properties:ExportChanges()
	if not next(self.pendingChanges) then
		Mechanic:Print(_L("No changes to export."))
		return
	end

	local lines = {}
	table.insert(lines, "## !Mechanic Frame Edit Export")
	table.insert(lines, "")
	table.insert(lines, "**Target Frame**")

	local path = InspectModule.pathInput:GetText()
	table.insert(lines, string.format("- Path: `%s`", path))

	local frame = self.currentFrame
	local objType = read(frame, "GetObjectType")
	if objType then
		table.insert(lines, string.format("- Type: %s", tostring(objType)))
	end

	table.insert(lines, "")
	table.insert(lines, "**Changes**")
	table.insert(lines, "| Property | Before | After |")
	table.insert(lines, "|----------|--------|-------|")

	local luaLines = {}

	for _, entry in ipairs(self.sortedSections) do
		if entry.config.getExportData then
			local data = entry.config.getExportData(frame)
			if data then
				for _, d in ipairs(data) do
					table.insert(
						lines,
						string.format("| %s | %s | %s |", d.property, tostring(d.before), tostring(d.after))
					)
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

	local frameExpr = pathToLua(path)
	table.insert(lines, "")
	table.insert(lines, "**Lua Implementation**")
	table.insert(lines, "```lua")
	table.insert(lines, string.format("-- Resolve the frame: %s", path))
	if frameExpr then
		table.insert(lines, string.format("local frame = %s", frameExpr))
	else
		table.insert(lines, "local frame = nil -- path is not addressable by name; resolve it manually")
	end
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

local RESET_SETTERS = {
	width = "SetWidth",
	height = "SetHeight",
	alpha = "SetAlpha",
	scale = "SetScale",
	level = "SetFrameLevel",
	strata = "SetFrameStrata",
	text = "SetText",
}

function Properties:ResetChanges()
	if not self.currentFrame or not next(self.pendingChanges) then
		return
	end

	local frame = self.currentFrame
	if not InspectModule:CanModify(frame) then
		Mechanic:Print("Cannot edit a protected frame during combat.")
		return
	end

	for key, change in pairs(self.pendingChanges) do
		local val = change.before
		local method = RESET_SETTERS[key]
		if method then
			pcall(frame[method], frame, val)
		elseif key == "shown" then
			pcall(val and frame.Show or frame.Hide, frame)
		elseif key == "vertexColor" then
			pcall(frame.SetVertexColor, frame, val.r, val.g, val.b, val.a)
		elseif key == "textColor" then
			pcall(frame.SetTextColor, frame, val.r, val.g, val.b, val.a)
		end
	end

	self.pendingChanges = {}
	self:Update(frame, true)
end

function Properties:IsFenUIComponent(frame)
	return frame.fenUISupportsLayout or frame.config or frame.fenUILayout or frame.fenUIFrameId
end

return Properties
