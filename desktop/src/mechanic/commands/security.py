"""
Security pattern analysis for WoW addon development.

Detects common security and safety issues on the Lua token stream, so strings,
block comments and trailing comments never produce findings:
- Combat lockdown violations (protected global functions without guards)
- Secret value leaks (logging/transmitting secret values in 12.0+)
- Taint risks (unsafe global modifications)
- Unsafe eval patterns (loadstring/RunScript with unsanitized input)
- Addon communication issues (handlers that execute or blindly deserialize messages)
"""

import asyncio
import time
from enum import Enum
from pathlib import Path
from typing import Any, Dict, Iterator, List, Optional, Set, Tuple

from afd import CommandResult, error, success
from afd.core.metadata import create_source
from pydantic import BaseModel, Field

from ..analysis_common import (
    DEFAULT_ISSUE_LIMIT,
    MAX_ISSUE_LIMIT,
    SourceCache,
    count_by,
    describe_findings,
    finalize_issues,
    iter_lua_files,
    relative_display,
    unknown_categories,
)
from ..config import find_addon_path
from ..lua_analyzer import Confidence
from ..lua_structure import LuaFile
from ..lua_tokenizer import KEYWORD, NAME, STRING, Token

# ═══════════════════════════════════════════════════════════════════════════════
# PROTECTED API DATABASE
# ═══════════════════════════════════════════════════════════════════════════════

# Protected *global functions* that require InCombatLockdown() checks. Frame
# methods (SetAttribute, SetFrameStrata, ClearFocus on an EditBox, ...) are not
# listed: they are only restricted on secure frames and are matched by name
# alone, which produced mostly false positives.
PROTECTED_APIS = {
    # Secure frame manipulation
    "RegisterStateDriver",
    "RegisterUnitWatch",
    "UnregisterUnitWatch",
    # Action bar manipulation
    "PickupAction",
    "PlaceAction",
    "PickupSpell",
    "PickupSpellBookItem",
    "PickupMacro",
    "PickupPetAction",
    "PickupCompanion",
    "PickupEquipmentSet",
    # Unit targeting
    "TargetUnit",
    "AssistUnit",
    "FocusUnit",
    "ClearFocus",
    "FollowUnit",
    # Pet control
    "PetAttack",
    "PetFollow",
    "PetWait",
    "PetDefensiveMode",
    "PetPassiveMode",
    "PetAssistMode",
    # Vehicle control
    "VehicleExit",
    # Group actions
    "AcceptGroup",
    "DeclineGroup",
    "LeaveParty",
    "ConvertToRaid",
    "ConvertToParty",
    "SetRaidSubgroup",
    "SwapRaidSubgroup",
    # Casting
    "CastSpellByID",
    "CastSpellByName",
    "UseAction",
    "UseItem",
    "UseItemByName",
    "RunMacro",
    "RunMacroText",
    # Movement
    "MoveForwardStart",
    "MoveForwardStop",
    "MoveBackwardStart",
    "MoveBackwardStop",
    "StrafeLeftStart",
    "StrafeLeftStop",
    "StrafeRightStart",
    "StrafeRightStop",
    "JumpOrAscendStart",
    "AscendStop",
    "DescendStop",
    "TurnLeftStart",
    "TurnLeftStop",
    "TurnRightStart",
    "TurnRightStop",
    "ToggleAutoRun",
    # Camera
    "CameraOrSelectOrMoveStart",
    "CameraOrSelectOrMoveStop",
    "TurnOrActionStart",
    "TurnOrActionStop",
}

# APIs that return secret values in 12.0+
SECRET_VALUE_APIS = {
    "UnitHealth": "Returns secret value for enemy units",
    "UnitHealthMax": "Returns secret value for enemy units",
    "UnitPower": "Returns secret value for enemy units",
    "UnitPowerMax": "Returns secret value for enemy units",
    "UnitGetIncomingHeals": "Returns secret value",
    "UnitGetTotalAbsorbs": "Returns secret value",
    "UnitGetTotalHealAbsorbs": "Returns secret value",
    "GetSpellCooldown": "May return secret values",
    "GetItemCooldown": "May return secret values",
}

# Calls that log or transmit their arguments (bare function or method name)
LEAK_CALL_NAMES = {
    "print",
    "AddMessage",
    "SendChatMessage",
    "SendAddonMessage",
    "BNSendGameData",
    "format",
}

