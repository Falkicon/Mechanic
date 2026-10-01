-- UI/Inspect.lua
-- !Mechanic - Inspect Tab Module (Phase 8)
--
-- Unified frame inspection and watch system.

local ADDON_NAME, ns = ...
local Mechanic = LibStub("AceAddon-3.0"):GetAddon(ADDON_NAME)
local L = LibStub("AceLocale-3.0"):GetLocale(ADDON_NAME, true)
local ICON_PATH = [[Interface\AddOns\Mechanic\Assets\Icons\]]
local SafeValue = ns.SafeValue

local InspectModule = {}

--- Shared column header: raised strip, hairline divider, neutral title.
--- Every Inspect column uses it so the four columns line up.
InspectModule.COLUMN_HEADER_HEIGHT = 24

function InspectModule:CreateColumnHeader(parent, titleText)
	local header = CreateFrame("Frame", nil, parent)
	header:SetPoint("TOPLEFT", 0, 0)
	header:SetPoint("TOPRIGHT", 0, 0)
	header:SetHeight(self.COLUMN_HEADER_HEIGHT)

	local bg = header:CreateTexture(nil, "BACKGROUND")
	bg:SetAllPoints()
	bg:SetColorTexture(FenUI:GetColor("surfaceHeader"))

	local divider = header:CreateTexture(nil, "BORDER")
	divider:SetPoint("BOTTOMLEFT")
	divider:SetPoint("BOTTOMRIGHT")
	divider:SetHeight(FenUI:GetPixelSize(header))
	divider:SetColorTexture(FenUI:GetColor("borderSubtle"))

	local title = header:CreateFontString(nil, "OVERLAY", FenUI:GetFont("fontBody"))
	title:SetTextColor(FenUI:GetColorRGB("textHeading"))
	title:SetPoint("LEFT", 8, 0)
	title:SetText(titleText)
	header.title = title

	return header
end
Mechanic.Inspect = InspectModule

InspectModule.frame = nil
InspectModule.selectedFrame = nil
InspectModule.pickMode = false

