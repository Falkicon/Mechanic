"""
Unit tests for dead code detection.
"""

import pytest
from pathlib import Path
import tempfile
import os

from mechanic.lua_analyzer import (
    TokenScanner, LuaAnalyzer, Confidence,
    FunctionDef, VariableDef, WOW_SAFE_PATTERNS
)
from mechanic.commands.deadcode import (
    find_orphaned_files, find_unused_functions, find_unused_locals,
    find_unreachable_code, find_commented_code_blocks, find_unused_locale_strings,
    get_loaded_files, get_all_lua_files, DeadCodeCategory, DeadCodeInput
)


class TestTokenScanner:
    """Tests for the TokenScanner class."""

    def test_function_definition_local(self):
        """Test detection of local function definitions."""
        code = """
local function helper()
    print("hello")
end
"""
        scanner = TokenScanner()
        funcs = scanner.scan_functions(code, "test.lua")
        assert len(funcs) == 1
        assert funcs[0].name == "helper"
        assert funcs[0].is_local is True
        assert funcs[0].is_method is False

    def test_function_definition_global(self):
        """Test detection of global function definitions."""
        code = """
function GlobalFunc()
    return 1
end
"""
        scanner = TokenScanner()
        funcs = scanner.scan_functions(code, "test.lua")
        assert len(funcs) == 1
        assert funcs[0].name == "GlobalFunc"
        assert funcs[0].is_local is False

    def test_method_definition(self):
        """Test detection of method definitions (colon syntax)."""
        code = """
function MyAddon:OnInitialize()
    self.db = {}
end
"""
        scanner = TokenScanner()
        funcs = scanner.scan_functions(code, "test.lua")
        assert len(funcs) == 1
        assert funcs[0].name == "MyAddon:OnInitialize"
        assert funcs[0].is_method is True
        assert funcs[0].namespace == "MyAddon"

    def test_namespaced_function(self):
        """Test detection of namespaced function definitions."""
        code = """
function MyAddon.Helper()
    return true
end
"""
        scanner = TokenScanner()
        funcs = scanner.scan_functions(code, "test.lua")
        assert len(funcs) == 1
        assert funcs[0].name == "MyAddon.Helper"
        assert funcs[0].namespace == "MyAddon"

    def test_function_assign_local(self):
        """Test detection of local function assigned to variable."""
        code = """
local myFunc = function()
    return 42
end
"""
        scanner = TokenScanner()
        funcs = scanner.scan_functions(code, "test.lua")
        assert len(funcs) == 1
        assert funcs[0].name == "myFunc"
        assert funcs[0].is_local is True

    def test_scan_calls(self):
        """Test function call detection."""
        code = """
local function test()
    print("hello")
    MyAddon.Helper()
    obj:DoSomething()
end
"""
        scanner = TokenScanner()
        calls = scanner.scan_calls(code)
        assert "print" in calls
        assert "MyAddon.Helper" in calls
        assert "DoSomething" in calls

    def test_scan_locales(self):
        """Test locale key detection."""
        code = """
L["MyKey"] = "My Value"
local text = L["OtherKey"]
print(L["ThirdKey"])
"""
        scanner = TokenScanner()
        defs, usages = scanner.scan_locales(code)
        assert "MyKey" in defs
        assert "OtherKey" in usages
        assert "ThirdKey" in usages

    def test_scan_libraries(self):
        """Test LibStub usage detection."""
        code = """
local AceAddon = LibStub("AceAddon-3.0")
local AceDB = LibStub:GetLibrary("AceDB-3.0")
"""
        scanner = TokenScanner()
        libs = scanner.scan_libraries(code)
        assert "AceAddon-3.0" in libs
        assert "AceDB-3.0" in libs

    def test_strip_comments(self):
        """Test comment stripping."""
        code = """
-- This is a comment
local x = 1
--[[
    Block comment
]]
local y = 2
"""
        scanner = TokenScanner()
        stripped = scanner.strip_comments(code)
        assert "This is a comment" not in stripped
        assert "Block comment" not in stripped
        assert "local x = 1" in stripped
        assert "local y = 2" in stripped

    def test_dynamic_patterns(self):
        """Test detection of dynamic code patterns."""
        scanner = TokenScanner()

        # Should detect dynamic patterns
        assert scanner.has_dynamic_patterns("local x = _G[name]") is True
        assert scanner.has_dynamic_patterns("loadstring(code)()") is True
        assert scanner.has_dynamic_patterns("rawget(t, k)") is True

        # Should not detect in normal code
        assert scanner.has_dynamic_patterns("local x = MyAddon.func()") is False

    def test_callback_references(self):
        """Test detection of functions passed as callbacks."""
        scanner = TokenScanner()

        # SetScript callbacks
        code = 'frame:SetScript("OnEvent", onEvent)'
        callbacks = scanner.scan_callback_references(code)
        assert "onEvent" in callbacks

        # Hook callbacks
        code = 'hooksecurefunc(frame, "Show", OnShow)'
        callbacks = scanner.scan_callback_references(code)
        assert "OnShow" in callbacks

        # C_Timer callbacks
        code = 'C_Timer.After(1, myCallback)'
        callbacks = scanner.scan_callback_references(code)
        assert "myCallback" in callbacks


