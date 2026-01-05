"""
Mechanic Desktop CLI - AFD-compliant command-line interface.

Follows AFD patterns:
- `mechanic commands` to list available tools
- `mechanic call <cmd> <json>` with positional JSON
- `--json` and `--quiet` flags for output control
- `mechanic shell` for interactive mode
"""

import click
import uvicorn
import webbrowser
import asyncio
import json
from pathlib import Path
import os
import sys
from typing import Any, Optional

from .server import app
from .watcher import SVWatcher


# ═══════════════════════════════════════════════════════════════════════════════
# OUTPUT HELPERS (AFD-style)
# ═══════════════════════════════════════════════════════════════════════════════

def print_result(result: Any, json_output: bool = False, quiet: bool = False) -> None:
    """Print a CommandResult in AFD style."""
    if json_output:
        click.echo(json.dumps(result.model_dump(), indent=2))
        return
    
    if result.success:
        if not quiet:
            click.secho("[OK] Success", fg="green", bold=True)
            if result.reasoning:
                click.echo(f"   {result.reasoning}")
        # In non-quiet mode, show key data
        if hasattr(result.data, 'model_dump'):
            data = result.data.model_dump()
        else:
            data = result.data
        if data and not quiet:
            # Show condensed data view
            if isinstance(data, dict):
                for key, value in data.items():
                    if isinstance(value, list):
                        if len(value) == 0:
                            click.echo(f"   {key}: []")
                        elif len(value) <= 3:
                            # For short lists, show inline if items are simple
                            if all(isinstance(v, (str, int, bool)) for v in value):
                                click.echo(f"   {key}: {value}")
                            else:
                                click.echo(f"   {key}: [{len(value)} items]")
                        else:
                            # Show preview of first items
                            remaining = len(value) - 2
                            if all(isinstance(v, str) for v in value[:2]):
                                preview = ", ".join(f'"{v[:30]}..."' if len(v) > 30 else f'"{v}"' for v in value[:2])
                                click.echo(f"   {key}: [{preview}, ...+{remaining} more]")
                            elif all(isinstance(v, dict) for v in value[:2]):
                                # Objects - try to find a good identifier field
                                id_field = None
                                for field in ['name', 'library', 'id', 'addon', 'path']:
                                    if all(field in v for v in value[:2]):
                                        id_field = field
                                        break
                                if id_field:
                                    ids = [str(v[id_field])[:30] for v in value[:2]]
                                    click.echo(f"   {key}: [{', '.join(ids)}, ...+{remaining} more]")
                                else:
                                    click.echo(f"   {key}: [{len(value)} items]")
                            else:
                                click.echo(f"   {key}: [{len(value)} items]")
                    elif isinstance(value, str) and len(value) > 80:
                        click.echo(f"   {key}: {value[:77]}...")
                    else:
                        click.echo(f"   {key}: {value}")
    else:
        click.secho("[X] Failed", fg="red", bold=True)
        if result.error:
            click.echo(f"   {result.error.code}: {result.error.message}")
            if result.error.suggestion:
                click.secho(f"   Hint: {result.error.suggestion}", fg="yellow")


def print_commands(commands: list, json_output: bool = False) -> None:
    """Print command list in AFD style."""
    if json_output:
        click.echo(json.dumps([
            {"name": c.name, "description": c.description}
            for c in commands
        ], indent=2))
        return
    
    # Group by prefix
    groups: dict[str, list] = {}
    for cmd in sorted(commands, key=lambda x: x.name):
        prefix = cmd.name.split('.')[0] if '.' in cmd.name else 'misc'
        if prefix not in groups:
            groups[prefix] = []
        groups[prefix].append(cmd)
    
    click.secho(f"\nAvailable Commands ({len(commands)} total)\n", bold=True)
    
    for group, cmds in sorted(groups.items()):
        click.secho(f"  {group}:", fg="cyan", bold=True)
        for cmd in cmds:
            desc = cmd.description[:50] + "..." if len(cmd.description) > 50 else cmd.description
            click.echo(f"    {cmd.name:24} {desc}")
        click.echo("")