# Functions that test a value before it is used; their presence suppresses leaks
SECRET_GUARDS = {"issecretvalue", "canaccessvalue", "issecrettable", "canaccesstable"}

# Globals Blizzard requires addons to define with fixed names
EXEMPT_GLOBAL_PREFIXES = ("SLASH_", "BINDING_")

VALIDATION_HINTS = ("validate", "verify", "sanitize")

CATEGORY_PRIORITY = [
    "addon_comm",
    "unsafe_eval",
    "secret_leak",
    "taint_risk",
    "combat_violation",
]


# ═══════════════════════════════════════════════════════════════════════════════
# SCHEMAS
# ═══════════════════════════════════════════════════════════════════════════════


class SecurityCategory(str, Enum):
    COMBAT_VIOLATION = "combat_violation"
    SECRET_LEAK = "secret_leak"
    TAINT_RISK = "taint_risk"
    UNSAFE_EVAL = "unsafe_eval"
    ADDON_COMM = "addon_comm"


class SecurityIssue(BaseModel):
    category: str = Field(..., description="Category of security issue")
    confidence: str = Field(
        ..., description="Confidence level: definite, likely, suspicious"
    )
    file: str = Field(..., description="File path relative to addon")
    line: int = Field(..., description="Line number")
    code: str = Field(..., description="Problematic code snippet")
    message: str = Field(..., description="Human-readable description")
    suggestion: str = Field(..., description="Suggested fix")


class SecuritySummary(BaseModel):
    total: int = 0
    by_category: Dict[str, int] = Field(default_factory=dict)
    by_confidence: Dict[str, int] = Field(default_factory=dict)


class SecurityInput(BaseModel):
    addon: str = Field(..., description="Name of the addon to analyze")
    path: Optional[str] = Field(None, description="Override path to addon folder")
    categories: Optional[List[str]] = Field(
        None, description="Specific categories to check (default: all)"
    )
    include_suspicious: bool = Field(
        True, description="Include lower-confidence findings"
    )
    limit: int = Field(
        DEFAULT_ISSUE_LIMIT,
        ge=1,
        le=MAX_ISSUE_LIMIT,
        description="Maximum issues returned, most severe first (counts cover all issues)",
    )


class SecurityResult(BaseModel):
    addon: str
    files_analyzed: int = 0
    issues: List[SecurityIssue] = []
    summary: SecuritySummary = Field(default_factory=SecuritySummary)
    analysis_time_ms: float = 0.0
    truncated: bool = False
    total_issues: int = 0
    read_errors: List[str] = []


# ═══════════════════════════════════════════════════════════════════════════════
# TOKEN HELPERS
# ═══════════════════════════════════════════════════════════════════════════════


def _is_op(tok: Optional[Token], value: str) -> bool:
    return tok is not None and tok.kind == "op" and tok.value == value


def _tok(parsed: LuaFile, idx: int) -> Optional[Token]:
    return parsed.tokens[idx] if 0 <= idx < len(parsed.tokens) else None


def _is_global_reference(parsed: LuaFile, idx: int) -> bool:
    """A bare identifier (or ``_G.name``), not ``obj.name``/``obj:name``/a definition."""
    prev = _tok(parsed, idx - 1)
    if prev is None:
        return True
    if prev.kind == KEYWORD and prev.value == "function":
        return False
    if _is_op(prev, ":"):
        return False
    if _is_op(prev, "."):
        before = _tok(parsed, idx - 2)
        return before is not None and before.kind == NAME and before.value == "_G"
    return True


def _is_call(parsed: LuaFile, idx: int) -> bool:
    nxt = _tok(parsed, idx + 1)
    return _is_op(nxt, "(") or (nxt is not None and nxt.kind == STRING)


def _global_calls(parsed: LuaFile, names) -> Iterator[Tuple[int, Token]]:
    for idx, tok in enumerate(parsed.tokens):
        if (
            tok.kind == NAME
            and tok.value in names
            and _is_call(parsed, idx)
            and _is_global_reference(parsed, idx)
        ):
            yield idx, tok


