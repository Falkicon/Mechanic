# Blizzard UI Source Reference

The official Blizzard UI source code is mirrored locally and should be your primary reference for understanding Blizzard's UI implementation.

## Local Repositories

| Version | Path |
|---------|------|
| **Live** | `_dev_/wow-ui-source-live/` |
| **Beta** | `_dev_/wow-ui-source-beta/` |

**GitHub Mirror**: [Gethe/wow-ui-source](https://github.com/Gethe/wow-ui-source)

## Key Directories

| Directory | Contents |
|-----------|----------|
| `Blizzard_APIDocumentationGenerated/` | Official API documentation |
| `Blizzard_Deprecated/` | API transition guides (essential for version updates) |
| `Blizzard_ActionBar/` | Action bar implementation |
| `Blizzard_UnitFrame/` | Unit frame implementation |
| `Blizzard_NamePlates/` | Nameplate implementation |
| `Blizzard_Cooldown/` | Cooldown frame implementation |
| `Blizzard_Settings/` | Settings panel implementation |
| `Blizzard_DebugTools/` | Debug tools (/dump, /fstack) |
| `FrameXML/` | Core UI framework |
| `SharedXML/` | Shared utilities |

## Searching the Source

Use ripgrep directly on the local repos:

```bash
# Search for pattern in live source
rg "UnitFrame" "_dev_/wow-ui-source-live/"

# Search for specific API usage
rg "RegisterStateDriver" "_dev_/wow-ui-source-live/" -g "*.lua"

# Find template definitions
rg "SecureActionButtonTemplate" "_dev_/wow-ui-source-live/" -g "*.xml"
```

## Common Patterns to Study

### Frame Templates
- `UIPanelButtonTemplate` - Standard button
- `BackdropTemplate` - Frame backgrounds
- `SecureActionButtonTemplate` - Protected action buttons

### Event Handling
- Search for `RegisterEvent` and `OnEvent` patterns

### Secure Code
- `SecureHandlerSetFrameRef` - Secure frame references
- `RegisterStateDriver` - State-based visibility

## Use Cases

1. **Find API Examples** — Search for how Blizzard uses specific APIs
2. **Understand Templates** — Study XML files for frame inheritance patterns
3. **API Migration** — Check `Blizzard_Deprecated/` for transition guides when APIs change
4. **Reverse Engineering** — Understand complex UI behaviors by reading source

## Updating Local Mirrors

```bash
# Live
cd "_dev_/wow-ui-source-live"
git pull origin live

# Beta
cd "_dev_/wow-ui-source-beta"
git pull origin main
```

## Tips

- Search for function names you see in errors
- Look at how Blizzard handles edge cases
- XML templates define structure, Lua handles logic
- SharedXML has reusable patterns
- Check `Blizzard_Deprecated/` when APIs break after patches
