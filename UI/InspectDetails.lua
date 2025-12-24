-- UI/InspectDetails.lua
-- !Mechanic - Inspect Tab: Details Panel Component (Phase 8)

local ADDON_NAME, ns = ...
local Mechanic = LibStub("AceAddon-3.0"):GetAddon(ADDON_NAME)
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
	if not self.detailsContent then return end
	
	-- Clear old sections
	for _, section in ipairs(self.detailSections) do
		section:Hide()
	end
	
	if not frame then return end

	local yOffset = 0

	-- 1. Header Section
	yOffset = self:AddDetailHeader(frame, yOffset)
	
	-- 2. Geometry Section
	yOffset = self:AddDetailGeometry(frame, yOffset)
	
	-- 3. Properties Section
	yOffset = self:AddDetailProperties(frame, yOffset)
	
	-- 4. Scripts Section
	yOffset = self:AddDetailScripts(frame, yOffset)

	self.detailsContent:SetHeight(-yOffset)
end

function InspectModule:AddDetailHeader(frame, yOffset)
	local section = self:GetOrCreateDetailSection("Header", yOffset)
	section.title:SetText(frame:GetName() or "<anonymous>")
	
	local info = string.format("Type: %s | Level: %d | Strata: %s", 
		frame:GetObjectType(), frame:GetFrameLevel(), frame:GetFrameStrata())
	section.content:SetText(info)
	
	local height = 40
	section:SetHeight(height)
	section:Show()
	return yOffset - height - 10
end

function InspectModule:AddDetailGeometry(frame, yOffset)
	local section = self:GetOrCreateDetailSection("Geometry", yOffset)
	section.title:SetText("Geometry")
	
	local w, h = frame:GetSize()
	local info = string.format("Size: %.1f x %.1f\nScale: %.2f\nAlpha: %.2f\nVisible: %s", 
		w, h, frame:GetScale(), frame:GetAlpha(), tostring(frame:IsVisible()))
	section.content:SetText(info)
	
	local height = 80
	section:SetHeight(height)
	section:Show()
	return yOffset - height - 10
end

function InspectModule:AddDetailProperties(frame, yOffset)
	local section = self:GetOrCreateDetailSection("Properties", yOffset)
	section.title:SetText("Common Properties")
	
	local props = {}
	if frame.GetText then table.insert(props, "Text: " .. tostring(frame:GetText())) end
	if frame.GetValue then table.insert(props, "Value: " .. tostring(frame:GetValue())) end
	if frame.GetMinMaxValues then 
		local min, max = frame:GetMinMaxValues()
		table.insert(props, string.format("Min/Max: %.1f - %.1f", min, max)) 
	end
	
	if #props == 0 then table.insert(props, "None") end
	section.content:SetText(table.concat(props, "\n"))
	
	local height = 20 + (#props * 14)
	section:SetHeight(height)
	section:Show()
	return yOffset - height - 10
end

function InspectModule:AddDetailScripts(frame, yOffset)
	local section = self:GetOrCreateDetailSection("Scripts", yOffset)
	section.title:SetText("Scripts")
	
	local scripts = {
		"OnUpdate", "OnEvent", "OnShow", "OnHide", "OnEnter", "OnLeave", 
		"OnMouseDown", "OnMouseUp", "OnClick", "OnValueChanged"
	}
	
	local active = {}
	for _, script in ipairs(scripts) do
		if frame:HasScript(script) and frame:GetScript(script) then
			table.insert(active, script .. ": [function]")
		end
	end
	
	if #active == 0 then table.insert(active, "None") end
	section.content:SetText(table.concat(active, "\n"))
	
	local height = 20 + (#active * 14)
	section:SetHeight(height)
	section:Show()
	return yOffset - height - 10
end

function InspectModule:GetOrCreateDetailSection(name, yOffset)
	if self.detailSections[name] then
		local s = self.detailSections[name]
		s:SetPoint("TOPLEFT", self.detailsContent, "TOPLEFT", 0, yOffset)
		return s
	end

	local section = CreateFrame("Frame", nil, self.detailsContent)
	section:SetPoint("TOPLEFT", self.detailsContent, "TOPLEFT", 0, yOffset)
	section:SetPoint("RIGHT", self.detailsContent, "RIGHT", 0, 0)
	
	local title = section:CreateFontString(nil, "OVERLAY", "GameFontNormal")
	title:SetPoint("TOPLEFT", 0, 0)
	section.title = title
	
	local content = section:CreateFontString(nil, "OVERLAY", "GameFontHighlightSmall")
	content:SetPoint("TOPLEFT", 4, -16)
	content:SetJustifyH("LEFT")
	content:SetWidth(self.detailsContent:GetWidth() - 8)
	section.content = content

	self.detailSections[name] = section
	table.insert(self.detailSections, section)
	return section
end