def _matching_close(parsed: LuaFile, open_idx: int) -> int:
    depth = 0
    for idx in range(open_idx, len(parsed.tokens)):
        tok = parsed.tokens[idx]
        if tok.kind == "op":
            if tok.value in "([{" and len(tok.value) == 1:
                depth += 1
            elif tok.value in ")]}" and len(tok.value) == 1:
                depth -= 1
                if depth == 0:
                    return idx
    return len(parsed.tokens) - 1


def _snippet(lines: List[str], line: int) -> str:
    return lines[line - 1].strip()[:80] if 0 < line <= len(lines) else ""


def _has_name(parsed: LuaFile, names, lo: int, hi: int) -> bool:
    return any(t.kind == NAME and t.value in names for t in parsed.tokens[lo : hi + 1])


# ═══════════════════════════════════════════════════════════════════════════════
# DETECTION FUNCTIONS
# ═══════════════════════════════════════════════════════════════════════════════


def find_combat_violations(
    addon_path: Path, lua_files: List[Path], cache: Optional[SourceCache] = None
) -> List[SecurityIssue]:
    """Find protected global function calls without InCombatLockdown() guards."""
    issues = []
    cache = cache or SourceCache(addon_path)

    for lua_file in lua_files:
        parsed = cache.parse(lua_file)
        if parsed is None:
            continue
        lines = (cache.read(lua_file) or "").splitlines()
        rel_path = relative_display(lua_file, addon_path)
        file_has_check = any(
            t.kind == NAME and t.value == "InCombatLockdown" for t in parsed.tokens
        )
        seen: Set[Tuple[int, str]] = set()

        for idx, tok in _global_calls(parsed, PROTECTED_APIS):
            func = parsed.enclosing_function(idx)
            scope_start = func.body_start if func is not None else 0
            if _has_name(parsed, {"InCombatLockdown"}, scope_start, idx):
                continue  # guarded earlier in the same function
            if (tok.line, tok.value) in seen:
                continue
            seen.add((tok.line, tok.value))

            if not file_has_check:
                confidence = Confidence.LIKELY
                message = f"Protected API '{tok.value}' called without any InCombatLockdown() check in file"
            else:
                confidence = Confidence.SUSPICIOUS
                message = f"Protected API '{tok.value}' may not be properly guarded by InCombatLockdown()"

            issues.append(
                SecurityIssue(
                    category=SecurityCategory.COMBAT_VIOLATION.value,
                    confidence=confidence.value,
                    file=rel_path,
                    line=tok.line,
                    code=_snippet(lines, tok.line),
                    message=message,
                    suggestion=f"Add 'if InCombatLockdown() then return end' before calling {tok.value}",
                )
            )

    return issues


def _secret_calls(parsed: LuaFile, lo: int, hi: int) -> List[int]:
    """Indices of secret-value API calls in ``[lo, hi]`` (global or ``C_*`` qualified)."""
    found = []
    for idx in range(lo, hi + 1):
        tok = parsed.tokens[idx]
        if tok.kind != NAME or tok.value not in SECRET_VALUE_APIS:
            continue
        if not _is_call(parsed, idx):
            continue
        prev = _tok(parsed, idx - 1)
        if _is_op(prev, ":"):
            continue
        if _is_op(prev, "."):
            qualifier = _tok(parsed, idx - 2)
            if qualifier is None or not qualifier.value.startswith("C_"):
                continue
        found.append(idx)
    return found


def _assignment_targets(parsed: LuaFile, call_idx: int) -> List[str]:
    """Names assigned directly from the call at ``call_idx`` (``a, b = Call()``)."""
    k = call_idx - 1
    if _is_op(_tok(parsed, k), ".") and _tok(parsed, k - 1) is not None:
        k -= 2  # skip a ``C_Namespace.`` qualifier
    if not _is_op(_tok(parsed, k), "="):
        return []
    names = []
    k -= 1
    while k >= 0:
        tok = parsed.tokens[k]
        if tok.kind == NAME:
            names.append(tok.value)
        elif _is_op(tok, ",") or (tok.kind == KEYWORD and tok.value == "local"):
            pass
        else:
            break
        k -= 1
    return names


