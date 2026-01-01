# CLI Workflow

Daily development commands and patterns for working with Mechanic.

---

## Daily Development

```bash
# Start your session
mech                          # Launch dashboard

# After making changes, trigger reload
mech reload                   # Sends Ctrl+Shift+R to WoW

# Check for errors
mech addon.output             # Full snapshot (errors, tests, console)
mech addon.output --agent     # Compressed for AI assistants
```

---

## Code Quality

```bash
# Validate TOC
mech call addon.validate -i '{"addon": "MyAddon"}'

# Lint with Luacheck
mech call addon.lint -i '{"addon": "MyAddon"}'

# Format with StyLua
mech call addon.format -i '{"addon": "MyAddon"}'

# Run tests
mech call addon.test -i '{"addon": "MyAddon"}'

# Scan for deprecated APIs (Midnight prep)
mech call addon.deprecations -i '{"addon": "MyAddon"}'
```

---

## All-in-One Validation

```bash
# Run full quality suite before committing
mech call addon.lint -i '{"addon": "MyAddon"}' && \
mech call addon.test -i '{"addon": "MyAddon"}' && \
mech call addon.validate -i '{"addon": "MyAddon"}'
```

---

## Quick Reference

| Task | Command |
|------|---------|
| Start dashboard | `mech` |
| Reload WoW UI | `mech reload` |
| Get addon output | `mech addon.output` |
| Validate TOC | `mech call addon.validate -i '{"addon": "NAME"}'` |
| Lint code | `mech call addon.lint -i '{"addon": "NAME"}'` |
| Format code | `mech call addon.format -i '{"addon": "NAME"}'` |
| Run tests | `mech call addon.test -i '{"addon": "NAME"}'` |
| Check deprecations | `mech call addon.deprecations -i '{"addon": "NAME"}'` |
| Sync to clients | `mech call addon.sync -i '{"addon": "NAME"}'` |

---

## Environment Check

```bash
# Verify your setup
mech call env.info
```

This shows:
- WoW installation paths
- Active clients (_retail_, _beta_, _ptr_)
- SavedVariables locations
- Tool availability (Luacheck, StyLua, Busted)

---

## Related Guides

- [Release Automation](./release.md)
- [Troubleshooting](./troubleshooting.md)
- [CLI Reference](../cli-reference.md)
