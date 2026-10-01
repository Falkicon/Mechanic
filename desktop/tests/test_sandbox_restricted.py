"""Sandbox commands: restricted execution, stub generation, and the test runner."""

import os
import time

import pytest

from mechanic.commands import sandbox
from mechanic.commands.core import get_server
from mechanic.pipeline_paths import find_lua_exe

pytestmark = pytest.mark.asyncio

LUA = find_lua_exe()
needs_lua = pytest.mark.skipif(LUA is None, reason="no Lua 5.1 (set MECHANIC_LUA)")

APIDEFS_TEMPLATE = """-- Generated APIDefinitions for namespace: {ns}
local _, ns = ...
local APIDefs = ns.APIDefinitions

{entries}
"""

ENTRY = """APIDefs["{key}"] = {{
    key = "{key}",
    name = "{name}",
    category = "general",
    subcategory = "x",
    funcPath = "{key}",
    params = {{ {{ name = "name", type = "string", default = nil }} }},
    returns = {{ {returns} }},
    midnightImpact = "{impact}",
{protected}}}
"""


def _entry(key, returns=1, impact="NORMAL"):
    rets = ", ".join(
        '{ name = "r%d", type = "number", canBeSecret = false }' % i
        for i in range(returns)
    )
    return ENTRY.format(
        key=key,
        name=key.split(".")[-1],
        returns=rets,
        impact=impact,
        protected="    protected = true,\n" if impact == "RESTRICTED" else "",
    )


@pytest.fixture
def env(tmp_path, monkeypatch):
    apidefs = tmp_path / "Mechanic" / "UI" / "APIDefs"
    apidefs.mkdir(parents=True)
    (apidefs / "C_Test.lua").write_text(
        APIDEFS_TEMPLATE.format(
            ns="C_Test",
            entries="\n".join(
                [
                    _entry("C_Test.Mock", returns=2),
                    _entry("C_Test.Blocked", impact="RESTRICTED"),
                ]
            ),
        ),
        encoding="utf-8",
    )
    (apidefs / "Global.lua").write_text(
        APIDEFS_TEMPLATE.format(
            ns="Global",
            entries="\n".join(
                [
                    _entry("lowerCaseGlobal"),
                    _entry("UpperGlobal"),
                    _entry("print"),  # would shadow a runner global
                    _entry("bad-name"),  # not a Lua identifier
                ]
            ),
        ),
        encoding="utf-8",
    )
    monkeypatch.setattr(sandbox, "get_apidefs_dir", lambda: apidefs)
    monkeypatch.setattr(sandbox, "find_sandbox_folder", lambda: tmp_path / "sandbox")
    return tmp_path


async def _generate(**payload):
    return await get_server().execute("sandbox.generate", payload)


async def _exec(code, **payload):
    return await get_server().execute("sandbox.exec", {"code": code, **payload})


# ─── stub generation ─────────────────────────────────────────────────────────


async def test_generate_writes_sectioned_stubs_and_counts_lowercase_globals(env):
    result = await _generate()

    assert result.success, result.error
    assert result.data.stubs_generated == 4  # print and bad-name are skipped
    assert result.data.protected_count == 1
    text = (env / "sandbox" / "generated" / "wow_stubs.lua").read_text("utf-8")
    assert "function lowerCaseGlobal(...)" in text
    assert "function print(" not in text and "bad-name" not in text
    assert "\r" not in text

    status = await get_server().execute("sandbox.status", {})
    assert status.data.stubs_generated == 4
    assert status.data.protected_count == 1


async def test_generate_with_namespace_merges_instead_of_overwriting(env):
    await _generate()
    stubs = env / "sandbox" / "generated" / "wow_stubs.lua"
    apidefs = env / "Mechanic" / "UI" / "APIDefs"
    (apidefs / "C_Test.lua").write_text(
        APIDEFS_TEMPLATE.format(
            ns="C_Test", entries=_entry("C_Test.Added") + _entry("C_Test.Blocked")
        ),
        encoding="utf-8",
    )

    result = await _generate(namespace="C_Test")

    assert result.success, result.error
    text = stubs.read_text(encoding="utf-8")
    assert "function C_Test.Added(" in text
    assert "function C_Test.Mock(" not in text  # namespace section was replaced
    assert "function lowerCaseGlobal(" in text  # other namespaces survived
    assert result.data.stubs_generated == 4


async def test_generate_rejects_partial_without_existing_stubs_and_bad_names(env):
    partial = await _generate(namespace="C_Test")
    bad = await _generate(namespace="../evil")

    assert not partial.success and partial.error.code == "STUBS_NOT_GENERATED"
    assert not bad.success and bad.error.code == "INVALID_NAMESPACE"
    assert not (env / "sandbox").exists()


