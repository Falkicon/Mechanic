# AFD for Addons: Command-First Addon Architecture

**Applying Agent-First Development principles to World of Warcraft addons.**

---

## The Problem: Addons Are Opaque

Traditional WoW addons are built UI-first:
- Business logic lives inside frame scripts
- State is scattered across UI components
- Testing requires running the game client
- AI agents can't interact with addon functionality

**Sound familiar?** This is exactly the problem AFD solves for web applications.

---

## The AFD Translation

| AFD Principle | WoW Addon Equivalent |
|--------------|---------------------|
| Commands ARE the application | **Actions ARE the addon** |
| CLI validation before UI | **Sandbox testing before in-game** |
| CommandResult with confidence/reasoning | **ActionResult with structured output** |
| UI is just a projection | **Frames are just projections of state** |

---

## The Three-Layer Architecture (Headless Design)

```
┌─────────────────────────────────────────────────────────────────────────────┐
│                            YOUR ADDON                                        │
├─────────────────────────────────────────────────────────────────────────────┤
│                                                                             │
│  ┌─────────────────────────────────────────────────────────────────────┐   │
│  │                      LAYER 1: CORE (Pure Lua 5.1)                   │   │
│  │                                                                     │   │
│  │   • Actions (business logic as pure functions)                      │   │
│  │   • Data structures and transformations                            │   │
│  │   • Validation, calculations, algorithms                            │   │
│  │                                                                     │   │
│  │   ✅ RUNS IN SANDBOX — No WoW dependencies                          │   │
│  └─────────────────────────────────────────────────────────────────────┘   │
│                                    ▲                                        │
│                                    │ ActionResult                           │
│                                    │                                        │
│  ┌─────────────────────────────────┴───────────────────────────────────┐   │
│  │                  LAYER 2: BRIDGE (Blizzard API Adapter)             │   │
│  │                                                                     │   │
│  │   • Context builders (WoW APIs → context tables)                    │   │
│  │   • Event handlers (translate events → action calls)                │   │
│  │   • Command executors (slash commands → actions)                    │   │
│  │                                                                     │   │
│  │   ⚠️ REQUIRES WoW — Tested in-game via MechanicLib                  │   │
│  └─────────────────────────────────────────────────────────────────────┘   │
│                                    ▲                                        │
│                                    │ Commands                               │
│                                    │                                        │
│  ┌─────────────────────────────────┴───────────────────────────────────┐   │
│  │                      LAYER 3: VIEW (UI Frames)                      │   │
│  │                                                                     │   │
│  │   • Frame creation and layout                                       │   │
│  │   • Event binding (OnClick → bridge calls)                          │   │
│  │   • Visual updates from ActionResults                               │   │
│  │                                                                     │   │
│  │   ⚠️ REQUIRES WoW — Visual verification only                        │   │
│  └─────────────────────────────────────────────────────────────────────┘   │
│                                                                             │
└─────────────────────────────────────────────────────────────────────────────┘
```

**The key insight**: Core layer is "headless" — it has no knowledge of WoW or UI. All WoW data arrives via context parameters, just like AFD commands receive input via schemas.

---

## Layer Responsibilities

| Layer | Contains | Testable In |
|-------|----------|-------------|
| **Core** | Pure functions, business logic, data transforms | Sandbox (Lua 5.1) |
| **Bridge** | WoW API calls, event routing, context building | In-game (MechanicLib) |
| **View** | Frames, textures, visual updates | In-game (visual) |

---

## The Command Flow

