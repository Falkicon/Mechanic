---
description: Automated addon release workflow.
---

Automated addon release workflow.

**Skill**: [s-release](../skills/s-release/SKILL.md)

1. **Validate**: Call the `addon.validate` MCP tool to verify the TOC file and structure.
2. **Audit**: Call the `addon.deprecations` MCP tool to check for deprecated Midnight APIs.
3. **Release**: Call the `release.all` MCP tool to bump the version, update the changelog, commit changes, and create a git tag.
4. **Report**: Provide the user with the new version number and a summary of the release notes.