function Mechanic:InitializeInspect()
	if InspectModule.frame then
		return
	end

	local parent = self.frame.moduleContent
	local frame = CreateFrame("Frame", nil, parent)
	frame:SetAllPoints()
	InspectModule.frame = frame

	-- Toolbar (Top)
	local toolbar = CreateFrame("Frame", nil, frame)
	toolbar:SetPoint("TOPLEFT", 0, 0)
	toolbar:SetPoint("TOPRIGHT", 0, 0)
	toolbar:SetHeight(40)
	InspectModule.toolbar = toolbar

	local toolbarBg = toolbar:CreateTexture(nil, "BACKGROUND")
	toolbarBg:SetAllPoints()
	toolbarBg:SetColorTexture(FenUI:GetColor("surfaceHeader"))

	-- Pick Button
	local pickBtn = FenUI:CreateImageButton(toolbar, {
		texture = ICON_PATH .. "icon-pick",
		size = 24,
		isToggle = true,
		tooltip = L["Pick"],
		onClick = function()
			InspectModule:TogglePickMode()
		end,
	})
	pickBtn:SetPoint("LEFT", 8, 0)
	InspectModule.pickBtn = pickBtn

	-- Help Button (anchored from RIGHT)
	local helpBtn = FenUI:CreateImageButton(toolbar, {
		texture = ICON_PATH .. "icon-help",
		size = 24,
		tooltip = L["Help"],
		onClick = function()
			Mechanic.Utils:ShowHelpDialog("inspect")
		end,
	})
	helpBtn:SetPoint("RIGHT", -8, 0)

	-- Export Button (anchored from help)
	local exportBtn = FenUI:CreateImageButton(toolbar, {
		texture = ICON_PATH .. "icon-export",
		size = 24,
		tooltip = L["Export Button"],
		onClick = function()
			InspectModule:Export()
		end,
	})
	exportBtn:SetPoint("RIGHT", helpBtn, "LEFT", -8, 0)
	InspectModule.exportBtn = exportBtn

	-- Path Input (fills remaining space)
	local pathInput = FenUI:CreateInput(toolbar, {
		placeholder = L["Frame path or global table..."],
	})
	pathInput:SetPoint("LEFT", pickBtn, "RIGHT", 8, 0)
	pathInput:SetPoint("RIGHT", exportBtn, "LEFT", -8, 0)
	pathInput:SetHeight(24)

	-- Smaller font for path input
	local ebFont, ebSize, ebFlags = pathInput.editBox:GetFont()
	if ebFont then
		pathInput.editBox:SetFont(ebFont, ebSize - 1, ebFlags)
		if pathInput.placeholder then
			pathInput.placeholder:SetFont(ebFont, ebSize - 1, ebFlags)
		end
	end

	pathInput.editBox:SetScript("OnEnterPressed", function(eb)
		-- mechanic:ignore-combat (dev tool must work in combat for debugging)
		eb:ClearFocus()
		InspectModule:InspectPath(eb:GetText())
	end)
	InspectModule.pathInput = pathInput

	-- Main Layout (Four Columns)
	local content = CreateFrame("Frame", nil, frame)
	content:SetPoint("TOPLEFT", toolbar, "BOTTOMLEFT", 0, 0)
	content:SetPoint("BOTTOMRIGHT", 0, 0)
	InspectModule.content = content

	-- 1. Frame Tree (Navigate) - Narrower
	local treeFrame = CreateFrame("Frame", nil, content)
	treeFrame:SetWidth(180)
	treeFrame:SetPoint("TOPLEFT", 0, 0)
	treeFrame:SetPoint("BOTTOMLEFT", 0, 0)
	InspectModule.treeFrame = treeFrame

	local treeBg = treeFrame:CreateTexture(nil, "BACKGROUND")
	treeBg:SetAllPoints()
	treeBg:SetColorTexture(FenUI:GetColor("surfaceInset"))

	-- 2. Properties (Edit) - New
	local propertiesFrame = CreateFrame("Frame", nil, content)
	propertiesFrame:SetWidth(220)
	propertiesFrame:SetPoint("TOPLEFT", treeFrame, "TOPRIGHT", 2, 0)
	propertiesFrame:SetPoint("BOTTOMLEFT", treeFrame, "BOTTOMRIGHT", 2, 0)
	InspectModule.propertiesFrame = propertiesFrame

	local propBg = propertiesFrame:CreateTexture(nil, "BACKGROUND")
	propBg:SetAllPoints()
	propBg:SetColorTexture(FenUI:GetColor("surfaceInset"))

	-- 3. Watch List (Control) - Far Right, Narrower
	local watchFrame = CreateFrame("Frame", nil, content)
	watchFrame:SetWidth(180)
	watchFrame:SetPoint("TOPRIGHT", 0, 0)
	watchFrame:SetPoint("BOTTOMRIGHT", 0, 0)
	InspectModule.watchFrame = watchFrame

	local watchBg = watchFrame:CreateTexture(nil, "BACKGROUND")
	watchBg:SetAllPoints()
	watchBg:SetColorTexture(FenUI:GetColor("surfaceInset"))

	-- 4. Details (Understand) - Fills the middle gap between Properties and Watch
	local detailsFrame = CreateFrame("Frame", nil, content)
	detailsFrame:SetPoint("TOPLEFT", propertiesFrame, "TOPRIGHT", 2, 0)
	detailsFrame:SetPoint("BOTTOMRIGHT", watchFrame, "BOTTOMLEFT", -2, 0)
	InspectModule.detailsFrame = detailsFrame

	-- Initialize Sub-modules
	if InspectModule.InitializeTree then
		InspectModule:InitializeTree(treeFrame)
	end
	if InspectModule.Properties and InspectModule.Properties.Initialize then
		InspectModule.Properties:Initialize(propertiesFrame)
	end
	if InspectModule.InitializeDetails then
		InspectModule:InitializeDetails(detailsFrame)
	end
	if InspectModule.InitializeWatch then
		InspectModule:InitializeWatch(watchFrame)
	end
end

--------------------------------------------------------------------------------
-- Pick Mode Implementation
--------------------------------------------------------------------------------

function InspectModule:TogglePickMode()
	-- Prevent re-entry from button click after GLOBAL_MOUSE_DOWN exit
	if self.pickExitTime and (GetTime() - self.pickExitTime) < 0.2 then
		return
	end

	self.pickMode = not self.pickMode

	if self.pickMode then
		if self.pickBtn then
			self.pickBtn:SetActive(true)
		end
		self:StartPicking()
	else
		if self.pickBtn then
			self.pickBtn:SetActive(false)
		end
		self:StopPicking()
	end
end