class TestLuaAnalyzer:
    """Tests for the LuaAnalyzer class."""

    def test_basic_analysis(self):
        """Test basic file analysis."""
        code = """
local function helper()
    return 1
end

local function main()
    return helper()
end
"""
        analyzer = LuaAnalyzer("TestAddon")
        analyzer.analyze_file(Path("test.lua"), code)

        # Should find both functions
        assert len(analyzer.symbols.functions) == 2

        # Should find call to helper
        assert "helper" in analyzer.symbols.function_calls

    def test_unused_function_detection(self):
        """Test detection of unused functions."""
        code = """
local function unused()
    return 1
end

local function used()
    return 2
end

local result = used()
"""
        analyzer = LuaAnalyzer("TestAddon")
        analyzer.analyze_file(Path("test.lua"), code)

        unused = analyzer.get_unused_functions()

        # Should find 'unused' function
        unused_names = [f.name for f, _ in unused]
        assert "unused" in unused_names
        # 'used' is called, so should not be in unused
        assert "used" not in unused_names

    def test_safe_patterns_not_flagged(self):
        """Test that WoW safe patterns are not flagged as unused."""
        code = """
function MyAddon:OnInitialize()
    self.db = {}
end

function MyAddon:OnEvent(event, ...)
    -- handle event
end
"""
        analyzer = LuaAnalyzer("MyAddon")
        analyzer.analyze_file(Path("Core.lua"), code)

        unused = analyzer.get_unused_functions()

        # OnInitialize and OnEvent should not be flagged
        unused_names = [f.name for f, _ in unused]
        assert "MyAddon:OnInitialize" not in unused_names
        assert "MyAddon:OnEvent" not in unused_names

    def test_setscript_callback_not_flagged(self):
        """Test that functions passed to SetScript are not flagged as unused."""
        code = """
local function onEvent(self, event, ...)
    -- handle event
end

local frame = CreateFrame("Frame")
frame:SetScript("OnEvent", onEvent)
"""
        analyzer = LuaAnalyzer("TestAddon")
        analyzer.analyze_file(Path("Events.lua"), code)

        unused = analyzer.get_unused_functions()

        # onEvent is passed to SetScript, so should not be flagged
        unused_names = [f.name for f, _ in unused]
        assert "onEvent" not in unused_names


class TestOrphanedFiles:
    """Tests for orphaned file detection."""

    def test_detect_orphaned_file(self, tmp_path):
        """Test detection of files not in TOC."""
        addon_path = tmp_path / "TestAddon"
        addon_path.mkdir()

        # Create TOC
        toc_content = """## Interface: 110100
## Title: TestAddon
Core.lua
"""
        (addon_path / "TestAddon.toc").write_text(toc_content)

        # Create files
        (addon_path / "Core.lua").write_text("-- Core")
        (addon_path / "Orphan.lua").write_text("-- Orphaned")

        issues = find_orphaned_files(addon_path, "TestAddon")

        assert len(issues) == 1
        assert "Orphan.lua" in issues[0].file
        assert issues[0].category == DeadCodeCategory.ORPHANED_FILE.value
        assert issues[0].confidence == Confidence.DEFINITE.value

    def test_libs_folder_excluded(self, tmp_path):
        """Test that Libs folder is excluded from orphan detection."""
        addon_path = tmp_path / "TestAddon"
        addon_path.mkdir()
        (addon_path / "Libs").mkdir()

        # Create TOC without Libs
        toc_content = """## Interface: 110100
## Title: TestAddon
Core.lua
"""
        (addon_path / "TestAddon.toc").write_text(toc_content)
        (addon_path / "Core.lua").write_text("-- Core")
        (addon_path / "Libs" / "LibStub.lua").write_text("-- LibStub")

        issues = find_orphaned_files(addon_path, "TestAddon")

        # LibStub.lua should not be flagged
        orphan_files = [i.file for i in issues]
        assert not any("LibStub" in f for f in orphan_files)


