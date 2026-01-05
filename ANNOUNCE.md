# Mechanic Announcements

Three versions for different contexts. Copy/paste as needed.

---

## Short Version (~150 words)

For Discord shares, quick forum posts.

---

**Mechanic** — The addon development platform built for AI-assisted workflows

Tired of the edit → `/reload` → alt-tab → copy error → repeat loop? Mechanic connects your in-game development with desktop tooling and AI workflows.

**Three tiers, one ecosystem:**
- **In-game dashboard** — Frame inspector, error tracking, console, tests, performance metrics
- **Desktop dashboard** — Syncs automatically on `/reload` via WebSocket, no manual copying
- **Agent-ready CLI** — Everything available via structured commands your AI assistant can use
- **Offline sandbox** — Test Core logic in 30ms vs. 30-second reload cycles

**Highlights:**
- 5000+ WoW API stubs for offline testing — no game client needed
- Full stack traces with BugGrabber integration
- One-command releases: version bump, changelog, git tag
- Pick any frame, explore hierarchy, edit properties live

Built for developers who use Claude, Cursor, or any AI coding assistant. Add `AGENTS.md` to your agent's context and it can pull errors, run tests, handle releases.

Clone it, run `mech`, see the dashboard. Alpha, GPL-3.0, built for WoW 12.0 Midnight.

**GitHub:** https://github.com/Falkicon/Mechanic

---

## Medium Version (~300 words)

For Discord channels, forum posts, community shares.

---

**Mechanic** — The addon development platform built for AI-assisted workflows

If you've built WoW addons, you know the loop: edit code, `/reload`, alt-tab to check errors, copy stack traces, guess at frame hierarchies, repeat. It's slow and breaks your flow.

Mechanic fixes this with a four-tier workflow:

**In-Game Dashboard**
- Frame inspector (pick any frame, explore hierarchy, edit properties live)
- Error tracking with BugGrabber integration
- Console with filtering and deduplication
- Unit test runner with pass/fail tracking
- Real-time performance metrics per addon

**Desktop Dashboard**
Every `/reload` syncs your game state to a browser dashboard via WebSocket. Errors, tests, console logs — all there, no manual copying.

**Agent-Ready CLI**
Everything in the dashboard is available via CLI. This is where it gets interesting for AI-assisted development:

```bash
mech addon.output          # Get errors, tests, console in one call
mech call addon.lint       # Run Luacheck
mech call sandbox.test     # Test Core logic offline
mech release MyAddon 1.2.0 # Bump version, changelog, tag
```

Your AI assistant can pull the latest errors after a reload, run validation before commits, and handle the entire release workflow. You focus on the code.

**Sandbox Testing**
Test your addon's Core logic without WoW running. The sandbox provides 5000+ API stubs generated from Blizzard's APIDefs. Write tests in `Tests/Core/`, run them in 30ms — vs. 30-second reload cycles. CI/CD ready.

**Getting Started**
```bash
cd "!Mechanic/desktop"
pip install -e .
mech
```

Start with Quick Start, integrate with the [Addon Integration Guide](docs/addon-integration.md), or read `AGENTS.md` if you're using AI assistants.

Alpha software, actively developed. Built for WoW 12.0 Midnight.

**GitHub:** https://github.com/Falkicon/Mechanic

---

## Long Version (~500 words)

For blog posts, detailed forum threads, friendly communities.

---

**Mechanic** — The addon development platform built for AI-assisted workflows

I got tired of the fragmented state of WoW addon tooling. Switching between game and editor constantly. Copying stack traces by hand. No proper testing framework. Tooling that hasn't evolved in years.

So I built what I wanted: a unified platform that connects your in-game development experience with desktop tooling and AI-assisted workflows.

### The Three-Tier Workflow

**1. In-Game Dashboard**

While you're developing, Mechanic gives you real tools inside WoW:

- **Frame Inspector** — Pick any frame, explore its hierarchy, edit properties live, export the Lua code
- **Error Tracking** — Full stack traces with BugGrabber integration, grouped by addon
- **Console** — All addon logs with filtering, search, timestamps
- **Test Runner** — Run unit tests in-game, see results instantly
- **Performance** — Real-time FPS, memory, CPU profiling per addon
- **API Browser** — Searchable WoW API reference with 12.0 Midnight status

**2. Desktop Dashboard**

Every `/reload` automatically syncs your game state to a browser dashboard. The Diagnostic Hub addon aggregates data from all registered addons, writes to SavedVariables, and the desktop watches for changes. WebSocket pushes updates instantly — no manual refresh.

You get errors, test results, console logs, and performance metrics in one place. Stop alt-tabbing to copy error messages.

**3. Agent-Ready CLI**

This is where it gets powerful. Everything in the dashboard is available via structured CLI commands:

```bash
# Pull the latest state
mech addon.output

# Quality checks
mech call addon.validate -i '{"addon": "MyAddon"}'
mech call addon.lint -i '{"addon": "MyAddon"}'

# Offline testing (no WoW needed)
mech call sandbox.test -i '{"addon": "MyAddon"}'

# Full release workflow
mech release MyAddon 1.2.0 "Added new feature"
```

This means your AI coding assistant (Claude, Cursor, Copilot, whatever) can:
- Pull errors after a reload and diagnose issues
- Run validation before committing
- Execute the release workflow
- Create new addons from templates

Add `AGENTS.md` to your agent's context and it has full command reference and workflow patterns.

### Sandbox Testing

The sandbox lets you test your addon's Core logic without WoW running. It generates 5000+ API stubs from Blizzard's APIDefs, loads your `Core/` layer, and runs Busted-compatible tests.

```
MyAddon/
├── Core/Actions/tracker.lua    # Pure Lua business logic
└── Tests/Core/tracker_spec.lua # Sandbox tests
```

Tests run in 30ms vs. 30-second `/reload` cycles. CI/CD ready — run tests on every commit without a game client.

### Architecture

Mechanic follows AFD (Agent-First Development) — every feature is a structured command with typed inputs/outputs. This is why AI integration works well: the interface is explicit, not implicit.

Your addon registers with `MechanicLib` to expose tests, metrics, and tools. The ecosystem grows as more addons integrate.

### Status

Core features production-ready. Alpha phase — expect evolving APIs. Built for WoW 12.0 Midnight. GPL-3.0 licensed.

**Getting started:** Read `AGENTS.md` first if you're using AI assistants — it has the full command reference and workflow patterns. Then see `docs/addon-integration.md` for integration.

Feedback shapes the roadmap. If something doesn't work for your workflow, open an issue.

**GitHub:** https://github.com/Falkicon/Mechanic

---

## Notes for Posting

- Adjust GitHub URL if it changes
- Remove alpha warnings once stable
- Update version numbers as needed
- For Twitter/X: use the short version, link to GitHub
- For r/wowui or Discord #addon-dev: medium version works well
- For detailed writeups: long version, maybe add screenshots
