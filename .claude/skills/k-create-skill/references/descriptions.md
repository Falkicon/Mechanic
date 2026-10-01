# Writing Skill Descriptions

The description (max 1024 characters) decides whether the skill is selected, and it is always loaded.

## Formula

```
[What it does]. [What it covers]. Use when [scenarios]. Triggers: [keywords].
```

## Guidance

- Lead with the primary function, name the real tools and nouns (`diagnostic.targets`, `release.all`, `FenUI:CreatePanel`), and avoid filler ("helps with various tasks").
- State the scope boundary so neighbours do not collide.
- End with 5-10 trigger keywords people actually type.
- Do not claim capabilities the skill lacks.

## Differentiating neighbours in this repository

| Skill | Distinguishing focus |
|-------|----------------------|
| `using-mechanic` | Calling Mechanic tools: targets, reload protocol, mutation rules |
| `k-ecosystem` | Components and "which skill next" |
| `k-mechanic` / `k-desktop` | How Mechanic is built / how to change the desktop tool |
| `s-lint` vs `s-audit` vs `s-clean` | Luacheck/StyLua only / security, complexity, deprecations / dead code and stale docs |
| `s-test` vs `s-debug` | Offline tests / runtime evidence in game |
| `s-research` vs `k-apidefs` | Using API data / regenerating it |

When two skills share trigger words, make each description say what the *other* one is for, and keep the broad words (`addon`, `lua`) out of narrow skills.

## Checklist

- [ ] Under 1024 characters
- [ ] Says what it does and when to use it
- [ ] Triggers do not duplicate a neighbour's
- [ ] Every named tool or API exists
