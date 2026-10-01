# API Research

Finding WoW API documentation and examples. All tools below are MCP tools ([using-mechanic](../../using-mechanic/SKILL.md)).

## Research tools

```
research.query(query="How to detect combat")        # web search via Gemini; network + GEMINI_API_KEY; only when asked
research.query(query="SecureActionButton attributes")
```

## Key API resources

### Online

- **Warcraft Wiki**: https://warcraft.wiki.gg/
- **Townlong Yak** (FrameXML browser): https://www.townlong-yak.com/framexml/
- **Blizzard UI source**: https://github.com/Gethe/wow-ui-source

### Local

Search a local `wow-ui-source` checkout with ripgrep (adjust the path to your mirror):

```bash
rg "GetSpellInfo" "_dev_/wow-ui-source-live/" -g "*.lua"
rg "SecureActionButton" "_dev_/wow-ui-source-live/" -g "*.xml"
```

## Offline API search

```
api.search(query="GetSpell*")                  # wildcard pattern, not a regex
api.info(api_name="C_Spell.GetSpellInfo")      # signature, params, returns, secret-value flags
api.list(namespace="C_Spell")
api.stats()
```

The data comes from the generated `Mechanic/UI/APIDefs` tree. Refreshing it is a maintenance task ([k-apidefs](../../k-apidefs/SKILL.md)).

## Common API namespaces

| Namespace | Purpose |
|-----------|---------|
| C_Map | Map and zone info |
| C_Spell | Spell information |
| C_Item | Item data |
| C_Timer | Scheduling |
| C_Container | Bag/inventory |
| C_QuestLog | Quest tracking |
| C_UnitAuras | Buff/debuff info |
| C_AddOns | Addon metadata and loading |

## Trying an API in game

```
diagnostic.targets()                                   # pick a target once
lua.queue(code=["return C_Map.GetBestMapForUnit(\"player\")", "return C_Spell.GetSpellInfo(12345)"],
          labels=["map", "spell"], target=<chosen target>)
# Ask the user to /reload and wait for confirmation, then:
lua.results(target=<chosen target>)
```

`api.queue(apis=[...], params={...}, target=...)` queues API-bench tests the same way; read them with `addon.output`.

## Deprecation checking

`addon.deprecations(addon="MyAddon")` scans for known deprecated calls, but its database is currently a small seed (it warns `DEPRECATION_DB_LIMITED`). Complement it by reading `Blizzard_Deprecated` in the UI source and with `research.query(query="GetSpellInfo replacement 12.0")`.

## Version-specific research

Include the version in queries: "12.0 API changes", "Midnight new APIs", "deprecated in War Within".
