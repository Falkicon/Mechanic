-- UI/Inspect.lua
-- !Mechanic - Inspect Tab Module (Phase 8)
--
-- Unified frame inspection and watch system.

local ADDON_NAME, ns = ...
local Mechanic = LibStub("AceAddon-3.0"):GetAddon(ADDON_NAME)
local L = LibStub("AceLocale-3.0"):GetLocale(ADDON_NAME, true)
local ICON_PATH = [[Interface\AddOns\Mechanic\Assets\Icons\]]
local ICON_PATH = [[Interface\AddOns\Mechanic\Assets\Icons\]]
local InspectModule = {}
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
	toolbarBg:SetColorTexture(0, 0, 0, 0.2)

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
	treeBg:SetColorTexture(0, 0, 0, 0.3)

	-- 2. Properties (Edit) - New
	local propertiesFrame = CreateFrame("Frame", nil, content)
	propertiesFrame:SetWidth(220)
	propertiesFrame:SetPoint("TOPLEFT", treeFrame, "TOPRIGHT", 2, 0)
	propertiesFrame:SetPoint("BOTTOMLEFT", treeFrame, "BOTTOMRIGHT", 2, 0)
	InspectModule.propertiesFrame = propertiesFrame

	local propBg = propertiesFrame:CreateTexture(nil, "BACKGROUND")
	propBg:SetAllPoints()
	propBg:SetColorTexture(0, 0, 0, 0.2)

	-- 3. Watch List (Control) - Far Right, Narrower
	local watchFrame = CreateFrame("Frame", nil, content)
	watchFrame:SetWidth(180)
	watchFrame:SetPoint("TOPRIGHT", 0, 0)
	watchFrame:SetPoint("BOTTOMRIGHT", 0, 0)
	InspectModule.watchFrame = watchFrame

	local watchBg = watchFrame:CreateTexture(nil, "BACKGROUND")
	watchBg:SetAllPoints()
	watchBg:SetColorTexture(0, 0, 0, 0.3)

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
	local self = InspectModule

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
		tex:SetColorTexture(1, 0.82, 0, 1) -- Gold color
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

	local label = highlight:CreateFontString(nil, "OVERLAY", "GameFontHighlightSmall")
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

	if name then
		highlight.label:SetText("|cffFFD100" .. name .. "|r")
	else
		local frameName
		if frame.GetDebugName then
			local ok, n = pcall(frame.GetDebugName, frame)
			if ok then
				frameName = n
			end
		end
		if not frameName and frame.GetName then
			local ok, n = pcall(frame.GetName, frame)
			if ok then
				frameName = n
			end
		end
		if not frameName and frame.GetObjectType then
			local ok, n = pcall(frame.GetObjectType, frame)
			if ok then
				frameName = "<" .. n .. ">"
			end
		end

		highlight.label:SetText("|cffFFD100" .. (frameName or tostring(frame)) .. "|r")
	end
end

function InspectModule:HideHighlight()
	if self.pickHighlight then
		self.pickHighlight:Hide()
	end
end

