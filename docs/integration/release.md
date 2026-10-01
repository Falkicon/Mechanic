# Release Automation

Mechanic provides a release workflow with a preview and preflight checks.

---

## Full Release (One Command)

```bash
# Preview first: preflight only, nothing is changed
mech release MyAddon 1.2.0 "Added cooldown tracking feature" --dry-run

# Bump version, update changelog, commit, and tag
mech release MyAddon 1.2.0 "Added cooldown tracking feature"
```

`mech release` runs the same `release.all` command that MCP clients and the dashboard use. After a preflight (tag state, unrelated staged changes) it runs:

1. `version.bump` - updates the `.toc` Version field
2. `changelog.add` - adds an entry to `CHANGELOG.md` (`--category` selects the section; default `Changed`)
3. `git.commit` - stages and commits changes limited to the addon folder
4. `git.tag` - creates the annotated git tag `v1.2.0`

The steps are not transactional. If a later step fails, the result lists the completed steps and recovery guidance; nothing is rolled back automatically. `--skip-tag` was removed (the CLI exits with status 2). To release without a tag, run the individual commands below.

---

## Individual Commands

```bash
# Just bump version
mech call version.bump '{"addon": "MyAddon", "version": "1.2.0"}'

# Just add changelog entry
mech call changelog.add '{"addon": "MyAddon", "version": "1.2.0", "message": "Added feature", "category": "Added"}'

# Just commit
mech call git.commit '{"addon": "MyAddon", "message": "Release 1.2.0"}'

# Just tag
mech call git.tag '{"addon": "MyAddon", "version": "1.2.0"}'
```

---

## CHANGELOG Format

`changelog.add` validates the version string, inserts the new entry before the first existing `## [` heading, and generates this format:

```markdown
# Changelog

## [1.2.0] - 2026-01-01

### Added
- Added cooldown tracking feature

## [1.1.0] - 2025-12-15

### Fixed
- Fixed memory leak in event handler
```

### Supported Categories

The `category` input accepts one of:

- `Added` - new features
- `Changed` - changes to existing features (default)
- `Deprecated` - features being phased out
- `Removed` - removed features
- `Fixed` - bug fixes
- `Security` - security-related changes

---

## Pre-Release Checklist

Before running `mech release`:

1. **Run validation**
   ```bash
   mech call addon.validate '{"addon": "MyAddon"}'
   ```

2. **Run tests**
   ```bash
   mech call addon.test '{"addon": "MyAddon"}'
   ```

3. **Check for deprecations**
   ```bash
   mech call addon.deprecations '{"addon": "MyAddon"}'
   ```

4. **Update Interface version** (if there is a new WoW patch). Several versions can be comma-separated:
   ```toc
   ## Interface: 120100, 16001
   ```

---

## Post-Release

After tagging, you can:

1. **Push to remote**
   ```bash
   git push origin main --tags
   ```

2. **Upload to CurseForge** - the `.pkgmeta` file controls what gets packaged

---

## Related Guides

- [CLI Workflow](./cli-workflow.md)
- [CLI Reference](../cli-reference.md)
