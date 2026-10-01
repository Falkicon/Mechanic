"""
Addon Output command - returns all addon data for agent consumption (AFD).

Philosophy:
- No flags: Just return everything (tokens are cheap, complexity isn't)
- Markdown format: AI-friendly, human-readable
- Read from the selected SavedVariables profile; parse each file revision once
"""

import asyncio
import re
from datetime import datetime
from pathlib import Path
from typing import Any, Dict, List, Optional, Tuple

from afd import CommandResult, success
from afd.core.metadata import WarningSeverity, create_source, create_warning
from pydantic import BaseModel, Field

from ..parsers import parse_savedvariables
from ..sv_cache import parse_sv_file
from ..targets import DiagnosticTarget, SelectedTarget, TargetError, select_target


# ═══════════════════════════════════════════════════════════════════════════════
# SCHEMAS
# ═══════════════════════════════════════════════════════════════════════════════


class AddonOutputInput(BaseModel):
    """Input for addon output command."""

    target: Optional[DiagnosticTarget] = None
    agent_mode: bool = Field(
        default=False, description="Enable smart compression for AI agents"
    )


class AddonOutputResult(BaseModel):
    """Formatted addon output for agent consumption."""

    target: Optional[SelectedTarget] = None
    output: str = Field(..., description="Formatted markdown output")
    error_count: int = Field(default=0, description="Number of errors")
    test_count: int = Field(default=0, description="Number of test results")
    console_count: int = Field(default=0, description="Number of console entries")
    api_test_count: int = Field(default=0, description="Number of API test results")
    lua_eval_count: int = Field(default=0, description="Number of Lua eval results")
    timestamp: Optional[str] = Field(None, description="Last reload timestamp")
    # Raw data for dashboard rendering
    errors: List[Dict[str, Any]] = Field(
        default_factory=list, description="Raw error objects"
    )
    tests: List[Dict[str, Any]] = Field(
        default_factory=list, description="Raw test objects"
    )
    console: List[Dict[str, Any]] = Field(
        default_factory=list, description="Raw console entries"
    )
    libraries: List[Dict[str, Any]] = Field(
        default_factory=list, description="Loaded library versions"
    )
    perf: Dict[str, Any] = Field(
        default_factory=dict, description="Consolidated addon performance metrics"
    )
    api_tests: Dict[str, Any] = Field(
        default_factory=dict, description="API Test Bench results"
    )
    lua_eval: Dict[str, Any] = Field(
        default_factory=dict, description="Lua eval queue results"
    )


# ═══════════════════════════════════════════════════════════════════════════════
# BUGGRABBER PARSER
# ═══════════════════════════════════════════════════════════════════════════════


def _safe_int(value: Any, default: int = 1, minimum: int = 1) -> int:
    """Coerce untrusted SavedVariables text to a bounded int."""
    if isinstance(value, bool):
        return default
    if isinstance(value, int):
        number = value
    elif isinstance(value, float) and value == value and abs(value) != float("inf"):
        number = int(value)
    elif isinstance(value, str) and re.fullmatch(r"\s*-?\d{1,9}\s*", value):
        number = int(value)
    else:
        return default
    return number if number >= minimum else default


