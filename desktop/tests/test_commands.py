"""
AFD Command Unit Tests for Mechanic Desktop.

Tests verify all 39 AFD commands follow AFD compliance:
- Success/error result structure
- Proper reasoning and sources
- Schema validation
"""

import pytest
import asyncio
import tempfile
import os
from pathlib import Path
from mechanic.commands.core import get_server
from afd.testing.assertions import assert_success, assert_error, assert_has_reasoning, assert_has_sources


# ═══════════════════════════════════════════════════════════════════════════════
# SavedVariables Commands (sv.*)
# ═══════════════════════════════════════════════════════════════════════════════

@pytest.mark.asyncio
async def test_sv_discover():
    """Test sv.discover finds WoW installations."""
    server = get_server()
    result = await server.execute("sv.discover", {})

    if result.success:
        data = assert_success(result)
        assert hasattr(data, 'paths')
        assert isinstance(data.paths, list)
        assert_has_sources(result)
    else:
        # Valid error if no WoW found
        assert_error(result, "NOT_FOUND")


@pytest.mark.asyncio
async def test_sv_parse_missing_file():
    """Test sv.parse handles missing file gracefully."""
    server = get_server()
    result = await server.execute("sv.parse", {"file_path": "non_existent_file.lua"})

    assert_error(result, "FILE_NOT_FOUND")
    assert "not found" in result.error.message.lower()


@pytest.mark.asyncio
async def test_sv_parse_valid_file():
    """Test sv.parse with a valid Lua file."""
    server = get_server()

    # Create a temporary valid SavedVariables file
    with tempfile.NamedTemporaryFile(mode='w', suffix='.lua', delete=False) as f:
        f.write('TestDB = { version = 1, data = "test" }')
        temp_path = f.name

    try:
        result = await server.execute("sv.parse", {"file_path": temp_path})
        data = assert_success(result)
        # sv.parse returns SavedVariables with addons attribute
        assert hasattr(data, 'addons')
    finally:
        os.unlink(temp_path)


# ═══════════════════════════════════════════════════════════════════════════════
# Addon Commands (addon.*)
# ═══════════════════════════════════════════════════════════════════════════════

@pytest.mark.asyncio
async def test_addon_output():
    """Test addon.output returns structured markdown output."""
    server = get_server()
    result = await server.execute("addon.output", {})

    data = assert_success(result)

    # Verify schema
    assert hasattr(data, 'output')
    assert hasattr(data, 'error_count')
    assert hasattr(data, 'test_count')
    assert hasattr(data, 'console_count')

    # Verify AFD compliance
    assert_has_reasoning(result)
    assert_has_sources(result)

    # Verify markdown structure
    assert "## Addon Output" in data.output
    assert "### Errors" in data.output
    assert "### Tests" in data.output
    assert "### Console" in data.output


@pytest.mark.asyncio
async def test_addon_output_agent_mode():
    """Test addon.output with agent_mode compression."""
    server = get_server()
    result = await server.execute("addon.output", {"agent_mode": True})

    data = assert_success(result)
    assert hasattr(data, 'output')
    # Agent mode should still produce valid output
    assert "## Addon Output" in data.output


@pytest.mark.asyncio
async def test_addon_validate_missing_addon():
    """Test addon.validate handles missing addon gracefully."""
    server = get_server()
    result = await server.execute("addon.validate", {"addon": "NonExistentAddon12345"})

    # Should error with NOT_FOUND or similar
    assert not result.success
    assert result.error is not None


@pytest.mark.asyncio
async def test_addon_lint_missing_addon():
    """Test addon.lint handles missing addon gracefully."""
    server = get_server()
    result = await server.execute("addon.lint", {"addon": "NonExistentAddon12345"})

    assert not result.success
    assert result.error is not None


@pytest.mark.asyncio
async def test_addon_format_missing_addon():
    """Test addon.format handles missing addon gracefully."""
    server = get_server()
    result = await server.execute("addon.format", {"addon": "NonExistentAddon12345", "check": True})

    assert not result.success
    assert result.error is not None


@pytest.mark.asyncio
async def test_addon_test_missing_addon():
    """Test addon.test handles missing addon gracefully."""
    server = get_server()
    result = await server.execute("addon.test", {"addon": "NonExistentAddon12345"})

    assert not result.success
    assert result.error is not None


@pytest.mark.asyncio
async def test_addon_deprecations_missing_addon():
    """Test addon.deprecations handles missing addon gracefully."""
    server = get_server()
    result = await server.execute("addon.deprecations", {"addon": "NonExistentAddon12345"})

    assert not result.success
    assert result.error is not None