# ═══════════════════════════════════════════════════════════════════════════════
# SERVER MANAGEMENT
# ═══════════════════════════════════════════════════════════════════════════════

async def start_services(port, watch_paths, src_paths=None, auto_reload=False, reload_key="^+r", stop_event=None):
    if stop_event is None:
        stop_event = asyncio.Event()

    watcher = SVWatcher(watch_paths, src_paths=src_paths, auto_reload=auto_reload, reload_key=reload_key)
    
    config = uvicorn.Config(app, host="127.0.0.1", port=port, log_level="info")
    server = uvicorn.Server(config)
    
    server_task = asyncio.create_task(server.serve())
    watcher_task = asyncio.create_task(watcher.start(stop_event=stop_event))
    
    await stop_event.wait()
    
    click.echo("\nShutting down services...")
    watcher.stop()
    server.should_exit = True
    await asyncio.gather(server_task, watcher_task, return_exceptions=True)


def start_server(port, watch_paths, src_paths=None, auto_reload=False, reload_key="^+r"):
    loop = asyncio.new_event_loop()
    asyncio.set_event_loop(loop)
    
    stop_event = asyncio.Event()
    
    def handle_signal():
        if not stop_event.is_set():
            stop_event.set()
    
    if os.name != 'nt':
        import signal
        loop.add_signal_handler(signal.SIGINT, handle_signal)
        loop.add_signal_handler(signal.SIGTERM, handle_signal)
    
    try:
        loop.run_until_complete(start_services(port, watch_paths, src_paths, auto_reload, reload_key, stop_event))
    except (KeyboardInterrupt, asyncio.CancelledError):
        handle_signal()
        loop.run_until_complete(start_services(port, watch_paths, src_paths, auto_reload, reload_key, stop_event))
    finally:
        loop.close()


# ═══════════════════════════════════════════════════════════════════════════════
# CLI DEFINITION
# ═══════════════════════════════════════════════════════════════════════════════

@click.group(invoke_without_command=True)
@click.option("--json", "json_output", is_flag=True, help="Output raw JSON (for agents)")
@click.option("--quiet", "-q", is_flag=True, help="Suppress non-essential output")
@click.option("--agent", is_flag=True, help="Agent mode: smart compression, grouped output")
@click.version_option(package_name="mechanic-desktop", prog_name="mechanic")
@click.pass_context
def main(ctx, json_output, quiet, agent):
    """Mechanic Desktop - AFD-powered companion for WoW addon development.
    
    \b
    Quick Start:
      mechanic commands              List available AFD commands
      mechanic call sv.discover      Discover SavedVariables
      mechanic dashboard             Start the web dashboard
    
    \b
    AFD Patterns:
      mechanic call <cmd> '<json>'   Call command with JSON args
      mechanic --json call ...       Get raw JSON output
      mechanic --agent call ...      Agent-optimized output
      mechanic shell                 Interactive command shell
    """
    ctx.ensure_object(dict)
    ctx.obj["json_output"] = json_output
    ctx.obj["quiet"] = quiet
    ctx.obj["agent"] = agent

    if ctx.invoked_subcommand is None:
        ctx.invoke(dashboard)



# ═══════════════════════════════════════════════════════════════════════════════
# COMMANDS - AFD Core
# ═══════════════════════════════════════════════════════════════════════════════

