# Release Automation

Mechanic provides a streamlined release workflow.

---

## Full Release (One Command)

```bash
# Bumps version, updates changelog, commits, and tags
mech release MyAddon 1.2.0 "Added cooldown tracking feature"
```

This runs:

1. `version.bump` — Updates `.toc` Version field
2. `changelog.add` — Adds entry to `CHANGELOG.md`
3. `git.commit` — Stages and commits all changes
4. `git.tag` — Creates annotated git tag `v1.2.0`

---

## Individual Commands

```bash
# Just bump version
mech call version.bump -i '{"addon": "MyAddon", "version": "1.2.0"}'

# Just add changelog entry
mech call changelog.add -i '{"addon": "MyAddon", "version": "1.2.0", "message": "Added feature"}'

# Just commit
mech call git.commit -i '{"addon": "MyAddon", "message": "Release 1.2.0"}'

# Just tag
mech call git.tag -i '{"addon": "MyAddon", "version": "1.2.0"}'
```

---

## CHANGELOG Format

Mechanic expects/generates this format:

```markdown
# Changelog

## [1.2.0] - 2026-01-01

### Added
- Added cooldown tracking feature

## [1.1.0] - 2025-12-15

### Fixed
- Fixed memory leak in event handler
```

### Supported Sections

- `### Added` — New features
- `### Changed` — Changes to existing features
- `### Fixed` — Bug fixes
- `### Removed` — Removed features
- `### Deprecated` — Features being phased out
- `### Security` — Security-related changes

---

## Pre-Release Checklist

Before running `mech release`:

1. **Run validation**
   ```bash
   mech call addon.validate -i '{"addon": "MyAddon"}'
   ```

2. **Run tests**
   ```bash
   mech call addon.test -i '{"addon": "MyAddon"}'
   ```

3. **Check for deprecations**
   ```bash
   mech call addon.deprecations -i '{"addon": "MyAddon"}'
   ```

4. **Update Interface version** (if new WoW patch)
   ```toc
   ## Interface: 110207
   ```

---

## Post-Release

After tagging, you can:

1. **Push to remote**
   ```bash
   git push origin main --tags
   ```

2. **Upload to CurseForge** — The `.pkgmeta` file controls what gets packaged

---

## Related Guides

- [CLI Workflow](./cli-workflow.md)
- [CLI Reference](../cli-reference.md)