def find_secret_leaks(
    addon_path: Path, lua_files: List[Path], cache: Optional[SourceCache] = None
) -> List[SecurityIssue]:
    """Find secret API results that are logged or transmitted."""
    issues = []
    cache = cache or SourceCache(addon_path)

    for lua_file in lua_files:
        parsed = cache.parse(lua_file)
        if parsed is None:
            continue
        lines = (cache.read(lua_file) or "").splitlines()
        rel_path = relative_display(lua_file, addon_path)
        tokens = parsed.tokens

        leak_calls = []  # (call token index, closing paren index)
        for idx, tok in enumerate(tokens):
            if (
                tok.kind == NAME
                and tok.value in LEAK_CALL_NAMES
                and _is_op(_tok(parsed, idx + 1), "(")
                and not (
                    _tok(parsed, idx - 1) is not None
                    and tokens[idx - 1].is_kw("function")
                )
            ):
                leak_calls.append((idx, _matching_close(parsed, idx + 1)))

        reported: Set[Tuple[int, str]] = set()

        # Direct leak: print(UnitHealth("target"))
        for call_idx, close in leak_calls:
            if _has_name(parsed, SECRET_GUARDS, call_idx, close):
                continue
            for secret_idx in _secret_calls(parsed, call_idx + 2, close):
                api = tokens[secret_idx].value
                key = (tokens[call_idx].line, api)
                if key in reported:
                    continue
                reported.add(key)
                issues.append(
                    SecurityIssue(
                        category=SecurityCategory.SECRET_LEAK.value,
                        confidence=Confidence.DEFINITE.value,
                        file=rel_path,
                        line=tokens[call_idx].line,
                        code=_snippet(lines, tokens[call_idx].line),
                        message=f"Secret value from '{api}' may be leaked. {SECRET_VALUE_APIS[api]}",
                        suggestion="In 12.0+, secret values cannot be logged or transmitted. Use passthrough patterns instead.",
                    )
                )

        # Stored then logged: local hp = UnitHealth(unit); print(hp)
        for secret_idx in _secret_calls(parsed, 0, len(tokens) - 1):
            api = tokens[secret_idx].value
            for var in _assignment_targets(parsed, secret_idx):
                scope_end = len(tokens) - 1
                best = None
                for decl in parsed.locals:
                    if decl.name == var and decl.tok < secret_idx <= decl.scope_end:
                        if best is None or decl.tok > best.tok:
                            best = decl
                if best is not None:
                    scope_end = best.scope_end
                else:
                    func = parsed.enclosing_function(secret_idx)
                    if func is not None:
                        scope_end = func.end_tok
                if _has_name(parsed, SECRET_GUARDS, secret_idx, scope_end):
                    continue
                for call_idx, close in leak_calls:
                    if not (secret_idx < call_idx <= scope_end):
                        continue
                    uses_var = any(
                        t.kind == NAME and t.value == var
                        for t in tokens[call_idx + 2 : close]
                    )
                    key = (tokens[call_idx].line, var)
                    if not uses_var or key in reported:
                        continue
                    reported.add(key)
                    issues.append(
                        SecurityIssue(
                            category=SecurityCategory.SECRET_LEAK.value,
                            confidence=Confidence.LIKELY.value,
                            file=rel_path,
                            line=tokens[call_idx].line,
                            code=_snippet(lines, tokens[call_idx].line),
                            message=f"Variable '{var}' contains secret value from '{api}' and may be leaked",
                            suggestion="Don't log or transmit secret values. Use passthrough patterns for UI display.",
                        )
                    )

    return issues


def _global_write_targets(parsed: LuaFile) -> Iterator[Tuple[int, Optional[str], int]]:
    """``(token index, global name or None if dynamic, line)`` for ``_G`` assignments."""
    tokens = parsed.tokens
    for idx, tok in enumerate(tokens):
        if tok.kind != NAME or tok.value != "_G" or _is_op(_tok(parsed, idx - 1), "."):
            continue
        nxt = _tok(parsed, idx + 1)
        if _is_op(nxt, "["):
            close = _matching_close(parsed, idx + 1)
            if not _is_op(_tok(parsed, close + 1), "="):
                continue
            inner = tokens[idx + 2 : close]
            if len(inner) == 1 and inner[0].kind == STRING:
                yield idx, inner[0].value, tok.line
            else:
                literals = " ".join(t.value for t in inner if t.kind == STRING)
                yield idx, None if not literals else "\0" + literals, tok.line
        elif _is_op(nxt, ".") and _tok(parsed, idx + 2) is not None:
            name = tokens[idx + 2]
            if name.kind == NAME and _is_op(_tok(parsed, idx + 3), "="):
                yield idx, name.value, tok.line