@main.command("commands")
@click.option("--filter", "-f", "pattern", help="Filter commands by name pattern")
@click.option("--detail", "-d", "cmd_name", help="Show detailed info for a command")
@click.pass_context
def list_commands(ctx, pattern, cmd_name):
    """List available AFD commands.
    
    \b
    Examples:
      mechanic commands                List all commands
      mechanic commands --filter libs  Filter by 'libs'
      mechanic commands -d libs.check  Show detail for libs.check
    """
    from .commands.core import get_server
    
    json_output = ctx.obj.get("json_output", False)
    server = get_server()
    commands = server.list_commands()
    
    # Filter if pattern provided
    if pattern:
        commands = [c for c in commands if pattern.lower() in c.name.lower()]
    
    # Show detail for specific command
    if cmd_name:
        matching = [c for c in commands if c.name == cmd_name]
        if not matching:
            click.secho(f"[X] Command '{cmd_name}' not found", fg="red")
            sys.exit(1)
        
        cmd = matching[0]
        if json_output:
            params = []
            if hasattr(cmd, 'parameters') and cmd.parameters:
                for p in cmd.parameters:
                    params.append({
                        "name": p.name,
                        "type": p.type,
                        "description": p.description,
                        "required": p.required,
                        "default": p.default,
                    })
            click.echo(json.dumps({
                "name": cmd.name,
                "description": cmd.description,
                "parameters": params,
            }, indent=2))
        else:
            click.secho(f"\n📌 {cmd.name}", fg="cyan", bold=True)
            click.echo(f"   {cmd.description}")
            if hasattr(cmd, 'parameters') and cmd.parameters:
                click.secho("\n   Parameters:", bold=True)
                for p in cmd.parameters:
                    req = "" if p.required else f" (optional, default: {p.default})"
                    click.echo(f"     {p.name}: {p.type}{req}")
                    if p.description:
                        click.echo(f"       {p.description}")
        return
    
    print_commands(commands, json_output=json_output)


@main.command()
@click.argument("command_name")
@click.argument("args", default="{}")
@click.pass_context
def call(ctx, command_name, args):
    """Call an AFD command.
    
    COMMAND_NAME is the command to call (e.g., sv.discover, libs.check).
    ARGS is a JSON string of arguments (default: {}).
    
    \b
    Examples:
      mechanic call sv.discover
      mechanic call libs.check '{"addon": "!Mechanic"}'
      mechanic --json call addon.validate '{"addon": "Weekly"}'
    """
    from .commands.core import get_server
    
    json_output = ctx.obj.get("json_output", False)
    quiet = ctx.obj.get("quiet", False)
    agent = ctx.obj.get("agent", False)
    server = get_server()
    
    # Parse args
    try:
        input_data = json.loads(args)
    except json.JSONDecodeError as e:
        click.secho(f"[X] Invalid JSON: {e}", fg="red")
        sys.exit(1)
    
    # Inject agent_mode when --agent flag is set
    if agent and isinstance(input_data, dict):
        input_data["agent_mode"] = True
    
    if not quiet and not json_output:
        click.echo(f"Calling {command_name}...")
    
    result = asyncio.run(server.execute(command_name, input_data))
    print_result(result, json_output=json_output, quiet=quiet)
    
    if not result.success:
        sys.exit(1)


@main.command()
@click.pass_context
def shell(ctx):
    """Start an interactive command shell.
    
    Provides a REPL for calling AFD commands interactively.
    Type 'help' for commands, 'exit' to quit.
    """
    from .commands.core import get_server
    
    server = get_server()
    json_output = ctx.obj.get("json_output", False)
    
    click.secho("\n🔧 Mechanic Shell", bold=True)
    click.echo("Type 'help' for commands, 'exit' to quit\n")
    
    async def run_shell():
        while True:
            try:
                line = click.prompt(click.style("mechanic", fg="cyan"), prompt_suffix="> ")
            except (EOFError, KeyboardInterrupt):
                break
            
            line = line.strip()
            if not line:
                continue
            
            if line in ("exit", "quit"):
                break
            
            if line == "help":
                click.echo("""
Commands:
  commands           List available AFD commands
  call <cmd> [json]  Call a command with optional JSON args
  help               Show this help
  exit               Exit the shell
""")
                continue
            
            if line == "commands":
                commands = server.list_commands()
                print_commands(commands, json_output=json_output)
                continue
            
            if line.startswith("call "):
                parts = line[5:].strip().split(maxsplit=1)
                cmd_name = parts[0]
                cmd_args = json.loads(parts[1]) if len(parts) > 1 else {}
                
                result = await server.execute(cmd_name, cmd_args)
                print_result(result, json_output=json_output)
                continue
            
            # Try as direct command call
            parts = line.split(maxsplit=1)
            cmd_name = parts[0]
            cmd_args = json.loads(parts[1]) if len(parts) > 1 else {}
            
            result = await server.execute(cmd_name, cmd_args)
            print_result(result, json_output=json_output)
    
    try:
        asyncio.run(run_shell())
    except KeyboardInterrupt:
        pass
    
    click.echo("\nGoodbye! 👋")


