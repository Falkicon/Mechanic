# Debugging Strategies

Systematic approaches to addon investigation.

## The Scientific Method

1. **Observe**: What exactly is happening?
2. **Hypothesize**: Why might this happen?
3. **Test**: Can I reproduce?
4. **Conclude**: Root cause identified?
5. **Fix**: Apply minimal change

## Information Gathering

### Mechanic Output

**Ask** user to `/reload` and wait for confirmation, then:

```bash
addon.output(agent_mode=true)
```

### In-Game

```lua
/mech errors    -- Error log
/mech console   -- Console output
/dump MyAddon.db.profile
```

## Isolation Techniques

### Binary Search

1. Comment out half the code/files
2. Bug still occurs?
   - Yes → Bug in remaining code
   - No → Bug in removed code
3. Repeat until isolated

### Minimal Reproduction

1. Create test addon: `mech call addon.create '{"name": "TestBug"}'`
2. Add minimal code to reproduce
3. If can't reproduce, difference is the clue

### Disable Other Addons

```
/console scriptErrors 1
```
Disable all except yours. Re-enable one by one.

## Console Debugging

```lua
self:Print("State:", self.db.profile.enabled)
DevTools_Dump(myTable)
print(string.format("Health: %.1f%%", percent * 100))
```

## Stack Traces

```
1x [ADDON]\File.lua:123: attempt to index nil value
[string "@ADDON\File.lua"]:123: in function `SomeFunction'
[string "@ADDON\Core.lua"]:45: in function `Initialize'
```

Read bottom-up: Initialize called SomeFunction which crashed.

## Event Debugging

```lua
local debugFrame = CreateFrame("Frame")
debugFrame:RegisterAllEvents()
debugFrame:SetScript("OnEvent", function(self, event, ...)
    print(event, ...)
end)
```

## Performance Debugging

```lua
local start = debugprofilestop()
ExpensiveFunction()
print(string.format("Took %.2f ms", debugprofilestop() - start))
```

## Lua Eval Queue

Test code in-game via Mechanic:

```bash
lua.queue(code=["return UnitName(\"player\")"])
```

**Ask** user to `/reload` and wait for confirmation, then:

```bash
lua.results()
```

## Common Investigation Paths

| Symptom | Investigate |
|---------|-------------|
| Nothing loads | .toc, Interface version, syntax |
| Nil error | API return, missing check |
| Works sometimes | Race condition, timing |
| Blocked action | Combat lockdown, taint |
| Wrong data | Event args changed, API changed |
