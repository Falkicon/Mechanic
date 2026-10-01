"""Lua queue string encoding and FenCore catalog command regressions."""

import os
import re
import subprocess

import pytest

from mechanic import config, sv_cache
from mechanic.commands import lua
from mechanic.commands.core import get_server

SNIPPETS = [
    "return 1 + 1",
    "return t[1]",
    "return t[t[1]]",
    "return x[1]--[=[",
    "local a = t[1]]",
    "return t[ [[nested]] ]",
    "return [==[x]==]",
    "\nreturn 'leading newline'",
    "\r\nreturn 'leading crlf'",
    "return 'trailing equals]='",
    "return ']]' .. ']=]' .. ']==]'",
    "return '[[' .. '[=[' .. '[==['",
    "",
    "]",
    "return 'unicode é—'",
]


def literal_value(literal: str) -> str:
    """Decode a Lua long-string literal like Lua's lexer does."""
    opening = re.match(r"\[(=*)\[", literal)
    assert opening, literal
    level = opening.group(1)
    body = literal[opening.end() :]
    if body.startswith("\n"):
        body = body[1:]
    close = f"]{level}]"
    end = body.find(close)
    assert end != -1, "unterminated long string"
    assert body[end + len(close) :] == "", "closes before the end of the literal"
    return body[:end]


@pytest.mark.parametrize("snippet", SNIPPETS)
def test_escape_lua_string_closes_only_at_the_end(snippet):
    value = literal_value(lua.escape_lua_string(snippet))

    # only a trailing "]" needs an extra newline so it cannot fuse with the closer
    assert value in (snippet, snippet + "\n")
    if not snippet.endswith("]"):
        assert value.replace("\r\n", "\n") == snippet.replace("\r\n", "\n")


def test_escape_lua_string_trailing_bracket_regression():
    assert lua.escape_lua_string("return t[1]") == "[[return t[1]\n]]"
    assert lua.escape_lua_string("return 1") == "[[return 1]]"


@pytest.mark.skipif(not os.environ.get("MECHANIC_LUA"), reason="needs a Lua 5.1 binary")
@pytest.mark.parametrize("snippet", SNIPPETS)
def test_escape_lua_string_round_trips_through_real_lua(snippet, tmp_path):
    script = tmp_path / "check.lua"
    script.write_bytes(
        ("local s = " + lua.escape_lua_string(snippet) + "\nio.write(s)\n").encode(
            "utf-8"
        )
    )

    out = subprocess.run(
        [os.environ["MECHANIC_LUA"], str(script)], capture_output=True, check=True
    ).stdout.decode("utf-8")

    assert out.replace("\r\n", "\n") in (
        snippet.replace("\r\n", "\n"),
        snippet.replace("\r\n", "\n") + "\n",
    )


@pytest.mark.skipif(not os.environ.get("MECHANIC_LUA"), reason="needs a Lua 5.1 binary")
def test_generated_queue_file_is_valid_lua(tmp_path, monkeypatch):
    monkeypatch.setattr(lua, "find_addon_path", lambda: tmp_path)
    queue = lua.write_lua_queue_file(SNIPPETS[:9], [f"label {i}" for i in range(9)])
    runner = tmp_path / "run.lua"
    runner.write_text(
        f'dofile([[{queue}]])\nio.write(#MECHANIC_LUA_QUEUE, ":", MECHANIC_LUA_QUEUE[2].code)\n',
        encoding="utf-8",
    )

    out = subprocess.run(
        [os.environ["MECHANIC_LUA"], str(runner)], capture_output=True, check=True
    ).stdout.decode("utf-8")

    assert out.startswith("9:return t[1]")


# ── lua.results / lua.queue ──────────────────────────────────────────────────


def install_client(tmp_path, monkeypatch, body):
    sv = tmp_path / "_retail_" / "WTF" / "Account" / "ACC" / "SavedVariables"
    sv.mkdir(parents=True)
    addon = tmp_path / "_retail_" / "Interface" / "AddOns" / "!Mechanic"
    addon.mkdir(parents=True)
    (sv / "!Mechanic.lua").write_text(body, encoding="utf-8")
    monkeypatch.setattr(config, "discover_saved_variables", lambda: [sv])
    sv_cache.clear_cache()
    return addon


