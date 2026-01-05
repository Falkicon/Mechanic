"""
Lua Sandbox Commands for Mechanic Desktop.

Provides offline testing of addon logic:
- sandbox.generate: Generate WoW API stubs from APIDefs
- sandbox.exec: Execute Lua code in sandbox with stubs
"""

import re
import subprocess
from pathlib import Path
from typing import Any, Dict, List, Optional

from afd import CommandResult, success, error
from afd.core.metadata import create_source
from pydantic import BaseModel, Field

from ..config import get_config, find_addon_path


# ═══════════════════════════════════════════════════════════════════════════════
# SCHEMAS
# ═══════════════════════════════════════════════════════════════════════════════

class GenerateInput(BaseModel):
    namespace: Optional[str] = Field(None, description="Specific namespace to generate (e.g., 'C_Spell'). If not provided, generates all.")
    force: bool = Field(False, description="Regenerate even if stubs exist")


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
    addon: Optional[str] = Field(None, description="Name of addon to load before execution (looks in _dev_ folder)")
    load_stubs: bool = Field(True, description="Whether to load WoW API stubs")


class ExecResult(BaseModel):
    result: Optional[str] = None
    output: str = ""
    error: Optional[str] = None
    exit_code: int = 0


class TestInput(BaseModel):
    addon: str = Field(..., description="Name of addon to test (looks in _dev_ folder)")
    filter: Optional[str] = Field(None, description="Filter pattern for test names")


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
    spec_files: List[str] = []    # *_spec.lua files run
    duration_ms: float = 0.0      # Total execution time


# ═══════════════════════════════════════════════════════════════════════════════

def find_mechanic_addon_path() -> Optional[Path]:
    """Find the Mechanic repo folder (with UI/APIDefs)."""
    config = get_config()
    if config.dev_path:
        # Check for Mechanic repo: _dev_/Mechanic/UI/APIDefs
        mechanic_repo = config.dev_path / "Mechanic"
        if (mechanic_repo / "UI" / "APIDefs").exists():
            return mechanic_repo
    return None


def find_dev_addon_path(addon_name: str) -> Optional[Path]:
    """Find an addon in the _dev_ folder."""
    # Use centralized addon discovery from config
    return find_addon_path(addon_name)


def find_sandbox_folder() -> Path:
    """Get the sandbox folder path."""
    config = get_config()
    if config.dev_path:
        return config.dev_path / "Mechanic" / "sandbox"
    # Fallback: relative to this file (for development)
    return Path(__file__).parent.parent.parent.parent.parent / "sandbox"


def parse_apidef_file(filepath: Path) -> List[Dict[str, Any]]:
    """
    Parse a single APIDefs Lua file and extract API definitions.
    
    Returns a list of API definitions with:
    - key: Full API path (e.g., "C_Spell.GetSpellInfo")
    - funcPath: Same as key
    - params: List of {name, type}
    - returns: List of {name, type, canBeSecret}
    - midnightImpact: "NORMAL", "RESTRICTED", "CONDITIONAL"
    - protected: bool
    """
    content = filepath.read_text(encoding="utf-8", errors="replace")
    
    apis = []
    
    # More robust approach: find each APIDefs["..."] line, then extract the block
    # by counting braces until we close the main table
    lines = content.split('\n')
    i = 0
    while i < len(lines):
        line = lines[i]
        
        # Look for APIDefs["key"] = {
        key_match = re.match(r'APIDefs\["([^"]+)"\]\s*=\s*\{', line)
        if key_match:
            key = key_match.group(1)
            
            # Collect lines until brace count returns to 0
            brace_count = 1  # We found the opening brace
            block_lines = [line]
            i += 1
            
            while i < len(lines) and brace_count > 0:
                block_lines.append(lines[i])
                brace_count += lines[i].count('{') - lines[i].count('}')
                i += 1
            
            # Now parse the full block
            block = '\n'.join(block_lines)
            
            api = {
                "key": key,
                "funcPath": key,
                "params": [],
                "returns": [],
                "midnightImpact": "NORMAL",
                "protected": False,
            }
            
            # Extract midnightImpact
            impact_match = re.search(r'midnightImpact\s*=\s*"([^"]+)"', block)
            if impact_match:
                api["midnightImpact"] = impact_match.group(1)
            
            # Extract protected - look for protected = true anywhere in block
            if re.search(r'protected\s*=\s*true', block):
                api["protected"] = True
            
            # Extract returns count (simplified)
            returns_match = re.search(r'returns\s*=\s*\{(.+?)\}', block, re.DOTALL)
            if returns_match:
                returns_content = returns_match.group(1)
                return_entries = re.findall(r'name\s*=\s*"([^"]+)"', returns_content)
                api["returns"] = [{"name": name} for name in return_entries]
            
            apis.append(api)
        else:
            i += 1
    
    return apis


