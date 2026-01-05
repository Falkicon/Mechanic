"""
Enhanced MCP Server for Mechanic Desktop.

This module creates a showcase MCP server with:
- Rich tool descriptions with parameter documentation
- Category-based organization
- Usage examples embedded in descriptions
- Clean human-readable output summaries
- Full Pydantic schema exposure to AI agents
"""

import json
from typing import Any, Dict, List, Optional, Type
from pydantic import BaseModel


# ═══════════════════════════════════════════════════════════════════════════════
# TOOL METADATA - Categorization and Examples
# ═══════════════════════════════════════════════════════════════════════════════

TOOL_CATEGORIES = {
    # Core Operations
    "sv": "SavedVariables - Parse and discover WoW addon data files",
    "reload": "Reload - Trigger in-game reloads",
    "server": "Server - Control the Mechanic server",
    "dashboard": "Dashboard - Metrics and monitoring",

    # Development Tools
    "addon": "Addon - Validate, lint, format, and test addons",
    "libs": "Libraries - Manage addon dependencies",
    "locale": "Localization - Validate and extract locale strings",
    "atlas": "Atlas - Search Blizzard UI atlas icons",

    # API & Sandbox
    "api": "API - Search and explore WoW APIs",
    "lua": "Lua - Queue code for in-game execution",
    "sandbox": "Sandbox - Test Lua code with WoW API stubs",

    # Release Pipeline
    "version": "Version - Bump addon versions",
    "changelog": "Changelog - Update changelogs",
    "git": "Git - Commit and tag releases",
    "release": "Release - Full release workflow",

    # Environment
    "env": "Environment - Configuration and status",
    "tools": "Tools - Development tool status",
    "docs": "Docs - Generate and analyze documentation",

    # Research & Assets
    "research": "Research - Web search for addon development info",
    "assets": "Assets - Manage addon assets (PNG to TGA)",
    "perf": "Performance - Profile and baseline performance",
}

# ═══════════════════════════════════════════════════════════════════════════════
# TOOL ANNOTATIONS (2025 MCP Spec)
# ═══════════════════════════════════════════════════════════════════════════════
# These hints help agents understand tool behavior for safer, smarter execution.

TOOL_ANNOTATIONS = {
    # Destructive tools - require confirmation, cannot be undone
    "server.shutdown": {"destructive": True, "idempotent": False},
    "git.commit": {"destructive": True, "idempotent": False},
    "git.tag": {"destructive": True, "idempotent": False},
    "release.all": {"destructive": True, "idempotent": False},
    "version.bump": {"destructive": True, "idempotent": True},
    "changelog.add": {"destructive": True, "idempotent": False},
    "libs.sync": {"destructive": True, "idempotent": True},

    # Read-only tools - safe to call anytime, no side effects
    "sv.parse": {"readOnly": True, "idempotent": True},
    "sv.discover": {"readOnly": True, "idempotent": True},
    "dashboard.metrics": {"readOnly": True, "idempotent": True},
    "addon.validate": {"readOnly": True, "idempotent": True},
    "addon.lint": {"readOnly": True, "idempotent": True},
    "addon.deprecations": {"readOnly": True, "idempotent": True},
    "addon.output": {"readOnly": True, "idempotent": True},
    "addon.deadcode": {"readOnly": True, "idempotent": True},
    "addon.security": {"readOnly": True, "idempotent": True},
    "addon.complexity": {"readOnly": True, "idempotent": True},
    "docs.stale": {"readOnly": True, "idempotent": True},
    "libs.check": {"readOnly": True, "idempotent": True},
    "api.search": {"readOnly": True, "idempotent": True},
    "api.info": {"readOnly": True, "idempotent": True},
    "api.list": {"readOnly": True, "idempotent": True},
    "api.stats": {"readOnly": True, "idempotent": True},
    "atlas.search": {"readOnly": True, "idempotent": True},
    "locale.validate": {"readOnly": True, "idempotent": True},
    "locale.extract": {"readOnly": True, "idempotent": True},
    "env.status": {"readOnly": True, "idempotent": True},
    "tools.status": {"readOnly": True, "idempotent": True},
    "sandbox.status": {"readOnly": True, "idempotent": True},
    "lua.results": {"readOnly": True, "idempotent": True},
    "perf.report": {"readOnly": True, "idempotent": True},
    "perf.list": {"readOnly": True, "idempotent": True},
    "assets.list": {"readOnly": True, "idempotent": True},

    # Open world - fetches from internet, may have prompt injection risk
    "research.query": {"openWorld": True, "idempotent": True},

    # Idempotent mutators - safe to retry
    "addon.format": {"idempotent": True},
    "addon.sync": {"idempotent": True},
    "assets.sync": {"idempotent": True},
    "sandbox.generate": {"idempotent": True},
    "api.populate": {"idempotent": True},
    "api.generate": {"idempotent": True},
    "api.refresh": {"idempotent": True},
    "atlas.scan": {"idempotent": True},
    "perf.baseline": {"idempotent": True},
    "perf.compare": {"idempotent": True},
}

