# .agent System Documentation

Guide for the Antigravity-compatible commands/skills system in Mechanic.

## Architecture

This `.agent` folder is synced from `.claude` using a PowerShell script:

```powershell
# Run from Mechanic folder to sync .claude → .agent
.\.claude\sync-ide.ps1
```

**Mapping:**
| Source | Destination |
|--------|-------------|
| `.claude/commands/c-*.md` | `.agent/workflows/*.md` (with YAML frontmatter) |
| `.claude/skills/*` | `.agent/skills/*` |
| `.claude/skills/k-ecosystem/SKILL.md` | `.agent/rules/ecosystem.md` |

## How It Works

### Always-Loaded Context
- **`rules/ecosystem.md`** is automatically loaded at conversation start
- Contains: component overview, reload loop, MCP tools, AFD principles

### On-Demand Workflows
Trigger via `/workflow-name` (e.g., `/debug`):

```
/audit    - Quality analysis (security, complexity, deprecations)
/clean    - Dead code and stale docs cleanup
/debug    - Reload loop for finding and fixing issues
/develop  - Build features following architecture patterns
/lint     - Luacheck and StyLua code quality
/release  - Automated release workflow
/research - WoW API research
/review   - Full code review (orchestrates multiple skills)
/test     - Unit testing with sandbox and Busted
```

Workflows reference skills via path links. Read the linked skill when detailed guidance is needed.

### Skills (Lazy-Loaded)
Skills are **not** auto-loaded. They're read on-demand when:
1. A workflow links to one
2. You need deep context on a topic

**Skill Types:**
| Prefix | Purpose | Examples |
|--------|---------|----------|
| `s-*` | Action skills (how-to) | s-debug, s-lint, s-test |
| `k-*` | Knowledge skills (context) | k-mechanic, k-fencore, k-fenui |

## Editing Content

Since workflows, skills, and ecosystem.md are linked to `.claude/`, edit the source files there:
- Commands: `.claude/commands/c-*.md`
- Skills: `.claude/skills/*/SKILL.md`
- Ecosystem: `.claude/skills/k-ecosystem/SKILL.md`

Changes automatically reflect in both Claude and Antigravity environments.
