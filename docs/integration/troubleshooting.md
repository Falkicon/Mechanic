# Troubleshooting

Common issues and solutions for Mechanic integration.

---

## "Addon not found"

```bash
# Check if Mechanic can find your addon
mech call addon.validate '{"addon": "MyAddon"}'
```

**If not found, ensure:**

1. Addon is in the correct dev folder (`_dev_/MyAddon/`)
2. Folder name matches the addon name exactly
3. The folder contains `MyAddon.toc` (not only a nested folder)

---

## "Tests not running"

1. **Ensure the tools are installed:**
   ```bash
   mech setup
   mech call tools.status
   ```
   `addon.test` needs Busted (on Windows `mech setup-busted` regenerates `busted.bat` once LuaRocks has installed it). `sandbox.test` needs no external Busted.

2. **Check test file naming:** must be `*_spec.lua`

3. **Verify test syntax:** run standalone Busted first
   ```bash
   busted Tests/
   ```

---

## "Console logs not appearing"

1. Ensure both `!Mechanic` and `Mechanic` are loaded in game
2. Output must go through `print()` or `MechanicLib:Log()`. Writes straight to a chat frame (including AceConsole `:Print()`) are not captured.
3. Reload the UI with `/reload` so the data is written to SavedVariables

---

## "Dashboard not updating"

1. **Check the file watcher is running** - the terminal that runs `mech dashboard` shows activity after `/reload`
2. **Verify the SavedVariables path:**
   ```bash
   mech status
   mech --json call sv.discover
   ```
3. **Reload in game:** SavedVariables are written on `/reload`, logout or quit. The dashboard reload button only shows the instruction; it does not reload WoW.
4. **Select a target** when several clients, accounts, characters or profiles exist (`diagnostic.targets`).

---

## "Junction link failed"

On Windows, junction creation uses PowerShell and may require either:

- Running as Administrator, OR
- Developer Mode enabled (Settings -> For Developers)

```bash
# Preview what would be linked, without creating anything
mech call addon.sync '{"addon": "MyAddon", "dry_run": true}'
```

`addon.sync` returns `NO_TOC` when the addon folder has no matching `.toc` and `NO_CLIENT_FOUND` when none of the requested clients are installed (check `MECHANIC_WOW_ROOT`).

---

## "MechanicLib not found"

1. Ensure the `!Mechanic` addon folder is installed next to `Mechanic` in `Interface/AddOns/` (or linked from your dev folder)
2. Check that it is enabled in the WoW addon list
3. In your own addon, use `LibStub("MechanicLib-1.0", true)` and guard for `nil`; `!Mechanic` provides the library, so you do not need to embed it

---

## "Performance metrics not showing"

1. Ensure you registered the `performance` hook with MechanicLib
2. Check that `performance.getSubMetrics()` returns valid data
3. Run `/reload` to sync

---

## "Tools panel not appearing"

1. Verify `tools.createPanel` is registered with MechanicLib
2. Check for Lua errors in the panel creation code
3. Ensure the panel creates frames correctly (use pcall for safety)

---

## Diagnostics

- **Errors:** the Mechanic Errors tab lists BugGrabber errors (install `!BugGrabber`).
- **Health Log:** with **Register Mechanic** enabled in the main frame footer, the Tools tab can view or clear a log of internal Mechanic failures (for example a hub sync that failed).
- **Slash commands:** `/mech` accepts `inspect`, `console`, `errors`, `tests`, `perf`, `tools`, `api`, `reload`, `gc`, `pause` and `clear`. There is no `/mech debug`.

---

## Getting Help

1. **Check the output:** `mech addon.output`
2. **Review [AGENTS.md](../../AGENTS.md):** for AI-assisted debugging
3. **Open an issue:** include the `mech addon.output` results

---

## Related Guides

- [Error Tracking](./errors.md)
- [CLI Workflow](./cli-workflow.md)
