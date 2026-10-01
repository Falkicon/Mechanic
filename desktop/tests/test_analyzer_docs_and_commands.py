"""
Regression tests for the documentation analyzers and command-level tests for
addon.deadcode, addon.security, addon.complexity and docs.stale.
"""

from pathlib import Path
from unittest.mock import Mock, patch

import pytest
from afd.testing.assertions import assert_error, assert_success

from mechanic.commands.core import get_server
from mechanic.commands.staledocs import (
    StaleDocsInput,
    analyze_docs,
    find_markdown_files,
    get_existing_files,
    get_existing_functions,
)
from mechanic.docs_analyzer import (
    CodeBlockAnalyzer,
    GitAnalyzer,
    MarkdownAnalyzer,
    classify_lines,
)


def write(tmp_path: Path, name: str, content: str) -> Path:
    path = tmp_path / name
    path.parent.mkdir(parents=True, exist_ok=True)
    path.write_text(content, encoding="utf-8")
    return path


def metrics_for(tmp_path: Path, doc_name: str, content: str):
    doc = write(tmp_path, doc_name, content)
    analyzer = MarkdownAnalyzer(tmp_path, "Addon")
    return analyzer, analyzer.analyze_file(doc)


# ═══════════════════════════════════════════════════════════════════════════════
# Markdown parsing
# ═══════════════════════════════════════════════════════════════════════════════


