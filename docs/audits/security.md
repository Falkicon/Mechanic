# Security Audit Report

**Date**: 2026-01-10
**Scope**: Mechanic WoW Addon Development Hub
**Auditor**: Claude Code (Automated)

## Executive Summary

This security audit examines the Mechanic codebase for exposed credentials, security vulnerabilities, and best practice violations. The project is open source and intended for WoW addon development.

**Overall Risk Level**: LOW-MEDIUM

- No credentials exposed in tracked files
- `.env` file properly gitignored
- Some code-level security considerations identified

---

## 1. Credential Exposure Analysis

### 1.1 API Keys and Secrets

| Check | Status | Notes |
|-------|--------|-------|
| `.env` in .gitignore | PASS | Line 42 in `.gitignore` excludes `.env` |
| `.env` tracked by git | PASS | File is not tracked |
| Hardcoded API keys | PASS | No API keys found in tracked source files |
| Google API key patterns | PASS | No `AIza*` patterns in tracked files |
| OpenAI key patterns | PASS | No `sk-*` patterns found |
| GitHub token patterns | PASS | No `ghp_*` patterns found |

### 1.2 Configuration Files

| File | Status | Risk |
|------|--------|------|
| `desktop/.env.example` | SAFE | Contains placeholder `your_api_key_here` |
| `desktop/.env` | GITIGNORED | User's local secrets - not tracked |
| `.gitignore` | GOOD | Properly excludes sensitive files |

### 1.3 Recommendations

- **Local `.env` file** exists at `desktop/.env` with a real Gemini API key. Ensure this file is NEVER committed.
- Consider adding a pre-commit hook to scan for API key patterns before commits.

---

## 2. Code Security Analysis

### 2.1 Lua Addon Code

Analysis performed via MCP `addon.security` tool on 257 files.

#### 2.1.1 Unsafe Eval Patterns (4 issues)

| File | Line | Pattern | Risk | Notes |
|------|------|---------|------|-------|
| `!Mechanic/Bootstrap.lua` | 133 | `loadstring("return " .. code)` | MEDIUM | Executes user-queued Lua code |
| `!Mechanic/Bootstrap.lua` | 136 | `loadstring(code)` | MEDIUM | Fallback execution |
| `sandbox/generated/wow_stubs.lua` | 9260 | `RunMacroText` stub | LOW | Test stub only |
| `sandbox/generated/wow_stubs.lua` | 20176 | `RunScript` stub | LOW | Test stub only |

**Analysis**: The `loadstring` usage in Bootstrap.lua is intentional - it's the Lua evaluation feature for development/debugging. The code is:
- Only executed from SavedVariables queued by the desktop tool
- Sandboxed within the WoW addon environment
- Intended for developer use only

**Recommendation**: Document that this is a development tool and should not be enabled in production releases if distributed to end users.

#### 2.1.2 Combat Lockdown Violations (19 issues)

All 19 issues are in `sandbox/generated/wow_stubs.lua` - these are **auto-generated test stubs**, not production addon code. They define stub functions for WoW APIs that are protected in combat.

**Assessment**: FALSE POSITIVES - These are test stubs used by the sandbox testing system, not actual addon code that would run in-game.

#### 2.1.3 WoW Secret Values Handling

The codebase properly references WoW's secret value APIs:
- `HasSecretValues`
- `IsPreventingSecretValues`
- `SetPreventSecretValues`

These are part of the API definitions registry for developer reference, not attempts to bypass the secret value system.

### 2.2 Python/CLI Code

#### 2.2.1 Credential Handling

| Pattern | Status | Notes |
|---------|--------|-------|
| API key loading | GOOD | Uses `os.environ.get()`, never logged |
| Key validation | GOOD | Fails gracefully with helpful error messages |
| Key exposure in output | GOOD | `env.status` command does not expose API keys |

#### 2.2.2 Subprocess Execution

The `system.pick_file` command executes PowerShell:
```python
subprocess.run(["powershell", "-Command", ps_script], ...)
```

**Risk**: LOW - The script is constructed from user input (`title` and `filter`), but:
- Runs in a file picker context only
- No user-controlled code execution path
- Limited to opening a file dialog

**Recommendation**: Consider sanitizing `input.title` and `input.filter` to prevent PowerShell injection, though exploitation is unlikely.

---

## 3. File System Security

### 3.1 Gitignore Coverage

The `.gitignore` file properly excludes:
- `.env` - Environment files with secrets
- `__pycache__/` - Python bytecode
- `*.pyc`, `*.pyo` - Compiled Python
- `venv/`, `.venv/` - Virtual environments
- `desktop/data/` - Local data directory
- `sandbox/generated/` - Generated test stubs

### 3.2 Missing Protections

| Item | Status | Recommendation |
|------|--------|----------------|
| `.claudeignore` | MISSING | Consider adding to exclude sensitive paths from AI analysis |
| Pre-commit hooks | MISSING | Consider adding secret scanning hooks |

---

## 4. Open Source Considerations

Since this is an open source project:

### 4.1 Safe to Publish
- All source code in tracked files
- API definitions and documentation
- Example configuration files
- Test fixtures and stubs

### 4.2 Verify Before Publishing
- Ensure `desktop/.env` is never committed
- Review any new configuration files for credentials
- Check SavedVariables paths don't contain user data in examples

---

## 5. Summary of Findings

### Critical Issues: 0

### High Risk Issues: 0

### Medium Risk Issues: 2

1. **Loadstring in Bootstrap.lua** - Intentional but should be documented as dev-only feature
2. **Local `.env` with API key** - Properly gitignored but user should be aware

### Low Risk Issues: 1

1. **PowerShell command construction** - Minor injection risk in file picker

### Informational: 2

1. No `.claudeignore` file configured
2. No pre-commit secret scanning hooks

---

## 6. Recommendations

### Immediate Actions
1. Ensure `.env` remains in `.gitignore` (currently properly configured)
2. Verify no commits contain the actual API key

### Short-term Improvements
1. Add `.claudeignore` to exclude sensitive directories from AI analysis
2. Document that `loadstring` feature is for development only

### Long-term Enhancements
1. Consider pre-commit hooks for secret scanning (e.g., `detect-secrets`, `git-secrets`)
2. Add input sanitization to PowerShell command construction

---

*Report generated by Claude Code security audit*
