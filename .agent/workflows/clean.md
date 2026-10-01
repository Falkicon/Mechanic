---
description: Find and remove dead code and stale documentation.
---

Find and remove dead code and stale documentation.

**Skill**: [s-clean](../skills/s-clean/SKILL.md)

1. **Analyze Code**: Run `addon.deadcode` to find unused functions, orphaned files and dead exports. Check `truncated` and `read_errors`.
2. **Analyze Docs**: Run `docs.stale` to find broken links, outdated references and version drift.
3. **Triage**: Review findings by confidence level (definite, likely, suspicious) and search for dynamic uses before deleting.
4. **Clean**: Remove or update identified cruft in small steps, linting and testing as you go.
5. **Verify**: Re-run both analyses to confirm the cleanup.
