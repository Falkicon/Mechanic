# TemplateAddon - Agent Documentation

Technical reference for AI agents working on this addon.

---

## Project Intent

[Describe the core purpose and functionality of the addon here.]

---

## File Structure

| File | Purpose |
|------|---------|
| `TemplateAddon/Core.lua` | Main addon initialization and logic (also registers with Mechanic when present) |
| `TemplateAddon/DevMarker.lua` | Development mode detection (excluded from releases) |
| `TemplateAddon/embeds.xml` | Library loading manifest |
| `TemplateAddon/Locales/enUS.lua` | English localization strings |
| `TemplateAddon/.luacheckrc` | Linting configuration |
| `TemplateAddon/.pkgmeta` | CurseForge packaging config |

---

## Development Commands

Use Mechanic's MCP tools directly with `{"addon": "TemplateAddon"}`:

| Task | MCP tool |
|------|----------|
| Validate the TOC | `addon.validate` |
| Lint Lua code | `addon.lint` |
| Format Lua code | `addon.format` (`check=true` to only check) |
| Run tests, when `*_spec.lua` files exist (`Tests/` or `Core/`) | `addon.test` / `sandbox.test` |
| Preview junction links to WoW clients | `addon.sync` with `dry_run=true`, then for real after the user confirms |

The `mech` CLI is a user-facing fallback when MCP is unavailable.

### Verifying in game

After installing changes, follow the protocol in `.claude/skills/using-mechanic/SKILL.md` of the Mechanic repository: `diagnostic.targets`, ask the user to `/reload`, wait for explicit confirmation, then `addon.output` with `agent_mode=true` and the same target. Never call `addon.output` straight after an edit. Addon Lua is Lua 5.1 (no `goto`, `bit32`, `//`).

---

## Development Mode

The addon detects development mode via `DevMarker.lua`:

```lua
-- In your addon code:
if ns.IS_DEV_MODE then
    -- Enable debug features
end
```

This file is present when running from source but excluded from CurseForge releases via `.pkgmeta`.

---

## Mechanic integration (optional)

`Core.lua` registers with `MechanicLib-1.0` (provided by the `!Mechanic` addon, not embedded) when it is present, so the addon appears in Mechanic's Console, Tests and Performance tabs. It is a no-op without Mechanic. Log debug output with `MechanicLib:Log(ADDON_NAME, message, MechanicLib.Categories.CORE)` instead of `print`. API and capabilities: `.claude/skills/k-mechanic/references/mechaniclib.md` in the Mechanic repository.

---

## Customization Checklist

`addon.create` renames `TemplateAddon` (files and text) and the author placeholder automatically. After copying this template by hand or via `addon.create`, check and replace:

- [ ] `TemplateAddon` -> YourAddonName (everywhere, if copied by hand)
- [ ] `TemplateAddonDB` -> YourAddonNameDB
- [ ] `/ta` slash command and its `L["..."]` strings (not renamed automatically)
- [ ] `.toc` metadata (Title, Notes, Author, Interface)
- [ ] This AGENTS.md with your addon's purpose
