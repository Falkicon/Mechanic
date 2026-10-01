"""
Lua Sandbox Commands for Mechanic Desktop.

Provides offline testing of addon logic:
- sandbox.generate: Generate WoW API stubs from APIDefs
- sandbox.status: Report on the generated stubs
- sandbox.exec: Execute Lua code in a restricted environment with the stubs
- sandbox.test: Run an addon's *_spec.lua files with the packaged test framework

All Lua that these commands run (stubs, addon files, specs and user code)
executes through ``resources/sandbox_runner.lua`` against a whitelist of safe
globals: ``os``, ``io``, ``package``, ``debug``, ``require``, ``dofile``,
``loadfile``, ``load``, ``getfenv``/``setfenv`` and ``string.dump`` are not
reachable, and ``loadstring`` refuses precompiled bytecode.  The runner caps
printed output and the host enforces a wall-clock timeout; memory use is not
limited.
"""

import asyncio
import re
import secrets
import subprocess
import tempfile
import time
from datetime import datetime
from pathlib import Path
from typing import Any, Dict, List, Optional, Tuple

from afd import CommandResult, success, error
from afd.core.metadata import create_source
from pydantic import BaseModel, Field

from ..config import get_config, find_addon_path
from ..lua_strings import quote_lua_string
from ..pipeline_paths import find_lua_exe, find_repo_root, get_apidefs_dir
from ..resources import resource_path
from .api import parse_lua_table_simple

EXEC_TIMEOUT_SECONDS = 30
TEST_TIMEOUT_SECONDS = 60
MAX_SANDBOX_OUTPUT = 256 * 1024  # enforced inside the runner (print) ...
MAX_CAPTURED_BYTES = 1024 * 1024  # ... and again on the captured streams
MAX_LISTED_TESTS = 200
MAX_LISTED_PASSES = 50

# Names the runner's environment already provides; stubs must not replace them.
RESERVED_GLOBALS = frozenset(
    """
assert error ipairs next pairs pcall rawequal rawget rawset select setmetatable
tonumber tostring type unpack xpcall math string table coroutine print getmetatable
collectgarbage loadstring require describe it before_each after_each before_all
after_all setup teardown
""".split()
)

_NAMESPACE_RE = re.compile(r"^[A-Za-z_][A-Za-z0-9_]*$")
_API_KEY_RE = re.compile(r"^[A-Za-z_][A-Za-z0-9_]*(?:\.[A-Za-z_][A-Za-z0-9_]*)?$")
_SECTION_RE = re.compile(r"^-- @@ns (\S+)\n(.*?)^-- @@end\n", re.MULTILINE | re.DOTALL)
GLOBAL_SECTION = "_GLOBAL"


# ═══════════════════════════════════════════════════════════════════════════════
# SCHEMAS
# ═══════════════════════════════════════════════════════════════════════════════


class GenerateInput(BaseModel):
    namespace: Optional[str] = Field(
        None,
        description=(
            "Specific namespace to regenerate in place (e.g., 'C_Spell'); the "
            "other namespaces in an existing stubs file are kept. If not "
            "provided, generates all."
        ),
    )
    force: bool = Field(
        False,
        description="Regenerate all stubs even if they are newer than the APIDefs",
    )


class GenerateResult(BaseModel):
    stubs_generated: int
    namespaces_processed: List[str]
    output_path: str
    protected_count: int
    normal_count: int


class StatusInput(BaseModel):
    pass  # No input needed


class StatusResult(BaseModel):
    stubs_exist: bool
    stubs_path: Optional[str] = None
    stubs_generated: int = 0
    protected_count: int = 0
    normal_count: int = 0
    last_modified: Optional[str] = None


class ExecInput(BaseModel):
    code: str = Field(..., description="Lua code to execute")
    addon: Optional[str] = Field(
        None,
        description="Name of addon to load before execution (looks in _dev_ folder)",
    )
    load_stubs: bool = Field(True, description="Whether to load WoW API stubs")


class ExecResult(BaseModel):
    result: Optional[str] = None
    output: str = ""
    error: Optional[str] = None
    exit_code: int = 0


