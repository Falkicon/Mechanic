"""
Security pattern analysis for WoW addon development.

Detects common security and safety issues:
- Combat lockdown violations (protected API calls without guards)
- Secret value leaks (logging/storing secret values in 12.0+)
- Taint risks (unsafe global modifications)
- Unsafe eval patterns (loadstring with unsanitized input)
- Addon communication issues (unvalidated message parsing)
"""

from afd import CommandResult, success, error
from afd.core.metadata import create_source
from pathlib import Path
from pydantic import BaseModel, Field
from typing import Any, Dict, List, Optional, Set
from enum import Enum
import re
import time

from ..config import find_addon_path
from ..lua_analyzer import Confidence


# ═══════════════════════════════════════════════════════════════════════════════
# PROTECTED API DATABASE
# ═══════════════════════════════════════════════════════════════════════════════

# APIs that require InCombatLockdown() checks
PROTECTED_APIS = {
    # Secure frame manipulation
    "SetAttribute",
    "SetFrameRef",
    "SetFrameStrata",  # Only on secure frames
    "RegisterForClicks",
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
    "ClearCursor",

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

# Functions that could leak secret values
LEAK_FUNCTIONS = {
    "print",
    "DEFAULT_CHAT_FRAME:AddMessage",
    "ChatFrame1:AddMessage",
    "UIErrorsFrame:AddMessage",
    "RaidNotice_AddMessage",
    "SendChatMessage",
    "SendAddonMessage",
    "C_ChatInfo.SendAddonMessage",
    "BNSendGameData",
}


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
    confidence: str = Field(..., description="Confidence level: definite, likely, suspicious")
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


class SecurityResult(BaseModel):
    addon: str
    files_analyzed: int = 0
    issues: List[SecurityIssue] = []
    summary: SecuritySummary = Field(default_factory=SecuritySummary)
    analysis_time_ms: float = 0.0


# ═══════════════════════════════════════════════════════════════════════════════
# DETECTION FUNCTIONS
# ═══════════════════════════════════════════════════════════════════════════════

def find_combat_violations(
    addon_path: Path,
    lua_files: List[Path]
) -> List[SecurityIssue]:
    """Find protected API calls without InCombatLockdown() guards."""
    issues = []

    for lua_file in lua_files:
        try:
            content = lua_file.read_text(encoding='utf-8', errors='replace')
            lines = content.splitlines()
            rel_path = lua_file.relative_to(addon_path)

            # Track if file has InCombatLockdown checks
            has_lockdown_check = "InCombatLockdown" in content

            for line_num, line in enumerate(lines, 1):
                stripped = line.strip()

                # Skip comments
                if stripped.startswith('--'):
                    continue

                for api in PROTECTED_APIS:
                    # Check for API call
                    pattern = rf'\b{api}\s*\('
                    if re.search(pattern, line):
                        # Determine confidence based on context
                        if not has_lockdown_check:
                            confidence = Confidence.DEFINITE
                            message = f"Protected API '{api}' called without any InCombatLockdown() check in file"
                        else:
                            # Check if there's a guard nearby (within 10 lines)
                            start = max(0, line_num - 10)
                            context = '\n'.join(lines[start:line_num])
                            if 'InCombatLockdown' in context:
                                continue  # Skip, likely guarded
                            confidence = Confidence.LIKELY
                            message = f"Protected API '{api}' may not be properly guarded by InCombatLockdown()"

                        issues.append(SecurityIssue(
                            category=SecurityCategory.COMBAT_VIOLATION.value,
                            confidence=confidence.value,
                            file=str(rel_path),
                            line=line_num,
                            code=stripped[:80],
                            message=message,
                            suggestion=f"Add 'if InCombatLockdown() then return end' before calling {api}"
                        ))
                        break  # One issue per line

        except Exception:
            continue

    return issues


def find_secret_leaks(
    addon_path: Path,
    lua_files: List[Path]
) -> List[SecurityIssue]:
    """Find potential secret value leaks (logging secret API returns)."""
    issues = []

    # Pattern: print/log function with secret API inside
    leak_patterns = [
        r'print\s*\([^)]*\b({})\b',
        r'AddMessage\s*\([^)]*\b({})\b',
        r'format\s*\([^)]*\b({})\b[^)]*\)',
    ]

    for lua_file in lua_files:
        try:
            content = lua_file.read_text(encoding='utf-8', errors='replace')
            lines = content.splitlines()
            rel_path = lua_file.relative_to(addon_path)

            for line_num, line in enumerate(lines, 1):
                stripped = line.strip()

                # Skip comments
                if stripped.startswith('--'):
                    continue

                # Check for secret API results being stored then logged
                for secret_api, description in SECRET_VALUE_APIS.items():
                    # Direct leak: print(UnitHealth("target"))
                    for pattern_template in leak_patterns:
                        pattern = pattern_template.format(secret_api)
                        if re.search(pattern, line, re.IGNORECASE):
                            issues.append(SecurityIssue(
                                category=SecurityCategory.SECRET_LEAK.value,
                                confidence=Confidence.DEFINITE.value,
                                file=str(rel_path),
                                line=line_num,
                                code=stripped[:80],
                                message=f"Secret value from '{secret_api}' may be leaked. {description}",
                                suggestion="In 12.0+, secret values cannot be logged or transmitted. Use passthrough patterns instead."
                            ))
                            break

                    # Variable assignment followed by print
                    if f"= {secret_api}(" in line or f"= {secret_api} (" in line:
                        # Look ahead for potential leaks
                        var_match = re.search(rf'(\w+)\s*=\s*{secret_api}\s*\(', line)
                        if var_match:
                            var_name = var_match.group(1)
                            # Check next 5 lines for leaks
                            for i in range(line_num, min(line_num + 5, len(lines))):
                                future_line = lines[i]
                                if any(leak in future_line for leak in ['print', 'AddMessage', 'SendChat']):
                                    if var_name in future_line:
                                        issues.append(SecurityIssue(
                                            category=SecurityCategory.SECRET_LEAK.value,
                                            confidence=Confidence.LIKELY.value,
                                            file=str(rel_path),
                                            line=i + 1,
                                            code=future_line.strip()[:80],
                                            message=f"Variable '{var_name}' contains secret value from '{secret_api}' and may be leaked",
                                            suggestion="Don't log or transmit secret values. Use passthrough patterns for UI display."
                                        ))
                                        break

        except Exception:
            continue

    return issues


def find_taint_risks(
    addon_path: Path,
    lua_files: List[Path],
    addon_name: str
) -> List[SecurityIssue]:
    """Find unsafe global modifications that could cause taint."""
    issues = []

    for lua_file in lua_files:
        try:
            content = lua_file.read_text(encoding='utf-8', errors='replace')
            lines = content.splitlines()
            rel_path = lua_file.relative_to(addon_path)

            for line_num, line in enumerate(lines, 1):
                stripped = line.strip()

                # Skip comments
                if stripped.startswith('--'):
                    continue

                # Check for _G assignments without namespace
                # Bad: _G["SomeGlobal"] = value
                # Good: _G["MyAddon_SomeGlobal"] = value
                g_assign = re.search(r'_G\s*\[\s*["\'](\w+)["\']\s*\]\s*=', line)
                if g_assign:
                    global_name = g_assign.group(1)
                    # Check if it uses addon namespace
                    if not global_name.startswith(addon_name) and not global_name.startswith(addon_name.replace('!', '')):
                        issues.append(SecurityIssue(
                            category=SecurityCategory.TAINT_RISK.value,
                            confidence=Confidence.LIKELY.value,
                            file=str(rel_path),
                            line=line_num,
                            code=stripped[:80],
                            message=f"Global '{global_name}' set via _G without addon namespace prefix",
                            suggestion=f"Prefix with addon name: _G[\"{addon_name}_{global_name}\"] or use local"
                        ))

                # Check for rawset on _G
                if 'rawset' in line and '_G' in line:
                    issues.append(SecurityIssue(
                        category=SecurityCategory.TAINT_RISK.value,
                        confidence=Confidence.SUSPICIOUS.value,
                        file=str(rel_path),
                        line=line_num,
                        code=stripped[:80],
                        message="rawset used on _G - potential taint vector",
                        suggestion="Avoid rawset on _G unless absolutely necessary"
                    ))

        except Exception:
            continue

    return issues


def find_unsafe_eval(
    addon_path: Path,
    lua_files: List[Path]
) -> List[SecurityIssue]:
    """Find unsafe loadstring/RunScript usage."""
    issues = []

    unsafe_patterns = [
        (r'loadstring\s*\(', 'loadstring'),
        (r'RunScript\s*\(', 'RunScript'),
        (r'RunMacroText\s*\(', 'RunMacroText'),
        (r'pcall\s*\(\s*loadstring', 'pcall(loadstring)'),
    ]

    for lua_file in lua_files:
        try:
            content = lua_file.read_text(encoding='utf-8', errors='replace')
            lines = content.splitlines()
            rel_path = lua_file.relative_to(addon_path)

            for line_num, line in enumerate(lines, 1):
                stripped = line.strip()

                # Skip comments
                if stripped.startswith('--'):
                    continue

                for pattern, name in unsafe_patterns:
                    if re.search(pattern, line):
                        # Check if input is a literal string (safer) or variable (dangerous)
                        if re.search(rf'{name}\s*\(\s*["\']', line):
                            confidence = Confidence.SUSPICIOUS
                            message = f"'{name}' used with string literal - verify content is safe"
                        else:
                            confidence = Confidence.LIKELY
                            message = f"'{name}' used with variable input - potential code injection"

                        issues.append(SecurityIssue(
                            category=SecurityCategory.UNSAFE_EVAL.value,
                            confidence=confidence.value,
                            file=str(rel_path),
                            line=line_num,
                            code=stripped[:80],
                            message=message,
                            suggestion=f"Avoid {name} with user/external input. Pre-compile if possible."
                        ))
                        break

        except Exception:
            continue

    return issues


def find_addon_comm_issues(
    addon_path: Path,
    lua_files: List[Path]
) -> List[SecurityIssue]:
    """Find unvalidated addon message parsing."""
    issues = []

    for lua_file in lua_files:
        try:
            content = lua_file.read_text(encoding='utf-8', errors='replace')
            lines = content.splitlines()
            rel_path = lua_file.relative_to(addon_path)

            in_comm_handler = False
            handler_start = 0

            for line_num, line in enumerate(lines, 1):
                stripped = line.strip()

                # Skip comments
                if stripped.startswith('--'):
                    continue

                # Detect addon message handlers
                if 'CHAT_MSG_ADDON' in line or 'RegisterComm' in line or 'OnCommReceived' in line:
                    in_comm_handler = True
                    handler_start = line_num

                if in_comm_handler:
                    # Check for direct execution of message content
                    if 'loadstring' in line or 'RunScript' in line:
                        issues.append(SecurityIssue(
                            category=SecurityCategory.ADDON_COMM.value,
                            confidence=Confidence.DEFINITE.value,
                            file=str(rel_path),
                            line=line_num,
                            code=stripped[:80],
                            message="Addon message content executed directly - critical security risk",
                            suggestion="Never execute received addon messages. Parse and validate data only."
                        ))

                    # Check for unvalidated deserialization
                    if 'deserialize' in line.lower() and 'validate' not in content[handler_start*50:(line_num+5)*50].lower():
                        issues.append(SecurityIssue(
                            category=SecurityCategory.ADDON_COMM.value,
                            confidence=Confidence.SUSPICIOUS.value,
                            file=str(rel_path),
                            line=line_num,
                            code=stripped[:80],
                            message="Addon message deserialized without apparent validation",
                            suggestion="Validate message structure and values before processing"
                        ))

                    # Reset after function ends
                    if stripped == 'end':
                        in_comm_handler = False

        except Exception:
            continue

    return issues


# ═══════════════════════════════════════════════════════════════════════════════
# MAIN ANALYSIS
# ═══════════════════════════════════════════════════════════════════════════════

def analyze_addon(addon_path: Path, addon_name: str, input: SecurityInput) -> SecurityResult:
    """Run comprehensive security analysis on an addon."""
    start_time = time.time()

    # Get all Lua files (excluding Libs)
    lua_files = []
    for lua_file in addon_path.rglob("*.lua"):
        rel_path = lua_file.relative_to(addon_path)
        parts = rel_path.parts
        if 'Libs' not in parts and 'libs' not in parts:
            lua_files.append(lua_file)

    # Collect issues from all detectors
    all_issues: List[SecurityIssue] = []
    categories = input.categories or [c.value for c in SecurityCategory]

    if SecurityCategory.COMBAT_VIOLATION.value in categories:
        all_issues.extend(find_combat_violations(addon_path, lua_files))

    if SecurityCategory.SECRET_LEAK.value in categories:
        all_issues.extend(find_secret_leaks(addon_path, lua_files))

    if SecurityCategory.TAINT_RISK.value in categories:
        all_issues.extend(find_taint_risks(addon_path, lua_files, addon_name))

    if SecurityCategory.UNSAFE_EVAL.value in categories:
        all_issues.extend(find_unsafe_eval(addon_path, lua_files))

    if SecurityCategory.ADDON_COMM.value in categories:
        all_issues.extend(find_addon_comm_issues(addon_path, lua_files))

    # Filter by confidence if requested
    if not input.include_suspicious:
        all_issues = [i for i in all_issues if i.confidence != Confidence.SUSPICIOUS.value]

    # Build summary
    summary = SecuritySummary(total=len(all_issues))
    for issue in all_issues:
        summary.by_category[issue.category] = summary.by_category.get(issue.category, 0) + 1
        summary.by_confidence[issue.confidence] = summary.by_confidence.get(issue.confidence, 0) + 1

    analysis_time = (time.time() - start_time) * 1000

    return SecurityResult(
        addon=addon_name,
        files_analyzed=len(lua_files),
        issues=all_issues[:100],  # Limit to 100 issues
        summary=summary,
        analysis_time_ms=round(analysis_time, 2)
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
    async def analyze_security(input: SecurityInput, context: Any = None) -> CommandResult[SecurityResult]:
        addon_path = find_addon_path(input.addon, input.path)

        if not addon_path:
            return error(
                code="ADDON_NOT_FOUND",
                message=f"Addon '{input.addon}' not found in development directories",
                suggestion="Check the addon name or provide an explicit path"
            )

        result = analyze_addon(addon_path, input.addon, input)

        src = create_source(
            type="analysis",
            id=f"security-{input.addon}",
            title=f"Security Analysis: {input.addon}",
            location=str(addon_path)
        )

        # Build reasoning summary
        if result.summary.total == 0:
            reasoning = f"No security issues found in {input.addon} ({result.files_analyzed} files analyzed)"
        else:
            parts = []
            for cat, count in sorted(result.summary.by_category.items(), key=lambda x: -x[1]):
                parts.append(f"{count} {cat.replace('_', ' ')}")
            reasoning = f"Found {result.summary.total} security issues in {input.addon}: {', '.join(parts[:3])}"
            if len(parts) > 3:
                reasoning += f" (+{len(parts) - 3} more categories)"

        return success(
            data=result,
            reasoning=reasoning,
            sources=[src],
            confidence=0.9
        )