def parse_buggrabber(content: str, current_session_only: bool = True) -> dict:
    """Parse BugGrabber SavedVariables file.

    Args:
        current_session_only: If True, only return errors from the current session

    Returns:
        {
            "errors": [error dict, ...],
            "session": int,
            "parse_error": str | None,   # set when the file could not be parsed
        }
    """
    try:
        variables = parse_savedvariables(content)
    except Exception as exc:
        return {"errors": [], "session": 0, "parse_error": str(exc) or "parse failed"}

    db = variables.get("BugGrabberDB", {})
    if not isinstance(db, dict):
        return {
            "errors": [],
            "session": 0,
            "parse_error": "BugGrabberDB is not a table",
        }
    current_session = db.get("session", 0)

    errors = []
    raw_errors = db.get("errors", [])

    # Handle both list and dict formats
    if isinstance(raw_errors, dict):
        raw_errors = list(raw_errors.values())
    if not isinstance(raw_errors, list):
        raw_errors = []

    for err in raw_errors:
        if not isinstance(err, dict):
            continue

        # Filter to current session only
        if current_session_only and err.get("session", 0) != current_session:
            continue

        message = str(err.get("message", ""))

        # Extract addon/file/line from message
        # Patterns to try:
        # 1. "Interface/AddOns/AddonName/..." format
        # 2. "...AddonName/File.lua:123:" fallback
        addon = "Unknown"
        file = "Unknown"
        line = 0

        full_match = re.search(
            r"Interface[/\\]AddOns[/\\]([^/\\]+)[/\\](.+\.lua):(\d+):", message
        )
        if full_match:
            addon = full_match.group(1)
            file = full_match.group(2)
            line = int(full_match.group(3))
        else:
            fallback_match = re.search(r"([^/\\]+)[/\\]([^/\\]+\.lua):(\d+):", message)
            if fallback_match:
                addon = fallback_match.group(1)
                file = fallback_match.group(2)
                line = int(fallback_match.group(3))

        errors.append(
            {
                "message": message,
                "stack": str(err.get("stack", "")),
                "time": str(err.get("time", "")),
                "counter": _safe_int(err.get("counter", 1)),
                "addon": addon,
                "file": file,
                "line": line,
            }
        )

    return {"errors": errors, "session": current_session, "parse_error": None}


# ═══════════════════════════════════════════════════════════════════════════════
# MECHANICDB PARSERS
# ═══════════════════════════════════════════════════════════════════════════════


def _as_list(value: Any) -> list:
    """Lua arrays parse as lists or as index-keyed dicts."""
    if isinstance(value, dict):
        return list(value.values())
    return value if isinstance(value, list) else []


def _hub(addon_data: dict) -> Dict[str, dict]:
    hub = addon_data.get("addonData", {})
    if not isinstance(hub, dict):
        return {}
    return {name: data for name, data in hub.items() if isinstance(data, dict)}


def parse_console_from_mechanic_db(addon_data: dict) -> list:
    """Extract console buffer entries from MechanicDB profile data."""
    entries = []
    for entry in _as_list(addon_data.get("consoleBuffer", [])):
        if isinstance(entry, dict):
            entries.append(
                {
                    "source": entry.get("source", ""),
                    "category": entry.get("category", ""),
                    "message": entry.get("message", ""),
                    "time": entry.get("time", 0),
                }
            )
    return entries


def parse_libraries_from_mechanic_db(addon_data: dict) -> list:
    """Extract loaded library versions from MechanicDB profile data."""
    result = []
    for lib in _as_list(addon_data.get("loadedLibraries", [])):
        if isinstance(lib, dict):
            result.append(
                {
                    "name": lib.get("name", "Unknown"),
                    "version": lib.get("version", "?"),
                }
            )
    return result


def normalize_test_name(addon: str, name: str) -> str:
    """Normalize technical test IDs to human-readable names for !Mechanic."""
    n = str(name).lower().strip()
    mapping = {
        # !Mechanic Core
        "db_integrity": "Database Integrity",
        "db_defaults": "Database Defaults",
        "ui_modules": "UI Modules Loaded",
        "lib_health": "Library Health",
        "registry_health": "Registry Health",
        "buffer_health": "Buffer Health",
        # Flightsim tests (often seen as IDs)
        "api diagnostic": "API Diagnostic",
        "ui compliance": "UI Compliance",
        "api_diag": "API Diagnostic",
        "ui_comp": "UI Compliance",
    }
    return mapping.get(n, name)


def _test_entry(addon: str, name: str, result: dict) -> dict:
    return {
        "addon": addon,
        "name": name,
        "passed": result.get("passed", False),
        "category": result.get("category", "General"),
        "message": result.get("message", ""),
        "duration": result.get("duration"),
        "logs": result.get("logs", []),
        "details": result.get("details", []),
    }


