# Packaging and Release

> Part of the [Addon Development Guide](../AGENTS.md#addon-development-guide)

Last updated: 2025-12-22

---

## Overview

Good release hygiene makes your addon trustworthy and maintainable.

**Midnight Timeline**:
- Pre-patch: January 20, 2026
- Full release: March 2, 2026

Plan your releases around these dates.

---

## Versioning

### Semantic-ish versioning

```
MAJOR.MINOR.PATCH

0.x.x  - While building/unstable
1.0.0  - First stable release
1.1.0  - New features (backward compatible)
1.1.1  - Bug fixes only
2.0.0  - Breaking changes (e.g., Midnight compatibility)
```

### Keep TOC version in sync

```toc
## Version: 1.2.3
```

Update this with every release. Users and error reports reference this.

---

## Changelog

Keep a changelog section in README or dedicated file:

```markdown
## Changelog

### 2.0.0 (2026-01-20)
- Added Midnight (12.0) compatibility
- Implemented secret value passthrough for combat
- Updated interface version to 120000

### 1.2.0 (2025-12-15)
- Added opacity slider for proc glows
- Fixed cooldown spark not showing on charge abilities

### 1.1.0 (2025-12-10)
- Added support for stance/form bar swapping
- Improved performance during heavy combat
```

### What to include

| Include | Skip |
|---------|------|
| New features | Internal refactoring |
| Bug fixes | Code cleanup |
| Breaking changes | Minor optimizations |
| API changes | Typo fixes |
| Midnight compatibility notes | |

---

## Distribution Platforms

### CurseForge

- Largest user base.
- Supports auto-packaging from Git.
- `.pkgmeta` configures the packager.

### Wago.io

- Growing platform.
- Also supports WeakAuras and Plater profiles.
- Good for addons with companion WeakAuras.

### WoWInterface

- Developer-focused community.
- Good for niche or technical addons.

---

## CurseForge .pkgmeta

Basic configuration:

```yaml
package-as: MyAddon

ignore:
  - README.md
  - .git
  - .github
  - "*.md"
  - tests
  - AGENTS.md

externals:
  Libs/LibStub: https://repos.curseforge.com/wow/libstub/trunk
```

### Release workflow with tags

```bash
# Update version in TOC
# Update CHANGELOG.md
# Commit changes
git commit -am "Release 1.2.0"

# Tag for release
git tag 1.2.0
git push origin main --tags
```

| Tag Format | CurseForge Release Type |
|------------|------------------------|
| `1.0.0` | Release |
| `1.0.0-beta` | Beta |
| `1.0.0-alpha` | Alpha |

---

## Pre-Release Checklist

Before tagging a release, you **MUST** complete the automated validation sweep using the CLI (No approval needed):

1.  **Validate TOC**: Run `addon-dev validate --all` to ensure interface versions and files are correct.
2.  **Full Linting**: Run `addon-dev lint <name>` to catch any remaining syntax or style issues.
3.  **Unit Tests**: Run `addon-dev test <name>` to ensure all tests pass.
4.  **Midnight Audit**: Run `addon-dev fix-deprecations <name>` to verify compatibility.

---

## CI/CD Pipeline

Every push and pull request to the `main` branch triggers an automated quality gate in GitHub Actions.

### Automated Checks
- **Linting**: Runs `addon-dev lint --all` to catch syntax and compatibility issues.
- **Testing**: Runs `addon-dev test --all` to ensure no logic regressions.
- **TOC Validation**: Runs `addon-dev validate --all` to verify interface versions and file existence.
- **Formatting**: Runs StyLua check to ensure code style consistency.

### Weekly Audit
A scheduled workflow runs every Monday at 9 AM UTC to scan all addons for new deprecated APIs using `addon-dev fix-deprecations`. If issues are found, a GitHub issue is automatically created.

---

## Automated Release Execution

This workspace uses the **unified CLI** to automate versioning, changelog updates, and git tagging.

### CLI (Preferred)
```bash
addon-dev release "Weekly" "1.3.0" "Midnight compatibility and performance fixes."
```

### Cursor Command
Trigger the release workflow using the native command:
```powershell
@release I'm ready to push "Weekly" v1.3.0
```

---

## Midnight Release Planning

### Pre-Patch Preparation (Before Jan 20, 2026)

1. **Test on PTR/Beta** when available
2. **Update interface version** to 120000
3. **Add secret value handling** where needed
4. **Test in instance content** (raids, M+)
5. **Prepare fallback/degraded modes**

### Release Strategy

```
Current (TWW)     -> v1.x.x (Interface: 110002)
Pre-patch ready   -> v2.0.0-beta (Interface: 110002, 120000)
Midnight release  -> v2.0.0 (Interface: 120000)
```

### Multi-Version TOC

```toc
## Interface: 120000
## Interface-Retail: 120000

## Title: My Addon
## Version: 2.0.0
## Notes: Now with Midnight compatibility!
```

---

## Git Best Practices

### .gitignore

```gitignore
# Don't commit SavedVariables
*.lua.bak

# Editor files
.vscode/
*.swp

# OS files
.DS_Store
Thumbs.db
```

### Branch strategy

- `main` - Stable releases
- `develop` - Work in progress
- `midnight` - Midnight compatibility branch (merge before pre-patch)
- Feature branches for larger changes

---

## Automated Validation and CI

Modern addon development uses GitHub Actions to ensure code quality before it reaches users.

### CI Pipeline
Every push and pull request triggers an automated CI pipeline that runs:
1.  **Luacheck**: Static analysis to catch global leaks and syntax errors.
2.  **TOC Validation**: Ensures `.toc` files are correct and referenced files exist.
3.  **Deprecation Scanning**: Warns about deprecated APIs (essential for Midnight 12.0).

### Pull Request Flow
When submitting changes, use the provided **Pull Request Template** (`.github/PULL_REQUEST_TEMPLATE.md`). It ensures:
- A clear summary of changes is provided.
- Testing on Retail and PTR/Beta is documented.
- Midnight compatibility (secret values) is verified.
- Related issues are linked (e.g., `Closes #42`).

---

## Communication

### Announce Midnight changes

When releasing Midnight compatibility updates, clearly communicate:

1. **What changed** - Secret value handling, degraded modes
2. **What works** - Display features, settings
3. **What doesn't** - Combat log parsing, real-time data in instances
4. **When to expect fixes** - If waiting on Blizzard APIs

Example release note:

```markdown
## 2.0.0 - Midnight Compatibility

### What's New
- Full compatibility with WoW 12.0 (Midnight)
- Secret value passthrough for health/resource bars
- Graceful degradation during combat in instances

### Known Limitations (Midnight API restrictions)
- Combat log parsing disabled (Blizzard restriction)
- Charge counts show "..." during M+/raid combat
- Boss timers replaced with "Native alerts active" message

### Migration
No action needed - settings migrate automatically.
```
