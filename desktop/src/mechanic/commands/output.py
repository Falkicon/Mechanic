"""
Addon Output command - returns all addon data for agent consumption (AFD).

Philosophy:
- No flags: Just return everything (tokens are cheap, complexity isn't)
- Markdown format: AI-friendly, human-readable
- From SQLite: Read stored data, don't re-parse
- Fast: Should complete in <100ms
"""

from afd import CommandResult, success, error
from afd.core.metadata import create_source
from pydantic import BaseModel, Field
from typing import Dict, Any, List, Optional
from datetime import datetime
import re


# ═══════════════════════════════════════════════════════════════════════════════
# SCHEMAS
# ═══════════════════════════════════════════════════════════════════════════════

class AddonOutputInput(BaseModel):
    """Input for addon output command."""
    agent_mode: bool = Field(default=False, description="Enable smart compression for AI agents")


class AddonOutputResult(BaseModel):
    """Formatted addon output for agent consumption."""
    output: str = Field(..., description="Formatted markdown output")
    error_count: int = Field(default=0, description="Number of errors")
    test_count: int = Field(default=0, description="Number of test results")
    console_count: int = Field(default=0, description="Number of console entries")
    api_test_count: int = Field(default=0, description="Number of API test results")
    lua_eval_count: int = Field(default=0, description="Number of Lua eval results")
    timestamp: Optional[str] = Field(None, description="Last reload timestamp")
    # Raw data for dashboard rendering
    errors: List[Dict[str, Any]] = Field(default_factory=list, description="Raw error objects")
    tests: List[Dict[str, Any]] = Field(default_factory=list, description="Raw test objects")
    console: List[Dict[str, Any]] = Field(default_factory=list, description="Raw console entries")
    libraries: List[Dict[str, Any]] = Field(default_factory=list, description="Loaded library versions")
    perf: Dict[str, Any] = Field(default_factory=dict, description="Consolidated addon performance metrics")
    api_tests: Dict[str, Any] = Field(default_factory=dict, description="API Test Bench results")
    lua_eval: Dict[str, Any] = Field(default_factory=dict, description="Lua eval queue results")


class BugGrabberError(BaseModel):
    """Parsed BugGrabber error entry."""
    message: str
    stack: str = ""
    time: str = ""
    counter: int = 1
    addon: str = "Unknown"
    file: str = "Unknown"
    line: int = 0


# ═══════════════════════════════════════════════════════════════════════════════
# BUGGRABBER PARSER
# ═══════════════════════════════════════════════════════════════════════════════

def parse_buggrabber(content: str, current_session_only: bool = True) -> dict:
    """Parse BugGrabber SavedVariables file.
    
    Args:
        current_session_only: If True, only return errors from the current session
    
    Returns:
        {
            "errors": [BugGrabberError, ...],
            "session": int,
        }
    """
    from ..parsers import parse_savedvariables
    
    try:
        variables = parse_savedvariables(content)
    except Exception:
        return {"errors": [], "session": 0}
    
    db = variables.get("BugGrabberDB", {})
    current_session = db.get("session", 0)
    
    errors = []
    raw_errors = db.get("errors", [])
    
    # Handle both list and dict formats
    if isinstance(raw_errors, dict):
        raw_errors = list(raw_errors.values())
    
    for err in raw_errors:
        if not isinstance(err, dict):
            continue
        
        # Filter to current session only
        if current_session_only:
            err_session = err.get("session", 0)
            if err_session != current_session:
                continue
            
        message = err.get("message", "")
        
        # Extract addon/file/line from message
        # Patterns to try:
        # 1. "Interface/AddOns/AddonName/..." format
        # 2. "...AddonName/File.lua:123:" fallback
        addon = "Unknown"
        file = "Unknown"
        line = 0
        
        # Try full path pattern first: Interface/AddOns/AddonName/path/File.lua:123
        full_match = re.search(r'Interface[/\\]AddOns[/\\]([^/\\]+)[/\\](.+\.lua):(\d+):', message)
        if full_match:
            addon = full_match.group(1)
            file = full_match.group(2)
            line = int(full_match.group(3))
        else:
            # Fallback: last folder before .lua file
            fallback_match = re.search(r'([^/\\]+)[/\\]([^/\\]+\.lua):(\d+):', message)
            if fallback_match:
                addon = fallback_match.group(1)
                file = fallback_match.group(2)
                line = int(fallback_match.group(3))
        
        errors.append({
            "message": message,
            "stack": err.get("stack", ""),
            "time": err.get("time", ""),
            "counter": err.get("counter", 1),
            "addon": addon,
            "file": file,
            "line": line,
        })
    
    return {
        "errors": errors,
        "session": db.get("session", 0),
    }