class TestUnreachableCode:
    """Tests for unreachable code detection."""

    def test_detect_code_after_return(self, tmp_path):
        """Test detection of code after return statement."""
        addon_path = tmp_path / "TestAddon"
        addon_path.mkdir()

        code = """
local function test()
    return 1
    print("unreachable")
end
"""
        lua_file = addon_path / "Core.lua"
        lua_file.write_text(code)

        issues = find_unreachable_code(addon_path, [lua_file])

        assert len(issues) >= 1
        assert issues[0].category == DeadCodeCategory.UNREACHABLE_CODE.value


class TestCommentedCode:
    """Tests for commented code block detection."""

    def test_detect_commented_code_block(self, tmp_path):
        """Test detection of large commented code blocks."""
        addon_path = tmp_path / "TestAddon"
        addon_path.mkdir()

        code = """
local function active()
    return 1
end

-- local function old()
--     if something then
--         return true
--     end
--     return false
-- end

local x = 1
"""
        lua_file = addon_path / "Core.lua"
        lua_file.write_text(code)

        issues = find_commented_code_blocks(addon_path, [lua_file])

        assert len(issues) >= 1
        assert issues[0].category == DeadCodeCategory.COMMENTED_CODE.value
        assert issues[0].confidence == Confidence.SUSPICIOUS.value


class TestUnusedLocales:
    """Tests for unused locale string detection."""

    def test_detect_unused_locale(self, tmp_path):
        """Test detection of unused locale strings."""
        addon_path = tmp_path / "TestAddon"
        addon_path.mkdir()
        (addon_path / "Locales").mkdir()

        # Create locale file
        locale_content = """
local L = LibStub("AceLocale-3.0"):NewLocale("TestAddon", "enUS", true)
L["UsedKey"] = "Used"
L["UnusedKey"] = "Unused"
"""
        (addon_path / "Locales" / "enUS.lua").write_text(locale_content)

        # Create code that uses only one key
        code_content = """
local L = LibStub("AceLocale-3.0"):GetLocale("TestAddon")
print(L["UsedKey"])
"""
        (addon_path / "Core.lua").write_text(code_content)

        # Analyze
        analyzer = LuaAnalyzer("TestAddon")
        analyzer.analyze_file(addon_path / "Core.lua", code_content)

        issues = find_unused_locale_strings(addon_path, analyzer)

        # Should find UnusedKey
        unused_keys = [i.name for i in issues]
        assert any("UnusedKey" in k for k in unused_keys)


class TestConfidenceLevels:
    """Tests for confidence level assignment."""

    def test_local_function_definite(self):
        """Test that unused local functions get DEFINITE confidence."""
        code = """
local function unused()
    return 1
end
"""
        analyzer = LuaAnalyzer("TestAddon")
        analyzer.analyze_file(Path("test.lua"), code)

        unused = analyzer.get_unused_functions()
        assert len(unused) == 1
        assert unused[0][1] == Confidence.DEFINITE

    def test_dynamic_code_suspicious(self):
        """Test that files with dynamic code get SUSPICIOUS confidence."""
        code = """
local function maybeUsed()
    return 1
end

local funcName = "maybeUsed"
local result = _G[funcName]()
"""
        analyzer = LuaAnalyzer("TestAddon")
        analyzer.analyze_file(Path("test.lua"), code)

        unused = analyzer.get_unused_functions()
        if unused:
            # If flagged, should be SUSPICIOUS due to dynamic patterns
            assert unused[0][1] == Confidence.SUSPICIOUS


if __name__ == "__main__":
    pytest.main([__file__, "-v"])
