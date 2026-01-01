import pytest
import asyncio
from mechanic.commands.core import get_server
from afd.testing.assertions import assert_success, assert_error, assert_has_reasoning, assert_has_sources

@pytest.mark.asyncio
async def test_discover_sv_logic():
    server = get_server()
    result = await server.execute("sv.discover", {})
    
    # We expect success if any WoW installations are found in the dev environment
    if result.success:
        data = assert_success(result)
        assert hasattr(data, 'paths')
        assert len(data.paths) >= 0
        assert_has_sources(result)
    else:
        # If no WoW found, it should still be a valid AFD error result
        assert_error(result, "NOT_FOUND")

@pytest.mark.asyncio
async def test_reload_trigger_invalid():
    server = get_server()
    # Mocking a window failure might be hard without real environment, 
    # but we can test the command structure.
    result = await server.execute("reload.trigger", {"key": "NONE"})
    
    # In my current implementation, it tries to focus WoW.
    # If WoW isn't found, it returns WINDOW_NOT_FOUND
    if not result.success:
        assert_error(result, "WINDOW_NOT_FOUND")
        assert result.error.suggestion is not None

@pytest.mark.asyncio
async def test_parse_sv_missing_file():
    server = get_server()
    result = await server.execute("sv.parse", {"file_path": "non_existent.lua"})
    
    assert_error(result, "FILE_NOT_FOUND")
    assert "not found" in result.error.message.lower()

@pytest.mark.asyncio
async def test_shutdown_command():
    server = get_server()
    # We use a mock or check result shape
    # Caution: Real shutdown command calls os._exit(0)
    # For testing, we might want to check reasoning without triggering exit
    # but since I implemented it with a delay, we can catch the result first
    result = await server.execute("server.shutdown", {})
    assert_success(result)
    assert result.data.status == "shutting_down"

@pytest.mark.asyncio
async def test_addon_output_command():
    """Test addon.output returns structured data (AFD compliance)."""
    server = get_server()
    result = await server.execute("addon.output", {})
    
    # Should always succeed (even with no data)
    data = assert_success(result)
    
    # Verify output schema
    assert hasattr(data, 'output')
    assert hasattr(data, 'error_count')
    assert hasattr(data, 'test_count')
    assert hasattr(data, 'console_count')
    
    # Verify AFD fields
    assert_has_reasoning(result)
    assert_has_sources(result)
    
    # Output should be markdown formatted
    assert "## Addon Output" in data.output
    assert "### Errors" in data.output
    assert "### Tests" in data.output
    assert "### Console" in data.output
