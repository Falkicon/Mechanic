"""
Development tools for WoW addon development.
Migrated from ADDON_DEV/Tools to first-class AFD commands.
"""

import asyncio
import json
import re
import shutil
import subprocess
from pathlib import Path
from typing import Any, Dict, List, Optional, Tuple

from afd import CommandResult, error, success
from afd.core.metadata import WarningSeverity, create_source, create_warning
from pydantic import BaseModel, Field

from ..config import find_addon_path
from ..resources import resource_path
from ._common import addon_not_found, is_under_libs


# ═══════════════════════════════════════════════════════════════════════════════
# SCHEMAS
# ═══════════════════════════════════════════════════════════════════════════════


class AddonInput(BaseModel):
    addon: str = Field(..., description="Name of the addon to operate on")
    path: Optional[str] = Field(None, description="Override path to addon folder")


class ValidationResult(BaseModel):
    addon: str
    valid: bool
    interface_version: Optional[str] = None
    version: Optional[str] = None
    file_count: int = 0
    errors: List[str] = []
    warnings: List[str] = []
    info: List[str] = []


# ═══════════════════════════════════════════════════════════════════════════════
# CONSTANTS
# ═══════════════════════════════════════════════════════════════════════════════

# Retail interface numbers are six digits (WWXXYY) from 11.0 on. Classic and
# "forever" clients use five-digit numbers; those Mechanic does not recognise
# are accepted with a warning instead of being rejected.
MIN_RETAIL_INTERFACE = 110000
KNOWN_CLASSIC_INTERFACES = frozenset(
    {"11507", "11508", "20505", "30403", "40402", "50503", "50504"}
)

# Required and recommended metadata fields
REQUIRED_FIELDS = ["Title", "Version"]
RECOMMENDED_FIELDS = ["Notes", "Author"]

EXCERPT_LIMIT = 600


def _excerpt(*texts: str, limit: int = EXCERPT_LIMIT) -> str:
    joined = "\n".join(t.strip() for t in texts if t and t.strip())
    return joined if len(joined) <= limit else joined[:limit] + "..."


def parse_toc_file(toc_path: Path) -> Dict[str, Any]:
    """Parse a .toc file and extract metadata and file list."""
    content = toc_path.read_text(encoding="utf-8", errors="replace")
    lines = content.splitlines()

    metadata = {}
    files = []
    interface_versions = []
    in_debug_block = False

    for line in lines:
        trimmed = line.strip()

        # Debug block tracking
        if trimmed.startswith("#@debug@"):
            in_debug_block = True
            continue
        elif trimmed.startswith("#@end-debug@"):
            in_debug_block = False
            continue

        # Interface version
        match = re.match(r"^##\s*Interface:\s*(.+)", trimmed)
        if match:
            versions = [v.strip() for v in match.group(1).split(",") if v.strip()]
            interface_versions.extend(versions)
            continue

        # Other metadata
        match = re.match(r"^##\s*(\w+):\s*(.+)", trimmed)
        if match:
            metadata[match.group(1)] = match.group(2).strip()
            continue

        # File reference (non-comment, non-empty); drop [AllowLoad ...] suffixes
        if not trimmed.startswith("#") and trimmed:
            path = re.sub(r"\s+\[[^\]]*\]\s*$", "", trimmed)
            files.append({"path": path, "in_debug": in_debug_block})

    return {
        "metadata": metadata,
        "files": files,
        "interface_versions": interface_versions,
    }


def check_interface_versions(versions: List[str]) -> Tuple[List[str], List[str]]:
    """Return (errors, warnings) for the values of a TOC ``## Interface`` line."""
    if not versions:
        return ["Missing ## Interface directive"], []

    errors: List[str] = []
    warnings: List[str] = []
    accepted = 0
    for version in versions:
        if not re.fullmatch(r"\d{5,6}", version):
            errors.append(
                f"Invalid Interface value '{version}': use the numeric build, e.g. 120001"
            )
        elif len(version) == 6:
            if int(version) >= MIN_RETAIL_INTERFACE:
                accepted += 1
        else:
            accepted += 1
            if version not in KNOWN_CLASSIC_INTERFACES:
                warnings.append(
                    f"Interface {version} is a classic-style value Mechanic does not recognise"
                )
    if not errors and not accepted:
        errors.append(
            f"Interface version outdated: {', '.join(versions)}. "
            f"Should include a retail version >= {MIN_RETAIL_INTERFACE}"
        )
    return errors, warnings


