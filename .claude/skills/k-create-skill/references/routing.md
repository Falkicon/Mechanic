# Routing Tables

A routing table maps request types to the reference to load, so the body stays small.

## Format

```markdown
## Routing Logic

| Request type | Load reference |
|--------------|----------------|
| Combat lockdown | [references/combat-lockdown.md](references/combat-lockdown.md) |
| Repository docs | [../../../docs/integration/testing.md](../../../docs/integration/testing.md) |
```

## Rules

1. Name requests the way a user would ask them, not by file name.
2. One row per reference; no overlapping rows.
3. Links are relative to the SKILL.md (see [format.md](format.md)); linking to repository docs and to other skills is fine.
4. Keep tables to roughly 3-10 rows; split the skill when it grows beyond that.
5. Prefer pointing at the generated command reference ([using-mechanic](../../using-mechanic/references/afd-commands.md)) over restating tools.

## Anti-patterns

- Routes to files that do not exist (the tests check this).
- Duplicating a reference's content in the table.
- Rows such as "everything else".
