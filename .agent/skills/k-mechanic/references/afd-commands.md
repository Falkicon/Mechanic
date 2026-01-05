# AFD Commands Reference

Mechanic Desktop implements Agent-First Development (AFD) commands with structured input/output. This is the authoritative reference for all 53 commands.

## Accessing Commands

### Via MCP (Primary)

When Mechanic is configured as an MCP server, call commands directly as tools:

```
Tool: addon.lint
Input: {"addon": "MyAddon"}
```

All 53 commands below are available as MCP tools with the same names and input schemas.

### Via CLI (Fallback)

When MCP is unavailable, use the `mech` CLI:

```bash
mech call <command.name> -i '<json-input>'

# Examples
mech call addon.lint -i '{"addon": "MyAddon"}'
mech call addon.test -i '{"addon": "MyAddon", "coverage": true}'
```

## Command Categories

### Core Commands (core.py)

| Command | Input | Output | Description |
|---------|-------|--------|-------------|
| `sv.parse` | `file_path` | `SavedVariables` | Parse SavedVariables Lua file |
| `sv.discover` | — | `DiscoverOutput` | Auto-discover WoW accounts |
| `dashboard.metrics` | — | `Dict` | Get latest reload metrics |
| `server.shutdown` | — | `ShutdownOutput` | Gracefully stop server |

> **Note**: The `reload.trigger` command exists for the Dashboard UI but **should NOT be used by agents**. Agents have no sense of timing and will call `addon.output` before SavedVariables sync completes. Instead, **ask the user to `/reload`** and wait for their confirmation before calling `addon.output`.

### Development Commands (development.py)

| Command | Input | Output | Description |
|---------|-------|--------|-------------|
| `addon.validate` | `addon`, `path?` | `ValidationResult` | Validate .toc file |
| `addon.lint` | `addon`, `path?`, `fix?` | `LintResult` | Run Luacheck |
| `addon.format` | `addon`, `path?`, `check?` | `FormatResult` | Run StyLua |
| `addon.test` | `addon`, `path?`, `coverage?` | `TestResult` | Run Busted tests |
| `addon.deprecations` | `addon`, `path?`, `fix?` | `DeprecationResult` | Scan deprecated APIs |

### Release Commands (release.py)

| Command | Input | Output | Description |
|---------|-------|--------|-------------|
| `version.bump` | `addon`, `version` | `VersionBumpResult` | Update .toc version |
| `changelog.add` | `addon`, `version`, `message`, `category?` | `ChangelogAddResult` | Add CHANGELOG entry |
| `git.commit` | `addon`, `message` | `GitCommitResult` | Stage and commit |
| `git.tag` | `addon`, `version`, `message?` | `GitTagResult` | Create version tag |
| `release.all` | `addon`, `version`, `message`, `category?` | `ReleaseAllResult` | Full release: bump → changelog → commit → tag |

### Locale Commands (locale.py)

| Command | Input | Output | Description |
|---------|-------|--------|-------------|
| `locale.validate` | `addon` | `LocaleValidateResult` | Check locale coverage |
| `locale.extract` | `addon` | `LocaleExtractResult` | Find localizable strings |

### Atlas Commands (atlas.py)

| Command | Input | Output | Description |
|---------|-------|--------|-------------|
| `atlas.scan` | `source_path`, `output_path?` | `AtlasScanOutput` | Scan wow-ui-source for atlas icons |
| `atlas.search` | `query`, `limit?`, `include_files?` | `AtlasSearchOutput` | Search Blizzard icons (supports wildcards) |

> **Workflow**: Run `atlas.scan` once to generate the index, then use `atlas.search` to find icons.

### Environment Commands (environment.py)