function InspectModule:GetOrCreateHighlight()
	if self.pickHighlight then
		return self.pickHighlight
	end

	local highlight = CreateFrame("Frame", "MechanicPickHighlight", UIParent)
	-- mechanic:ignore-combat (pick mode needs TOOLTIP strata to overlay all frames during debugging)
	highlight:SetFrameStrata("TOOLTIP")
	highlight:SetFrameLevel(4900)
	highlight:EnableMouse(false) -- CRITICAL: Don't block GetMouseFoci()

	local edgeSize = 3
	for _, edge in ipairs({ "Top", "Bottom", "Left", "Right" }) do
		local tex = highlight:CreateTexture(nil, "OVERLAY")
		tex:SetColorTexture(FenUI:GetColor("borderFocus"))
		highlight[edge .. "Edge"] = tex
	end

	highlight.TopEdge:SetHeight(edgeSize)
	highlight.TopEdge:SetPoint("TOPLEFT")
	highlight.TopEdge:SetPoint("TOPRIGHT")
	highlight.BottomEdge:SetHeight(edgeSize)
	highlight.BottomEdge:SetPoint("BOTTOMLEFT")
	highlight.BottomEdge:SetPoint("BOTTOMRIGHT")
	highlight.LeftEdge:SetWidth(edgeSize)
	highlight.LeftEdge:SetPoint("TOPLEFT", highlight.TopEdge, "BOTTOMLEFT")
	highlight.LeftEdge:SetPoint("BOTTOMLEFT", highlight.BottomEdge, "TOPLEFT")
	highlight.RightEdge:SetWidth(edgeSize)
	highlight.RightEdge:SetPoint("TOPRIGHT", highlight.TopEdge, "BOTTOMRIGHT")
	highlight.RightEdge:SetPoint("BOTTOMRIGHT", highlight.BottomEdge, "TOPRIGHT")

	local label = highlight:CreateFontString(nil, "OVERLAY", FenUI:GetFont("fontSmall"))
	label:SetPoint("TOP", highlight, "BOTTOM", 0, -4)
	highlight.label = label

	self.pickHighlight = highlight
	return highlight
end

function InspectModule:ShowHighlight(frame, name)
	if not frame then
		self:HideHighlight()
		return
	end

	-- Safe visibility and point checks
	local isVisible = false
	if frame.IsVisible then
		local ok, vis = pcall(frame.IsVisible, frame)
		if ok then
			isVisible = vis
		end
	end

	if not isVisible or not frame.GetPoint then
		self:HideHighlight()
		return
	end

	local highlight = self:GetOrCreateHighlight()
	highlight:ClearAllPoints()
	highlight:SetPoint("TOPLEFT", frame, "TOPLEFT", -3, 3)
	highlight:SetPoint("BOTTOMRIGHT", frame, "BOTTOMRIGHT", 3, -3)
	highlight:Show()

	if type(name) ~= "string" then
		name = ns.FrameResolver:GetDebugName(frame)
	end
	highlight.label:SetText("|cffFFD100" .. name .. "|r")
end

function InspectModule:HideHighlight()
	if self.pickHighlight then
		self.pickHighlight:Hide()
	end
end

--- First frame under the cursor that is not UIParent/WorldFrame or part of Mechanic itself.
function InspectModule:FindPickTarget()
	for _, f in ipairs(GetMouseFoci()) do
		if f and f ~= UIParent and f ~= WorldFrame then
			local isMechanic = false
			local p = f
			while p do
				if p == Mechanic.frame or p == self.pickBar or p == self.pickHighlight or p == self.pickBtn then
					isMechanic = true
					break
				end
				local ok, parent = pcall(p.GetParent, p)
				p = ok and parent or nil
			end
			if not isMechanic then
				return f
			end
		end
	end
	return nil
end

