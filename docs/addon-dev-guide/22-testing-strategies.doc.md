# Testing Strategies

> Part of the [Addon Development Guide](../AGENTS.md#addon-development-guide)

Last updated: 2025-12-25

---

## Overview

Systematic testing prevents bugs from reaching users. This guide covers practical testing approaches for WoW addon development.

---

## Testing Environment Setup

### Development Character

Create a dedicated test character:

- **Class**: One with multiple forms/stances (Druid ideal)
- **Level**: Max level for full API access
- **Spec**: Can test multiple specs
- **Location**: Near target dummies and instance portals

### Addon Configuration

```lua
-- Enable script errors in-game
/console scriptErrors 1

-- Enable CPU profiling (requires reload)
/console scriptProfile 1
```

### Required Test Addons

| Addon | Purpose |
|-------|---------|
| !Mechanic | Central hub for logs, errors, and in-game test execution |
| BugGrabber + BugSack | Error capture |
| /dump (built-in) | Variable inspection |
| /fstack (built-in) | Frame inspection |

---

## In-Game Test Execution

While the `TestRunner` tool is preferred for CI/CD and rapid development, `!Mechanic` provides a "Tests" tab for executing tests directly within the WoW client.

### Benefits
- **Real Environment**: Tests run against the actual WoW API (not mocks).
- **Visual Feedback**: Real-time status updates as tests run.
- **Structured Diagnostics**: Supports a `details` array for rich, per-check status reporting (`[✓]`, `[!]`, `[✗]`).
- **Log Capture**: Logs generated during tests are captured and displayed alongside results.

### Implementation
To expose tests to `!Mechanic`, ensure your addon registers with `MechanicLib` and includes a `Tests/` directory in its distribution (if not excluded by `.pkgmeta`).

```lua
-- In your addon's Core.lua or specialized Test file
local MechanicLib = LibStub("MechanicLib", true)
if MechanicLib then
    MechanicLib:AddTestSuite("MyAddon", "Core Logic", {
        ["should initialize"] = function()
            assert(MyAddon.initialized == true)
        end,
        ["should handle events"] = function()
            -- ...
        end,
    })
end
```

---

## Manual Testing Workflow

### 1. Fresh Install Test

```
1. Delete SavedVariables for your addon
2. /reload
3. Verify:
   - Addon loads without errors
   - Default settings applied correctly
   - UI appears as expected
```

### 2. Basic Functionality Test

```
1. Test each slash command
2. Open settings panel
3. Change each setting
4. Verify changes apply immediately
5. /reload and verify settings persist
```

### 3. Combat Test

```
1. Find a target dummy or safe mob
2. Enter combat
3. Verify addon behavior during combat
4. Watch for "action blocked" errors
5. Exit combat
6. Verify any queued changes apply
```

---

## Edge Case Scenarios

### Zone Transitions

| Test | Steps |
|------|-------|
| Login | Log out, log back in |
| Reload | `/reload` |
| Zone change | Walk to new zone |
| Instance entry | Enter dungeon/raid |
| Instance exit | Leave instance |

### Character State Changes

| Test | Steps |
|------|-------|
| Spec change | Switch specializations |
| Talent change | Change a talent |
| Form/stance | Shapeshift (Druid) or stance change |
| Mount/dismount | Mount up, dismount |
| Vehicle | Enter/exit vehicle |

### UI State Changes

| Test | Steps |
|------|-------|
| Settings change | Modify addon settings |
| Combat toggle | Enter/exit combat |
| Group join/leave | Join/leave party |
| Pet summon/dismiss | If relevant |

---

## Midnight Testing (12.0)

### Context Matrix

| Context | Secret Values? | Test Focus |
|---------|---------------|------------|
| Open world | No | Normal functionality |
| Dungeon (normal) | Maybe | Watch for degradation |
| Mythic+ | Yes | Verify passthrough works |
| Raid | Yes | Verify passthrough works |
| PvP | Yes | Verify passthrough works |

### Midnight Test Procedure

```
1. Test in open world (baseline)
2. Queue for or enter instance
3. OUT OF COMBAT: Verify full functionality
4. ENTER COMBAT: 
   - Check for Lua errors
   - Verify degraded display works
   - Verify passthrough (StatusBar, Cooldown) works
5. EXIT COMBAT: Verify full functionality returns
6. LEAVE INSTANCE: Verify normal operation
```

### Secret Value Test

```lua
-- Add to your debug command
/run local i=C_Spell.GetSpellCharges(372608); print("Secret:", i and issecretvalue and issecretvalue(i.currentCharges) or "N/A")
```

---

## Regression Testing

### Keep a Test Checklist

Create a file `TESTING.md` in your addon:

```markdown
# Testing Checklist

## Basic
- [ ] Addon loads without errors
- [ ] Slash commands work
- [ ] Settings persist

## Combat
- [ ] No errors in combat
- [ ] Queued changes apply after combat

## Edge Cases
- [ ] Login
- [ ] /reload
- [ ] Zone change
- [ ] Spec change
```

### After Each Change

1. Run through affected checklist items
2. If changing combat code, test in combat
3. If changing settings, test persistence

---

## PTR/Beta Testing

### When Available

1. Copy character to PTR/Beta
2. Install addon (may need manual copy)
3. Update `## Interface` if needed
4. Run full test suite
5. Document any failures

### Prioritize Testing

| Priority | Test |
|----------|------|
| High | Core functionality |
| High | Combat behavior |
| Medium | Settings persistence |
| Medium | Edge cases |
| Low | Polish/cosmetic issues |

---

## Debug Command Library

Include these in your addon for testing:

```lua
local commands = {}

function commands.status()
    print("[MyAddon] Status")
    print("  Enabled:", AddonDB.enabled)
    print("  In Combat:", InCombatLockdown())
    print("  Frame Visible:", MyFrame:IsVisible())
end

function commands.debug()
    print("=== MyAddon Debug ===")
    print("Version:", GetAddOnMetadata("MyAddon", "Version"))
    print("Interface:", select(4, GetBuildInfo()))
    print("Locale:", GetLocale())
    print("---")
    DevTools_Dump(AddonDB)  -- Dump SavedVariables
    print("=====================")
end

function commands.reset()
    if InCombatLockdown() then
        print("Cannot reset in combat")
        return
    end
    wipe(AddonDB)
    ReloadUI()
end

function commands.test()
    -- Trigger specific test scenarios
    print("Running test...")
    TestFeature()
end
```

---

## Automated Checks

### Pre-Commit Checks

Before committing, verify:

```lua
-- No debug prints left enabled
local DEBUG = false  -- Should be false

-- No test code
-- function TestFeature() should be removed or disabled
```

### Lua Linter

Use luacheck for static analysis:

```yaml
# .luacheckrc
std = "lua51+wow"
ignore = {"212"}  -- Unused arguments (common in event handlers)
```

---

## Automated Testing

The `ADDON_DEV` environment includes an automated testing framework using a Busted-compatible shim and a mock WoW API.

### Test Structure

Tests live in the `Tests/` directory of your addon and follow the `*_spec.lua` naming convention.

```lua
-- MyAddon/Tests/core_spec.lua
describe("MyAddon Core", function()
    before_each(function()
        WoWAPI_ResetAll()
    end)

    it("should initialize correctly", function()
        -- Test logic here
        assert.is_not_nil(MyAddon)
    end)
end)
```

### Mock WoW API

The framework provides a mock environment (`ADDON_DEV/Testing/`) that simulates WoW's global functions and namespaces:
- **Core API**: `CreateFrame`, `GetTime`, `UnitName`, etc. (in `wow_api.lua`)
- **Namespaces**: `C_Spell`, `C_Timer` (in `wow_api_c_spell.lua`, `wow_api_c_timer.lua`)
- **Midnight**: `issecretvalue` simulation (in `wow_api_midnight.lua`)

### Running Tests

Use the CLI test runner:

```powershell
# Run tests for a specific addon
addon-dev test "MyAddon"

# Run tests for all addons
addon-dev test --all

# Run with code coverage
addon-dev test "MyAddon" --coverage

# Run with coverage threshold enforcement
addon-dev test "MyAddon" --coverage --threshold 80
```

### Integration

- **MCP**: Use `run_tests("MyAddon")` directly in the chat.
- **CI/CD**: Tests are automatically run in GitHub Actions on every PR and push to `main`.

### Code Coverage

Generate coverage reports to identify untested code paths.

```powershell
# Generate coverage report
addon-dev test "MyAddon" --coverage

# Fail if coverage is below threshold
addon-dev test "MyAddon" --coverage --threshold 80

# Open HTML report in browser
addon-dev test "MyAddon" --coverage --open
```

**Coverage Output**:
- **Console**: Per-file coverage percentages
- **HTML**: Interactive report in `.coverage/html/index.html`
- **History**: Historical data in `.coverage/history/` for trend analysis

**Coverage Requirements**:
- **Source Loading**: Tests MUST `require()` source files (not just mock functions inline) to collect accurate execution data.
- **Collector**: Uses `debug.sethook` to track line execution; no external dependencies required.
- **Optimization**: Secret values and combat-only code may show lower coverage—this is normal. Use in-game testing for these paths.

---

## Technical Research Workflow

Before fixing a complex bug or implementing a new Midnight feature, use the research tools to ground your understanding.

### 1. Fast Web Research (Preferred)
- **Action**: Use `addon-dev research "prompt"` via CLI.
- **Purpose**: Quick web search using Gemini 3 Flash with Google Search grounding (~15-30s).
- **Example**: `addon-dev research "C_UnitAuras.GetAuraDataByAuraInstanceID WoW 12.0 changes"`

### 2. Deep Analysis (When Needed)
- **Action**: Use `addon-dev research "prompt" --mode thinking` via CLI.
- **Purpose**: More thorough analysis using Gemini 3 Pro for complex comparisons (~30-90s).
- **Example**: `addon-dev research "Compare secret value handling patterns for health bars in WoW 12.0" --mode thinking`

### 3. Multi-Step Investigation (Rare)
- **Action**: Use `research_deep(prompt)` via MCP.
- **Purpose**: Autonomous multi-step research for complex investigations requiring synthesis from many sources (2-10 min, use sparingly).
- **Example**: `research_deep("Analyze all C_UnitAuras changes in WoW 12.0 and their impact on addon development")`

### 2. Blizzard UI Exploration
- **Action**: Use `search_blizzard_ui(query)` via MCP.
- **Purpose**: Find how Blizzard's own code handles a specific frame or event.
- **Example**: `search_blizzard_ui("CompactPartyFrame_UpdateHealth")`

---

## Testing Pure Utility Modules

Modules like `Utils.lua` that contain logic but no UI frames are ideal candidates for unit testing. Use a mocking pattern to simulate the WoW environment.

### Mocking Pattern
1.  **Define Global Mocks**: Set up functions like `GetTime`, `GetBuildInfo`, and namespaces like `C_Spell`.
2.  **Load the Module**: Use `loadfile` (or `io.open` + `load`) to execute the Lua file in the mock environment.
3.  **Assert Behavior**: Verify logic across different states (e.g., Midnight vs. Non-Midnight).

### Example (from ActionHud and Weekly)
```lua
-- Tests/test_utils.lua (ActionHud)
_G = _G or {}
GetBuildInfo = function() return "11.2.8", "58234", "Dec 22 2025", 120000 end

local ns = {}
local chunk = loadfile("Utils.lua")
chunk("MyAddon", ns)
local Utils = ns.Utils

-- Test logic
assert(Utils.IS_MIDNIGHT == true)

-- Tests/core_spec.lua (ClassyMap)
-- Tests combat queue logic by mocking InCombatLockdown
it("should queue functions when IN combat", function()
    _G.InCombatLockdown = function() return true end
    ClassyMap:RunSafe(testFunc)
    assert.is_equal(1, #ClassyMap.combatQueue)
end)

-- Tests/test_journal.lua (Weekly)
-- Tests stateful logic like weekly reset detection by mocking C_DateAndTime
C_DateAndTime = {
    GetServerTimeLocal = function() return 1734566400 end -- Tuesday
}
-- ...
```

### Pattern: Public Utils Table (Flightsim)

For addons where functions are normally local, refactor pure logic into a public `Utils` table to enable direct testing without complex `loadfile` environments.

```lua
-- UI.lua
FlightsimUI.Utils = {}

local function Clamp(n, minV, maxV)
    -- ...
end
FlightsimUI.Utils.Clamp = Clamp
```

```lua
-- Tests/helpers_spec.lua
describe("Helpers", function()
    it("should clamp values", function()
        assert.are.equal(5, FlightsimUI.Utils.Clamp(5, 0, 10))
    end)
end)
```

### Pattern: Animation Mocking (FenUI)

Testing declarative animations requires mocking the WoW `AnimationGroup` and `Animation` objects. Since animations are time-dependent, unit tests focus on verifying the *configuration* and *state transitions* rather than visual output.

**Key Techniques**:
1.  **Mock `CreateAnimationGroup`**: Track created groups on the frame.
2.  **Mock `CreateAnimation`**: Return a table that captures parameters (`SetDuration`, `SetScaleFrom`, etc.).
3.  **Simulate Playback**: Manually trigger `OnFinished` scripts to test chaining (`.Then()`).

**Example (from Animation_spec.lua)**:
```lua
it("should configure scale animations correctly", function()
    local frame = CreateFrame("Frame")
    local config = { scale = { from = 1, to = 1.1 }, duration = 0.2 }
    local anim = FenUI.Animation:Define(config)
    
    anim:Play(frame)
    
    local ag = frame.fenUIAnims.default
    local scaleAnim = ag.animations[1]
    assert.is_equal(1, scaleAnim.fromScaleX)
    assert.is_equal(1.1, scaleAnim.toScaleX)
    assert.is_equal(0.2, scaleAnim.duration)
end)
```

---

## Performance Testing

### Memory Baseline

```lua
/run UpdateAddOnMemoryUsage(); print("Memory:", GetAddOnMemoryUsage("MyAddon"), "KB")
```

### CPU Baseline

```lua
/run UpdateAddOnCPUUsage(); print("CPU:", GetAddOnCPUUsage("MyAddon"), "ms")
```

### Acceptable Ranges

| Metric | Idle | Active | Concern |
|--------|------|--------|---------|
| Memory | <500 KB | <2 MB | >5 MB |
| CPU | <1 ms/s | <10 ms/s | >50 ms/s |

---

## Quick Reference

```
Before Release:
1. Fresh install test
2. /reload test  
3. Combat test
4. Settings persistence test
5. Performance check
6. Code coverage check (addon-dev test --coverage --threshold 60)

Before Midnight:
1. PTR/Beta test when available
2. Instance combat test
3. Secret value handling test
4. Document any limitations
5. Run deprecation scan (addon-dev fix-deprecations MyAddon)
```

---

## See Also

- [First-Run Checklist](./14-first-run-checklist.doc.md) - Complete release checklist
- [Debugging](./10-debugging.doc.md) - Debug tools and patterns
- [Midnight Readiness](./12-midnight-readiness.doc.md) - Midnight-specific testing


