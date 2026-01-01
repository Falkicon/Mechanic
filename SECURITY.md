# Security Policy

## Scope

Mechanic is a local development tool for World of Warcraft addon development. It consists of:

- **In-game addon** — Runs within WoW's sandboxed addon environment
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

- Binds to `localhost` only by default
- No authentication (assumes trusted local environment)
- Command execution is sandboxed to WoW development tasks

### In-Game Addon

- Runs in WoW's restricted addon environment
- Cannot access filesystem directly (uses SavedVariables)
- All data exchange happens via disk files on `/reload`

### File Watcher

- Monitors only configured WoW directories
- Does not execute arbitrary code from watched files

## Best Practices

1. **Don't expose** the dashboard port to external networks
2. **Don't run** the server on shared/public machines
3. **Keep updated** to the latest version

---

Thank you for helping keep Mechanic secure!
