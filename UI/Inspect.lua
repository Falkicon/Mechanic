-- UI/Inspect.lua
-- !Mechanic - Inspect Tab Module (Phase 8)
--
-- Unified frame inspection and watch system.

local ADDON_NAME, ns = ...
local Mechanic = LibStub("AceAddon-3.0"):GetAddon(ADDON_NAME)
local L = LibStub("AceLocale-3.0"):GetLocale(ADDON_NAME, true)
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
	local pickBtn = FenUI:CreateButton(toolbar, {
		text = L["Pick"],
		width = 60,
		height = 24,
		onClick = function()
			InspectModule:TogglePickMode()
		end,
	})
	pickBtn:SetPoint("LEFT", 8, 0)
	InspectModule.pickBtn = pickBtn

	-- Path Input
	local pathInput = FenUI:CreateInput(toolbar, {
		placeholder = L["Frame path or global table..."],
	})
	pathInput:SetPoint("LEFT", pickBtn, "RIGHT", 8, 0)
	pathInput:SetPoint("RIGHT", -120, 0)
	pathInput:SetHeight(24)
	pathInput.editBox:SetScript("OnEnterPressed", function(eb)
		eb:ClearFocus()
		InspectModule:InspectPath(eb:GetText())
	end)
	InspectModule.pathInput = pathInput

	-- Watch Button
	local watchBtn = FenUI:CreateButton(toolbar, {
		text = L["+ Watch"],
		width = 80,
		height = 24,
		onClick = function()
			InspectModule:WatchCurrent()
		end,
	})
	watchBtn:SetPoint("LEFT", pathInput, "RIGHT", 8, 0)
	InspectModule.watchBtn = watchBtn

	-- Export Button
	local exportBtn = FenUI:CreateButton(toolbar, {
		text = L["Export Button"],
		width = 90,
		height = 24,
		onClick = function()
			InspectModule:Export()
		end,
	})
	exportBtn:SetPoint("LEFT", watchBtn, "RIGHT", 8, 0)
	InspectModule.exportBtn = exportBtn

	-- Main Layout (Three Columns)
	local content = CreateFrame("Frame", nil, frame)
	content:SetPoint("TOPLEFT", toolbar, "BOTTOMLEFT", 0, 0)
	content:SetPoint("BOTTOMRIGHT", 0, 0)
	InspectModule.content = content

	-- 1. Frame Tree (Left)
	local treeFrame = CreateFrame("Frame", nil, content)
	treeFrame:SetWidth(180)
	treeFrame:SetPoint("TOPLEFT", 0, 0)
	treeFrame:SetPoint("BOTTOMLEFT", 0, 0)
	InspectModule.treeFrame = treeFrame

	local treeBg = treeFrame:CreateTexture(nil, "BACKGROUND")
	treeBg:SetAllPoints()
	treeBg:SetColorTexture(0, 0, 0, 0.3)

	-- 2. Watch List (Right)
	local watchFrame = CreateFrame("Frame", nil, content)
	watchFrame:SetWidth(200)
	watchFrame:SetPoint("TOPRIGHT", 0, 0)
	watchFrame:SetPoint("BOTTOMRIGHT", 0, 0)
	InspectModule.watchFrame = watchFrame

	local watchBg = watchFrame:CreateTexture(nil, "BACKGROUND")
	watchBg:SetAllPoints()
	watchBg:SetColorTexture(0, 0, 0, 0.3)

	-- 3. Details (Center)
	local detailsFrame = CreateFrame("Frame", nil, content)
	detailsFrame:SetPoint("TOPLEFT", treeFrame, "TOPRIGHT", 2, 0)
	detailsFrame:SetPoint("BOTTOMRIGHT", watchFrame, "BOTTOMLEFT", -2, 0)
	InspectModule.detailsFrame = detailsFrame

	-- Initialize Sub-modules
	if InspectModule.InitializeTree then
		InspectModule:InitializeTree(treeFrame)
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
		-- #region agent log
		Mechanic:Print("|cff00ffff[Pick Debug]|r Ignoring re-entry (cooldown)")
		-- #endregion
		return
	end
	
	self.pickMode = not self.pickMode
	
	-- #region agent log
	Mechanic:Print("|cff00ffff[Pick Debug]|r Toggle: " .. tostring(self.pickMode))
	-- #endregion

	if self.pickMode then
		if self.pickBtn then self.pickBtn:SetText(L["Picking..."]) end
		self:StartPicking()
	else
		if self.pickBtn then self.pickBtn:SetText(L["Pick"]) end
		self:StopPicking()
	end
end