@main.command()
@click.pass_context
def status(ctx):
    """Show current status and configuration."""
    from .config import get_config
    
    json_output = ctx.obj.get("json_output", False)
    config = get_config()
    
    status_data = {
        "wow_root": str(config.wow_root) if config.wow_root else None,
        "dev_path": str(config.dev_path) if config.dev_path else None,
        "flavors": config.flavors,
        "data_dir": str(config.data_dir),
    }
    
    if json_output:
        click.echo(json.dumps(status_data, indent=2))
        return
    
    click.secho("\n⚙️  Mechanic Status\n", bold=True)
    click.echo(f"  WoW Root:  {status_data['wow_root'] or '(not found)'}")
    click.echo(f"  Dev Path:  {status_data['dev_path'] or '(not found)'}")
    click.echo(f"  Flavors:   {', '.join(status_data['flavors'])}")
    click.echo(f"  Data Dir:  {status_data['data_dir']}")
    click.echo("")


# ═══════════════════════════════════════════════════════════════════════════════
# COMMANDS - Dashboard & Services
# ═══════════════════════════════════════════════════════════════════════════════

@main.command()
@click.option("--port", "-p", default=3100, help="Port to run the dashboard on.")
@click.option("--watch", "-w", multiple=True, help="Path to SavedVariables folder(s).")
@click.option("--src", "-s", multiple=True, help="Addon source folder(s) for Hot Reload.")
@click.option("--no-browser", is_flag=True, help="Don't open the browser automatically.")
@click.option("--auto-reload", is_flag=True, help="Automatically trigger in-game reload on file changes.")
@click.option("--reload-key", default="9", help="Key to send for auto-reload (default: 9).")
@click.pass_context
def dashboard(ctx, port, watch, src, no_browser, auto_reload, reload_key):
    """Start the Mechanic Dashboard and watch for changes."""
    from .commands.core import get_server
    
    quiet = ctx.obj.get("quiet", False)
    server = get_server()
    
    watch_paths = [Path(p) for p in watch]
    src_paths = [Path(p) for p in src]
    
    if not watch_paths:
        if not quiet:
            click.echo("🔍 Auto-discovering SavedVariables...")
        result = asyncio.run(server.execute("sv.discover", {}))
        
        if result.success:
            paths = result.data.paths if hasattr(result.data, 'paths') else result.data
            watch_paths = [Path(p) for p in paths]
            if not quiet:
                click.secho(f"[OK] Found {len(watch_paths)} SavedVariables folder(s)", fg="green")
        else:
            message = result.error.message if result.error else "Unknown error"
            click.secho(f"[X] Error: {message}", fg="red")
            click.echo('Use -w to specify a path: mechanic dashboard -w "C:\\Path\\To\\SavedVariables"')
            return

    if not no_browser:
        webbrowser.open(f"http://localhost:{port}/dashboard/")

    if not quiet:
        click.echo(f"Starting dashboard on port {port}...")
        if auto_reload:
            key_display = reload_key.replace("^", "Ctrl+").replace("+", "Shift+").upper() if reload_key.startswith("^") else reload_key
            click.secho(f"🔥 Hot Reload ACTIVE (key: {key_display})", fg="yellow")
    
    start_server(port, watch_paths, src_paths=src_paths, auto_reload=auto_reload, reload_key=reload_key)