# Human-readable titles for tools (2025 MCP spec)
TOOL_TITLES = {
    "sv.parse": "Parse SavedVariables",
    "sv.discover": "Discover SV Paths",
    "addon.validate": "Validate Addon TOC",
    "addon.lint": "Lint Addon Code",
    "addon.format": "Format Addon Code",
    "addon.test": "Run Addon Tests",
    "addon.deprecations": "Check Deprecations",
    "addon.output": "Get Addon Output",
    "addon.deadcode": "Detect Dead Code",
    "addon.security": "Security Analysis",
    "addon.complexity": "Complexity Analysis",
    "docs.stale": "Detect Stale Docs",
    "addon.create": "Create New Addon",
    "addon.sync": "Sync to WoW Clients",
    "libs.check": "Check Library Status",
    "libs.sync": "Sync Libraries",
    "libs.init": "Initialize libs.json",
    "api.search": "Search WoW APIs",
    "api.info": "Get API Details",
    "api.list": "List APIs by Namespace",
    "api.stats": "API Statistics",
    "api.queue": "Queue API Tests",
    "atlas.search": "Search Atlas Icons",
    "atlas.scan": "Scan Atlas Database",
    "locale.validate": "Validate Locales",
    "locale.extract": "Extract Strings",
    "version.bump": "Bump Version",
    "changelog.add": "Add Changelog Entry",
    "git.commit": "Git Commit",
    "git.tag": "Git Tag",
    "release.all": "Full Release",
    "sandbox.exec": "Execute Lua",
    "sandbox.test": "Run Sandbox Tests",
    "research.query": "Research Query",
    "perf.baseline": "Record Baseline",
    "perf.compare": "Compare Performance",
}