def parse_console_from_mechanic_db(addon_data: dict) -> list:
    """Extract console buffer entries from MechanicDB profile data."""
    console_buffer = addon_data.get("consoleBuffer", [])
    
    # Handle both list and dict formats (Lua arrays)
    if isinstance(console_buffer, dict):
        console_buffer = list(console_buffer.values())
    
    entries = []
    for entry in console_buffer:
        if isinstance(entry, dict):
            entries.append({
                "source": entry.get("source", ""),
                "category": entry.get("category", ""),
                "message": entry.get("message", ""),
                "time": entry.get("time", 0),
            })
    
    return entries


def parse_libraries_from_mechanic_db(addon_data: dict) -> list:
    """Extract loaded library versions from MechanicDB profile data."""
    libs = addon_data.get("loadedLibraries", [])
    
    # Handle both list and dict formats (Lua arrays)
    if isinstance(libs, dict):
        libs = list(libs.values())
    
    result = []
    for lib in libs:
        if isinstance(lib, dict):
            result.append({
                "name": lib.get("name", "Unknown"),
                "version": lib.get("version", "?"),
            })
    
    return result


def normalize_test_name(addon: str, name: str) -> str:
    """Normalize technical test IDs to human-readable names for !Mechanic."""
    n = name.lower().strip()
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


def parse_tests_from_mechanic_db(addon_data: dict) -> list:
    """Extract test results from MechanicDB profile data."""
    # 1. Try new Hub structure first
    hub = addon_data.get("addonData", {})
    entries = []

    if hub and isinstance(hub, dict):
        for addon_name, data in hub.items():
            if not isinstance(data, dict):
                continue
            tests = data.get("tests", {})
            if not isinstance(tests, dict):
                continue
            for test_id, result in tests.items():
                if isinstance(result, dict):
                    raw_name = result.get("name") or test_id
                    entries.append({
                        "addon": addon_name,
                        "name": normalize_test_name(addon_name, raw_name),
                        "passed": result.get("passed", False),
                        "category": result.get("category", "General"),
                        "message": result.get("message", ""),
                        "duration": result.get("duration"),
                        "logs": result.get("logs", []),
                        "details": result.get("details", []),
                    })
    
    # 2. Add legacy/direct testResults (merged)
    test_results = addon_data.get("testResults", {})
    results_items = test_results.items() if isinstance(test_results, dict) else []
    
    for test_id, result in results_items:
        if isinstance(result, dict):
            addon_name = "!Mechanic"
            display_id = test_id
            if ":" in test_id:
                parts = test_id.split(":", 1)
                addon_name, display_id = parts[0], parts[1]
            
            pretty_name = normalize_test_name(addon_name, result.get("name") or display_id)
            # Use map to deduplicate if already found in hub
            exists = any(t["addon"] == addon_name and t["name"] == pretty_name for t in entries)
            if not exists:
                entries.append({
                    "addon": addon_name,
                    "name": pretty_name,
                    "passed": result.get("passed", False),
                    "category": result.get("category", "General"),
                    "message": result.get("message", ""),
                    "duration": result.get("duration"),
                    "logs": result.get("logs", []),
                    "details": result.get("details", []),
                })
    return entries


def parse_hub_logs_from_mechanic_db(addon_data: dict) -> list:
    """Extract consolidated addon logs from the Hub."""
    hub = addon_data.get("addonData", {})
    if not isinstance(hub, dict):
        return []
    logs = []
    for addon_name, data in hub.items():
        lines = data.get("logs", [])
        if lines:
            logs.append({
                "addon": addon_name,
                "lines": lines
            })
    return logs