def validate_toc(addon_path: Path, addon_name: str) -> ValidationResult:
    """Validate a single addon's .toc file."""
    result = ValidationResult(addon=addon_name, valid=True)

    # Find .toc file
    toc_files = list(addon_path.glob("*.toc"))
    if not toc_files:
        result.errors.append("No .toc file found")
        result.valid = False
        return result

    # Prefer .toc matching addon name
    main_toc = next((toc for toc in toc_files if toc.stem == addon_name), toc_files[0])

    parsed = parse_toc_file(main_toc)
    metadata = parsed["metadata"]
    files = parsed["files"]
    interface_versions = parsed["interface_versions"]

    result.file_count = len(files)

    # Check 1: Interface version
    interface_errors, interface_warnings = check_interface_versions(interface_versions)
    if interface_errors:
        result.errors.extend(interface_errors)
        result.valid = False
    else:
        result.interface_version = ", ".join(interface_versions)
        result.info.append(f"Interface: {result.interface_version}")
    result.warnings.extend(interface_warnings)

    # Check 2: Required metadata
    for field in REQUIRED_FIELDS:
        if field not in metadata:
            result.errors.append(f"Missing required field: ## {field}")
            result.valid = False

    for field in RECOMMENDED_FIELDS:
        if field not in metadata:
            result.warnings.append(f"Missing recommended field: ## {field}")

    if "Version" in metadata:
        result.version = metadata["Version"]
        result.info.append(f"Version: {result.version}")

    # Check 3: SavedVariables naming
    if "SavedVariables" in metadata:
        sv_name = metadata["SavedVariables"]
        normalized = addon_name.lstrip("_!")
        if not sv_name.startswith(addon_name) and not sv_name.startswith(normalized):
            result.warnings.append(
                f"SavedVariables '{sv_name}' doesn't match addon name '{addon_name}'"
            )

    # Check 4: File existence (TOC paths use backslashes)
    missing_files = [
        file_info["path"]
        for file_info in files
        if not (addon_path / file_info["path"].replace("\\", "/")).exists()
    ]

    if missing_files:
        result.errors.append(f"Missing files: {', '.join(missing_files)}")
        result.valid = False
    else:
        result.info.append(f"All {len(files)} files exist")

    # Check 5: Locale files
    locales_path = addon_path / "Locales"
    if locales_path.exists():
        enus_path = locales_path / "enUS.lua"
        if not enus_path.exists():
            result.warnings.append(
                "Locales folder exists but enUS.lua (baseline) is missing"
            )
        else:
            has_enus_in_toc = any(
                "Locales" in f["path"] and "enUS" in f["path"] for f in files
            )
            if not has_enus_in_toc:
                result.warnings.append(
                    "enUS.lua exists but is not referenced in the .toc file"
                )

    return result


# ═══════════════════════════════════════════════════════════════════════════════
# TOOL OUTPUT PARSERS
# ═══════════════════════════════════════════════════════════════════════════════

_LUACHECK_LINE = re.compile(r"^(.+?):(\d+):(\d+):\s*\(([EW]\d+)\)\s*(.+)$")


def parse_luacheck_output(stdout: str) -> List[Dict[str, Any]]:
    issues = []
    for line in stdout.splitlines():
        match = _LUACHECK_LINE.match(line)
        if match:
            issues.append(
                {
                    "file": match.group(1),
                    "line": int(match.group(2)),
                    "column": int(match.group(3)),
                    "code": match.group(4),
                    "message": match.group(5),
                }
            )
    return issues


def parse_stylua_diffs(output: str) -> List[str]:
    """File paths from StyLua ``Diff in <path>:`` headers (paths may contain spaces)."""
    files = []
    for line in output.splitlines():
        match = re.match(r"^Diff in (.+?):\d*:?\s*$", line)
        if match and match.group(1) not in files:
            files.append(match.group(1))
    return files


def _stylua_errors(output: str) -> List[str]:
    return [line for line in output.splitlines() if line.startswith("error")]


