# .claude System Documentation

Guide for maintaining and extending the commands/skills system in Mechanic. `.claude/` is the **canonical** source; `.agent/` is generated from it.

## Taxonomy Overview

| Prefix | Type | Purpose | Rule |
|--------|------|---------|------|
| `c-` | Commands | Action workflows with explicit steps | Pairs with an `s-X` skill, or orchestrates several (`c-review`) |
| `s-` | Skills | How-to knowledge for actions | Always has a matching `c-X` |
| `k-` | Knowledge | Context/background information | No command; the skill is the context loader |
| `using-mechanic` | Protocol | The single home of the diagnostic-target and reload protocol | Referenced by every skill that touches live game data |

## Typing Experience

```
/c  ->  c-audit, c-clean, c-debug, c-develop, c-lint, c-release, c-research, c-review, c-test
/s  ->  s-audit, s-clean, s-debug, s-develop, s-lint, s-release, s-research, s-test
/k  ->  k-apidefs, k-create-skill, k-desktop, k-docs, k-ecosystem, k-fencore, k-fenui, k-mechanic
```

## The Rules

1. **`c-X` has `s-X`**: action commands pair with action skills using the same verb.
2. **`k-*` has no command**: knowledge skills are the context loading mechanism.
3. **Orchestration commands exist**: some `c-*` combine skills (`c-review`).
4. **Knowledge skills can have `references/`** for deeper content.
5. **MCP first**: agent-facing instructions call MCP tools directly. CLI examples belong only in user-facing pages (`k-mechanic/references/cli-commands.md`).
6. **One source of truth**: the protocol lives in `using-mechanic`; the command reference is generated from the registry. Link, do not copy.
7. **Verify against code**: every command, flag, port and API named in a skill must exist.

## File Structure

```
.claude/
├── AGENTS.md                    <- This file
├── commands/                    <- c-*.md (one-line description, then steps)
├── skills/
│   ├── using-mechanic/          <- Protocol; references/afd-commands.md is GENERATED
│   ├── k-*/                     <- Knowledge skills
│   └── s-*/                     <- Action skills
├── gen_command_reference.py     <- Generates using-mechanic/references/afd-commands.md
├── sync_ide.py                  <- Generates .agent/ from .claude/
├── sync-ide.ps1                 <- PowerShell wrapper for sync_ide.py
└── settings.json                <- Shared Claude Code settings
```

## Generated Artifacts

| Artifact | Generator | Guard |
|----------|-----------|-------|
| `.claude/skills/using-mechanic/references/afd-commands.md` | `python .claude/gen_command_reference.py` (reads the command registry, same data as `commands.list`) | `desktop/tests/test_agent_docs.py` |
| `.agent/skills/**`, `.agent/workflows/*.md`, `.agent/rules/ecosystem.md` | `python .claude/sync_ide.py` (or `.\.claude\sync-ide.ps1`) | `desktop/tests/test_agent_docs.py` |

`.agent/AGENTS.md` is hand-written. Never edit other `.agent/` files: they are cleared and rebuilt, with relative links re-resolved for the new layout (commands become workflows). `gen_command_reference.py` imports the installed `mechanic` package (`pip install -e desktop`); `sync_ide.py` needs only Python.

Run both after changing commands or skills, then `pytest desktop/tests/test_agent_docs.py`.

## Adding New Items

### New Action (for example "deploy")

1. Create `commands/c-deploy.md` with explicit steps.
2. Create `skills/s-deploy/SKILL.md` with detailed guidance.
3. Link them both ways (`**Skill**:` in the command, `## Related Commands` in the skill).
4. Add the names to the lists in this file and in `k-ecosystem` ("Which skill next") and `k-create-skill/references/architecture.md`.

### New Knowledge (for example "blizzard-api")

1. Create `skills/k-blizzard-api/SKILL.md`; no command.
2. Optionally add `references/`.

### New Orchestration (for example "ship")

1. Create `commands/c-ship.md` listing several skills in a `**Skills**:` line.

## Naming Conventions

- **Commands**: `c-{verb}`; **Action skills**: `s-{verb}` (same verb); **Knowledge skills**: `k-{topic}`.
- The `name` front matter equals the directory name.

## Templates

### Command (single skill)

```markdown
One-line description of what this workflow does.

**Skill**: [s-X](../skills/s-X/SKILL.md)

1. **Step**: Description
2. **Step**: Description
```

### Command (orchestration)

```markdown
One-line description.

**Skills**: [s-A](../skills/s-A/SKILL.md), [s-B](../skills/s-B/SKILL.md)

1. **Phase**: Description (see s-A)
2. **Report**: Summary
```

### Action skill

```markdown
---
name: s-X
description: >
  What it does and covers. Triggers: keywords.
---

# Title

## Related Commands

- [c-X](../../commands/c-X.md) - description

## MCP Tools

| Task | MCP Tool |
|------|----------|
| ... | `tool(arg="value")` |

## Routing Logic

| Request type | Load reference |
|--------------|----------------|
| Topic | [references/file.md](references/file.md) |
```

### Knowledge skill

```markdown
---
name: k-X
description: >
  Context for [topic]. Load when ... Triggers: keywords.
---

# Title

Overview, key concepts, optional routing table.
```

## Settings

`.claude/settings.json` holds the shared Claude Code settings (permissions use the `allow`/`ask`/`deny` lists). Agents use the MCP tools, so the CLI is deliberately not pre-approved beyond read-only commands.

## Maintenance Checklist

- [ ] Follow the `c-`/`s-`/`k-` conventions and keep links two-way
- [ ] Name only commands, flags and APIs that exist (check `commands.list`)
- [ ] Keep commands concise (steps only) and skills detailed
- [ ] Put new protocol rules in `using-mechanic`, not in each skill
- [ ] Run `python .claude/gen_command_reference.py` and `python .claude/sync_ide.py`
- [ ] Run `pytest desktop/tests/test_agent_docs.py`
- [ ] Update this file when adding patterns
