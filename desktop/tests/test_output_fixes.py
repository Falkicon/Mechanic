"""addon.output parsing, compression, freshness and warning regressions."""

import json
from pathlib import Path

import pytest

from mechanic import config, sv_cache
from mechanic.commands import output
from mechanic.commands.core import get_server

BUGGRABBER = """
BugGrabberDB = {
	["session"] = 3,
	["errors"] = {
		{
			["message"] = "Interface/AddOns/Demo/Core.lua:12: attempt to index nil",
			["stack"] = "stack",
			["time"] = "now",
			["counter"] = 4,
			["session"] = 3,
		},
		{
			["message"] = "Interface/AddOns/Demo/Core.lua:12: attempt to index nil",
			["counter"] = "<img src=x onerror=alert(1)>",
			["session"] = 3,
		},
		{
			["message"] = "old session error",
			["counter"] = 9,
			["session"] = 2,
		},
		{
			["message"] = "taint: ADDON_ACTION_BLOCKED A",
			["counter"] = 1,
			["session"] = 3,
		},
		{
			["message"] = "taint: ADDON_ACTION_BLOCKED B",
			["counter"] = 2,
			["session"] = 3,
		},
	},
}
"""


def test_buggrabber_counter_is_always_a_positive_int():
    parsed = output.parse_buggrabber(BUGGRABBER)

    assert parsed["parse_error"] is None
    assert parsed["session"] == 3
    counters = [e["counter"] for e in parsed["errors"]]
    assert counters == [4, 1, 1, 2]
    assert all(type(c) is int for c in counters)


@pytest.mark.parametrize("raw", [True, 0, -3, "abc", None, 1e400, [1]])
def test_safe_int_rejects_unsafe_values(raw):
    assert output._safe_int(raw) == 1


def test_buggrabber_parse_failure_is_reported_not_swallowed(monkeypatch):
    def boom(_content):
        raise ValueError("truncated table")

    monkeypatch.setattr(output, "parse_savedvariables", boom)
    parsed = output.parse_buggrabber("BugGrabberDB = {")

    assert parsed["errors"] == []
    assert "truncated table" in parsed["parse_error"]


def test_compress_keeps_distinct_messages_and_does_not_mutate_input():
    errors = output.parse_buggrabber(BUGGRABBER)["errors"]
    snapshot = json.loads(json.dumps(errors))

    compressed = output.compress_errors_for_agent(errors, max_per_addon=5)

    assert errors == snapshot
    assert compressed["total"] == 4
    demo = compressed["by_addon"]["Demo"]
    assert len(demo) == 1 and demo[0]["counter"] == 5
    unknown = compressed["by_addon"]["Unknown"]
    assert sorted(e["message"] for e in unknown) == [
        "taint: ADDON_ACTION_BLOCKED A",
        "taint: ADDON_ACTION_BLOCKED B",
    ]
    assert [e["counter"] for e in unknown] == [2, 1]


def test_hub_parsers_ignore_malformed_entries():
    profile = {
        "addonData": {
            "Good": {
                "version": "1.0",
                "logs": ["a", "b"],
                "perf": {"tick": {"cpu": 1}, "named": {"name": "x"}},
            },
            "Broken": True,
            "AlsoBroken": "text",
        }
    }

    assert output.parse_hub_logs_from_mechanic_db(profile) == [
        {"addon": "Good", "lines": ["a", "b"]}
    ]
    assert output.parse_hub_libraries_from_mechanic_db(profile) == [
        {"name": "Good", "version": "1.0"}
    ]
    perf = output.parse_hub_performance_from_mechanic_db(profile)
    assert perf == {"Good": [{"cpu": 1, "name": "tick"}, {"name": "x"}]}
    # the source table is not modified
    assert "name" not in profile["addonData"]["Good"]["perf"]["tick"]