@main.command()
@click.option("--port", "-p", default=3100, help="Port the server is running on.")
@click.pass_context
def stop(ctx, port):
    """Shut down the running Mechanic server."""
    import urllib.request
    
    json_output = ctx.obj.get("json_output", False)
    
    try:
        url = f"http://127.0.0.1:{port}/api/execute"
        data = json.dumps({"command": "server.shutdown", "input": {}}).encode('utf-8')
        
        req = urllib.request.Request(url, data=data, headers={'Content-Type': 'application/json'})
        with urllib.request.urlopen(req, timeout=2) as response:
            result = json.loads(response.read().decode('utf-8'))
            if json_output:
                click.echo(json.dumps(result, indent=2))
            elif result.get("success"):
                click.secho("[OK] Server stopping...", fg="green")
            else:
                click.secho(f"[X] {result.get('error', {}).get('message', 'Failed')}", fg="red")
    except Exception as e:
        if json_output:
            click.echo(json.dumps({"success": False, "error": {"message": str(e)}}))
        else:
            click.secho(f"[X] Could not connect to port {port}", fg="red")


# ═══════════════════════════════════════════════════════════════════════════════
# COMMANDS - Convenience Wrappers
# ═══════════════════════════════════════════════════════════════════════════════

@main.command("addon.output")
@click.pass_context
def addon_output(ctx):
    """Get all addon output (errors, tests, console).

    \b
    Examples:
      mech addon.output              # Full output
      mech --agent addon.output      # Compressed for AI agents
      mech --json addon.output       # Raw JSON output
    """
    from .commands.core import get_server

    json_output = ctx.obj.get("json_output", False)
    quiet = ctx.obj.get("quiet", False)
    agent_mode = ctx.obj.get("agent_mode", False)
    server = get_server()

    result = asyncio.run(server.execute("addon.output", {"agent_mode": agent_mode}))
    print_result(result, json_output=json_output, quiet=quiet)


@main.command()
@click.option("--output", "-o", default=None, help="Output file path (default: docs/cli-reference.md)")
@click.option("--format", "-f", "fmt", default="markdown", type=click.Choice(["markdown", "json"]), help="Output format")
@click.pass_context
def docs(ctx, output, fmt):
    """Generate CLI reference documentation.
    
    \b
    Examples:
      mech docs                    # Generate docs/cli-reference.md
      mech docs -f json            # Generate JSON format
      mech docs -o ./API.md        # Custom output path
    """
    from .commands.core import get_server
    
    json_output = ctx.obj.get("json_output", False)
    quiet = ctx.obj.get("quiet", False)
    server = get_server()
    
    async def run():
        input_data = {"format": fmt}
        if output:
            input_data["output_path"] = output
        return await server.execute("docs.generate", input_data)
    
    result = asyncio.run(run())

    if json_output:
        click.echo(json.dumps(result, indent=2, default=str))
    else:
        print_result(result, quiet=quiet)
        if result.success:
            data = result.data
            click.echo("")
            path = getattr(data, 'path', 'docs') if data else 'docs'
            cmd_count = getattr(data, 'command_count', 0) if data else 0
            categories = getattr(data, 'categories', []) if data else []
            click.secho(f"[OK] Generated {path}", fg="green")
            click.echo(f"     {cmd_count} commands across {len(categories)} categories")