function InspectModule:StartPicking()
	-- 1. Instruction Bar (mouse-disabled, just visual feedback)
	if not self.pickBar then
		local bar = CreateFrame("Frame", "MechanicPickBar", UIParent)
		bar:SetSize(500, 40)
		bar:SetPoint("TOP", 0, -50)
		-- mechanic:ignore-combat (pick bar must overlay combat UI for frame debugging)
		bar:SetFrameStrata("TOOLTIP")
		bar:SetFrameLevel(5000)
		bar:EnableMouse(false) -- CRITICAL: No mouse blocking

		local bg = bar:CreateTexture(nil, "BACKGROUND")
		bg:SetAllPoints()
		local r, g, b = FenUI:GetColorRGB("surfaceOverlay")
		bg:SetColorTexture(r, g, b, 0.95)

		local text = bar:CreateFontString(nil, "OVERLAY", FenUI:GetFont("fontTitle"))
		text:SetPoint("CENTER")
		text:SetText("|cffFFD100PICK MODE|r - Click any frame to select")

		self.pickBar = bar
	end

	-- 2. Gold Highlight Border (mouse-disabled, positioned by OnUpdate)
	self:GetOrCreateHighlight()

	-- 3. Event frame for GLOBAL_MOUSE_DOWN (no mouse interaction, just events)
	if not self.pickEventFrame then
		self.pickEventFrame = CreateFrame("Frame", "MechanicPickEventFrame")
	end

	-- Show instruction bar and hide highlight initially
	self.pickBar:Show()
	self.pickHighlight:Hide()

	-- 4. OnUpdate scanner on pickBar (mouse-disabled, so GetMouseFoci works!)
	self.pickBar:SetScript("OnUpdate", function(s, elapsed)
		s.elapsed = (s.elapsed or 0) + elapsed
		if s.elapsed < 0.05 then
			return
		end
		s.elapsed = 0

		-- Get frames under cursor - NO blocking since pickBar is mouse-disabled!
		local target = self:FindPickTarget()

		if target then
			self:ShowHighlight(target)
		else
			self:HideHighlight()
		end
	end)

	-- 5. ESC key handling on pickBar
	self.pickBar:EnableKeyboard(true)
	self.pickBar:SetScript("OnKeyDown", function(s, key)
		if key == "ESCAPE" then
			self.pickMode = false
			self.pickExitTime = GetTime()
			self:StopPicking()
			if self.pickBtn then
				self.pickBtn:SetActive(false)
			end
		end
	end)

	-- DELAYED EVENT REGISTRATION - Skip the initial Pick button click
	C_Timer.After(0.15, function()
		-- Check if we're still in pick mode (user might have cancelled)
		if not self.pickMode then
			return
		end

		self.pickEventFrame:RegisterEvent("GLOBAL_MOUSE_DOWN")
		self.pickEventFrame:SetScript("OnEvent", function(s, event, button)
			if event == "GLOBAL_MOUSE_DOWN" and button == "LeftButton" then
				-- Get frames under cursor - NO OVERLAY BLOCKING!
				local target = self:FindPickTarget()

				if target then
					self:SetSelectedFrame(target, ns.FrameResolver:GetDebugName(target))
				end

				-- Always exit pick mode after a click
				self.pickMode = false
				self.pickExitTime = GetTime() -- Prevent re-entry from button onClick
				self:StopPicking()
				if self.pickBtn then
					self.pickBtn:SetActive(false)
				end
			end
		end)
	end)
end

function InspectModule:StopPicking()
	-- Unregister GLOBAL_MOUSE_DOWN event
	if self.pickEventFrame then
		self.pickEventFrame:UnregisterAllEvents()
		self.pickEventFrame:SetScript("OnEvent", nil)
	end

	-- Clean up pickBar scripts (OnUpdate scanner, OnKeyDown handler)
	if self.pickBar then
		self.pickBar:SetScript("OnUpdate", nil)
		self.pickBar:SetScript("OnKeyDown", nil)
		self.pickBar:EnableKeyboard(false)
		self.pickBar:Hide()
	end

	-- Hide gold highlight
	if self.pickHighlight then
		self.pickHighlight:Hide()
	end
end

--------------------------------------------------------------------------------
-- Public API
--------------------------------------------------------------------------------

function InspectModule:InspectPath(path)
	local resolved = Mechanic.Utils:ResolveFrameOrTable(path)
	if resolved then
		self:SetSelectedFrame(resolved, path)
	else
		Mechanic:Print("Could not resolve path: " .. tostring(path))
	end
end

