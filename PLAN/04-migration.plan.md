# Phase 4: Migration

Updates existing addons (ActionHud, WimpyAuras) to use MechanicLib and removes the DevMarker.lua pattern.

---

## Prerequisites

- Phases 1-3 complete:
  - !Mechanic fully functional
  - MechanicLib API stable
  - lib_sync configured and working
- ActionHud and WimpyAuras accessible

## Reference

- [MASTER_PLAN.md](MASTER_PLAN.md) - Section 3 (MechanicLib API)
- ActionHud/AGENTS.md - Current debug patterns
- WimpyAuras/AGENTS.md - TestRunner integration

---

## Scope

### In Scope
- ActionHud MechanicLib integration
- WimpyAuras MechanicLib integration
- Remove DevMarker.lua from both addons
- Update .pkgmeta files
- Conditional debug settings display

### Out of Scope
- Changes to other addons (Weekly, Strategy, etc.) - future work
- MechanicLib API changes

---

## Detailed Requirements

### 1. ActionHud Migration

#### 1.1 Add MechanicLib Dependency

**File**: `ActionHud/embeds.xml`

Add after other libraries (or rely on lib_sync):
```xml
<!-- MechanicLib is loaded via lib_sync, not embeds -->
```

**File**: `ActionHud/ActionHud.toc`

Add optional dependency:
```toc
## OptionalDeps: !Mechanic
```

#### 1.2 Update Core.lua

**File**: `ActionHud/Core.lua`

Add near top:
```lua
local MechanicLib = LibStub("MechanicLib-1.0", true)
```

Update OnInitialize:
```lua
function ActionHud:OnInitialize()
    -- Existing initialization...
    
    -- Register with Mechanic if available
    if MechanicLib and MechanicLib:IsEnabled() then
        self:RegisterWithMechanic()
    end
end

function ActionHud:RegisterWithMechanic()
    MechanicLib:Register("ActionHud", {
        version = GetAddOnMetadata("ActionHud", "Version"),
        
        -- Debug buffer
        getDebugBuffer = function() return self.debugBuffer end,
        clearDebugBuffer = function() wipe(self.debugBuffer) end,
        
        -- Settings exposed to Mechanic
        settings = {
            debugMode = {
                type = "toggle",
                name = "Debug Mode",
                desc = "Enable verbose debug logging",
                get = function() return self.db.profile.debugMode end,
                set = function(_, v)
                    self.db.profile.debugMode = v
                    self:Print("Debug mode:", v and "enabled" or "disabled")
                end,
            },
        },
    })
end
```

#### 1.3 Update Logging

Replace direct buffer writes with MechanicLib:Log:
```lua
-- OLD
function ActionHud:Debug(msg)
    if self.debugRecording then
        table.insert(self.debugBuffer, msg)
    end
end

-- NEW
function ActionHud:Debug(msg, category)
    -- Always buffer locally
    table.insert(self.debugBuffer, msg)
    if #self.debugBuffer > 500 then
        table.remove(self.debugBuffer, 1)
    end
    
    -- Forward to Mechanic if available
    if MechanicLib then
        MechanicLib:Log("ActionHud", msg, category or MechanicLib.Categories.CORE)
    end
end
```

#### 1.4 Update SettingsUI.lua

**File**: `ActionHud/SettingsUI.lua`

Conditionally show debug section:
```lua
function ActionHud:GetOptions()
    local options = {
        -- Existing options...
    }
    
    -- Only show debug section if Mechanic is installed
    if MechanicLib and MechanicLib:IsEnabled() then
        options.args.debug = {
            type = "group",
            name = "Debug",
            order = 100,
            args = {
                header = {
                    type = "description",
                    name = "|cff88ff88!Mechanic detected|r - Full debug tools available via /mech",
                    order = 1,
                },
                openMechanic = {
                    type = "execute",
                    name = "Open !Mechanic",
                    order = 2,
                    func = function()
                        if Mechanic then Mechanic:ToggleMainFrame() end
                    end,
                },
            },
        }
    end
    
    return options
end
```

#### 1.5 Remove DevMarker.lua

**Delete**: `ActionHud/DevMarker.lua`

**Update**: `ActionHud/ActionHud.toc`
```toc
# Remove these lines:
#@debug@
DevMarker.lua
#@end-debug@
```

**Update**: `ActionHud/.pkgmeta` (if exists)
Remove any DevMarker exclusion rules.