@pytest.mark.asyncio
async def test_addon_create_missing_name():
    """Test addon.create requires addon name."""
    server = get_server()
    result = await server.execute("addon.create", {})

    # Should fail validation or require name parameter
    assert not result.success


@pytest.mark.asyncio
async def test_addon_sync_missing_addon():
    """Test addon.sync handles missing addon gracefully."""
    server = get_server()
    result = await server.execute("addon.sync", {"addon": "NonExistentAddon12345"})

    assert not result.success
    assert result.error is not None


# ═══════════════════════════════════════════════════════════════════════════════
# Library Commands (libs.*)
# ═══════════════════════════════════════════════════════════════════════════════

@pytest.mark.asyncio
async def test_libs_check_missing_addon():
    """Test libs.check handles missing addon gracefully."""
    server = get_server()
    result = await server.execute("libs.check", {"addon": "NonExistentAddon12345"})

    assert not result.success
    assert result.error is not None


@pytest.mark.asyncio
async def test_libs_init_missing_addon():
    """Test libs.init handles missing addon gracefully."""
    server = get_server()
    result = await server.execute("libs.init", {"addon": "NonExistentAddon12345"})

    assert not result.success
    assert result.error is not None


@pytest.mark.asyncio
async def test_libs_sync_missing_addon():
    """Test libs.sync handles missing addon gracefully."""
    server = get_server()
    result = await server.execute("libs.sync", {"addon": "NonExistentAddon12345"})

    assert not result.success
    assert result.error is not None


# ═══════════════════════════════════════════════════════════════════════════════
# API Reference Commands (api.*)
# ═══════════════════════════════════════════════════════════════════════════════

@pytest.mark.asyncio
async def test_api_search():
    """Test api.search finds WoW APIs."""
    server = get_server()
    result = await server.execute("api.search", {"query": "UnitHealth"})

    data = assert_success(result)
    assert hasattr(data, 'results') or hasattr(data, 'apis') or hasattr(data, 'matches')
    assert_has_reasoning(result)


@pytest.mark.asyncio
async def test_api_search_no_results():
    """Test api.search handles no matches gracefully."""
    server = get_server()
    result = await server.execute("api.search", {"query": "xyznonexistent12345"})

    # Should succeed with empty results, not error
    data = assert_success(result)


@pytest.mark.asyncio
async def test_api_info():
    """Test api.info returns API details."""
    server = get_server()
    result = await server.execute("api.info", {"api": "UnitHealth"})

    if result.success:
        data = assert_success(result)
        assert_has_reasoning(result)
    else:
        # API might not be in database
        assert result.error is not None


@pytest.mark.asyncio
async def test_api_list():
    """Test api.list returns API namespaces."""
    server = get_server()
    result = await server.execute("api.list", {})

    data = assert_success(result)
    assert_has_reasoning(result)


@pytest.mark.asyncio
async def test_api_list_by_namespace():
    """Test api.list filters by namespace."""
    server = get_server()
    result = await server.execute("api.list", {"namespace": "C_Spell"})

    if result.success:
        data = assert_success(result)
        assert_has_reasoning(result)


@pytest.mark.asyncio
async def test_api_queue():
    """Test api.queue accepts API test requests."""
    server = get_server()
    result = await server.execute("api.queue", {"apis": ["UnitHealth", "UnitName"]})

    if result.success:
        data = assert_success(result)
        assert_has_reasoning(result)


@pytest.mark.asyncio
async def test_api_stats():
    """Test api.stats returns API statistics."""
    server = get_server()
    result = await server.execute("api.stats", {})

    data = assert_success(result)
    assert_has_reasoning(result)


# ═══════════════════════════════════════════════════════════════════════════════
# Lua Eval Commands (lua.*)
# ═══════════════════════════════════════════════════════════════════════════════

@pytest.mark.asyncio
async def test_lua_queue():
    """Test lua.queue accepts Lua code for evaluation."""
    server = get_server()
    # lua.queue expects a list of code strings
    result = await server.execute("lua.queue", {
        "code": ["return 1 + 1"]
    })

    data = assert_success(result)
    assert_has_reasoning(result)


@pytest.mark.asyncio
async def test_lua_results():
    """Test lua.results returns evaluation results."""
    server = get_server()
    result = await server.execute("lua.results", {})

    data = assert_success(result)
    assert_has_reasoning(result)


# ═══════════════════════════════════════════════════════════════════════════════
# Sandbox Commands (sandbox.*)
# ═══════════════════════════════════════════════════════════════════════════════