function InspectModule:SetSelectedFrame(frame, path)
	if not frame then
		return
	end

	-- Resolve string if passed directly
	if type(frame) == "string" then
		local resolved = Mechanic.Utils:ResolveFrameOrTable(frame)
		if resolved then
			path = path or frame
			frame = resolved
		else
			Mechanic:Print("Could not resolve frame or global table: " .. tostring(frame))
			return
		end
	end

	local previous = self.selectedFrame
	self.selectedFrame = frame
	local displayPath = type(path) == "string" and path or ns.FrameResolver:GetFramePath(frame)
	self.pathInput:SetText(displayPath or "<anonymous>")

	-- Show highlight on the selected frame
	local isFrame = false
	if frame and frame.IsObjectType then
		local ok, result = pcall(frame.IsObjectType, frame, "Frame")
		if ok then
			isFrame = result
		end
	end

	if isFrame then
		self:ShowHighlight(frame)
	else
		self:HideHighlight()
	end

	-- Developer feedback: Inspecting a plain table
	if
		frame ~= previous
		and type(frame) == "table"
		and not (frame.GetObjectType or (frame[0] and type(frame[0]) == "userdata"))
	then
		Mechanic:OnLog(
			"System",
			string.format(
				"|cffffaa00Note:|r Inspecting global table '%s' (not a WoW object). Ancestors/Children tree disabled.",
				tostring(displayPath or "table")
			),
			"[Inspect]"
		)
	end

	-- Each panel updates in isolation so one failing inspector cannot leave the others stale.
	local function updatePanel(label, fn, ...)
		local ok, err = pcall(fn, ...)
		if not ok then
			Mechanic:OnLog("System", string.format("|cffff4444%s update failed:|r %s", label, tostring(err)), "[Inspect]")
		end
	end

	ns.FrameResolver:WithCache(function()
		if self.UpdateTree then
			updatePanel("Tree", self.UpdateTree, self, frame)
		end
		if self.Properties and self.Properties.Update then
			updatePanel("Properties", self.Properties.Update, self.Properties, frame)
		end
		if self.UpdateDetails then
			updatePanel("Details", self.UpdateDetails, self, frame)
		end
	end)
end

--- False when editing the frame would be blocked: protected frames cannot be
--- changed by insecure code during combat lockdown.
function InspectModule:CanModify(frame)
	if not InCombatLockdown() then
		return true
	end
	local protected = SafeValue.Get(frame, "IsProtected")
	return not protected
end

function InspectModule:WatchCurrent()
	if not self.selectedFrame then
		return
	end

	local MechanicLib = LibStub("MechanicLib-1.0", true)
	if MechanicLib then
		local path = self.pathInput:GetText()
		MechanicLib:AddToWatchList(self.selectedFrame, path, { source = "Manual" })
	end
end

function InspectModule:Export()
	local obj = self.selectedFrame
	local navName = L["None"] or "None"
	if type(obj) == "table" then
		local name = SafeValue.Get(obj, "GetName")
		local objType = SafeValue.Get(obj, "GetObjectType")
		if type(name) == "string" and name ~= "" then
			navName = name
		elseif type(objType) == "string" then
			navName = "<" .. objType .. ">"
		end
	elseif obj then
		navName = SafeValue.ToString(obj)
	end

	local title = string.format(
		"%s : %s : %s",
		tostring(L["Inspect"] or "Inspect"),
		tostring(navName or "None"),
		tostring(L["Export"] or "Export")
	)

	local ok, text = pcall(self.GetCopyText, self, Mechanic.db.profile.includeEnvHeader)
	if not ok then
		text = "Export failed: " .. tostring(text)
	end
	Mechanic.Utils:ShowExportDialog(title, text)
end

--------------------------------------------------------------------------------
-- Copy/export sections
--
-- Every section reads restricted frame properties, so values go through
-- SafeValue (secret values are never compared, formatted or concatenated) and
-- each section runs under pcall so one failure cannot abort the export.
--------------------------------------------------------------------------------

-- Attributes and scripts probed on the selected frame (shared with InspectDetails).
InspectModule.COMMON_ATTRIBUTES = {
	"type",
	"action",
	"unit",
	"spell",
	"item",
	"macro",
	"macrotext",
	"target-slot",
	"attribute",
	"value",
	"pressbutton",
	"clickbutton",
	"initialConfigFunction",
	"state-visibility",
	"state-parent",
	"state-unit",
	"state-page",
	"tableIndex",
	"id",
	"name",
	"label",
	"showPlayer",
	"showSolo",
	"showParty",
	"showRaid",
}

InspectModule.COMMON_SCRIPTS = {
	"OnUpdate",
	"OnEvent",
	"OnShow",
	"OnHide",
	"OnEnter",
	"OnLeave",
	"OnMouseDown",
	"OnMouseUp",
	"OnClick",
	"OnValueChanged",
	"OnSizeChanged",
	"OnAttributeChanged",
	"OnDragStart",
	"OnDragStop",
	"OnTooltipShow",
	"OnLoad",
	"OnScrollRangeChanged",
	"OnHorizontalScroll",
	"OnVerticalScroll",
}

local MAX_EXPORT_MEMBERS = 20
local MAX_HIERARCHY_DEPTH = 64

-- Protected method call: returns the first two results, or nil on error/missing method.
local function pget(obj, method, ...)
	local ok, a, b = pcall(obj[method], obj, ...)
	if ok then
		return a, b
	end
	return nil
end

