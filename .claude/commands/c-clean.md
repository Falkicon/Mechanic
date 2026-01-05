Find and remove dead code and stale documentation.

**Skill**: [s-clean](../skills/s-clean/SKILL.md)

1. **Analyze Code**: Run `addon.deadcode` to find unused functions, orphaned files, dead exports.
2. **Analyze Docs**: Run `docs.stale` to find broken links, outdated references, version drift.
3. **Triage**: Review findings by confidence level (definite → likely → suspicious).
4. **Clean**: Remove or update identified cruft.
5. **Verify**: Re-run analysis to confirm cleanup is complete.
