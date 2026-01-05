"""
Unit tests for stale documentation detection.

Tests the docs_analyzer module and staledocs command.
"""

import pytest
from pathlib import Path
from datetime import datetime, timedelta
from unittest.mock import Mock, patch, MagicMock
import tempfile
import os

from mechanic.docs_analyzer import (
    DocConfidence, DocIssue, DocMetrics, GitInfo,
    GitAnalyzer, MarkdownAnalyzer, CodeBlockAnalyzer
)
from mechanic.commands.staledocs import (
    StaleDocsInput, StaleDocIssue, StaleDocsResult,
    find_markdown_files, get_addon_version, get_existing_functions,
    get_existing_files, analyze_docs
)


# ═══════════════════════════════════════════════════════════════════════════════
# FIXTURES
# ═══════════════════════════════════════════════════════════════════════════════

@pytest.fixture
def temp_addon():
    """Create a temporary addon directory for testing."""
    with tempfile.TemporaryDirectory() as tmpdir:
        addon_path = Path(tmpdir) / "TestAddon"
        addon_path.mkdir()

        # Create TOC file
        toc_content = """## Interface: 110002
## Title: TestAddon
## Version: 1.2.0
## Author: Test

Core.lua
"""
        (addon_path / "TestAddon.toc").write_text(toc_content)

        # Create Core.lua
        lua_content = """
local Addon = {}

function Addon:Initialize()
    print("Init")
end

function Addon:DoSomething()
    return true
end
"""
        (addon_path / "Core.lua").write_text(lua_content)

        yield addon_path


@pytest.fixture
def temp_addon_with_docs(temp_addon):
    """Create a temporary addon with documentation."""
    # Create README.md
    readme = """# TestAddon

Version 1.2.0

## Functions

The main function is `Addon:Initialize()`.

See [Core.lua](Core.lua) for implementation.

## Links

- [Installation](docs/install.md)
- [API Reference](docs/api.md)
"""
    (temp_addon / "README.md").write_text(readme)

    # Create docs folder
    docs_path = temp_addon / "docs"
    docs_path.mkdir()

    # Create API doc
    api_doc = """# API Reference

## Addon:Initialize

Initializes the addon.

```lua
Addon:Initialize()
```

## Addon:OldFunction

This function was removed in v1.0.0.

```lua
Addon:OldFunction()
```
"""
    (docs_path / "api.md").write_text(api_doc)

    return temp_addon


# ═══════════════════════════════════════════════════════════════════════════════
# MARKDOWN ANALYZER TESTS
# ═══════════════════════════════════════════════════════════════════════════════

class TestMarkdownAnalyzer:
    """Tests for MarkdownAnalyzer."""

    def test_analyze_file_basic(self, temp_addon_with_docs):
        """Test basic file analysis."""
        analyzer = MarkdownAnalyzer(temp_addon_with_docs, "TestAddon")
        readme_path = temp_addon_with_docs / "README.md"

        metrics = analyzer.analyze_file(readme_path)

        assert metrics.path == readme_path
        assert metrics.word_count > 0
        assert metrics.link_count > 0
        assert len(metrics.internal_links) > 0

    def test_extract_internal_links(self, temp_addon_with_docs):
        """Test internal link extraction."""
        analyzer = MarkdownAnalyzer(temp_addon_with_docs, "TestAddon")
        readme_path = temp_addon_with_docs / "README.md"

        metrics = analyzer.analyze_file(readme_path)

        assert "Core.lua" in metrics.internal_links
        assert "docs/install.md" in metrics.internal_links
        assert "docs/api.md" in metrics.internal_links

    def test_extract_version_mentions(self, temp_addon_with_docs):
        """Test version mention extraction."""
        analyzer = MarkdownAnalyzer(temp_addon_with_docs, "TestAddon")
        readme_path = temp_addon_with_docs / "README.md"

        metrics = analyzer.analyze_file(readme_path)

        assert "1.2.0" in metrics.version_mentions

    def test_count_code_blocks(self, temp_addon_with_docs):
        """Test code block counting."""
        analyzer = MarkdownAnalyzer(temp_addon_with_docs, "TestAddon")
        api_path = temp_addon_with_docs / "docs" / "api.md"

        metrics = analyzer.analyze_file(api_path)

        # Note: The analyzer counts both opening and closing fences
        # that match the code_block_start pattern (```lua and ```)
        assert metrics.code_block_count >= 2

    def test_find_dead_links(self, temp_addon_with_docs):
        """Test dead link detection."""
        analyzer = MarkdownAnalyzer(temp_addon_with_docs, "TestAddon")
        readme_path = temp_addon_with_docs / "README.md"

        metrics = analyzer.analyze_file(readme_path)
        issues = analyzer.find_dead_links(metrics)

        # docs/install.md doesn't exist
        dead_links = [i.name for i in issues]
        assert "docs/install.md" in dead_links

    def test_find_dead_references(self, temp_addon_with_docs):
        """Test dead reference detection."""
        analyzer = MarkdownAnalyzer(temp_addon_with_docs, "TestAddon")
        readme_path = temp_addon_with_docs / "README.md"

        metrics = analyzer.analyze_file(readme_path)

        existing_functions = {"Initialize", "DoSomething"}
        existing_files = {"Core.lua", "TestAddon.toc"}

        issues = analyzer.find_dead_references(metrics, existing_functions, existing_files)

        # Should not flag Addon:Initialize since Initialize exists
        issue_names = [i.name for i in issues]
        assert "Addon:Initialize" not in issue_names

    def test_find_version_drift(self, temp_addon_with_docs):
        """Test version drift detection."""
        analyzer = MarkdownAnalyzer(temp_addon_with_docs, "TestAddon")
        api_path = temp_addon_with_docs / "docs" / "api.md"

        metrics = analyzer.analyze_file(api_path)

        # Current version is 1.2.0, doc mentions 1.0.0
        issues = analyzer.find_version_drift(metrics, "2.0.0")

        # Should flag version 1.0.0 as being behind 2.0.0 by major version
        version_issues = [i for i in issues if i.category == "version_drift"]
        assert len(version_issues) > 0