```lua
-- VIEW → BRIDGE → CORE → BRIDGE → VIEW

-- 1. VIEW: User clicks button
MainFrame.calculateButton:SetScript("OnClick", function()
    Bridge:Execute("combat.calculateDPS")
end)

-- 2. BRIDGE: Builds context, calls action
function Bridge:Execute(actionName, params)
    local context = self:BuildContext()
    local action = Core.Actions:Get(actionName)
    local result = action(context, params)
    self:HandleResult(actionName, result)
end

-- 3. CORE: Pure function, no WoW knowledge
Core.Actions["combat.calculateDPS"] = function(context, params)
    local damage = context.combat.totalDamage
    local duration = context.combat.duration
    
    if duration <= 0 then
        return {
            success = false,
            error = { code = "INVALID_DURATION", message = "Duration must be > 0" }
        }
    end
    
    return {
        success = true,
        data = { dps = damage / duration },
        reasoning = string.format("%.0f damage / %.1f seconds", damage, duration)
    }
end

-- 4. BRIDGE: Routes result to view
function Bridge:HandleResult(actionName, result)
    if result.success then
        View:Update(actionName, result.data)
    else
        View:ShowError(result.error)
    end
end
```



## The Action Pattern

Every significant addon capability should be an **Action**:

```lua
-- Traditional (untestable)
function MyAddon:OnButtonClick()
    local playerGold = GetMoney()
    local threshold = self.db.profile.threshold
    if playerGold > threshold then
        self:ShowAlert("You're rich!")
    end
end

-- AFD Pattern (testable)
local Actions = {}

function Actions.CheckWealth(context)
    -- Pure logic: context provides all dependencies
    local gold = context.gold or 0
    local threshold = context.threshold or 100000
    
    local isRich = gold > threshold
    
    return {
        success = true,
        data = { isRich = isRich, gold = gold, threshold = threshold },
        reasoning = isRich 
            and string.format("Gold (%d) exceeds threshold (%d)", gold, threshold)
            or string.format("Gold (%d) below threshold (%d)", gold, threshold)
    }
end

-- UI just invokes the action
function MyAddon:OnButtonClick()
    local result = Actions.CheckWealth({
        gold = GetMoney(),  -- WoW API call happens at boundary
        threshold = self.db.profile.threshold
    })
    
    if result.data.isRich then
        self:ShowAlert("You're rich!")
    end
end
```

**Key insight**: The action is **pure** — all external data arrives via `context`. This makes it testable in the sandbox.

---

## ActionResult Schema (Lua)

```lua
---@class ActionResult<T>
---@field success boolean
---@field data? T
---@field error? ActionError
---@field confidence? number     -- 0-1 for uncertain results
---@field reasoning? string      -- Why this result
---@field warnings? Warning[]    -- Non-fatal issues

---@class ActionError
---@field code string            -- Machine-readable: "INVALID_INPUT"
---@field message string         -- Human-readable
---@field suggestion? string     -- What to do about it
---@field retryable? boolean

---@class Warning
---@field code string
---@field message string
```

---

## The Honesty Check

> "If it can't be tested in the sandbox, the architecture is wrong."

**Before adding UI**, verify your action works with mock data:

```lua
-- In sandbox test
describe("CheckWealth", function()
    it("returns isRich=true when gold exceeds threshold", function()
        local result = Actions.CheckWealth({
            gold = 500000,
            threshold = 100000
        })
        
        assert.is_true(result.success)
        assert.is_true(result.data.isRich)
        assert.match("exceeds threshold", result.reasoning)
    end)
    
    it("returns isRich=false when gold below threshold", function()
        local result = Actions.CheckWealth({
            gold = 50000,
            threshold = 100000
        })
        
        assert.is_true(result.success)
        assert.is_false(result.data.isRich)
    end)
end)
```

---

## Addon File Structure