def parse_busted_json(stdout: str) -> Optional[dict]:
    """Decode busted's JSON report even when other text precedes it."""
    start = stdout.find("{")
    if start < 0:
        return None
    try:
        data, _ = json.JSONDecoder().raw_decode(stdout[start:])
    except ValueError:
        return None
    return data if isinstance(data, dict) else None


def _busted_name(entry: Any) -> str:
    if not isinstance(entry, dict):
        return "Unknown"
    element = entry.get("element")
    element_name = element.get("name") if isinstance(element, dict) else None
    return str(entry.get("name") or element_name or "Unknown")


# ═══════════════════════════════════════════════════════════════════════════════
# DEPRECATION DATABASE
# ═══════════════════════════════════════════════════════════════════════════════

DEPRECATED_DB_NAME = "deprecated_apis.json"
_SEVERITY_LEVELS = {"info": 0, "warning": 1, "error": 2}


def load_deprecated_apis() -> Tuple[Dict[str, Dict[str, str]], str, Optional[str]]:
    """Load the bundled deprecation database.

    Returns ``(apis, version, note)``. ``version`` is ``"fallback"`` and ``note``
    explains why when the bundled file is missing or unreadable and a minimal
    built-in set is used instead.
    """
    db_path = resource_path(DEPRECATED_DB_NAME)
    try:
        data = json.loads(db_path.read_text(encoding="utf-8"))
        apis = {}
        for entry in data.get("apis", []):
            apis[entry["old"]] = {
                "new": entry["new"],
                "severity": entry.get("severity", "warning"),
                "category": entry.get("category", "general"),
                "since": entry.get("since", ""),
                "notes": entry.get("notes", ""),
            }
        if apis:
            note = None
            if data.get("complete") is False:
                note = (
                    "The bundled deprecation list is a partial seed; regenerate it with "
                    "`python -m mechanic.deprecations_builder <wow-ui-source>`"
                )
            return apis, str(data.get("version", "unknown")), note
        reason = "it lists no APIs"
    except (OSError, ValueError, KeyError, TypeError, AttributeError) as exc:
        reason = f"it could not be read ({exc})"

    fallback = {
        old: {
            "new": new,
            "severity": "warning",
            "category": "addons",
            "since": "11.0.0",
            "notes": "",
        }
        for old, new in (
            ("GetAddOnInfo", "C_AddOns.GetAddOnInfo"),
            ("IsAddOnLoaded", "C_AddOns.IsAddOnLoaded"),
            ("LoadAddOn", "C_AddOns.LoadAddOn"),
        )
    }
    return (
        fallback,
        "fallback",
        f"Using a minimal built-in list of {len(fallback)} APIs because {DEPRECATED_DB_NAME} {reason}",
    )


def compile_deprecation_pattern(names: List[str]) -> Optional["re.Pattern[str]"]:
    """One regex matching a call to any deprecated name (not ``C_X.Name(`` forms)."""
    if not names:
        return None
    alternation = "|".join(re.escape(n) for n in sorted(names, key=len, reverse=True))
    return re.compile(rf"(?<![A-Za-z0-9_.:])({alternation})\s*\(")


def scan_lua_text(text: str, pattern: "re.Pattern[str]") -> List[Tuple[int, str]]:
    """Return ``(line_number, deprecated_name)`` for each deprecated call."""
    hits = []
    for line_num, line in enumerate(text.splitlines(), 1):
        if line.strip().startswith("--"):
            continue
        if "@scan-ignore:" in line or "@scan-ignore " in line:
            continue
        for match in pattern.finditer(line):
            hits.append((line_num, match.group(1)))
    return hits