class TestMarkdownFixes:
    def test_closing_fence_is_not_a_new_block(self):
        lines = ["```lua", "x = 1", "```", "text", "```", "y", "```"]
        kinds = [kind for _, _, kind, _ in classify_lines(lines)]
        assert kinds == ["open", "code", "close", "prose", "open", "code", "close"]

    def test_longer_fence_needs_matching_close(self):
        lines = ["````", "```", "inner", "```", "````", "after"]
        kinds = [kind for _, _, kind, _ in classify_lines(lines)]
        assert kinds == ["open", "code", "code", "code", "close", "prose"]

    def test_links_inside_code_are_not_links(self, tmp_path):
        content = (
            "```lua\nlocal x = handlers[i](arg)\n```\n"
            "Inline `t[i](arg2)` code and a [real](docs/real.md) link.\n"
        )
        analyzer, metrics = metrics_for(tmp_path, "README.md", content)
        assert metrics.internal_links == {"docs/real.md"}
        assert metrics.code_block_count == 1

    def test_titled_and_bracketed_links(self, tmp_path):
        write(tmp_path, "docs/a.md", "x")
        write(tmp_path, "docs/with space.md", "x")
        content = (
            '[one](docs/a.md "Title") [two](<docs/with space.md>) '
            "[three](docs/with%20space.md) [four](docs/missing.md 'T')\n"
            "[web](https://example.com) [mail](mailto:a@b.c) [anchor](#top)\n"
        )
        analyzer, metrics = metrics_for(tmp_path, "README.md", content)
        assert "docs/a.md" in metrics.internal_links
        assert "docs/with space.md" in metrics.internal_links
        assert metrics.link_count == 7
        assert [i.name for i in analyzer.find_dead_links(metrics)] == [
            "docs/missing.md"
        ]

    def test_root_relative_link_resolves_against_addon_root(self, tmp_path):
        write(tmp_path, "docs/guide.md", "x")
        analyzer, metrics = metrics_for(
            tmp_path, "docs/index.md", "[g](/docs/guide.md)\n"
        )
        assert analyzer.find_dead_links(metrics) == []

    def test_versions_only_version_shaped_tokens_in_prose(self, tmp_path):
        content = (
            "Confidence 0.85 and Lua 5.1 and 1.5 seconds.\n"
            "Released v2.0.1, see 3.4.5 and version 1.2.\n"
            "```\nv9.9.9\n```\nUse `v8.8.8` inline.\n"
        )
        _, metrics = metrics_for(tmp_path, "README.md", content)
        assert metrics.version_mentions == {"2.0.1", "3.4.5", "1.2"}

    def test_changelog_is_exempt_from_version_drift(self, tmp_path):
        analyzer, changelog = metrics_for(
            tmp_path, "CHANGELOG.md", "## v0.1.0\n- first\n"
        )
        assert changelog.is_changelog
        assert analyzer.find_version_drift(changelog, "5.0.0") == []
        _, readme = metrics_for(tmp_path, "README.md", "Needs v0.1.0\n")
        assert len(analyzer.find_version_drift(readme, "5.0.0")) == 1

    def test_decimal_below_major_is_not_version_drift(self, tmp_path):
        analyzer, metrics = metrics_for(
            tmp_path, "README.md", "Confidence is 0.85 here.\n"
        )
        assert analyzer.find_version_drift(metrics, "1.4.6") == []

    def test_version_with_suffix_is_parsed(self, tmp_path):
        analyzer, metrics = metrics_for(
            tmp_path, "README.md", "See v1.0.0 for details.\n"
        )
        issues = analyzer.find_version_drift(metrics, "3.1.0-beta")
        assert [i.name for i in issues] == ["v1.0.0"]

    def test_function_references_are_extracted_from_calls(self, tmp_path):
        content = "Call `Addon:Initialize()` or `Module.Setup(a, b)` and `plain` and `Core.lua`.\n"
        _, metrics = metrics_for(tmp_path, "README.md", content)
        assert metrics.function_refs == {"Addon:Initialize", "Module.Setup"}
        assert metrics.file_refs == {"Core.lua"}

    def test_dead_reference_split_between_files_and_functions(self, tmp_path):
        content = (
            "`Addon:Gone()` `Addon.Func(x)` `Missing.lua` `UI/Panel.lua` `Core.lua`\n"
        )
        analyzer, metrics = metrics_for(tmp_path, "README.md", content)
        issues = analyzer.find_dead_references(
            metrics,
            existing_functions={"Func"},
            existing_files={"Core.lua", "UI/Panel.lua", "Panel.lua"},
        )
        assert sorted(i.name for i in issues) == ["Addon:Gone", "Missing.lua"]

    def test_file_reference_matches_with_backslashes_and_prefix(self, tmp_path):
        content = "`UI\\Panel.lua`, `Sub/UI/Other.lua` and `Gone/Other.lua`\n"
        analyzer, metrics = metrics_for(tmp_path, "README.md", content)
        issues = analyzer.find_dead_references(
            metrics, set(), {"UI/Panel.lua", "Panel.lua", "Addon/Sub/UI/Other.lua"}
        )
        assert [i.name for i in issues] == ["Gone/Other.lua"]

    def test_code_examples_ignore_strings_and_comments(self, tmp_path):
        doc = write(
            tmp_path,
            "api.md",
            "```lua\n-- Addon:Commented()\nprint('Addon:InString()')\nAddon:Missing()\nself:Known()\n```\n",
        )
        analyzer = CodeBlockAnalyzer({"Known"})
        issues = analyzer.analyze_code_blocks(doc, tmp_path)
        assert [(i.name, i.line) for i in issues] == [("Addon:Missing", 4)]


# ═══════════════════════════════════════════════════════════════════════════════
# Git analysis
# ═══════════════════════════════════════════════════════════════════════════════


