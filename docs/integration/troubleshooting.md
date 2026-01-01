# Troubleshooting

Common issues and solutions for Mechanic integration.

---

## "Addon not found"

```bash
# Check if Mechanic can find your addon
mech call addon.validate -i '{"addon": "MyAddon"}'
```

**If not found, ensure:**

1. Addon is in the correct dev folder (`_dev_/MyAddon/`)
2. Folder name matches the addon name exactly
3. Contains a valid `.toc` file

---

## "Tests not running"

1. **Ensure Busted is installed:**
   ```bash
   mech setup
   ```

2. **Check test file naming:** Must be `*_spec.lua`

3. **Verify test syntax:** Run standalone Busted first
   ```bash
   busted Tests/
   ```

---

## "Console logs not appearing"

1. Ensure Mechanic addon is loaded in-game
2. Check that your addon prints to default output (not a custom frame)
3. Reload UI to sync:
   ```bash
   mech reload
   ```

---

## "Dashboard not updating"

1. **Check file watcher is running** — Terminal should show activity on reload
2. **Verify SavedVariables path:**
   ```bash
   mech call env.info
   ```
3. **Try manual reload:** Click "Reload" button in dashboard

---

## "Junction link failed"

On Windows, junction creation requires either:

- Running as Administrator, OR
- Developer Mode enabled (Settings → For Developers)

```bash
# Check current links
mech call addon.sync -i '{"addon": "MyAddon"}' 
```

---

## "MechanicLib not found"

1. Ensure `!Mechanic` addon is installed in your dev folder
2. Check that it's enabled in WoW addon list
3. Verify the `.toc` file loads `Libs/MechanicLib/MechanicLib.lua`

---

## "Performance metrics not showing"

1. Ensure you've registered the `performance` hook with MechanicLib
2. Check that `GetPerformanceSubMetrics()` returns valid data
3. Reload WoW to sync: `mech reload`

---

## "Tools panel not appearing"

1. Verify `tools.createPanel` is registered with MechanicLib
2. Check for Lua errors in the panel creation code
3. Ensure the panel creates frames correctly (use pcall for safety)

---

## Debug Mode

Enable debug output for more information:

```lua
-- In-game
/mech debug

-- Or set in SavedVariables
MechanicDB.profile.debug = true
```

---

## Getting Help

1. **Check the logs:** `mech addon.output`
2. **Review AGENTS.md:** For AI-assisted debugging
3. **Open an issue:** Include `mech addon.output` results

---

## Related Guides

- [Error Tracking](./errors.md)
- [CLI Workflow](./cli-workflow.md)
