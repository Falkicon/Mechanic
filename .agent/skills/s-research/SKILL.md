---
name: s-research
description: >
  Research WoW APIs and patterns: offline API lookup with api.search/info/list,
  atlas icon search, Blizzard UI source, Ace3 usage and web research. Use when
  investigating unfamiliar APIs, deprecations, secret-value behaviour or how
  Blizzard implements something. Triggers: research, find API, API signature,
  Blizzard UI source, atlas, icon, Ace3, documentation.
---

# Researching WoW APIs

Discover and understand WoW APIs before using them. Call MCP tools directly ([using-mechanic](../using-mechanic/SKILL.md)).

## Related Commands

- [c-research](../../workflows/research.md) - API research workflow

## MCP Tools

| Task | MCP Tool |
|------|----------|
| Search APIs (offline) | `api.search(query="*Spell*")` (`*` is a wildcard, not a regex; optional `namespace`, `category`, `limit`) |
| API details | `api.info(api_name="C_Spell.GetSpellInfo")` |
| List by namespace/category | `api.list(namespace="C_Spell")` |
| Database size and coverage | `api.stats()` |
| Icon / atlas names | `atlas.search(query="sword")` (needs a one-time `atlas.scan(source_path=<wow-ui-source>)`; `INDEX_NOT_FOUND` otherwise) |
| Web research (network, Gemini) | `research.query(query="...")` (needs `GEMINI_API_KEY`; flagged mutating because it calls an external service, use only when asked) |
| Try an API in game | `api.queue` / `lua.queue`, then the reload protocol |

The offline API database is the generated `Mechanic/UI/APIDefs` tree (built from Blizzard's API documentation, see [k-apidefs](../k-apidefs/SKILL.md)). It reflects the build it was generated from, so a missing API may simply be newer. `midnightImpact` / `protected` flags in results describe secret-argument behaviour; check them before relying on an API in combat.

## Routing Logic

| Request type | Load reference |
|--------------|----------------|
| Offline API lookup patterns | [references/api-research.md](references/api-research.md) |
| Blizzard UI source patterns | [references/blizzard-ui.md](references/blizzard-ui.md) |
| Ace3 library patterns | [references/ace3-patterns.md](references/ace3-patterns.md) |
| Human CLI reference | [../../../docs/cli-reference.md](../../../docs/cli-reference.md) |

## Best practices

- **Search first**: use `api.search` before guessing names; most modern APIs live in `C_` namespaces (`C_Timer`, `C_Spell`).
- **Read Blizzard**: grep the local `wow-ui-source` (Live or Beta checkout) for how Blizzard calls an API; `Blizzard_Deprecated` explains renames.
- **Check secret behaviour** for anything used in combat ([api-patterns](../s-develop/references/api-patterns.md)).
- **Prove it in game** when an API's behaviour matters: queue a snippet and read the result after a confirmed reload.
