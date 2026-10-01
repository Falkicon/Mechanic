---
name: s-release
description: >
  Prepare and execute an addon release with release.all: validation, a mandatory
  dry run, user confirmation, then version bump, changelog entry, commit and
  tag. Covers changelog categories, preflight errors and partial-failure
  recovery. Triggers: release, version bump, changelog, git tag, publish.
---

# Releasing WoW Addons

Guidance for the release workflow with Mechanic. A release changes files, creates a commit and a tag: **never run it without an explicit request from the user, and always preview first.**

## Related Commands

- [c-release](../../workflows/release.md) - Release workflow

## MCP Tools

Call MCP tools directly ([using-mechanic](../using-mechanic/SKILL.md)). Inputs are in the generated [command reference](../using-mechanic/references/afd-commands.md).

| Task | MCP Tool |
|------|----------|
| Validate TOC and structure | `addon.validate(addon="MyAddon")` |
| Lint / tests / deprecations | `addon.lint`, `addon.test` or `sandbox.test`, `addon.deprecations` (limited database, see [s-audit](../s-audit/SKILL.md)) |
| Preview the release | `release.all(addon, version, message, category, dry_run=true)` |
| Run the release | `release.all(addon, version, message, category)` after the user confirms |
| Individual steps (recovery only) | `version.bump`, `changelog.add`, `git.commit`, `git.tag` |

## Workflow

1. Pre-release checks: `addon.validate`, `addon.lint`, tests, `addon.deprecations`. Fix or report problems.
2. **Dry run**: `release.all` with `dry_run: true`. It runs the same preflight (tag conflict check, existing staged changes) and returns `steps_planned` with nothing changed. Show the planned version, changelog text, category and tag to the user.
3. **Ask for confirmation** of exactly that plan. Do not proceed on silence.
4. Run `release.all` without `dry_run`. It bumps the TOC version, inserts the changelog entry, commits only the addon's files (`chore(release): v<version>`), and creates the annotated tag `v<version>`.
5. Report the version, commit hash and tag. Pushing and publishing are separate steps for the user.

## Behaviour to know

- **Changelog categories**: `Added`, `Changed`, `Deprecated`, `Removed`, `Fixed`, `Security` (case-insensitive; anything else fails with `INVALID_CATEGORY`). Default is `Changed`. The entry is inserted before the first existing `## [` heading, dated today.
- **Version**: validated (`INVALID_VERSION`); the tag is `v<version>` and an existing tag is never moved (`TAG_CONFLICT`).
- **Preflight errors**: `STAGED_CHANGES` (commit or unstage first), `TAG_CONFLICT`, `NO_TOC`, `GIT_NOT_FOUND`, `PREFLIGHT_FAILED`.
- **Not transactional**: on failure the result is `RELEASE_PARTIAL_FAILURE` with `details.failed_step`, `steps_completed` and `recovery`. Completed steps are not rolled back, and rerunning `release.all` may duplicate the changelog entry. Inspect `git status` and `git diff --cached`, then finish the remaining steps individually.
- A Mechanic release has two TOCs (`!Mechanic` and `Mechanic`) with separate versions and changelogs; release each addon by name and keep their changelogs in step.
- The user's CLI equivalent is `mech release ADDON VERSION MESSAGE --dry-run` ([cli-commands](../k-mechanic/references/cli-commands.md)); agents use the MCP tool.

## Routing Logic

| Request type | Load reference |
|--------------|----------------|
| Release workflow, changelog format | [../../../docs/integration/release.md](../../../docs/integration/release.md) |
| Human CLI reference | [../../../docs/cli-reference.md](../../../docs/cli-reference.md) |
