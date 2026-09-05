"""Regression tests for command correctness issues found during code review."""

import os

import pytest

from mechanic import config
from mechanic.commands import api, lua, perf
from mechanic.commands.core import get_server
from mechanic.lua_strings import quote_lua_string


@pytest.mark.parametrize("module", [api, lua])
def test_queue_path_discovery_ignores_newer_stale_install(
    module, monkeypatch, tmp_path
):
    valid_client = tmp_path / "valid"
    valid_sv = valid_client / "WTF" / "Account" / "A" / "SavedVariables"
    valid_sv.mkdir(parents=True)
    valid_file = valid_sv / "!Mechanic.lua"
    valid_file.write_text("MechanicDB = {}", encoding="utf-8")
    valid_addon = valid_client / "Interface" / "AddOns" / "!Mechanic"
    valid_addon.mkdir(parents=True)

    stale_client = tmp_path / "stale"
    stale_sv = stale_client / "WTF" / "Account" / "B" / "SavedVariables"
    stale_sv.mkdir(parents=True)
    stale_file = stale_sv / "!Mechanic.lua"
    stale_file.write_text("MechanicDB = {}", encoding="utf-8")

    os.utime(valid_file, (100, 100))
    os.utime(stale_file, (200, 200))
    monkeypatch.setattr(
        config, "discover_saved_variables", lambda: [valid_sv, stale_sv]
    )

    assert module.find_addon_path() == valid_addon


def test_api_queue_serializes_arbitrary_strings_and_nested_values(
    monkeypatch, tmp_path
):
    monkeypatch.setattr(api, "find_addon_path", lambda: tmp_path)
    value = '"] = dangerous() -- ]=] tail'

    queue_path = api.write_queue_file(
        ["C_Test.Run"],
        {
            "C_Test.Run": {
                'key"] = dangerous() --': value,
                "nested": [1, True, None],
            }
        },
    )

    content = queue_path.read_text(encoding="utf-8")
    assert '["api"] = "C_Test.Run"' in content
    assert '\\"] = dangerous() -- ]=] tail"' in content
    assert "{ 1, true, nil }" in content
    assert '["key"] = dangerous() --"]' not in content


def test_lua_queue_serializes_label_as_data(monkeypatch, tmp_path):
    monkeypatch.setattr(lua, "find_addon_path", lambda: tmp_path)
    label = 'label"] = dangerous() --'

    queue_path = lua.write_lua_queue_file(["return true"], [label])

    content = queue_path.read_text(encoding="utf-8")
    assert '\\"] = dangerous() --"' in content
    assert f'["label"] = "{label}"' not in content


def test_lua_string_encoding_preserves_line_endings_and_control_bytes():
    value = "\nline1\r\nline2\t\x00"

    assert api._lua_string(value) == '"\\nline1\\r\\nline2\\t\\000"'
    assert lua.escape_lua_label(value) == api._lua_string(value)
    assert quote_lua_string(value) == api._lua_string(value)


@pytest.mark.asyncio
async def test_api_search_treats_regex_metacharacters_as_literals(monkeypatch):
    monkeypatch.setattr(
        api,
        "load_all_apis",
        lambda: {
            "C_Test.Unit.Health": {"name": "Unit.Health"},
            "C_Test.UnitXHealth": {"name": "UnitXHealth"},
        },
    )
    server = get_server()

    result = await server.execute("api.search", {"query": "Unit.Health"})
    unmatched_parenthesis = await server.execute("api.search", {"query": "("})

    assert result.success
    assert [item["key"] for item in result.data.apis] == ["C_Test.Unit.Health"]
    assert unmatched_parenthesis.success
    assert unmatched_parenthesis.data.apis == []


@pytest.mark.asyncio
async def test_api_queue_returns_structured_error_for_non_finite_numbers(
    monkeypatch, tmp_path
):
    monkeypatch.setattr(api, "load_all_apis", lambda: {"C_Test.Run": {}})
    monkeypatch.setattr(api, "find_addon_path", lambda: tmp_path)
    server = get_server()

    result = await server.execute(
        "api.queue",
        {"apis": ["c_test.run"], "params": {"c_test.run": {"value": float("nan")}}},
    )

    assert not result.success
    assert result.error.code == "INVALID_PARAMS"
    assert not (tmp_path / "MechanicQueue.lua").exists()


@pytest.mark.asyncio
async def test_perf_baseline_rejects_path_traversal(monkeypatch, tmp_path):
    baselines = tmp_path / "baselines"
    monkeypatch.setattr(perf, "_get_baselines_dir", lambda: baselines)
    request = perf.PerfBaselineInput(
        addon="../outside", version="1.0.0", memory_kb=10, cpu_ms=1
    )

    result = await perf._perf_baseline(request)

    assert not result.success
    assert result.error.code == "INVALID_ADDON"
    assert not (tmp_path / "outside_baseline.json").exists()


@pytest.mark.asyncio
async def test_perf_list_preserves_baseline_substring_in_addon_name(
    monkeypatch, tmp_path
):
    (tmp_path / "my_baseline_tool_baseline.json").write_text("{}", encoding="utf-8")
    monkeypatch.setattr(perf, "_get_baselines_dir", lambda: tmp_path)

    result = await perf._perf_list(perf.PerfListInput())

    assert result.success
    assert result.data.addons == ["my_baseline_tool"]


def test_perf_and_search_inputs_reject_invalid_ranges():
    with pytest.raises(ValueError):
        perf.PerfBaselineInput(addon="Mechanic", version="1", memory_kb=-1, cpu_ms=0)
    with pytest.raises(ValueError):
        perf.PerfReportInput(addon="Mechanic", limit=0)
    with pytest.raises(ValueError):
        api.APISearchInput(query="test", limit=0)
