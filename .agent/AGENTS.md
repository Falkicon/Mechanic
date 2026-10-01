# .agent System Documentation

Guide for the Antigravity-compatible commands/skills layout in Mechanic. **Everything here except this file is generated from `.claude/`. Do not edit it by hand.**

## Architecture

`.claude/` is canonical. `.agent/` is rebuilt by a script (Python, cross-platform):

```bash
python .claude/sync_ide.py            # regenerate .agent/
python .claude/sync_ide.py --check    # fail when .agent/ is out of sync
.\.claude\sync-ide.ps1                # PowerShell wrapper (-Check for the check)
```

The generated directories are cleared first (no orphans from deleted sources), and relative links are re-resolved for the new layout. `desktop/tests/test_agent_docs.py` runs the check, so CI fails when `.agent/` is stale.

**Mapping:**

| Source | Destination |
|--------|-------------|
| `.claude/commands/c-*.md` | `.agent/workflows/*.md` (prefix removed, `description:` front matter added) |
| `.claude/skills/*` (including `using-mechanic`) | `.agent/skills/*` |
| `.claude/skills/k-ecosystem/SKILL.md` | `.agent/rules/ecosystem.md` |

## How It Works

### Always-Loaded Context
- **`rules/ecosystem.md`** is loaded at conversation start. It carries the component overview, reload-loop summary, MCP tools and the "which skill next" map.

### On-Demand Workflows
Trigger via `/workflow-name` (for example `/debug`):

```
/audit    - Quality analysis (security, complexity, deprecations, dead code)
/clean    - Dead code and stale docs cleanup
/debug    - Target-based reload loop for finding and fixing issues
/develop  - Build features following architecture patterns
/lint     - Luacheck and StyLua
/release  - Release workflow (dry run, confirm, release)
/research - WoW API research
/review   - Full code review (orchestrates multiple skills)
/test     - Unit testing with sandbox and Busted
```

Workflows reference skills via path links. Read the linked skill when detailed guidance is needed.

### Skills (Lazy-Loaded)
Skills are not auto-loaded; they are read on demand when a workflow links to one or deep context is needed.

| Prefix | Purpose | Examples |
|--------|---------|----------|
| `s-*` | Action skills (how-to) | s-debug, s-lint, s-test |
| `k-*` | Knowledge skills (context) | k-mechanic, k-desktop, k-apidefs, k-fenui |
| `using-mechanic` | Protocol: diagnostic target, reload, mutation rules | always follow before live verification |

The generated command reference is `.agent/skills/using-mechanic/references/afd-commands.md`.

## Editing Content

Edit the source files in `.claude/` (commands in `.claude/commands/c-*.md`, skills in `.claude/skills/*/`), then run `python .claude/sync_ide.py`. See [../.claude/AGENTS.md](../.claude/AGENTS.md) for conventions and templates.
