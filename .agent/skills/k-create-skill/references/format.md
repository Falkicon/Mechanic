# Skill File Format

The SKILL.md file structure and requirements.

## Required Structure

```markdown
---
name: [skill-name]
description: >
  [Description text]
---

# [Title]

[Body content]
```

## Frontmatter

### name (required)

- **Max length:** 64 characters
- **Format:** lowercase, hyphens for spaces
- **Examples:** `content-design`, `component-specs`, `skill-creation`

### description (required)

- **Max length:** 1024 characters
- **Purpose:** Helps Copilot decide when to use this skill
- **Include:**
  - What the skill does
  - What content it covers
  - When to use it
  - Trigger keywords

### Description Template

```yaml
description: >
  [Primary function]. [Content covered].
  Use when [scenarios]. Triggers: [keywords].
```

### Description Example

```yaml
description: >
  Content design expertise for Microsoft Fabric products. Reviews and generates
  UI text, error messages, notifications, empty states, and documentation
  following Microsoft Writing Style Guide. Use when writing, reviewing, or
  improving any user-facing content. Triggers: content review, style guide,
  UX writing, error messages, terminology.
```

## Body Content

After the frontmatter, include:

1. **Title** — H1 with skill name
2. **Brief intro** — One sentence
3. **Capabilities** — What the skill can do
4. **Routing table** — Map requests to references
5. **Core principles** — Always-apply rules
6. **Output format** — Response structure
7. **Escalation criteria** — When to flag for humans

## File Location

```
.github/skills/[skill-name]/SKILL.md
```

The `.github/skills/` path is required for VS Code to discover skills.

## Markdown Guidelines

- Use standard Markdown
- Tables for routing logic
- Code blocks for templates/examples
- Keep body concise (it loads into context)
- Deep content goes in references

## Example Minimal Skill

```markdown
---
name: example-skill
description: >
  Example skill demonstrating minimal structure. Use for reference.
  Triggers: example, demo, template.
---

# Example Skill

Demonstrates minimal skill structure.

## Capabilities

1. **Demo** — Shows skill format

## Core Principles

- Keep it simple
- Be specific
```

## Example Full Skill

```markdown
---
name: api-design
description: >
  API design guidance for REST and GraphQL APIs. Covers naming, versioning,
  error handling, and documentation. Use when designing, reviewing, or
  documenting APIs. Triggers: API design, REST, GraphQL, endpoint, schema.
---

# API Design

Expert guidance for designing consistent, usable APIs.

## Capabilities

1. **Design review** — Check APIs against standards
2. **Pattern guidance** — Apply REST/GraphQL patterns
3. **Documentation** — Generate API docs

## Routing Logic

| Request type | Load reference |
|--------------|----------------|
| REST conventions | [references/rest.md](references/rest.md) |
| GraphQL patterns | [references/graphql.md](references/graphql.md) |
| Error responses | [references/errors.md](references/errors.md) |
| Versioning | [references/versioning.md](references/versioning.md) |

## Core Principles

- Consistent naming (camelCase for JSON, kebab-case for URLs)
- Meaningful HTTP status codes
- Descriptive error messages
- Version in URL path

## Output Format

### For reviews
- Issues found with specific fixes
- Revised API definition

### For generation
- Complete endpoint definition
- Request/response examples

## When to Escalate

- Breaking changes to existing APIs
- Security-sensitive endpoints
- New authentication patterns
```