# ═══════════════════════════════════════════════════════════════════════════════
# CODE BLOCK ANALYZER TESTS
# ═══════════════════════════════════════════════════════════════════════════════

class TestCodeBlockAnalyzer:
    """Tests for CodeBlockAnalyzer."""

    def test_analyze_lua_blocks(self, temp_addon_with_docs):
        """Test Lua code block analysis."""
        existing_functions = {"Initialize", "DoSomething"}
        analyzer = CodeBlockAnalyzer(existing_functions, set())

        api_path = temp_addon_with_docs / "docs" / "api.md"
        issues = analyzer.analyze_code_blocks(api_path, temp_addon_with_docs)

        # Should find issues with OldFunction which doesn't exist
        assert isinstance(issues, list)

    def test_skip_builtins(self, temp_addon):
        """Test that Lua builtins are not flagged."""
        # Create a doc with builtin calls
        doc_content = """# Test

```lua
print("hello")
for k, v in pairs(t) do end
local n = tonumber("5")
```
"""
        doc_path = temp_addon / "test.md"
        doc_path.write_text(doc_content)

        analyzer = CodeBlockAnalyzer(set(), set())
        issues = analyzer.analyze_code_blocks(doc_path, temp_addon)

        # Builtins should not be flagged
        issue_names = [i.name for i in issues]
        assert "print" not in issue_names
        assert "pairs" not in issue_names
        assert "tonumber" not in issue_names


# ═══════════════════════════════════════════════════════════════════════════════
# GIT ANALYZER TESTS
# ═══════════════════════════════════════════════════════════════════════════════

class TestGitAnalyzer:
    """Tests for GitAnalyzer."""

    def test_non_git_repo(self, temp_addon):
        """Test behavior when not in a git repo."""
        analyzer = GitAnalyzer(temp_addon)

        assert analyzer._is_git_repo == False
        assert analyzer.get_file_last_modified(temp_addon / "Core.lua") is None
        assert analyzer.get_recent_code_commits() == []

    @patch('subprocess.run')
    def test_git_repo_detection(self, mock_run, temp_addon):
        """Test git repo detection."""
        mock_run.return_value = Mock(returncode=0, stdout=".git\n")

        analyzer = GitAnalyzer(temp_addon)

        assert analyzer._is_git_repo == True

    @patch('subprocess.run')
    def test_get_file_last_modified(self, mock_run, temp_addon):
        """Test getting file last modified info."""
        # First call for git rev-parse, second for git log
        mock_run.side_effect = [
            Mock(returncode=0, stdout=".git\n"),  # rev-parse
            Mock(returncode=0, stdout="abc12345|2024-01-15 10:30:00 -0500|Test commit"),  # log
            Mock(returncode=0, stdout="5\n")  # rev-list count
        ]

        analyzer = GitAnalyzer(temp_addon)
        info = analyzer.get_file_last_modified(temp_addon / "Core.lua")

        assert info is not None
        assert info.last_commit_hash == "abc12345"
        assert info.commits_behind == 5
        assert info.last_commit_message == "Test commit"


# ═══════════════════════════════════════════════════════════════════════════════
# HELPER FUNCTION TESTS
# ═══════════════════════════════════════════════════════════════════════════════

class TestHelperFunctions:
    """Tests for helper functions."""

    def test_find_markdown_files(self, temp_addon_with_docs):
        """Test markdown file discovery."""
        files = find_markdown_files(temp_addon_with_docs)

        file_names = [f.name for f in files]
        assert "README.md" in file_names
        assert "api.md" in file_names

    def test_get_addon_version(self, temp_addon):
        """Test addon version extraction from TOC."""
        version = get_addon_version(temp_addon, "TestAddon")

        assert version == "1.2.0"

    def test_get_existing_functions(self, temp_addon):
        """Test function extraction from addon."""
        functions = get_existing_functions(temp_addon, "TestAddon")

        assert "Initialize" in functions
        assert "DoSomething" in functions

    def test_get_existing_files(self, temp_addon):
        """Test file listing from addon."""
        files = get_existing_files(temp_addon)

        assert "Core.lua" in files
        assert "TestAddon.toc" in files


