-- UI/InspectDetails.lua
-- !Mechanic - Inspect Tab: Details Panel Component (Phase 8)

local ADDON_NAME, ns = ...
local Mechanic = LibStub("AceAddon-3.0"):GetAddon(ADDON_NAME)
local L = LibStub("AceLocale-3.0"):GetLocale(ADDON_NAME, true)
local InspectModule = Mechanic.Inspect

-- Constants for consistent spacing
local SECTION_GAP = 10
local TITLE_HEIGHT = 16
local BOTTOM_PADDING = 4

-- Helper for consistent name resolution
local function getDescriptiveName(target)
	if not target or type(target) ~= "table" then
		return tostring(target or "None")
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

function InspectModule:InitializeDetails(parent)
	local scrollFrame = CreateFrame("ScrollFrame", nil, parent, "UIPanelScrollFrameTemplate")
	scrollFrame:SetPoint("TOPLEFT", 8, -8)
	scrollFrame:SetPoint("BOTTOMRIGHT", -24, 8)
	self.detailsScroll = scrollFrame

	local content = CreateFrame("Frame", nil, scrollFrame)
	content:SetWidth(parent:GetWidth() - 32)
	scrollFrame:SetScrollChild(content)
	self.detailsContent = content

	self.detailSections = {}
end

function InspectModule:UpdateDetails(frame)
	if not self.detailsContent then
		return
	end

	-- Clear old sections
	local L = LibStub("AceLocale-3.0"):GetLocale("!Mechanic")
	for _, section in ipairs(self.detailSections) do
		section:Hide()
	end

	if not frame or type(frame) ~= "table" then
		return
	end

	local yOffset = 0

	-- 1. Header Section
	yOffset = self:AddDetailHeader(frame, yOffset)

	-- 2. Interactivity Section (Frames only)
	if frame.IsMouseEnabled then
		yOffset = self:AddDetailInteractivity(frame, yOffset)
	end

	-- 3. Geometry Section (Frames only)
	if frame.GetObjectType and frame.GetSize then
		yOffset = self:AddDetailGeometry(frame, yOffset)
	end

	-- 4. Anchors Section (Frames only)
	if frame.GetNumPoints then
		yOffset = self:AddDetailAnchors(frame, yOffset)
	end

	-- 5. Regions Section (Frames only)
	if frame.GetRegions then
		yOffset = self:AddDetailRegions(frame, yOffset)
	end

	-- 6. FenUI Section (Ours)
	if frame.fenUISupportsLayout or frame.config or frame.fenUILayout then
		yOffset = self:AddDetailFenUI(frame, yOffset)
	end

	-- 7. Properties Section
	yOffset = self:AddDetailProperties(frame, yOffset)

	-- 8. Attributes Section (Frames only)
	if frame.GetAttribute then
		yOffset = self:AddDetailAttributes(frame, yOffset)
	end

	-- 9. Scripts Section (Frames only)
	if frame.HasScript then
		yOffset = self:AddDetailScripts(frame, yOffset)
	end

	-- 10. Hierarchy Section (Frames only)
	if frame.GetParent then
		yOffset = self:AddDetailHierarchy(frame, yOffset)
	end

	self.detailsContent:SetHeight(-yOffset)
end