def generate_stub_code(api: Dict[str, Any]) -> str:
    """Generate Lua stub code for a single API."""
    key = api["key"]
    protected = api.get("protected", False)
    impact = api.get("midnightImpact", "NORMAL")
    returns = api.get("returns", [])
    
    # Split namespace and function name
    parts = key.split(".")
    if len(parts) == 2:
        namespace, func_name = parts
    else:
        namespace = None
        func_name = key
    
    # Generate stub based on protection status
    if protected or impact == "RESTRICTED":
        # Error stub for protected APIs
        stub = f'''function {key}(...)
    error("{key} is protected/restricted - cannot be called in sandbox", 2)
end'''
    else:
        # Generate mock return values
        if len(returns) == 0:
            return_val = ""
        elif len(returns) == 1:
            return_val = "return nil  -- mock"
        else:
            return_val = f"return {', '.join(['nil'] * len(returns))}  -- mock"
        
        stub = f'''function {key}(...)
    {return_val}
end'''
    
    return stub


def generate_stubs_file(apis: List[Dict[str, Any]], output_path: Path) -> Dict[str, int]:
    """Generate the complete wow_stubs.lua file."""
    lines = [
        "-- WoW API Stubs for Sandbox Testing",
        "-- Auto-generated from Mechanic/UI/APIDefs",
        f"-- Generated: {__import__('datetime').datetime.now().isoformat()}",
        "",
        "-- Namespace setup",
    ]
    
    # Collect unique namespaces
    namespaces = set()
    for api in apis:
        parts = api["key"].split(".")
        if len(parts) == 2:
            namespaces.add(parts[0])
    
    # Initialize namespaces
    for ns in sorted(namespaces):
        lines.append(f"{ns} = {ns} or {{}}")
    
    lines.append("")
    lines.append("-- Basic WoW globals")
    lines.append("_G = _G or {}")
    lines.append("")
    
    # Group APIs by namespace
    by_namespace: Dict[str, List[Dict]] = {}
    for api in apis:
        parts = api["key"].split(".")
        ns = parts[0] if len(parts) == 2 else "_GLOBAL"
        by_namespace.setdefault(ns, []).append(api)
    
    protected_count = 0
    normal_count = 0
    
    # Generate stubs by namespace
    for ns in sorted(by_namespace.keys()):
        lines.append(f"-- {ns}")
        for api in by_namespace[ns]:
            stub = generate_stub_code(api)
            lines.append(stub)
            lines.append("")
            
            if api.get("protected") or api.get("midnightImpact") == "RESTRICTED":
                protected_count += 1
            else:
                normal_count += 1
    
    # Write file
    output_path.parent.mkdir(parents=True, exist_ok=True)
    output_path.write_text("\n".join(lines), encoding="utf-8")
    
    return {"protected": protected_count, "normal": normal_count}


# ═══════════════════════════════════════════════════════════════════════════════
# COMMANDS
# ═══════════════════════════════════════════════════════════════════════════════