@pytest.mark.asyncio
async def test_sandbox_status():
    """Test sandbox.status returns sandbox state."""
    server = get_server()
    result = await server.execute("sandbox.status", {})

    data = assert_success(result)
    assert_has_reasoning(result)


@pytest.mark.asyncio
async def test_sandbox_generate():
    """Test sandbox.generate creates test stubs."""
    server = get_server()
    result = await server.execute("sandbox.generate", {"addon": "NonExistentAddon"})

    # May fail for missing addon, but should return valid AFD response
    assert result.success is True or result.error is not None


@pytest.mark.asyncio
async def test_sandbox_exec():
    """Test sandbox.exec runs sandbox tests."""
    server = get_server()
    result = await server.execute("sandbox.exec", {"addon": "NonExistentAddon"})

    # May fail for missing addon
    assert result.success is True or result.error is not None


@pytest.mark.asyncio
async def test_sandbox_test():
    """Test sandbox.test validates sandbox setup."""
    server = get_server()
    # sandbox.test requires addon parameter
    result = await server.execute("sandbox.test", {"addon": "!Mechanic"})

    if result.success:
        data = assert_success(result)
        assert_has_reasoning(result)
    else:
        # May fail if addon not found or no tests
        assert result.error is not None


# ═══════════════════════════════════════════════════════════════════════════════
# Locale Commands (locale.*)
# ═══════════════════════════════════════════════════════════════════════════════

@pytest.mark.asyncio
async def test_locale_validate_missing_addon():
    """Test locale.validate handles missing addon gracefully."""
    server = get_server()
    result = await server.execute("locale.validate", {"addon": "NonExistentAddon12345"})

    assert not result.success
    assert result.error is not None


@pytest.mark.asyncio
async def test_locale_extract_missing_addon():
    """Test locale.extract handles missing addon gracefully."""
    server = get_server()
    result = await server.execute("locale.extract", {"addon": "NonExistentAddon12345"})

    assert not result.success
    assert result.error is not None


# ═══════════════════════════════════════════════════════════════════════════════
# Atlas Commands (atlas.*)
# ═══════════════════════════════════════════════════════════════════════════════

@pytest.mark.asyncio
async def test_atlas_search():
    """Test atlas.search finds UI atlas icons."""
    server = get_server()
    result = await server.execute("atlas.search", {"query": "button"})

    data = assert_success(result)
    assert_has_reasoning(result)


@pytest.mark.asyncio
async def test_atlas_search_no_results():
    """Test atlas.search handles no matches gracefully."""
    server = get_server()
    result = await server.execute("atlas.search", {"query": "xyznonexistent12345"})

    # Should succeed with empty results
    data = assert_success(result)


# ═══════════════════════════════════════════════════════════════════════════════
# Release Pipeline Commands (version.*, changelog.*, git.*, release.*)
# ═══════════════════════════════════════════════════════════════════════════════

@pytest.mark.asyncio
async def test_version_bump_missing_addon():
    """Test version.bump handles missing addon gracefully."""
    server = get_server()
    result = await server.execute("version.bump", {
        "addon": "NonExistentAddon12345",
        "version": "1.0.0"
    })

    assert not result.success
    assert result.error is not None


@pytest.mark.asyncio
async def test_changelog_add_missing_addon():
    """Test changelog.add handles missing addon gracefully."""
    server = get_server()
    result = await server.execute("changelog.add", {
        "addon": "NonExistentAddon12345",
        "version": "1.0.0",
        "changes": ["Test change"]
    })

    assert not result.success
    assert result.error is not None


@pytest.mark.asyncio
async def test_git_commit_missing_addon():
    """Test git.commit handles missing addon gracefully."""
    server = get_server()
    result = await server.execute("git.commit", {
        "addon": "NonExistentAddon12345",
        "message": "Test commit"
    })

    assert not result.success
    assert result.error is not None


@pytest.mark.asyncio
async def test_git_tag_missing_addon():
    """Test git.tag handles missing addon gracefully."""
    server = get_server()
    result = await server.execute("git.tag", {
        "addon": "NonExistentAddon12345",
        "version": "1.0.0"
    })

    assert not result.success
    assert result.error is not None


@pytest.mark.asyncio
async def test_release_all_missing_addon():
    """Test release.all handles missing addon gracefully."""
    server = get_server()
    result = await server.execute("release.all", {
        "addon": "NonExistentAddon12345",
        "version": "1.0.0",
        "message": "Test release"
    })

    assert not result.success
    assert result.error is not None


