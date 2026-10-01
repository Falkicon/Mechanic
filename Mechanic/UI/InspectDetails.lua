-- UI/InspectDetails.lua
-- !Mechanic - Inspect Tab: Details Panel Component (Phase 8)

local ADDON_NAME, ns = ...
local Mechanic = LibStub("AceAddon-3.0"):GetAddon(ADDON_NAME)
local L = LibStub("AceLocale-3.0"):GetLocale(ADDON_NAME, true)
local InspectModule = Mechanic.Inspect
local SafeValue = ns.SafeValue

-- Constants for consistent spacing
local SECTION_GAP = 10
local TITLE_HEIGHT = 16
local BOTTOM_PADDING = 4
local MAX_HIERARCHY_DEPTH = 64

-- Protected method call returning the raw results (secret values included; callers
-- must format them through SafeValue). Returns nil when missing or erroring.
local function pget(obj, method, ...)
	if type(obj) ~= "table" or not obj[method] then
		return nil
	end
	local ok, a, b = pcall(obj[method], obj, ...)
	if ok then
		return a, b
	end
	return nil
end

local function yesNo(value, yes, no)
	if SafeValue.IsSecret(value) then
		return "[secret]"
	end
	return value and yes or no
end

local function plainName(value, empty)
	if SafeValue.IsSecret(value) then
		return "[secret]"
	end
	if type(value) == "string" and value ~= "" then
		return value
	end
	return empty
end

function InspectModule:InitializeDetails(parent)
	self.detailsHeader = self:CreateColumnHeader(parent, L["Details"])

	local scrollFrame = CreateFrame("ScrollFrame", nil, parent, "UIPanelScrollFrameTemplate")
	scrollFrame:SetPoint("TOPLEFT", 8, -(self.COLUMN_HEADER_HEIGHT + 8))
	scrollFrame:SetPoint("BOTTOMRIGHT", -24, 8)
	FenUI:SkinScrollFrame(scrollFrame, { offset = 5 })
	self.detailsScroll = scrollFrame

	local content = CreateFrame("Frame", nil, scrollFrame)
	content:SetWidth(parent:GetWidth() - 32)
	scrollFrame:SetScrollChild(content)
	self.detailsContent = content

	-- Array of every section frame ever created (hidden on each update, re-shown as needed)
	self.detailSections = {}
end

function InspectModule:UpdateDetails(frame)
	if not self.detailsContent then
		return
	end

	for _, section in ipairs(self.detailSections) do
		section:Hide()
	end

	if not frame or type(frame) ~= "table" then
		return
	end

	-- Each builder is [condition, function]; a failing section must not hide the rest.
	local builders = {
		{ true, self.AddDetailHeader },
		{ frame.IsMouseEnabled, self.AddDetailInteractivity },
		{ frame.GetObjectType and frame.GetSize, self.AddDetailGeometry },
		{ frame.GetNumPoints, self.AddDetailAnchors },
		{ frame.GetRegions, self.AddDetailRegions },
		{ frame.fenUISupportsLayout or frame.config or frame.fenUILayout, self.AddDetailFenUI },
		{ true, self.AddDetailProperties },
		{ frame.GetAttribute, self.AddDetailAttributes },
		{ frame.HasScript, self.AddDetailScripts },
		{ frame.GetParent, self.AddDetailHierarchy },
	}

	local yOffset = 0
	for _, builder in ipairs(builders) do
		if builder[1] then
			local ok, result = pcall(builder[2], self, frame, yOffset)
			if ok then
				yOffset = result
			end
		end
	end

	self.detailsContent:SetHeight(-yOffset)
end

-- Fill a section with text, size it, and return the offset for the next one.
function InspectModule:FinishDetailSection(section, text, yOffset)
	section.content:SetText(text)

	local height = self:GetSectionHeight(section)
	section:SetHeight(height)
	section:Show()
	return yOffset - height - SECTION_GAP
end