def parse_tests_from_mechanic_db(addon_data: dict) -> list:
    """Extract test results from MechanicDB profile data."""
    entries = []

    # 1. Hub structure first
    for addon_name, data in _hub(addon_data).items():
        tests = data.get("tests", {})
        if not isinstance(tests, dict):
            continue
        for test_id, result in tests.items():
            if isinstance(result, dict):
                raw_name = result.get("name") or test_id
                entries.append(
                    _test_entry(
                        addon_name, normalize_test_name(addon_name, raw_name), result
                    )
                )

    # 2. Legacy/direct testResults (merged, deduplicated against the hub)
    test_results = addon_data.get("testResults", {})
    results_items = test_results.items() if isinstance(test_results, dict) else []
    seen = {(t["addon"], t["name"]) for t in entries}

    for test_id, result in results_items:
        if not isinstance(result, dict):
            continue
        addon_name = "!Mechanic"
        display_id = str(test_id)
        if ":" in display_id:
            addon_name, display_id = display_id.split(":", 1)

        pretty_name = normalize_test_name(addon_name, result.get("name") or display_id)
        if (addon_name, pretty_name) not in seen:
            seen.add((addon_name, pretty_name))
            entries.append(_test_entry(addon_name, pretty_name, result))
    return entries


def parse_hub_logs_from_mechanic_db(addon_data: dict) -> list:
    """Extract consolidated addon logs from the Hub."""
    logs = []
    for addon_name, data in _hub(addon_data).items():
        lines = data.get("logs", [])
        if lines and isinstance(lines, (list, dict)):
            logs.append({"addon": addon_name, "lines": _as_list(lines)})
    return logs


def parse_hub_libraries_from_mechanic_db(addon_data: dict) -> list:
    """Extract consolidated addon versions from the Hub."""
    libs = []
    for addon_name, data in _hub(addon_data).items():
        version = data.get("version")
        if version:
            libs.append({"name": addon_name, "version": version})
    return libs


def parse_hub_performance_from_mechanic_db(addon_data: dict) -> dict:
    """Extract consolidated addon performance metrics from the Hub."""
    perf_map = {}
    for addon_name, data in _hub(addon_data).items():
        perf = data.get("perf")
        if isinstance(perf, dict):
            # Performance metrics in Lua are often keyed by name
            perf_list = []
            for key, value in perf.items():
                if isinstance(value, dict):
                    perf_list.append(
                        value if "name" in value else {**value, "name": key}
                    )
            perf_map[addon_name] = perf_list
        elif isinstance(perf, list):
            perf_map[addon_name] = perf

    return perf_map


# Human-readable Midnight Impact explanations
IMPACT_EXPLANATIONS = {
    "RESTRICTED": "Fully protected in 12.0. Calls blocked or return nil.",
    "CONDITIONAL": "Works but may return secret values under certain conditions.",
    "HIGH": "Major changes expected. Review usage carefully before Midnight.",
    "SAFE": "No significant changes expected.",
}


def get_impact_explanation(impact: str | None) -> str | None:
    """Get human-readable explanation for Midnight impact level."""
    if not impact:
        return None
    return IMPACT_EXPLANATIONS.get(impact)


def parse_secret_behavior(note: str | None) -> list[str] | None:
    """Parse secret behavior notation into human-readable explanations."""
    if not note or not isinstance(note, str):
        return None

    explanations = []

    # SecretArguments patterns
    if "SecretArguments=AllowedWhenUntainted" in note:
        explanations.append("Arguments accepted when code is untainted")
    if "SecretArguments=AllowedWhenTainted" in note:
        explanations.append("Arguments accepted even when tainted")

    # SecretWhen patterns
    if "SecretWhenActionCooldownRestricted" in note:
        explanations.append("Returns secret when action cooldown info is restricted")
    if "SecretWhenUnitCastingInfoRestricted" in note:
        explanations.append("Returns secret when unit casting info is restricted")
    if "SecretWhenCurveSecret" in note:
        explanations.append("Returns secret when curve parameter is secret")
    if "SecretWhenSoftTargetRestricted" in note:
        explanations.append("Returns secret when soft target info is restricted")

    return explanations if explanations else None


