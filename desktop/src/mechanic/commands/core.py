from afd import CommandResult, success, error
from afd.server import create_server
from afd.core.metadata import create_source, create_warning, WarningSeverity
from pathlib import Path
from pydantic import BaseModel, Field
from typing import Dict, Any, List, Optional
import time
import os
import asyncio

# Create the AFD server instance
server = create_server(name="mechanic-desktop", version="0.1.0")

# ═══════════════════════════════════════════════════════════════════════════════
# SCHEMAS
# ═══════════════════════════════════════════════════════════════════════════════

class ParseInput(BaseModel):
    file_path: str = Field(..., description="Absolute path to the !Mechanic.lua file")

class SavedVariables(BaseModel):
    addons: Dict[str, Any] = Field(..., description="Dictionary of addon data")

class ReloadInput(BaseModel):
    key: str = Field(default="^+r", description="SendKeys sequence (default: ^+r = CTRL+SHIFT+R for Mechanic keybinding)")

class ReloadOutput(BaseModel):
    key: str
    focused_title: str

class DiscoverOutput(BaseModel):
    paths: List[str]

class ShutdownOutput(BaseModel):
    status: str
    message: str

# ═══════════════════════════════════════════════════════════════════════════════
# COMMANDS
# ═══════════════════════════════════════════════════════════════════════════════

@server.command(
    name="sv.parse",
    description="Parse a WoW SavedVariables file and extract !Mechanic data",
    input_schema=ParseInput,
    output_schema=SavedVariables,
)
async def parse_sv(input: ParseInput, context: Any = None) -> CommandResult[SavedVariables]:
    from ..parsers import parse_savedvariables
    
    file_path_obj = Path(input.file_path)
    if not file_path_obj.exists():
        return error(
            code="FILE_NOT_FOUND",
            message=f"SavedVariables file not found: {file_path_obj.name}",
            suggestion="Ensure the path is correct and World of Warcraft has written the file."
        )

    try:
        content = file_path_obj.read_text(encoding='utf-8')
        data = parse_savedvariables(content)
        
        # Logic from watcher moved to command for compliance
        var_name = file_path_obj.stem
        matched_var = None
        
        if var_name in data:
            matched_var = var_name
        elif f"{var_name}DB" in data:
            matched_var = f"{var_name}DB"
        elif var_name.startswith("!") and var_name[1:] + "DB" in data:
            matched_var = var_name[1:] + "DB"
        elif data:
            matched_var = list(data.keys())[0]
            
        if not matched_var:
            return success(
                data=SavedVariables(addons={}),
                reasoning=f"No valid variables found in {file_path_obj.name}"
            )
            
        addon_data = data[matched_var]
        
        # Flatten AceDB-3.0 profiles
        if isinstance(addon_data, dict) and "profileKeys" in addon_data and "profiles" in addon_data:
            profile_name = "Default"
            if "profiles" in addon_data and profile_name in addon_data["profiles"]:
                addon_data = addon_data["profiles"][profile_name]
        
        # Map key 'testResults' to 'tests' - preserve test ID as 'name'
        if isinstance(addon_data, dict):
            if "testResults" in addon_data and "tests" not in addon_data:
                # Convert { "test_id": {passed, message, ...} } to [ {name, passed, ...} ]
                tests = []
                for test_id, result in addon_data["testResults"].items():
                    if isinstance(result, dict):
                        test_entry = {"name": test_id, **result}
                        tests.append(test_entry)
                addon_data["tests"] = tests

        src = create_source(
            type="file",
            id=f"sv-{var_name}",
            title=f"SavedVariables: {file_path_obj.name}",
            location=str(file_path_obj)
        )
        
        return success(
            data=SavedVariables(addons={var_name: addon_data}),
            reasoning=f"Successfully identified and normalized {var_name} data",
            sources=[src],
            confidence=0.95
        )
    except Exception as e:
        return error(
            code="PARSE_ERROR",
            message=f"Failed to parse Lua file: {str(e)}",
            suggestion="Check if the file is a valid WoW SavedVariables format."
        )