class TestInput(BaseModel):
    addon: str = Field(..., description="Name of addon to test (looks in _dev_ folder)")
    filter: Optional[str] = Field(
        None,
        description="Only run tests whose full name contains this text (case-insensitive)",
    )


class TestCase(BaseModel):
    name: str
    passed: bool
    duration: float = 0.0
    error: Optional[str] = None


class TestResult(BaseModel):
    addon: str
    passed: bool
    total: int = 0
    passed_count: int = 0
    failed_count: int = 0
    tests: List[TestCase] = []
    # Enhanced metadata
    source_files: List[str] = []  # Core/*.lua files loaded
    spec_files: List[str] = []  # *_spec.lua files run
    duration_ms: float = 0.0  # Total execution time


# ═══════════════════════════════════════════════════════════════════════════════
# PATHS
# ═══════════════════════════════════════════════════════════════════════════════


def find_mechanic_addon_path() -> Optional[Path]:
    """Find the Mechanic repository root (the folder holding Mechanic/Mechanic.toc)."""
    return find_repo_root()


def find_dev_addon_path(addon_name: str) -> Optional[Path]:
    """Find an addon in the _dev_ folder."""
    # Use centralized addon discovery from config
    return find_addon_path(addon_name)


def find_sandbox_folder() -> Path:
    """Folder for generated sandbox files (``<repo>/sandbox``, else the data dir)."""
    root = find_repo_root()
    if root:
        return root / "sandbox"
    return get_config().data_dir / "sandbox"


def _stubs_path() -> Path:
    return find_sandbox_folder() / "generated" / "wow_stubs.lua"


# ═══════════════════════════════════════════════════════════════════════════════
# STUB GENERATION
# ═══════════════════════════════════════════════════════════════════════════════


def parse_apidef_file(filepath: Path) -> List[Dict[str, Any]]:
    """
    Parse a single APIDefs Lua file and extract API definitions.

    Returns a list of API definitions with:
    - key: Full API path (e.g., "C_Spell.GetSpellInfo")
    - funcPath: Same as key
    - params / returns: lists of {name, type, ...}
    - midnightImpact: "NORMAL", "RESTRICTED", "CONDITIONAL", "HIGH"
    - protected: bool
    """
    content = filepath.read_text(encoding="utf-8", errors="replace")
    apis = []
    for key, entry in parse_lua_table_simple(content).items():
        apis.append(
            {
                "key": key,
                "funcPath": key,
                "params": entry.get("params", []),
                "returns": entry.get("returns", []),
                "midnightImpact": entry.get("midnightImpact", "NORMAL"),
                "protected": bool(entry.get("protected", False)),
            }
        )
    return apis


def _is_protected(api: Dict[str, Any]) -> bool:
    return bool(api.get("protected")) or api.get("midnightImpact") == "RESTRICTED"


def _stub_namespace(key: str) -> str:
    return key.split(".")[0] if "." in key else GLOBAL_SECTION


def _stub_is_usable(key: str) -> bool:
    """Only plain ``Name`` / ``Namespace.Name`` identifiers that do not shadow runner globals."""
    if not _API_KEY_RE.match(key):
        return False
    if "." not in key:
        return key not in RESERVED_GLOBALS
    return key.split(".")[0] not in RESERVED_GLOBALS


def generate_stub_code(api: Dict[str, Any]) -> str:
    """Generate Lua stub code for a single API."""
    key = api["key"]
    returns = api.get("returns", [])

    if _is_protected(api):
        message = quote_lua_string(
            f"{key} is protected/restricted - cannot be called in sandbox"
        )
        return f"function {key}(...)\n    error({message}, 2)\nend"

    if len(returns) == 0:
        return_val = ""
    elif len(returns) == 1:
        return_val = "return nil  -- mock"
    else:
        return_val = f"return {', '.join(['nil'] * len(returns))}  -- mock"

    return f"function {key}(...)\n    {return_val}\nend"