def test_tests_merge_hub_and_legacy_without_duplicates():
    profile = {
        "addonData": {"Demo": {"tests": {"t1": {"passed": True, "name": "One"}}}},
        "testResults": {
            "Demo:t1": {"passed": False, "name": "One"},
            "db_integrity": {"passed": True},
        },
    }

    tests = output.parse_tests_from_mechanic_db(profile)

    assert [(t["addon"], t["name"], t["passed"]) for t in tests] == [
        ("Demo", "One", True),
        ("!Mechanic", "Database Integrity", True),
    ]


def test_api_bench_parsing_and_none_duration_does_not_crash_formatting():
    profile = {
        "apiTests": {
            "C_Spell.GetSpellInfo": {
                "lastRun": 1,
                "status": "secret",
                "funcPath": "C_Spell.GetSpellInfo",
                "signature": "(id) -> info",
                "lastParams": {"id": 1},
                "results": ["protected"],
                "midnightImpact": "HIGH",
                "midnightNote": "SecretArguments=AllowedWhenUntainted",
            },
            "UnitHealth": {"lastRun": 1, "status": "error"},
            "Never": {"status": "pass"},
        }
    }
    api_tests = output.parse_api_tests_from_mechanic_db(profile)

    assert api_tests["total"] == 2
    assert api_tests["summary"]["secret"] == 1 and api_tests["summary"]["error"] == 1
    assert set(api_tests["by_namespace"]) == {"C_Spell", "Global"}
    spell = api_tests["tests"][0]
    assert spell["impactExplanation"].startswith("Major changes")
    assert spell["secretExplanations"] == ["Arguments accepted when code is untainted"]

    text = "\n".join(output._api_tests_section(api_tests, agent_mode=False))
    assert "Duration:** n/a" in text
    assert "Called with:** `id=1`" in text


def test_lua_eval_guard_and_timestamp_priority():
    assert output.parse_lua_eval_from_mechanic_db({"luaEvalResults": "x"})["total"] == 0
    evaluated = output.parse_lua_eval_from_mechanic_db(
        {"luaEvalResults": {"results": ["junk", {"success": True}, {"success": False}]}}
    )
    assert (evaluated["total"], evaluated["succeeded"], evaluated["failed"]) == (
        2,
        1,
        1,
    )

    assert output.profile_timestamp({}) is None
    assert output.profile_timestamp({"luaEvalResults": {"lastRun": "2026-01-01"}}) == (
        "2026-01-01"
    )
    stamp = output.profile_timestamp(
        {"lastSync": 1_700_000_000, "luaEvalResults": {"lastRun": "old"}}
    )
    assert stamp and stamp[:2] == "20" and stamp != "old"
    assert output.profile_timestamp({"lastSync": 0}) is None
    assert output.profile_timestamp({"lastSync": True}) is None


def test_error_shadowing_regression_raw_errors_survive_api_section():
    data = {
        "timestamp": None,
        "errors": output.parse_buggrabber(BUGGRABBER)["errors"],
        "tests": [],
        "console": [],
        "libraries": [],
        "hub_logs": [],
        "api_tests": output.parse_api_tests_from_mechanic_db(
            {"apiTests": {"C_X.Y": {"lastRun": 1, "status": "pass"}}}
        ),
        "lua_eval": output.parse_lua_eval_from_mechanic_db({}),
    }

    text = output.format_output(data, agent_mode=True, warnings=["note"])

    assert "Errors (4 total, showing 3 unique)" in text
    assert "> Warning: note" in text
    assert len(data["errors"]) == 4


def test_console_agent_mode_collapses_adjacent_duplicates():
    console = [{"source": "s", "category": "", "message": "m"}] * 3 + [
        {"source": "s", "category": "c", "message": "n"}
    ]
    lines = output._console_section(console, agent_mode=True)

    assert "(x3)" in "\n".join(lines)
    assert "4 entries, 2 unique" in "\n".join(lines)