function InspectModule:AddDetailHeader(frame, yOffset)
	local section = self:GetOrCreateDetailSection("Header", yOffset)

	local displayName = ns.FrameResolver:GetDisplayName(frame)
	section.title:SetText(displayName)

	local info
	if frame.GetObjectType then
		local parent = pget(frame, "GetParent")
		local parentName = parent and ns.FrameResolver:GetDisplayName(parent) or (L["None"] or "None")

		info = string.format(
			"Type: %s | Level: %s | Strata: %s\nParent: |cff00ff00%s|r\nGlobal: %s",
			SafeValue.ToString((pget(frame, "GetObjectType"))),
			SafeValue.FormatNumber((pget(frame, "GetFrameLevel")), "%d", "0"),
			SafeValue.ToString((pget(frame, "GetFrameStrata"))),
			parentName,
			plainName((pget(frame, "GetName")), "<none>")
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
				highlight:SetColorTexture(FenUI:GetColor("surfaceRowHover"))

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

	return self:FinishDetailSection(section, info, yOffset)
end

function InspectModule:AddDetailInteractivity(frame, yOffset)
	local section = self:GetOrCreateDetailSection("Interactivity", yOffset)
	section.title:SetText(L["Interactivity"] or "Interactivity")

	local function enabled(method)
		return yesNo((pget(frame, method)), "|cff00ff00Enabled|r", "|cff888888Disabled|r")
	end

	local info = string.format(
		"Mouse Motion: %s\nMouse Click: %s\nKeyboard: %s (Propagate: %s)\nProtected: %s",
		enabled("IsMouseEnabled"),
		enabled("IsMouseClickEnabled"),
		enabled("IsKeyboardEnabled"),
		yesNo((pget(frame, "GetPropagateKeyboardInput")), "Yes", "No"),
		yesNo((pget(frame, "IsProtected")), "|cffff6666Yes|r", "No")
	)

	return self:FinishDetailSection(section, info, yOffset)
end

function InspectModule:AddDetailGeometry(frame, yOffset)
	local section = self:GetOrCreateDetailSection("Geometry", yOffset)
	section.title:SetText(L["Geometry"])

	local w, h = pget(frame, "GetSize")
	local scale = pget(frame, "GetScale")
	local alpha = pget(frame, "GetAlpha")
	local effectiveScale = pget(frame, "GetEffectiveScale")

	-- Effective alpha multiplies every ancestor; skip it when any value is secret
	local effectiveAlpha
	if type(alpha) == "number" and not SafeValue.IsSecret(alpha) then
		effectiveAlpha = alpha
		local parent = pget(frame, "GetParent")
		local depth = 0
		while parent and depth < MAX_HIERARCHY_DEPTH do
			local pAlpha = pget(parent, "GetAlpha")
			if type(pAlpha) == "number" and not SafeValue.IsSecret(pAlpha) then
				effectiveAlpha = effectiveAlpha * pAlpha
			else
				effectiveAlpha = nil
				break
			end
			parent = pget(parent, "GetParent")
			depth = depth + 1
		end
	end

	local info = string.format(
		"Size: %s x %s\nScale: %s (Effective: %s)\nAlpha: %s (Effective: %s)\nVisible: %s (Shown: %s)",
		SafeValue.FormatNumber(w, "%.1f"),
		SafeValue.FormatNumber(h, "%.1f"),
		SafeValue.FormatNumber(scale, "%.2f"),
		SafeValue.FormatNumber(effectiveScale, "%.2f"),
		SafeValue.FormatNumber(alpha, "%.2f"),
		SafeValue.FormatNumber(effectiveAlpha, "%.2f", "[secret]"),
		yesNo((pget(frame, "IsVisible")), "true", "false"),
		yesNo((pget(frame, "IsShown")), "true", "false")
	)

	return self:FinishDetailSection(section, info, yOffset)
end

function InspectModule:AddDetailAnchors(frame, yOffset)
	local section = self:GetOrCreateDetailSection("Anchors", yOffset)
	section.title:SetText(L["Anchors"] or "Anchors")

	local numPoints = pget(frame, "GetNumPoints")
	if SafeValue.IsSecret(numPoints) or type(numPoints) ~= "number" then
		numPoints = 0
	end

	local anchors = {}
	if numPoints == 0 then
		table.insert(anchors, "No anchors set")
	else
		for i = 1, numPoints do
			local ok, point, relativeTo, relativePoint, xOfs, yOfs = pcall(frame.GetPoint, frame, i)
			if ok then
				table.insert(
					anchors,
					string.format(
						"%s -> %s:%s (%s, %s)",
						SafeValue.ToString(point),
						relativeTo and ns.FrameResolver:GetDisplayName(relativeTo) or "<nil>",
						SafeValue.ToString(relativePoint),
						SafeValue.FormatNumber(xOfs, "%.0f", "0"),
						SafeValue.FormatNumber(yOfs, "%.0f", "0")
					)
				)
			end
		end
	end

	return self:FinishDetailSection(section, table.concat(anchors, "\n"), yOffset)
end

function InspectModule:AddDetailRegions(frame, yOffset)
	local section = self:GetOrCreateDetailSection("Regions", yOffset)
	section.title:SetText(L["Regions (Textures/FontStrings)"] or "Regions (Textures/FontStrings)")

	local okR, regions = pcall(function()
		return { frame:GetRegions() }
	end)
	local regionList = {}

	if not okR or #regions == 0 then
		table.insert(regionList, L["None"] or "None")
	else
		for _, region in ipairs(regions) do
			table.insert(regionList, self.DescribeRegion(region))
		end
	end

	return self:FinishDetailSection(section, table.concat(regionList, "\n"), yOffset)
end

function InspectModule:AddDetailFenUI(frame, yOffset)
	local section = self:GetOrCreateDetailSection("FenUI", yOffset)
	section.title:SetText(L["FenUI Details"] or "FenUI Details")

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
			string.format(
				"Border: %s",
				frame.borderApplied and "|cff00ff00Applied|r" or ("|cff888888" .. (L["None"] or "None") .. "|r")
			)
		)
	end
	if frame.shadowType then
		table.insert(details, string.format("Shadow: |cffffffff%s|r", tostring(frame.shadowType)))
	end
	if frame.orientation then
		table.insert(details, string.format("Orientation: |cffffffff%s|r", tostring(frame.orientation)))
	end

	-- Extract info from config if available
	local config = frame.config
	if type(config) == "table" then
		if config.border then
			table.insert(details, string.format("Config Border: |cffffffff%s|r", tostring(config.border)))
		end
		local bg = config.background
		if type(bg) == "string" then
			table.insert(details, string.format("Config BG: |cffffffff%s|r", bg))
		elseif type(bg) == "table" then
			if bg.color then
				table.insert(
					details,
					string.format("Config BG: |cffffffff%s|r (alpha %.2f)", tostring(bg.color), tonumber(bg.alpha) or 1)
				)
			elseif bg.image then
				table.insert(details, string.format("Config BG: |cffffffffImage|r (%s)", tostring(bg.image)))
			end
		end
		local p = config.padding
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
		elseif p then
			table.insert(details, string.format("Padding: %s", tostring(p)))
		end
		if config.gap then
			table.insert(details, string.format("Gap: %s", tostring(config.gap)))
		end
		if type(config.rows) == "table" then
			table.insert(details, string.format("Rows: %d", #config.rows))
		end
		if type(config.cols) == "table" then
			table.insert(details, string.format("Cols: %d", #config.cols))
		end
	end

	if #details == 0 then
		table.insert(details, "None (Base Layout)")
	end

	return self:FinishDetailSection(section, table.concat(details, "\n"), yOffset)
end

function InspectModule:AddDetailProperties(frame, yOffset)
	local section = self:GetOrCreateDetailSection("Properties", yOffset)
	section.title:SetText(L["Common Properties"])

	local props = {}
	if type(frame.GetText) == "function" then
		local ok, text = pcall(frame.GetText, frame)
		if ok and (SafeValue.IsSecret(text) or text ~= nil) then
			table.insert(props, "Text: " .. SafeValue.ToString(text))
		else
			table.insert(props, "Text: nil")
		end
	end
	if type(frame.GetID) == "function" then
		local id = pget(frame, "GetID")
		if not SafeValue.IsSecret(id) and id then
			table.insert(props, string.format("ID: %s", tostring(id)))
		end
	end
	if type(frame.GetValue) == "function" then
		local ok, value = pcall(frame.GetValue, frame)
		if ok and (SafeValue.IsSecret(value) or value) then
			table.insert(props, "Value: " .. SafeValue.ToString(value))
		end
	end
	if type(frame.GetMinMaxValues) == "function" then
		local ok, min, max = pcall(frame.GetMinMaxValues, frame)
		if ok and (SafeValue.IsSecret(min) or min) and (SafeValue.IsSecret(max) or max) then
			if SafeValue.IsSecret(min) or SafeValue.IsSecret(max) then
				table.insert(props, "Min/Max: [secret]")
			else
				table.insert(
					props,
					string.format(
						"Min/Max: %s - %s",
						SafeValue.FormatNumber(min, "%.1f"),
						SafeValue.FormatNumber(max, "%.1f")
					)
				)
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
		table.insert(props, L["None"] or "None")
	end

	return self:FinishDetailSection(section, table.concat(props, "\n"), yOffset)
end

function InspectModule:AddDetailAttributes(frame, yOffset)
	local section = self:GetOrCreateDetailSection("Attributes", yOffset)
	section.title:SetText(L["Attributes"] or "Attributes")

	-- Attributes are key-value pairs set via SetAttribute and cannot be enumerated,
	-- so the ones used by Blizzard/addon secure templates are probed.
	local attributes = {}
	for _, attr in ipairs(self.COMMON_ATTRIBUTES) do
		local val = pget(frame, "GetAttribute", attr)
		if SafeValue.IsSecret(val) or val ~= nil then
			table.insert(attributes, string.format("%s: %s", attr, SafeValue.ToString(val)))
		end
	end

	if #attributes == 0 then
		table.insert(attributes, L["None"] or "None")
	end

	return self:FinishDetailSection(section, table.concat(attributes, "\n"), yOffset)
end

function InspectModule:AddDetailScripts(frame, yOffset)
	local section = self:GetOrCreateDetailSection("Scripts", yOffset)
	section.title:SetText(L["Scripts"])

	-- Handler identity is shown as the last 8 hex digits of the function address
	local active = {}
	for _, script in ipairs(self.COMMON_SCRIPTS) do
		if pget(frame, "HasScript", script) then
			local func = pget(frame, "GetScript", script)
			if func then
				table.insert(active, string.format("%s: %s", script, SafeValue.ToString(func)))
			end
		end
	end

	if #active == 0 then
		table.insert(active, L["None"] or "None")
	end

	return self:FinishDetailSection(section, table.concat(active, "\n"), yOffset)
end

function InspectModule:AddDetailHierarchy(frame, yOffset)
	local section = self:GetOrCreateDetailSection("Hierarchy", yOffset)
	section.title:SetText(L["Hierarchy"] or "Hierarchy")

	local stack = {}
	local current = frame
	while current and #stack < MAX_HIERARCHY_DEPTH do
		table.insert(stack, ns.FrameResolver:GetDisplayName(current))
		current = pget(current, "GetParent")
	end

	return self:FinishDetailSection(section, table.concat(stack, " -> "), yOffset)
end

function InspectModule:GetOrCreateDetailSection(name, yOffset)
	local section = Mechanic.Utils:GetOrCreateWidget(self.detailsContent, "section_" .. name, function(p)
		local s = CreateFrame("Frame", nil, p)
		s:SetPoint("RIGHT", p, "RIGHT", 0, 0)

		-- Collapse Toggle
		local toggle = CreateFrame("Button", nil, s)
		toggle:SetSize(16, 16)
		toggle:SetPoint("TOPLEFT", 0, 0)

		-- Drawn chevron (down = expanded, right = collapsed)
		local chevron = FenUI:CreateChevron(toggle, "down")
		chevron:SetPoint("CENTER")
		toggle.chevron = chevron
		toggle:SetScript("OnEnter", function()
			chevron:SetColor(FenUI:GetColor("textStrong"))
		end)
		toggle:SetScript("OnLeave", function()
			chevron:SetColor(FenUI:GetColor("textMuted"))
		end)

		s.isCollapsed = false
		toggle:SetScript("OnClick", function()
			s.isCollapsed = not s.isCollapsed
			chevron:SetDirection(s.isCollapsed and "right" or "down")
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

		s.title = s:CreateFontString(nil, "OVERLAY", FenUI:GetFont("fontBody"))
		s.title:SetTextColor(FenUI:GetColorRGB("textHeading"))
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

		s.content:SetPoint("TOPLEFT", 18, -18)
		s.content:SetJustifyH("LEFT")
		s.content:SetSpacing(2) -- A little air between data lines

		-- Muted labels, bright values: color each line's leading "Label:" so
		-- rows scan faster. Lines that don't start with a plain label (anchor
		-- chains, region lists, pre-colored text) pass through unchanged.
		local labelHex = "ff" .. FenUI:GetColorHex("textMuted")
		local rawSetText = s.content.SetText
		s.content.SetText = function(fs, text)
			if type(text) == "string" then
				text = text:gsub("[^\n]+", function(line)
					local label, rest = line:match("^([%w][%w %-/%%%(%)%.]-):(%s.*)$")
					if label and #label <= 28 then
						-- Also mute inline labels in combined rows ("Type: Frame | Level: 0")
						rest = rest:gsub("(|%s)(%a[%w ]-):(%s)", "%1|c" .. labelHex .. "%2:|r%3")
						return "|c" .. labelHex .. label .. ":|r" .. rest
					end
					return line
				end)
			end
			rawSetText(fs, text)
		end
		s.content:SetWidth(p:GetWidth() - 20)

		-- Sections are created once and then reused, so register each exactly once
		table.insert(self.detailSections, s)
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

	return section
end

function InspectModule:GetSectionHeight(section)
	if section.isCollapsed then
		return TITLE_HEIGHT + BOTTOM_PADDING
	end
	return TITLE_HEIGHT + (section.content:GetStringHeight() or 14) + BOTTOM_PADDING
end
