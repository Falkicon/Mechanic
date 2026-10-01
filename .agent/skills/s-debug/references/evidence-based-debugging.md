# Evidence-Based Debugging Methodology

A systematic approach to debugging that requires **runtime evidence** before making fixes. This methodology prevents the common AI failure mode of guessing fixes based on code alone.

## Core Philosophy

> **You cannot fix bugs based on code alone.** Traditional AI agents jump to fixes claiming 100% confidence, but fail due to lacking runtime information. They guess based on static analysis. You **must** gather actual runtime data before proposing fixes.

## The 8-Step Workflow

### Step 1: Generate Hypotheses

Before touching code, generate **3-5 precise hypotheses** about WHY the bug occurs:

```markdown
## Hypotheses

| ID | Hypothesis | Test |
|----|------------|------|
| A | State not initialized before access | Log entry/exit of init function |
| B | Race condition between events | Log event order with timestamps |
| C | Null/nil value from API | Log API return values |
| D | Wrong conditional branch taken | Log branch execution |
```

**Rules:**
- Be specific and detailed
- Aim for MORE hypotheses, not fewer
- Each hypothesis must be testable via logs
- Cover different subsystems/layers

### Step 2: Instrument Code with Logs

Add **3-8 small instrumentation logs** covering:

| What to Log | Why |
|-------------|-----|
| Function entry with parameters | Verify function is called with expected args |
| Function exit with return values | Verify function produces expected output |
| Values BEFORE critical operations | Capture pre-condition state |
| Values AFTER critical operations | Capture post-condition state |
| Branch execution paths | Know which if/else/switch ran |
| Suspected error/edge case values | Catch unexpected states |
| State mutations | Track when/how data changes |

**Log payload (one line of text per log):** `runId`, `hypothesisId`, `location` (`File.lua:42`), `message`, and a short `data` string.

**Critical Rules:**
- Each log must map to at least one hypothesis (include `hypothesisId`)
- Wrap logs in collapsible regions (`#region agent log` / `#endregion`)
- **FORBIDDEN:** Logging secrets, tokens, passwords, API keys, PII

### Step 3: Ask User to Reproduce

Provide clear reproduction steps:

```markdown
<reproduction_steps>
1. `/reload` in WoW and tell me when it has finished
2. Open [specific panel/feature]
3. Perform [specific action]
4. Observe [expected vs actual behavior]
</reproduction_steps>
```

**Rules:**
- Include restart/reload reminders if needed
- Be specific about what to observe
- Do NOT ask user to type "done" - wait for confirmation

### Step 4: Analyze Logs

After the user confirms the reproduction and the reload, read the logs with `addon.output` (same diagnostic target as before) and evaluate **each hypothesis**:

```markdown
## Hypothesis Evaluation

| ID | Hypothesis | Verdict | Evidence |
|----|------------|---------|----------|
| A | State not initialized | **REJECTED** | Log line 3: `init` called before access |
| B | Race condition | **CONFIRMED** | Log lines 7,8: Event B fired before Event A |
| C | Null from API | INCONCLUSIVE | API call not logged, need more instrumentation |
```

**Verdict Categories:**
- **CONFIRMED** — Logs prove this is the cause
- **REJECTED** — Logs prove this is NOT the cause
- **INCONCLUSIVE** — Need more instrumentation to determine

**Rules:**
- Cite specific log lines as evidence
- Never claim CONFIRMED without log proof
- If all hypotheses are REJECTED, generate NEW hypotheses

### Step 5: Fix with 100% Confidence

Only fix when you have **log-proven root cause**:

```markdown
## Fix

**Root Cause:** Event B fires before Event A completes (confirmed by log lines 7-8)

**Fix:** Add event listener to wait for Event A completion before processing Event B

**Confidence:** 100% — Log evidence proves causation
```

**Critical Rules:**
- Do NOT remove instrumentation yet
- Keep all debug logs active for verification
- Tag verification runs with `runId="post-fix"`

### Step 6: Verify with Logs

Ask user to reproduce again with the fix applied:

```markdown
<reproduction_steps>
1. `/reload` in WoW with the fix installed (and tell me when it finishes)
2. Perform the same actions as before
3. Confirm the bug is resolved
</reproduction_steps>
```

### Step 7: Compare Before/After Logs

Analyze post-fix logs and compare:

```markdown
## Verification

| Metric | Before Fix | After Fix |
|--------|------------|-----------|
| Event order | B→A (wrong) | A→B (correct) |
| Error thrown | Yes (line 12) | No |
| Expected behavior | ❌ | ✅ |

**Conclusion:** Fix verified. Log line 8 now shows correct event order.
```

### Step 8: Clean Up

**Only after:**
1. Post-fix logs prove success
2. User explicitly confirms the fix works

Then remove all instrumentation logs from the code.

---

## Instrumentation Template (WoW addons)

```lua
-- #region agent log
if MechanicLib then MechanicLib:Log("MyAddon", "hypothesis=A loc=File.lua:LINE msg=desc data=" .. tostring(val), MechanicLib.Categories.CORE) end
-- #endregion
```

The first argument is your addon name. Lines reach the agent through `addon.output` after a confirmed reload (see [using-mechanic](../../using-mechanic/SKILL.md)); only the last 50 lines per addon are synced, so keep instrumentation sparse and clear stale output by reloading before each run. Never log secret values (check `issecretvalue`).

---

## Critical Constraints

### FORBIDDEN Actions

| Action | Why |
|--------|-----|
| Fix without runtime evidence | Leads to guess-based fixes that fail |
| Remove logs before verification | Can't prove fix worked |
| Use `setTimeout`/`sleep` as a "fix" | Masks timing issues, doesn't fix them |
| Log secrets/tokens/PII | Security violation |
| Claim 100% confidence without logs | False confidence leads to wasted cycles |

### REQUIRED Actions

| Action | Why |
|--------|-----|
| Generate 3-5 hypotheses first | Ensures systematic investigation |
| Map each log to a hypothesis | Ensures purposeful instrumentation |
| Fresh logs before each run (reload first) | Prevents mixing old/new data |
| Cite log lines as evidence | Proves conclusions are data-driven |
| Wait for user confirmation | Timing between changes and effects varies |

---

## Iteration is Expected

Fixes often fail on first attempt. This is normal.

**If fix fails:**
1. Generate **NEW hypotheses** from different subsystems
2. Add **more instrumentation** targeting new hypotheses
3. Repeat the workflow

**Signs you need more hypotheses:**
- All current hypotheses are REJECTED
- Logs don't show expected behavior
- Fix didn't change the outcome

---

## Quick Reference Checklist

```
□ Generated 3-5 hypotheses
□ Added 3-8 instrumentation logs
□ Each log maps to a hypothesis
□ Logs wrapped in collapsible regions
□ Asked user to reproduce
□ Waited for user confirmation
□ Analyzed logs with cited evidence
□ Evaluated each hypothesis (CONFIRMED/REJECTED/INCONCLUSIVE)
□ Fixed only with 100% confidence and log proof
□ Kept instrumentation active for verification
□ Compared before/after logs
□ User confirmed success
□ Removed instrumentation
```