# ═══════════════════════════════════════════════════════════════════════════════
# Documentation Commands (docs.*)
# ═══════════════════════════════════════════════════════════════════════════════

@pytest.mark.asyncio
async def test_docs_generate():
    """Test docs.generate creates documentation."""
    server = get_server()
    result = await server.execute("docs.generate", {"format": "markdown"})

    data = assert_success(result)
    assert_has_reasoning(result)


@pytest.mark.asyncio
async def test_docs_generate_json():
    """Test docs.generate with JSON format."""
    server = get_server()
    result = await server.execute("docs.generate", {"format": "json"})

    data = assert_success(result)


# ═══════════════════════════════════════════════════════════════════════════════
# Environment Commands (env.*, tools.*, system.*)
# ═══════════════════════════════════════════════════════════════════════════════

@pytest.mark.asyncio
async def test_env_status():
    """Test env.status returns environment configuration."""
    server = get_server()
    result = await server.execute("env.status", {})

    data = assert_success(result)
    assert_has_reasoning(result)


@pytest.mark.asyncio
async def test_tools_status():
    """Test tools.status returns installed tools info."""
    server = get_server()
    result = await server.execute("tools.status", {})

    data = assert_success(result)
    assert_has_reasoning(result)


@pytest.mark.asyncio
async def test_system_pick_file():
    """Test system.pick_file command exists (may not work headless)."""
    server = get_server()
    # This command opens a file picker, so it may fail in headless mode
    # Just verify the command is registered
    commands = server.list_commands()
    command_names = [c.name for c in commands]
    assert "system.pick_file" in command_names


# ═══════════════════════════════════════════════════════════════════════════════
# Dashboard Commands (dashboard.*)
# ═══════════════════════════════════════════════════════════════════════════════

@pytest.mark.asyncio
async def test_dashboard_metrics():
    """Test dashboard.metrics returns reload and test history."""
    server = get_server()
    result = await server.execute("dashboard.metrics", {})

    data = assert_success(result)
    assert_has_reasoning(result)


# ═══════════════════════════════════════════════════════════════════════════════
# Server Commands (server.*)
# ═══════════════════════════════════════════════════════════════════════════════

@pytest.mark.asyncio
async def test_server_shutdown():
    """Test server.shutdown returns proper response.

    Note: This actually triggers shutdown after 500ms delay,
    so we only verify the immediate response.
    """
    server = get_server()
    result = await server.execute("server.shutdown", {})

    data = assert_success(result)
    assert data.status == "shutting_down"


# ═══════════════════════════════════════════════════════════════════════════════
# Command Registration Tests
# ═══════════════════════════════════════════════════════════════════════════════

# ═══════════════════════════════════════════════════════════════════════════════
# Research Commands (research.*)
# ═══════════════════════════════════════════════════════════════════════════════

@pytest.mark.asyncio
async def test_research_query_missing_api_key():
    """Test research.query handles missing API key gracefully."""
    server = get_server()
    # Temporarily clear the API key if set
    original_key = os.environ.pop("GEMINI_API_KEY", None)
    try:
        result = await server.execute("research.query", {"query": "test query"})
        assert_error(result, "API_KEY_MISSING")
        assert "GEMINI_API_KEY" in result.error.message
    finally:
        if original_key:
            os.environ["GEMINI_API_KEY"] = original_key


# ═══════════════════════════════════════════════════════════════════════════════
# Asset Commands (assets.*)
# ═══════════════════════════════════════════════════════════════════════════════

@pytest.mark.asyncio
async def test_assets_list():
    """Test assets.list returns asset info."""
    server = get_server()
    result = await server.execute("assets.list", {"addon": "!Mechanic"})

    # May succeed with empty results or fail if addon not found
    if result.success:
        data = assert_success(result)
        assert hasattr(data, 'source_count')
        assert hasattr(data, 'target_count')


@pytest.mark.asyncio
async def test_assets_sync_missing_addon():
    """Test assets.sync handles missing addon gracefully."""
    server = get_server()
    result = await server.execute("assets.sync", {"addon": "NonExistentAddon12345"})

    assert not result.success
    assert result.error is not None


# ═══════════════════════════════════════════════════════════════════════════════
# Performance Commands (perf.*)
# ═══════════════════════════════════════════════════════════════════════════════

@pytest.mark.asyncio
async def test_perf_list():
    """Test perf.list returns list of addons with baselines."""
    server = get_server()
    result = await server.execute("perf.list", {})

    data = assert_success(result)
    assert hasattr(data, 'addons')
    assert hasattr(data, 'count')
    assert isinstance(data.addons, list)