# Intent-based descriptions - tell *when* to use the tool (2025 best practice)
TOOL_INTENTS = {
    "sv.parse": "Use this when you need to extract addon data from a SavedVariables file after a game session.",
    "sv.discover": "Use this first to find all available SavedVariables paths before parsing.",
    "addon.validate": "Use this to check if an addon's TOC file is valid before release.",
    "addon.lint": "Use this to find code quality issues and potential bugs in addon Lua code.",
    "addon.format": "Use this to auto-format Lua code to match style guidelines.",
    "addon.test": "Use this to run unit tests for an addon.",
    "addon.deprecations": "Use this to find deprecated API calls that need updating for Midnight.",
    "addon.output": "Use this to get the latest errors, test results, and console output from the game.",
    "addon.deadcode": "Use this to find unused functions, orphaned files, dead exports, and other dead code in addon source.",
    "addon.security": "Use this to find security issues like combat lockdown violations, secret value leaks, taint risks, and unsafe eval patterns.",
    "addon.complexity": "Use this to find code complexity issues like deep nesting, long functions, magic numbers, and duplicate code.",
    "docs.stale": "Use this to find stale, outdated, or broken documentation including dead links, old version references, and docs not updated with code.",
    "libs.check": "Use this to verify which libraries are installed and if updates are available.",
    "libs.sync": "Use this to download and update addon dependencies.",
    "api.search": "Use this when looking for a WoW API by name pattern.",
    "api.info": "Use this to get detailed documentation for a specific API.",
    "api.list": "Use this to browse all APIs in a namespace like C_Spell.",
    "atlas.search": "Use this to find Blizzard UI atlas icons by name pattern.",
    "locale.validate": "Use this to check if all locale files have complete translations.",
    "locale.extract": "Use this to find strings in code that need localization.",
    "version.bump": "Use this to update the addon version in the TOC file.",
    "changelog.add": "Use this to add an entry to CHANGELOG.md for a new version.",
    "git.commit": "Use this to stage and commit addon changes.",
    "git.tag": "Use this to create a version tag for release.",
    "release.all": "Use this for a complete release: bump, changelog, commit, and tag in one step.",
    "sandbox.exec": "Use this to test Lua code with WoW API stubs without launching the game.",
    "research.query": "Use this to search the web for addon development information and best practices.",
    "perf.baseline": "Use this to record current performance metrics as a baseline.",
    "perf.compare": "Use this to check for performance regressions against baseline.",
}

TOOL_EXAMPLES = {
    # Core Operations
    "sv.parse": '{"file_path": "C:/WoW/_retail_/WTF/Account/USER/SavedVariables/!Mechanic.lua"}',
    "sv.discover": "{}",
    "dashboard.metrics": "{}",
    "server.shutdown": "{}",

    # Addon Development
    "addon.validate": '{"addon": "Weekly"}',
    "addon.lint": '{"addon": "Weekly"}',
    "addon.format": '{"addon": "Weekly", "check": true}',
    "addon.test": '{"addon": "Weekly"}',
    "addon.deprecations": '{"addon": "Weekly"}',
    "addon.output": '{"agent_mode": true}',
    "addon.deadcode": '{"addon": "Weekly", "include_suspicious": false}',
    "addon.security": '{"addon": "Weekly"}',
    "addon.complexity": '{"addon": "Weekly", "max_nesting": 5}',
    "docs.stale": '{"addon": "Weekly", "commits_threshold": 10}',
    "addon.create": '{"name": "MyNewAddon", "path": "C:/WoW/_dev_"}',
    "addon.sync": '{"addon": "Weekly"}',

    # Libraries
    "libs.check": '{"addon": "Weekly"}',
    "libs.sync": '{"addon": "Weekly"}',
    "libs.init": '{"addon": "Weekly"}',

    # API Reference
    "api.search": '{"pattern": "GetSpellInfo"}',
    "api.info": '{"api_name": "C_Spell.GetSpellInfo"}',
    "api.list": '{"namespace": "C_Spell"}',
    "api.stats": "{}",
    "api.queue": '{"apis": ["C_Spell.GetSpellInfo", "GetTime"]}',
    "api.populate": "{}",
    "api.generate": "{}",
    "api.refresh": "{}",

    # Atlas Icons
    "atlas.scan": "{}",
    "atlas.search": '{"pattern": "raid*"}',

    # Localization
    "locale.validate": '{"addon": "Weekly"}',
    "locale.extract": '{"addon": "Weekly"}',

    # Lua Execution
    "lua.queue": '{"snippets": ["print(GetTime())", "print(UnitName(\\"player\\"))"]}',
    "lua.results": "{}",

    # Sandbox Testing
    "sandbox.generate": "{}",
    "sandbox.status": "{}",
    "sandbox.exec": '{"code": "print(GetSpellInfo(1))"}',
    "sandbox.test": '{"addon": "Weekly"}',

    # Release Pipeline
    "version.bump": '{"addon": "Weekly", "version": "1.2.0"}',
    "changelog.add": '{"addon": "Weekly", "version": "1.2.0", "message": "Added new feature", "category": "Added"}',
    "git.commit": '{"addon": "Weekly", "message": "Fix bug in timer"}',
    "git.tag": '{"addon": "Weekly", "version": "1.2.0"}',
    "release.all": '{"addon": "Weekly", "version": "1.2.0", "message": "Major update"}',

    # Environment
    "env.status": "{}",
    "tools.status": "{}",
    "docs.generate": '{"format": "markdown"}',

    # Research & Assets
    "research.query": '{"query": "how to use C_Spell.GetSpellInfo in WoW addon"}',
    "assets.sync": '{"addon": "Weekly"}',
    "assets.list": '{"addon": "Weekly"}',

    # Performance
    "perf.baseline": '{"addon": "Weekly"}',
    "perf.compare": '{"addon": "Weekly"}',
    "perf.report": '{"addon": "Weekly"}',
    "perf.list": "{}",
}