def parse_api_tests_from_mechanic_db(addon_data: dict) -> dict:
    """Extract API test results from MechanicDB.

    Returns:
        {
            "total": int,
            "summary": {"pass": int, "secret": int, "error": int, "protected": int},
            "by_namespace": {"C_Spell": [...], ...},
            "tests": [...]
        }
    """
    api_tests = addon_data.get("apiTests", {})
    if not api_tests or not isinstance(api_tests, dict):
        return {"total": 0, "summary": {}, "by_namespace": {}, "tests": []}

    result = {
        "total": 0,
        "summary": {
            "pass": 0,
            "secret": 0,
            "error": 0,
            "protected": 0,
            "missing_params": 0,
        },
        "by_namespace": {},
        "tests": [],
    }

    for api_key, data in api_tests.items():
        if not isinstance(data, dict) or not data.get("lastRun"):
            continue
        api_key = str(api_key)

        result["total"] += 1
        status = data.get("status", "unknown")
        if status in result["summary"]:
            result["summary"][status] += 1

        # Extract namespace from api_key (e.g., "C_Spell.GetSpellInfo" -> "C_Spell")
        namespace = api_key.split(".", 1)[0] if "." in api_key else "Global"
        result["by_namespace"].setdefault(namespace, [])

        impact = data.get("midnightImpact")
        test_entry = {
            "key": api_key,
            "namespace": namespace,
            "status": status,
            "success": data.get("success"),
            "duration": data.get("duration"),
            "secretCount": data.get("secretCount", 0),
            "lastRunTime": data.get("lastRunTime"),
            "results": data.get("results"),
            "midnightImpact": impact,
            "midnightNote": data.get("midnightNote"),
            "impactExplanation": get_impact_explanation(impact),
            "secretExplanations": parse_secret_behavior(data.get("midnightNote")),
            # Agent-friendly fields
            "signature": data.get("signature"),
            "params_def": data.get("params_def"),
            "returns_def": data.get("returns_def"),
            "funcPath": data.get("funcPath"),
            "category": data.get("category"),
            "params_used": data.get("lastParams"),
        }
        result["by_namespace"][namespace].append(test_entry)
        result["tests"].append(test_entry)

    return result


def parse_lua_eval_from_mechanic_db(addon_data: dict) -> dict:
    """Extract Lua eval results from MechanicDB.

    Returns:
        {
            "total": int,
            "succeeded": int,
            "failed": int,
            "lastRun": str,
            "results": [...]
        }
    """
    empty = {"total": 0, "succeeded": 0, "failed": 0, "lastRun": None, "results": []}
    lua_eval = addon_data.get("luaEvalResults", {})
    if not lua_eval or not isinstance(lua_eval, dict):
        return empty

    results = [r for r in _as_list(lua_eval.get("results", [])) if isinstance(r, dict)]
    succeeded = sum(1 for r in results if r.get("success"))

    return {
        "total": len(results),
        "succeeded": succeeded,
        "failed": len(results) - succeeded,
        "lastRun": lua_eval.get("lastRun"),
        "results": results,
    }


def profile_timestamp(profile_data: dict) -> Optional[str]:
    """Freshness of the saved profile: hub ``lastSync`` else the last Lua eval run."""
    last_sync = profile_data.get("lastSync")
    if not isinstance(last_sync, bool) and isinstance(last_sync, (int, float)):
        if last_sync > 0:
            try:
                return datetime.fromtimestamp(last_sync).strftime("%Y-%m-%d %H:%M:%S")
            except (OverflowError, OSError, ValueError):
                pass
    lua_eval = profile_data.get("luaEvalResults", {})
    if isinstance(lua_eval, dict) and lua_eval.get("lastRun"):
        return str(lua_eval["lastRun"])
    return None


# ═══════════════════════════════════════════════════════════════════════════════
# AGENT COMPRESSION
# ═══════════════════════════════════════════════════════════════════════════════


