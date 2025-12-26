-- UI/InspectDetails.lua
-- !Mechanic - Inspect Tab: Details Panel Component (Phase 8)

local ADDON_NAME, ns = ...
local Mechanic = LibStub("AceAddon-3.0"):GetAddon(ADDON_NAME)
local L = LibStub("AceLocale-3.0"):GetLocale(ADDON_NAME, true)
local InspectModule = Mechanic.Inspect

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

	-- 2. Geometry Section (Frames only)
	if frame.GetObjectType and frame.GetSize then
		yOffset = self:AddDetailGeometry(frame, yOffset)
	end

	-- 3. Properties Section
	yOffset = self:AddDetailProperties(frame, yOffset)

	-- 4. Scripts Section (Frames only)
	if frame.HasScript then
		yOffset = self:AddDetailScripts(frame, yOffset)
	end

	self.detailsContent:SetHeight(-yOffset)
end

function InspectModule:AddDetailHeader(frame, yOffset)
	local section = self:GetOrCreateDetailSection("Header", yOffset)

	local name = frame.GetName and frame:GetName() or "<anonymous>"
	section.title:SetText(name)

	local info
	if frame.GetObjectType then
		info = string.format(
			"Type: %s | Level: %d | Strata: %s",
			frame:GetObjectType(),
			frame.GetFrameLevel and frame:GetFrameLevel() or 0,
			frame.GetFrameStrata and frame:GetFrameStrata() or "N/A"
		)
	else
		info = "Type: Table (Global)"
	end
	section.content:SetText(info)

	local height = 40
	section:SetHeight(height)
	section:Show()
	return yOffset - height - 10
end

function InspectModule:AddDetailGeometry(frame, yOffset)
	local section = self:GetOrCreateDetailSection("Geometry", yOffset)
	section.title:SetText(L["Geometry"])

	local w, h = frame:GetSize()
	local info = string.format(
		"Size: %.1f x %.1f\nScale: %.2f\nAlpha: %.2f\nVisible: %s",
		w,
		h,
		frame:GetScale(),
		frame:GetAlpha(),
		tostring(frame:IsVisible())
	)
	section.content:SetText(info)

	local height = 80
	section:SetHeight(height)
	section:Show()
	return yOffset - height - 10
end

function InspectModule:AddDetailProperties(frame, yOffset)
	local section = self:GetOrCreateDetailSection("Properties", yOffset)
	section.title:SetText(L["Common Properties"])

	-- Helper to safely get values (handles Midnight secret values)
	local function safeGet(func, ...)
		local ok, result = pcall(func, ...)
		if not ok then return nil, true end  -- Error, likely secret
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

	local height = 20 + (section.content:GetStringHeight() or 14)
	section:SetHeight(height)
	section:Show()
	return yOffset - height - 10
end

function InspectModule:AddDetailScripts(frame, yOffset)
	local section = self:GetOrCreateDetailSection("Scripts", yOffset)
	section.title:SetText(L["Scripts"])

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
	}

	local active = {}
	for _, script in ipairs(scripts) do
		if frame:HasScript(script) and frame:GetScript(script) then
			table.insert(active, string.format("%s: [function]", script))
		end
	end

	if #active == 0 then
		table.insert(active, "None")
	end
	section.content:SetText(table.concat(active, "\n"))

	local height = 20 + (#active * 14)
	section:SetHeight(height)
	section:Show()
	return yOffset - height - 10
end

function InspectModule:GetOrCreateDetailSection(name, yOffset)
	local section = Mechanic.Utils:GetOrCreateWidget(self.detailsContent, "section_" .. name, function(p)
		local s = CreateFrame("Frame", nil, p)
		s:SetPoint("RIGHT", p, "RIGHT", 0, 0)

		s.title = s:CreateFontString(nil, "OVERLAY", "GameFontNormal")
		s.title:SetPoint("TOPLEFT", 0, 0)

		s.content = s:CreateFontString(nil, "OVERLAY", "GameFontHighlightSmall")
		s.content:SetPoint("TOPLEFT", 4, -16)
		s.content:SetJustifyH("LEFT")
		s.content:SetWidth(p:GetWidth() - 8)

		return s
	end)

	section:SetPoint("TOPLEFT", self.detailsContent, "TOPLEFT", 0, yOffset)
	self.detailSections[name] = section
	if not _G.tContains(self.detailSections, section) then
		table.insert(self.detailSections, section)
	end

	return section
end
