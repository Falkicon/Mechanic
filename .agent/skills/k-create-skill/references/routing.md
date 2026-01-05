# Routing Tables

How to design effective routing tables for skills.

## Purpose

Routing tables tell Copilot which reference files to load for different request types. This enables:

- **Efficient context use** — Only load what's needed
- **Deep content** — Rich references without bloating SKILL.md
- **Clear organization** — Logical content structure

## Basic Format

```markdown
## Routing Logic

| Request type | Load reference |
|--------------|----------------|
| [Topic/trigger] | [references/file.md](references/file.md) |
```

## Column Definitions

### Request type

Keywords or topics that trigger loading:
- Use natural language
- Include synonyms
- Be specific enough to differentiate

### Load reference

Relative path to the reference file:
- Always use relative paths from SKILL.md
- Include `.md` extension
- Use Markdown link format

## Routing Patterns

### Single-Level Routing

Simple topic-to-file mapping:

```markdown
| Request type | Load reference |
|--------------|----------------|
| Grammar rules | [references/grammar.md](references/grammar.md) |
| Punctuation | [references/punctuation.md](references/punctuation.md) |
```

### Categorized Routing

Group by category with separate tables:

```markdown
### Style References

| Request type | Load reference |
|--------------|----------------|
| Grammar | [references/style/grammar.md](references/style/grammar.md) |
| Punctuation | [references/style/punctuation.md](references/style/punctuation.md) |

### Pattern References

| Request type | Load reference |
|--------------|----------------|
| Error messages | [references/patterns/errors.md](references/patterns/errors.md) |
| Empty states | [references/patterns/empty-states.md](references/patterns/empty-states.md) |
```

### Multi-Trigger Routing

Multiple triggers for same file:

```markdown
| Request type | Load reference |
|--------------|----------------|
| Errors, validation, form errors | [references/errors.md](references/errors.md) |
```

## Trigger Design

### Good Triggers

```
| Request type | Load reference |
|--------------|----------------|
| Button labels, action text, CTAs | [references/buttons.md] |
| Error messages, validation errors | [references/errors.md] |
| Power BI terms, semantic model | [references/power-bi.md] |
```

- Specific and descriptive
- Include common synonyms
- Match how users ask questions

### Poor Triggers

```
| Request type | Load reference |
|--------------|----------------|
| Buttons | [references/buttons.md] |
| Errors | [references/errors.md] |
| Terms | [references/terms.md] |
```

- Too vague
- Missing synonyms
- Could match unintended requests

## Organization Strategies

### By Content Type

```
references/
├── style/          # Writing style rules
├── patterns/       # UI patterns
├── terminology/    # Product terms
└── strategy/       # Planning/process
```

### By Feature Area

```
references/
├── data-engineering/
├── power-bi/
├── real-time/
└── shared/
```

### By Task

```
references/
├── review/         # Content review
├── generate/       # Content creation
├── validate/       # Validation rules
└── examples/       # Sample content
```

## Best Practices

1. **One topic per file** — Don't combine unrelated content
2. **Descriptive triggers** — Help Copilot match correctly
3. **Logical grouping** — Use folders for categories
4. **Avoid overlap** — Each request should map to one primary file
5. **Include examples** — Show what "good" looks like in each reference

## Common Mistakes

### Too Many Files

```
❌ 50+ tiny reference files
✓ 10-20 substantial reference files
```

### Overlapping Triggers

```
❌ "errors" → errors.md AND "validation" → errors.md AND "messages" → errors.md
✓ "error messages, validation errors, form errors" → errors.md
```

### Missing Triggers

```
❌ "capitalization" (but users say "title case", "sentence case")
✓ "capitalization, title case, sentence case, casing"
```
