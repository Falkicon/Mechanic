Automated addon release workflow.

**Skill**: [s-release](../skills/s-release/SKILL.md)

1. **Validate**: Call `addon.validate` to verify the TOC file and structure; run `addon.lint` and the tests.
2. **Audit**: Call `addon.deprecations` for deprecated Midnight APIs (limited database, see [s-audit](../skills/s-audit/SKILL.md)).
3. **Preview**: Call `release.all` with `dry_run=true` and show the user the planned version, changelog text and category, and tag.
4. **Confirm**: Wait for the user's explicit confirmation of that plan. Do not release on your own initiative.
5. **Release**: Call `release.all` without `dry_run` to bump the version, update the changelog, commit and tag.
6. **Report**: Give the user the version, commit hash and tag, and remind them that pushing/publishing is theirs to do. On `RELEASE_PARTIAL_FAILURE`, follow the recovery steps in the result.
