# CLI Workflow

Daily development commands and patterns for working with Mechanic. `mech` and `mechanic` are the same entry point. JSON input is a **positional** argument to `call`, and global flags (`--json`, `--agent`, `--quiet`) go before the subcommand.

---

## Daily Development

```bash
# Start your session (running `mech` with no subcommand also starts the dashboard)
mech dashboard

# After making changes, reload in game yourself
#   /reload   (or your "Reload UI (Dev)" key binding)
# SavedVariables are written to disk on reload/logout, then the watcher notices them.

# Check for errors
mech addon.output                      # Full snapshot (errors, tests, console)
mech --agent addon.output              # Compressed for AI assistants
```

There is no `mech reload` command. The dashboard's reload button only shows the `/reload` instruction. The optional `mech dashboard --auto-reload --src PATH` sends a configured key to the WoW window on Windows and macOS when a source file changes; it requires the key to match your in-game binding (see [desktop/README.md](../../desktop/README.md)).

When several clients, accounts, characters or profiles exist, pass a `target` object from `diagnostic.targets` to `addon.output`, `lua.queue`, `lua.results` and `api.queue`.

---

## Code Quality

```bash
# Validate TOC
mech call addon.validate '{"addon": "MyAddon"}'

# Lint with Luacheck
mech call addon.lint '{"addon": "MyAddon"}'

# Format with StyLua
mech call addon.format '{"addon": "MyAddon"}'

# Run tests (Busted)
mech call addon.test '{"addon": "MyAddon"}'

# Scan for deprecated APIs
mech call addon.deprecations '{"addon": "MyAddon"}'
```

`addon.deprecations` reads a packaged deprecation database. The shipped database is a small seed and the command reports a `DEPRECATION_DB_LIMITED` warning until it is regenerated with `python -m mechanic.deprecations_builder <wow-ui-source path>`.

---

## All-in-One Validation

```bash
# Run the quality suite before committing
mech call addon.lint '{"addon": "MyAddon"}' && \
mech call addon.test '{"addon": "MyAddon"}' && \
mech call addon.validate '{"addon": "MyAddon"}'
```

---

## Quick Reference

| Task | Command |
|------|---------|
| Start dashboard | `mech dashboard` |
| Reload WoW UI | `/reload` in game (no `mech reload`) |
| Get addon output | `mech addon.output` |
| Validate TOC | `mech call addon.validate '{"addon": "NAME"}'` |
| Lint code | `mech call addon.lint '{"addon": "NAME"}'` |
| Format code | `mech call addon.format '{"addon": "NAME"}'` |
| Run tests | `mech call addon.test '{"addon": "NAME"}'` |
| Check deprecations | `mech call addon.deprecations '{"addon": "NAME"}'` |
| Sync to clients | `mech call addon.sync '{"addon": "NAME"}'` (add `"dry_run": true` to preview) |

---

## Environment Check

```bash
# Verify your setup
mech call env.status
mech call tools.status
mech status
```

`env.status` reports the WoW root, the dev path, the data directory and which configured flavors (`_retail_`, `_beta_`, `_ptr_`) exist. `tools.status` reports Luacheck, StyLua and Lua availability.

---

## Related Guides

- [Release Automation](./release.md)
- [Troubleshooting](./troubleshooting.md)
- [CLI Reference](../cli-reference.md)