def compress_errors_for_agent(errors: list, max_per_addon: int = 5) -> dict:
    """Smart compression of errors for agent efficiency.

    Groups by addon, deduplicates identical file:line:message, limits to top N
    per addon. Preserves total count and shows representative samples. Input
    dictionaries are never modified.

    Returns:
        {
            "by_addon": {"AddonName": [errors...], ...},
            "total": int,
            "shown": int,
        }
    """
    by_addon: Dict[str, list] = {}
    for err in errors:
        by_addon.setdefault(err.get("addon", "Unknown"), []).append(err)

    compressed = {}
    shown = 0
    for addon, addon_errors in by_addon.items():
        seen: Dict[str, dict] = {}
        for err in addon_errors:
            key = f"{err.get('file', '')}:{err.get('line', 0)}|{err.get('message', '')}"
            counter = _safe_int(err.get("counter", 1))
            if key not in seen:
                seen[key] = {**err, "counter": counter}
            else:
                seen[key]["counter"] += counter

        deduped = sorted(seen.values(), key=lambda e: e["counter"], reverse=True)
        compressed[addon] = deduped[:max_per_addon]
        shown += len(compressed[addon])

    return {"by_addon": compressed, "total": len(errors), "shown": shown}


def sequence_dedup_console(entries: list) -> list:
    """Deduplicate adjacent console entries while preserving order.

    aabbbccdaaa → a(x2) b(x3) c(x2) d a(x3)

    Returns list of {source, category, message, count} with adjacent duplicates merged.
    """
    result: list = []
    current = None
    current_key = None
    count = 0

    for entry in entries:
        key = f"{entry.get('source', '')}|{entry.get('category', '')}|{entry.get('message', '')}"
        if current is not None and key == current_key:
            count += 1
            continue
        if current is not None:
            result.append({**current, "count": count})
        current, current_key, count = entry, key, 1

    if current is not None:
        result.append({**current, "count": count})
    return result


# ═══════════════════════════════════════════════════════════════════════════════
# MARKDOWN SECTIONS
# ═══════════════════════════════════════════════════════════════════════════════


def _trim_message(message: str, limit: Optional[int] = None) -> str:
    parts = message.split(":", 3)
    if len(parts) > 3:
        message = parts[3].strip()
        if limit:
            message = message[:limit]
    return message


def _errors_section(errors: list, agent_mode: bool) -> List[str]:
    if not errors:
        return ["### Errors\n", "No errors.\n"]
    lines: List[str] = []
    if agent_mode:
        compressed = compress_errors_for_agent(errors, max_per_addon=5)
        lines.append(
            f"### Errors ({compressed['total']} total, showing {compressed['shown']} unique)\n"
        )
        for addon, addon_errors in compressed["by_addon"].items():
            lines.append(f"**{addon}** ({len(addon_errors)} shown)")
            for err in addon_errors:
                msg = _trim_message(err["message"], 80)
                count_str = f" (x{err['counter']})" if err["counter"] > 1 else ""
                lines.append(f"  - `{err['file']}:{err['line']}`{count_str} {msg}")
            lines.append("")
        return lines

    lines.append(f"### Errors ({len(errors)})\n")
    for i, err in enumerate(errors, 1):
        lines.append(f"{i}. **{err['addon']}/{err['file']}:{err['line']}**")
        lines.append(f"   {_trim_message(err['message'])}")
        if err.get("counter", 1) > 1:
            lines.append(f"   _(occurred {err['counter']} times)_")
        lines.append("")
    return lines


def _tests_section(tests: list) -> List[str]:
    if not tests:
        return ["### Tests\n", "No test results.\n"]
    lines = ["### Tests\n"]
    by_addon: Dict[str, dict] = {}
    for test in tests:
        data = by_addon.setdefault(
            test.get("addon", "Unknown"), {"passed": 0, "failed": 0, "failures": []}
        )
        if test.get("passed"):
            data["passed"] += 1
        else:
            data["failed"] += 1
            data["failures"].append(test.get("name", "unnamed"))

    for addon, data in by_addon.items():
        lines.append(f"- **{addon}**: {data['passed']} passed, {data['failed']} failed")
        for failure in data["failures"]:
            lines.append(f"  - FAIL: `{failure}`")
    lines.append("")
    return lines


