# Reference File Design

How to create effective reference files for skills.

## Purpose

Reference files contain the detailed content that gets loaded on-demand. They should be:

- **Self-contained** — Usable without other files
- **Actionable** — Rules and examples, not background
- **Scannable** — Easy for Copilot to find relevant info

## File Structure Template

```markdown
# [Topic Name]

[One-line description of what this file covers]

## [Primary Section]

[Core rules or patterns]

## [Secondary Section]

[Additional guidance]

## Examples

[Good/bad examples]

## Common Mistakes

[What to avoid]
```

## Content Guidelines

### Lead with Rules

Put actionable content first:

```markdown
✓ 
## Capitalization Rules

1. Use sentence case for all UI text
2. Capitalize proper nouns only
3. Don't capitalize feature names unless trademarked

✗
## About Capitalization

Capitalization is an important aspect of content design that affects
readability and professionalism. There are many considerations...
```

### Use Tables for Quick Reference

```markdown
| Instead of | Use |
|------------|-----|
| "Click here" | "Select" |
| "Please enter" | "Enter" |
| "Invalid input" | "[Specific error]" |
```

### Include Examples

Show don't just tell:

```markdown
## Error Message Pattern

**Structure:** [What went wrong] + [How to fix it]

**Good:**
```
Enter a valid email address (name@example.com).
```

**Bad:**
```
Invalid input.
```
```

### Keep Sections Focused

One topic per section:

```markdown
✓
## Button Labels

[All button label rules]

## Tooltips

[All tooltip rules]

✗
## UI Elements

[Mix of button, tooltip, menu, dialog rules]
```

## File Size Guidelines

| Size | Recommendation |
|------|----------------|
| < 500 words | May be too thin; consider combining |
| 500-1500 words | Ideal range |
| > 2000 words | Consider splitting |

## Naming Conventions

### File Names

- Lowercase with hyphens
- Descriptive of content
- Match routing table triggers

```
✓ error-messages.md
✓ button-labels.md
✓ power-bi-terms.md

✗ errors.md (too vague)
✗ ButtonLabels.md (wrong case)
✗ content_for_buttons.md (underscores)
```

### Folder Names

- Lowercase
- Category-based
- Plural when containing multiple files

```
✓ patterns/
✓ terminology/
✓ style/

✗ Patterns/
✗ term/
✗ style-rules/
```

## Cross-Referencing

### Within Same Skill

Link to related references:

```markdown
For error message patterns, see [error-messages.md](../patterns/error-messages.md).
```

### Avoid Deep Dependencies

Each file should work alone:

```markdown
✗ "To understand this, first read files A, B, and C."
✓ [Self-contained content with optional "See also" links]
```

## Common Reference Types

### Style Rules

```markdown
# [Style Topic]

## Rules

1. [Rule 1]
2. [Rule 2]

## Examples

| Instead of | Use |
|------------|-----|
| X | Y |
```

### UI Patterns

```markdown
# [Pattern Name]

## When to Use

[Scenarios]

## Structure

[Components and format]

## Writing Rules

[Content guidelines]

## Examples

[Good examples]
```

### Terminology

```markdown
# [Product/Area] Terminology

## Core Terms

| Term | Definition |
|------|------------|
| X | Y |

## Usage Examples

| Instead of | Use |
|------------|-----|
| X | Y |

## Capitalization

[Rules for this area]
```

## Quality Checklist

Before adding a reference:

- [ ] Has clear, actionable rules
- [ ] Includes good/bad examples
- [ ] Is self-contained
- [ ] Has appropriate length (500-1500 words)
- [ ] Uses consistent formatting
- [ ] File name matches content
- [ ] Added to routing table in SKILL.md
