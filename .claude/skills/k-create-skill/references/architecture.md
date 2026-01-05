# Skill Architecture

Guidance for organizing skills and deciding skill boundaries.

## When to Create a New Skill

### Create Separate Skills When

- **Distinct domains** — Content design vs. component specs
- **Different audiences** — Developer docs vs. user-facing UI
- **Independent usage** — One skill useful without the other
- **Large scope** — Too much content for one skill

### Keep as One Skill When

- **Related content** — All aspects of content design
- **Shared principles** — Same underlying rules apply
- **Cross-referencing needed** — Topics frequently used together
- **Manageable size** — < 30-40 reference files

## Skill Sizing

### Too Small

```
❌ skill-button-labels/
❌ skill-error-messages/
❌ skill-tooltips/
```

**Problem:** Fragmented, hard to route, inefficient.

### Too Large

```
❌ skill-everything/
   └── references/ (100+ files)
```

**Problem:** Slow loading, unfocused, hard to maintain.

### Right Size

```
✓ content-design/
   └── references/
       ├── style/ (10 files)
       ├── patterns/ (15 files)
       ├── terminology/ (10 files)
       └── strategy/ (3 files)
```

**Sweet spot:** 20-40 reference files, clear domain boundary.

## Organizing Multiple Skills

### Recommended Skill Breakdown

For a UX system:

```
.github/skills/
├── content-design/       # UI text, style guide, terminology
├── component-specs/      # Component patterns, props, usage
├── accessibility/        # A11y guidelines, WCAG compliance
├── design-tokens/        # Colors, spacing, typography
└── skill-creation/       # Meta-skill for creating skills
```

### Naming Convention

- Use kebab-case
- Be descriptive but concise
- Reflect the domain, not the format

```
✓ content-design
✓ component-specs
✓ accessibility-guidelines

✗ content
✗ specs
✗ a11y
```

## Reference Organization

### Flat Structure

For small skills (< 10 references):

```
references/
├── grammar.md
├── punctuation.md
├── word-choice.md
└── capitalization.md
```

### Categorized Structure

For larger skills:

```
references/
├── style/
│   ├── grammar.md
│   └── punctuation.md
├── patterns/
│   ├── errors.md
│   └── empty-states.md
└── terminology/
    ├── power-bi.md
    └── fabric-core.md
```

### Deep Structure

For very large skills (use sparingly):

```
references/
├── style/
│   ├── mechanics/
│   │   ├── grammar.md
│   │   └── punctuation.md
│   └── voice/
│       ├── tone.md
│       └── word-choice.md
```

## Skill Interdependencies

### Acceptable

- Skills reference each other rarely
- Each skill works independently
- Shared concepts explained in each skill

### Problematic

- Skills require each other to function
- Circular dependencies
- Frequent cross-skill routing

### Solution for Shared Content

Create a `shared/` or `common/` folder within each skill that needs it, or create a dedicated shared skill:

```
.github/skills/
├── fabric-common/        # Shared terminology, principles
├── content-design/       # References fabric-common
└── component-specs/      # References fabric-common
```

## Evolution Strategy

### Starting Out

1. Start with one skill
2. Add references as needed
3. Monitor for natural boundaries

### Growing

1. When skill exceeds ~40 references, evaluate split
2. Look for distinct sub-domains
3. Split along natural boundaries

### Mature State

1. Stable set of 3-6 skills
2. Clear domain ownership
3. Regular reference updates

## Skill Discovery

### Help Users Find Skills

In your repo README or docs:

```markdown
## Available Skills

| Skill | Use for |
|-------|---------|
| content-design | UI text, error messages, terminology |
| component-specs | Component patterns, props, examples |
| accessibility | A11y guidelines, WCAG compliance |
```

### Skill Discoverability Checklist

- [ ] Description includes clear triggers
- [ ] Skill name is intuitive
- [ ] Documentation lists available skills
- [ ] Examples show when to use each skill
