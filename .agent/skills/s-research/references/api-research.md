# API Research

Finding WoW API documentation and examples.

## Research Commands

```bash
# Quick question
mech call research.query '{"query": "How to detect combat"}'

# Search specific topic
mech call research.query '{"query": "SecureActionButton attributes"}'
```

## Key API Resources

### Online

- **Warcraft Wiki**: https://warcraft.wiki.gg/
- **Townlong Yak**: https://www.townlong-yak.com/framexml/
- **WoWPedia API**: https://wowpedia.fandom.com/wiki/World_of_Warcraft_API

### Local

```bash
# Search Blizzard source with ripgrep
rg "GetSpellInfo" "_dev_/wow-ui-source-live/" -g "*.lua"

# Search for specific patterns
rg "SecureActionButton" "_dev_/wow-ui-source-live/" -g "*.xml"
```

## Offline API Search

```bash
# Search APIs by pattern
mech call api.search '{"query": "GetSpell*"}'

# Get info about specific API
mech call api.info '{"api_name": "C_Spell.GetSpellInfo"}'

# List APIs by namespace
mech call api.list '{"namespace": "C_Spell"}'
```

## Common API Categories

| Namespace | Purpose |
|-----------|---------|
| C_Map | Map and zone info |
| C_Spell | Spell information |
| C_Item | Item data |
| C_Timer | Scheduling |
| C_Container | Bag/inventory |
| C_QuestLog | Quest tracking |
| C_UnitAuras | Buff/debuff info |

## API Discovery Pattern

```bash
# Queue API tests to run in-game
mech call lua.queue '{"code": ["return C_Map.GetBestMapForUnit(\"player\")", "return C_Spell.GetSpellInfo(12345)"]}'

# After /reload, get results
mech call lua.results
```

## Deprecation Checking

```bash
# Scan addon for deprecated APIs
mech call addon.deprecations '{"addon": "MyAddon"}'

# Research replacement
mech call research.query '{"query": "GetSpellInfo replacement 12.0"}'
```

## Version-Specific Research

Include version in queries:
- "12.0 API changes"
- "Midnight expansion new APIs"
- "deprecated in War Within"
