# TemplateAddon - Agent Documentation

Technical reference for AI agents working on this addon.

---

## Project Intent

[Describe the core purpose and functionality of the addon here.]

---

## File Structure

| File | Purpose |
|------|---------|
| `TemplateAddon/Core.lua` | Main addon initialization and logic |
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
| Format Lua code | `addon.format` |
| Run tests, when a `Tests/` directory exists | `addon.test` |
| Create junction links to WoW clients | `addon.sync` |

The `mech` CLI is a user-facing fallback when MCP is unavailable.

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

## Customization Checklist

After copying this template, replace all instances of:

- [ ] `TemplateAddon` → YourAddonName
- [ ] `TemplateAddonDB` → YourAddonNameDB  
- [ ] `/ta` → Your slash command
- [ ] Update `.toc` metadata (Title, Notes, Author)
- [ ] Update this AGENTS.md with your addon's purpose