def _console_section(console: list, agent_mode: bool) -> List[str]:
    if not console:
        return [
            "### Console\n",
            "No console output persisted. Do `/reload` in-game to save logs.\n",
        ]
    lines: List[str] = []
    if agent_mode:
        deduped = sequence_dedup_console(console[-50:])
        lines.append(f"### Console ({len(console)} entries, {len(deduped)} unique)\n")
        lines.append("```")
        for entry in deduped:
            category = entry.get("category", "")
            cat_str = f" [{category}]" if category else ""
            count = entry.get("count", 1)
            count_str = f" (x{count})" if count > 1 else ""
            lines.append(
                f"[{entry.get('source', '')}]{cat_str} {entry.get('message', '')}{count_str}"
            )
    else:
        lines.append(f"### Console (last {len(console)} entries)\n")
        lines.append("```")
        for entry in console[-50:]:
            category = entry.get("category", "")
            cat_str = f" {category}" if category else ""
            lines.append(
                f"[{entry.get('source', '')}]{cat_str} {entry.get('message', '')}"
            )
    lines.append("```")
    return lines


def _hub_logs_section(hub_logs: list) -> List[str]:
    lines: List[str] = []
    if not hub_logs:
        return lines
    lines.append("### Addon Diagnostics (Hub)\n")
    for hl in hub_logs:
        addon = hl["addon"]
        # !Mechanic is already shown in the main console
        if addon == "!Mechanic":
            continue
        lines.append(f"**{addon}**")
        lines.append("```")
        for line in hl["lines"][-20:]:
            if isinstance(line, dict):
                line = line.get("message", str(line))
            lines.append(str(line))
        lines.append("```\n")
    return lines


def _format_ms(value: Any) -> str:
    if isinstance(value, bool) or not isinstance(value, (int, float)):
        return "n/a"
    return f"{value:.2f}ms"


def _api_test_detail(t: dict) -> List[str]:
    status = t.get("status", "unknown")
    icon = {"pass": "✓", "secret": "⚠", "error": "✗", "protected": "🔒"}.get(
        status, "?"
    )
    lines = [f"**{icon} {t['key']}**"]

    if t.get("signature"):
        lines += ["```", f"{t.get('funcPath') or t['key']}{t['signature']}", "```"]

    params_used = t.get("params_used")
    if params_used:
        if isinstance(params_used, dict):
            params_str = ", ".join(f"{k}={v!r}" for k, v in params_used.items())
        else:
            params_str = ", ".join(repr(v) for v in _as_list(params_used))
        lines.append(f"**Called with:** `{params_str or '(no params)'}`")

    lines.append(
        f"**Status:** {status} | **Duration:** {_format_ms(t.get('duration'))}"
    )
    results = t.get("results")
    if results:
        lines += ["**Returns:**", "```lua"]
        if isinstance(results, dict):
            lines += [f"  {name} = {val}" for name, val in results.items()]
        elif isinstance(results, list):
            lines += [f"  -- {msg}" for msg in results]
        else:
            lines.append(f"  {results}")
        lines.append("```")

    if t.get("funcPath"):
        returns_def = [r for r in _as_list(t.get("returns_def")) if isinstance(r, dict)]
        return_vars = (
            ", ".join(r.get("name", f"ret{i}") for i, r in enumerate(returns_def))
            if returns_def
            else "result"
        )
        params_def = [p for p in _as_list(t.get("params_def")) if isinstance(p, dict)]
        param_example = ", ".join(p.get("name", "...") for p in params_def)
        lines.append(
            f"**Example:** `local {return_vars} = {t['funcPath']}({param_example})`"
        )
    lines.append("")
    return lines


def _api_tests_section(api_tests: dict, agent_mode: bool) -> List[str]:
    if api_tests["total"] <= 0:
        return []
    summary = api_tests["summary"]
    lines = [
        f"### API Test Bench ({api_tests['total']} tested)\n",
        f"**Summary:** {summary.get('pass', 0)} pass, {summary.get('secret', 0)} secret, {summary.get('error', 0)} error\n",
    ]
    if agent_mode:
        for ns, ns_tests in api_tests["by_namespace"].items():
            secrets = [t for t in ns_tests if t.get("status") == "secret"]
            failures = [t for t in ns_tests if t.get("status") == "error"]
            if secrets or failures:
                lines.append(f"**{ns}**: {len(secrets)} secret, {len(failures)} error")
                for t in (failures + secrets)[:3]:
                    lines.append(f"  - `{t['key']}` ({t['status']})")
    else:
        for ns, ns_tests in sorted(api_tests["by_namespace"].items()):
            lines.append(f"\n#### {ns}\n")
            for t in ns_tests:
                lines.extend(_api_test_detail(t))
    lines.append("")
    return lines