DB = """
MechanicDB = {
	["profileKeys"] = { ["Me - Realm"] = "Default" },
	["profiles"] = { ["Default"] = {
		["luaEvalResults"] = { ["lastRun"] = "2026-09-30 10:00:00", ["results"] = {
			{ ["label"] = "a", ["success"] = true, ["result"] = "1" },
			"junk",
		} },
		["addonData"] = { ["FenCore"] = { ["version"] = "1", ["catalog"] = {
			["version"] = "2.3",
			["domains"] = {
				["Math"] = {
					["Clamp"] = { ["description"] = "Clamp a value", ["params"] = { { ["name"] = "v" }, "bad" },
						["returns"] = { ["type"] = "number" }, ["example"] = "Clamp(1,0,2)" },
					["Lerp"] = { ["description"] = "Interpolate" },
				},
				["Table"] = { ["Count"] = { ["description"] = "Clamp-like counter" }, ["x"] = true },
				["Broken"] = true,
			},
		} } },
	} },
}
"""


@pytest.mark.asyncio
async def test_lua_queue_and_results_roundtrip(tmp_path, monkeypatch):
    addon = install_client(tmp_path, monkeypatch, DB)

    queued = await get_server().execute(
        "lua.queue", {"code": ["return t[1]"], "labels": ["index"]}
    )
    results = await get_server().execute("lua.results", {})

    assert queued.success, queued.error
    assert "[[return t[1]\n]]" in (addon / "MechanicQueue.lua").read_text(
        encoding="utf-8"
    )
    assert results.success, results.error
    assert results.data.total == 1 and results.data.results[0]["label"] == "a"
    assert results.data.last_run == "2026-09-30 10:00:00"


# ── fencore-* ────────────────────────────────────────────────────────────────


@pytest.fixture
def fencore(tmp_path, monkeypatch):
    return install_client(tmp_path, monkeypatch, DB)


@pytest.mark.asyncio
async def test_fencore_catalog_reads_the_selected_saved_variables(fencore):
    result = await get_server().execute("fencore-catalog", {})

    assert result.success, result.error
    assert result.data.version == "2.3"
    assert set(result.data.domains) == {"Math", "Table"}
    assert result.data.total_functions == 4


@pytest.mark.asyncio
async def test_fencore_search_ranks_name_matches_first(fencore):
    result = await get_server().execute("fencore-search", {"query": "clamp"})

    assert result.success, result.error
    assert [r.full_name for r in result.data.results] == ["Math.Clamp", "Table.Count"]
    assert result.data.total == 2

    limited = await get_server().execute(
        "fencore-search", {"query": "clamp", "limit": 1}
    )
    assert len(limited.data.results) == 1 and limited.data.total == 2
    none = await get_server().execute("fencore-search", {"query": "zzz"})
    assert none.success and none.data.results == []


@pytest.mark.asyncio
async def test_fencore_info_and_errors(fencore):
    info = await get_server().execute(
        "fencore-info", {"domain": "Math", "function": "Clamp"}
    )

    assert info.success, info.error
    assert info.data.full_name == "Math.Clamp" and info.data.example == "Clamp(1,0,2)"
    assert info.data.params == [{"name": "v"}] and info.data.returns == {
        "type": "number"
    }

    no_domain = await get_server().execute(
        "fencore-info", {"domain": "Nope", "function": "x"}
    )
    no_func = await get_server().execute(
        "fencore-info", {"domain": "Math", "function": "Nope"}
    )
    assert (
        no_domain.error.code == "DOMAIN_NOT_FOUND"
        and "Math" in no_domain.error.suggestion
    )
    assert (
        no_func.error.code == "FUNCTION_NOT_FOUND"
        and "Clamp" in no_func.error.suggestion
    )


@pytest.mark.asyncio
async def test_fencore_without_catalog_or_target_is_actionable(tmp_path, monkeypatch):
    install_client(
        tmp_path, monkeypatch, 'MechanicDB = { ["profiles"] = { ["Default"] = {} } }'
    )
    missing = await get_server().execute("fencore-catalog", {})
    assert missing.error.code == "CATALOG_NOT_FOUND" and missing.error.suggestion

    monkeypatch.setattr(config, "discover_saved_variables", lambda: [])
    none = await get_server().execute("fencore-catalog", {})
    assert none.error.code == "TARGET_NOT_FOUND" and none.error.suggestion


@pytest.mark.asyncio
async def test_fencore_finds_the_legacy_registered_location(tmp_path, monkeypatch):
    install_client(
        tmp_path,
        monkeypatch,
        'MechanicDB = { ["registered"] = { ["FenCore"] = { ["catalog"] = '
        '{ ["version"] = "1", ["domains"] = { ["A"] = { ["f"] = {} } } } } } }',
    )

    result = await get_server().execute("fencore-catalog", {})

    assert result.success, result.error
    assert result.data.total_functions == 1