def parse_hub_libraries_from_mechanic_db(addon_data: dict) -> list:
    """Extract consolidated addon versions from the Hub."""
    hub = addon_data.get("addonData", {})
    if not isinstance(hub, dict):
        return []
    libs = []
    for addon_name, data in hub.items():
        version = data.get("version")
        if version:
            libs.append({
                "name": addon_name,
                "version": version
            })
    return libs


def parse_hub_performance_from_mechanic_db(addon_data: dict) -> dict:
    """Extract consolidated addon performance metrics from the Hub."""
    hub = addon_data.get("addonData", {})
    if not isinstance(hub, dict):
        return {}
    perf_map = {}
    for addon_name, data in hub.items():
        perf = data.get("perf")
        if isinstance(perf, dict):
            # Performance metrics in Lua are often keyed by name
            perf_list = []
            for k, v in perf.items():
                if isinstance(v, dict):
                    # Ensure name is present, using key if necessary
                    if "name" not in v:
                        v["name"] = k
                    perf_list.append(v)
            perf_map[addon_name] = perf_list
        elif isinstance(perf, list):
            perf_map[addon_name] = perf
            
    return perf_map


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
        "summary": {"pass": 0, "secret": 0, "error": 0, "protected": 0, "missing_params": 0},
        "by_namespace": {},
        "tests": []
    }
    
    for api_key, data in api_tests.items():
        if not isinstance(data, dict) or not data.get("lastRun"):
            continue
        
        result["total"] += 1
        status = data.get("status", "unknown")
        if status in result["summary"]:
            result["summary"][status] += 1
        
        # Extract namespace from api_key (e.g., "C_Spell.GetSpellInfo" -> "C_Spell")
        namespace = "Global"
        if "." in api_key:
            namespace = api_key.split(".", 1)[0]
        
        if namespace not in result["by_namespace"]:
            result["by_namespace"][namespace] = []
        
        # Add human-readable explanations
        impact = data.get("midnightImpact")
        impact_explanation = get_impact_explanation(impact)
        secret_explanations = parse_secret_behavior(data.get("midnightNote"))
        
        # Include API definition info for agent-friendly output
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
            "impactExplanation": impact_explanation,
            "secretExplanations": secret_explanations,
            # Agent-friendly fields
            "signature": data.get("signature"),  # e.g., "(spellID: number) -> name: string?"
            "params_def": data.get("params_def"),  # Full param definitions
            "returns_def": data.get("returns_def"),  # Full return definitions
            "funcPath": data.get("funcPath"),  # Exact call path
            "category": data.get("category"),  # API category
            "params_used": data.get("lastParams"),  # Params used in the test
        }
        result["by_namespace"][namespace].append(test_entry)
        result["tests"].append(test_entry)
    
    return result


# Human-readable Midnight Impact explanations
IMPACT_EXPLANATIONS = {
    "RESTRICTED": "Fully protected in 12.0. Calls blocked or return nil.",
    "CONDITIONAL": "Works but may return secret values under certain conditions.",
    "HIGH": "Major changes expected. Review usage carefully before Midnight.",
    "SAFE": "No significant changes expected.",
}


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
    lua_eval = addon_data.get("luaEvalResults", {})
    if not lua_eval:
        return {"total": 0, "succeeded": 0, "failed": 0, "lastRun": None, "results": []}
    
    results = lua_eval.get("results", [])
    if isinstance(results, dict):
        results = list(results.values())
    
    succeeded = sum(1 for r in results if r.get("success"))
    failed = len(results) - succeeded
    
    return {
        "total": len(results),
        "succeeded": succeeded,
        "failed": failed,
        "lastRun": lua_eval.get("lastRun"),
        "results": results
    }


def get_impact_explanation(impact: str | None) -> str | None:
    """Get human-readable explanation for Midnight impact level."""
    if not impact:
        return None
    return IMPACT_EXPLANATIONS.get(impact)


def parse_secret_behavior(note: str | None) -> list[str] | None:
    """Parse secret behavior notation into human-readable explanations."""
    if not note:
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