def _render_section(namespace: str, apis: List[Dict[str, Any]]) -> str:
    lines = [f"-- @@ns {namespace}"]
    if namespace != GLOBAL_SECTION:
        lines.append(f"{namespace} = {namespace} or {{}}")
    for api in sorted(apis, key=lambda item: item["key"]):
        lines.append(generate_stub_code(api))
        lines.append("")
    lines.append("-- @@end")
    return "\n".join(lines) + "\n"


def _group_sections(apis: List[Dict[str, Any]]) -> Tuple[Dict[str, str], int]:
    """Render one section per namespace; returns (sections, skipped_api_count)."""
    grouped: Dict[str, List[Dict[str, Any]]] = {}
    skipped = 0
    for api in apis:
        if not _stub_is_usable(api["key"]):
            skipped += 1
            continue
        grouped.setdefault(_stub_namespace(api["key"]), []).append(api)
    return {ns: _render_section(ns, items) for ns, items in grouped.items()}, skipped


def _render_stubs_file(sections: Dict[str, str]) -> str:
    header = [
        "-- WoW API Stubs for Sandbox Testing",
        "-- Auto-generated from Mechanic/UI/APIDefs",
        f"-- Generated: {datetime.now().isoformat()}",
        '-- Sections are delimited by "-- @@ns <name>" / "-- @@end" so a single',
        "-- namespace can be regenerated in place.",
        "",
    ]
    body = "".join(sections[ns] + "\n" for ns in sorted(sections))
    return "\n".join(header) + body


def _read_sections(text: str) -> Dict[str, str]:
    return {
        match.group(1): match.group(0).rstrip("\n") + "\n"
        for match in _SECTION_RE.finditer(text)
    }


def _count_stubs(text: str) -> Tuple[int, int, int]:
    """(total, protected, normal) function stubs in a stubs file."""
    total = len(re.findall(r"^function [A-Za-z_]", text, re.MULTILINE))
    protected = len(re.findall(r'error\("[^"]+is protected/restricted', text))
    return total, protected, total - protected


def generate_stubs_file(
    apis: List[Dict[str, Any]], output_path: Path
) -> Dict[str, int]:
    """Generate the complete wow_stubs.lua file."""
    sections, skipped = _group_sections(apis)
    output_path.parent.mkdir(parents=True, exist_ok=True)
    output_path.write_text(_render_stubs_file(sections), encoding="utf-8", newline="\n")
    total, protected, normal = _count_stubs(output_path.read_text(encoding="utf-8"))
    return {"protected": protected, "normal": normal, "skipped": skipped}


def _apidefs_files(apidefs_path: Path, namespace: Optional[str]) -> List[Path]:
    if namespace:
        candidate = apidefs_path / f"{namespace}.lua"
        return [candidate] if candidate.is_file() else []
    return sorted(apidefs_path.glob("*.lua"))


def _generate_sync(
    apidefs_path: Path, namespace: Optional[str], force: bool
) -> Tuple[str, Dict[str, Any]]:
    """Returns ("error", {code,message,suggestion}) or ("ok", result fields)."""
    lua_files = _apidefs_files(apidefs_path, namespace)
    if not lua_files:
        return "error", {
            "code": "NO_APIDEFS",
            "message": (
                f"No APIDefs file found for namespace '{namespace}'"
                if namespace
                else "No APIDefs files found"
            ),
            "suggestion": "Check that APIDefs/*.lua files exist",
        }

    output_path = _stubs_path()
    existing_text = (
        output_path.read_text(encoding="utf-8", errors="replace")
        if output_path.exists()
        else ""
    )
    existing_sections = _read_sections(existing_text)

    if namespace and not existing_sections:
        return "error", {
            "code": "STUBS_NOT_GENERATED",
            "message": (
                "Cannot regenerate one namespace: no sectioned stubs file exists"
                if not existing_text
                else "Existing stubs file predates sectioned stubs"
            ),
            "suggestion": "Run sandbox.generate without a namespace first",
        }

    if not namespace and not force and existing_sections:
        newest_source = max(path.stat().st_mtime for path in lua_files)
        if output_path.stat().st_mtime >= newest_source:
            total, protected, normal = _count_stubs(existing_text)
            return "ok", {
                "stubs_generated": total,
                "namespaces_processed": sorted(existing_sections),
                "output_path": str(output_path),
                "protected_count": protected,
                "normal_count": normal,
                "up_to_date": True,
                "skipped": 0,
            }

    apis: List[Dict[str, Any]] = []
    for lua_file in lua_files:
        apis.extend(parse_apidef_file(lua_file))

    new_sections, skipped = _group_sections(apis)
    if namespace:
        sections = dict(existing_sections)
        wanted = GLOBAL_SECTION if namespace == "Global" else namespace
        sections.pop(wanted, None)
        sections.update(new_sections)
    else:
        sections = new_sections

    output_path.parent.mkdir(parents=True, exist_ok=True)
    text = _render_stubs_file(sections)
    output_path.write_text(text, encoding="utf-8", newline="\n")
    total, protected, normal = _count_stubs(text)
    return "ok", {
        "stubs_generated": total,
        "namespaces_processed": sorted(new_sections),
        "output_path": str(output_path),
        "protected_count": protected,
        "normal_count": normal,
        "up_to_date": False,
        "skipped": skipped,
    }