@main.command()
@click.argument("addon")
@click.argument("version")
@click.argument("message")
@click.option("--skip-tag", is_flag=True, help="Skip creating git tag")
@click.pass_context
def release(ctx, addon, version, message, skip_tag):
    """Release an addon: bump version, changelog, commit, tag.
    
    \b
    Example:
      mechanic release Weekly 1.2.0 "Added new feature"
    """
    from .commands.core import get_server
    
    json_output = ctx.obj.get("json_output", False)
    quiet = ctx.obj.get("quiet", False)
    server = get_server()
    
    async def run_release():
        results = []
        
        steps = [
            ("version.bump", {"addon": addon, "version": version}),
            ("changelog.add", {"addon": addon, "version": version, "message": message, "category": "Changed"}),
            ("git.commit", {"addon": addon, "message": f"Release v{version}: {message}"}),
        ]
        if not skip_tag:
            steps.append(("git.tag", {"addon": addon, "version": version, "message": f"Release {version}: {message}"}))
        
        for cmd, args in steps:
            if not quiet and not json_output:
                click.echo(f"  -> {cmd}...")
            result = await server.execute(cmd, args)
            results.append({"command": cmd, "result": result.model_dump()})
            if not result.success:
                break
        
        return results
    
    results = asyncio.run(run_release())
    
    if json_output:
        click.echo(json.dumps(results, indent=2))
        return
    
    all_success = all(r["result"]["success"] for r in results)
    for r in results:
        if r["result"]["success"]:
            click.secho(f"  [OK] {r['command']}", fg="green")
        else:
            click.secho(f"  [X] {r['command']}: {r['result']['error']['message']}", fg="red")
    
    if all_success:
        click.secho(f"\n[SUCCESS] Released {addon} v{version}!", fg="green", bold=True)
    else:
        click.secho(f"\n[!] Release incomplete", fg="yellow")
        sys.exit(1)


@main.command()
@click.option("--verify", is_flag=True, help="Only verify, don't download.")
@click.option("--force", is_flag=True, help="Re-download even if exists.")
@click.option("--skip-config", is_flag=True, help="Skip configuration, only setup tools.")
@click.pass_context
def setup(ctx, verify, force, skip_config):
    """Setup Mechanic: configure paths and install development tools."""
    from .config import get_config, MechanicConfig
    from .setup import setup_tools, get_setup_summary, get_platform

    json_output = ctx.obj.get("json_output", False)
    quiet = ctx.obj.get("quiet", False)

    platform = get_platform()
    config = get_config()

    # ── Phase 1: Configuration ──────────────────────────────────────────────────
    if not skip_config and not json_output:
        click.secho("\n  Mechanic Setup\n", fg="cyan", bold=True)
        click.secho("  Auto-detected paths:", bold=True)

        wow_root = config.wow_root
        dev_path = config.dev_path
        data_dir = config.data_dir

        # Show detected paths
        if wow_root:
            click.secho(f"    WoW Root:  {wow_root}", fg="green")
        else:
            click.secho("    WoW Root:  (not found)", fg="yellow")

        if dev_path:
            click.secho(f"    Dev Path:  {dev_path}", fg="green")
        else:
            click.secho("    Dev Path:  (not found)", fg="yellow")

        click.echo(f"    Data Dir:  {data_dir}")
        click.echo("")

        # If paths not found, prompt for them
        need_save = False
        new_config = {}

        if not wow_root:
            user_path = click.prompt(
                "  Enter WoW installation path",
                default="",
                show_default=False
            )
            if user_path:
                from pathlib import Path
                p = Path(user_path)
                if p.exists():
                    new_config["wow_root"] = str(p)
                    need_save = True
                else:
                    click.secho(f"  [!] Path not found: {user_path}", fg="yellow")

        if not dev_path and not new_config.get("wow_root"):
            user_path = click.prompt(
                "  Enter _dev_ folder path",
                default="",
                show_default=False
            )
            if user_path:
                from pathlib import Path
                p = Path(user_path)
                if p.exists():
                    new_config["dev_path"] = str(p)
                    need_save = True
                else:
                    click.secho(f"  [!] Path not found: {user_path}", fg="yellow")

        # Confirm and save if paths were auto-detected or entered
        if wow_root or dev_path or new_config:
            if new_config:
                # User entered paths, save them
                if click.confirm("  Save this configuration?", default=True):
                    config.save_user_config(new_config)
                    click.secho("  [OK] Configuration saved to ~/.mechanic/config.json", fg="green")
                    # Reload config
                    MechanicConfig.reset()
            else:
                # Paths were auto-detected
                if click.confirm("  Save this configuration?", default=True):
                    config.save_user_config(config.to_dict())
                    click.secho("  [OK] Configuration saved to ~/.mechanic/config.json", fg="green")

        click.echo("")

    # ── Phase 2: Tool Setup ─────────────────────────────────────────────────────
    if not quiet and not json_output:
        click.secho(f"  Checking tools ({platform})...\n", bold=True)

    results = setup_tools(verify_only=verify, force=force)
    summary = get_setup_summary(results)

    if json_output:
        click.echo(json.dumps(summary, indent=2))
        return

    for tool in summary["tools"]:
        if tool.get("installed"):
            click.secho(f"    [OK] {tool['name']} v{tool.get('version', '?')}", fg="green")
        else:
            click.secho(f"    [X] {tool['name']}: {tool.get('message', 'missing')}", fg="red")

    # ── Phase 3: Busted Setup ───────────────────────────────────────────────────
    if platform == "windows" and not verify:
        from .setup import setup_busted
        success, message = setup_busted()
        if success:
            click.secho(f"    [OK] busted.bat generated", fg="green")
        else:
            click.secho(f"    [!] busted: {message}", fg="yellow")

    click.echo("")
    if summary["success"]:
        click.secho("  [OK] Setup complete!", fg="green", bold=True)
    else:
        click.secho(f"  [!] {summary['required_missing']} tool(s) missing", fg="yellow")


