"""
Unit tests for code complexity analysis.
"""

import pytest
from pathlib import Path
import tempfile

from mechanic.commands.complexity import (
    find_deep_nesting, find_long_functions, find_long_files,
    find_magic_numbers, analyze_nesting_depth, ComplexityCategory,
    Thresholds
)
from mechanic.lua_analyzer import Confidence


class TestNestingAnalysis:
    """Tests for nesting depth analysis."""

    def test_simple_nesting(self):
        """Test basic nesting detection."""
        code = """
function test()
    if true then
        print("level 1")
    end
end
"""
        depth_info = analyze_nesting_depth(code)
        # Check that we track some depth
        max_depth = max(d for _, d, _ in depth_info)
        assert max_depth >= 1

    def test_deep_nesting(self):
        """Test detection of deep nesting."""
        code = """
function test()
    if a then
        if b then
            if c then
                if d then
                    if e then
                        if f then
                            print("deep")
                        end
                    end
                end
            end
        end
    end
end
"""
        depth_info = analyze_nesting_depth(code)
        max_depth = max(d for _, d, _ in depth_info)
        assert max_depth >= 5


class TestDeepNestingDetection:
    """Tests for find_deep_nesting function."""

    @pytest.fixture
    def temp_addon(self):
        """Create a temporary addon directory."""
        with tempfile.TemporaryDirectory() as tmpdir:
            addon_path = Path(tmpdir)
            yield addon_path

    def test_detect_excessive_nesting(self, temp_addon):
        """Test detection of code with excessive nesting."""
        lua_file = temp_addon / "Core.lua"
        lua_file.write_text("""
function DeepFunction()
    if a then
        if b then
            if c then
                if d then
                    if e then
                        if f then
                            print("way too deep")
                        end
                    end
                end
            end
        end
    end
end
""")
        issues = find_deep_nesting(temp_addon, [lua_file], max_depth=5)
        assert len(issues) >= 1
        assert issues[0].category == ComplexityCategory.DEEP_NESTING.value


class TestLongFunctions:
    """Tests for long function detection."""

    @pytest.fixture
    def temp_addon(self):
        """Create a temporary addon directory."""
        with tempfile.TemporaryDirectory() as tmpdir:
            addon_path = Path(tmpdir)
            yield addon_path

    def test_detect_long_function(self, temp_addon):
        """Test detection of functions that are too long."""
        lua_file = temp_addon / "Core.lua"
        # Create a function with 150 lines
        lines = ["function VeryLongFunction()"]
        for i in range(150):
            lines.append(f"    local x{i} = {i}")
        lines.append("end")
        lua_file.write_text("\n".join(lines))

        issues = find_long_functions(temp_addon, [lua_file], max_lines=100)
        assert len(issues) >= 1
        assert issues[0].category == ComplexityCategory.LONG_FUNCTION.value


class TestLongFiles:
    """Tests for long file detection."""

    @pytest.fixture
    def temp_addon(self):
        """Create a temporary addon directory."""
        with tempfile.TemporaryDirectory() as tmpdir:
            addon_path = Path(tmpdir)
            yield addon_path

    def test_detect_long_file(self, temp_addon):
        """Test detection of files that are too long."""
        lua_file = temp_addon / "Core.lua"
        # Create a file with 600 lines
        lines = [f"local x{i} = {i}" for i in range(600)]
        lua_file.write_text("\n".join(lines))

        issues = find_long_files(temp_addon, [lua_file], max_lines=500)
        assert len(issues) == 1
        assert issues[0].category == ComplexityCategory.LONG_FILE.value


class TestMagicNumbers:
    """Tests for magic number detection."""

    @pytest.fixture
    def temp_addon(self):
        """Create a temporary addon directory."""
        with tempfile.TemporaryDirectory() as tmpdir:
            addon_path = Path(tmpdir)
            yield addon_path

    def test_detect_magic_numbers(self, temp_addon):
        """Test detection of unexplained magic numbers."""
        lua_file = temp_addon / "Core.lua"
        lua_file.write_text("""
function Calculate()
    local result = value * 3.14159  -- Magic number
    return result + 42  -- Another magic number
end
""")
        issues = find_magic_numbers(temp_addon, [lua_file])
        # Should detect at least one magic number
        assert len(issues) >= 1

    def test_ignore_named_constants(self, temp_addon):
        """Test that named constants are not flagged."""
        lua_file = temp_addon / "Core.lua"
        lua_file.write_text("""
local PI = 3.14159
local MAX_VALUE = 42
""")
        issues = find_magic_numbers(temp_addon, [lua_file])
        # Named constants should not be flagged
        assert len(issues) == 0


class TestThresholds:
    """Tests for complexity thresholds."""

    def test_default_thresholds(self):
        """Test that default thresholds are sensible."""
        assert Thresholds.MAX_NESTING_DEPTH >= 4
        assert Thresholds.MAX_FUNCTION_LINES >= 50
        assert Thresholds.MAX_FILE_LINES >= 200
