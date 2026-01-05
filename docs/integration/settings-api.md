# WoW Settings API Reference - Agent Documentation

The native WoW Settings panel (introduced in 11.0) uses category IDs that are **not publicly documented**. Use this reference to navigate and integrate with the settings UI.

---

## Opening Settings Panels Programmatically

```lua
-- Open to a specific category by ID
Settings.OpenToCategory(categoryID)

-- Example: Open directly to "Gameplay Enhancements"
Settings.OpenToCategory(42)
```

## Discovering Category IDs

To find category IDs, use `SettingsPanel:GetAllCategories()`:

```lua
if SettingsPanel and SettingsPanel.GetAllCategories then
    for i, cat in ipairs(SettingsPanel:GetAllCategories()) do
        local name = cat:GetName()
        local id = cat:GetID()
        print(i .. ": " .. name .. " (ID: " .. id .. ")")
    end
end
```

---

## Known Category IDs (WoW 11.x)

> **Note**: These IDs may change between patches. Always use `GetAllCategories()` to discover current IDs at runtime.

| ID | Category Name |
|----|---------------|
| 29 | Controls |
| 30 | Interface |
| 31 | Combat |
| 32 | Action Bars |
| 33 | Social |
| 34 | Ping System |
| 35 | Keybindings |
| **42** | **Gameplay Enhancements** |
| 36 | NoDisplayKB |
| 28 | Interface (Accessibility) |
| 37 | General |
| 38 | Colors |
| 39 | Text To Speech |
| 40 | Mounts |
| 41 | Subtitles |
| 24 | Graphics |
| 25 | Audio |
| 26 | Languages |
| 27 | Network |

---

## Key Insight

- `Settings.OpenToCategory(numericID)` navigates to a category
- AddOns in the list have string IDs (e.g., "ActionHud", "Weekly")
- Blizzard Game categories have numeric IDs
- The `SettingsPanel` global provides access to category management functions
