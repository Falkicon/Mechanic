> **ARCHIVED - IMPLEMENTED (reviewed 2026-09-30).** The sandbox shipped as `sandbox.generate`, `sandbox.status`, `sandbox.exec` and `sandbox.test` (there is no `sandbox.actions`). The current behavior (restricted Lua environment, packaged test framework, optional stubs) is documented in [docs/integration/testing.md](../../docs/integration/testing.md). This plan's command syntax (`-i '{...}'`, which `mech call` never had), paths and architecture diagram are historical. The "AFD for Addons" guide it referenced was never added to this repository; see [docs/addon-architecture.md](../../docs/addon-architecture.md) instead.

# Lua Sandbox: Offline Addon Testing Environment

**Goal**: Enable testing WoW addon logic outside the game client using a minimal stub layer generated from Mechanic's existing API database.

---

## 🎯 Core Principles

1. **Single Source of Truth** — Stubs generated from `!Mechanic/UI/APIDefs/*.lua`
2. **AFD-Native** — Sandbox is built as Mechanic commands, not a separate tool
3. **Agent-Operable** — Full functionality via `mech call sandbox.*`
4. **Dashboard-Visible** — Results display in Mechanic dashboard

---

## 🏗️ Architecture

```
┌─────────────────────────────────────────────────────────────────────────────┐
│                      Mechanic Command Layer (Python)                         │
├─────────────────────────────────────────────────────────────────────────────┤
│                                                                             │
│  Existing Commands           New Sandbox Commands                           │
│  ─────────────────           ────────────────────                           │
│  addon.validate              sandbox.generate   ← Generate stubs from API   │
│  addon.lint                  sandbox.test       ← Run Busted tests          │
│  addon.format                sandbox.exec       ← Execute Lua directly      │
│  addon.test (in-game)        sandbox.actions    ← List addon actions        │
│                                                                             │
└─────────────────────────────────────────────────────────────────────────────┘
         ▲                              ▲                              ▲
         │                              │                              │
    ┌────┴────┐                   ┌────┴────┐                   ┌────┴────┐
    │Dashboard│                   │   CLI   │                   │  Agent  │
    │  (Web)  │                   │  (mech) │                   │  (MCP)  │
    └─────────┘                   └─────────┘                   └─────────┘
```

---

## 📋 Command Definitions

### `sandbox.generate`
Regenerate Lua stubs from APIDefs database.

```bash
mech call sandbox.generate
mech call sandbox.generate -i '{"namespace": "C_Spell"}'  # Single namespace
```

**Output:**
```json
{
  "success": true,
  "data": {
    "stubsGenerated": 5137,
    "namespacesProcessed": ["C_Spell", "C_Item", "..."],
    "outputPath": "sandbox/generated/wow_stubs.lua"
  }
}
```

---

### `sandbox.test`
Run Busted tests for an addon's Core layer.

```bash
mech call sandbox.test -i '{"addon": "MyAddon"}'
mech call sandbox.test -i '{"addon": "MyAddon", "filter": "wealth"}'
```

**Output:**
```json
{
  "success": true,
  "data": {
    "passed": 15,
    "failed": 2,
    "skipped": 0,
    "results": [
      { "name": "wealth.check returns true", "status": "passed", "duration": 0.2 },
      { "name": "handles nil gold", "status": "failed", "error": "attempt to compare nil" }
    ],
    "requiresWoW": ["test_get_player_name"]
  },
  "reasoning": "15 tests passed. 2 failed (see errors). 1 test requires WoW context."
}
```

---

### `sandbox.exec`
Execute Lua code directly in the sandbox.

```bash
mech call sandbox.exec -i '{"code": "return 2 + 2"}'
mech call sandbox.exec -i '{"addon": "MyAddon", "code": "return Actions.CheckWealth({gold=100})"}'
```

**Output:**
```json
{
  "success": true,
  "data": {
    "result": 4,
    "output": "",
    "error": null
  }
}
```

---

### `sandbox.actions`
List available actions in an addon's Core layer.

```bash
mech call sandbox.actions -i '{"addon": "MyAddon"}'
```

**Output:**
```json
{
  "success": true,
  "data": {
    "actions": [
      { "name": "wealth.check", "file": "Core/Actions/wealth.lua" },
      { "name": "combat.calculateDPS", "file": "Core/Actions/combat.lua" }
    ]
  }
}
```

---

## 📋 What Can Be Tested

| ✅ Testable in Sandbox | ❌ Requires WoW |
|------------------------|-----------------|
| Pure functions (calculations) | Frame creation |
| Data transformations | Protected APIs |
| Validation logic | Real game state |
| Business rules | Visual rendering |