def get_category_for_tool(tool_name: str) -> str:
    """Get the category prefix and description for a tool."""
    prefix = tool_name.split(".")[0] if "." in tool_name else tool_name
    return TOOL_CATEGORIES.get(prefix, "Miscellaneous")


def get_example_for_tool(tool_name: str) -> Optional[str]:
    """Get an example input for a tool."""
    return TOOL_EXAMPLES.get(tool_name)


# ═══════════════════════════════════════════════════════════════════════════════
# PYDANTIC SCHEMA EXTRACTION
# ═══════════════════════════════════════════════════════════════════════════════

def extract_schema_from_pydantic(model: Type[BaseModel]) -> Dict[str, Any]:
    """Extract parameter info from a Pydantic model for MCP tool description."""
    schema = model.model_json_schema()

    params = []
    properties = schema.get("properties", {})
    required = set(schema.get("required", []))

    for name, prop in properties.items():
        param_type = prop.get("type", "any")
        description = prop.get("description", "")
        default = prop.get("default")
        is_required = name in required

        # Handle anyOf for Optional types
        if "anyOf" in prop:
            types = [t.get("type") for t in prop["anyOf"] if t.get("type") != "null"]
            param_type = types[0] if types else "any"

        params.append({
            "name": name,
            "type": param_type,
            "description": description,
            "required": is_required,
            "default": default,
        })

    return {
        "params": params,
        "json_schema": schema,
    }


def get_input_schema_from_handler(func) -> Optional[Type[BaseModel]]:
    """Extract the input schema from a decorated command handler."""
    # Check for __afd_command__ attached by @define_command
    if hasattr(func, "__afd_command__"):
        metadata = func.__afd_command__
        return getattr(metadata, "input_schema", None)
    return None


# ═══════════════════════════════════════════════════════════════════════════════
# RICH DESCRIPTION BUILDER
# ═══════════════════════════════════════════════════════════════════════════════

def get_annotations_for_tool(tool_name: str) -> Dict[str, Any]:
    """Get annotations for a tool."""
    return TOOL_ANNOTATIONS.get(tool_name, {})


def get_title_for_tool(tool_name: str) -> Optional[str]:
    """Get human-readable title for a tool."""
    return TOOL_TITLES.get(tool_name)


def get_intent_for_tool(tool_name: str) -> Optional[str]:
    """Get intent description for a tool."""
    return TOOL_INTENTS.get(tool_name)


