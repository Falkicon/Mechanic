# Core Principles

> Part of the [Addon Development Guide](../AGENTS.md#addon-development-guide)

Last updated: 2026-01-02

---

## Overview

These principles form the foundation for building reliable, maintainable WoW addons that survive patches and expansion changes.

**Midnight Alert (12.0 - Pre-patch January 20, 2026)**: These principles become even more critical with Midnight's API restrictions. Addons that follow these guidelines will adapt more easily to the new "Secret Values" system and combat log restrictions.

---

## Key Principles

### Prefer stable, minimal surface area

- Fewer dependencies, fewer hooks, fewer moving parts.
- Each external dependency is a potential breakage point.
- **Midnight impact**: Addons with broad introspection (frame scanning, global hooking) are most affected.

### Treat combat as a constrained runtime

- Assume many actions may be blocked (secure/protected, taint, restricted APIs).
- **Midnight impact**: Combat restrictions expand significantly. Combat log events become inaccessible, many API returns become "secret values" that can't be compared or processed.
- See [Combat Lockdown](./07-combat-lockdown.doc.md) and [Secret Values](./13-midnight-secret-values.doc.md) for details.

### Build on events, not polling

- Event-driven updates are cheaper and tend to survive API changes better.
- If you must poll (e.g., for smooth bars), throttle aggressively.
- **Midnight impact**: Event-driven patterns survive API pruning better than polling patterns.

### Make every feature degradable

- If an API becomes unavailable, fail "closed" (hide UI / show placeholders) rather than spamming errors.
- Users should never see repeated Lua errors for expected API restrictions.
- **Midnight impact**: Essential for surviving Secret Values - detect restricted values and degrade gracefully.

### Make debugging first-class

- Provide a short status command + a deep debug dump.
- Keep internal state inspectable.
- See [Debugging](./10-debugging.doc.md) for implementation patterns.

### Transition to Passthrough-Pipelines (12.0+)

- **Paradigm**: Addons in Midnight must move from being "Logic Processors" to "Passthrough Pipelines" **when operating in protected contexts (In-Instance Combat)**.
- **Context**: In the Open World or out-of-combat, standard logic still applies. The pipeline approach is specifically required to handle **Secret Values**—information about the current combat state that Blizzard has designated as restricted.
- **Rule**: If a value is secret (Health, Power, Cooldowns), do not inspect it. Forward it blindly to a native-compatible widget.
- **Goal**: Maintain visual customization without triggering combat logic errors or taint cascades.

---

## Midnight-Specific Guidance

### What survives Midnight

| Pattern | Status | Notes |
|---------|--------|-------|
| Display-only frames | ✅ Safe | No protected actions needed |
| Official APIs (`C_` namespaced) | ⚠️ Prefer | Prefer official APIs, but assume any combat-state *data* may become secret/restricted |
| Event-driven updates | ✅ Safe | Stable contract |
| Native widgets with secret values | ✅ Safe | Many Blizzard UI widgets can display secret values even when addons can't compute with them |
| Combat log parsing | ❌ Blocked | Unavailable to addon parsing in dungeons/raids under the secret-values model |
| Instance combat chat parsing | ❌ Blocked | Combat chat messages inside dungeons/raids cannot be read by addons |

### Focus on what Blizzard allows

Blizzard's stated goal is to prevent addons from providing a combat advantage while preserving UI customization. Addons can change presentation but "can't look inside the box" to know exact buffs, cooldowns, or other combat state.

This means addons should focus on:
- **Display customization** (positioning, styling, filtering)
- **Information organization** (grouping, sorting, highlighting)
- **Convenience** (saved positions, profiles, quick access)

And avoid:
- **Automated decision-making** based on combat data
- **Real-time combat analysis** beyond what native UI shows
- **Cross-player data sharing** during encounters

---

## Summary

| Principle | Goal | Midnight Status |
|-----------|------|-----------------|
| Minimal surface area | Reduce breakage points | More critical |
| Combat-aware | Graceful degradation under restrictions | Essential |
| Event-driven | Performance and resilience | Unchanged |
| Degradable features | Fail silently, not loudly | Essential |
| Debug-friendly | Fast issue diagnosis | Unchanged |

---

## References

- [Blizzard Combat Philosophy Announcement](https://worldofwarcraft.blizzard.com/en-gb/news/24246290/combat-philosophy-and-addon-disarmament-in-midnight)
- [Midnight Readiness Guide](./12-midnight-readiness.doc.md)
- [Secret Values Guide](./13-midnight-secret-values.doc.md)
