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

Follow the protocol in [using-mechanic](../../using-mechanic/SKILL.md): choose a `diagnostic.targets` entry, ask the user to `/reload`, **wait for their confirmation**, then call `addon.output` with `agent_mode=true` and the same `target`. Check the freshness timestamp before trusting the data.

### In-Game

```lua
/mech errors    -- Errors tab
/mech console   -- Console tab
/mech inspect   -- Frame inspector
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

1. Create a throwaway addon with the `addon.create` MCP tool (`name="TestBug"`)
2. Add minimal code to reproduce
3. If you can't reproduce, the difference is the clue

### Disable Other Addons

```
/console scriptErrors 1
```
Disable all except yours. Re-enable one by one.

## Console Debugging

```lua
-- Readable by agents through addon.output
MechanicLib:Log("MyAddon", "State: " .. tostring(self.db.profile.enabled), MechanicLib.Categories.CORE)

-- Interactive only (chat output, invisible to agents)
self:Print("State:", self.db.profile.enabled)
DevTools_Dump(myTable)
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

Remove it afterwards: it is very noisy.

## Performance Debugging

```lua
local start = debugprofilestop()
ExpensiveFunction()
print(string.format("Took %.2f ms", debugprofilestop() - start))
```

The Performance tab (`/mech perf`) shows per-addon memory and CPU (ms/s over the refresh window).

## Lua Eval Queue

Run a snippet in game through Mechanic, using the same target for queue and read:

```
lua.queue(code=["return UnitName(\"player\")"], labels=["name"], target=<from diagnostic.targets>)
```

Ask the user to `/reload`, wait for confirmation, then call `lua.results(target=...)`. Results are also part of `addon.output`.

## Common Investigation Paths

| Symptom | Investigate |
|---------|-------------|
| Nothing loads | .toc, Interface version, syntax |
| Nil error | API return, missing check |
| Works sometimes | Race condition, timing |
| Blocked action | Combat lockdown, taint |
| Wrong data | Event args changed, API changed |
