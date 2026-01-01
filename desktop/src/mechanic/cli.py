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
                click.secho(f"   💡 {result.error.suggestion}", fg="yellow")


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
    
    click.secho(f"\n📋 Available Commands ({len(commands)} total)\n", bold=True)
    
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
    
    click.echo("\n🛑 Shutting down services...")
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
                click.secho(f"✅ Found {len(watch_paths)} SavedVariables folder(s)", fg="green")
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
@click.option("--key", "-k", default="^+r", help="Key sequence (default: ^+r = CTRL+SHIFT+R).")
@click.pass_context
def reload(ctx, key):
    """Trigger an in-game reload."""
    from .commands.core import get_server
    
    json_output = ctx.obj.get("json_output", False)
    quiet = ctx.obj.get("quiet", False)
    server = get_server()
    
    # Display friendly key name
    key_display = "CTRL+SHIFT+R" if key == "^+r" else key
    if not quiet and not json_output:
        click.echo(f"Triggering reload (key: {key_display})...")
    
    result = asyncio.run(server.execute("reload.trigger", {"key": key}))
    print_result(result, json_output=json_output, quiet=quiet)


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
                click.secho("✅ Server stopping...", fg="green")
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
        if result.get("success"):
            data = result.get("data", {})
            click.echo("")
            click.secho(f"[OK] Generated {data.get('path', 'docs')}", fg="green")
            click.echo(f"     {data.get('command_count', 0)} commands across {len(data.get('categories', []))} categories")


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
            click.secho(f"  ✅ {r['command']}", fg="green")
        else:
            click.secho(f"  [X] {r['command']}: {r['result']['error']['message']}", fg="red")
    
    if all_success:
        click.secho(f"\n🎉 Released {addon} v{version}!", fg="green", bold=True)
    else:
        click.secho(f"\n[!] Release incomplete", fg="yellow")
        sys.exit(1)


@main.command()
@click.option("--verify", is_flag=True, help="Only verify, don't download.")
@click.option("--force", is_flag=True, help="Re-download even if exists.")
@click.pass_context
def setup(ctx, verify, force):
    """Download and install required development tools."""
    from .setup import setup_tools, get_setup_summary, get_platform
    
    json_output = ctx.obj.get("json_output", False)
    quiet = ctx.obj.get("quiet", False)
    
    platform = get_platform()
    
    if not quiet and not json_output:
        click.secho(f"\n⚙️  Tool Setup ({platform})\n", fg="cyan", bold=True)
    
    results = setup_tools(verify_only=verify, force=force)
    summary = get_setup_summary(results)
    
    if json_output:
        click.echo(json.dumps(summary, indent=2))
        return
    
    for tool in summary["tools"]:
        if tool.get("installed"):
            click.secho(f"  ✅ {tool['name']} v{tool.get('version', '?')}", fg="green")
        else:
            click.secho(f"  [X] {tool['name']}: {tool.get('message', 'missing')}", fg="red")
    
    click.echo("")
    if summary["success"]:
        click.secho("✅ All tools ready!", fg="green", bold=True)
    else:
        click.secho(f"[!] {summary['required_missing']} tool(s) missing", fg="yellow")


if __name__ == "__main__":
    main()