```
MyAddon/
├── Core/                          # LAYER 1: Pure Lua 5.1
│   ├── Actions/
│   │   ├── init.lua               # Action registry
│   │   ├── combat.lua             # combat.calculateDPS, combat.parseCLEU
│   │   ├── inventory.lua          # inventory.findItem, inventory.countStacks
│   │   └── config.lua             # config.validate, config.migrate
│   ├── Utils/
│   │   ├── math.lua               # round, clamp, lerp
│   │   └── string.lua             # format, parse, sanitize
│   └── Schemas/
│       └── types.lua              # LuaCATS type definitions
│
├── Bridge/                        # LAYER 2: Blizzard API Adapter
│   ├── Context.lua                # Build context from WoW APIs
│   ├── Events.lua                 # PLAYER_LOGIN → Actions.Init(context)
│   ├── Commands.lua               # /myaddon → routing to actions
│   └── Executor.lua               # Bridge:Execute(actionName, params)
│
├── View/                          # LAYER 3: UI Frames
│   ├── MainFrame.lua
│   ├── SettingsPanel.lua
│   └── Components/
│       ├── Button.lua
│       └── List.lua
│
├── tests/                         # Sandbox tests for Core/
│   ├── test_combat.lua
│   ├── test_inventory.lua
│   └── test_utils.lua
│
├── Libs/                          # External libraries
│   └── ...
│
├── MyAddon.toc                    # Addon manifest
└── MyAddon.lua                    # Entry point, loads all layers
```

---

## Lua 5.1 Constraints

WoW uses Lua 5.1. Your Core layer must avoid:

| ❌ Avoid | ✅ Use Instead |
|---------|---------------|
| `goto` statements | Structured control flow |
| `#` on sparse tables | `ipairs`/`pairs` iteration |
| Bitwise operators (5.2+) | `bit.band`, `bit.bor` (WoW provides) |
| `package.loaded` patterns | Local table modules |



## The WoW Context Bridge

```lua
-- Bridge/WoWContext.lua
local WoWContext = {}

function WoWContext:Build()
    return {
        -- Player state
        gold = GetMoney(),
        playerName = UnitName("player"),
        playerLevel = UnitLevel("player"),
        playerClass = select(2, UnitClass("player")),
        
        -- Config (from SavedVariables)
        config = MyAddon.db.profile,
        
        -- Time
        gameTime = GetTime(),
        serverTime = GetServerTime(),
    }
end

return WoWContext
```

**Usage:**
```lua
local context = WoWContext:Build()
local result = Actions.CheckWealth(context)
```

In the sandbox, you provide mock context:
```lua
local result = Actions.CheckWealth({
    gold = 500000,
    config = { threshold = 100000 }
})
```

---

## What IS an Action (vs what isn't)

| IS an Action | NOT an Action |
|-------------|---------------|
| Calculate DPS from combat data | Show DPS in a frame |
| Validate config values | Open settings panel |
| Parse combat log entry | Handle COMBAT_LOG event |
| Determine best gear | Equip gear (protected API) |
| Format gold string | Update text on frame |

**Litmus test**: 
1. Could this run without WoW? → Probably an action
2. Does it need a frame or protected API? → Not an action

---

## Integration with Mechanic

### Sandbox Testing
```bash
mech call sandbox.test -i '{"addon": "MyAddon"}'
# Runs tests/test_*.lua with Actions loaded
```

### In-Game Testing (via MechanicLib)
```lua
-- Register actions with MechanicLib for in-game testing
MechanicLib:RegisterTest("MyAddon", "wealth.check", function()
    local result = Actions.CheckWealth(WoWContext:Build())
    return result.success and result.data.isRich ~= nil
end)
```

### CLI Access
```bash
# Get action result with full context
mech addon.output  # Shows action test results after /reload
```

---

## Progressive Adoption

You don't need to rewrite your addon. Adopt incrementally:

1. **Extract one pure function** → Make it action-like with context
2. **Add a sandbox test** → Verify it works outside WoW
3. **Repeat** → Gradually pull logic out of frames
4. **Over time** → Most business logic becomes testable

---

## Summary

| Traditional Addon | AFD Addon |
|------------------|-----------|
| Logic in frame scripts | Logic in pure Actions |
| State in UI components | State in central store |
| Testing requires /reload | Testing via sandbox |
| AI can't help | AI can run actions directly |
| Changes are scary | Changes are safe |

**AFD for Addons = Commands-first, but for Lua + WoW constraints.**