def scan_addon_deprecations(
    addon_path: Path,
    apis: Dict[str, Dict[str, str]],
    category: Optional[str],
    min_severity: str,
) -> Tuple[List[dict], int]:
    """Scan non-library Lua files (blocking). Returns ``(issues, files_scanned)``."""
    min_level = _SEVERITY_LEVELS.get(min_severity, 1)
    active = {
        name: info
        for name, info in apis.items()
        if (not category or info.get("category") == category)
        and _SEVERITY_LEVELS.get(info.get("severity", "warning"), 1) >= min_level
    }
    pattern = compile_deprecation_pattern(list(active))
    lua_files = [
        f for f in sorted(addon_path.rglob("*.lua")) if not is_under_libs(f, addon_path)
    ]
    issues: List[dict] = []
    if pattern is None:
        return issues, len(lua_files)

    for lua_file in lua_files:
        try:
            text = lua_file.read_text(encoding="utf-8", errors="replace")
        except OSError:
            continue
        for line_num, old_api in scan_lua_text(text, pattern):
            info = active[old_api]
            issues.append(
                {
                    "file": str(lua_file.relative_to(addon_path)),
                    "line": line_num,
                    "old_api": old_api,
                    "new_api": info["new"],
                    "severity": info.get("severity", "warning"),
                    "category": info.get("category", "general"),
                    "since": info.get("since", ""),
                    "notes": info.get("notes", ""),
                }
            )
    return issues, len(lua_files)


def _snapshot(files: List[Path]) -> Dict[Path, Tuple[int, int]]:
    snap = {}
    for f in files:
        try:
            stat = f.stat()
        except OSError:
            continue
        snap[f] = (stat.st_mtime_ns, stat.st_size)
    return snap


# ═══════════════════════════════════════════════════════════════════════════════
# COMMAND REGISTRATION (called from core.py)
# ═══════════════════════════════════════════════════════════════════════════════


