# !Mechanic - Frame Picker Debug Log

## Current Baseline (Run 12 - SUCCESS ✓)

**Commit**: `32b57a5` - "feat(inspect): Run 12 SUCCESS - NO-OVERLAY frame picking"

**What Works**:
- ✅ Click detection via `GLOBAL_MOUSE_DOWN` event
- ✅ `GetMouseFoci()` sees real frames (no overlay blocking)
- ✅ Frame path populates in input field
- ✅ Tree view shows ancestors/children
- ✅ Details panel shows frame properties
- ✅ Pick button toggle works correctly

**Known Issues** (non-blocking):
- ⚠️ No gold highlight border during picking (Run 13)
- ⚠️ No ESC key handling (Run 13)

---

## The Key Insight (WoW 11.0+ API Change)

After **11 failed attempts**, we discovered a fundamental WoW 11.0+ API change:

| Old API (Pre-11.0) | New API (11.0+) | Behavior |
|-------------------|-----------------|----------|
| `GetMouseFocus()` | **NIL** (removed) | Used to recalculate on-demand |
| N/A | `GetMouseFoci()` | Returns **cached stack** at frame boundaries |

**Critical**: Any frame with `EnableMouse(true)` blocks the ENTIRE focus stack from `GetMouseFoci()`. The old "disable mouse → query → enable mouse" pattern **cannot work** because `GetMouseFoci()` doesn't recalculate on-demand like `GetMouseFocus()` did.

---

## The Solution: NO-OVERLAY Architecture

### What Failed (Runs 1-11)
```lua
-- This pattern CANNOT work in 11.0+:
local overlay = CreateFrame("Frame")
overlay:EnableMouse(true)  -- Blocks GetMouseFoci()!
overlay:SetScript("OnUpdate", function()
    local foci = GetMouseFoci()  -- Returns {overlay} only!
end)
```

### What Works (Run 12)
```lua
-- Use GLOBAL_MOUSE_DOWN event instead:
local eventFrame = CreateFrame("Frame")
eventFrame:RegisterEvent("GLOBAL_MOUSE_DOWN")
eventFrame:SetScript("OnEvent", function(self, event, button)
    local foci = GetMouseFoci()  -- Returns REAL frames!
    local target = foci[1]
    -- ... filter and select
end)
```

**Key Addition**: Use `C_Timer.After(0.15, ...)` for delayed event registration to skip the initial button click that started pick mode.

---

## Implementation Reference

### StartPicking() Pattern
```lua
function InspectModule:StartPicking()
    -- Show instruction bar (mouse-disabled)
    self.pickBar:Show()
    
    -- Delay event registration to skip initial click
    C_Timer.After(0.15, function()
        if not self.pickMode then return end  -- Already cancelled
        
        self.pickEventFrame:RegisterEvent("GLOBAL_MOUSE_DOWN")
        self.pickEventFrame:SetScript("OnEvent", function(s, event, button)
            if button == "LeftButton" then
                local foci = GetMouseFoci()
                -- Filter out UIParent, WorldFrame, Mechanic frames
                local target = FindValidTarget(foci)
                if target then
                    self:SetSelectedFrame(target, target:GetName())
                end
                self:StopPicking()
            end
        end)
    end)
end
```

### StopPicking() Pattern
```lua
function InspectModule:StopPicking()
    self.pickMode = false
    if self.pickEventFrame then
        self.pickEventFrame:UnregisterAllEvents()
    end
    self.pickBar:Hide()
    self.pickBtn:SetText(L["Pick"])
end
```

---

## Future Work (Run 13+)

1. **Gold highlight border** - Add back visual feedback during picking
2. **ESC key handling** - Allow cancellation via keyboard
3. **Remove debug logs** - Clean up `[Run 12]` prefixed messages
4. **Add to Addon Dev Guide** - Document `GetMouseFoci()` vs `GetMouseFocus()` change

---

## Resources

- **Blizzard UI Examples**: Search `GetMouseFoci` in `wow-ui-source-beta`
- **GLOBAL_MOUSE_DOWN Users**: `ColorPickerFrame.lua`, `Menu.lua`, `SharedTalentUI`
- **Keyboard Consumption**: `SetPropagateKeyboardInput(false)` in `Compositor.lua`