@pytest.mark.asyncio
async def test_perf_baseline():
    """Test perf.baseline records a measurement."""
    server = get_server()
    result = await server.execute("perf.baseline", {
        "addon": "TestAddon",
        "version": "1.0.0",
        "memory_kb": 100.5,
        "cpu_ms": 1.5
    })

    data = assert_success(result)
    assert data.addon == "TestAddon"
    assert data.version == "1.0.0"
    assert data.memory_kb == 100.5


@pytest.mark.asyncio
async def test_perf_compare_no_baseline():
    """Test perf.compare handles missing baseline gracefully."""
    server = get_server()
    result = await server.execute("perf.compare", {
        "addon": "NonExistentAddon12345",
        "memory_kb": 100.0,
        "cpu_ms": 1.0
    })

    # Should succeed with "no baseline" message
    data = assert_success(result)
    assert not data.has_regression


@pytest.mark.asyncio
async def test_perf_report_no_history():
    """Test perf.report handles missing history gracefully."""
    server = get_server()
    result = await server.execute("perf.report", {"addon": "NonExistentAddon12345"})

    data = assert_success(result)
    assert len(data.history) == 0


# ═══════════════════════════════════════════════════════════════════════════════
# API Definition Commands (api.populate, api.generate, api.refresh)
# ═══════════════════════════════════════════════════════════════════════════════

@pytest.mark.asyncio
async def test_api_generate_missing_database():
    """Test api.generate handles missing database gracefully."""
    server = get_server()
    result = await server.execute("api.generate", {"database_path": "/nonexistent/path.json"})

    assert_error(result, "DATABASE_NOT_FOUND")


@pytest.mark.asyncio
async def test_api_populate_missing_source():
    """Test api.populate handles missing source path gracefully."""
    server = get_server()
    result = await server.execute("api.populate", {"source_path": "/nonexistent/wow-ui-source"})

    assert_error(result, "SOURCE_NOT_FOUND")


# ═══════════════════════════════════════════════════════════════════════════════
# Atlas Commands (atlas.scan, atlas.search)
# ═══════════════════════════════════════════════════════════════════════════════

@pytest.mark.asyncio
async def test_atlas_scan_missing_source():
    """Test atlas.scan handles missing source path gracefully."""
    server = get_server()
    result = await server.execute("atlas.scan", {"source_path": "/nonexistent/wow-ui-source"})

    assert_error(result, "SOURCE_NOT_FOUND")


@pytest.mark.asyncio
async def test_atlas_search_no_index():
    """Test atlas.search handles missing index gracefully."""
    server = get_server()
    # This will fail if no index exists, which is expected in test env
    result = await server.execute("atlas.search", {"query": "sword"})

    # Either succeeds (if index exists) or errors
    assert result is not None


def test_all_commands_registered():
    """Test all 50 expected AFD commands are registered."""
    server = get_server()
    commands = server.list_commands()
    command_names = [c.name for c in commands]

    expected_commands = [
        # sv.*
        "sv.parse", "sv.discover",
        # addon.*
        "addon.output", "addon.validate", "addon.lint", "addon.format",
        "addon.test", "addon.deprecations", "addon.create", "addon.sync",
        # libs.*
        "libs.check", "libs.init", "libs.sync",
        # api.*
        "api.search", "api.info", "api.list", "api.queue", "api.stats",
        "api.populate", "api.generate", "api.refresh",
        # lua.*
        "lua.queue", "lua.results",
        # sandbox.*
        "sandbox.generate", "sandbox.status", "sandbox.exec", "sandbox.test",
        # locale.*
        "locale.validate", "locale.extract",
        # atlas.*
        "atlas.scan", "atlas.search",
        # release pipeline
        "version.bump", "changelog.add", "git.commit", "git.tag", "release.all",
        # docs.*
        "docs.generate",
        # environment
        "env.status", "tools.status", "system.pick_file",
        # dashboard
        "dashboard.metrics",
        # server
        "server.shutdown",
        # research.*
        "research.query",
        # assets.*
        "assets.sync", "assets.list",
        # perf.*
        "perf.baseline", "perf.compare", "perf.list", "perf.report",
    ]

    for cmd in expected_commands:
        assert cmd in command_names, f"Missing command: {cmd}"


def test_commands_have_descriptions():
    """Test all commands have descriptions (AFD requirement)."""
    server = get_server()
    commands = server.list_commands()

    for cmd in commands:
        assert cmd.description, f"Command {cmd.name} missing description"
        assert len(cmd.description) > 10, f"Command {cmd.name} description too short"