| Command | Input | Output | Description |
|---------|-------|--------|-------------|
| `addon.create` | `name`, `template?`, `author?` | `AddonCreateResult` | Create from template |
| `addon.sync` | `addon`, `flavors?` | `AddonSyncResult` | Create junction links |
| `libs.check` | `addon` | `LibsCheckResult` | Check library status vs libs.json |
| `libs.init` | `addon`, `mode?`, `overwrite?` | `LibsInitResult` | Create libs.json from installed libs |
| `libs.sync` | `addon`, `source?`, `dry_run?`, `force?` | `LibsSyncResult` | Sync libraries based on libs.json |
| `env.status` | — | `EnvStatusResult` | Get environment config and status |
| `system.pick_file` | `title?`, `filter?` | `PickFileResult` | Open native file picker dialog |

### Lua Commands (lua.py)

| Command | Input | Output | Description |
|---------|-------|--------|-------------|
| `lua.queue` | `code[]`, `labels?[]` | `LuaQueueResult` | Queue Lua for in-game execution |
| `lua.results` | — | `LuaResultsResult` | Get results from last execution |

**Round-Trip Workflow:**
1. Agent calls `lua.queue` with code snippets
2. User does `/reload` in WoW
3. Addon executes code, stores results in MechanicDB
4. Agent reads results via `lua.results` or `addon.output`

### API Commands (api.py + apidefs.py)

| Command | Input | Output | Description |
|---------|-------|--------|-------------|
| `api.search` | `query`, `category?`, `namespace?`, `limit?` | `APISearchResult` | Search WoW APIs by pattern (offline) |
| `api.info` | `api_name` | `APIInfoResult` | Get detailed API info |
| `api.list` | `namespace?`, `category?`, `limit?` | `APIListResult` | List APIs by namespace/category |
| `api.queue` | `apis[]`, `params?` | `APIQueueResult` | Queue API tests for in-game execution |
| `api.stats` | — | `APIStatsResult` | Get API statistics |
| `api.populate` | `source_path`, `output_path?` | `APIPopulateOutput` | Parse Blizzard docs → api_database.json |
| `api.generate` | `database_path?`, `output_path?` | `APIGenerateOutput` | Generate APIDefs Lua from database |
| `api.refresh` | `source_path` | `APIRefreshOutput` | Full refresh: populate + generate |

> **Offline API Lookup**: These read APIDefs directly—no game required.
> **APIDefs Generation**: Use `api.refresh` with wow-ui-source to regenerate all APIDefs after Blizzard patches.

### Sandbox Commands (sandbox.py)

| Command | Input | Output | Description |
|---------|-------|--------|-------------|
| `sandbox.generate` | `namespace?`, `force?` | `GenerateResult` | Generate WoW API stubs from APIDefs |
| `sandbox.status` | — | `StatusOutput` | Check stub generation status |
| `sandbox.exec` | `code`, `addon?`, `load_stubs?` | `ExecResult` | Execute Lua in sandbox with stubs |
| `sandbox.test` | `addon`, `path?`, `coverage?` | `TestResult` | Run Busted tests with WoW API stubs |

> **Offline Testing**: Test addon logic without the game using generated API stubs.

### Tools Commands (tools.py)

| Command | Input | Output | Description |
|---------|-------|--------|-------------|
| `tools.status` | — | `ToolsStatusOutput` | Check dev tools status (luacheck, stylua, etc.) |

### Output Commands (output.py)

| Command | Input | Output | Description |
|---------|-------|--------|-------------|
| `addon.output` | `agent_mode?` | `AddonOutputResult` | Get all addon data (errors, tests, console) as markdown |

> **Agent Mode**: Use `--agent` flag for smart compression (~70% smaller output).

### Documentation Commands (docs.py)

| Command | Input | Output | Description |
|---------|-------|--------|-------------|
| `docs.generate` | `output_path?`, `format?` | `DocsGenerateOutput` | Auto-generate CLI reference from registered commands |

> **Self-Documenting**: Run `mech docs` to regenerate `docs/cli-reference.md` whenever commands change.

### Research Commands (research.py)