@server.command(
    name="dashboard.metrics",
    description="Get the latest reload and test metrics from the local history",
)
async def get_metrics(input: Dict[str, Any], context: Any = None) -> CommandResult[Dict[str, Any]]:
    from ..server import storage
    metrics = storage.get_latest_metrics()
    
    if not metrics:
        return error(
            code="NO_DATA", 
            message="No reload metrics found in history database",
            suggestion="Trigger a reload in-game to generate initial data"
        )
        
    src = create_source(
        type="database",
        id="mechanic-sqlite",
        title="Local History Database",
        location="mechanic.db"
    )
    
    return success(
        data=metrics,
        reasoning="Retrieved most recent metrics from SQLite storage",
        sources=[src],
        confidence=1.0
    )

@server.command(
    name="reload.trigger",
    description="Focus WoW and trigger an in-game /reload",
    input_schema=ReloadInput,
    output_schema=ReloadOutput,
)
async def trigger_reload(input: ReloadInput, context: Any = None) -> CommandResult[ReloadOutput]:
    from ..utils import trigger_wow_reload
    
    # In a real implementation, we might want to know WHICH window was focused
    # for the compliance record.
    if trigger_wow_reload(input.key):
        return success(
            data=ReloadOutput(key=input.key, focused_title="World of Warcraft"),
            reasoning=f"Input '{input.key}' sent to the active WoW window",
            confidence=1.0
        )
    else:
        return error(
            code="WINDOW_NOT_FOUND", 
            message="Could not find a World of Warcraft window to focus",
            suggestion="Ensure World of Warcraft is running and not minimized to the tray",
            retryable=True
        )

@server.command(
    name="sv.discover",
    description="Automatically discover SavedVariables paths for all WoW flavors",
    output_schema=DiscoverOutput,
)
async def discover_sv(input: Dict[str, Any], context: Any = None) -> CommandResult[DiscoverOutput]:
    from ..config import discover_saved_variables, get_config
    
    paths = discover_saved_variables()
    
    if not paths:
        return error(
            code="NOT_FOUND", 
            message="No WoW accounts with !Mechanic installed were found",
            suggestion="Install the !Mechanic addon in your Interface/AddOns folder first",
            retryable=True
        )
    
    # Build discovery transparency from configured paths
    config = get_config()
    sources = []
    if config.wow_root:
        sources.append(create_source(
            type="directory", 
            id="wow-root", 
            title=f"WoW Root: {config.wow_root}"
        ))

    return success(
        data=DiscoverOutput(paths=[str(p) for p in paths]),
        reasoning=f"Discovered {len(paths)} valid account directories across discovered WoW installations",
        sources=sources,
        confidence=1.0
    )

@server.command(
    name="server.shutdown",
    description="Gracefully shut down the Mechanic Desktop server",
    output_schema=ShutdownOutput,
)
async def shutdown_server(input: Dict[str, Any], context: Any = None) -> CommandResult[ShutdownOutput]:
    # We trigger the shutdown after a small delay to allow the response to return
    loop = asyncio.get_event_loop()
    
    async def delayed_shutdown():
        await asyncio.sleep(0.5)
        print("🛑 Shutdown command received. Closing server...")
        # Since uvicorn is running in this loop, we can just stop the loop or exit
        # In a real app, you might want to call server.should_exit = True if you have the server object
        os._exit(0) # Brutal but effective for a local dev tool

    loop.create_task(delayed_shutdown())
    
    return success(
        data=ShutdownOutput(status="shutting_down", message="Server will stop in 500ms"),
        reasoning="Remote shutdown requested via AFD command"
    )

# Flag to track if commands have been registered
_commands_registered = False

def get_server():
    global _commands_registered
    
    if not _commands_registered:
        # Register development commands from the development module
        from . import development
        development.register_commands(server)
        
        # Register release pipeline commands
        from . import release
        release.register_commands(server)
        
        # Register locale and asset commands
        from . import locale
        locale.register_commands(server)
        
        # Register environment commands
        from . import environment
        environment.register_commands(server)
        
        # Register tool management commands
        from . import tools
        tools.register_tools_commands(server)
        
        # Register addon output command (AFD)
        from . import output
        output.register_commands(server)
        
        # Register documentation generation commands
        from . import docs
        docs.register_commands(server)
        
        _commands_registered = True
    
    return server