def build_rich_description(
    cmd_name: str,
    base_description: str,
    input_schema: Optional[Type[BaseModel]] = None,
    fallback_params: Optional[List[Any]] = None,
) -> str:
    """Build a rich, agent-friendly tool description (2025 MCP best practices).

    Format:
    [Category] [Badges] Title (if different from name)

    Base description.
    Intent: When to use this tool.

    Parameters:
      - param_name (type, required): Description

    Example: {"param": "value"}
    """
    parts = []

    # Category and badges line
    category = get_category_for_tool(cmd_name)
    annotations = get_annotations_for_tool(cmd_name)

    badges = []
    if annotations.get("readOnly"):
        badges.append("READ-ONLY")
    if annotations.get("destructive"):
        badges.append("DESTRUCTIVE")
    if annotations.get("openWorld"):
        badges.append("EXTERNAL")
    if annotations.get("idempotent"):
        badges.append("RETRY-SAFE")

    header = f"[{category}]"
    if badges:
        header += f" [{' | '.join(badges)}]"

    parts.append(header)

    # Title if we have one different from the description
    title = get_title_for_tool(cmd_name)
    if title:
        parts.append(f"Title: {title}")

    parts.append("")
    parts.append(base_description)

    # Intent - when to use this tool (2025 best practice)
    intent = get_intent_for_tool(cmd_name)
    if intent:
        parts.append("")
        parts.append(f"When to use: {intent}")

    # Parameters from Pydantic schema (preferred)
    params = []
    if input_schema:
        schema_info = extract_schema_from_pydantic(input_schema)
        params = schema_info["params"]
    elif fallback_params:
        # Use CommandParameter objects from CommandDefinition
        for p in fallback_params:
            params.append({
                "name": getattr(p, "name", str(p)),
                "type": getattr(p, "type", "any"),
                "description": getattr(p, "description", ""),
                "required": getattr(p, "required", False),
                "default": getattr(p, "default", None),
            })

    if params:
        parts.append("")
        parts.append("Parameters:")
        for p in params:
            req_str = "required" if p["required"] else "optional"
            default_str = ""
            if not p["required"] and p["default"] is not None:
                default_str = f", default: {json.dumps(p['default'])}"

            param_line = f"  - {p['name']} ({p['type']}, {req_str}{default_str})"
            if p["description"]:
                param_line += f": {p['description']}"
            parts.append(param_line)

    # Example if available
    example = get_example_for_tool(cmd_name)
    if example:
        parts.append("")
        parts.append(f"Example: {example}")

    return "\n".join(parts)


# ═══════════════════════════════════════════════════════════════════════════════
# CLEAN OUTPUT FORMATTER
# ═══════════════════════════════════════════════════════════════════════════════

def _summarize_list(items: List[Any], max_show: int = 3) -> str:
    """Summarize a list of items for display."""
    if not items:
        return "[]"

    count = len(items)

    # Try to get meaningful identifiers
    if all(isinstance(item, dict) for item in items):
        # Find a good identifier field
        for id_field in ["name", "addon", "library", "path", "id", "api", "pattern"]:
            if all(id_field in item for item in items[:max_show]):
                preview = [str(item[id_field]) for item in items[:max_show]]
                if count > max_show:
                    return f"[{', '.join(preview)}, ...+{count - max_show} more]"
                return f"[{', '.join(preview)}]"
        return f"[{count} objects]"

    elif all(isinstance(item, str) for item in items):
        preview = [item[:40] + "..." if len(item) > 40 else item for item in items[:max_show]]
        if count > max_show:
            return f"[{', '.join(preview)}, ...+{count - max_show} more]"
        return f"[{', '.join(preview)}]"

    return f"[{count} items]"