function InspectModule:StartPicking()
	local self = InspectModule
	
	-- #region agent log
	Mechanic:Print("|cff00ffff[Run 12]|r StartPicking - NO OVERLAY approach")
	-- #endregion
	
	-- 1. Instruction Bar (mouse-disabled, just visual feedback)
	if not self.pickBar then
		local bar = CreateFrame("Frame", "MechanicPickBar", UIParent)
		bar:SetSize(500, 40)
		bar:SetPoint("TOP", 0, -50)
		bar:SetFrameStrata("TOOLTIP")
		bar:SetFrameLevel(5000)
		bar:EnableMouse(false)  -- CRITICAL: No mouse blocking
		
		local bg = bar:CreateTexture(nil, "BACKGROUND")
		bg:SetAllPoints()
		bg:SetColorTexture(0, 0, 0, 0.9)
		
		local text = bar:CreateFontString(nil, "OVERLAY", "GameFontNormalLarge")
		text:SetPoint("CENTER")
		text:SetText("|cffFFD100PICK MODE|r - Click any frame to select")
		
		self.pickBar = bar
	end
	
	-- 2. Event frame for GLOBAL_MOUSE_DOWN (no mouse interaction, just events)
	if not self.pickEventFrame then
		self.pickEventFrame = CreateFrame("Frame", "MechanicPickEventFrame")
					end
					
	-- Show instruction bar
	self.pickBar:Show()
	
	-- #region agent log
	Mechanic:Print("|cff00ffff[Run 12]|r Delaying event registration by 0.15s...")
	-- #endregion
	
	-- DELAYED EVENT REGISTRATION - Skip the initial Pick button click
	C_Timer.After(0.15, function()
		-- Check if we're still in pick mode (user might have cancelled)
		if not self.pickMode then
			-- #region agent log
			Mechanic:Print("|cff00ffff[Run 12]|r Aborted - pickMode already false")
			-- #endregion
			return
		end
		
		-- #region agent log
		Mechanic:Print("|cff00ffff[Run 12]|r Registering GLOBAL_MOUSE_DOWN now")
		-- #endregion
		
		self.pickEventFrame:RegisterEvent("GLOBAL_MOUSE_DOWN")
		self.pickEventFrame:SetScript("OnEvent", function(s, event, button)
			-- #region agent log
			Mechanic:Print("|cff00ffff[Run 12]|r GLOBAL_MOUSE_DOWN fired: " .. tostring(button))
			-- #endregion
			
			if event == "GLOBAL_MOUSE_DOWN" and button == "LeftButton" then
				-- Get frames under cursor - NO OVERLAY BLOCKING!
				local foci = GetMouseFoci()
				
				-- #region agent log
				Mechanic:Print("|cff00ffff[Run 12]|r Foci count: " .. tostring(#foci))
				-- #endregion
				
				local target = nil
			for i, f in ipairs(foci) do
					-- #region agent log
					local fname = f and (f.GetName and f:GetName() or tostring(f)) or "nil"
					Mechanic:Print("|cff00ffff[Run 12]|r Foci[" .. i .. "]: " .. fname)
					-- #endregion
					
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
					-- #region agent log
					Mechanic:Print("|cff00ff00[Run 12]|r SUCCESS! Selected: " .. name)
					-- #endregion
					self:SetSelectedFrame(target, name)
				else
					-- #region agent log
					Mechanic:Print("|cffff0000[Run 12]|r No valid frame found in foci")
					-- #endregion
				end
				
				-- Always exit pick mode after a click
				self.pickMode = false
				self.pickExitTime = GetTime()  -- Prevent re-entry from button onClick
				self:StopPicking()
				if self.pickBtn then self.pickBtn:SetText(L["Pick"]) end
			end
		end)
	end)
end

function InspectModule:StopPicking()
	local self = InspectModule
	
	-- #region agent log
	Mechanic:Print("|cff00ffff[Run 12]|r StopPicking")
	-- #endregion
	
	-- Unregister event
	if self.pickEventFrame then
		self.pickEventFrame:UnregisterAllEvents()
		self.pickEventFrame:SetScript("OnEvent", nil)
	end
	
	-- Hide instruction bar
	if self.pickBar then
		self.pickBar:Hide()
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
	local navName = obj and (obj.GetName and obj:GetName() or (obj.GetObjectType and obj:GetObjectType()) or "<table>")
		or (L["None"] or "None")
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

	local obj = self.selectedFrame
	local name = obj.GetName and obj:GetName() or (obj.GetObjectType and obj:GetObjectType()) or "<table>"
	table.insert(lines, string.format(L["Inspecting: %s"] or "Inspecting: %s", tostring(name or "Unknown")))
	table.insert(lines, "")

	-- Simple property list for export
	local props = {}
	if type(obj) == "table" then
		-- Common properties
		local common = { "GetText", "GetValue", "GetID", "GetWidth", "GetHeight", "IsShown", "IsVisible" }
		for _, method in ipairs(common) do
			if obj[method] and type(obj[method]) == "function" then
				local ok, val = pcall(obj[method], obj)
				if ok then
					table.insert(props, string.format("%s: %s", tostring(method), tostring(val)))
				end
			end
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
				table.insert(props, string.format("%s: %s", tostring(k), tostring(v)))
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
	if self.RefreshWatchList then
		self:RefreshWatchList()
	end
end

function InspectModule:OnHide()
	if self.pickMode then
		self:TogglePickMode()
	end
end

return InspectModule