def test_sv_cache_reparses_only_when_the_file_changes(tmp_path, monkeypatch):
    path = tmp_path / "!Mechanic.lua"
    path.write_text("MechanicDB = { a = 1 }", encoding="utf-8")
    calls = []
    real = sv_cache.parse_savedvariables
    monkeypatch.setattr(
        sv_cache, "parse_savedvariables", lambda text: calls.append(1) or real(text)
    )
    sv_cache.clear_cache()

    first = sv_cache.parse_sv_file(path)
    assert sv_cache.parse_sv_file(path) is first
    assert len(calls) == 1

    path.write_text("MechanicDB = { a = 2, b = 3 }", encoding="utf-8")
    assert sv_cache.parse_sv_file(path)["MechanicDB"]["b"] == 3
    assert len(calls) == 2


def _install_client(tmp_path: Path, monkeypatch, mechanic: str, bugs: str | None):
    client = tmp_path / "_retail_"
    sv = client / "WTF" / "Account" / "ACC" / "SavedVariables"
    sv.mkdir(parents=True)
    (sv / "!Mechanic.lua").write_text(mechanic, encoding="utf-8")
    if bugs is not None:
        (sv / "!BugGrabber.lua").write_text(bugs, encoding="utf-8")
    monkeypatch.setattr(config, "discover_saved_variables", lambda: [sv])
    sv_cache.clear_cache()
    return client


MECHANIC_DB = """
MechanicDB = {
	["profileKeys"] = { ["Me - Realm"] = "Default" },
	["profiles"] = {
		["Default"] = {
			["lastSync"] = 1700000000,
			["consoleBuffer"] = { { ["source"] = "x", ["message"] = "hello" } },
			["addonData"] = {
				["Demo"] = {
					["version"] = "1.2",
					["tests"] = { ["t"] = { ["passed"] = false, ["name"] = "Broken" } },
				},
			},
			["apiTests"] = {
				["C_Spell.Get"] = { ["lastRun"] = 1, ["status"] = "error" },
			},
		},
	},
}
"""


@pytest.mark.asyncio
async def test_addon_output_agent_mode_keeps_bugs_and_freshness(tmp_path, monkeypatch):
    _install_client(tmp_path, monkeypatch, MECHANIC_DB, BUGGRABBER)

    result = await get_server().execute("addon.output", {"agent_mode": True})

    assert result.success, result.error
    data = result.data
    assert data.error_count == 4 and len(data.errors) == 4
    assert data.api_test_count == 1 and data.test_count == 1
    assert data.timestamp and data.timestamp[:2] == "20"
    assert "No reload data yet" not in data.output
    assert "FAIL: `Broken`" in data.output
    assert all(type(e["counter"]) is int for e in data.errors)


@pytest.mark.asyncio
async def test_addon_output_reports_unreadable_buggrabber(tmp_path, monkeypatch):
    _install_client(tmp_path, monkeypatch, MECHANIC_DB, "BugGrabberDB = {")

    result = await get_server().execute("addon.output", {})

    assert result.success, result.error
    assert result.data.error_count == 0
    assert "could not be parsed" in result.data.output
    assert result.warnings and result.warnings[0].code == "BUGGRABBER_UNREADABLE"


@pytest.mark.asyncio
async def test_addon_output_missing_profile_is_a_structured_error(
    tmp_path, monkeypatch
):
    client = _install_client(tmp_path, monkeypatch, MECHANIC_DB, None)
    sv = client / "WTF" / "Account" / "ACC" / "SavedVariables" / "!Mechanic.lua"
    targets = await get_server().execute("diagnostic.targets", {})
    assert targets.success, targets.error
    chosen = targets.data.targets[0].model_dump()
    # the profile disappears between selection and read
    sv.write_text(
        MECHANIC_DB.replace('["Default"] = {', '["Other"] = {', 1).replace(
            '["profileKeys"] = { ["Me - Realm"] = "Default" }', ""
        ),
        encoding="utf-8",
    )
    sv_cache.clear_cache()

    result = await get_server().execute("addon.output", {"target": chosen})

    assert not result.success
    assert result.error.code in {"TARGET_NOT_FOUND", "TARGET_READ_ERROR"}
    assert result.error.suggestion