-- Plain string/number check that never inspects a secret value.
local function isPlain(value, expectedType)
	return not SafeValue.IsSecret(value) and type(value) == expectedType
end

local function plainText(value, empty)
	if SafeValue.IsSecret(value) then
		return "[secret]"
	end
	if value == nil or value == "" then
		return empty
	end
	return tostring(value)
end

local function flagText(value, yes, no)
	if SafeValue.IsSecret(value) then
		return "[secret]"
	end
	return value and yes or no
end

local function nameOf(target)
	if not target then
		return L["None"] or "None"
	end
	return ns.FrameResolver:GetDisplayName(target)
end

local function copyTypeInfo(obj, props)
	if not obj.GetObjectType then
		return
	end
	table.insert(props, string.format("Type: %s", SafeValue.ToString((pget(obj, "GetObjectType")))))
	if obj.GetFrameLevel then
		table.insert(props, string.format("Level: %s", SafeValue.FormatNumber((pget(obj, "GetFrameLevel")), "%d")))
	end
	if obj.GetFrameStrata then
		table.insert(props, string.format("Strata: %s", SafeValue.ToString((pget(obj, "GetFrameStrata")))))
	end
	table.insert(props, string.format("Parent: %s", nameOf((pget(obj, "GetParent")))))
	table.insert(props, string.format("Global: %s", plainText((pget(obj, "GetName")), "<none>")))
end

local function copyFenUI(obj, props)
	if not (obj.fenUISupportsLayout or obj.config or obj.fenUILayout) then
		return
	end
	table.insert(props, "")
	table.insert(props, "--- FenUI ---")
	if obj.fenUILayout then
		table.insert(props, string.format("Layout: %s", tostring(obj.fenUILayout)))
	end
	if obj.fenUITheme then
		table.insert(props, string.format("Theme: %s", tostring(obj.fenUITheme)))
	end
	if obj.fenUIFrameId then
		table.insert(props, string.format("ID: %s", tostring(obj.fenUIFrameId)))
	end
	if obj.borderApplied ~= nil then
		table.insert(props, string.format("Border: %s", obj.borderApplied and "Applied" or (L["None"] or "None")))
	end
	if obj.shadowType then
		table.insert(props, string.format("Shadow: %s", tostring(obj.shadowType)))
	end
	if obj.orientation then
		table.insert(props, string.format("Orientation: %s", tostring(obj.orientation)))
	end

	-- Show key config values
	local config = obj.config
	if type(config) ~= "table" then
		return
	end
	local bg = config.background
	if type(bg) == "string" then
		table.insert(props, string.format("Config BG: %s", bg))
	elseif type(bg) == "table" then
		if bg.color then
			table.insert(props, string.format("Config BG: %s (alpha %.2f)", tostring(bg.color), tonumber(bg.alpha) or 1))
		elseif bg.image then
			table.insert(props, string.format("Config BG: Image (%s)", tostring(bg.image)))
		end
	end
	local p = config.padding
	if type(p) == "table" then
		table.insert(
			props,
			string.format(
				"Padding: L:%s R:%s T:%s B:%s",
				tostring(p.left or 0),
				tostring(p.right or 0),
				tostring(p.top or 0),
				tostring(p.bottom or 0)
			)
		)
	elseif p then
		table.insert(props, string.format("Padding: %s", tostring(p)))
	end
end

local function copyProperties(obj, props)
	table.insert(props, "")
	table.insert(props, "--- Properties ---")
	for _, method in ipairs({ "GetText", "GetValue", "GetID", "GetWidth", "GetHeight" }) do
		if type(obj[method]) == "function" then
			local ok, val = pcall(obj[method], obj)
			if ok then
				table.insert(props, string.format("%s: %s", method, SafeValue.ToString(val)))
			end
		end
	end
end

local function copyInteractivity(obj, props)
	if not obj.IsMouseEnabled then
		return
	end
	table.insert(props, "")
	table.insert(props, "--- Interactivity ---")
	table.insert(props, "Mouse: " .. flagText((pget(obj, "IsMouseEnabled")), "Enabled", "Disabled"))
	if obj.IsMouseClickEnabled then
		table.insert(props, "Click: " .. flagText((pget(obj, "IsMouseClickEnabled")), "Enabled", "Disabled"))
	end
	if obj.IsKeyboardEnabled then
		table.insert(props, "Keyboard: " .. flagText((pget(obj, "IsKeyboardEnabled")), "Enabled", "Disabled"))
	end
	table.insert(props, "Protected: " .. flagText((pget(obj, "IsProtected")), "Yes", "No"))