@main.command("setup-busted")
def setup_busted_cmd():
    """Regenerate busted.bat for your LuaRocks installation."""
    from .setup import setup_busted, get_platform

    if get_platform() != "windows":
        click.secho("busted.bat is Windows-only", fg="yellow")
        return

    success, message = setup_busted()
    if success:
        click.secho(f"[OK] {message}", fg="green")
    else:
        click.secho(f"[!] {message}", fg="yellow")


# ═══════════════════════════════════════════════════════════════════════════════
# COMMANDS - MCP Server (AFD Phase 2)
# ═══════════════════════════════════════════════════════════════════════════════

@main.command()
@click.option("--transport", "-t", default="stdio", type=click.Choice(["stdio", "sse"]), help="Transport type (stdio or sse)")
@click.option("--port", "-p", default=3100, help="Port for SSE transport (default: 3100)")
@click.pass_context
def mcp(ctx, transport, port):
    """Run Mechanic as an MCP server for AI agents.

    This exposes all AFD commands as MCP tools with rich descriptions,
    parameter documentation, usage examples, and clean output formatting.

    \b
    Features:
      - Category-organized tools (addon, api, libs, etc.)
      - Parameter hints with types and defaults
      - Usage examples for common operations
      - Clean summaries alongside JSON responses

    \b
    Transports:
      stdio  - Standard input/output (default, for Claude Code/Desktop)
      sse    - Server-Sent Events (for web clients)

    \b
    Examples:
      mech mcp                    # Run MCP over stdio
      mech mcp --transport sse    # Run MCP over SSE on port 3100
      mech mcp -t sse -p 8080     # Run SSE on custom port

    \b
    Claude Code Config (.mcp.json in project root):
      {
        "mcpServers": {
          "mechanic": {
            "command": "mech",
            "args": ["mcp"]
          }
        }
      }
    """
    from .commands.core import get_server
    from .mcp_server import create_mcp_server

    quiet = ctx.obj.get("quiet", False)
    server = get_server()

    # Check if FastMCP is available
    try:
        from mcp.server.fastmcp import FastMCP
    except ImportError:
        click.secho("[X] FastMCP not installed", fg="red")
        click.echo("    Install with: pip install mcp")
        sys.exit(1)

    # Create enhanced MCP server with rich descriptions
    verbose = not quiet and transport == "stdio"
    mcp_server = create_mcp_server(server, verbose=verbose)

    if not quiet and transport == "sse":
        cmd_count = len(server.list_commands())
        click.echo(f"Mechanic MCP Server starting on port {port}...")
        click.echo(f"  Tools: {cmd_count}")
        click.echo(f"  Transport: SSE")
        click.echo(f"  Features: Rich descriptions, parameter hints, examples")

    # Run the MCP server
    if transport == "sse":
        mcp_server.settings.port = port

    mcp_server.run(transport=transport)


if __name__ == "__main__":
    main()
