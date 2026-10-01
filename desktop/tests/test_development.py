"""
Unit tests for addon TOC validation.
"""

from pathlib import Path

from mechanic.commands.development import VALID_INTERFACE_VERSIONS, validate_toc


def write_addon(tmp_path: Path, interface_line: str) -> Path:
    addon_path = tmp_path / "TestAddon"
    addon_path.mkdir()
    (addon_path / "TestAddon.toc").write_text(
        f"{interface_line}\n## Title: TestAddon\n## Version: 1.0.0\n## Notes: Test\n## Author: Tester\n\nCore.lua\n",
        encoding="utf-8",
    )
    (addon_path / "Core.lua").write_text("local _ = 1\n", encoding="utf-8")
    return addon_path


class TestValidateTocInterface:
    """Tests for the ## Interface check."""

    def test_current_retail_and_forever_accepted(self, tmp_path):
        result = validate_toc(
            write_addon(tmp_path, "## Interface: 120100, 16001"), "TestAddon"
        )

        assert result.valid
        assert result.interface_version == "120100, 16001"

    def test_forever_only_accepted(self, tmp_path):
        result = validate_toc(write_addon(tmp_path, "## Interface: 16001"), "TestAddon")

        assert result.valid

    def test_any_current_version_in_multi_client_list_accepted(self, tmp_path):
        result = validate_toc(
            write_addon(tmp_path, "## Interface: 11508, 50503, 120100"), "TestAddon"
        )

        assert result.valid

    def test_outdated_versions_rejected_with_current_targets(self, tmp_path):
        result = validate_toc(
            write_addon(tmp_path, "## Interface: 120001, 120000"), "TestAddon"
        )

        assert not result.valid
        message = next(
            e for e in result.errors if e.startswith("Interface version outdated")
        )
        for version in VALID_INTERFACE_VERSIONS:
            assert version in message

    def test_missing_interface_rejected(self, tmp_path):
        result = validate_toc(write_addon(tmp_path, ""), "TestAddon")

        assert not result.valid
        assert "Missing ## Interface directive" in result.errors