def register_commands(server):
    """Register all development commands with the AFD server."""

    @server.command(
        name="addon.validate",
        description="Validate a WoW addon's .toc file for common issues",
        input_schema=AddonInput,
        output_schema=ValidationResult,
    )
    async def validate_addon(
        input: AddonInput, context: Any = None
    ) -> CommandResult[ValidationResult]:
        addon_path = find_addon_path(input.addon, input.path)

        if not addon_path:
            return addon_not_found(
                input.addon,
                "Check the addon name or provide an explicit path with the 'path' parameter",
            )

        result = await asyncio.to_thread(validate_toc, addon_path, input.addon)

        src = create_source(
            type="file",
            id=f"toc-{input.addon}",
            title=f"{input.addon}.toc",
            location=str(addon_path),
        )

        warnings = [
            create_warning(
                code="TOC_WARNING", message=warn_msg, severity=WarningSeverity.INFO
            )
            for warn_msg in result.warnings
        ]

        if result.valid:
            reasoning = f"Validated {input.addon}: {result.file_count} files, interface {result.interface_version or 'unknown'}"
        else:
            reasoning = (
                f"Validation failed for {input.addon}: {len(result.errors)} error(s)"
            )
        return success(
            data=result,
            reasoning=reasoning,
            sources=[src],
            warnings=warnings or None,
            confidence=1.0,
        )

    # ═══════════════════════════════════════════════════════════════════════════
    # addon.lint - Run Luacheck on addon
    # ═══════════════════════════════════════════════════════════════════════════

    class LintInput(BaseModel):
        addon: str = Field(..., description="Name of the addon to lint")
        path: Optional[str] = Field(None, description="Override path to addon folder")

    class LintIssue(BaseModel):
        file: str
        line: int
        column: int
        code: str
        message: str

    class LintResult(BaseModel):
        addon: str
        passed: bool
        error_count: int = 0
        warning_count: int = 0
        issues: List[LintIssue] = []

    @server.command(
        name="addon.lint",
        description="Run Luacheck linter on a WoW addon",
        input_schema=LintInput,
        output_schema=LintResult,
    )
    async def lint_addon(
        input: LintInput, context: Any = None
    ) -> CommandResult[LintResult]:
        addon_path = find_addon_path(input.addon, input.path)
        if not addon_path:
            return addon_not_found(input.addon)

        from ..setup import find_tool

        luacheck_path = find_tool("luacheck")
        if not luacheck_path:
            return error(
                code="TOOL_NOT_FOUND",
                message="Luacheck is not installed",
                suggestion="Run 'mech setup' to install required tools",
            )

        # cwd is the addon so Luacheck discovers the addon's own .luacheckrc
        try:
            result = await asyncio.to_thread(
                subprocess.run,
                [
                    str(luacheck_path),
                    ".",
                    "--formatter",
                    "plain",
                    "--codes",
                    "--no-color",
                ],
                capture_output=True,
                text=True,
                encoding="utf-8",
                errors="replace",
                timeout=60,
                cwd=str(addon_path),
            )
        except subprocess.TimeoutExpired:
            return error(
                code="TIMEOUT",
                message="Luacheck timed out after 60 seconds",
                suggestion="Try linting fewer files or check for infinite loops",
            )
        except OSError as exc:
            return error(
                code="TOOL_FAILED",
                message=f"Luacheck could not be started: {exc}",
                suggestion="Run 'mech setup' to reinstall required tools",
            )

        parsed = parse_luacheck_output(result.stdout)
        # Luacheck exits 1 for warnings and 2 for code errors; 3+ (or 2 without
        # a parsable report) means it could not check the addon at all.
        if result.returncode >= 3 or (result.returncode == 2 and not parsed):
            return error(
                code="LINT_FAILED",
                message=f"Luacheck failed (exit {result.returncode}): "
                + _excerpt(result.stdout, result.stderr),
                suggestion="Fix the .luacheckrc or file error reported above and retry",
            )

        issues = [LintIssue(**item) for item in parsed]
        error_count = sum(1 for i in issues if i.code.startswith("E"))
        warning_count = len(issues) - error_count

        src = create_source(
            type="tool",
            id="luacheck",
            title="Luacheck Linter",
            location=str(addon_path),
        )

        return success(
            data=LintResult(
                addon=input.addon,
                passed=error_count == 0,
                error_count=error_count,
                warning_count=warning_count,
                issues=issues[:50],
            ),
            reasoning=f"Linted {input.addon}: {error_count} errors, {warning_count} warnings",
            sources=[src],
            confidence=1.0,
        )

    # ═══════════════════════════════════════════════════════════════════════════
    # addon.format - Run StyLua on addon
    # ═══════════════════════════════════════════════════════════════════════════

    class FormatInput(BaseModel):
        addon: str = Field(..., description="Name of the addon to format")
        path: Optional[str] = Field(None, description="Override path to addon folder")
        check: bool = Field(
            False, description="Only check formatting, don't modify files"
        )

    class FormatResult(BaseModel):
        addon: str
        formatted: bool
        files_checked: int = 0
        files_changed: int = 0
        unformatted_files: List[str] = []

    @server.command(
        name="addon.format",
        description="Run StyLua formatter on a WoW addon",
        input_schema=FormatInput,
        output_schema=FormatResult,
    )
    async def format_addon(
        input: FormatInput, context: Any = None
    ) -> CommandResult[FormatResult]:
        addon_path = find_addon_path(input.addon, input.path)
        if not addon_path:
            return addon_not_found(input.addon)

        from ..setup import find_tool

        stylua_path = find_tool("stylua")
        if not stylua_path:
            return error(
                code="TOOL_NOT_FOUND",
                message="StyLua is not installed",
                suggestion="Run 'mech setup' to install required tools",
            )

        cmd = [str(stylua_path)]
        if input.check:
            cmd.append("--check")
        cmd.append(".")

        lua_files = await asyncio.to_thread(lambda: sorted(addon_path.rglob("*.lua")))
        before = await asyncio.to_thread(_snapshot, lua_files)
        try:
            result = await asyncio.to_thread(
                subprocess.run,
                cmd,
                capture_output=True,
                text=True,
                encoding="utf-8",
                errors="replace",
                timeout=60,
                cwd=str(addon_path),
            )
        except subprocess.TimeoutExpired:
            return error(
                code="TIMEOUT",
                message="StyLua timed out after 60 seconds",
                suggestion="Try formatting fewer files",
            )
        except OSError as exc:
            return error(
                code="TOOL_FAILED",
                message=f"StyLua could not be started: {exc}",
                suggestion="Run 'mech setup' to reinstall required tools",
            )

        combined = result.stdout + "\n" + result.stderr
        problems = _stylua_errors(combined)
        if result.returncode not in (0, 1) or problems:
            return error(
                code="FORMAT_FAILED",
                message=f"StyLua failed (exit {result.returncode}): "
                + _excerpt("\n".join(problems) or combined),
                suggestion="Fix the syntax error or stylua.toml problem reported above and retry",
            )

        if input.check:
            unformatted = parse_stylua_diffs(combined)
            files_changed = len(unformatted)
        else:
            after = await asyncio.to_thread(_snapshot, lua_files)
            unformatted = []
            files_changed = sum(1 for f, sig in after.items() if before.get(f) != sig)

        src = create_source(
            type="tool", id="stylua", title="StyLua Formatter", location=str(addon_path)
        )

        return success(
            data=FormatResult(
                addon=input.addon,
                formatted=result.returncode == 0,
                files_checked=len(lua_files),
                files_changed=files_changed,
                unformatted_files=unformatted,
            ),
            reasoning=f"{'Checked' if input.check else 'Formatted'} {len(lua_files)} Lua files in {input.addon}",
            sources=[src],
            confidence=1.0,
        )

    # ═══════════════════════════════════════════════════════════════════════════
    # addon.test - Run Busted tests on addon
    # ═══════════════════════════════════════════════════════════════════════════

    class TestInput(BaseModel):
        addon: str = Field(..., description="Name of the addon to test")
        path: Optional[str] = Field(None, description="Override path to addon folder")
        coverage: bool = Field(False, description="Generate code coverage report")

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
        error: Optional[str] = Field(
            None, description="Runner output when busted failed without a usable report"
        )

    @server.command(
        name="addon.test",
        description="Run Busted unit tests on a WoW addon",
        input_schema=TestInput,
        output_schema=TestResult,
    )
    async def test_addon(
        input: TestInput, context: Any = None
    ) -> CommandResult[TestResult]:
        addon_path = find_addon_path(input.addon, input.path)
        if not addon_path:
            return addon_not_found(input.addon)

        spec_files = await asyncio.to_thread(
            lambda: [
                f
                for f in addon_path.rglob("*_spec.lua")
                if not is_under_libs(f, addon_path)
            ]
        )
        if not spec_files:
            return success(
                data=TestResult(addon=input.addon, passed=True, total=0),
                reasoning=f"No test files (*_spec.lua) found in {input.addon}",
                confidence=1.0,
            )

        # Prefer the system busted for reliability
        busted_path = shutil.which("busted")
        if not busted_path:
            from ..setup import find_tool

            busted_path = find_tool("busted")

        cmd = [str(busted_path) if busted_path else "busted", "--output", "json"]
        if input.coverage:
            cmd.append("--coverage")

        # With a .busted config, pass no path so its ROOT directive is respected
        if not (addon_path / ".busted").exists():
            candidates = [
                addon_path / name for name in ("Tests", "tests", "spec", "test")
            ]
            test_path = next((p for p in candidates if p.is_dir()), addon_path)
            cmd.append(str(test_path))

        try:
            result = await asyncio.to_thread(
                subprocess.run,
                cmd,
                capture_output=True,
                text=True,
                encoding="utf-8",
                errors="replace",
                timeout=120,
                cwd=str(addon_path),
            )
        except FileNotFoundError:
            return error(
                code="TOOL_NOT_FOUND",
                message="Busted is not installed or not in PATH",
                suggestion="Install Busted: `luarocks install busted` OR place busted.exe/bat in desktop/bin/",
            )
        except subprocess.TimeoutExpired:
            return error(
                code="TIMEOUT",
                message="Tests timed out after 120 seconds",
                suggestion="Check for infinite loops or reduce test scope",
            )
        except OSError as exc:
            return error(
                code="TOOL_FAILED",
                message=f"Busted could not be started: {exc}",
                suggestion="Reinstall Busted or check its path",
            )

        report = parse_busted_json(result.stdout)
        tests: List[TestCase] = []
        passed_count = failed_count = 0
        runner_error: Optional[str] = None

        if report is None:
            if result.returncode != 0:
                runner_error = _excerpt(result.stderr, result.stdout) or (
                    f"busted exited with code {result.returncode}"
                )
            else:
                passed_count = len(spec_files)
        else:
            for entry in report.get("failures", []) + report.get("errors", []):
                message = entry.get("message") if isinstance(entry, dict) else None
                tests.append(
                    TestCase(
                        name=_busted_name(entry),
                        passed=False,
                        error=str(message) if message else "",
                    )
                )
                failed_count += 1
            for entry in report.get("successes", []):
                duration = entry.get("duration", 0) if isinstance(entry, dict) else 0
                tests.append(
                    TestCase(
                        name=_busted_name(entry),
                        passed=True,
                        duration=duration if isinstance(duration, (int, float)) else 0,
                    )
                )
                passed_count += 1
            if result.returncode != 0 and failed_count == 0:
                runner_error = _excerpt(result.stderr, result.stdout) or (
                    f"busted exited with code {result.returncode}"
                )

        if runner_error is not None:
            tests.insert(
                0,
                TestCase(name="busted (run failed)", passed=False, error=runner_error),
            )
            failed_count += 1

        total = passed_count + failed_count
        src = create_source(
            type="tool",
            id="busted",
            title="Busted Test Runner",
            location=str(addon_path),
        )

        # Failures come first so the 20-entry cap never hides them
        ordered = [t for t in tests if not t.passed] + [t for t in tests if t.passed]
        return success(
            data=TestResult(
                addon=input.addon,
                passed=failed_count == 0,
                total=total,
                passed_count=passed_count,
                failed_count=failed_count,
                tests=ordered[:20],
                error=runner_error,
            ),
            reasoning=f"Ran {total} tests for {input.addon}: {passed_count} passed, {failed_count} failed",
            sources=[src],
            confidence=1.0,
        )

    # ═══════════════════════════════════════════════════════════════════════════
    # addon.deprecations - Scan for deprecated APIs
    # ═══════════════════════════════════════════════════════════════════════════

    class DeprecationInput(BaseModel):
        addon: str = Field(..., description="Name of the addon to scan")
        path: Optional[str] = Field(None, description="Override path to addon folder")
        category: Optional[str] = Field(
            None, description="Filter by category (e.g., spells, items, containers)"
        )
        min_severity: str = Field(
            "warning", description="Minimum severity: info, warning, or error"
        )

    class DeprecationIssue(BaseModel):
        file: str
        line: int
        old_api: str
        new_api: str
        severity: str = "warning"
        category: str = "general"
        since: str = ""
        notes: str = ""

    class DeprecationResult(BaseModel):
        addon: str
        clean: bool
        issue_count: int = 0
        issues: List[DeprecationIssue] = []
        by_category: Dict[str, int] = {}
        by_severity: Dict[str, int] = {}
        database_version: str = ""

    @server.command(
        name="addon.deprecations",
        description="Scan a WoW addon's Lua files for deprecated API calls",
        input_schema=DeprecationInput,
        output_schema=DeprecationResult,
    )
    async def scan_deprecations(
        input: DeprecationInput, context: Any = None
    ) -> CommandResult[DeprecationResult]:
        addon_path = find_addon_path(input.addon, input.path)
        if not addon_path:
            return addon_not_found(input.addon)

        apis, db_version, db_note = load_deprecated_apis()
        found, files_scanned = await asyncio.to_thread(
            scan_addon_deprecations,
            addon_path,
            apis,
            input.category,
            input.min_severity,
        )

        by_category: Dict[str, int] = {}
        by_severity: Dict[str, int] = {}
        for item in found:
            by_category[item["category"]] = by_category.get(item["category"], 0) + 1
            by_severity[item["severity"]] = by_severity.get(item["severity"], 0) + 1
        issues = [DeprecationIssue(**item) for item in found]
        clean = not issues

        src = create_source(
            type="scan",
            id="deprecation-scanner",
            title="Deprecation Scanner",
            location=str(addon_path),
        )

        if clean:
            reasoning = f"No deprecated APIs found in {input.addon} ({files_scanned} files, {len(apis)} APIs checked)"
        else:
            parts = [
                f"{count} {cat}"
                for cat, count in sorted(by_category.items(), key=lambda x: -x[1])[:3]
            ]
            reasoning = f"Found {len(issues)} deprecated API calls in {input.addon}: {', '.join(parts)}"
            if by_severity.get("error", 0) > 0:
                reasoning += f" ({by_severity['error']} critical)"

        warnings = None
        if db_note:
            warnings = [
                create_warning(
                    code="DEPRECATION_DB_LIMITED",
                    message=db_note,
                    severity=WarningSeverity.WARNING,
                )
            ]
        return success(
            data=DeprecationResult(
                addon=input.addon,
                clean=clean,
                issue_count=len(issues),
                issues=issues[:100],
                by_category=by_category,
                by_severity=by_severity,
                database_version=db_version,
            ),
            reasoning=reasoning,
            sources=[src],
            warnings=warnings,
            confidence=0.6 if db_version == "fallback" else 0.95,
        )