function InspectModule:StartPicking()
	local self = InspectModule

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
		bg:SetColorTexture(0, 0, 0, 0.9)

		local text = bar:CreateFontString(nil, "OVERLAY", "GameFontNormalLarge")
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
		local foci = GetMouseFoci()
		local target = nil

		for _, f in ipairs(foci) do
			if f and f ~= UIParent and f ~= WorldFrame then
				local isMechanic = false
				local p = f
				while p do
					if p == Mechanic.frame or p == self.pickBar or p == self.pickHighlight or p == self.pickBtn then
						isMechanic = true
						break
					end
					p = p.GetParent and p:GetParent()
				end
				if not isMechanic then
					target = f
					break
				end
			end
		end

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
				local foci = GetMouseFoci()

				local target = nil
				for i, f in ipairs(foci) do
					-- Filter out system frames and Mechanic frames
					if f and f ~= UIParent and f ~= WorldFrame then
						local isMechanic = false
						local p = f
						while p do
							if p == Mechanic.frame or p == self.pickBar or p == self.pickBtn then
								isMechanic = true
								break
							end
							p = p.GetParent and p:GetParent()
						end
						if not isMechanic then
							target = f
							break
						end
					end
				end

				if target then
					local name = (target.GetDebugName and target:GetDebugName())
						or (target.GetName and target:GetName())
						or tostring(target)
					self:SetSelectedFrame(target, name)
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
	local self = InspectModule

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
			frame = resolved
			path = path or frame
		else
			Mechanic:Print("Could not resolve frame or global table: " .. tostring(frame))
			return
		end
	end

	self.selectedFrame = frame
	local displayPath = path or (ns.FrameResolver and ns.FrameResolver:GetFramePath(frame))
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
		frame
		and type(frame) == "table"
		and not (frame.GetObjectType or (type(frame) == "table" and frame[0] and type(frame[0]) == "userdata"))
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

	if self.UpdateTree then
		self:UpdateTree(frame)
	end
	if self.Properties and self.Properties.Update then
		self.Properties:Update(frame)
	end
	if self.UpdateDetails then
		self:UpdateDetails(frame)
	end
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
	if obj and type(obj) == "table" then
		if obj.GetName then
			local ok, n = pcall(obj.GetName, obj)
			if ok and n then
				navName = n
			end
		end
		if navName == (L["None"] or "None") and obj.GetObjectType then
			local ok, ot = pcall(obj.GetObjectType, obj)
			if ok and ot then
				navName = "<" .. ot .. ">"
			end
		end
	elseif obj then
		navName = tostring(obj)
	end

	local title = string.format(
		"%s : %s : %s",
		tostring(L["Inspect"] or "Inspect"),
		tostring(navName or "None"),
		tostring(L["Export"] or "Export")
	)

	local text = self:GetCopyText(Mechanic.db.profile.includeEnvHeader)
	Mechanic.Utils:ShowExportDialog(title, text)
end

