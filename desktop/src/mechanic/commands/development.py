"""
Development tools for WoW addon development.
Migrated from ADDON_DEV/Tools to first-class AFD commands.
"""

from afd import CommandResult, success, error
from afd.core.metadata import create_source, create_warning, WarningSeverity
from pathlib import Path
from pydantic import BaseModel, Field
from typing import Dict, Any, List, Optional
import re

# Use centralized config
from ..config import find_addon_path


# ═══════════════════════════════════════════════════════════════════════════════
# SCHEMAS
# ═══════════════════════════════════════════════════════════════════════════════


class AddonInput(BaseModel):
    addon: str = Field(..., description="Name of the addon to operate on")
    path: Optional[str] = Field(None, description="Override path to addon folder")


class ValidationIssue(BaseModel):
    level: str = Field(..., description="ERROR, WARNING, or INFO")
    message: str


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

# Current valid interface versions for WoW 12.0 (Midnight)
VALID_INTERFACE_VERSIONS = ["120001", "120000", "110105", "110100"]

# Required and recommended metadata fields
REQUIRED_FIELDS = ["Title", "Version"]
RECOMMENDED_FIELDS = ["Notes", "Author"]


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
            versions = [v.strip() for v in match.group(1).split(",")]
            interface_versions.extend(versions)
            continue

        # Other metadata
        match = re.match(r"^##\s*(\w+):\s*(.+)", trimmed)
        if match:
            metadata[match.group(1)] = match.group(2).strip()
            continue

        # File reference (non-comment, non-empty)
        if not trimmed.startswith("#") and trimmed:
            files.append({"path": trimmed, "in_debug": in_debug_block})

    return {
        "metadata": metadata,
        "files": files,
        "interface_versions": interface_versions,
    }


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
    main_toc = None
    for toc in toc_files:
        if toc.stem == addon_name:
            main_toc = toc
            break
    if not main_toc:
        main_toc = toc_files[0]

    # Parse TOC
    parsed = parse_toc_file(main_toc)
    metadata = parsed["metadata"]
    files = parsed["files"]
    interface_versions = parsed["interface_versions"]

    result.file_count = len(files)

    # Check 1: Interface version
    if not interface_versions:
        result.errors.append("Missing ## Interface directive")
        result.valid = False
    else:
        has_valid = any(v in VALID_INTERFACE_VERSIONS for v in interface_versions)
        if not has_valid:
            result.errors.append(
                f"Interface version outdated: {', '.join(interface_versions)}. Should include 120001 or 120000"
            )
            result.valid = False
        else:
            result.interface_version = ", ".join(interface_versions)
            result.info.append(f"Interface: {result.interface_version}")

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

    # Check 4: File existence
    missing_files = []
    for file_info in files:
        file_path = addon_path / file_info["path"]
        if not file_path.exists():
            missing_files.append(file_info["path"])

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
            return error(
                code="ADDON_NOT_FOUND",
                message=f"Addon '{input.addon}' not found in development directories",
                suggestion="Check the addon name or provide an explicit path with the 'path' parameter",
            )

        result = validate_toc(addon_path, input.addon)

        # Build sources
        src = create_source(
            type="file",
            id=f"toc-{input.addon}",
            title=f"{input.addon}.toc",
            location=str(addon_path),
        )

        # Build warnings from validation
        warnings = []
        for warn_msg in result.warnings:
            warnings.append(
                create_warning(
                    code="TOC_WARNING", message=warn_msg, severity=WarningSeverity.INFO
                )
            )

        if result.valid:
            return success(
                data=result,
                reasoning=f"Validated {input.addon}: {result.file_count} files, interface {result.interface_version or 'unknown'}",
                sources=[src],
                warnings=warnings if warnings else None,
                confidence=1.0,
            )
        else:
            return success(
                data=result,
                reasoning=f"Validation failed for {input.addon}: {len(result.errors)} error(s)",
                sources=[src],
                warnings=warnings if warnings else None,
                confidence=1.0,
            )

    # ═══════════════════════════════════════════════════════════════════════════
    # addon.lint - Run Luacheck on addon
    # ═══════════════════════════════════════════════════════════════════════════

    class LintInput(BaseModel):
        addon: str = Field(..., description="Name of the addon to lint")
        path: Optional[str] = Field(None, description="Override path to addon folder")
        fix: bool = Field(False, description="Not applicable for Luacheck (read-only)")

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
        import subprocess

        addon_path = find_addon_path(input.addon, input.path)
        if not addon_path:
            return error(
                code="ADDON_NOT_FOUND",
                message=f"Addon '{input.addon}' not found",
                suggestion="Check the addon name or provide an explicit path",
            )

        # Find luacheck tool (check bin/ first, then PATH)
        from ..setup import find_tool

        luacheck_path = find_tool("luacheck")
        if not luacheck_path:
            return error(
                code="TOOL_NOT_FOUND",
                message="Luacheck is not installed",
                suggestion="Run 'mech setup' to install required tools",
            )

        # Run luacheck
        try:
            result = subprocess.run(
                [
                    str(luacheck_path),
                    str(addon_path),
                    "--formatter",
                    "plain",
                    "--codes",
                    "--no-color",
                ],
                capture_output=True,
                text=True,
                timeout=60,
            )
        except subprocess.TimeoutExpired:
            return error(
                code="TIMEOUT",
                message="Luacheck timed out after 60 seconds",
                suggestion="Try linting fewer files or check for infinite loops",
            )

        # Parse output
        issues = []
        error_count = 0
        warning_count = 0

        for line in result.stdout.splitlines():
            # Format: file.lua:10:5: (W113) ...
            match = re.match(r"^(.+?):(\d+):(\d+):\s*\(([EW]\d+)\)\s*(.+)$", line)
            if match:
                issue = LintIssue(
                    file=match.group(1),
                    line=int(match.group(2)),
                    column=int(match.group(3)),
                    code=match.group(4),
                    message=match.group(5),
                )
                issues.append(issue)
                if issue.code.startswith("E"):
                    error_count += 1
                else:
                    warning_count += 1

        passed = error_count == 0

        src = create_source(
            type="tool",
            id="luacheck",
            title="Luacheck Linter",
            location=str(addon_path),
        )

        return success(
            data=LintResult(
                addon=input.addon,
                passed=passed,
                error_count=error_count,
                warning_count=warning_count,
                issues=issues[:50],  # Limit to 50 issues
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
        import subprocess

        addon_path = find_addon_path(input.addon, input.path)
        if not addon_path:
            return error(
                code="ADDON_NOT_FOUND",
                message=f"Addon '{input.addon}' not found",
                suggestion="Check the addon name or provide an explicit path",
            )

        # Find stylua tool (check bin/ first, then PATH)
        from ..setup import find_tool

        stylua_path = find_tool("stylua")
        if not stylua_path:
            return error(
                code="TOOL_NOT_FOUND",
                message="StyLua is not installed",
                suggestion="Run 'mech setup' to install required tools",
            )

        # Build command
        cmd = [str(stylua_path)]
        if input.check:
            cmd.append("--check")
        cmd.append(str(addon_path))

        try:
            result = subprocess.run(cmd, capture_output=True, text=True, timeout=60)
        except subprocess.TimeoutExpired:
            return error(
                code="TIMEOUT",
                message="StyLua timed out after 60 seconds",
                suggestion="Try formatting fewer files",
            )

        # Count Lua files
        lua_files = list(addon_path.rglob("*.lua"))
        files_checked = len(lua_files)

        # Parse check output for unformatted files
        unformatted = []
        if input.check:
            for line in result.stdout.splitlines() + result.stderr.splitlines():
                if "Diff" in line or "would be" in line:
                    # Extract filename
                    match = re.search(r"(\S+\.lua)", line)
                    if match:
                        unformatted.append(match.group(1))

        formatted = result.returncode == 0

        src = create_source(
            type="tool", id="stylua", title="StyLua Formatter", location=str(addon_path)
        )

        return success(
            data=FormatResult(
                addon=input.addon,
                formatted=formatted,
                files_checked=files_checked,
                files_changed=len(unformatted) if input.check else 0,
                unformatted_files=unformatted,
            ),
            reasoning=f"{'Checked' if input.check else 'Formatted'} {files_checked} Lua files in {input.addon}",
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

    @server.command(
        name="addon.test",
        description="Run Busted unit tests on a WoW addon",
        input_schema=TestInput,
        output_schema=TestResult,
    )
    async def test_addon(
        input: TestInput, context: Any = None
    ) -> CommandResult[TestResult]:
        import subprocess

        addon_path = find_addon_path(input.addon, input.path)
        if not addon_path:
            return error(
                code="ADDON_NOT_FOUND",
                message=f"Addon '{input.addon}' not found",
                suggestion="Check the addon name or provide an explicit path",
            )

        # Check for spec files
        spec_files = list(addon_path.rglob("*_spec.lua"))
        if not spec_files:
            return success(
                data=TestResult(addon=input.addon, passed=True, total=0),
                reasoning=f"No test files (*_spec.lua) found in {input.addon}",
                confidence=1.0,
            )

        # Find busted tool (prefer system busted for reliability)
        import shutil

        busted_path = shutil.which("busted")  # Always use system busted if available
        if not busted_path:
            from ..setup import find_tool

            busted_path = find_tool("busted")

        # Build command
        cmd = [str(busted_path) if busted_path else "busted", "--output", "json"]
        if input.coverage:
            cmd.extend(["--coverage"])

        # Check for .busted config file - if present, don't pass path (respects config ROOT)
        busted_config = addon_path / ".busted"
        if busted_config.exists():
            # .busted config found - run without path argument to respect ROOT directive
            test_path = None
        else:
            # No .busted config - look for common test directories
            test_candidates = [
                addon_path / "Tests",
                addon_path / "tests",
                addon_path / "spec",
                addon_path / "test",
            ]
            test_path = next(
                (p for p in test_candidates if p.exists() and p.is_dir()), addon_path
            )

        # Only append path if we determined one (not using .busted config)
        if test_path:
            cmd.append(str(test_path))


        try:
            result = subprocess.run(
                cmd, capture_output=True, text=True, timeout=120, cwd=str(addon_path)
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

        # Parse JSON output
        import json as json_module

        tests = []
        passed_count = 0
        failed_count = 0

        try:
            # Busted JSON output
            output = (
                json_module.loads(result.stdout)
                if result.stdout.strip().startswith("{")
                else {}
            )
            for test in output.get("successes", []):
                tests.append(
                    TestCase(
                        name=test.get("name", "Unknown"),
                        passed=True,
                        duration=test.get("duration", 0),
                    )
                )
                passed_count += 1
            for test in output.get("failures", []):
                tests.append(
                    TestCase(
                        name=test.get("name", "Unknown"),
                        passed=False,
                        error=test.get("message", ""),
                    )
                )
                failed_count += 1
        except Exception:
            # Fallback: count based on exit code
            passed_count = 0 if result.returncode != 0 else len(spec_files)

        total = passed_count + failed_count
        overall_passed = failed_count == 0

        src = create_source(
            type="tool",
            id="busted",
            title="Busted Test Runner",
            location=str(addon_path),
        )

        return success(
            data=TestResult(
                addon=input.addon,
                passed=overall_passed,
                total=total,
                passed_count=passed_count,
                failed_count=failed_count,
                tests=tests[:20],  # Limit to 20 tests
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
        fix: bool = Field(False, description="Attempt to auto-fix deprecated calls")
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

    def load_deprecated_apis() -> tuple[Dict, str]:
        """Load deprecated APIs from JSON database."""
        import json

        # Try to load from data directory
        data_dir = Path(__file__).parent.parent.parent.parent / "data"
        db_path = data_dir / "deprecated_apis.json"

        if db_path.exists():
            try:
                with open(db_path, encoding="utf-8") as f:
                    data = json.load(f)
                    apis = {}
                    for entry in data.get("apis", []):
                        apis[entry["old"]] = {
                            "new": entry["new"],
                            "severity": entry.get("severity", "warning"),
                            "category": entry.get("category", "general"),
                            "since": entry.get("since", ""),
                            "notes": entry.get("notes", ""),
                        }
                    return apis, data.get("version", "unknown")
            except Exception:
                pass

        # Fallback to hardcoded minimal set
        return {
            "GetAddOnInfo": {
                "new": "C_AddOns.GetAddOnInfo",
                "severity": "warning",
                "category": "addons",
                "since": "11.0.0",
                "notes": "",
            },
            "IsAddOnLoaded": {
                "new": "C_AddOns.IsAddOnLoaded",
                "severity": "warning",
                "category": "addons",
                "since": "11.0.0",
                "notes": "",
            },
            "LoadAddOn": {
                "new": "C_AddOns.LoadAddOn",
                "severity": "warning",
                "category": "addons",
                "since": "11.0.0",
                "notes": "",
            },
        }, "fallback"

    @server.command(
        name="addon.deprecations",
        description="Scan a WoW addon for deprecated API calls (100+ APIs, 11.0-12.0)",
        input_schema=DeprecationInput,
        output_schema=DeprecationResult,
    )
    async def scan_deprecations(
        input: DeprecationInput, context: Any = None
    ) -> CommandResult[DeprecationResult]:
        addon_path = find_addon_path(input.addon, input.path)
        if not addon_path:
            return error(
                code="ADDON_NOT_FOUND",
                message=f"Addon '{input.addon}' not found",
                suggestion="Check the addon name or provide an explicit path",
            )

        # Load API database
        DEPRECATED_APIS, db_version = load_deprecated_apis()

        # Filter by severity
        severity_levels = {"info": 0, "warning": 1, "error": 2}
        min_level = severity_levels.get(input.min_severity, 1)

        issues = []
        by_category: Dict[str, int] = {}
        by_severity: Dict[str, int] = {}

        lua_files = list(addon_path.rglob("*.lua"))

        # Skip Libs folder
        lua_files = [
            f for f in lua_files if "Libs" not in f.parts and "libs" not in f.parts
        ]

        for lua_file in lua_files:
            try:
                content = lua_file.read_text(encoding="utf-8", errors="replace")
                lines = content.splitlines()

                for line_num, line in enumerate(lines, 1):
                    # Skip comments
                    if line.strip().startswith("--"):
                        continue

                    for old_api, info in DEPRECATED_APIS.items():
                        # Filter by category if specified
                        if input.category and info.get("category") != input.category:
                            continue

                        # Filter by severity
                        api_severity = info.get("severity", "warning")
                        if severity_levels.get(api_severity, 1) < min_level:
                            continue

                        # Check for API call (word boundary + parenthesis)
                        if old_api in line:
                            pattern = rf"\b{re.escape(old_api)}\s*\("
                            if re.search(pattern, line):
                                cat = info.get("category", "general")
                                sev = info.get("severity", "warning")

                                issues.append(
                                    DeprecationIssue(
                                        file=str(lua_file.relative_to(addon_path)),
                                        line=line_num,
                                        old_api=old_api,
                                        new_api=info["new"],
                                        severity=sev,
                                        category=cat,
                                        since=info.get("since", ""),
                                        notes=info.get("notes", ""),
                                    )
                                )

                                by_category[cat] = by_category.get(cat, 0) + 1
                                by_severity[sev] = by_severity.get(sev, 0) + 1

            except Exception:
                continue  # Skip unreadable files

        clean = len(issues) == 0

        src = create_source(
            type="scan",
            id="deprecation-scanner",
            title="Deprecation Scanner",
            location=str(addon_path),
        )

        # Build reasoning with category breakdown
        if clean:
            reasoning = f"No deprecated APIs found in {input.addon} ({len(lua_files)} files, {len(DEPRECATED_APIS)} APIs checked)"
        else:
            parts = [
                f"{count} {cat}"
                for cat, count in sorted(by_category.items(), key=lambda x: -x[1])[:3]
            ]
            reasoning = f"Found {len(issues)} deprecated API calls in {input.addon}: {', '.join(parts)}"
            if by_severity.get("error", 0) > 0:
                reasoning += f" ({by_severity['error']} critical)"

        return success(
            data=DeprecationResult(
                addon=input.addon,
                clean=clean,
                issue_count=len(issues),
                issues=issues[:100],  # Limit to 100 issues
                by_category=by_category,
                by_severity=by_severity,
                database_version=db_version,
            ),
            reasoning=reasoning,
            sources=[src],
            confidence=0.95,
        )
