# Writing Skill Descriptions

How to write effective skill descriptions that help Copilot use your skill correctly.

## Purpose

The description (max 1024 characters) is critical because:

- Copilot reads it to decide if your skill applies
- It's always loaded (unlike references)
- Poor descriptions = skill never gets used

## Description Formula

```
[What it does]. [What content it covers].
Use when [scenarios]. Triggers: [keywords].
```

## Components

### 1. What It Does

Lead with the primary function:

```
✓ "Content design expertise for Microsoft Fabric products."
✓ "API design guidance for REST and GraphQL APIs."
✓ "Component specification templates and patterns."

✗ "This skill helps with content."
✗ "A useful tool for various tasks."
```

### 2. What Content It Covers

Specify the scope:

```
✓ "Reviews and generates UI text, error messages, notifications, 
   empty states, and documentation following Microsoft Writing Style Guide."

✓ "Covers naming conventions, versioning strategies, error handling, 
   and documentation standards."
```

### 3. When to Use

Help Copilot match requests:

```
✓ "Use when writing, reviewing, or improving any user-facing content."
✓ "Use when designing new APIs or reviewing existing endpoint definitions."
```

### 4. Trigger Keywords

Explicit keywords improve matching:

```
✓ "Triggers: content review, style guide, UX writing, error messages, 
   empty states, notifications, terminology."

✓ "Triggers: API design, REST, GraphQL, endpoint, schema, versioning."
```

## Examples

### Good Description

```yaml
description: >
  Content design expertise for Microsoft Fabric products. Reviews and generates
  UI text, error messages, notifications, empty states, and documentation
  following Microsoft Writing Style Guide. Use when writing, reviewing, or
  improving any user-facing content for Fabric workloads. Triggers: content
  review, style guide, UX writing, error messages, empty states, notifications,
  terminology, button labels, tooltips, Microsoft style.
```

**Why it works:**
- Clear primary function
- Specific content types listed
- Explicit scenarios
- Rich trigger keywords

### Poor Description

```yaml
description: >
  Helps with content for Fabric.
```

**Problems:**
- Too vague
- No trigger keywords
- Doesn't explain scope
- Won't match specific requests

## Trigger Keyword Selection

### Include

- Primary concepts (content, API, component)
- Specific items (error messages, endpoints, props)
- Actions (review, generate, validate)
- Synonyms (UI text, UX writing, copy)
- Product names (Fabric, Power BI)

### Avoid

- Generic words alone (help, guide, tool)
- Internal jargon users won't type
- Overly broad terms that match everything

## Length Optimization

With 1024 character limit:

```
~200 chars: What it does + content scope
~150 chars: Use when scenarios
~200 chars: Trigger keywords
~400 chars: Buffer for details
```

## Testing Your Description

Ask yourself:

1. If a user asks "[request]", will this description match?
2. Are all the skill's capabilities mentioned or hinted at?
3. Would another skill's description also match? (overlap problem)
4. Are common synonyms included in triggers?

## Multi-Skill Differentiation

When you have multiple skills, descriptions must differentiate:

```yaml
# Skill 1
description: >
  Content design for UI text and documentation...
  Triggers: content, writing, copy, UX text...

# Skill 2  
description: >
  Component specifications and API documentation...
  Triggers: component spec, props, API, interface...
```

Not:

```yaml
# Skill 1
description: >
  Helps with Fabric documentation...

# Skill 2
description: >
  Documentation assistance for Fabric...
```