## ✅ Milestone Implementation

All core milestones are **COMPLETE**.

---

### ✅ Milestone 1: Stub Generation (Foundation)

**Status**: Complete

- [x] `sandbox.generate` command parses APIDefs Lua files
- [x] Generates `wow_stubs.lua` with namespace stubs (~5000 APIs)
- [x] Different stub strategies per `midnightImpact` level

---

### ✅ Milestone 2: Lua Execution (Proof of Concept)

**Status**: Complete

- [x] `sandbox.exec` command runs Lua 5.1 subprocess
- [x] Loads `wow_stubs.lua` before user code
- [x] Returns structured output (result, errors)

---

### ✅ Milestone 3: Addon Loading

**Status**: Complete

- [x] `sandbox.exec` can load addon files before execution
- [x] Can call addon functions with mock context

---

### ✅ Milestone 4: Test Runner Integration

**Status**: Complete

- [x] `sandbox.test` command with Busted-compatible test framework
- [x] Loads stubs + addon Core/Tests before specs
- [x] Returns structured test results
- [x] `before_each`, `after_each`, `before_all`, `after_all` hooks
- [x] Full assertion library (`equals`, `is_true`, `is_nil`, `match`, `same`, etc.)

---

### ✅ Milestone 5: Dashboard Integration

**Status**: Complete

- [x] Sandbox tab in dashboard
- [x] Test results display (pass/fail counts, individual tests)
- [x] "Run Tests" button for selected addon
- [x] "Regenerate Stubs" button

---

## 🔮 Future Enhancements

Optional improvements if sandbox proves valuable:

- [ ] **`sandbox.actions`** — List available actions in addon Core layer
- [ ] **Smarter mocks** — Return realistic values instead of `nil`
- [ ] **LibStub/Ace3 stubs** — Common library support
- [ ] **C_Timer** — Coroutine-based async testing
- [ ] **Coverage reports** — Track which Core functions are tested

---



## 📁 File Structure

```
!Mechanic/
├── desktop/
│   ├── src/mechanic/commands/
│   │   └── sandbox.py             # All sandbox commands (generate, exec, test)
│   └── dashboard/
│       └── index.html             # Includes Sandbox tab
│
└── sandbox/
    ├── PLAN.md                    # This document
    ├── AFD_FOR_ADDONS.md          # Addon author guide
    └── generated/
        ├── wow_stubs.lua          # Auto-generated API stubs (~5000 APIs)
        └── test_framework.lua     # Busted-compatible test runner
```

---

## ⚡ Agent Workflow Example

```bash
# Agent creates an action
# (writes Core/Actions/wealth.lua)

# Agent creates a test
# (writes tests/test_wealth.lua)

# Agent runs the test
mech call sandbox.test -i '{"addon": "MyAddon", "filter": "wealth"}'

# Agent reads structured output, fixes any failures
# Repeat until all tests pass

# Agent validates full addon
mech call addon.validate -i '{"addon": "MyAddon"}'
```

---

## 💡 Design Decisions

### Why Build Into Mechanic Commands?

1. **Consistent UX** — Same `mech call` pattern as everything else
2. **Dashboard integration** — Results show alongside other addon data
3. **Agent-accessible** — No special tooling needed
4. **Single codebase** — Leverages existing infrastructure

### Stub Strategy by Impact Level

| APIDef Impact | Stub Behavior |
|--------------|---------------|
| `NORMAL` | Return sensible mock data |
| `CONDITIONAL` | Mock with warning comment |
| `RESTRICTED` / `protected=true` | Error immediately |

---

## 🤔 Resolved Questions

1. **Lua runtime** — Uses system Lua 5.1 (via `find_tool("lua")`)
2. **Test framework** — Custom Busted-compatible framework (no external dependencies)
3. **Test locations** — Searches both `Core/` and `Tests/` folders

## 📋 Open Questions

1. **C_Timer** — Implement with coroutines for async testing?
2. **LibStub/Ace3** — Include real libs or stub them?
3. **Smarter mocks** — Should common APIs return realistic data?

---

## ✅ Implementation Complete

The sandbox is fully operational:

```bash
# Generate stubs from APIDefs
mech call sandbox.generate

# Run tests for an addon
mech call sandbox.test -i '{"addon": "Flightsim"}'

# Execute arbitrary Lua
mech call sandbox.exec -i '{"code": "return 2 + 2"}'
```

Dashboard integration available via the **🧪 Sandbox** tab.
