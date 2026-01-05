--------------------------------------------------------------------------------
-- FenUI v2 - Dependency Checker
--
-- Validates that all Blizzard APIs, layouts, and atlases FenUI depends on exist.
-- Run via: /fenui validate
--------------------------------------------------------------------------------

local FenUI = FenUI

FenUI.Validation = {}

--------------------------------------------------------------------------------
-- Dependency Definitions
--------------------------------------------------------------------------------

FenUI.Validation.Dependencies = {
	-- Core APIs that must exist
	apis = {
		{ name = "NineSliceUtil", path = "NineSliceUtil" },
		{ name = "NineSliceUtil.ApplyLayout", path = "NineSliceUtil.ApplyLayout" },
		{ name = "NineSliceUtil.GetLayout", path = "NineSliceUtil.GetLayout" },
		{ name = "NineSliceLayouts", path = "NineSliceLayouts" },
		{ name = "NineSlicePanelMixin", path = "NineSlicePanelMixin" },
		{ name = "C_Texture.GetAtlasInfo", path = "C_Texture.GetAtlasInfo" },
		{ name = "CreateFromMixins", path = "CreateFromMixins" },
		{ name = "Mixin", path = "Mixin" },
	},

	-- Blizzard NineSlice layouts we use
	layouts = {
		-- Core layouts
		"SimplePanelTemplate",
		"PortraitFrameTemplate",
		"ButtonFrameTemplateNoPortrait",
		"InsetFrameTemplate",
		"GenericMetal",
		"Dialog",

		-- Expansion-specific
		"DragonflightMissionFrame",
		"CovenantMissionFrame",
		"BFAMissionHorde",
		"BFAMissionAlliance",
	},

	-- Atlas textures we may reference
	atlases = {
		-- SimpleMetal frame
		"UI-Frame-SimpleMetal-CornerTopLeft",
		"_UI-Frame-SimpleMetal-EdgeTop",
		"!UI-Frame-SimpleMetal-EdgeLeft",

		-- Metal frame
		"UI-Frame-Metal-CornerTopLeft",
		"UI-Frame-Metal-CornerTopRight",
		"UI-Frame-Metal-CornerBottomLeft",
		"UI-Frame-Metal-CornerBottomRight",

		-- Inset frame
		"UI-Frame-InnerTopLeft",
		"UI-Frame-InnerTopRight",
		"UI-Frame-InnerBotLeftCorner",
		"UI-Frame-InnerBotRight",

		-- Generic metal
		"UI-Frame-GenericMetal-Corner",
	},
}

--------------------------------------------------------------------------------
-- Validation Functions
--------------------------------------------------------------------------------

local function CheckAPI(apiDef)
	local parts = { strsplit(".", apiDef.path) }
	local current = _G

	for _, part in ipairs(parts) do
		if current == nil then
			return false, "Parent is nil"
		end
		current = current[part]
		if current == nil then
			return false, "Not found"
		end
	end

	return true, type(current)
end

local function CheckLayout(layoutName)
	if not NineSliceLayouts then
		return false, "NineSliceLayouts not loaded"
	end

	local layout = NineSliceLayouts[layoutName]
	if layout then
		return true, "exists"
	else
		return false, "Not found"
	end
end

local function CheckAtlas(atlasName)
	if not C_Texture or not C_Texture.GetAtlasInfo then
		return false, "C_Texture.GetAtlasInfo not available"
	end

	local info = C_Texture.GetAtlasInfo(atlasName)
	if info then
		return true, string.format("%dx%d", info.width or 0, info.height or 0)
	else
		return false, "Not found"
	end
end

--------------------------------------------------------------------------------
-- Main Validation Runner
--------------------------------------------------------------------------------

