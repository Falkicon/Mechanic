-- UI/Inspect.lua
-- !Mechanic - Inspect Tab Module (Phase 8)
--
-- Unified frame inspection and watch system.

local ADDON_NAME, ns = ...
local Mechanic = LibStub("AceAddon-3.0"):GetAddon(ADDON_NAME)
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

	-- Create Pick Overlay (High Strata)
	local pickOverlay = CreateFrame("Frame", nil, UIParent)
	pickOverlay:SetFrameStrata("TOOLTIP")
	pickOverlay:Hide()
	InspectModule.pickOverlay = pickOverlay

	local pickBorder = pickOverlay:CreateTexture(nil, "OVERLAY")
	pickBorder:SetAllPoints()
	pickBorder:SetColorTexture(0.2, 0.6, 1, 0.4) -- Light blue semi-transparent
	
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
	local pickBtn = CreateFrame("Button", nil, toolbar, "UIPanelButtonTemplate")
	pickBtn:SetSize(60, 24)
	pickBtn:SetPoint("LEFT", 8, 0)
	pickBtn:SetText("Pick")
	pickBtn:SetScript("OnClick", function()
		InspectModule:TogglePickMode()
	end)
	InspectModule.pickBtn = pickBtn

	-- Path Input
	local pathInput = CreateFrame("EditBox", nil, toolbar, "InputBoxTemplate")
	pathInput:SetPoint("LEFT", pickBtn, "RIGHT", 8, 0)
	pathInput:SetPoint("RIGHT", -120, 0)
	pathInput:SetHeight(20)
	pathInput:SetAutoFocus(false)
	pathInput:SetScript("OnEnterPressed", function(eb)
		eb:ClearFocus()
		InspectModule:InspectPath(eb:GetText())
	end)
	InspectModule.pathInput = pathInput

	-- Watch Button
	local watchBtn = CreateFrame("Button", nil, toolbar, "UIPanelButtonTemplate")
	watchBtn:SetSize(80, 24)
	watchBtn:SetPoint("LEFT", pathInput, "RIGHT", 8, 0)
	watchBtn:SetText("+ Watch")
	watchBtn:SetScript("OnClick", function()
		InspectModule:WatchCurrent()
	end)
	InspectModule.watchBtn = watchBtn

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

	-- Initialize Sub-modules (to be created next)
	if InspectModule.InitializeTree then InspectModule:InitializeTree(treeFrame) end
	if InspectModule.InitializeDetails then InspectModule:InitializeDetails(detailsFrame) end
	if InspectModule.InitializeWatch then InspectModule:InitializeWatch(watchFrame) end
end

function InspectModule:TogglePickMode()
	self.pickMode = not self.pickMode
	if self.pickMode then
		self.pickBtn:SetText("Picking...")
		self:StartPicking()
	else
		self.pickBtn:SetText("Pick")
		self:StopPicking()
	end
end

function InspectModule:StartPicking()
	self.pickOverlay:Show()
	self.pickOverlay:SetScript("OnUpdate", function(s)
		local focus = GetMouseFocus()
		if focus and focus ~= s and focus ~= UIParent then
			s:ClearAllPoints()
			s:SetPoint("TOPLEFT", focus, "TOPLEFT", -2, 2)
			s:SetPoint("BOTTOMRIGHT", focus, "BOTTOMRIGHT", 2, -2)
		else
			s:Hide()
		end
	end)

	-- We use a hidden button to capture the click without tainting everything
	if not self.pickCapturer then
		local cap = CreateFrame("Button", nil, UIParent)
		cap:SetAllPoints()
		cap:SetFrameStrata("TOOLTIP")
		cap:RegisterForClicks("AnyUp")
		cap:SetScript("OnClick", function(_, button)
			if button == "LeftButton" then
				local focus = GetMouseFocus()
				if focus and focus ~= cap then
					InspectModule:SetSelectedFrame(focus)
				end
			end
			InspectModule:TogglePickMode()
		end)
		cap:SetScript("OnKeyDown", function(_, key)
			if key == "ESCAPE" then
				InspectModule:TogglePickMode()
			end
		end)
		cap:SetPropagateKeyboardInput(false)
		self.pickCapturer = cap
	end
	self.pickCapturer:Show()
	self.pickCapturer:SetFocus()
end

function InspectModule:StopPicking()
	self.pickOverlay:Hide()
	self.pickOverlay:SetScript("OnUpdate", nil)
	if self.pickCapturer then
		self.pickCapturer:Hide()
	end
end

function InspectModule:InspectPath(path)
	local frame = ns.FrameResolver:ResolvePath(path)
	if frame then
		self:SetSelectedFrame(frame, path)
	else
		Mechanic:Print("Could not resolve path: " .. tostring(path))
	end
end

function InspectModule:SetSelectedFrame(frame, path)
	self.selectedFrame = frame
	local displayPath = path or ns.FrameResolver:GetFramePath(frame)
	self.pathInput:SetText(displayPath or "<anonymous>")
	
	if self.UpdateTree then self:UpdateTree(frame) end
	if self.UpdateDetails then self:UpdateDetails(frame) end
end

function InspectModule:WatchCurrent()
	if not self.selectedFrame then return end
	
	local MechanicLib = LibStub("MechanicLib-1.0", true)
	if MechanicLib then
		local path = self.pathInput:GetText()
		MechanicLib:AddToWatchList(self.selectedFrame, path, { source = "Manual" })
	end
end

function InspectModule:OnShow()
	if not self.frame then Mechanic:InitializeInspect() end
	if self.RefreshWatchList then self:RefreshWatchList() end
end

function InspectModule:OnHide()
	if self.pickMode then self:TogglePickMode() end
end

return InspectModule