def _lua_eval_section(lua_eval: dict) -> List[str]:
    if lua_eval["total"] <= 0:
        return []
    lines = [
        f"### Lua Eval Results ({lua_eval['total']} executed)\n",
        f"**Summary:** {lua_eval['succeeded']} succeeded, {lua_eval['failed']} failed",
    ]
    if lua_eval.get("lastRun"):
        lines.append(f"**Last Run:** {lua_eval['lastRun']}\n")

    for r in lua_eval.get("results", []):
        label = r.get("label", "unknown")
        if r.get("success"):
            lines.append(
                f"✓ **{label}** → `{r.get('result', 'nil')}` ({r.get('resultType', '?')})"
            )
        else:
            lines.append(f"✗ **{label}** → {r.get('error', 'Unknown error')}")

        code = str(r.get("code", "") or "")
        if code:
            preview = code[:60] + "..." if len(code) > 60 else code
            lines.append(f"  Code: `{preview}`")
    lines.append("")
    return lines


def format_output(data: dict, agent_mode: bool, warnings: List[str]) -> str:
    """Render the collected diagnostics as markdown."""
    lines: List[str] = []
    if data["timestamp"]:
        lines.append(f"## Addon Output - {data['timestamp']}\n")
    else:
        lines.append("## Addon Output - No reload data yet\n")

    for note in warnings:
        lines.append(f"> Warning: {note}\n")

    libraries = data["libraries"]
    if libraries:
        libs_str = ", ".join(f"{lib['name']} {lib['version']}" for lib in libraries[:6])
        if len(libraries) > 6:
            libs_str += f" (+{len(libraries) - 6} more)"
        lines.append(f"**Libraries:** {libs_str}\n")

    lines += _errors_section(data["errors"], agent_mode)
    lines += _tests_section(data["tests"])
    lines += _console_section(data["console"], agent_mode)
    lines += _hub_logs_section(data["hub_logs"])
    lines += _api_tests_section(data["api_tests"], agent_mode)
    lines += _lua_eval_section(data["lua_eval"])
    return "\n".join(lines)


# ═══════════════════════════════════════════════════════════════════════════════
# COLLECTION
# ═══════════════════════════════════════════════════════════════════════════════


def _read_buggrabber(sv_dir: Path, sources: list, warnings: List[str]) -> list:
    path = sv_dir / "!BugGrabber.lua"
    if not path.exists():
        return []
    try:
        content = path.read_text(encoding="utf-8", errors="replace")
    except OSError as exc:
        warnings.append(f"!BugGrabber.lua could not be read ({exc}); errors unknown.")
        return []
    parsed = parse_buggrabber(content)
    if parsed.get("parse_error"):
        warnings.append(
            f"!BugGrabber.lua could not be parsed ({parsed['parse_error']}); errors unknown."
        )
        return []
    sources.append(
        create_source(
            type="file",
            id="buggrabber",
            title="BugGrabber Errors",
            location=str(path),
        )
    )
    return parsed["errors"]


def _read_profile_data(selected: SelectedTarget) -> Tuple[dict, Path]:
    mechanic_file = Path(selected.sv_path)
    try:
        variables = parse_sv_file(mechanic_file)
    except Exception as exc:
        raise TargetError(
            "TARGET_READ_ERROR", f"Cannot read selected diagnostics: {exc}"
        ) from exc

    db = variables.get("MechanicDB", {})
    if not isinstance(db, dict):
        raise TargetError("TARGET_READ_ERROR", "MechanicDB is not a table.")
    if selected.profile is None:
        return db, mechanic_file
    profiles = db.get("profiles", {})
    if not isinstance(profiles, dict) or selected.profile not in profiles:
        raise TargetError("TARGET_NOT_FOUND", "Selected profile no longer exists.")
    profile = profiles[selected.profile]
    if not isinstance(profile, dict):
        raise TargetError("TARGET_READ_ERROR", "Selected profile is not a table.")
    return profile, mechanic_file