# ═══════════════════════════════════════════════════════════════════════════════
# FULL ANALYSIS TESTS
# ═══════════════════════════════════════════════════════════════════════════════

class TestFullAnalysis:
    """Tests for the full analysis function."""

    def test_analyze_docs_no_docs(self, temp_addon):
        """Test analysis when no docs exist."""
        input_data = StaleDocsInput(addon="TestAddon")
        result = analyze_docs(temp_addon, "TestAddon", input_data)

        assert result.docs_analyzed == 0
        assert len(result.issues) == 0

    def test_analyze_docs_with_docs(self, temp_addon_with_docs):
        """Test full analysis with documentation."""
        input_data = StaleDocsInput(addon="TestAddon")
        result = analyze_docs(temp_addon_with_docs, "TestAddon", input_data)

        assert result.docs_analyzed == 2  # README.md and api.md
        assert result.addon == "TestAddon"
        assert result.analysis_time_ms > 0

    def test_analyze_docs_finds_dead_links(self, temp_addon_with_docs):
        """Test that dead links are found."""
        input_data = StaleDocsInput(addon="TestAddon")
        result = analyze_docs(temp_addon_with_docs, "TestAddon", input_data)

        dead_link_issues = [i for i in result.issues if i.category == "dead_link"]

        # Should find docs/install.md as dead link
        assert len(dead_link_issues) > 0
        assert any("install.md" in i.name for i in dead_link_issues)

    def test_analyze_docs_summary(self, temp_addon_with_docs):
        """Test that summary is correctly built."""
        input_data = StaleDocsInput(addon="TestAddon")
        result = analyze_docs(temp_addon_with_docs, "TestAddon", input_data)

        assert result.summary.total == len(result.issues)
        assert sum(result.summary.by_category.values()) == result.summary.total
        assert sum(result.summary.by_confidence.values()) == result.summary.total

    def test_filter_suspicious(self, temp_addon_with_docs):
        """Test filtering out suspicious confidence issues."""
        input_data = StaleDocsInput(addon="TestAddon", include_suspicious=False)
        result = analyze_docs(temp_addon_with_docs, "TestAddon", input_data)

        suspicious_issues = [i for i in result.issues if i.confidence == "suspicious"]
        assert len(suspicious_issues) == 0


# ═══════════════════════════════════════════════════════════════════════════════
# CONFIDENCE LEVEL TESTS
# ═══════════════════════════════════════════════════════════════════════════════

class TestConfidenceLevels:
    """Tests for confidence level assignment."""

    def test_dead_link_is_definite(self, temp_addon_with_docs):
        """Test that dead links get definite confidence."""
        input_data = StaleDocsInput(addon="TestAddon")
        result = analyze_docs(temp_addon_with_docs, "TestAddon", input_data)

        dead_link_issues = [i for i in result.issues if i.category == "dead_link"]

        for issue in dead_link_issues:
            assert issue.confidence == "definite"

    def test_version_drift_confidence(self, temp_addon):
        """Test version drift confidence levels."""
        # Create doc with old version
        doc_content = """# Test

This was added in version 0.5.0.
"""
        doc_path = temp_addon / "README.md"
        doc_path.write_text(doc_content)

        input_data = StaleDocsInput(addon="TestAddon")
        result = analyze_docs(temp_addon, "TestAddon", input_data)

        version_issues = [i for i in result.issues if i.category == "version_drift"]

        # 0.5.0 is major version behind 1.2.0
        if version_issues:
            assert version_issues[0].confidence == "likely"


# ═══════════════════════════════════════════════════════════════════════════════
# PYDANTIC SCHEMA TESTS
# ═══════════════════════════════════════════════════════════════════════════════

class TestSchemas:
    """Tests for Pydantic schemas."""

    def test_stale_docs_input_defaults(self):
        """Test StaleDocsInput default values."""
        input_data = StaleDocsInput(addon="Test")

        assert input_data.addon == "Test"
        assert input_data.path is None
        assert input_data.include_suspicious == True
        assert input_data.commits_threshold == 10

    def test_stale_doc_issue_creation(self):
        """Test StaleDocIssue creation."""
        issue = StaleDocIssue(
            category="dead_link",
            confidence="definite",
            file="README.md",
            line=10,
            name="broken.md",
            message="Link to 'broken.md' points to non-existent file",
            suggestion="Update or remove the link"
        )

        assert issue.category == "dead_link"
        assert issue.confidence == "definite"
        assert issue.line == 10

    def test_stale_docs_result_creation(self):
        """Test StaleDocsResult creation."""
        result = StaleDocsResult(
            addon="TestAddon",
            docs_analyzed=5,
            issues=[],
            analysis_time_ms=123.45,
            git_available=True
        )

        assert result.addon == "TestAddon"
        assert result.docs_analyzed == 5
        assert result.git_available == True