def format_result_for_agent(result: Dict[str, Any]) -> str:
    """Format a CommandResult dict for agent consumption.

    Returns a clean summary followed by JSON data.
    Format:
      SUCCESS/FAILED
      Summary: <reasoning>
      Key Findings: <extracted metrics>
      Sources: <where data came from>

      --- Full Response ---
      <JSON>
    """
    lines = []

    if result.get("success"):
        # Success case - build a clean summary
        lines.append("SUCCESS")

        if result.get("reasoning"):
            lines.append(f"Summary: {result['reasoning']}")

        # Add key metrics from data
        data = result.get("data", {})
        if isinstance(data, dict):
            # Extract and format key fields for summary
            findings = []

            # Priority fields that are most useful
            priority_keys = [
                "valid", "count", "total", "found", "passed", "failed",
                "errors", "warnings", "version", "status", "path",
            ]

            for key in priority_keys:
                if key in data:
                    value = data[key]
                    if isinstance(value, bool):
                        findings.append(f"{key}: {'yes' if value else 'no'}")
                    elif isinstance(value, list):
                        if key in ("errors", "warnings") and value:
                            # Show first error/warning for context
                            first_msg = str(value[0])[:60]
                            findings.append(f"{key}: {len(value)} - first: \"{first_msg}\"")
                        else:
                            findings.append(f"{key}: {len(value)}")
                    elif value is not None:
                        findings.append(f"{key}: {value}")

            # Look for list results (common pattern)
            for key in ["apis", "results", "addons", "libraries", "paths", "matches", "files"]:
                if key in data and isinstance(data[key], list):
                    summary = _summarize_list(data[key])
                    findings.append(f"{key}: {summary}")
                    break  # Only show one list summary

            if findings:
                lines.append("Key Findings: " + ", ".join(findings))

        # Sources for transparency
        if result.get("sources"):
            source_titles = [s.get("title", s.get("id", "unknown")) for s in result["sources"]]
            lines.append(f"Sources: {', '.join(source_titles)}")

        # Confidence if present and meaningful
        confidence = result.get("confidence")
        if confidence is not None and confidence < 1.0:
            lines.append(f"Confidence: {int(confidence * 100)}%")

    else:
        # Error case
        error = result.get("error", {})
        lines.append("FAILED")
        lines.append(f"Error: [{error.get('code', 'UNKNOWN')}] {error.get('message', 'Unknown error')}")
        if error.get("suggestion"):
            lines.append(f"Hint: {error['suggestion']}")
        if error.get("retryable"):
            lines.append("Note: This error may be transient - retry may succeed")

    lines.append("")
    lines.append("--- Full Response ---")
    lines.append(json.dumps(result, indent=2, default=str))

    return "\n".join(lines)


# ═══════════════════════════════════════════════════════════════════════════════
# MCP SERVER FACTORY
# ═══════════════════════════════════════════════════════════════════════════════

def create_mcp_server(afd_server, verbose: bool = False):
    """Create an enhanced MCP server from an AFD server.

    Args:
        afd_server: The AFD MCPServer instance with registered commands.
        verbose: If True, print registration info to stderr.

    Returns:
        A FastMCP server instance ready to run.
    """
    from mcp.server.fastmcp import FastMCP

    mcp = FastMCP("mechanic")
    commands = afd_server.list_commands()

    # Group commands by category for logging and manifest
    by_category: Dict[str, List[str]] = {}

    for cmd in commands:
        _register_enhanced_tool(mcp, afd_server, cmd)

        # Track for summary
        prefix = cmd.name.split(".")[0] if "." in cmd.name else "misc"
        if prefix not in by_category:
            by_category[prefix] = []
        by_category[prefix].append(cmd.name)

    # Register a special "manifest" tool for agent discovery
    @mcp.tool(
        name="mechanic-manifest",
        description="""[Meta] Get a structured overview of all available Mechanic tools.

Returns a categorized list of all tools with descriptions, organized by function.
Use this first to understand what tools are available before calling other tools.

Parameters: None

Example: {}"""
    )
    async def get_manifest() -> str:
        """Return a structured manifest of all available tools."""
        manifest = {
            "name": "Mechanic MCP Server",
            "description": "WoW addon development toolkit",
            "version": "0.2.1",
            "total_tools": len(commands),
            "categories": {}
        }

        for cat, tools in sorted(by_category.items()):
            cat_desc = TOOL_CATEGORIES.get(cat, cat.capitalize())
            manifest["categories"][cat] = {
                "description": cat_desc,
                "tools": sorted(tools),
                "count": len(tools),
            }

        lines = [
            "SUCCESS",
            f"Summary: Mechanic provides {len(commands)} tools across {len(by_category)} categories",
            "",
            "Categories:",
        ]

        for cat in sorted(by_category.keys()):
            cat_info = manifest["categories"][cat]
            lines.append(f"  {cat} ({cat_info['count']} tools): {cat_info['description']}")

        lines.append("")
        lines.append("Quick Start:")
        lines.append("  - addon.validate: Check addon for issues")
        lines.append("  - addon.output: Get errors/tests from last reload")
        lines.append("  - api.search: Find WoW APIs by name")
        lines.append("  - libs.check: Check library status")

        lines.append("")
        lines.append("--- Full Response ---")
        lines.append(json.dumps(manifest, indent=2))

        return "\n".join(lines)

    if verbose:
        import sys
        print(f"\nMechanic MCP Server", file=sys.stderr)
        print(f"Tools: {len(commands) + 1} total across {len(by_category)} categories", file=sys.stderr)
        for cat in sorted(by_category.keys()):
            print(f"  {cat}: {len(by_category[cat])} tools", file=sys.stderr)
        print("", file=sys.stderr)

    return mcp