def find_taint_risks(
    addon_path: Path,
    lua_files: List[Path],
    addon_name: str,
    cache: Optional[SourceCache] = None,
) -> List[SecurityIssue]:
    """Find unsafe global modifications that could cause taint."""
    issues = []
    cache = cache or SourceCache(addon_path)
    prefix = addon_name.replace("!", "").lower()

    for lua_file in lua_files:
        parsed = cache.parse(lua_file)
        if parsed is None:
            continue
        lines = (cache.read(lua_file) or "").splitlines()
        rel_path = relative_display(lua_file, addon_path)

        for _idx, name, line in _global_write_targets(parsed):
            if name is not None and name.startswith("\0"):
                # dynamic name built from string pieces: only flag if none is prefixed
                if any(part.lower().startswith(prefix) for part in name[1:].split()):
                    continue
                name = None
            if name is None:
                issues.append(
                    SecurityIssue(
                        category=SecurityCategory.TAINT_RISK.value,
                        confidence=Confidence.SUSPICIOUS.value,
                        file=rel_path,
                        line=line,
                        code=_snippet(lines, line),
                        message="Global assigned through _G with a dynamic name",
                        suggestion=f"Make sure the name starts with your addon prefix ('{addon_name}')",
                    )
                )
                continue
            if name.lower().startswith(prefix) or name.startswith(
                EXEMPT_GLOBAL_PREFIXES
            ):
                continue
            issues.append(
                SecurityIssue(
                    category=SecurityCategory.TAINT_RISK.value,
                    confidence=Confidence.LIKELY.value,
                    file=rel_path,
                    line=line,
                    code=_snippet(lines, line),
                    message=f"Global '{name}' set via _G without addon namespace prefix",
                    suggestion=f'Prefix with addon name: _G["{addon_name}_{name}"] or use local',
                )
            )

        for idx, tok in enumerate(parsed.tokens):
            if (
                tok.kind == NAME
                and tok.value == "rawset"
                and _is_op(_tok(parsed, idx + 1), "(")
                and _tok(parsed, idx + 2) is not None
                and parsed.tokens[idx + 2].value == "_G"
            ):
                issues.append(
                    SecurityIssue(
                        category=SecurityCategory.TAINT_RISK.value,
                        confidence=Confidence.SUSPICIOUS.value,
                        file=rel_path,
                        line=tok.line,
                        code=_snippet(lines, tok.line),
                        message="rawset used on _G - potential taint vector",
                        suggestion="Avoid rawset on _G unless absolutely necessary",
                    )
                )

    return issues


EVAL_FUNCTIONS = ("loadstring", "RunScript", "RunMacroText")