end

local function copyGeometry(obj, props)
	if not obj.GetEffectiveScale then
		return
	end
	table.insert(props, "")
	table.insert(props, "--- Geometry ---")
	local w, h = pget(obj, "GetSize")
	table.insert(
		props,
		string.format(
			"Size: %s x %s",
			SafeValue.FormatNumber(w, "%.2f"),
			SafeValue.FormatNumber(h, "%.2f")
		)
	)
	table.insert(
		props,
		string.format(
			"Scale: %s (Eff: %s)",
			SafeValue.ToString((pget(obj, "GetScale"))),
			SafeValue.ToString((pget(obj, "GetEffectiveScale")))
		)
	)
	table.insert(props, "Alpha: " .. SafeValue.ToString((pget(obj, "GetAlpha"))))
	table.insert(
		props,
		string.format(
			"Visible: %s (Shown: %s)",
			flagText((pget(obj, "IsVisible")), "true", "false"),
			flagText((pget(obj, "IsShown")), "true", "false")
		)
	)
end

local function copyAnchors(obj, props)
	if not obj.GetNumPoints then
		return
	end
	local numPoints = pget(obj, "GetNumPoints")
	if not isPlain(numPoints, "number") or numPoints <= 0 then
		return
	end
	table.insert(props, "")
	table.insert(props, "--- Anchors ---")
	for i = 1, numPoints do
		local ok, point, relativeTo, relativePoint, xOfs, yOfs = pcall(obj.GetPoint, obj, i)
		if ok then
			table.insert(
				props,
				string.format(
					"%s -> %s:%s (%s, %s)",
					SafeValue.ToString(point),
					relativeTo and nameOf(relativeTo) or "<nil>",
					SafeValue.ToString(relativePoint),
					SafeValue.FormatNumber(xOfs, "%.0f", "0"),
					SafeValue.FormatNumber(yOfs, "%.0f", "0")
				)
			)
		end
	end
end

local function regionDetail(region, objType)
	local extra = ""
	if objType == "Texture" or objType == "MaskTexture" then
		local atlas = region.GetAtlas and pget(region, "GetAtlas")
		if isPlain(atlas, "string") and atlas ~= "" then
			return " atlas:" .. atlas
		end
		local texPath = region.GetTexture and pget(region, "GetTexture")
		if SafeValue.IsSecret(texPath) then
			return " [secret]"
		elseif type(texPath) == "number" then
			extra = (texPath == 0) and " [empty]" or (" fileID:" .. texPath)
		elseif type(texPath) == "string" and texPath ~= "" then
			local fileID = texPath:match("FileData ID (%d+)") or texPath:match("^(%d+)$")
			if fileID then
				extra = (fileID == "0") and " [empty]" or (" fileID:" .. fileID)
			else
				extra = " file:" .. (texPath:match("([^\\]+)$") or texPath)
			end
		end
	elseif objType == "FontString" then
		local text = region.GetText and pget(region, "GetText")
		if SafeValue.IsSecret(text) then
			extra = ' "[secret]"'
		elseif type(text) == "string" and text ~= "" then
			if #text > 20 then
				text = text:sub(1, 17) .. "..."
			end
			extra = ' "' .. text .. '"'
		end
		local font, size = nil, nil
		if region.GetFont then
			font, size = pget(region, "GetFont")
		end
		if isPlain(font, "string") then
			extra = extra .. " font:" .. (font:match("([^\\]+)$") or font)
			if isPlain(size, "number") then
				extra = extra .. "(" .. math.floor(size + 0.5) .. ")"
			end
		end
	end
	return extra
end

--- One-line description of a region: "[Type] GlobalName" or "[Type] <anonymous> details".
function InspectModule.DescribeRegion(region)
	local objType = region.GetObjectType and pget(region, "GetObjectType")
	objType = isPlain(objType, "string") and objType or "Unknown"
	local rName = region.GetName and pget(region, "GetName")
	if isPlain(rName, "string") and rName ~= "" then
		return string.format("[%s] %s", objType, rName)
	end
	return string.format("[%s] <anonymous>%s", objType, regionDetail(region, objType))
end

local function copyRegions(obj, props)
	if not obj.GetRegions then
		return
	end
	local ok, regions = pcall(function()
		return { obj:GetRegions() }
	end)
	if not ok or #regions == 0 then
		return
	end
	table.insert(props, "")
	table.insert(props, "--- Regions ---")
	for _, region in ipairs(regions) do
		table.insert(props, InspectModule.DescribeRegion(region))
	end
