# TemplateAddon - Agent Documentation

Technical reference for AI agents working on this addon.

---

## Project Intent

[Describe the core purpose and functionality of the addon here.]

---

## File Structure

| File | Purpose |
|------|---------|
| `Core.lua` | Main addon initialization and logic |
| `DevMarker.lua` | Development mode detection (excluded from releases) |
| `embeds.xml` | Library loading manifest |
| `Locales/enUS.lua` | English localization strings |
| `.luacheckrc` | Linting configuration |
| `.pkgmeta` | CurseForge packaging config |

---

## Development Commands

Use the `addon-dev` CLI or Mechanic Desktop for development tasks:

```bash
# Validate TOC file
addon-dev validate TemplateAddon

# Lint code
addon-dev lint TemplateAddon

# Format code
addon-dev format TemplateAddon

# Run tests (if Tests/ directory exists)
addon-dev test TemplateAddon

# Create junction links to WoW clients
addon-dev sync TemplateAddon
```

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