def find_unsafe_eval(
    addon_path: Path, lua_files: List[Path], cache: Optional[SourceCache] = None
) -> List[SecurityIssue]:
    """Find unsafe loadstring/RunScript usage."""
    issues = []
    cache = cache or SourceCache(addon_path)

    for lua_file in lua_files:
        parsed = cache.parse(lua_file)
        if parsed is None:
            continue
        lines = (cache.read(lua_file) or "").splitlines()
        rel_path = relative_display(lua_file, addon_path)
        tokens = parsed.tokens

        for idx, tok in _global_calls(parsed, EVAL_FUNCTIONS):
            name = tok.value
            literal = False
            if _is_op(_tok(parsed, idx + 1), "("):
                close = _matching_close(parsed, idx + 1)
                first_arg = []
                depth = 0
                for t in tokens[idx + 2 : close]:
                    if t.kind == "op" and t.value in ("(", "[", "{"):
                        depth += 1
                    elif t.kind == "op" and t.value in (")", "]", "}"):
                        depth -= 1
                    elif t.kind == "op" and t.value == "," and depth == 0:
                        break
                    first_arg.append(t)
                literal = len(first_arg) == 1 and first_arg[0].kind == STRING
            else:
                literal = True  # call with a bare string argument

            if literal:
                confidence = Confidence.SUSPICIOUS
                message = f"'{name}' used with string literal - verify content is safe"
            else:
                confidence = Confidence.LIKELY
                message = (
                    f"'{name}' used with variable input - potential code injection"
                )
            issues.append(
                SecurityIssue(
                    category=SecurityCategory.UNSAFE_EVAL.value,
                    confidence=confidence.value,
                    file=rel_path,
                    line=tok.line,
                    code=_snippet(lines, tok.line),
                    message=message,
                    suggestion=f"Avoid {name} with user/external input. Pre-compile if possible.",
                )
            )

        # pcall(loadstring, code): loadstring passed by reference
        for idx, tok in enumerate(tokens):
            if (
                tok.kind == NAME
                and tok.value == "pcall"
                and _is_op(_tok(parsed, idx + 1), "(")
                and _tok(parsed, idx + 2) is not None
                and tokens[idx + 2].kind == NAME
                and tokens[idx + 2].value == "loadstring"
                and not _is_op(_tok(parsed, idx + 3), "(")
            ):
                issues.append(
                    SecurityIssue(
                        category=SecurityCategory.UNSAFE_EVAL.value,
                        confidence=Confidence.LIKELY.value,
                        file=rel_path,
                        line=tok.line,
                        code=_snippet(lines, tok.line),
                        message="'pcall(loadstring)' used with variable input - potential code injection",
                        suggestion="Avoid pcall(loadstring) with user/external input. Pre-compile if possible.",
                    )
                )

    return issues


def _comm_handler_names(parsed: LuaFile) -> Set[str]:
    """Names dispatched by ``RegisterComm("PREFIX", "Handler")`` plus OnCommReceived."""
    names = {"OnCommReceived"}
    tokens = parsed.tokens
    for idx, tok in enumerate(tokens):
        if (
            tok.kind == NAME
            and tok.value == "RegisterComm"
            and _is_op(_tok(parsed, idx + 1), "(")
        ):
            close = _matching_close(parsed, idx + 1)
            for t in tokens[idx + 2 : close]:
                if t.kind in (NAME, STRING):
                    names.add(t.value.rsplit(".", 1)[-1].rsplit(":", 1)[-1])
    return names


def find_addon_comm_issues(
    addon_path: Path, lua_files: List[Path], cache: Optional[SourceCache] = None
) -> List[SecurityIssue]:
    """Find addon message handlers that execute or blindly deserialize messages."""
    issues = []
    cache = cache or SourceCache(addon_path)

    for lua_file in lua_files:
        parsed = cache.parse(lua_file)
        if parsed is None:
            continue
        lines = (cache.read(lua_file) or "").splitlines()
        rel_path = relative_display(lua_file, addon_path)
        tokens = parsed.tokens
        handler_names = _comm_handler_names(parsed)

        handlers = []
        for func in parsed.functions:
            base = func.name.rsplit(".", 1)[-1].rsplit(":", 1)[-1]
            body = tokens[func.body_start : func.end_tok + 1]
            if base in handler_names or any(
                t.kind == STRING and t.value == "CHAT_MSG_ADDON" for t in body
            ):
                handlers.append(func)

        reported: Set[Tuple[int, str]] = set()
        for func in handlers:
            lo, hi = func.body_start, func.end_tok
            validated = any(
                t.kind in (NAME, STRING)
                and any(h in t.value.lower() for h in VALIDATION_HINTS)
                for t in tokens[lo : hi + 1]
            )
            for idx in range(lo, hi + 1):
                tok = tokens[idx]
                if tok.kind != NAME:
                    continue
                if tok.value in ("loadstring", "RunScript") and _is_call(parsed, idx):
                    kind = "exec"
                elif "deserialize" in tok.value.lower() and _is_op(
                    _tok(parsed, idx + 1), "("
                ):
                    if validated:
                        continue
                    kind = "deserialize"
                else:
                    continue
                if (tok.line, kind) in reported:
                    continue
                reported.add((tok.line, kind))
                if kind == "exec":
                    issues.append(
                        SecurityIssue(
                            category=SecurityCategory.ADDON_COMM.value,
                            confidence=Confidence.DEFINITE.value,
                            file=rel_path,
                            line=tok.line,
                            code=_snippet(lines, tok.line),
                            message="Addon message content executed directly - critical security risk",
                            suggestion="Never execute received addon messages. Parse and validate data only.",
                        )
                    )
                else:
                    issues.append(
                        SecurityIssue(
                            category=SecurityCategory.ADDON_COMM.value,
                            confidence=Confidence.SUSPICIOUS.value,
                            file=rel_path,
                            line=tok.line,
                            code=_snippet(lines, tok.line),
                            message="Addon message deserialized without apparent validation",
                            suggestion="Validate message structure and values before processing",
                        )
                    )

    return issues


