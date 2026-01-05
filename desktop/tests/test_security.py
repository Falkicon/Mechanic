"""
Unit tests for security pattern analysis.
"""

import pytest
from pathlib import Path
import tempfile
import os

from mechanic.commands.security import (
    find_combat_violations, find_secret_leaks, find_taint_risks,
    find_unsafe_eval, find_addon_comm_issues, SecurityCategory,
    PROTECTED_APIS, SECRET_VALUE_APIS
)
from mechanic.lua_analyzer import Confidence


class TestCombatViolations:
    """Tests for combat lockdown violation detection."""

    @pytest.fixture
    def temp_addon(self):
        """Create a temporary addon directory."""
        with tempfile.TemporaryDirectory() as tmpdir:
            addon_path = Path(tmpdir)
            yield addon_path

    def test_detect_unguarded_protected_api(self, temp_addon):
        """Test detection of protected API without InCombatLockdown check."""
        lua_file = temp_addon / "Core.lua"
        lua_file.write_text("""
function DoAction()
    TargetUnit("player")
end
""")
        issues = find_combat_violations(temp_addon, [lua_file])
        assert len(issues) >= 1
        assert issues[0].category == SecurityCategory.COMBAT_VIOLATION.value
        assert "TargetUnit" in issues[0].message

    def test_guarded_protected_api(self, temp_addon):
        """Test that guarded API calls are not flagged."""
        lua_file = temp_addon / "Core.lua"
        lua_file.write_text("""
function DoAction()
    if InCombatLockdown() then return end
    TargetUnit("player")
end
""")
        issues = find_combat_violations(temp_addon, [lua_file])
        # Should not flag - has guard nearby
        assert len(issues) == 0


class TestSecretLeaks:
    """Tests for secret value leak detection."""

    @pytest.fixture
    def temp_addon(self):
        """Create a temporary addon directory."""
        with tempfile.TemporaryDirectory() as tmpdir:
            addon_path = Path(tmpdir)
            yield addon_path

    def test_detect_direct_print_leak(self, temp_addon):
        """Test detection of secret value in print statement."""
        lua_file = temp_addon / "Core.lua"
        lua_file.write_text("""
function ShowHealth()
    print(UnitHealth("target"))
end
""")
        issues = find_secret_leaks(temp_addon, [lua_file])
        assert len(issues) >= 1
        assert issues[0].category == SecurityCategory.SECRET_LEAK.value


class TestTaintRisks:
    """Tests for taint risk detection."""

    @pytest.fixture
    def temp_addon(self):
        """Create a temporary addon directory."""
        with tempfile.TemporaryDirectory() as tmpdir:
            addon_path = Path(tmpdir)
            yield addon_path

    def test_detect_unnamespaced_global(self, temp_addon):
        """Test detection of _G assignment without namespace."""
        lua_file = temp_addon / "Core.lua"
        lua_file.write_text("""
_G["SomeGlobal"] = true
""")
        issues = find_taint_risks(temp_addon, [lua_file], "MyAddon")
        assert len(issues) >= 1
        assert issues[0].category == SecurityCategory.TAINT_RISK.value


class TestUnsafeEval:
    """Tests for unsafe eval detection."""

    @pytest.fixture
    def temp_addon(self):
        """Create a temporary addon directory."""
        with tempfile.TemporaryDirectory() as tmpdir:
            addon_path = Path(tmpdir)
            yield addon_path

    def test_detect_loadstring(self, temp_addon):
        """Test detection of loadstring usage."""
        lua_file = temp_addon / "Core.lua"
        lua_file.write_text("""
local func = loadstring(userInput)
func()
""")
        issues = find_unsafe_eval(temp_addon, [lua_file])
        assert len(issues) >= 1
        assert issues[0].category == SecurityCategory.UNSAFE_EVAL.value


class TestProtectedAPIList:
    """Tests for the protected API database."""

    def test_common_protected_apis_included(self):
        """Test that common protected APIs are in the list."""
        assert "TargetUnit" in PROTECTED_APIS
        assert "CastSpellByID" in PROTECTED_APIS
        assert "SetAttribute" in PROTECTED_APIS

    def test_secret_value_apis_included(self):
        """Test that secret value APIs are in the list."""
        assert "UnitHealth" in SECRET_VALUE_APIS
        assert "UnitPower" in SECRET_VALUE_APIS