function InspectModule:GetCopyText(includeHeader)
	local lines = {}
	if includeHeader then
		local header = Mechanic:GetEnvironmentHeader()
		if header then
			table.insert(lines, header)
			table.insert(lines, "---")
		end
	end

	if not self.selectedFrame then
		table.insert(lines, L["No object selected for inspection."])
		return table.concat(lines, "\n")
	end

	-- Helper to safely convert values (handles Midnight secret values)
	local function safeToString(val)
		if val == nil then
			return "nil"
		end
		-- Check for secret values (Midnight 12.0+)
		if issecretvalue and issecretvalue(val) then
			return "[secret]"
		end
		local ok, str = pcall(tostring, val)
		if ok then
			-- If it's a function address, try to capture a clean hex
			if type(val) == "function" then
				local addr = str:match(":(%s*0x%x+)") or str:match(":%s*(%x+)") or str:match("(%x+)") or "ptr"
				addr = addr:gsub("%s", ""):gsub("^0x", "")
				if #addr > 8 then
					addr = addr:sub(-8)
				end
				return "[" .. addr .. "]"
			end
			return str
		end
		return "[error]"
	end

	-- Helper for consistent name resolution (matches UI)
	local function resolveName(target)
		if not target or type(target) ~= "table" then
			return tostring(target or (L["None"] or "None"))
		end

		local name
		if target.GetName then
			local ok, n = pcall(target.GetName, target)
			if ok and n and type(n) == "string" and n ~= "" then
				name = n
			end
		end

		if (not name or name == "") and target.GetObjectType then
			local path = ns.FrameResolver:GetFramePath(target)
			if path and type(path) == "string" then
				name = path:match("([^%.]+)$")
			end
		end

		if not name and target.GetObjectType then
			local ok, objType = pcall(target.GetObjectType, target)
			if ok and objType then
				name = "<" .. objType .. ">"
			end
		end

		return name or "<anonymous>"
	end

	local obj = self.selectedFrame
	local name = resolveName(obj)
	table.insert(lines, string.format(L["Inspecting: %s"] or "Inspecting: %s", safeToString(name or "Unknown")))
	table.insert(lines, "")

	-- Simple property list for export
	local props = {}
	if type(obj) == "table" then
		-- Header Info (New)
		if obj.GetObjectType then
			local parent = obj:GetParent()
			local parentName = resolveName(parent)
			table.insert(props, string.format("Type: %s", tostring(obj:GetObjectType() or "Unknown")))
			if obj.GetFrameLevel then
				table.insert(props, string.format("Level: %d", obj:GetFrameLevel()))
			end
			if obj.GetFrameStrata then
				table.insert(props, string.format("Strata: %s", obj:GetFrameStrata()))
			end
			table.insert(props, string.format("Parent: %s", parentName))
			local globalName = obj.GetName and obj:GetName()
			table.insert(
				props,
				string.format("Global: %s", (globalName and globalName ~= "") and globalName or "<none>")
			)
		end

		-- FenUI Details (Ours)
		if obj.fenUISupportsLayout or obj.config or obj.fenUILayout then
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
			if obj.config and type(obj.config) == "table" then
				if obj.config.background then
					local bg = obj.config.background
					if type(bg) == "string" then
						table.insert(props, string.format("Config BG: %s", bg))
					elseif type(bg) == "table" then
						if bg.color then
							table.insert(
								props,
								string.format("Config BG: %s (alpha %.2f)", tostring(bg.color), bg.alpha or 1)
							)
						elseif bg.image then
							table.insert(props, string.format("Config BG: Image (%s)", tostring(bg.image)))
						end
					end
				end
				if obj.config.padding then
					local p = obj.config.padding
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
					else
						table.insert(props, string.format("Padding: %s", tostring(p)))
					end
				end
			end
		end

		-- Common properties
		table.insert(props, "")
		table.insert(props, "--- Properties ---")
		local common = { "GetText", "GetValue", "GetID", "GetWidth", "GetHeight" }
		for _, method in ipairs(common) do
			if obj[method] and type(obj[method]) == "function" then
				local ok, val = pcall(obj[method], obj)
				if ok then
					table.insert(props, string.format("%s: %s", tostring(method), safeToString(val)))
				end
			end
		end

		-- Interactivity (for frames)
		if obj.IsMouseEnabled then
			table.insert(props, "")
			table.insert(props, "--- Interactivity ---")
			table.insert(props, "Mouse: " .. (obj:IsMouseEnabled() and "Enabled" or "Disabled"))
			if obj.IsMouseClickEnabled then
				table.insert(props, "Click: " .. (obj:IsMouseClickEnabled() and "Enabled" or "Disabled"))
			end
			if obj.IsKeyboardEnabled then
				table.insert(props, "Keyboard: " .. (obj:IsKeyboardEnabled() and "Enabled" or "Disabled"))
			end
			table.insert(props, "Protected: " .. (obj:IsProtected() and "Yes" or "No"))
		end

		-- Geometry (for frames)
		if obj.GetEffectiveScale then
			table.insert(props, "")
			table.insert(props, "--- Geometry ---")
			local w, h = obj:GetSize()
			table.insert(props, string.format("Size: %.2f x %.2f", w, h))
			table.insert(
				props,
				"Scale: " .. safeToString(obj:GetScale()) .. " (Eff: " .. safeToString(obj:GetEffectiveScale()) .. ")"
			)
			table.insert(props, "Alpha: " .. safeToString(obj:GetAlpha()))
			table.insert(
				props,
				"Visible: " .. tostring(obj:IsVisible()) .. " (Shown: " .. tostring(obj:IsShown()) .. ")"
			)
		end

		-- Anchors (New)
		if obj.GetNumPoints then
			local numPoints = obj:GetNumPoints()
			if numPoints > 0 then
				table.insert(props, "")
				table.insert(props, "--- Anchors ---")
				for i = 1, numPoints do
					local point, relativeTo, relativePoint, xOfs, yOfs = obj:GetPoint(i)
					local relativeName = "<nil>"
					if relativeTo then
						relativeName = relativeTo.GetName and relativeTo:GetName()
							or (relativeTo.GetObjectType and relativeTo:GetObjectType())
							or "<anonymous>"
					end
					table.insert(
						props,
						string.format(
							"%s -> %s:%s (%.0f, %.0f)",
							point or "?",
							relativeName,
							relativePoint or "?",
							xOfs or 0,
							yOfs or 0
						)
					)
				end
			end
		end

		-- Regions (New)
		if obj.GetRegions then
			local regions = { obj:GetRegions() }
			if #regions > 0 then
				table.insert(props, "")
				table.insert(props, "--- Regions ---")
				for _, region in ipairs(regions) do
					local objType = region.GetObjectType and region:GetObjectType() or "Unknown"
					local rName = region.GetName and region:GetName()
					if rName and rName ~= "" then
						table.insert(props, string.format("[%s] %s", objType, rName))
					else
						local extra = ""
						if objType == "Texture" or objType == "MaskTexture" then
							if region.GetAtlas then
								local atlas = region:GetAtlas()
								if atlas and atlas ~= "" then
									extra = " atlas:" .. atlas
								end
							end
							if extra == "" and region.GetTexture then
								local texPath = region:GetTexture()
								if texPath then
									if type(texPath) == "number" then
										extra = (texPath == 0) and " [empty]" or " fileID:" .. texPath
									elseif type(texPath) == "string" and texPath ~= "" then
										local fileID = texPath:match("FileData ID (%d+)") or texPath:match("^(%d+)$")
										if fileID then
											extra = (fileID == "0") and " [empty]" or " fileID:" .. fileID
										else
											extra = " file:" .. (texPath:match("([^\\]+)$") or texPath)
										end
									end
								end
							end
						elseif objType == "FontString" then
							local text = region.GetText and region:GetText()
							if text and text ~= "" then
								if #text > 20 then
									text = text:sub(1, 17) .. "..."
								end
								extra = ' "' .. text .. '"'
							end
							if region.GetFont then
								local font, size = region:GetFont()
								if font then
									extra = extra
										.. " font:"
										.. (font:match("([^\\]+)$") or font)
										.. "("
										.. math.floor(size + 0.5)
										.. ")"
								end
							end
						end
						table.insert(props, string.format("[%s] <anonymous>%s", objType, extra))
					end
				end
			end
		end

		-- Attributes (for frames)
		if obj.GetAttribute then
			local commonAttrs = {
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
			local attrs = {}
			for _, attr in ipairs(commonAttrs) do
				local val = obj:GetAttribute(attr)
				if val ~= nil then
					table.insert(attrs, string.format("%s: %s", attr, safeToString(val)))
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

		-- Scripts (for frames)
		if obj.HasScript then
			local commonScripts = {
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
			local scripts = {}
			for _, s in ipairs(commonScripts) do
				if obj:HasScript(s) and obj:GetScript(s) then
					table.insert(scripts, string.format("%s: %s", s, safeToString(obj:GetScript(s))))
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

		-- Hierarchy (New)
		if obj.GetParent then
			table.insert(props, "")
			table.insert(props, "--- Hierarchy ---")
			local current = obj
			local stack = {}
			while current do
				table.insert(stack, resolveName(current))
				current = current.GetParent and current:GetParent()
			end
			table.insert(props, table.concat(stack, " -> "))
		end

		-- Members (up to 20 for export)
		table.insert(props, "")
		table.insert(props, "--- Members ---")
		local count = 0
		for k, v in pairs(obj) do
			if count > 20 then
				table.insert(props, "... (truncated)")
				break
			end
			if type(v) ~= "function" and type(v) ~= "table" then
				table.insert(props, string.format("%s: %s", safeToString(k), safeToString(v)))
				count = count + 1
			end
		end
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

	if self.RefreshWatchList then
		self:RefreshWatchList()
	end
end

function InspectModule:OnHide()
	if self.pickMode then
		self:TogglePickMode()
	end
	self:HideHighlight()
end

return InspectModule