# ═══════════════════════════════════════════════════════════════════════════════
# RUNNER
# ═══════════════════════════════════════════════════════════════════════════════


def _lua_config(values: Dict[str, Any]) -> str:
    """Serialise the runner config as a Lua chunk that returns a table."""

    def encode(value: Any) -> str:
        if isinstance(value, bool):
            return "true" if value else "false"
        if isinstance(value, (int, float)):
            return repr(value)
        if isinstance(value, str):
            return quote_lua_string(value)
        if isinstance(value, (list, tuple)):
            return "{" + ", ".join(encode(item) for item in value) + "}"
        if isinstance(value, dict):
            return (
                "{"
                + ", ".join(
                    f"[{quote_lua_string(str(k))}] = {encode(v)}"
                    for k, v in value.items()
                )
                + "}"
            )
        raise TypeError(f"Cannot encode {type(value).__name__} for the Lua runner")

    return "return " + encode(values) + "\n"


def _truncate(text: str, limit: int = MAX_CAPTURED_BYTES) -> str:
    if len(text) <= limit:
        return text
    return text[:limit] + "\n[output truncated]"


def _run_runner(
    lua_path: Path,
    config: Dict[str, Any],
    user_code: Optional[str],
    timeout: int,
    cwd: Optional[Path] = None,
) -> "subprocess.CompletedProcess[str]":
    """Run sandbox_runner.lua with a config written to a temp dir.

    Raises subprocess.TimeoutExpired or OSError; callers turn them into errors.
    """
    runner = resource_path("sandbox_runner.lua")
    with tempfile.TemporaryDirectory(prefix="mechanic-sandbox-") as tmp:
        tmp_dir = Path(tmp)
        values = dict(config)
        values["max_output"] = MAX_SANDBOX_OUTPUT
        if user_code is not None:
            code_file = tmp_dir / "user.lua"
            code_file.write_text(user_code, encoding="utf-8", newline="\n")
            values["code_file"] = str(code_file)
        config_file = tmp_dir / "config.lua"
        config_file.write_text(_lua_config(values), encoding="utf-8", newline="\n")

        result = subprocess.run(
            [str(lua_path), str(runner), str(config_file)],
            capture_output=True,
            text=True,
            encoding="utf-8",
            errors="replace",
            timeout=timeout,
            cwd=str(cwd or tmp_dir),
        )
    result.stdout = _truncate(result.stdout or "")
    result.stderr = _truncate(result.stderr or "")
    return result


def _lua_missing() -> CommandResult[Any]:
    return error(
        code="LUA_NOT_FOUND",
        message="Lua executable not found in bin/ folder, MECHANIC_LUA, or PATH",
        suggestion="Run 'mech setup', set MECHANIC_LUA, or place lua.exe in desktop/bin/",
    )


# ═══════════════════════════════════════════════════════════════════════════════
# COMMANDS
# ═══════════════════════════════════════════════════════════════════════════════