def collect_diagnostics(selected: SelectedTarget) -> Tuple[dict, list, List[str]]:
    """Read everything addon.output reports for one selected target (blocking)."""
    sources: list = []
    warnings: List[str] = []

    errors = _read_buggrabber(Path(selected.sv_path).parent, sources, warnings)
    profile_data, mechanic_file = _read_profile_data(selected)

    libraries = parse_libraries_from_mechanic_db(profile_data)
    for hub_lib in parse_hub_libraries_from_mechanic_db(profile_data):
        if not any(lib["name"] == hub_lib["name"] for lib in libraries):
            libraries.append(hub_lib)

    sources.append(
        create_source(
            type="file",
            id="mechanic-db",
            title="MechanicDB Console",
            location=str(mechanic_file),
        )
    )
    data = {
        "timestamp": profile_timestamp(profile_data),
        "errors": errors,
        "tests": parse_tests_from_mechanic_db(profile_data),
        "console": parse_console_from_mechanic_db(profile_data),
        "libraries": libraries,
        "hub_logs": parse_hub_logs_from_mechanic_db(profile_data),
        "perf": parse_hub_performance_from_mechanic_db(profile_data),
        "api_tests": parse_api_tests_from_mechanic_db(profile_data),
        "lua_eval": parse_lua_eval_from_mechanic_db(profile_data),
    }
    return data, sources, warnings


def build_addon_output(
    target: Optional[DiagnosticTarget], agent_mode: bool
) -> Tuple[AddonOutputResult, list, List[str]]:
    selected = select_target(target)
    data, sources, warnings = collect_diagnostics(selected)
    result = AddonOutputResult(
        target=selected,
        output=format_output(data, agent_mode, warnings),
        error_count=len(data["errors"]),
        test_count=len(data["tests"]),
        console_count=len(data["console"]),
        api_test_count=data["api_tests"]["total"],
        lua_eval_count=data["lua_eval"]["total"],
        timestamp=data["timestamp"],
        errors=data["errors"],
        tests=data["tests"],
        console=data["console"],
        libraries=data["libraries"],
        perf=data["perf"],
        api_tests=data["api_tests"],
        lua_eval=data["lua_eval"],
    )
    return result, sources, warnings


# ═══════════════════════════════════════════════════════════════════════════════
# COMMAND
# ═══════════════════════════════════════════════════════════════════════════════


def register_commands(server):
    """Register addon output commands with the AFD server."""

    @server.command(
        name="addon.output",
        description="Get all addon output (errors, tests, console) for agent consumption. Use agent_mode=true for compressed output.",
        input_schema=AddonOutputInput,
        output_schema=AddonOutputResult,
    )
    async def addon_output(
        input: AddonOutputInput, context: Any = None
    ) -> CommandResult[AddonOutputResult]:
        """Return all addon output as formatted markdown.

        The selected SavedVariables profile is the only source: BugGrabber
        errors, hub tests/logs/performance, console buffer, API test bench and
        Lua eval results. Parsing runs off the event loop.
        """
        try:
            result, sources, notes = await asyncio.to_thread(
                build_addon_output, input.target, input.agent_mode
            )
        except TargetError as exc:
            return exc.result()

        warnings = [
            create_warning(
                code="BUGGRABBER_UNREADABLE",
                message=note,
                severity=WarningSeverity.WARNING,
            )
            for note in notes
        ] or None

        if (
            not result.errors
            and not result.tests
            and not result.console
            and result.api_test_count == 0
            and result.lua_eval_count == 0
        ):
            return success(
                data=result,
                reasoning="No addon data available. Do /reload in-game to generate data.",
                sources=sources,
                warnings=warnings,
                confidence=0.8,
            )

        return success(
            data=result,
            reasoning=(
                f"Addon output: {result.error_count} errors, {result.test_count} tests, "
                f"{result.console_count} console, {result.api_test_count} API tests, "
                f"{result.lua_eval_count} Lua evals"
            ),
            sources=sources,
            warnings=warnings,
            confidence=0.95,
        )