def _register_enhanced_tool(mcp_server, afd_server, cmd):
    """Register an AFD command as an enhanced MCP tool.

    This creates a tool with:
    - Rich description including parameters and examples
    - Clean formatted output with summary and JSON
    - Proper kwargs unwrapping for Claude Code
    - Robust error handling with logging
    """
    import sys
    import traceback
    
    # Store original name for AFD execution
    afd_name = cmd.name
    # Use dashes instead of dots for Cursor compatibility
    # Cursor's agent tool injection doesn't handle dots in tool names
    mcp_tool_name = cmd.name.replace(".", "-")

    # Try to get input schema from the handler
    input_schema = None
    handler = getattr(cmd, "handler", None)
    if handler:
        input_schema = get_input_schema_from_handler(handler)

    # Fallback: use parameters from CommandDefinition if no schema
    parameters_from_def = getattr(cmd, "parameters", [])

    # Build the rich description (use original dot-notation name for metadata lookups)
    rich_description = build_rich_description(
        afd_name,
        cmd.description,
        input_schema,
        parameters_from_def,
    )

    @mcp_server.tool(name=mcp_tool_name, description=rich_description)
    async def tool_handler(**kwargs) -> str:
        """MCP tool handler with enhanced output formatting and error handling."""
        
        try:
            # Handle Claude Code's parameter wrapping
            params = kwargs

            # Unwrap if nested under 'kwargs' key
            if "kwargs" in params and len(params) == 1:
                inner = params["kwargs"]
                if isinstance(inner, dict):
                    params = inner
                elif isinstance(inner, str):
                    try:
                        params = json.loads(inner) if inner else {}
                    except json.JSONDecodeError:
                        params = {}



            # Execute the command using original AFD name (dot notation)
            result = await afd_server.execute(afd_name, params)
            

            
            result_dict = result.model_dump()



            # Return formatted output
            formatted = format_result_for_agent(result_dict)
            

            
            return formatted
            
        except Exception as e:
            # Log the full error to stderr for debugging
            error_msg = f"[MCP ERROR] {afd_name} failed: {type(e).__name__}: {e}"
            print(error_msg, file=sys.stderr)
            traceback.print_exc(file=sys.stderr)
            
            # Return a clean error response to the agent
            error_result = {
                "success": False,
                "data": None,
                "error": {
                    "code": "MCP_EXECUTION_ERROR",
                    "message": f"Command '{afd_name}' failed: {str(e)}",
                    "suggestion": "Check the Mechanic server logs for details",
                    "retryable": True,
                },
                "reasoning": None,
                "sources": None,
                "confidence": None,
            }
            return format_result_for_agent(error_result)

    return tool_handler

