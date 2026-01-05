---
name: Tools Migration to Mechanic
overview: Migrate all ADDON_DEV/Tools (except cli/ and bin/) to Mechanic CLI as AFD-compliant commands with unit tests, environment abstraction, and updated documentation.
todos:
  - id: verify-existing
    content: Verify all existing mech commands work before removing tools
    status: pending
  - id: env-setup
    content: Add python-dotenv, create .env.example, update config.py
    status: pending
  - id: deprecate-addon-dev
    content: Add deprecation notice to addon-dev CLI, create migration guide
    status: pending
  - id: migrate-research
    content: Migrate GeminiResearch to research.* commands with tests
    status: pending
  - id: migrate-api-populator
    content: Migrate APIPopulator to api.populate/generate commands with tests
    status: pending
  - id: migrate-performance
    content: Migrate PerformanceProfiler to perf.* commands with tests
    status: pending
  - id: migrate-assets
    content: Migrate AssetManager to assets.* commands with tests
    status: pending
  - id: cleanup-tools
    content: Remove migrated tools from ADDON_DEV/Tools/ (after verification)
    status: pending
  - id: update-docs
    content: Update AGENTS.md, README.md, CHANGELOG.md, run mech docs
    status: pending
---

# Migrate ADDON_DEV/Tools to Mechanic CLI

## Scope

**Move these tools to Mechanic:**

- APIPopulator (api_database.json parsing, Lua generation)
- GeminiResearch (web research with Gemini API)
- PerformanceProfiler (baseline tracking)
- AssetManager (PNG to TGA conversion)

**Keep in ADDON_DEV (for now):**

- `bin/` - Shared binaries (lua.exe, luacheck, etc.) - may move later

**Deprecate:**

- `cli/` - The addon-dev CLI will be deprecated; users migrate to `mech`

**Already migrated (verify, then remove from ADDON_DEV/Tools):**

- AddonCreator, TestRunner, Formatter, LintingTool, DeprecationScanner
- JunctionManager, LocalizationTool, ReleaseManager, TOCValidator
- LibrarySync, LibraryDiff, SavedVariablesInspector, AtlasScanner

## Pre-Migration: Verify Existing Commands

Before removing any tools, verify each mech equivalent works:

| Tool | Mech Command | Verify With |

|------|--------------|-------------|

| AddonCreator | `addon.create` | `mech call addon.create -i '{"name": "TestAddon"}'` |

| TestRunner | `addon.test` | `mech call addon.test -i '{"addon": "!Mechanic"}'` |

| Formatter | `addon.format` | `mech call addon.format -i '{"addon": "!Mechanic", "check": true}'` |

| LintingTool | `addon.lint` | `mech call addon.lint -i '{"addon": "!Mechanic"}'` |

| DeprecationScanner | `addon.deprecations` | `mech call addon.deprecations -i '{"addon": "!Mechanic"}'` |

| JunctionManager | `addon.sync` | `mech call addon.sync -i '{"addon": "!Mechanic"}'` |

| LocalizationTool | `locale.validate` | `mech call locale.validate -i '{"addon": "!Mechanic"}'` |