end

local function copyAttributes(obj, props)
	if not obj.GetAttribute then
		return
	end
	local attrs = {}
	for _, attr in ipairs(InspectModule.COMMON_ATTRIBUTES) do
		local val = pget(obj, "GetAttribute", attr)
		if SafeValue.IsSecret(val) or val ~= nil then
			table.insert(attrs, string.format("%s: %s", attr, SafeValue.ToString(val)))
		end
	end
	if #attrs > 0 then
		table.insert(props, "")
		table.insert(props, "--- Attributes ---")
		for _, a in ipairs(attrs) do
			table.insert(props, a)
		end
	end
end

local function copyScripts(obj, props)
	if not obj.HasScript then
		return
	end
	local scripts = {}
	for _, script in ipairs(InspectModule.COMMON_SCRIPTS) do
		if pget(obj, "HasScript", script) then
			local handler = pget(obj, "GetScript", script)
			if handler then
				table.insert(scripts, string.format("%s: %s", script, SafeValue.ToString(handler)))
			end
		end
	end
	if #scripts > 0 then
		table.insert(props, "")
		table.insert(props, "--- Scripts ---")
		for _, s in ipairs(scripts) do
			table.insert(props, s)
		end
	end
end

local function copyHierarchy(obj, props)
	if not obj.GetParent then
		return
	end
	table.insert(props, "")
	table.insert(props, "--- Hierarchy ---")
	local stack = {}
	local current = obj
	while current and #stack < MAX_HIERARCHY_DEPTH do
		table.insert(stack, nameOf(current))
		current = type(current) == "table" and current.GetParent and (pget(current, "GetParent")) or nil
	end
	table.insert(props, table.concat(stack, " -> "))
end

local function copyMembers(obj, props)
	table.insert(props, "")
	table.insert(props, "--- Members ---")
	local keys = {}
	for k, v in pairs(obj) do
		local valueType = type(v)
		if valueType ~= "function" and valueType ~= "table" then
			table.insert(keys, k)
		end
	end
	-- pairs() order is arbitrary; sort so repeated exports are comparable.
	table.sort(keys, function(a, b)
		return tostring(a) < tostring(b)
	end)
	for i, k in ipairs(keys) do
		if i > MAX_EXPORT_MEMBERS then
			table.insert(props, "... (truncated)")
			break
		end
		table.insert(props, string.format("%s: %s", SafeValue.ToString(k), SafeValue.ToString(obj[k])))
	end
end

local COPY_SECTIONS = {
	copyTypeInfo,
	copyFenUI,
	copyProperties,
	copyInteractivity,
	copyGeometry,
	copyAnchors,
	copyRegions,
	copyAttributes,
	copyScripts,
	copyHierarchy,
	copyMembers,
}

function InspectModule:GetCopyText(includeHeader)
	local lines = {}
	if includeHeader then
		local header = Mechanic:GetEnvironmentHeader()
		if header then
			table.insert(lines, header)
			table.insert(lines, "---")
		end
	end

	local obj = self.selectedFrame
	if not obj then
		table.insert(lines, L["No object selected for inspection."])
		return table.concat(lines, "\n")
	end

	table.insert(lines, string.format(L["Inspecting: %s"] or "Inspecting: %s", nameOf(obj)))
	table.insert(lines, "")

	local props = {}
	if type(obj) == "table" then
		ns.FrameResolver:WithCache(function()
			for _, section in ipairs(COPY_SECTIONS) do
				local ok, err = pcall(section, obj, props)
				if not ok then
					table.insert(props, string.format("[section failed: %s]", tostring(err)))
				end
			end
		end)
	end

	if #props > 0 then
		table.insert(lines, table.concat(props, "\n"))
	end

	return table.concat(lines, "\n")
end

function InspectModule:OnShow()
	if not self.frame then
		Mechanic:InitializeInspect()
	end

	-- Pick UIParent by default if nothing is selected to prevent empty state
	if not self.selectedFrame then
		self:SetSelectedFrame(UIParent, "UIParent")
	end

	if self.StartWatchTicker then
		self:StartWatchTicker()
	end
end

function InspectModule:OnHide()
	if self.pickMode then
		self.pickMode = false
		if self.pickBtn then
			self.pickBtn:SetActive(false)
		end
		self:StopPicking()
	end
	self:HideHighlight()
	-- The watch list polls only while the tab is visible.
	if self.StopWatchTicker then
		self:StopWatchTicker()
	end
end

return InspectModule

