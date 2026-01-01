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
    timestamp: Optional[str] = Field(None, description="Last reload timestamp")
    # Raw data for dashboard rendering
    errors: List[Dict[str, Any]] = Field(default_factory=list, description="Raw error objects")
    tests: List[Dict[str, Any]] = Field(default_factory=list, description="Raw test objects")
    console: List[Dict[str, Any]] = Field(default_factory=list, description="Raw console entries")


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
        
        # Parse console buffer from MechanicDB
        console = []
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
        tests = []
        if latest and latest.get("addons_data"):
            addons_data = latest["addons_data"]
            if isinstance(addons_data, dict):
                for addon_name, data in addons_data.items():
                    if isinstance(data, dict) and "tests" in data:
                        for test in data.get("tests", []):
                            if isinstance(test, dict):
                                tests.append({
                                    "addon": addon_name,
                                    "name": test.get("name", "unnamed"),
                                    "passed": test.get("passed", False),
                                })
        
        # ═══════════════════════════════════════════════════════════════════════
        # FORMAT AS MARKDOWN
        # ═══════════════════════════════════════════════════════════════════════
        
        lines = []
        
        if timestamp_str:
            lines.append(f"## Addon Output - {timestamp_str}\n")
        else:
            lines.append("## Addon Output - No reload data yet\n")
        
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
        
        output = "\n".join(lines)
        
        # Build result
        result = AddonOutputResult(
            output=output,
            error_count=len(errors),
            test_count=len(tests),
            console_count=len(console),
            timestamp=timestamp_str,
            errors=errors,
            tests=tests,
            console=console,
        )
        
        if not errors and not tests and not console:
            return success(
                data=result,
                reasoning="No addon data available. Do /reload in-game to generate data.",
                sources=sources,
                confidence=0.8
            )
        
        return success(
            data=result,
            reasoning=f"Addon output: {len(errors)} errors, {len(tests)} tests, {len(console)} console entries",
            sources=sources,
            confidence=0.95
        )