function FenUI.Validation:Run(verbose)
	local results = {
		valid = true,
		timestamp = date("%Y-%m-%d %H:%M:%S"),
		gameVersion = GetBuildInfo(),
		apis = { passed = 0, failed = 0, missing = {} },
		layouts = { passed = 0, failed = 0, missing = {} },
		atlases = { passed = 0, failed = 0, missing = {} },
	}

	-- Check APIs
	for _, apiDef in ipairs(self.Dependencies.apis) do
		local ok, detail = CheckAPI(apiDef)
		if ok then
			results.apis.passed = results.apis.passed + 1
			if verbose then
				print(string.format("  |cff00ff00OK|r API: %s (%s)", apiDef.name, detail))
			end
		else
			results.apis.failed = results.apis.failed + 1
			results.valid = false
			table.insert(results.apis.missing, { name = apiDef.name, reason = detail })
			if verbose then
				print(string.format("  |cffff0000FAIL|r API: %s (%s)", apiDef.name, detail))
			end
		end
	end

	-- Check Layouts
	for _, layoutName in ipairs(self.Dependencies.layouts) do
		local ok, detail = CheckLayout(layoutName)
		if ok then
			results.layouts.passed = results.layouts.passed + 1
			if verbose then
				print(string.format("  |cff00ff00OK|r Layout: %s", layoutName))
			end
		else
			results.layouts.failed = results.layouts.failed + 1
			results.valid = false
			table.insert(results.layouts.missing, { name = layoutName, reason = detail })
			if verbose then
				print(string.format("  |cffff0000FAIL|r Layout: %s (%s)", layoutName, detail))
			end
		end
	end

	-- Check Atlases
	for _, atlasName in ipairs(self.Dependencies.atlases) do
		local ok, detail = CheckAtlas(atlasName)
		if ok then
			results.atlases.passed = results.atlases.passed + 1
			if verbose then
				print(string.format("  |cff00ff00OK|r Atlas: %s (%s)", atlasName, detail))
			end
		else
			results.atlases.failed = results.atlases.failed + 1
			results.valid = false
			table.insert(results.atlases.missing, { name = atlasName, reason = detail })
			if verbose then
				print(string.format("  |cffff0000FAIL|r Atlas: %s (%s)", atlasName, detail))
			end
		end
	end

	return results
end

--------------------------------------------------------------------------------
-- Report Generation
--------------------------------------------------------------------------------

function FenUI.Validation:PrintReport(results)
	print(" ")
	print("|cff88ccffFenUI Dependency Validation|r")
	print("================================")
	print("Game Version:", results.gameVersion)
	print("Checked:", results.timestamp)
	print(" ")

	-- Summary
	local apiTotal = results.apis.passed + results.apis.failed
	local layoutTotal = results.layouts.passed + results.layouts.failed
	local atlasTotal = results.atlases.passed + results.atlases.failed

	local apiStatus = results.apis.failed == 0 and "|cff00ff00OK|r" or "|cffff6600WARN|r"
	local layoutStatus = results.layouts.failed == 0 and "|cff00ff00OK|r" or "|cffff6600WARN|r"
	local atlasStatus = results.atlases.failed == 0 and "|cff00ff00OK|r" or "|cffff6600WARN|r"

	print(string.format("APIs:    %s %d/%d", apiStatus, results.apis.passed, apiTotal))
	print(string.format("Layouts: %s %d/%d", layoutStatus, results.layouts.passed, layoutTotal))
	print(string.format("Atlases: %s %d/%d", atlasStatus, results.atlases.passed, atlasTotal))

	-- Missing items
	if #results.apis.missing > 0 then
		print(" ")
		print("|cffff6600Missing APIs:|r")
		for _, item in ipairs(results.apis.missing) do
			print("  -", item.name)
		end
	end

	if #results.layouts.missing > 0 then
		print(" ")
		print("|cffff6600Missing Layouts:|r")
		for _, item in ipairs(results.layouts.missing) do
			print("  -", item.name)
		end
	end

	if #results.atlases.missing > 0 then
		print(" ")
		print("|cffff6600Missing Atlases:|r")
		for _, item in ipairs(results.atlases.missing) do
			print("  -", item.name)
		end
	end

	-- Final status
	print(" ")
	if results.valid then
		print("|cff00ff00Status: ALL DEPENDENCIES VALID|r")
	else
		local totalIssues = results.apis.failed + results.layouts.failed + results.atlases.failed
		print(string.format("|cffff0000Status: %d ISSUE(S) FOUND|r", totalIssues))
		print("Run |cff88ccff/fenui validate verbose|r for details")
	end
	print(" ")
end

--------------------------------------------------------------------------------
-- Auto-validation on Load
--------------------------------------------------------------------------------

function FenUI.Validation:OnLoad(showWarnings)
	-- Run silent validation
	local results = self:Run(false)

	-- Store results
	if FenUIDB then
		FenUIDB.lastValidation = results
	end

	-- Only warn if there are issues and warnings are enabled
	if not results.valid and showWarnings then
		local totalIssues = results.apis.failed + results.layouts.failed + results.atlases.failed
		FenUI:Print(string.format("%d dependency issue(s) detected. Run /fenui validate", totalIssues))
	end

	return results
end