| ReleaseManager | `release.all` | (verify schema only, don't execute) |

| TOCValidator | `addon.validate` | `mech call addon.validate -i '{"addon": "!Mechanic"}'` |

| LibrarySync | `libs.sync` | `mech call libs.check -i '{"addon": "!Mechanic"}'` |

| LibraryDiff | `libs.check` | (same as above) |

| SavedVariablesInspector | `sv.parse` | `mech call sv.discover` |

| AtlasScanner | `atlas.search` | `mech call atlas.search -i '{"query": "sword"}'` |

## addon-dev CLI Deprecation

### Phase 1: Deprecation Notice

Add to `ADDON_DEV/Tools/cli/main.py`:

```python
import warnings
warnings.warn(
    "addon-dev CLI is deprecated. Please migrate to 'mech' CLI. "
    "See !Mechanic/docs/migration-from-addon-dev.md",
    DeprecationWarning
)
```

### Phase 2: Migration Guide

Create `!Mechanic/docs/migration-from-addon-dev.md`:

| addon-dev Command | mech Command |

|-------------------|--------------|

| `addon-dev lint MyAddon` | `mech call addon.lint -i '{"addon": "MyAddon"}'` |

| `addon-dev test MyAddon` | `mech call addon.test -i '{"addon": "MyAddon"}'` |

| `addon-dev format MyAddon` | `mech call addon.format -i '{"addon": "MyAddon"}'` |

| `addon-dev create MyAddon` | `mech call addon.create -i '{"name": "MyAddon"}'` |

| `addon-dev sync MyAddon` | `mech call addon.sync -i '{"addon": "MyAddon"}'` |

| `addon-dev validate MyAddon` | `mech call addon.validate -i '{"addon": "MyAddon"}'` |

| `addon-dev release ...` | `mech release MyAddon 1.0.0 "Message"` |

| `addon-dev research "query"` | `mech call research.query -i '{"query": "..."}'` |

### Phase 3: Remove (Future)

After sufficient migration period, remove `cli/` folder entirely.

## AFD Compliance Requirements

Each migrated tool must follow [AFD principles](D:/Github/Falkicon/afd/AGENTS.md):

### 1. Command-First Design

```python
from pydantic import BaseModel, Field

class ResearchInput(BaseModel):
    query: str = Field(..., description="Search query")
    mode: str = Field("fast", description="Research mode: fast, thinking, deep")

class ResearchOutput(BaseModel):
    answer: str
    sources: list[str]
    confidence: float

@server.command(
    name="research.query",
    description="Search the web for addon development information",
    input_schema=ResearchInput,
    output_schema=ResearchOutput,
)
async def research_query(input: ResearchInput) -> CommandResult[ResearchOutput]:
    ...
```

### 2. CommandResult Pattern

Every command returns structured results:

```python
return success(
    data=ResearchOutput(answer="...", sources=[...], confidence=0.85),
    reasoning="Found 3 relevant sources from Blizzard documentation",
)

return error(
    code="API_KEY_MISSING",
    message="GEMINI_API_KEY not found in environment",
    suggestion="Add GEMINI_API_KEY to .env file (see .env.example)",
)
```

### 3. CLI Validation

Each command must be testable via CLI before any UI integration:

```bash
mech call research.query -i '{"query": "GetSpellInfo API changes"}'
```

### 4. Unit Tests

Each command needs corresponding tests in `desktop/tests/`:

```python
@pytest.mark.asyncio
async def test_research_query_success():
    result = await server.execute("research.query", {"query": "test"})
    assert_success(result)
    assert result.data.confidence > 0
```

## Dependencies to Add

Add to `!Mechanic/desktop/pyproject.toml`:

```toml
[project.dependencies]
python-dotenv = ">=1.0.0"  # For .env file loading
google-generativeai = ">=0.8.0"  # For Gemini API (research commands)
Pillow = ">=10.0.0"  # For PNG to TGA conversion (assets commands)
```

## Environment Configuration

### .env System

Create `.env` and `.env.example` in `!Mechanic/desktop/`:

```ini
# .env.example (committed)
# Gemini API key for research commands
GEMINI_API_KEY=your_key_here

# WoW installation path (auto-detected if not set)
# WOW_PATH=C:/Program Files (x86)/World of Warcraft

# Development folder (auto-detected if not set)
# DEV_PATH=C:/Program Files (x86)/World of Warcraft/_dev_
```

### Path Abstraction

All paths must use Mechanic's config system:

```python
# ❌ Wrong - hardcoded path
api_db = "C:/Program Files (x86)/World of Warcraft/_dev_/ADDON_DEV/Tools/APIPopulator/api_database.json"

# ✅ Correct - use config
from mechanic.config import get_dev_path
api_db = get_dev_path() / "!Mechanic" / "data" / "api_database.json"
```

## Migration Phases

### Phase 1: Environment Setup

1. Create `.env.example` with all required variables
2. Update `mechanic/config.py` with path abstraction
3. Add `.env` to `.gitignore`
4. Move shared data files (api_database.json, atlases.json) to `!Mechanic/data/`

### Phase 2: Migrate GeminiResearch

New commands in `desktop/src/mechanic/commands/research.py`:

| Command | Description |

|---------|-------------|

| `research.query` | Fast web search (~15-30s) |

| `research.deep` | Multi-step investigation (2-10 min) |

| `research.sync_guides` | Sync research to guide docs |

### Phase 3: Migrate APIPopulator

New commands in `desktop/src/mechanic/commands/api_populator.py`:

| Command | Description |

|---------|-------------|

| `api.populate` | Parse Blizzard API docs and update database |

| `api.generate_lua` | Generate Lua definitions from database |

| `api.scan_addon` | Scan addon for API usage |

### Phase 4: Migrate PerformanceProfiler

New commands in `desktop/src/mechanic/commands/performance.py`:

| Command | Description |

|---------|-------------|

| `perf.baseline` | Record performance baseline |

| `perf.compare` | Compare current vs baseline |

| `perf.report` | Generate performance report |

### Phase 5: Migrate AssetManager

New commands in `desktop/src/mechanic/commands/assets.py`:

| Command | Description |

|---------|-------------|

| `assets.sync` | Sync PNG source to TGA |

| `assets.list` | List asset files |

### Phase 6: Cleanup and Documentation

1. **Remove migrated tools** from `ADDON_DEV/Tools/`:

   - AddonCreator/, TestRunner/, Formatter/, LintingTool/
   - DeprecationScanner/, JunctionManager/, LocalizationTool/
   - PerformanceProfiler/, ReleaseManager/, TOCValidator/
   - LibrarySync/, LibraryDiff/, SavedVariablesInspector/
   - AtlasScanner/, AssetManager/, GeminiResearch/, APIPopulator/

2. **Update ADDON_DEV/Tools/AGENTS.md** to reference Mechanic CLI

3. **Update !Mechanic documentation**:

   - `AGENTS.md` - Add new commands
   - `README.md` - Update feature list
   - `CHANGELOG.md` - Document migration
   - `docs/cli-reference.md` - Run `mech docs`

4. **Run `mech docs`** to regenerate CLI reference

## File Structure After Migration

```
!Mechanic/
├── desktop/
│   ├── .env.example          # NEW: Environment template
│   ├── .gitignore            # Add .env
│   ├── src/mechanic/
│   │   └── commands/
│   │       ├── research.py   # NEW: GeminiResearch migration
│   │       ├── api_populator.py  # NEW: APIPopulator migration
│   │       ├── performance.py    # NEW: PerformanceProfiler migration
│   │       └── assets.py         # NEW: AssetManager migration
│   └── tests/
│       ├── test_research.py      # NEW
│       ├── test_api_populator.py # NEW
│       ├── test_performance.py   # NEW
│       └── test_assets.py        # NEW
├── data/                     # NEW: Shared data files
│   ├── api_database.json     # Moved from ADDON_DEV
│   └── atlases.json          # Moved from ADDON_DEV
└── docs/
    └── cli-reference.md      # Updated via mech docs
```

## Validation Checklist

For each migrated command:

- [ ] Pydantic input/output schemas defined
- [ ] CommandResult with success/error patterns
- [ ] CLI validation works (`mech call <cmd>`)
- [ ] Unit test exists and passes
- [ ] No hardcoded paths
- [ ] Environment variables documented in .env.example
- [ ] Added to docs/cli-reference.md via `mech docs`