# ═══════════════════════════════════════════════════════════════════════════════
# MAIN ANALYSIS
# ═══════════════════════════════════════════════════════════════════════════════


def analyze_addon(
    addon_path: Path, addon_name: str, input: SecurityInput
) -> SecurityResult:
    """Run comprehensive security analysis on an addon."""
    start_time = time.time()
    addon_path = Path(addon_path).resolve()

    cache = SourceCache(addon_path)
    lua_files = cache.readable(iter_lua_files(addon_path))

    all_issues: List[SecurityIssue] = []
    categories = input.categories or [c.value for c in SecurityCategory]

    if SecurityCategory.COMBAT_VIOLATION.value in categories:
        all_issues.extend(find_combat_violations(addon_path, lua_files, cache))

    if SecurityCategory.SECRET_LEAK.value in categories:
        all_issues.extend(find_secret_leaks(addon_path, lua_files, cache))

    if SecurityCategory.TAINT_RISK.value in categories:
        all_issues.extend(find_taint_risks(addon_path, lua_files, addon_name, cache))

    if SecurityCategory.UNSAFE_EVAL.value in categories:
        all_issues.extend(find_unsafe_eval(addon_path, lua_files, cache))

    if SecurityCategory.ADDON_COMM.value in categories:
        all_issues.extend(find_addon_comm_issues(addon_path, lua_files, cache))

    if not input.include_suspicious:
        all_issues = [
            i for i in all_issues if i.confidence != Confidence.SUSPICIOUS.value
        ]

    by_category, by_confidence = count_by(all_issues)
    summary = SecuritySummary(
        total=len(all_issues), by_category=by_category, by_confidence=by_confidence
    )
    kept, truncated, total = finalize_issues(all_issues, input.limit, CATEGORY_PRIORITY)

    return SecurityResult(
        addon=addon_name,
        files_analyzed=len(lua_files),
        issues=kept,
        summary=summary,
        analysis_time_ms=round((time.time() - start_time) * 1000, 2),
        truncated=truncated,
        total_issues=total,
        read_errors=cache.errors,
    )


# ═══════════════════════════════════════════════════════════════════════════════
# COMMAND REGISTRATION
# ═══════════════════════════════════════════════════════════════════════════════


def register_commands(server):
    """Register security analysis commands with the AFD server."""

    @server.command(
        name="addon.security",
        description="Detect security issues in a WoW addon (combat lockdown, secret values, taint)",
        input_schema=SecurityInput,
        output_schema=SecurityResult,
    )
    async def analyze_security(
        input: SecurityInput, context: Any = None
    ) -> CommandResult[SecurityResult]:
        bad = unknown_categories(input.categories, SecurityCategory)
        if bad:
            return error(
                code="INVALID_CATEGORY",
                message=f"Unknown security categories: {', '.join(bad)}",
                suggestion="Valid categories: "
                + ", ".join(c.value for c in SecurityCategory),
            )

        addon_path = find_addon_path(input.addon, input.path)

        if not addon_path:
            return error(
                code="ADDON_NOT_FOUND",
                message=f"Addon '{input.addon}' not found in development directories",
                suggestion="Check the addon name or provide an explicit path",
            )

        result = await asyncio.to_thread(analyze_addon, addon_path, input.addon, input)

        src = create_source(
            type="analysis",
            id=f"security-{input.addon}",
            title=f"Security Analysis: {input.addon}",
            location=str(addon_path),
        )

        extra = ""
        if result.truncated:
            extra = f". Showing the {len(result.issues)} most severe of {result.total_issues}"
        reasoning = describe_findings(
            "security issues",
            input.addon,
            result.summary.total,
            result.summary.by_category,
            result.files_analyzed,
            extra=extra,
        )

        return success(data=result, reasoning=reasoning, sources=[src], confidence=0.9)