| Command | Input | Output | Description |
|---------|-------|--------|-------------|
| `research.query` | `query`, `mode?`, `json_output?` | `ResearchQueryOutput` | Web search via Gemini with Google Search |

> **Requires**: `GEMINI_API_KEY` in `desktop/.env`. See `.env.example`.

### Asset Commands (assets.py)

| Command | Input | Output | Description |
|---------|-------|--------|-------------|
| `assets.sync` | `addon`, `verbose?` | `AssetsSyncOutput` | Convert PNG→TGA and sync assets |
| `assets.list` | `addon` | `AssetsListOutput` | List assets in source/target folders |

> **Workflow**: Put PNGs in `assets_source/`, run `assets.sync` to convert to WoW-compatible TGA.

### Performance Commands (perf.py)

| Command | Input | Output | Description |
|---------|-------|--------|-------------|
| `perf.baseline` | `addon`, `version`, `memory_kb`, `cpu_ms` | `PerfBaselineOutput` | Record performance baseline |
| `perf.compare` | `addon`, `memory_kb`, `cpu_ms`, `thresholds?` | `PerfCompareOutput` | Check for regressions |
| `perf.report` | `addon`, `limit?` | `PerfReportOutput` | Generate performance history report |
| `perf.list` | — | `PerfListOutput` | List addons with baselines |

> **Regression Detection**: Records trend history and alerts when metrics exceed thresholds.

### FenCore Commands (fencore.py)

| Command | Input | Output | Description |
|---------|-------|--------|-------------|
| `fencore-catalog` | — | `CatalogOutput` | Get full FenCore domain/function catalog |
| `fencore-search` | `query`, `limit?` | `SearchOutput` | Search FenCore functions by name/description |
| `fencore-info` | `domain`, `function` | `InfoOutput` | Get detailed info about a FenCore function |

> **Automatic Benefit**: When your addons use FenCore, agents gain catalog discovery via these commands after `/reload`.

## CommandResult Structure

All commands return a `CommandResult`:

```python
class CommandResult:
    success: bool           # Did command succeed?
    data: Optional[T]       # Command-specific output
    error: Optional[Error]  # Error details if failed
    reasoning: Optional[str]  # Explanation of what happened
    confidence: Optional[float]  # 0-1 for AI commands
    sources: Optional[List[Source]]  # Attribution
```

## Error Structure

```python
class Error:
    code: str        # e.g., "TOOL_NOT_FOUND", "PARSE_ERROR"
    message: str     # Human-readable description
    suggestion: str  # Actionable recovery hint
```

## Writing New Commands

Follow AFD patterns when adding commands:

```python
from pydantic import BaseModel, Field
from afd import CommandResult, success, error

class MyInput(BaseModel):
    addon: str = Field(..., description="Addon name")
    option: bool = Field(default=False, description="Optional flag")

class MyOutput(BaseModel):
    result: str
    count: int

@server.command(
    name="my.command",
    description="Description of what this does",
    input_schema=MyInput,
    output_schema=MyOutput,
)
async def my_command(input: MyInput, context=None):
    try:
        return success(
            data=MyOutput(result="done", count=5),
            reasoning="Processed 5 items successfully"
        )
    except Exception as e:
        return error(
            code="PROCESS_ERROR",
            message=str(e),
            suggestion="Check input and try again"
        )
```

## Testing Commands

```python
import pytest
from afd.testing.assertions import assert_success, assert_error

@pytest.mark.asyncio
async def test_my_command():
    server = get_server()
    result = await server.execute("my.command", {"addon": "Test"})
    assert_success(result)
    assert result.data.count == 5
```

## Agent Mode

Use `--agent` flag for compressed output optimized for AI:

```bash
mech --agent call addon.output
```

Agent mode applies:
- Group errors by addon
- Deduplicate by file:line
- Show top 5 errors per addon with counts
- ~70% size reduction
