# Mechanic - WoW Addon Development Hub

This repository contains the Mechanic development hub for World of Warcraft addons.

## The Reload Loop (MANDATORY)

After ANY addon code change, you MUST verify the changes in-game:

1. **Ask** the user to `/reload` in WoW
2. **Wait** for the user to confirm the reload is complete
3. **Then** use the `addon.output` MCP tool (agent_mode=true) to get errors, tests, and console logs

> **CRITICAL**: Do NOT pull output immediately after making changes. The timing between reload and SavedVariables sync is unpredictable. Always wait for user confirmation before calling `addon.output`.

## MCP-First Development

Always prioritize calling MCP tools directly instead of using the shell.

- **Status**: `env.status`
- **Errors/Logs**: `addon.output` (with `agent_mode=true`)
- **Linting**: `addon.lint`
- **Testing**: `addon.test` or `sandbox.test`
- **Research**: `api.search` or `fencore.search`

## Technical Constraints

- **Lua 5.1**: Target WoW's Lua engine. Avoid `goto`, `bit32`, or 5.2+ features.
- **Combat Lockdown**: Never modify protected frames or call protected APIs in combat. Use `InCombatLockdown()` guards.
- **Secret Values**: Handle 12.0+ secret values using passthrough patterns. Never attempt to log or modify them directly.
- **Agent-First**: All new features must be implemented as AFD commands before being added to any UI.

## Skills & Capabilities

On-demand skills are available in `.claude/skills/`:
- `fen-ecosystem`: General ecosystem context and workflows
- `developing-addons`: Core architecture and patterns
- `debugging-addons`: Systematic problem solving
- `testing-addons`: Busted and Sandbox testing
- `researching-apis`: API discovery and Blizzard UI research
- `using-mechanic`: Mechanic CLI and hub reference
- `releasing-addons`: Automated release workflow