async def test_generate_honours_force_and_skips_when_up_to_date(env):
    first = await _generate()
    stubs = env / "sandbox" / "generated" / "wow_stubs.lua"
    marker = "-- sentinel\n"
    stubs.write_text(
        stubs.read_text(encoding="utf-8") + marker, encoding="utf-8", newline="\n"
    )
    future = time.time() + 100
    os.utime(stubs, (future, future))

    skipped = await _generate()
    assert "sentinel" in stubs.read_text(encoding="utf-8")
    assert "up to date" in skipped.reasoning.lower()
    assert skipped.data.stubs_generated == first.data.stubs_generated

    forced = await _generate(force=True)
    assert forced.success
    assert "sentinel" not in stubs.read_text(encoding="utf-8")


# ─── restricted execution ────────────────────────────────────────────────────


@needs_lua
async def test_exec_basic_results_and_stubs_work(env):
    await _generate()

    value = await _exec("return 1 + 1")
    table = await _exec("return { a = 1 }")
    mocked = await _exec("return C_Test.Mock()")
    lower = await _exec("print('hi'); return lowerCaseGlobal()")
    blocked = await _exec("return C_Test.Blocked()")

    assert value.data.result == "2" and value.data.exit_code == 0
    assert table.data.result == "{a=1}"
    assert mocked.data.result == "nil" and mocked.data.exit_code == 0
    assert lower.data.output == "hi" and lower.data.result == "nil"
    assert blocked.data.exit_code == 1
    assert "protected/restricted" in blocked.data.error


@needs_lua
@pytest.mark.parametrize(
    "expression",
    [
        "os",
        "io",
        "package",
        "debug",
        "require",
        "dofile",
        "loadfile",
        "load",
        "getfenv",
        "setfenv",
        "module",
        "string.dump",
        "_G.os",
        "_G._G.io",
    ],
)
async def test_exec_hides_dangerous_globals(env, expression):
    result = await _exec(f"return tostring({expression})")

    assert result.success
    assert result.data.result == "nil", expression


@needs_lua
@pytest.mark.parametrize(
    "call",
    [
        'os.execute("echo pwned")',
        'io.open("sandbox_escape.txt", "w")',
        'io.popen("echo pwned")',
        'loadstring("return os.execute")()()',
        'dofile("x.lua")',
    ],
)
async def test_exec_user_code_cannot_run_commands_or_touch_files(env, call):
    result = await _exec(call)

    assert result.success
    assert result.data.exit_code == 1
    assert result.data.error
    assert not (env / "sandbox_escape.txt").exists()


@needs_lua
async def test_exec_loadstring_is_bound_to_the_restricted_environment(env):
    bound = await _exec('return tostring(loadstring("return os")())')
    binary = await _exec('return tostring((loadstring("\\27Lua")))')
    meta = await _exec('return tostring(getmetatable(""))')

    assert bound.data.result == "nil"
    assert binary.data.result == "nil"
    assert meta.data.result == "nil"


@needs_lua
async def test_exec_reports_syntax_errors_and_caps_output(env):
    syntax = await _exec("return +")
    flood = await _exec("for i = 1, 100000 do print(('x'):rep(100)) end")

    assert syntax.data.exit_code == 1 and syntax.data.error
    assert flood.data.exit_code == 1
    assert "output limit" in flood.data.error
    assert len(flood.data.output) <= sandbox.MAX_SANDBOX_OUTPUT


@needs_lua
async def test_exec_times_out(env, monkeypatch):
    monkeypatch.setattr(sandbox, "EXEC_TIMEOUT_SECONDS", 1)

    result = await _exec("while true do end")

    assert not result.success and result.error.code == "TIMEOUT"


@needs_lua
async def test_exec_loads_addon_core_inside_the_sandbox(env, monkeypatch):
    addon = env / "MyAddon"
    (addon / "Core").mkdir(parents=True)
    (addon / "Core" / "init.lua").write_text("Answer = 42", encoding="utf-8")
    (addon / "Core" / "x_spec.lua").write_text("error('not loaded')", encoding="utf-8")
    monkeypatch.setattr(sandbox, "find_dev_addon_path", lambda name: addon)

    result = await _exec("return Answer", addon="MyAddon")

    assert result.data.result == "42"


async def test_exec_reports_missing_lua(env, monkeypatch):
    monkeypatch.setattr(sandbox, "find_lua_exe", lambda: None)

    result = await _exec("return 1")

    assert not result.success and result.error.code == "LUA_NOT_FOUND"


# ─── test runner ─────────────────────────────────────────────────────────────


def _addon(tmp_path, specs, core=None):
    addon = tmp_path / "SpecAddon"
    (addon / "Tests").mkdir(parents=True)
    if core is not None:
        (addon / "Core").mkdir()
        (addon / "Core" / "init.lua").write_text(core, encoding="utf-8")
    for name, text in specs.items():
        (addon / "Tests" / name).write_text(text, encoding="utf-8")
    return addon


async def _test(monkeypatch, addon, **payload):
    monkeypatch.setattr(sandbox, "find_dev_addon_path", lambda name: addon)
    return await get_server().execute("sandbox.test", {"addon": "SpecAddon", **payload})


