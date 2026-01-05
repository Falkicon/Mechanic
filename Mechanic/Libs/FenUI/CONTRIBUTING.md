# Contributing to FenUI

Thank you for your interest in contributing to FenUI! This document provides guidelines for contributing to the project.

## Philosophy

Before contributing, please understand FenUI's core philosophy:

1. **Blizzard-First**: We build on native WoW UI APIs, not replace them
2. **Graceful Degradation**: Addons must work without FenUI installed
3. **Token Everything**: Never hardcode colors, spacing, or fonts
4. **Semantic Building Blocks**: Flexible primitives over specific components

See [Docs/DESIGN_PRINCIPLES.md](Docs/DESIGN_PRINCIPLES.md) for detailed guidelines.

## Getting Started

1. Fork the repository
2. Clone to your `Interface/ADDON_DEV/` folder
3. Use `lib_sync.ps1` to deploy to test addons (Weekly, Strategy)
4. Make your changes
5. Test in-game
6. Submit a pull request

## Development Workflow

### File Structure

```
FenUI/
├── Core/           # Foundation (tokens, bridge, themes)
├── Widgets/        # UI components
├── Validation/     # API change detection
├── Settings/       # AceConfig integration
└── Docs/           # Documentation
```

### Adding a New Widget

1. Create `Widgets/MyWidget.lua`
2. Follow the Mixin + Factory pattern:

```lua
local MyWidgetMixin = {}

function MyWidgetMixin:Init(config)
    -- Setup using design tokens
    local bg = FenUI:GetColor("surfacePanel")
    -- ...
end

function FenUI:CreateMyWidget(parent, config)
    local widget = CreateFrame("Frame", nil, parent)
    FenUI.Mixin(widget, MyWidgetMixin)
    widget:Init(config or {})
    return widget
end
```

3. Add to `FenUI.toc` and `FenUI.xml`
4. Add semantic tokens to `Core/Tokens.lua` if needed
5. Update documentation

### Design Token Rules

- **Use semantic tokens**: `surfacePanel`, not `gray900`
- **Add new tokens** to `Core/Tokens.lua` with clear names
- **Document tokens** in the README

```lua
-- Good
local r, g, b = FenUI:GetColorRGB("textDefault")

-- Bad
fontString:SetTextColor(0.9, 0.9, 0.9)
```

### Testing

1. **In-game testing**: Load Weekly or Strategy with your changes
2. **Validation**: Run `/fenui validate` to check dependencies
3. **Fallback testing**: Temporarily disable FenUI to test graceful degradation

## Code Style

- Use local variables where possible
- Prefix private functions with underscore: `_PrivateHelper()`
- Use PascalCase for mixins and public APIs
- Use camelCase for local variables and config keys
- Add comments for non-obvious logic

## Pull Request Process

1. Update documentation if needed
2. Add entry to CHANGELOG.md
3. Ensure `/fenui validate` passes
4. Test with consuming addons (Weekly, Strategy)
5. Fill out the PR template completely

## Reporting Issues

- Use the issue templates
- Include `/fenui validate` output
- Include Lua errors if applicable
- Provide minimal reproduction steps

## Questions?

Open a discussion or issue on GitHub. We're happy to help!