def compress_errors_for_agent(errors: list, max_per_addon: int = 5) -> dict:
    """Smart compression of errors for agent efficiency.
    
    Groups by addon, deduplicates by file:line, limits to top N per addon.
    Preserves total count and shows representative samples.
    
    Returns:
        {
            "by_addon": {"AddonName": [errors...], ...},
            "total": int,
            "shown": int,
        }
    """
    # Group by addon
    by_addon: Dict[str, list] = {}
    for err in errors:
        addon = err.get("addon", "Unknown")
        if addon not in by_addon:
            by_addon[addon] = []
        by_addon[addon].append(err)
    
    # Deduplicate by file:line within each addon
    compressed = {}
    shown = 0
    for addon, addon_errors in by_addon.items():
        seen = {}
        for err in addon_errors:
            key = f"{err.get('file', '')}:{err.get('line', 0)}"
            if key not in seen:
                seen[key] = err
            else:
                # Accumulate counter
                seen[key]["counter"] = seen[key].get("counter", 1) + err.get("counter", 1)
        
        # Sort by counter (most frequent first) and limit
        deduped = sorted(seen.values(), key=lambda e: e.get("counter", 1), reverse=True)
        compressed[addon] = deduped[:max_per_addon]
        shown += len(compressed[addon])
    
    return {
        "by_addon": compressed,
        "total": len(errors),
        "shown": shown,
    }