#### 1.6 Update AGENTS.md

**File**: `ActionHud/AGENTS.md`

Update Development Mode section:
```markdown
## Development Mode

ActionHud detects development mode via MechanicLib:

```lua
local MechanicLib = LibStub("MechanicLib-1.0", true)
local isDeveloper = MechanicLib and MechanicLib:IsEnabled()
```

When !Mechanic is installed:
- Debug settings appear in ActionHud options
- Debug logs forward to Mechanic console
- Use `/mech` to access full debug tools

The old DevMarker.lua pattern has been removed.
```

**Acceptance Criteria**:
- [x] ActionHud loads without errors (with and without !Mechanic)
- [x] Registration appears in Mechanic's registered addons
- [x] Debug logs appear in Mechanic console
- [x] Settings appear in Mechanic's Registered Addons section
- [x] Debug section only shows when Mechanic installed
- [x] DevMarker.lua removed
- [x] TOC updated (no DevMarker reference)

---

### 2. WimpyAuras Migration

#### 2.1 Add MechanicLib Dependency

**File**: `WimpyAuras/WimpyAuras.toc`

Add optional dependency:
```toc
## OptionalDeps: !Mechanic, !BugGrabber
```

#### 2.2 Update Core.lua

**File**: `WimpyAuras/Core.lua`

Add near top:
```lua
local MechanicLib = LibStub("MechanicLib-1.0", true)
```

Add registration:
```lua
function WimpyAuras:OnInitialize()
    -- Existing initialization...
    
    -- Register with Mechanic if available
    if MechanicLib and MechanicLib:IsEnabled() then
        self:RegisterWithMechanic()
    end
end

function WimpyAuras:RegisterWithMechanic()
    MechanicLib:Register("WimpyAuras", {
        version = GetAddOnMetadata("WimpyAuras", "Version"),
        
        -- Debug buffer
        getDebugBuffer = function() return self.debugBuffer end,
        clearDebugBuffer = function() wipe(self.debugBuffer) end,
        
        -- Test integration
        tests = {
            getAll = function() return self.TestRunner.testList end,
            getCategories = function() return self.TestRunner:GetCategories() end,
            run = function(id) return self.TestRunner:RunTest(id) end,
            runAll = function() return self.TestRunner:RunAll() end,
            getResult = function(id) return self.TestRunner:GetResult(id) end,
            clearResults = function() self.TestRunner:ClearResults() end,
            validate = function(id) return self.TestRunner:ValidateTest(id) end,
        },
        
        -- Settings exposed to Mechanic
        settings = {
            debugMode = {
                type = "toggle",
                name = "Debug Mode",
                desc = "Enable verbose debug logging",
                get = function() return self.debugMode end,
                set = function(_, v) self.debugMode = v end,
            },
            debugRecording = {
                type = "toggle",
                name = "Debug Recording",
                desc = "Record debug logs to buffer",
                get = function() return self.debugRecording end,
                set = function(_, v)
                    if v then self:StartDebugRecording()
                    else self:StopDebugRecording() end
                end,
            },
        },
    })
end
```

#### 2.3 Update Logging

**File**: `WimpyAuras/Core.lua`

```lua
function WimpyAuras:Log(msg, category)
    -- Format with category
    local formatted = category and (category .. " " .. msg) or msg
    
    -- Local buffer
    table.insert(self.debugBuffer, formatted)
    if #self.debugBuffer > 500 then
        table.remove(self.debugBuffer, 1)
    end
    
    -- Forward to Mechanic
    if MechanicLib then
        MechanicLib:Log("WimpyAuras", msg, category)
    end
end
```

#### 2.4 Conditional Test UI

The existing TestUI can remain as a standalone option, but tests will also appear in Mechanic:

**File**: `WimpyAuras/TestUI.lua`

Add to the UI:
```lua
function TestUI:CreateFrame()
    -- Existing code...
    
    -- Add Mechanic integration note if available
    if MechanicLib and MechanicLib:IsEnabled() then
        local mechNote = AceGUI:Create("Label")
        mechNote:SetText("|cff88ff88Tip: Tests also available in /mech|r")
        mechNote:SetFullWidth(true)
        frame:AddChild(mechNote)
    end
end
```

#### 2.5 Remove DevMarker.lua

**Delete**: `WimpyAuras/DevMarker.lua`

**Update**: `WimpyAuras/WimpyAuras.toc`
```toc
# Remove these lines:
#@debug@
DevMarker.lua
#@end-debug@
```

