# Security Policy

## Scope

Mechanic is a local development tool for World of Warcraft addon development. It consists of:

- **In-game addons** — `!Mechanic` (bootstrap and queues) and `Mechanic` (main UI) run within WoW's addon environment
- **Desktop application** — Python server running on localhost (port 3100)

The desktop component is designed for **local development use only** and should not be exposed to untrusted networks.

## Supported Versions

| Version | Supported |
|---------|-----------|
| 0.2.x   | ✅ Yes    |
| < 0.2   | ❌ No     |

## Reporting a Vulnerability

If you discover a security issue, please report it responsibly:

1. **Do not** open a public GitHub issue for security vulnerabilities
2. **Email** the maintainer directly (see GitHub profile)
3. Include:
   - Description of the vulnerability
   - Steps to reproduce
   - Potential impact
   - Suggested fix (if any)

I'll acknowledge receipt within 48 hours and provide a timeline for a fix.

## Security Considerations

### Desktop Server

- The dashboard binds to `127.0.0.1` by default (port 3100, configurable).
- HTTP and WebSocket connections validate local hosts/browser origins. These checks do not authenticate local programs; requests without an Origin header are allowed.
- There is no user authentication. Commands run with the desktop process's filesystem and process permissions, and may write files, run external tools, or execute Lua. There is no operating-system sandbox around command execution.
- MCP clients also receive command execution access. Mutation/read-only annotations describe behavior; they are not access controls.
- Release/sync previews describe proposed work. They do not reserve state or guarantee rollback after a partial failure.

### In-Game Addon

- Runs in WoW's restricted addon environment
- Cannot access filesystem directly (uses SavedVariables)
- SavedVariables carry game-to-desktop snapshots on reload/logout. Generated queue files carry desktop-to-game Lua/API requests on addon load.
- Queue execution intentionally evaluates developer-supplied Lua in the game environment. Treat queue files as code. Character/profile guards route execution; they are not an authentication boundary between accounts.

### File Watcher

- Monitors configured/discovered SavedVariables directories and optional addon source paths
- SavedVariables parsing does not evaluate Lua source. Optional source-watch auto-reload sends the configured key to WoW; the game then loads addon code.
- Saved diagnostic data and SQLite command history can include logs, errors, results, and local paths. Review this content before sharing it.

## Best Practices

1. **Don't expose** the dashboard port to external networks
2. **Don't run** the server on shared/public machines
3. **Keep updated** to the latest version

---

Thank you for helping keep Mechanic secure!