class TestGitAnalyzerFixes:
    def fake_git(self, calls):
        def run(args, **kwargs):
            calls.append((args, kwargs))
            sub = args[1]
            if sub == "rev-parse":
                return Mock(returncode=0, stdout=".git\n")
            if sub == "log":
                return Mock(
                    returncode=0, stdout="abc12345|2024-01-15 10:30:00 -0500|Fix naïve"
                )
            return Mock(returncode=0, stdout="7\n")

        return run

    def test_results_are_cached_and_use_utf8(self, tmp_path):
        calls = []
        with patch("subprocess.run", side_effect=self.fake_git(calls)):
            analyzer = GitAnalyzer(tmp_path)
            doc = tmp_path / "README.md"
            first = analyzer.get_file_last_modified(doc)
            second = analyzer.get_file_last_modified(doc)
        assert first is second
        assert [c[0][1] for c in calls] == ["rev-parse", "log", "rev-list"]
        assert all(
            kw["encoding"] == "utf-8" and kw["errors"] == "replace" for _, kw in calls
        )

    def test_commits_behind_counts_only_code_commits(self, tmp_path):
        calls = []
        with patch("subprocess.run", side_effect=self.fake_git(calls)):
            info = GitAnalyzer(tmp_path).get_file_last_modified(tmp_path / "a.md")
        rev_list = next(args for args, _ in calls if args[1] == "rev-list")
        assert rev_list[rev_list.index("--") + 1 :] == ["*.lua", "*.xml", "*.toc"]
        assert info.commits_behind == 7

    def test_staleness_uses_one_lookup_per_doc(self, tmp_path):
        write(tmp_path, "README.md", "# Doc\n")
        write(tmp_path, "docs/a.md", "# Doc\n")
        calls = []
        with patch("subprocess.run", side_effect=self.fake_git(calls)):
            result = analyze_docs(
                tmp_path, "Addon", StaleDocsInput(addon="Addon", commits_threshold=1)
            )
        logs = [args for args, _ in calls if args[1] == "log"]
        assert len(logs) == 2  # README.md and docs/a.md, each looked up once
        assert result.git_available
        assert {i.category for i in result.issues} == {"relative_staleness"}
        assert "code commits" in result.issues[0].message


# ═══════════════════════════════════════════════════════════════════════════════
# staledocs helpers and analysis
# ═══════════════════════════════════════════════════════════════════════════════


class TestStaleDocsFixes:
    def test_addon_under_a_libs_named_folder_is_still_analyzed(self, tmp_path):
        addon = tmp_path / "MyLibs" / "Addon"
        write(addon, "Core.lua", "function Addon:Real() end\n")
        write(addon, "Libs/Vendor/Vendor.lua", "function Vendor:Hidden() end\n")
        write(addon, "LIBS/Upper.lua", "function Upper:Hidden2() end\n")
        functions = get_existing_functions(addon, "Addon")
        assert "Real" in functions
        assert not {"Hidden", "Hidden2"} & functions

    def test_existing_files_use_forward_slashes_and_skip_hidden(self, tmp_path):
        write(tmp_path, "UI/Panel.lua", "x = 1")
        write(tmp_path, ".git/config", "x")
        files = get_existing_files(tmp_path)
        assert {"UI/Panel.lua", "Panel.lua"} <= files
        assert "config" not in files

    def test_markdown_discovery_is_sorted_and_deduplicated(self, tmp_path):
        write(tmp_path, "B.md", "x")
        write(tmp_path, "A.md", "x")
        write(tmp_path, "docs/z.md", "x")
        write(tmp_path, "docs/.hidden/skip.md", "x")
        names = [
            p.relative_to(tmp_path).as_posix() for p in find_markdown_files(tmp_path)
        ]
        assert names == ["A.md", "B.md", "docs/z.md"]

    def test_full_analysis_false_positives_and_truncation(self, tmp_path):
        write(tmp_path, "Addon.toc", "## Title: Addon\n## Version: 1.4.6\nCore.lua\n")
        write(tmp_path, "Core.lua", "function Addon:Real() end\n")
        write(tmp_path, "CHANGELOG.md", "## v0.1.0\n- old\n## v0.2.0\n")
        write(
            tmp_path,
            "README.md",
            "Confidence 0.85. Call `Addon:Real()`.\n```lua\nlocal x = t[i](arg)\n```\n"
            + "".join(f"[dead{i}](missing{i}.md)\n" for i in range(6)),
        )
        result = analyze_docs(tmp_path, "Addon", StaleDocsInput(addon="Addon", limit=4))
        categories = result.summary.by_category
        assert categories == {
            "dead_link": 6
        }  # no version_drift, no dead_reference, no `arg`
        assert result.truncated and result.total_issues == 6 and len(result.issues) == 4

    def test_unreadable_docs_are_excluded_and_reported(self, tmp_path):
        write(tmp_path, "README.md", "hello")
        with patch.object(Path, "read_text", side_effect=PermissionError(13, "denied")):
            result = analyze_docs(tmp_path, "Addon", StaleDocsInput(addon="Addon"))
        assert result.docs_analyzed == 0
        assert result.read_errors and "README.md" in result.read_errors[0]

    def test_commits_threshold_must_be_positive(self):
        with pytest.raises(ValueError):
            StaleDocsInput(addon="A", commits_threshold=0)


