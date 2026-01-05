# .claude System Documentation

Guide for maintaining and extending the commands/skills system in Mechanic.

## Taxonomy Overview

This system uses three prefixes to organize Claude commands and skills:

| Prefix | Type | Purpose | Rule |
|--------|------|---------|------|
| `c-` | Commands | Action workflows with explicit steps | Always has matching `s-X` (or orchestrates multiple skills) |
| `s-` | Skills | How-to knowledge for actions | Always has matching `c-X` |
| `k-` | Knowledge | Context/background information | No command needed - the skill IS the context loader |

## Typing Experience

```
/c  →  c-audit, c-clean, c-debug, c-develop, c-lint, c-release, c-research, c-review, c-test
/s  →  s-audit, s-clean, s-debug, s-develop, s-lint, s-release, s-research, s-test
/k  →  k-create-skill, k-docs, k-ecosystem, k-fencore, k-fenui, k-mechanic
```

Three distinct letters, three distinct purposes.

## The Rules

1. **`c-X` always has `s-X`** — Action commands pair with action skills using the same verb
2. **`k-*` has no command** — Knowledge skills ARE the context loading mechanism
3. **Orchestration commands exist** — Some `c-*` combine multiple skills (e.g., `c-review`)
4. **Knowledge skills can have `references/`** — For deeper content when needed

## Adding New Items

### New Action (e.g., "deploy")

1. Create `commands/c-deploy.md` with explicit steps
2. Create `skills/s-deploy/SKILL.md` with detailed how-to guidance
3. Add `**Skill**: [s-deploy](../skills/s-deploy/SKILL.md)` link in the command
4. Add `## Related Commands` section in the skill linking back

### New Knowledge (e.g., "blizzard-api")

1. Create `skills/k-blizzard-api/SKILL.md`
2. No command needed — invoking the skill IS studying it
3. Optionally add `references/` folder for deeper content

### New Orchestration (e.g., "ship")

1. Create `commands/c-ship.md` that references multiple existing skills
2. No new skill needed — it combines existing ones
3. List all skills in the command's `**Skills**:` line

## Naming Conventions

- **Commands**: `c-{verb}` — audit, clean, debug, develop, lint, release, research, review, test
- **Action Skills**: `s-{verb}` — same verb as the matching command
- **Knowledge Skills**: `k-{topic}` — create-skill, docs, ecosystem, fencore, fenui, mechanic

## File Structure

```
.claude/
├── AGENTS.md              ← This file (system documentation)
├── commands/
│   ├── c-audit.md         → links to s-audit
│   ├── c-clean.md         → links to s-clean
│   ├── c-debug.md         → links to s-debug
│   ├── c-develop.md       → links to s-develop
│   ├── c-lint.md          → links to s-lint
│   ├── c-release.md       → links to s-release
│   ├── c-research.md      → links to s-research
│   ├── c-review.md        → orchestrates multiple skills
│   └── c-test.md          → links to s-test
│
└── skills/
    ├── s-audit/           ← Action skill (has c-audit)
    ├── s-clean/           ← Action skill (has c-clean)
    ├── s-debug/           ← Action skill (has c-debug)
    ├── s-develop/         ← Action skill (has c-develop)
    ├── s-lint/            ← Action skill (has c-lint)
    ├── s-release/         ← Action skill (has c-release)
    ├── s-research/        ← Action skill (has c-research)
    ├── s-test/            ← Action skill (has c-test)
    │
    ├── k-create-skill/    ← Knowledge skill (NO command)
    ├── k-docs/            ← Knowledge skill (NO command)
    ├── k-ecosystem/       ← Knowledge skill (NO command)
    ├── k-fencore/         ← Knowledge skill (NO command)
    ├── k-fenui/           ← Knowledge skill (NO command)
    └── k-mechanic/        ← Knowledge skill (NO command)
```

## Templates

### Command Template (Single-Skill)

```markdown
[One-line description of what this workflow does.]

**Skill**: [s-X](../skills/s-X/SKILL.md)

1. **Step**: Description
2. **Step**: Description
3. **Step**: Description
```

### Command Template (Orchestration)

```markdown
[One-line description of what this workflow does.]

**Skills**: [s-A](../skills/s-A/SKILL.md), [s-B](../skills/s-B/SKILL.md)

1. **Phase**: Description (see s-A)
2. **Phase**: Description (see s-B)
3. **Report**: Summary
```

### Action Skill Template

```markdown
---
name: s-X
description: >
  [Description]. Triggers: [keywords].
---

# [Title]

## Related Commands

- [c-X](../../commands/c-X.md) - [description]

## MCP Tools

| Task | Tool |
|------|------|
| ... | ... |

## Capabilities

1. **Capability** — Description

## Routing Logic

| Request type | Load reference |
|--------------|----------------|
| Topic | [references/file.md](references/file.md) |
```

### Knowledge Skill Template

```markdown
---
name: k-X
description: >
  Context for [topic]. Load this at the start of a conversation to provide
  background knowledge. Triggers: [keywords].
---

# [Title]

[Overview of the knowledge domain]

## Key Concepts

...

## Routing Logic (optional)

| Request type | Load reference |
|--------------|----------------|
| Topic | [references/file.md](references/file.md) |
```

## Maintenance Checklist

When modifying this system:

- [ ] Follow the `c-`/`s-`/`k-` prefix conventions
- [ ] Maintain bidirectional links (commands ↔ skills)
- [ ] Use the same verb for command/skill pairs
- [ ] Update this AGENTS.md if adding new patterns
- [ ] Keep commands concise (steps only, no deep explanation)
- [ ] Keep skills detailed (the "how" behind the steps)