def register_commands(server):
    """Register sandbox commands with the server."""
    
    @server.command(
        name="sandbox.generate",
        description="Generate WoW API stubs from APIDefs database for sandbox testing",
        input_schema=GenerateInput,
        output_schema=GenerateResult,
    )
    async def sandbox_generate(input: GenerateInput, context: Any = None) -> CommandResult[GenerateResult]:
        mechanic_path = find_mechanic_addon_path()
        
        if not mechanic_path:
            return error(
                code="MECHANIC_NOT_FOUND",
                message="Could not find Mechanic repo folder",
                suggestion="Ensure Mechanic repo is in _dev_ folder"
            )
        
        apidefs_path = mechanic_path / "UI" / "APIDefs"
        if not apidefs_path.exists():
            return error(
                code="APIDEFS_NOT_FOUND",
                message=f"APIDefs folder not found at {apidefs_path}",
                suggestion="Ensure Mechanic repo has UI/APIDefs folder"
            )
        
        # Find all API definition files
        if input.namespace:
            lua_files = list(apidefs_path.glob(f"{input.namespace}.lua"))
        else:
            lua_files = list(apidefs_path.glob("*.lua"))
        
        if not lua_files:
            return error(
                code="NO_APIDEFS",
                message="No APIDefs files found",
                suggestion="Check that APIDefs/*.lua files exist"
            )
        
        # Parse all files
        all_apis = []
        namespaces = []
        
        for lua_file in lua_files:
            namespace = lua_file.stem
            namespaces.append(namespace)
            apis = parse_apidef_file(lua_file)
            all_apis.extend(apis)
        
        # Generate stubs file
        sandbox_folder = find_sandbox_folder()
        output_path = sandbox_folder / "generated" / "wow_stubs.lua"
        
        stats = generate_stubs_file(all_apis, output_path)
        
        src = create_source(
            type="file",
            id="apidefs",
            title="APIDefs Database",
            location=str(apidefs_path)
        )
        
        return success(
            data=GenerateResult(
                stubs_generated=len(all_apis),
                namespaces_processed=sorted(namespaces),
                output_path=str(output_path),
                protected_count=stats["protected"],
                normal_count=stats["normal"],
            ),
            reasoning=f"Generated {len(all_apis)} API stubs from {len(namespaces)} namespaces. {stats['protected']} protected (will error), {stats['normal']} normal (mocked).",
            sources=[src],
            confidence=1.0
        )

    @server.command(
        name="sandbox.status",
        description="Get status of generated WoW API stubs",
        input_schema=StatusInput,
        output_schema=StatusResult,
    )
    async def sandbox_status(input: StatusInput, context: Any = None) -> CommandResult[StatusResult]:
        sandbox_folder = find_sandbox_folder()
        stubs_path = sandbox_folder / "generated" / "wow_stubs.lua"

        if not stubs_path.exists():
            return success(
                data=StatusResult(stubs_exist=False),
                reasoning="No stubs generated yet. Run sandbox.generate first."
            )

        # Get file stats
        import os
        from datetime import datetime
        stat = stubs_path.stat()
        last_modified = datetime.fromtimestamp(stat.st_mtime).isoformat()

        # Count APIs by parsing the generated file
        content = stubs_path.read_text(encoding="utf-8", errors="replace")

        # Count function definitions
        import re
        functions = re.findall(r'^function [A-Z]', content, re.MULTILINE)
        total_count = len(functions)

        # Count protected (those that throw errors)
        protected = re.findall(r'error\("[^"]+is protected/restricted', content)
        protected_count = len(protected)
        normal_count = total_count - protected_count

        return success(
            data=StatusResult(
                stubs_exist=True,
                stubs_path=str(stubs_path),
                stubs_generated=total_count,
                protected_count=protected_count,
                normal_count=normal_count,
                last_modified=last_modified,
            ),
            reasoning=f"Stubs ready: {total_count} APIs ({protected_count} protected, {normal_count} normal)"
        )

    @server.command(
        name="sandbox.exec",
        description="Execute Lua code in sandbox environment with WoW API stubs",
        input_schema=ExecInput,
        output_schema=ExecResult,
    )
    async def sandbox_exec(input: ExecInput, context: Any = None) -> CommandResult[ExecResult]:
        # Find Lua using the same pattern as other tools
        from ..setup import find_tool
        lua_path = find_tool("lua")
        
        if not lua_path:
            return error(
                code="LUA_NOT_FOUND",
                message="Lua executable not found in bin/ folder or PATH",
                suggestion="Run 'mech setup' or place lua.exe in desktop/bin/"
            )
        
        sandbox_folder = find_sandbox_folder()
        stubs_path = sandbox_folder / "generated" / "wow_stubs.lua"
        
        # Build the Lua script to execute
        lua_script_parts = []
        
        # Load stubs if requested
        if input.load_stubs and stubs_path.exists():
            lua_script_parts.append(f'dofile("{stubs_path.as_posix()}")')
        
        # Load addon if specified
        if input.addon:
            addon_path = find_dev_addon_path(input.addon)
            if not addon_path:
                return error(
                    code="ADDON_NOT_FOUND",
                    message=f"Addon '{input.addon}' not found in _dev_ folder",
                    suggestion="Check addon name or path"
                )
            
            # Find Core/ layer files if they exist
            core_path = addon_path / "Core"
            if core_path.exists():
                for lua_file in sorted(core_path.rglob("*.lua")):
                    lua_script_parts.append(f'dofile("{lua_file.as_posix()}")')
        
        # Add user code with result capture
        lua_script_parts.append(f'''
local _result = (function()
    {input.code}
end)()

-- Serialize result
if _result ~= nil then
    if type(_result) == "table" then
        local parts = {{}}
        for k, v in pairs(_result) do
            table.insert(parts, tostring(k) .. "=" .. tostring(v))
        end
        print("RESULT:" .. "{{" .. table.concat(parts, ", ") .. "}}")
    else
        print("RESULT:" .. tostring(_result))
    end
else
    print("RESULT:nil")
end
''')
        
        full_script = "\n".join(lua_script_parts)
        
        # Execute Lua
        try:
            result = subprocess.run(
                [str(lua_path), "-e", full_script],
                capture_output=True,
                text=True,
                timeout=30,
                cwd=str(sandbox_folder)
            )
        except subprocess.TimeoutExpired:
            return error(code="TIMEOUT", message="Lua execution timed out after 30 seconds")
        
        # Parse output
        output_lines = result.stdout.strip().split("\n") if result.stdout else []
        result_value = None
        other_output = []
        
        for line in output_lines:
            if line.startswith("RESULT:"):
                result_value = line[7:]  # Strip "RESULT:" prefix
            else:
                other_output.append(line)
        
        return success(
            data=ExecResult(
                result=result_value,
                output="\n".join(other_output),
                error=result.stderr if result.stderr else None,
                exit_code=result.returncode
            ),
            reasoning=f"Executed Lua code. Exit code: {result.returncode}"
        )
    
    @server.command(
        name="sandbox.test",
        description="Run Busted tests for an addon's Core layer with WoW API stubs",
        input_schema=TestInput,
        output_schema=TestResult,
    )
    async def sandbox_test(input: TestInput, context: Any = None) -> CommandResult[TestResult]:
        
        # Find the addon
        addon_path = find_dev_addon_path(input.addon)
        if not addon_path:
            return error(
                code="ADDON_NOT_FOUND",
                message=f"Addon '{input.addon}' not found in _dev_ folder",
                suggestion="Check addon name or path"
            )
        
        # Find spec files from:
        # 1. Core/*_spec.lua (tests alongside source)
        # 2. Tests/**/*_spec.lua (dedicated test folder)
        core_path = addon_path / "Core"
        tests_path = addon_path / "Tests"

        spec_files = []
        source_files = []

        # Collect source files from Core/ (non-spec files)
        if core_path.exists():
            # Also check Core/ for inline spec files
            spec_files.extend(core_path.rglob("*_spec.lua"))
            # Only load top-level Core/*.lua files to avoid dependency issues
            # Subdirectories (Logic/, Actions/) have cross-dependencies that need
            # proper load ordering - those should use addon.test with full TOC
            all_lua = [f for f in core_path.glob("*.lua") if not f.name.endswith("_spec.lua")]

            def load_order_key(path):
                # init.lua first, then alphabetically
                is_init = 0 if path.name == "init.lua" else 1
                return (is_init, str(path))

            source_files = sorted(all_lua, key=load_order_key)

        # Collect spec files from Tests/ folder (preferred location)
        if tests_path.exists():
            spec_files.extend(tests_path.rglob("*_spec.lua"))

        spec_files = list(spec_files)

        if not spec_files:
            has_core = core_path.exists()
            has_tests = tests_path.exists()
            if not has_core and not has_tests:
                return error(
                    code="NO_TEST_FOLDERS",
                    message=f"No Core/ or Tests/ folder found in {input.addon}",
                    suggestion="Create Tests/Core/*_spec.lua for sandbox tests"
                )
            return success(
                data=TestResult(addon=input.addon, passed=True, total=0),
                reasoning=f"No test files (*_spec.lua) found in {input.addon}/Core or {input.addon}/Tests"
            )
        
        # Find Lua (using simple test framework, not Busted)
        from ..setup import find_tool
        lua_path = find_tool("lua")
        if not lua_path:
            return error(
                code="LUA_NOT_FOUND",
                message="Lua executable not found",
                suggestion="Ensure lua.exe is in desktop/bin/"
            )
        
        # Build the test script - load stubs, framework, Core, then specs
        sandbox_folder = find_sandbox_folder()
        stubs_path = sandbox_folder / "generated" / "wow_stubs.lua"
        framework_path = sandbox_folder / "generated" / "test_framework.lua"
        
        # Build Lua script
        lua_parts = []
        
        # Load stubs
        if stubs_path.exists():
            lua_parts.append(f'dofile("{stubs_path.as_posix()}")')
        
        # Load test framework
        if framework_path.exists():
            lua_parts.append(f'dofile("{framework_path.as_posix()}")')
        
        # Load Core source files (non-spec files)
        for lua_file in source_files:
            lua_parts.append(f'dofile("{lua_file.as_posix()}")')

        # Load spec files
        for spec_file in spec_files:
            lua_parts.append(f'dofile("{spec_file.as_posix()}")')

        # Trigger auto-run at end
        lua_parts.append('_SANDBOX_AUTO_RUN()')

        full_script = "\n".join(lua_parts)

        # Track execution time
        import time
        start_time = time.perf_counter()

        try:
            result = subprocess.run(
                [str(lua_path), "-e", full_script],
                capture_output=True,
                text=True,
                timeout=60,
                cwd=str(addon_path)
            )
        except subprocess.TimeoutExpired:
            return error(code="TIMEOUT", message="Tests timed out after 60 seconds")

        duration_ms = (time.perf_counter() - start_time) * 1000
        
        # Parse output - look for SANDBOX_TESTS:passed:failed:total
        tests = []
        passed_count = 0
        failed_count = 0
        total = 0
        
        for line in result.stdout.split("\n"):
            if line.startswith("SANDBOX_TESTS:"):
                parts = line.split(":")
                if len(parts) >= 4:
                    passed_count = int(parts[1])
                    failed_count = int(parts[2])
                    total = int(parts[3])
            elif line.startswith("PASS: "):
                tests.append(TestCase(name=line[6:], passed=True))
            elif line.startswith("FAIL: "):
                fail_parts = line[6:].split(" | ", 1)
                tests.append(TestCase(
                    name=fail_parts[0],
                    passed=False,
                    error=fail_parts[1] if len(fail_parts) > 1 else None
                ))
        
        overall_passed = failed_count == 0 and total > 0
        
        src = create_source(
            type="tool",
            id="sandbox-test",
            title="Sandbox Test Runner",
            location=str(addon_path)
        )

        # Build file lists for metadata (relative paths)
        source_file_names = [f.name for f in source_files]
        spec_file_names = [f.relative_to(addon_path).as_posix() for f in spec_files]

        return success(
            data=TestResult(
                addon=input.addon,
                passed=overall_passed,
                total=total,
                passed_count=passed_count,
                failed_count=failed_count,
                tests=tests[:20],
                source_files=source_file_names,
                spec_files=spec_file_names,
                duration_ms=round(duration_ms, 1)
            ),
            reasoning=f"Ran {total} sandbox tests for {input.addon}/Core: {passed_count} passed, {failed_count} failed" + (f"\nErrors: {result.stderr[:200]}" if result.stderr else ""),
            sources=[src],
            confidence=1.0
        )