function InspectModule:AddDetailHeader(frame, yOffset)
	local section = self:GetOrCreateDetailSection("Header", yOffset)

	local globalName
	if frame.GetName then
		local ok, n = pcall(frame.GetName, frame)
		if ok then
			globalName = n
		end
	end
	local displayName = getDescriptiveName(frame)
	section.title:SetText(displayName)

	local info
	if frame.GetObjectType then
		local okO, objType = pcall(frame.GetObjectType, frame)
		local parent
		if frame.GetParent then
			local okP, p = pcall(frame.GetParent, frame)
			if okP then
				parent = p
			end
		end
		local parentName = parent and getDescriptiveName(parent) or "None"

		local level = 0
		if frame.GetFrameLevel then
			local okL, l = pcall(frame.GetFrameLevel, frame)
			if okL then
				level = l
			end
		end

		local strata = "N/A"
		if frame.GetFrameStrata then
			local okS, s = pcall(frame.GetFrameStrata, frame)
			if okS then
				strata = s
			end
		end

		info = string.format(
			"Type: %s | Level: %d | Strata: %s\nParent: |cff00ff00%s|r\nGlobal: %s",
			objType or "Unknown",
			level,
			strata,
			parentName,
			(globalName and globalName ~= "") and globalName or "<none>"
		)

		-- Create or update Parent jump button
		if parent then
			if not section.parentBtn then
				local btn = CreateFrame("Button", nil, section)
				btn:SetSize(150, 14)
				-- Anchor to the content but specifically over the parent text
				btn:SetPoint("TOPLEFT", section.content, "TOPLEFT", 45, -14)

				-- Visual hover feedback
				local highlight = btn:CreateTexture(nil, "HIGHLIGHT")
				highlight:SetAllPoints()
				highlight:SetColorTexture(1, 1, 1, 0.1)

				section.parentBtn = btn
			end
			section.parentBtn:SetScript("OnClick", function()
				InspectModule:SetSelectedFrame(parent)
			end)
			section.parentBtn:Show()
		elseif section.parentBtn then
			section.parentBtn:Hide()
		end
	else
		info = "Type: Table (Global)"
		if section.parentBtn then
			section.parentBtn:Hide()
		end
	end
	section.content:SetText(info)

	local height = self:GetSectionHeight(section)
	section:SetHeight(height)
	section:Show()
	return yOffset - height - SECTION_GAP
end

function InspectModule:AddDetailInteractivity(frame, yOffset)
	local section = self:GetOrCreateDetailSection("Interactivity", yOffset)
	section.title:SetText("Interactivity")

	-- Safe method access
	local function safeCall(obj, method, ...)
		if obj[method] then
			local ok, val = pcall(obj[method], obj, ...)
			if ok then
				return val
			end
		end
		return nil
	end

	local mouse = safeCall(frame, "IsMouseEnabled") and "|cff00ff00Enabled|r" or "|cff888888Disabled|r"
	local mouseClick = safeCall(frame, "IsMouseClickEnabled") and "|cff00ff00Enabled|r" or "|cff888888Disabled|r"
	local keyboard = safeCall(frame, "IsKeyboardEnabled") and "|cff00ff00Enabled|r" or "|cff888888Disabled|r"
	local propagate = safeCall(frame, "GetPropagateKeyboardInput") and "Yes" or "No"
	local protected = safeCall(frame, "IsProtected") and "|cffff6666Yes|r" or "No"

	local info = string.format(
		"Mouse Motion: %s\nMouse Click: %s\nKeyboard: %s (Propagate: %s)\nProtected: %s",
		mouse,
		mouseClick,
		keyboard,
		propagate,
		protected
	)
	section.content:SetText(info)

	local height = self:GetSectionHeight(section)
	section:SetHeight(height)
	section:Show()
	return yOffset - height - SECTION_GAP
end

function InspectModule:AddDetailGeometry(frame, yOffset)
	local section = self:GetOrCreateDetailSection("Geometry", yOffset)
	section.title:SetText(L["Geometry"])

	-- Safe method access
	local function safeCall(obj, method, ...)
		if obj[method] then
			local ok, val, val2 = pcall(obj[method], obj, ...)
			if ok then
				return val, val2
			end
		end
		return nil
	end

	local w, h = safeCall(frame, "GetSize")
	local scale = safeCall(frame, "GetScale")
	local alpha = safeCall(frame, "GetAlpha")

	-- Calculate effective scale (includes all parents)
	local effectiveScale = safeCall(frame, "GetEffectiveScale") or 1

	-- Calculate effective alpha (includes all parents)
	local effectiveAlpha = alpha or 1
	local parent = safeCall(frame, "GetParent")
	while parent do
		local pAlpha = safeCall(parent, "GetAlpha")
		if pAlpha then
			effectiveAlpha = effectiveAlpha * pAlpha
		end
		parent = safeCall(parent, "GetParent")
	end

	local info = string.format(
		"Size: %.1f x %.1f\nScale: %.2f (Effective: %.2f)\nAlpha: %.2f (Effective: %.2f)\nVisible: %s (Shown: %s)",
		w or 0,
		h or 0,
		scale or 1,
		effectiveScale,
		alpha or 1,
		effectiveAlpha,
		tostring(safeCall(frame, "IsVisible")),
		tostring(safeCall(frame, "IsShown"))
	)
	section.content:SetText(info)

	local height = self:GetSectionHeight(section)
	section:SetHeight(height)
	section:Show()
	return yOffset - height - SECTION_GAP