def sequence_dedup_console(entries: list) -> list:
    """Deduplicate adjacent console entries while preserving order.
    
    aabbbccdaaa → a(x2) b(x3) c(x2) d a(x3)
    
    Returns list of {source, category, message, count} with adjacent duplicates merged.
    """
    if not entries:
        return []
    
    result = []
    current = None
    count = 0
    
    for entry in entries:
        key = f"{entry.get('source', '')}|{entry.get('category', '')}|{entry.get('message', '')}"
        
        if current is None:
            current = entry
            current_key = key
            count = 1
        elif key == current_key:
            count += 1
        else:
            # Output previous group
            result.append({**current, "count": count})
            current = entry
            current_key = key
            count = 1
    
    # Don't forget the last group
    if current:
        result.append({**current, "count": count})
    
    return result


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
    async def addon_output(input: AddonOutputInput, context: Any = None) -> CommandResult[AddonOutputResult]:
        """Return all addon output as formatted markdown.
        
        Args:
            input.agent_mode: If true, compress errors (group by addon, dedupe, top 5 per addon)
        
        Workflow:
        1. Read latest reload from SQLite
        2. Parse BugGrabber for errors (if available)
        3. Extract console buffer from MechanicDB
        4. Format everything as markdown (compressed if agent_mode)
        """
        from ..server import storage
        from ..config import discover_saved_variables
        from ..parsers import parse_savedvariables
        from pathlib import Path
        
        # Extract agent_mode from input
        agent_mode = input.agent_mode if hasattr(input, 'agent_mode') else False

        sources = []
        tests = []
        hub_logs = [] 
        hub_perf = {} # NEW: Hub performance data
        
        # Get latest reload from database
        latest = storage.get_latest_metrics()
        timestamp_str = None
        
        if latest and latest.get("timestamp"):
            timestamp_str = datetime.fromtimestamp(latest["timestamp"]).strftime("%Y-%m-%d %H:%M:%S")
        
        # Discover SavedVariables paths
        sv_paths = discover_saved_variables()
        
        # Parse BugGrabber errors (from first available account)
        errors = []
        for sv_path in sv_paths:
            buggrabber_file = sv_path / "!BugGrabber.lua"
            if buggrabber_file.exists():
                try:
                    content = buggrabber_file.read_text(encoding="utf-8", errors="replace")
                    buggrabber_data = parse_buggrabber(content)
                    errors = buggrabber_data.get("errors", [])
                    sources.append(create_source(
                        type="file",
                        id="buggrabber",
                        title="BugGrabber Errors",
                        location=str(buggrabber_file)
                    ))
                    break
                except Exception:
                    pass
        
        # Parse console buffer and libraries from MechanicDB (chat capture removed)
        console = []
        libraries = []
        api_tests = {"total": 0, "summary": {}, "by_namespace": {}, "tests": []}
        lua_eval = {"total": 0, "succeeded": 0, "failed": 0, "lastRun": None, "results": []}
        hub_logs = []
        hub_perf = {}
        for sv_path in sv_paths:
            mechanic_file = sv_path / "!Mechanic.lua"
            if mechanic_file.exists():
                try:
                    content = mechanic_file.read_text(encoding="utf-8", errors="replace")
                    variables = parse_savedvariables(content)
                    
                    # Find MechanicDB
                    db = variables.get("MechanicDB", {})
                    
                    # Get profile data (handle AceDB structure)
                    profile_data = db
                    if "profiles" in db:
                        # Get first available profile
                        profiles = db.get("profiles", {})
                        if profiles:
                            profile_name = list(profiles.keys())[0] if isinstance(profiles, dict) else None
                            if profile_name:
                                profile_data = profiles.get(profile_name, {})
                    
                    console = parse_console_from_mechanic_db(profile_data)
                    libraries = parse_libraries_from_mechanic_db(profile_data)
                    
                    # Hub-aware parsing: merge libraries from hub
                    hub_libs = parse_hub_libraries_from_mechanic_db(profile_data)
                    for hl in hub_libs:
                        if not any(l["name"] == hl["name"] for l in libraries):
                            libraries.append(hl)

                    sv_tests = parse_tests_from_mechanic_db(profile_data)
                    
                    # Extract hub logs for formatting later
                    hub_logs = parse_hub_logs_from_mechanic_db(profile_data)
                    hub_perf = parse_hub_performance_from_mechanic_db(profile_data)
                    
                    # Extract API Test Bench results
                    api_tests = parse_api_tests_from_mechanic_db(profile_data)
                    
                    # Extract Lua eval results
                    lua_eval = parse_lua_eval_from_mechanic_db(profile_data)
                    
                    # Merge with existing tests
                    test_map = {(t["addon"], t["name"]): t for t in tests}
                    for t in sv_tests:
                        test_map[(t["addon"], t["name"])] = t
                    tests = list(test_map.values())
                    
                    sources.append(create_source(
                        type="file",
                        id="mechanic-db",
                        title="MechanicDB Console",
                        location=str(mechanic_file)
                    ))
                    break
                except Exception:
                    pass
        
        # Get test results from latest reload
        if latest and latest.get("addons_data"):
            addons_data = latest["addons_data"]
            if isinstance(addons_data, dict):
                # Use a map to merge with SV results (preferring latest broadcast)
                test_map = {(t["addon"], t["name"]): t for t in tests}
                
                for addon_name, data in addons_data.items():
                    if isinstance(data, dict) and "tests" in data:
                        for test in data.get("tests", []):
                            if isinstance(test, dict):
                                raw_name = test.get("name") or test.get("id", "unnamed")
                                pretty_name = normalize_test_name(addon_name, raw_name)
                                t_obj = {
                                    "addon": addon_name,
                                    "name": pretty_name,
                                    "passed": test.get("passed", False),
                                }
                                test_map[(addon_name, pretty_name)] = t_obj
                
                tests = list(test_map.values())
        
        # ═══════════════════════════════════════════════════════════════════════
        # FORMAT AS MARKDOWN
        # ═══════════════════════════════════════════════════════════════════════
        
        lines = []
        
        if timestamp_str:
            lines.append(f"## Addon Output - {timestamp_str}\n")
        else:
            lines.append("## Addon Output - No reload data yet\n")
        
        # Libraries section (show at top for quick reference)
        if libraries:
            libs_str = ", ".join(f"{lib['name']} {lib['version']}" for lib in libraries[:6])
            if len(libraries) > 6:
                libs_str += f" (+{len(libraries) - 6} more)"
            lines.append(f"**Libraries:** {libs_str}\n")
        
        # Errors section
        if errors:
            if agent_mode:
                # Smart compression for agents
                compressed = compress_errors_for_agent(errors, max_per_addon=5)
                lines.append(f"### Errors ({compressed['total']} total, showing {compressed['shown']} unique)\n")
                for addon, addon_errors in compressed["by_addon"].items():
                    lines.append(f"**{addon}** ({len(addon_errors)} shown)")
                    for err in addon_errors:
                        msg = err['message']
                        msg_parts = msg.split(':', 3)
                        if len(msg_parts) > 3:
                            msg = msg_parts[3].strip()[:80]  # Truncate long messages
                        count_str = f" (x{err.get('counter', 1)})" if err.get('counter', 1) > 1 else ""
                        lines.append(f"  - `{err['file']}:{err['line']}`{count_str} {msg}")
                    lines.append("")
            else:
                # Full output
                lines.append(f"### Errors ({len(errors)})\n")
                for i, err in enumerate(errors, 1):
                    lines.append(f"{i}. **{err['addon']}/{err['file']}:{err['line']}**")
                    msg = err['message']
                    msg_parts = msg.split(':', 3)
                    if len(msg_parts) > 3:
                        msg = msg_parts[3].strip()
                    lines.append(f"   {msg}")
                    if err.get('counter', 1) > 1:
                        lines.append(f"   _(occurred {err['counter']} times)_")
                    lines.append("")
        else:
            lines.append("### Errors\n")
            lines.append("No errors.\n")
        
        # Tests section
        if tests:
            lines.append("### Tests\n")
            # Group by addon
            by_addon: Dict[str, dict] = {}
            for test in tests:
                addon = test.get("addon", "Unknown")
                if addon not in by_addon:
                    by_addon[addon] = {"passed": 0, "failed": 0, "failures": []}
                if test.get("passed"):
                    by_addon[addon]["passed"] += 1
                else:
                    by_addon[addon]["failed"] += 1
                    by_addon[addon]["failures"].append(test.get("name", "unnamed"))
            
            for addon, data in by_addon.items():
                lines.append(f"- **{addon}**: {data['passed']} passed, {data['failed']} failed")
                for failure in data["failures"]:
                    lines.append(f"  - FAIL: `{failure}`")
            lines.append("")
        else:
            lines.append("### Tests\n")
            lines.append("No test results.\n")
        
        # Console section
        if console:
            if agent_mode:
                # Sequence dedupe for agent mode
                deduped = sequence_dedup_console(console[-50:])
                unique_count = len(deduped)
                lines.append(f"### Console ({len(console)} entries, {unique_count} unique)\n")
                lines.append("```")
                for entry in deduped:
                    source = entry.get("source", "")
                    category = entry.get("category", "")
                    message = entry.get("message", "")
                    count = entry.get("count", 1)
                    cat_str = f" [{category}]" if category else ""
                    count_str = f" (x{count})" if count > 1 else ""
                    lines.append(f"[{source}]{cat_str} {message}{count_str}")
                lines.append("```")
            else:
                lines.append(f"### Console (last {len(console)} entries)\n")
                lines.append("```")
                for entry in console[-50:]:  # Last 50
                    source = entry.get("source", "")
                    category = entry.get("category", "")
                    message = entry.get("message", "")
                    cat_str = f" {category}" if category else ""
                    lines.append(f"[{source}]{cat_str} {message}")
                lines.append("```")
        else:
            lines.append("### Console\n")
            lines.append("No console output persisted. Do `/reload` in-game to save logs.\n")


        # Hub Logs section (Consolidated from other addons)
        if hub_logs:
            lines.append("### Addon Diagnostics (Hub)\n")
            for hl in hub_logs:
                addon = hl["addon"]
                # Skip !Mechanic if it's already shown in main console
                if addon == "!Mechanic": continue
                lines.append(f"**{addon}**")
                lines.append("```")
                # Last 20 lines for brevity in output
                for line in hl["lines"][-20:]:
                    # Ensure line is a string (may be a dict from Lua)
                    if isinstance(line, dict):
                        line = line.get("message", str(line))
                    lines.append(str(line))
                lines.append("```\n")
        
        # API Test Bench section
        if api_tests["total"] > 0:
            summary = api_tests["summary"]
            lines.append(f"### API Test Bench ({api_tests['total']} tested)\n")
            lines.append(f"**Summary:** {summary.get('pass', 0)} pass, {summary.get('secret', 0)} secret, {summary.get('error', 0)} error\n")
            
            if agent_mode:
                # Compact view: just show namespaces with issues
                for ns, ns_tests in api_tests["by_namespace"].items():
                    secrets = [t for t in ns_tests if t.get("status") == "secret"]
                    errors = [t for t in ns_tests if t.get("status") == "error"]
                    if secrets or errors:
                        lines.append(f"**{ns}**: {len(secrets)} secret, {len(errors)} error")
                        for t in (errors + secrets)[:3]:  # Max 3 per namespace
                            lines.append(f"  - `{t['key']}` ({t['status']})")
            else:
                # Agent-friendly detailed view with signatures and results
                for ns, ns_tests in sorted(api_tests["by_namespace"].items()):
                    lines.append(f"\n#### {ns}\n")
                    for t in ns_tests:
                        status = t.get("status", "unknown")
                        status_icon = {"pass": "✓", "secret": "⚠", "error": "✗", "protected": "🔒"}.get(status, "?")
                        
                        lines.append(f"**{status_icon} {t['key']}**")
                        
                        # Signature
                        if t.get("signature"):
                            lines.append(f"```")
                            lines.append(f"{t.get('funcPath', t['key'])}{t['signature']}")
                            lines.append(f"```")
                        
                        # Parameters used
                        if t.get("params_used"):
                            params_str = ", ".join(f"{k}={repr(v)}" for k, v in t["params_used"].items())
                            lines.append(f"**Called with:** `{params_str or '(no params)'}`")
                        
                        # Results
                        lines.append(f"**Status:** {status} | **Duration:** {t.get('duration', 0):.2f}ms")
                        if t.get("results"):
                            lines.append("**Returns:**")
                            lines.append("```lua")
                            results = t["results"]
                            if isinstance(results, dict):
                                for name, val in results.items():
                                    lines.append(f"  {name} = {val}")
                            elif isinstance(results, list):
                                # Protected/error results come as a list of messages
                                for msg in results:
                                    lines.append(f"  -- {msg}")
                            else:
                                lines.append(f"  {results}")
                            lines.append("```")
                        
                        # Copy-paste example
                        if t.get("funcPath"):
                            returns_def = t.get("returns_def") or []
                            return_vars = ", ".join(r.get("name", f"ret{i}") for i, r in enumerate(returns_def)) if returns_def else "result"
                            params_def = t.get("params_def") or []
                            param_example = ", ".join(p.get("name", "...") for p in params_def)
                            lines.append(f"**Example:** `local {return_vars} = {t['funcPath']}({param_example})`")
                        
                        lines.append("")  # Blank line between APIs
            lines.append("")
        
        # Lua Eval Results section
        if lua_eval["total"] > 0:
            lines.append(f"### Lua Eval Results ({lua_eval['total']} executed)\n")
            lines.append(f"**Summary:** {lua_eval['succeeded']} succeeded, {lua_eval['failed']} failed")
            if lua_eval.get("lastRun"):
                lines.append(f"**Last Run:** {lua_eval['lastRun']}\n")
            
            for r in lua_eval.get("results", []):
                label = r.get("label", "unknown")
                if r.get("success"):
                    result_val = r.get("result", "nil")
                    result_type = r.get("resultType", "?")
                    lines.append(f"✓ **{label}** → `{result_val}` ({result_type})")
                else:
                    err = r.get("error", "Unknown error")
                    lines.append(f"✗ **{label}** → {err}")
                
                # Show code if available (truncated)
                code = r.get("code", "")
                if code:
                    code_preview = code[:60] + "..." if len(code) > 60 else code
                    lines.append(f"  Code: `{code_preview}`")
            lines.append("")
        
        output = "\n".join(lines)
        
        # Build result
        result = AddonOutputResult(
            output=output,
            error_count=len(errors),
            test_count=len(tests),
            console_count=len(console),
            api_test_count=api_tests["total"],
            lua_eval_count=lua_eval["total"],
            timestamp=timestamp_str,
            errors=errors,
            tests=tests,
            console=console,
            libraries=libraries,
            perf=hub_perf,
            api_tests=api_tests,
            lua_eval=lua_eval
        )
        
        if not errors and not tests and not console and api_tests["total"] == 0 and lua_eval["total"] == 0:
            return success(
                data=result,
                reasoning="No addon data available. Do /reload in-game to generate data.",
                sources=sources,
                confidence=0.8
            )
        
        return success(
            data=result,
            reasoning=f"Addon output: {len(errors)} errors, {len(tests)} tests, {len(console)} console, {api_tests['total']} API tests, {lua_eval['total']} Lua evals",
            sources=sources,
            confidence=0.95
        )
