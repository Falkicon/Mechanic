# Mechanic CLI (for people)

The `mech` (alias `mechanic`) CLI is a user-facing fallback. **Agents use the MCP tools** ([using-mechanic](../../using-mechanic/SKILL.md)); do not run these commands for agent work. `mech --help` and `mech <command> --help` are authoritative.

Install from `desktop/`: `python -m pip install -e ".[dev]"` (Python 3.10+). Lua tools (luacheck, stylua, lua 5.1, busted) come from `mech setup` or your PATH.

## Commands

| Command | Purpose |
|---|---|
| `mech` / `mech dashboard` | Start the dashboard server and open the browser (port 3100). Options: `-p/--port`, `-w/--watch` (repeatable SavedVariables folder), `-s/--src` (repeatable addon source folder), `--no-browser`, `--auto-reload`, `--reload-key` |
| `mech stop [-p PORT]` | Shut down the running dashboard server |
| `mech commands [-f PATTERN] [-d NAME]` | List commands or show one command's detail |
| `mech call NAME ['JSON']` | Run any registered command; arguments are one positional JSON object |
| `mech addon.output` | Shortcut for the `addon.output` command |
| `mech release ADDON VERSION MESSAGE [--dry-run] [--category CAT]` | Runs `release.all` (preflight, bump, changelog, commit, tag). Use `--dry-run` first |
| `mech docs [-o PATH] [-f markdown\|json]` | Generate the CLI reference (`docs/cli-reference.md`) from the registry |
| `mech status` | Show configuration and discovered paths |
| `mech shell` | Interactive command shell |
| `mech setup [--verify] [--force] [--skip-config]` | Configure paths and download checksum-verified dev tools |
| `mech setup-busted` | Regenerate `busted.bat` for your LuaRocks install |
| `mech mcp [-t stdio\|sse] [-p PORT] [--host HOST]` | Run the MCP server (stdio default; SSE defaults to `127.0.0.1:3101`) |

There are no `mech lint`, `mech test`, `mech format` or `mech reload` commands and `call` has no `-i` option: every command goes through `mech call`.

## Global flags

Put these before the subcommand:

| Flag | Effect |
|---|---|
| `--json` | Raw JSON output |
| `-q`, `--quiet` | Less output |
| `--agent` | Compressed, grouped output (sets `agent_mode: true` for `call` and `addon.output`) |

## Examples

```bash
mech commands --filter libs
mech call libs.check '{"addon": "MyAddon"}'
mech call addon.lint '{"addon": "MyAddon"}'
mech --json call addon.validate '{"addon": "MyAddon"}'
mech --agent addon.output
mech call diagnostic.targets
mech call lua.queue '{"code": ["return GetMoney()"], "labels": ["money"]}'   # then /reload in WoW
mech release MyAddon 1.2.0 "Added cooldown tracking" --dry-run
```

Quote the JSON so your shell passes it as one argument; PowerShell and cmd treat double quotes differently from bash.

Exit codes: `0` success, `1` the command failed, `2` invalid CLI usage (unknown option, missing argument).

## Reloading the game

The CLI cannot reload WoW for you reliably. After changes, type `/reload` in game, then read `mech addon.output` (or `mech call addon.output '{"target": {...}}'` with a target from `mech call diagnostic.targets` when several profiles exist). The dashboard `--auto-reload` option sends a key press to the WoW window on file changes; it is opt-in and for people.