@needs_lua
async def test_sandbox_test_lists_failures_first_and_honours_filter(env, monkeypatch):
    await _generate()
    addon = _addon(
        env,
        {
            "b_spec.lua": """
describe("B", function()
  it("passes", function() assert.equals(1, 1) end)
  it("fails", function() assert.equals(1, 2) end)
  it("uses plain assert", function() assert(true) end)
  it("uses stubs", function() assert.is_nil(C_Test.Blocked and nil) end)
end)
""",
            "a_spec.lua": """
describe("A", function()
  it("also passes", function() assert.is_true(true) end)
  it("cannot escape", function() assert.is_nil(os) end)
end)
""",
        },
        core="Core = { value = 7 }",
    )

    result = await _test(monkeypatch, addon)

    assert result.success, result.error
    data = result.data
    assert (data.total, data.passed_count, data.failed_count) == (6, 5, 1)
    assert data.passed is False
    assert data.tests[0].passed is False
    assert data.tests[0].name == "B > fails"
    assert "Expected 1 but got 2" in data.tests[0].error
    assert data.spec_files == ["Tests/a_spec.lua", "Tests/b_spec.lua"]
    assert data.source_files == ["init.lua"]

    filtered = await _test(monkeypatch, addon, filter="also passes")
    assert (filtered.data.total, filtered.data.failed_count) == (1, 0)
    assert filtered.data.passed is True
    assert [t.name for t in filtered.data.tests] == ["A > also passes"]

    nothing = await _test(monkeypatch, addon, filter="no such test")
    assert nothing.data.total == 0 and nothing.data.passed is False
    assert "no tests matched" in nothing.reasoning


@needs_lua
async def test_sandbox_test_does_not_truncate_failures_beyond_twenty(env, monkeypatch):
    lines = "\n".join(
        f'  it("t{i:02d}", function() assert.equals({0 if i >= 30 else 1}, 1) end)'
        for i in range(40)
    )
    addon = _addon(env, {"many_spec.lua": f'describe("M", function()\n{lines}\nend)'})

    result = await _test(monkeypatch, addon)

    assert result.data.failed_count == 10 and result.data.total == 40
    assert [t.passed for t in result.data.tests[:10]] == [False] * 10


@needs_lua
async def test_sandbox_test_reports_spec_load_errors_as_failures(env, monkeypatch):
    addon = _addon(
        env,
        {
            "good_spec.lua": 'describe("G", function() it("ok", function() end) end)',
            "broken_spec.lua": "this is not lua",
        },
    )

    result = await _test(monkeypatch, addon)

    assert result.success
    assert result.data.failed_count == 1
    failure = result.data.tests[0]
    assert failure.name.startswith("spec load errors > Tests/broken_spec.lua")
    assert failure.passed is False


@needs_lua
async def test_sandbox_test_specs_cannot_use_os_or_unsafe_require(env, monkeypatch):
    addon = _addon(
        env,
        {
            "sec_spec.lua": """
describe("S", function()
  it("os.execute fails", function() os.execute("echo x") end)
  it("io.popen fails", function() io.popen("echo x") end)
  it("absolute require rejected", function() require("C:/Windows/win") end)
  it("traversal require rejected", function() require("..secret") end)
  it("local require works", function()
    assert.equals(5, require("helper").value)
  end)
end)
""",
        },
    )
    (addon / "helper.lua").write_text("return { value = 5 }", encoding="utf-8")

    result = await _test(monkeypatch, addon)

    assert (result.data.passed_count, result.data.failed_count) == (1, 4)


@needs_lua
async def test_sandbox_test_returns_structured_error_when_lua_fails(env, monkeypatch):
    addon = _addon(
        env,
        {"s_spec.lua": 'describe("S", function() it("x", function() end) end)'},
        core="this is not lua",
    )

    result = await _test(monkeypatch, addon)

    assert not result.success
    assert result.error.code == "LUA_FAILED"
    assert "init.lua" in result.error.message


@needs_lua
async def test_sandbox_test_works_on_a_fresh_clone_without_generated_files(
    env, monkeypatch
):
    assert not (env / "sandbox").exists()
    addon = _addon(
        env, {"s_spec.lua": 'describe("S", function() it("x", function() end) end)'}
    )

    result = await _test(monkeypatch, addon)

    assert result.success and result.data.passed is True
    assert "stubs not generated" in result.reasoning


async def test_sandbox_test_errors_when_framework_resource_is_missing(
    env, monkeypatch, tmp_path
):
    addon = _addon(
        env, {"s_spec.lua": 'describe("S", function() it("x", function() end) end)'}
    )
    monkeypatch.setattr(sandbox, "find_lua_exe", lambda: tmp_path / "lua.exe")
    monkeypatch.setattr(sandbox, "resource_path", lambda name: tmp_path / name)

    result = await _test(monkeypatch, addon)

    assert not result.success and result.error.code == "FRAMEWORK_MISSING"


async def test_packaged_sandbox_resources_exist():
    from mechanic.resources import resource_path

    for name in ("sandbox_runner.lua", "sandbox_test_framework.lua", "lua_dumper.lua"):
        assert resource_path(name).is_file(), name