end

function InspectModule:AddDetailAnchors(frame, yOffset)
	local section = self:GetOrCreateDetailSection("Anchors", yOffset)
	section.title:SetText("Anchors")

	local numPoints = 0
	if frame.GetNumPoints then
		local ok, n = pcall(frame.GetNumPoints, frame)
		if ok then
			numPoints = n
		end
	end

	local anchors = {}

	if numPoints == 0 then
		table.insert(anchors, "No anchors set")
	else
		for i = 1, numPoints do
			local ok, point, relativeTo, relativePoint, xOfs, yOfs = pcall(frame.GetPoint, frame, i)
			if ok then
				local relativeName = "<nil>"
				if relativeTo then
					relativeName = getDescriptiveName(relativeTo)
				end
				table.insert(
					anchors,
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

	section.content:SetText(table.concat(anchors, "\n"))

	local height = self:GetSectionHeight(section)
	section:SetHeight(height)
	section:Show()
	return yOffset - height - SECTION_GAP
end

function InspectModule:AddDetailRegions(frame, yOffset)
	local section = self:GetOrCreateDetailSection("Regions", yOffset)
	section.title:SetText("Regions (Textures/FontStrings)")

	local okR, regions = pcall(function()
		return { frame:GetRegions() }
	end)
	local regionList = {}

	if not okR or not regions or #regions == 0 then
		table.insert(regionList, "None")
	else
		for _, region in ipairs(regions) do
			local objType = "Unknown"
			if region.GetObjectType then
				local okO, ot = pcall(region.GetObjectType, region)
				if okO then
					objType = ot
				end
			end

			local name
			if region.GetName then
				local okN, n = pcall(region.GetName, region)
				if okN then
					name = n
				end
			end

			if name and name ~= "" then
				table.insert(regionList, string.format("[%s] %s", objType, name))
			else
				-- Try to get more info for textures/mask textures
				local extra = ""
				local isTextureType = objType == "Texture" or objType == "MaskTexture"
				if isTextureType then
					-- Try atlas first
					if region.GetAtlas then
						local okA, atlas = pcall(region.GetAtlas, region)
						if okA and atlas and atlas ~= "" then
							extra = " atlas:" .. atlas
						end
					end
					-- If no atlas, try texture file path
					if extra == "" and region.GetTexture then
						local okT, texPath = pcall(region.GetTexture, region)
						if okT and texPath then
							if type(texPath) == "number" then
								-- FileID
								extra = (texPath == 0) and " [empty]" or " fileID:" .. texPath
							elseif type(texPath) == "string" and texPath ~= "" then
								-- Clean up "FileData ID 0" style strings or numeric strings
								local fileID = texPath:match("FileData ID (%d+)") or texPath:match("^(%d+)$")
								if fileID then
									extra = (fileID == "0") and " [empty]" or " fileID:" .. fileID
								else
									-- Extract just the filename from full path
									local filename = texPath:match("([^\\]+)$") or texPath
									extra = " file:" .. filename
								end
							end
						end
					end
				elseif objType == "FontString" then
					-- For FontStrings, show preview + font info
					if region.GetText then
						local okT, text = pcall(region.GetText, region)
						if okT and text and text ~= "" then
							-- Truncate long text
							if #text > 20 then
								text = text:sub(1, 17) .. "..."
							end
							extra = ' "' .. text .. '"'
						end
					end

					-- Add font info (font file and size)
					if region.GetFont then
						local okF, font, size = pcall(region.GetFont, region)
						if okF and font then
							local fontName = font:match("([^\\]+)$") or font
							extra = extra .. " font:" .. fontName .. "(" .. math.floor(size + 0.5) .. ")"
						end
					end
				end
				table.insert(regionList, string.format("[%s] <anonymous>%s", objType, extra))
			end
		end
	end

	section.content:SetText(table.concat(regionList, "\n"))

	local height = self:GetSectionHeight(section)
	section:SetHeight(height)
	section:Show()
	return yOffset - height - SECTION_GAP
end

function InspectModule:AddDetailFenUI(frame, yOffset)
	local section = self:GetOrCreateDetailSection("FenUI", yOffset)
	section.title:SetText("FenUI Details")

	local details = {}
	if frame.fenUILayout then
		table.insert(details, string.format("Layout: |cffffffff%s|r", tostring(frame.fenUILayout)))
	end
	if frame.fenUITheme then
		table.insert(details, string.format("Theme: |cffffffff%s|r", tostring(frame.fenUITheme)))
	end
	if frame.fenUIFrameId then
		table.insert(details, string.format("ID: |cffffffff%s|r", tostring(frame.fenUIFrameId)))
	end
	if frame.borderApplied ~= nil then
		table.insert(
			details,
			string.format("Border: %s", frame.borderApplied and "|cff00ff00Applied|r" or "|cff888888None|r")
		)
	end
	if frame.shadowType then
		table.insert(details, string.format("Shadow: |cffffffff%s|r", tostring(frame.shadowType)))
	end
	if frame.orientation then
		table.insert(details, string.format("Orientation: |cffffffff%s|r", tostring(frame.orientation)))
	end

	-- Extract info from config if available
	if frame.config and type(frame.config) == "table" then
		if frame.config.border then
			table.insert(details, string.format("Config Border: |cffffffff%s|r", tostring(frame.config.border)))
		end
		if frame.config.background then
			local bg = frame.config.background
			if type(bg) == "string" then
				table.insert(details, string.format("Config BG: |cffffffff%s|r", bg))
			elseif type(bg) == "table" then
				if bg.color then
					table.insert(
						details,
						string.format("Config BG: |cffffffff%s|r (alpha %.2f)", tostring(bg.color), bg.alpha or 1)
					)
				elseif bg.image then
					table.insert(details, string.format("Config BG: |cffffffffImage|r (%s)", tostring(bg.image)))
				end
			end
		end
		if frame.config.padding then
			local p = frame.config.padding
			if type(p) == "table" then
				table.insert(
					details,
					string.format(
						"Padding: L:%s R:%s T:%s B:%s",
						tostring(p.left or 0),
						tostring(p.right or 0),
						tostring(p.top or 0),
						tostring(p.bottom or 0)
					)
				)
			else
				table.insert(details, string.format("Padding: %s", tostring(p)))
			end
		end
		if frame.config.gap then
			table.insert(details, string.format("Gap: %s", tostring(frame.config.gap)))
		end
		if frame.config.rows then
			table.insert(details, string.format("Rows: %d", #frame.config.rows))
		end
		if frame.config.cols then
			table.insert(details, string.format("Cols: %d", #frame.config.cols))
		end
	end

	if #details == 0 then
		table.insert(details, "None (Base Layout)")
	end

	section.content:SetText(table.concat(details, "\n"))

	local height = self:GetSectionHeight(section)
	section:SetHeight(height)
	section:Show()
	return yOffset - height - SECTION_GAP
end

function InspectModule:AddDetailProperties(frame, yOffset)
	local section = self:GetOrCreateDetailSection("Properties", yOffset)
	section.title:SetText(L["Common Properties"])

	-- Helper to safely get values (handles Midnight secret values)
	local function safeGet(func, ...)
		local ok, result = pcall(func, ...)
		if not ok then
			return nil, true
		end -- Error, likely secret
		-- Check if result is a secret value (Midnight 12.0+)
		if issecretvalue and issecretvalue(result) then
			return nil, true
		end
		return result, false
	end

	local props = {}
	if type(frame.GetText) == "function" then
		local text, isSecret = safeGet(frame.GetText, frame)
		if isSecret then
			table.insert(props, "Text: [secret]")
		elseif text then
			table.insert(props, string.format("Text: %s", tostring(text)))
		else
			table.insert(props, "Text: nil")
		end
	end
	if type(frame.GetID) == "function" then
		local id, isSecret = safeGet(frame.GetID, frame)
		if not isSecret and id then
			table.insert(props, string.format("ID: %s", tostring(id)))
		end
	end
	if type(frame.GetValue) == "function" then
		local value, isSecret = safeGet(frame.GetValue, frame)
		if isSecret then
			table.insert(props, "Value: [secret]")
		elseif value then
			table.insert(props, string.format("Value: %s", tostring(value)))
		end
	end
	if type(frame.GetMinMaxValues) == "function" then
		local ok, min, max = pcall(frame.GetMinMaxValues, frame)
		if ok and min and max then
			-- Check for secret values
			local minSecret = issecretvalue and issecretvalue(min)
			local maxSecret = issecretvalue and issecretvalue(max)
			if minSecret or maxSecret then
				table.insert(props, "Min/Max: [secret]")
			else
				table.insert(props, string.format("Min/Max: %.1f - %.1f", min, max))
			end
		end
	end

	-- For plain tables, show some members
	if not frame.GetObjectType then
		local ok, formatted = pcall(Mechanic.Utils.FormatValue, Mechanic.Utils, frame, { plain = true })
		if ok and formatted then
			table.insert(props, formatted)
		end
	end

	if #props == 0 then
		table.insert(props, "None")
	end
	section.content:SetText(table.concat(props, "\n"))

	local height = self:GetSectionHeight(section)
	section:SetHeight(height)
	section:Show()
	return yOffset - height - SECTION_GAP
end

function InspectModule:AddDetailAttributes(frame, yOffset)
	local section = self:GetOrCreateDetailSection("Attributes", yOffset)
	section.title:SetText("Attributes")

	-- Helper for consistent value conversion
	local function safeToString(val)
		if val == nil then
			return "nil"
		end
		if issecretvalue and issecretvalue(val) then
			return "[secret]"
		end
		local ok, str = pcall(tostring, val)
		return ok and str or "[error]"
	end

	-- Attributes are key-value pairs set via SetAttribute
	-- There's no way to iterate all attributes, so we check common ones used by Blizzard/addons
	local common = {
		-- Secure Button attributes
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
		"initialConfigFunction",
		-- State Driver attributes
		"state-visibility",
		"state-parent",
		"state-unit",
		"state-page",
		-- Backdrop/UI attributes
		"tableIndex",
		"id",
		"name",
		"label",
		-- UnitFrame attributes
		"showPlayer",
		"showSolo",
		"showParty",
		"showRaid",
	}

	local attributes = {}
	for _, attr in ipairs(common) do
		local val = frame:GetAttribute(attr)
		if val ~= nil then
			table.insert(attributes, string.format("%s: %s", attr, safeToString(val)))
		end
	end

	if #attributes == 0 then
		table.insert(attributes, "None")
	end
	section.content:SetText(table.concat(attributes, "\n"))

	local height = self:GetSectionHeight(section)
	section:SetHeight(height)
	section:Show()
	return yOffset - height - SECTION_GAP
end

function InspectModule:AddDetailScripts(frame, yOffset)
	local section = self:GetOrCreateDetailSection("Scripts", yOffset)
	section.title:SetText(L["Scripts"])

	-- Helper for consistent value conversion
	local function safeToString(val)
		if val == nil then
			return "nil"
		end
		if issecretvalue and issecretvalue(val) then
			return "[secret]"
		end
		local ok, str = pcall(tostring, val)
		return ok and str or "[error]"
	end

	local scripts = {
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

	local active = {}
	for _, script in ipairs(scripts) do
		if frame:HasScript(script) then
			local func = frame:GetScript(script)
			if func then
				-- Get function address for identity checking
				-- WoW tostring(func) can be "function: 0x..." or "function: 000..."
				local str = safeToString(func)
				local addr = str:match(":(%s*0x%x+)") or str:match(":%s*(%x+)") or str:match("(%x+)") or "ptr"
				-- Clean up whitespace and 0x
				addr = addr:gsub("%s", ""):gsub("^0x", "")
				-- Show last 8 chars for brevity if it's a long address
				if #addr > 8 then
					addr = addr:sub(-8)
				end
				table.insert(active, string.format("%s: [%s]", script, addr))
			end
		end
	end

	if #active == 0 then
		table.insert(active, "None")
	end
	section.content:SetText(table.concat(active, "\n"))

	local height = self:GetSectionHeight(section)
	section:SetHeight(height)
	section:Show()
	return yOffset - height - SECTION_GAP
end

function InspectModule:AddDetailHierarchy(frame, yOffset)
	local section = self:GetOrCreateDetailSection("Hierarchy", yOffset)
	section.title:SetText("Hierarchy")

	local stack = {}
	local current = frame
	while current do
		table.insert(stack, getDescriptiveName(current))

		local parent
		if current.GetParent then
			local ok, p = pcall(current.GetParent, current)
			if ok then
				parent = p
			end
		end
		current = parent
	end

	local info = table.concat(stack, " -> ")
	section.content:SetText(info)

	local height = self:GetSectionHeight(section)
	section:SetHeight(height)
	section:Show()
	return yOffset - height - SECTION_GAP
end

function InspectModule:GetOrCreateDetailSection(name, yOffset)
	local section = Mechanic.Utils:GetOrCreateWidget(self.detailsContent, "section_" .. name, function(p)
		local s = CreateFrame("Frame", nil, p)
		s:SetPoint("RIGHT", p, "RIGHT", 0, 0)

		-- Collapse Toggle
		local toggle = CreateFrame("Button", nil, s)
		toggle:SetSize(16, 16)
		toggle:SetPoint("TOPLEFT", 0, 0)

		local toggleText = toggle:CreateFontString(nil, "OVERLAY", "GameFontNormal")
		toggleText:SetPoint("CENTER")
		toggleText:SetText("▼")
		toggle.text = toggleText

		s.isCollapsed = false
		toggle:SetScript("OnClick", function()
			s.isCollapsed = not s.isCollapsed
			toggleText:SetText(s.isCollapsed and "▶" or "▼")
			if s.isCollapsed then
				s.content:Hide()
				if s.parentBtn then
					s.parentBtn:Hide()
				end
			else
				s.content:Show()
				if s.parentBtn then
					s.parentBtn:Show()
				end
			end
			-- Trigger update to recalculate layout
			InspectModule:UpdateDetails(InspectModule.selectedFrame)
		end)
		s.toggle = toggle

		s.title = s:CreateFontString(nil, "OVERLAY", "GameFontNormal")
		s.title:SetPoint("TOPLEFT", 18, 0)

		local font = FenUI:GetFont("fontMono")
		s.content = s:CreateFontString(nil, "OVERLAY", font)
		if not s.content:GetFont() then
			s.content:SetFontObject("ChatFontNormal")
		end

		-- Use a smaller font for details content
		local fontPath, fontSize, fontFlags = s.content:GetFont()
		if fontPath then
			s.content:SetFont(fontPath, fontSize - 1, fontFlags)
		end

		s.content:SetPoint("TOPLEFT", 18, -16)
		s.content:SetJustifyH("LEFT")
		s.content:SetWidth(p:GetWidth() - 20)

		return s
	end)

	section:SetPoint("TOPLEFT", self.detailsContent, "TOPLEFT", 0, yOffset)

	-- Ensure visibility based on collapsed state
	if section.isCollapsed then
		section.content:Hide()
		if section.parentBtn then
			section.parentBtn:Hide()
		end
	else
		section.content:Show()
		if section.parentBtn then
			section.parentBtn:Show()
		end
	end

	self.detailSections[name] = section
	if not _G.tContains(self.detailSections, section) then
		table.insert(self.detailSections, section)
	end

	return section
end

function InspectModule:GetSectionHeight(section)
	if section.isCollapsed then
		return TITLE_HEIGHT + BOTTOM_PADDING
	end
	return TITLE_HEIGHT + (section.content:GetStringHeight() or 14) + BOTTOM_PADDING
end