#### 2.6 Update AGENTS.md

**File**: `WimpyAuras/AGENTS.md`

Update Development Mode section:
```markdown
## Development Mode

WimpyAuras detects development mode via MechanicLib:

```lua
local MechanicLib = LibStub("MechanicLib-1.0", true)
local isDeveloper = MechanicLib and MechanicLib:IsEnabled()
```

When !Mechanic is installed:
- Debug settings appear in Mechanic's settings
- Debug logs forward to Mechanic console
- Tests appear in Mechanic's Tests tab
- Use `/mech tests` to run tests from Mechanic

The standalone Test UI (`/wa tests`) remains available.
The old DevMarker.lua pattern has been removed.
```

**Acceptance Criteria**:
- [x] WimpyAuras loads without errors (with and without !Mechanic)
- [x] Registration includes test capabilities
- [x] Tests appear in Mechanic's Tests tab
- [x] Test run/results work through Mechanic
- [x] Debug logs appear in Mechanic console
- [x] DevMarker.lua removed
- [x] Standalone TestUI still works

---

### 3. lib_sync Verification

Run lib_sync to deploy MechanicLib:

```powershell
cd "C:\Program Files (x86)\World of Warcraft\_dev_\ADDON_DEV\Tools\LibrarySync"
.\lib_sync.ps1
```

Verify:
- [x] `ActionHud/Libs/MechanicLib/MechanicLib.lua` exists
- [x] `WimpyAuras/Libs/MechanicLib/MechanicLib.lua` exists (in WimpyAurasDev)
- [x] Files match source in `!Mechanic/Libs/MechanicLib/`

---

### 4. Testing Matrix

| Scenario | Expected Result |
|----------|-----------------|
| ActionHud alone | Loads, no Mechanic features |
| ActionHud + !Mechanic | Debug section shows, logs forward |
| WimpyAuras alone | Loads, TestUI works standalone |
| WimpyAuras + !Mechanic | Tests in Mechanic, logs forward |
| All three together | Full integration, all features work |
| !Mechanic alone | Shows empty registered addons |

---

## Testing Checklist

### ActionHud
- [x] Loads without !Mechanic (no errors)
- [x] Loads with !Mechanic (registration works)
- [x] Debug logs appear in Console
- [x] Settings appear in Registered Addons
- [x] Debug section only visible with Mechanic

### WimpyAuras
- [x] Loads without !Mechanic (no errors)
- [x] Loads with !Mechanic (registration works)
- [x] Tests appear in Tests tab
- [x] Can run tests from Mechanic
- [x] Results sync between Mechanic and TestUI
- [x] Debug logs appear in Console

### Integration
- [x] Both addons register successfully
- [x] No duplicate log entries
- [x] lib_sync deployed MechanicLib correctly

---

## Post-Migration Cleanup

1. **Remove old files**:
   - `ActionHud/DevMarker.lua`
   - `WimpyAuras/DevMarker.lua` (if exists)

2. **Update documentation**:
   - ActionHud/AGENTS.md
   - WimpyAuras/AGENTS.md

3. **Verify CurseForge packages**:
   - DevMarker.lua no longer referenced
   - .pkgmeta exclusions removed

---

## Validation Workflow

Run these MCP tools after completing Phase 4:

```powershell
# Validate all TOCs (including ActionHud, WimpyAuras)
mcp_AddonDevTools_validate_tocs()

# Lint all affected addons
mcp_AddonDevTools_lint_addon({ name = "!Mechanic" })
mcp_AddonDevTools_lint_addon({ name = "ActionHud" })
mcp_AddonDevTools_lint_addon({ name = "WimpyAuras" })

# Verify lib_sync deployed MechanicLib correctly
mcp_AddonDevTools_check_libraries()

# Full deprecation scan
mcp_AddonDevTools_scan_deprecations({ addon_name = "ActionHud" })
mcp_AddonDevTools_scan_deprecations({ addon_name = "WimpyAuras" })
```

---

## Future Migrations

Other addons to consider for future MechanicLib integration:
- Weekly
- Strategy  
- Flightsim
- ClassyMap

Each follows the same pattern:
1. Add MechanicLib dependency via lib_sync
2. Call MechanicLib:Register() in OnInitialize
3. Forward logs via MechanicLib:Log()
4. Expose settings via capabilities.settings
5. Remove DevMarker.lua