# ═══════════════════════════════════════════════════════════════════════════════
# Command-level tests
# ═══════════════════════════════════════════════════════════════════════════════


@pytest.fixture
def sample_addon(tmp_path):
    addon = tmp_path / "Sample"
    write(addon, "Sample.toc", "## Title: Sample\n## Version: 1.0.0\nCore.lua\n")
    write(
        addon,
        "Core.lua",
        "local function used() return 1 end\n"
        "local function dead() end\n"
        "function TargetIt()\n  TargetUnit('player')\nend\n"
        "print(used())\n",
    )
    write(addon, "Orphan.lua", "x = 1\n")
    write(addon, "README.md", "See [missing](missing.md).\n")
    return addon


@pytest.mark.asyncio
async def test_deadcode_command(sample_addon):
    server = get_server()
    result = await server.execute(
        "addon.deadcode", {"addon": "Sample", "path": str(sample_addon)}
    )
    data = assert_success(result)
    names = {(i.category, i.name) for i in data.issues}
    assert ("orphaned_file", "Orphan.lua") in names
    assert ("unused_function", "dead") in names
    assert data.files_analyzed == 2
    assert data.total_issues == data.summary.total and data.truncated is False
    assert data.read_errors == []


@pytest.mark.asyncio
async def test_security_command(sample_addon):
    server = get_server()
    result = await server.execute(
        "addon.security", {"addon": "Sample", "path": str(sample_addon)}
    )
    data = assert_success(result)
    assert [(i.category, i.line) for i in data.issues] == [("combat_violation", 4)]
    assert data.total_issues == 1


@pytest.mark.asyncio
async def test_complexity_command(sample_addon):
    server = get_server()
    result = await server.execute(
        "addon.complexity",
        {
            "addon": "Sample",
            "path": str(sample_addon),
            "categories": ["long_file"],
            "max_file_lines": 2,
        },
    )
    data = assert_success(result)
    assert {i.category for i in data.issues} == {"long_file"}
    assert data.truncated is False


@pytest.mark.asyncio
async def test_stale_docs_command(sample_addon):
    server = get_server()
    result = await server.execute(
        "docs.stale", {"addon": "Sample", "path": str(sample_addon)}
    )
    data = assert_success(result)
    assert [(i.category, i.name) for i in data.issues if i.category == "dead_link"] == [
        ("dead_link", "missing.md")
    ]
    assert data.docs_analyzed == 1


@pytest.mark.asyncio
@pytest.mark.parametrize(
    "command", ["addon.deadcode", "addon.security", "addon.complexity"]
)
async def test_unknown_category_is_rejected(command, sample_addon):
    server = get_server()
    result = await server.execute(
        command,
        {
            "addon": "Sample",
            "path": str(sample_addon),
            "categories": ["bogus", "unused_function"],
        },
    )
    assert_error(result, "INVALID_CATEGORY")
    assert "bogus" in result.error.message
    assert result.error.suggestion


@pytest.mark.asyncio
@pytest.mark.parametrize(
    "command", ["addon.deadcode", "addon.security", "addon.complexity", "docs.stale"]
)
async def test_missing_addon_is_actionable(command, tmp_path):
    server = get_server()
    result = await server.execute(
        command, {"addon": "Nope", "path": str(tmp_path / "does-not-exist")}
    )
    assert_error(result, "ADDON_NOT_FOUND")


@pytest.mark.asyncio
async def test_limit_is_validated(sample_addon):
    server = get_server()
    result = await server.execute(
        "addon.deadcode", {"addon": "Sample", "path": str(sample_addon), "limit": 0}
    )
    assert result.success is False
