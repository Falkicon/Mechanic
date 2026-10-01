---
name: k-create-skill
description: >
  How to create and maintain skills, commands and knowledge docs in this
  repository's .claude system: the c-/s-/k- taxonomy, SKILL.md front matter,
  routing tables, references, relative links, and regenerating the .agent mirror.
  Load when adding or editing a skill. Triggers: create skill, new skill, skill
  template, SKILL.md, front matter, add command, sync .agent.
---

# Creating Skills and Commands

Skills live in `.claude/skills/<name>/SKILL.md`, commands in `.claude/commands/c-<verb>.md`. `.claude/` is canonical; `.agent/` is generated from it (see the end). System overview: [../../AGENTS.md](../../AGENTS.md).

## Taxonomy

| Prefix | Type | Purpose |
|--------|------|---------|
| `c-` | Command | Short action workflow with explicit steps; pairs with an `s-` skill (or orchestrates several) |
| `s-` | Skill | How-to knowledge for an action; has a matching `c-` command |
| `k-` | Knowledge | Background context, loaded on demand; no command |
| `using-mechanic` | Protocol skill | The one place the diagnostic-target and reload protocol lives |

## Creating an action

1. `commands/c-deploy.md`: first line is the one-line description, then `**Skill**: [s-deploy](../skills/s-deploy/SKILL.md)` and numbered steps.
2. `skills/s-deploy/SKILL.md`: front matter, a `## Related Commands` section linking back, MCP tools, routing.
3. Run the checks below.

## Creating knowledge

`skills/k-<topic>/SKILL.md` with optional `references/`. No command.

## Structure

```
skills/<skill-name>/
├── SKILL.md              # required
└── references/           # optional deep dives, loaded only when needed
```

The `name` in the front matter must equal the directory name. Details: [references/format.md](references/format.md).

## Principles

1. **Progressive loading**: the description is always in context, the body loads when the skill matches, references only when routed to. Keep bodies short and push depth into references.
2. **Triggers that do not collide**: write descriptions that distinguish a skill from its neighbours ([references/descriptions.md](references/descriptions.md)).
3. **Single source of truth**: link to the protocol skill or the generated command reference instead of copying. Never hand-write command lists, input schemas or counts; they are generated from the registry.
4. **Verify against the code**: names, flags, ports and APIs in a skill must exist in the repository. Commands are MCP-first; CLI examples belong only in user-facing pages.
5. **Relative links only**, resolved from the file's own directory (`../../../docs/...` from a skill, `../skills/...` from a command).

## Routing

| Request type | Load reference |
|--------------|----------------|
| Skill file format and links | [references/format.md](references/format.md) |
| Routing tables | [references/routing.md](references/routing.md) |
| Description writing | [references/descriptions.md](references/descriptions.md) |
| Reference file design | [references/reference-files.md](references/reference-files.md) |
| Skill architecture and boundaries | [references/architecture.md](references/architecture.md) |

## After editing

```bash
python .claude/gen_command_reference.py   # only when commands changed
python .claude/sync_ide.py                # regenerate .agent/ (Antigravity mirror)
pytest desktop/tests/test_agent_docs.py   # front matter, links, generated files
```