def register_commands(server):
    """Register sandbox commands with the server."""

    @server.command(
        name="sandbox.generate",
        description=(
            "Generate WoW API stubs from APIDefs for sandbox testing. A namespace "
            "is regenerated in place; existing stubs are kept unless force is set "
            "or the APIDefs are newer."
        ),
        input_schema=GenerateInput,
        output_schema=GenerateResult,
    )
    async def sandbox_generate(
        input: GenerateInput, context: Any = None
    ) -> CommandResult[GenerateResult]:
        if input.namespace and not (_NAMESPACE_RE.match(input.namespace)):
            return error(
                code="INVALID_NAMESPACE",
                message=f"Invalid namespace name: {input.namespace!r}",
                suggestion="Use a namespace such as C_Spell",
            )

        apidefs_path = get_apidefs_dir()
        if apidefs_path is None:
            return error(
                code="MECHANIC_NOT_FOUND",
                message="Could not find the Mechanic repository (Mechanic/Mechanic.toc)",
                suggestion="Run from the Mechanic repository or set dev_path",
            )
        if not apidefs_path.exists():
            return error(
                code="APIDEFS_NOT_FOUND",
                message=f"APIDefs folder not found at {apidefs_path}",
                suggestion="Run api.refresh to generate Mechanic/UI/APIDefs",
            )

        try:
            status, payload = await asyncio.to_thread(
                _generate_sync, apidefs_path, input.namespace, input.force
            )
        except OSError as exc:
            return error(
                code="WRITE_FAILED",
                message=f"Could not write sandbox stubs: {exc}",
                suggestion="Check that the sandbox folder is writable",
            )
        if status == "error":
            return error(**payload)

        src = create_source(
            type="file",
            id="apidefs",
            title="APIDefs Database",
            location=str(apidefs_path),
        )
        if payload["up_to_date"]:
            reasoning = (
                f"Stubs are up to date ({payload['stubs_generated']} APIs); "
                "use force to regenerate."
            )
        else:
            reasoning = (
                f"Generated {payload['stubs_generated']} API stubs for "
                f"{len(payload['namespaces_processed'])} namespaces. "
                f"{payload['protected_count']} protected (will error), "
                f"{payload['normal_count']} normal (mocked)."
            )
            if payload["skipped"]:
                reasoning += (
                    f" Skipped {payload['skipped']} entries with unusable names."
                )

        return success(
            data=GenerateResult(
                stubs_generated=payload["stubs_generated"],
                namespaces_processed=payload["namespaces_processed"],
                output_path=payload["output_path"],
                protected_count=payload["protected_count"],
                normal_count=payload["normal_count"],
            ),
            reasoning=reasoning,
            sources=[src],
            confidence=1.0,
        )

    @server.command(
        name="sandbox.status",
        description="Get status of generated WoW API stubs",
        input_schema=StatusInput,
        output_schema=StatusResult,
    )
    async def sandbox_status(
        input: StatusInput, context: Any = None
    ) -> CommandResult[StatusResult]:
        stubs_path = _stubs_path()

        if not stubs_path.exists():
            return success(
                data=StatusResult(stubs_exist=False),
                reasoning="No stubs generated yet. Run sandbox.generate first.",
            )

        last_modified = datetime.fromtimestamp(stubs_path.stat().st_mtime).isoformat()
        content = stubs_path.read_text(encoding="utf-8", errors="replace")
        total_count, protected_count, normal_count = _count_stubs(content)

        return success(
            data=StatusResult(
                stubs_exist=True,
                stubs_path=str(stubs_path),
                stubs_generated=total_count,
                protected_count=protected_count,
                normal_count=normal_count,
                last_modified=last_modified,
            ),
            reasoning=f"Stubs ready: {total_count} APIs ({protected_count} protected, {normal_count} normal)",
        )

    @server.command(
        name="sandbox.exec",
        description=(
            "Execute Lua code in a restricted sandbox with WoW API stubs. User code "
            "sees only whitelisted globals (no os, io, package, debug, require, "
            "dofile, loadfile, string.dump or bytecode loading); runs for at most "
            f"{EXEC_TIMEOUT_SECONDS}s and prints at most {MAX_SANDBOX_OUTPUT // 1024} KB."
        ),
        input_schema=ExecInput,
        output_schema=ExecResult,
    )
    async def sandbox_exec(
        input: ExecInput, context: Any = None
    ) -> CommandResult[ExecResult]:
        lua_path = find_lua_exe()
        if not lua_path:
            return _lua_missing()

        stubs_path = _stubs_path()
        config: Dict[str, Any] = {"mode": "exec", "marker": secrets.token_hex(8)}
        if input.load_stubs and stubs_path.exists():
            config["stubs"] = str(stubs_path)

        if input.addon:
            addon_path = find_dev_addon_path(input.addon)
            if not addon_path:
                return error(
                    code="ADDON_NOT_FOUND",
                    message=f"Addon '{input.addon}' not found in _dev_ folder",
                    suggestion="Check addon name or path",
                )
            core_path = addon_path / "Core"
            if core_path.exists():
                config["sources"] = [
                    str(lua_file)
                    for lua_file in sorted(core_path.rglob("*.lua"))
                    if not lua_file.name.endswith("_spec.lua")
                ]

        try:
            result = await asyncio.to_thread(
                _run_runner, lua_path, config, input.code, EXEC_TIMEOUT_SECONDS
            )
        except subprocess.TimeoutExpired:
            return error(
                code="TIMEOUT",
                message=f"Lua execution timed out after {EXEC_TIMEOUT_SECONDS} seconds",
            )
        except OSError as exc:
            return error(
                code="LUA_FAILED",
                message=f"Could not run Lua: {exc}",
                suggestion="Check the Lua executable and temp folder permissions",
            )

        marker = config["marker"] + "RESULT:"
        result_value = None
        other_output = []
        for line in result.stdout.splitlines():
            if line.startswith(marker):
                result_value = line[len(marker) :]
            else:
                other_output.append(line)

        return success(
            data=ExecResult(
                result=result_value,
                output="\n".join(other_output),
                error=result.stderr.strip() or None,
                exit_code=result.returncode,
            ),
            reasoning=f"Executed Lua code. Exit code: {result.returncode}",
        )

    @server.command(
        name="sandbox.test",
        description=(
            "Run an addon's *_spec.lua tests (Core/ and Tests/) in the restricted "
            "sandbox with WoW API stubs and the bundled busted-style framework. "
            "filter limits tests by name; failures are listed first."
        ),
        input_schema=TestInput,
        output_schema=TestResult,
    )
    async def sandbox_test(
        input: TestInput, context: Any = None
    ) -> CommandResult[TestResult]:
        addon_path = find_dev_addon_path(input.addon)
        if not addon_path:
            return error(
                code="ADDON_NOT_FOUND",
                message=f"Addon '{input.addon}' not found in _dev_ folder",
                suggestion="Check addon name or path",
            )

        # Spec files come from Core/*_spec.lua and Tests/**/*_spec.lua.
        core_path = addon_path / "Core"
        tests_path = addon_path / "Tests"

        spec_files: List[Path] = []
        source_files: List[Path] = []

        if core_path.exists():
            spec_files.extend(core_path.rglob("*_spec.lua"))
            # Only top-level Core/*.lua are loaded: subdirectories have
            # cross-dependencies that need addon.test with the full TOC.
            all_lua = [
                f for f in core_path.glob("*.lua") if not f.name.endswith("_spec.lua")
            ]

            def load_order_key(path):
                # init.lua first, then alphabetically
                return (0 if path.name == "init.lua" else 1, str(path))

            source_files = sorted(all_lua, key=load_order_key)

        if tests_path.exists():
            spec_files.extend(tests_path.rglob("*_spec.lua"))

        spec_files = sorted(set(spec_files), key=lambda path: path.as_posix())

        if not spec_files:
            if not core_path.exists() and not tests_path.exists():
                return error(
                    code="NO_TEST_FOLDERS",
                    message=f"No Core/ or Tests/ folder found in {input.addon}",
                    suggestion="Create Tests/Core/*_spec.lua for sandbox tests",
                )
            return success(
                data=TestResult(addon=input.addon, passed=True, total=0),
                reasoning=f"No test files (*_spec.lua) found in {input.addon}/Core or {input.addon}/Tests",
            )

        lua_path = find_lua_exe()
        if not lua_path:
            return _lua_missing()

        framework_path = resource_path("sandbox_test_framework.lua")
        if not framework_path.exists():
            return error(
                code="FRAMEWORK_MISSING",
                message="The packaged sandbox test framework is missing",
                suggestion="Reinstall mechanic-desktop",
            )

        stubs_path = _stubs_path()
        config: Dict[str, Any] = {
            "mode": "test",
            "framework": str(framework_path),
            "sources": [str(path) for path in source_files],
            "specs": [
                {
                    "path": str(path),
                    "name": path.relative_to(addon_path).as_posix(),
                }
                for path in spec_files
            ],
            "require_root": addon_path.as_posix(),
        }
        if stubs_path.exists():
            config["stubs"] = str(stubs_path)
        if input.filter:
            config["filter"] = input.filter

        start_time = time.perf_counter()
        try:
            result = await asyncio.to_thread(
                _run_runner,
                lua_path,
                config,
                None,
                TEST_TIMEOUT_SECONDS,
                addon_path,
            )
        except subprocess.TimeoutExpired:
            return error(
                code="TIMEOUT",
                message=f"Tests timed out after {TEST_TIMEOUT_SECONDS} seconds",
            )
        except OSError as exc:
            return error(
                code="LUA_FAILED",
                message=f"Could not run Lua: {exc}",
                suggestion="Check the Lua executable and temp folder permissions",
            )
        duration_ms = (time.perf_counter() - start_time) * 1000

        stderr_text = result.stderr.strip()
        if result.returncode != 0:
            return error(
                code="LUA_FAILED",
                message=f"Lua exited with code {result.returncode}"
                + (f": {stderr_text[:2000]}" if stderr_text else ""),
                suggestion="Fix the error above; it occurred while loading stubs or addon files",
            )

        failures: List[TestCase] = []
        passes: List[TestCase] = []
        summary = None
        for line in result.stdout.splitlines():
            if line.startswith("SANDBOX_TESTS:"):
                parts = line.split(":")
                try:
                    summary = (int(parts[1]), int(parts[2]), int(parts[3]))
                except (IndexError, ValueError):
                    summary = None
            elif line.startswith("PASS: "):
                passes.append(TestCase(name=line[6:], passed=True))
            elif line.startswith("FAIL: "):
                name, _, detail = line[6:].partition(" | ")
                failures.append(TestCase(name=name, passed=False, error=detail or None))

        if summary is None:
            return error(
                code="NO_TEST_SUMMARY",
                message="The sandbox produced no test summary"
                + (f": {stderr_text[:2000]}" if stderr_text else ""),
                suggestion="Check that the specs use describe/it from the sandbox framework",
            )

        passed_count, failed_count, total = summary
        overall_passed = failed_count == 0 and total > 0
        listed = (failures + passes[:MAX_LISTED_PASSES])[:MAX_LISTED_TESTS]

        src = create_source(
            type="tool",
            id="sandbox-test",
            title="Sandbox Test Runner",
            location=str(addon_path),
        )

        reasoning = (
            f"Ran {total} sandbox tests for {input.addon}: "
            f"{passed_count} passed, {failed_count} failed"
        )
        if input.filter and total == 0:
            reasoning += f" (no tests matched filter '{input.filter}')"
        if not stubs_path.exists():
            reasoning += "\nWoW API stubs not generated (run sandbox.generate)"
        if stderr_text:
            reasoning += f"\nStderr: {stderr_text[:200]}"

        return success(
            data=TestResult(
                addon=input.addon,
                passed=overall_passed,
                total=total,
                passed_count=passed_count,
                failed_count=failed_count,
                tests=listed,
                source_files=[f.name for f in source_files],
                spec_files=[f.relative_to(addon_path).as_posix() for f in spec_files],
                duration_ms=round(duration_ms, 1),
            ),
            reasoning=reasoning,
            sources=[src],
            confidence=1.0,
        )
