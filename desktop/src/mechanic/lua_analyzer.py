"""
Lua static analysis utilities for WoW addon development.

This module provides lightweight Lua parsing without external dependencies.
It uses regex-based tokenization optimized for WoW addon patterns.
"""

from dataclasses import dataclass, field
from typing import Dict, Set, List, Optional, Tuple
from pathlib import Path
from enum import Enum
import re


class Confidence(str, Enum):
    """Confidence level for dead code detection."""
    DEFINITE = "definite"     # 100% certain this is dead
    LIKELY = "likely"         # 90%+ certain, may have edge cases
    SUSPICIOUS = "suspicious" # 70%+ certain, needs human review


@dataclass
class FunctionDef:
    """Represents a function definition in Lua code."""
    name: str
    file: str
    line: int
    is_local: bool
    is_method: bool = False
    namespace: Optional[str] = None  # e.g., "MyAddon" for MyAddon:Func()
    end_line: Optional[int] = None


@dataclass
class VariableDef:
    """Represents a variable definition in Lua code."""
    name: str
    file: str
    line: int
    is_local: bool
    scope_end: Optional[int] = None


@dataclass
class ExportDef:
    """Represents an export to addon namespace."""
    name: str  # Full path like "Addon.Module.Func"
    member: str  # Just the member name
    file: str
    line: int


@dataclass
class EventRegistration:
    """Represents an event registration."""
    event: str
    file: str
    line: int
    handler: Optional[str] = None


@dataclass
class SymbolTable:
    """Central storage for all symbols found during analysis."""
    # Definitions
    functions: Dict[str, FunctionDef] = field(default_factory=dict)
    variables: Dict[str, VariableDef] = field(default_factory=dict)
    exports: Dict[str, ExportDef] = field(default_factory=dict)

    # Usages
    function_calls: Set[str] = field(default_factory=set)
    variable_reads: Set[str] = field(default_factory=set)
    member_accesses: Set[str] = field(default_factory=set)
    method_calls: Set[str] = field(default_factory=set)

    # WoW-specific
    registered_events: List[EventRegistration] = field(default_factory=list)
    locale_definitions: Set[str] = field(default_factory=set)
    locale_usages: Set[str] = field(default_factory=set)
    library_usages: Set[str] = field(default_factory=set)

    # File tracking
    loaded_files: Set[str] = field(default_factory=set)
    all_lua_files: Set[str] = field(default_factory=set)


# WoW patterns that should NOT be flagged as dead code
WOW_SAFE_PATTERNS = {
    # AceAddon lifecycle - called by framework
    "OnInitialize", "OnEnable", "OnDisable",
    "OnModuleCreated", "OnEmbedEnable", "OnEmbedDisable",

    # AceDB callbacks - registered via db.RegisterCallback()
    "OnProfileChanged", "OnProfileCopied", "OnProfileReset",
    "OnProfileDeleted", "OnNewProfile", "OnDatabaseReset",
    "OnDatabaseShutdown",

    # Frame script handlers - called by WoW engine
    "OnEvent", "OnUpdate", "OnShow", "OnHide",
    "OnEnter", "OnLeave", "OnClick", "OnDragStart",
    "OnDragStop", "OnReceiveDrag", "OnMouseDown",
    "OnMouseUp", "OnMouseWheel", "OnSizeChanged",
    "OnAttributeChanged", "OnLoad", "OnChar",
    "OnKeyDown", "OnKeyUp", "OnEditFocusGained",
    "OnEditFocusLost", "OnTextChanged", "OnValueChanged",
    "OnMinMaxChanged", "OnHorizontalScroll", "OnVerticalScroll",
    "OnScrollRangeChanged", "OnTabPressed", "OnSpacePressed",
    "OnEnterPressed", "OnEscapePressed", "OnInputLanguageChanged",
    "OnHyperlinkClick", "OnHyperlinkEnter", "OnHyperlinkLeave",
    "OnColorSelect", "OnCooldownDone", "OnAnimFinished",
    "OnModelLoaded", "OnModelLoading",

    # Common callback patterns
    "OnTooltipShow", "OnTooltipHide",

    # LibDataBroker patterns
    "OnClick", "OnTooltipShow",
}

# Patterns that indicate dynamic code (lower confidence)
DYNAMIC_PATTERNS = [
    r'_G\[',              # Dynamic global access
    r'getfenv|setfenv',   # Environment manipulation
    r'loadstring',        # Runtime code execution
    r'rawget|rawset',     # Raw table operations
    r'\[.*\.\.',          # String concatenation in index
]


class TokenScanner:
    """Extract meaningful tokens from Lua source without full AST parsing."""

    # Regex patterns for extraction
    PATTERNS = {
        # Function definitions
        'function_def_local': re.compile(r'local\s+function\s+(\w+)\s*\('),
        'function_def_global': re.compile(r'^function\s+(\w+)\s*\(', re.MULTILINE),
        'function_def_namespaced': re.compile(r'function\s+([\w\.]+)\.(\w+)\s*\('),
        'method_def': re.compile(r'function\s+(\w+):(\w+)\s*\('),
        'function_assign_local': re.compile(r'local\s+(\w+)\s*=\s*function\s*\('),
        'function_assign_table': re.compile(r'(\w+)\.(\w+)\s*=\s*function\s*\('),
        'function_assign_method': re.compile(r'(\w+):(\w+)\s*=\s*function\s*\('),

        # Variable definitions
        'local_var': re.compile(r'local\s+(\w+)\s*='),
        'local_var_multi': re.compile(r'local\s+([\w,\s]+)\s*='),

        # Function calls
        'function_call': re.compile(r'(\w+)\s*\('),
        'namespaced_call': re.compile(r'(\w+)\.(\w+)\s*\('),
        'method_call': re.compile(r':(\w+)\s*\('),
        'deep_namespaced_call': re.compile(r'(\w+(?:\.\w+)+)\s*\('),
        # Pattern to detect function definition lines (to filter out)
        'function_def_line': re.compile(r'\bfunction\s+\w'),

        # Member access
        'member_access': re.compile(r'\.(\w+)'),

        # WoW-specific
        'event_register': re.compile(r':RegisterEvent\s*\(\s*["\'](\w+)["\']'),
        'event_unregister': re.compile(r':UnregisterEvent\s*\(\s*["\'](\w+)["\']'),
        'locale_access': re.compile(r'L\[(["\'])([^"\']+)\1\]'),
        'locale_def': re.compile(r'L\[(["\'])([^"\']+)\1\]\s*='),
        'libstub': re.compile(r'LibStub\s*[\(:\.].*?["\']([^"\']+)["\']'),

        # SetScript callback detection: frame:SetScript("OnEvent", handlerFunc)
        'setscript_callback': re.compile(r':SetScript\s*\(\s*["\'][^"\']+["\']\s*,\s*(\w+)\s*\)'),
        # Hook callback detection: hooksecurefunc(obj, "Method", handlerFunc)
        'hook_callback': re.compile(r'hooksecurefunc\s*\([^,]+,\s*["\'][^"\']+["\']\s*,\s*(\w+)\s*\)'),
        # RegisterCallback: obj:RegisterCallback("Event", handlerFunc) or obj.RegisterCallback(obj, "Event", handlerFunc)
        'register_callback': re.compile(r':?RegisterCallback\s*\([^,]*,\s*["\'][^"\']+["\']\s*,\s*["\']?(\w+)["\']?\s*\)'),
        # C_Timer callbacks: C_Timer.After(delay, handlerFunc)
        'timer_callback': re.compile(r'C_Timer\.\w+\s*\([^,]+,\s*(\w+)\s*\)'),

        # Code structure
        'return_statement': re.compile(r'\breturn\b'),
        'comment_block': re.compile(r'--\[\[[\s\S]*?\]\]'),
        'comment_line': re.compile(r'--[^\n]*'),
    }

    def __init__(self):
        self.current_file = ""

    def strip_comments(self, content: str) -> str:
        """Remove comments from Lua code for accurate parsing."""
        # Remove block comments first
        content = self.PATTERNS['comment_block'].sub('', content)
        # Remove line comments
        content = self.PATTERNS['comment_line'].sub('', content)
        return content

    def scan_functions(self, content: str, file_path: str) -> List[FunctionDef]:
        """Extract all function definitions from Lua code."""
        functions = []
        lines = content.splitlines()
        stripped = self.strip_comments(content)

        # Track line numbers by scanning original content
        for line_num, line in enumerate(lines, 1):
            line_stripped = line.strip()

            # Skip comment lines
            if line_stripped.startswith('--'):
                continue

            # local function name()
            match = self.PATTERNS['function_def_local'].search(line)
            if match:
                functions.append(FunctionDef(
                    name=match.group(1),
                    file=file_path,
                    line=line_num,
                    is_local=True,
                    is_method=False
                ))
                continue

            # function Namespace.name()
            match = self.PATTERNS['function_def_namespaced'].search(line)
            if match:
                namespace, name = match.groups()
                functions.append(FunctionDef(
                    name=f"{namespace}.{name}",
                    file=file_path,
                    line=line_num,
                    is_local=False,
                    is_method=False,
                    namespace=namespace
                ))
                continue

            # function Namespace:method()
            match = self.PATTERNS['method_def'].search(line)
            if match:
                namespace, name = match.groups()
                functions.append(FunctionDef(
                    name=f"{namespace}:{name}",
                    file=file_path,
                    line=line_num,
                    is_local=False,
                    is_method=True,
                    namespace=namespace
                ))
                continue

            # function globalName()
            match = self.PATTERNS['function_def_global'].search(line)
            if match:
                name = match.group(1)
                # Skip if it's actually a namespaced function
                if '.' not in line.split('(')[0] and ':' not in line.split('(')[0]:
                    functions.append(FunctionDef(
                        name=name,
                        file=file_path,
                        line=line_num,
                        is_local=False,
                        is_method=False
                    ))
                continue

            # local name = function()
            match = self.PATTERNS['function_assign_local'].search(line)
            if match:
                functions.append(FunctionDef(
                    name=match.group(1),
                    file=file_path,
                    line=line_num,
                    is_local=True,
                    is_method=False
                ))
                continue

            # Namespace.name = function()
            match = self.PATTERNS['function_assign_table'].search(line)
            if match:
                namespace, name = match.groups()
                functions.append(FunctionDef(
                    name=f"{namespace}.{name}",
                    file=file_path,
                    line=line_num,
                    is_local=False,
                    is_method=False,
                    namespace=namespace
                ))
                continue

        return functions

    def scan_variables(self, content: str, file_path: str) -> List[VariableDef]:
        """Extract local variable definitions from Lua code."""
        variables = []
        lines = content.splitlines()

        for line_num, line in enumerate(lines, 1):
            line_stripped = line.strip()

            # Skip comments
            if line_stripped.startswith('--'):
                continue

            # Skip function definitions (handled separately)
            if 'function' in line:
                continue

            # local var = value
            match = self.PATTERNS['local_var'].search(line)
            if match:
                var_name = match.group(1)
                variables.append(VariableDef(
                    name=var_name,
                    file=file_path,
                    line=line_num,
                    is_local=True
                ))

        return variables

    def scan_calls(self, content: str) -> Set[str]:
        """Extract all function/method calls from Lua code."""
        calls = set()
        stripped = self.strip_comments(content)

        # Process line by line to skip function definitions
        for line in stripped.splitlines():
            # Skip function definition lines
            if self.PATTERNS['function_def_line'].search(line):
                continue
            # Skip local function assignments
            if re.search(r'local\s+\w+\s*=\s*function', line):
                continue

            # Simple function calls: func()
            for match in self.PATTERNS['function_call'].finditer(line):
                name = match.group(1)
                # Skip common keywords
                if name not in ('function', 'if', 'for', 'while', 'local', 'return', 'end', 'then', 'do'):
                    calls.add(name)

            # Namespaced calls: Namespace.func()
            for match in self.PATTERNS['namespaced_call'].finditer(line):
                namespace, name = match.groups()
                calls.add(f"{namespace}.{name}")
                calls.add(name)  # Also add just the name for flexibility

            # Method calls: obj:method()
            for match in self.PATTERNS['method_call'].finditer(line):
                calls.add(match.group(1))

        return calls

    def scan_member_accesses(self, content: str) -> Set[str]:
        """Extract all member accesses from Lua code."""
        accesses = set()
        stripped = self.strip_comments(content)

        for match in self.PATTERNS['member_access'].finditer(stripped):
            accesses.add(match.group(1))

        return accesses

    def scan_events(self, content: str, file_path: str) -> List[EventRegistration]:
        """Extract event registrations from Lua code."""
        events = []
        lines = content.splitlines()

        for line_num, line in enumerate(lines, 1):
            for match in self.PATTERNS['event_register'].finditer(line):
                events.append(EventRegistration(
                    event=match.group(1),
                    file=file_path,
                    line=line_num
                ))

        return events

    def scan_locales(self, content: str) -> Tuple[Set[str], Set[str]]:
        """Extract locale key definitions and usages."""
        definitions = set()
        usages = set()
        stripped = self.strip_comments(content)

        # Find definitions: L["key"] = value
        for match in self.PATTERNS['locale_def'].finditer(stripped):
            definitions.add(match.group(2))

        # Find usages: L["key"] (not followed by =)
        for match in self.PATTERNS['locale_access'].finditer(stripped):
            key = match.group(2)
            # Check if this is not a definition
            end_pos = match.end()
            remaining = stripped[end_pos:end_pos+10].strip()
            if not remaining.startswith('='):
                usages.add(key)

        return definitions, usages

    def scan_libraries(self, content: str) -> Set[str]:
        """Extract LibStub library usages."""
        libs = set()
        stripped = self.strip_comments(content)

        for match in self.PATTERNS['libstub'].finditer(stripped):
            libs.add(match.group(1))

        return libs

    def scan_callback_references(self, content: str) -> Set[str]:
        """Extract function names passed as callbacks to SetScript, hooks, timers, etc.

        These are functions passed by reference (not called directly) but are definitely used.
        Example: frame:SetScript("OnEvent", onEvent) -- onEvent is used via callback
        """
        callbacks = set()
        stripped = self.strip_comments(content)

        # SetScript callbacks: frame:SetScript("OnEvent", handlerFunc)
        for match in self.PATTERNS['setscript_callback'].finditer(stripped):
            callbacks.add(match.group(1))

        # Hook callbacks: hooksecurefunc(obj, "Method", handlerFunc)
        for match in self.PATTERNS['hook_callback'].finditer(stripped):
            callbacks.add(match.group(1))

        # RegisterCallback: obj:RegisterCallback("Event", handlerFunc)
        for match in self.PATTERNS['register_callback'].finditer(stripped):
            callbacks.add(match.group(1))

        # C_Timer callbacks: C_Timer.After(delay, handlerFunc)
        for match in self.PATTERNS['timer_callback'].finditer(stripped):
            callbacks.add(match.group(1))

        return callbacks

    def has_dynamic_patterns(self, content: str) -> bool:
        """Check if the file uses dynamic code patterns."""
        for pattern in DYNAMIC_PATTERNS:
            if re.search(pattern, content):
                return True
        return False


class LuaAnalyzer:
    """Lightweight Lua analyzer for WoW addons."""

    def __init__(self, addon_name: str):
        self.addon_name = addon_name
        self.scanner = TokenScanner()
        self.symbols = SymbolTable()
        self.files_with_dynamic_code: Set[str] = set()

    def analyze_file(self, path: Path, content: str):
        """Analyze a single Lua file and update symbol table."""
        file_str = str(path)

        # Track dynamic code usage
        if self.scanner.has_dynamic_patterns(content):
            self.files_with_dynamic_code.add(file_str)

        # Scan function definitions
        for func in self.scanner.scan_functions(content, file_str):
            key = f"{file_str}:{func.name}"
            self.symbols.functions[key] = func

        # Scan variable definitions
        for var in self.scanner.scan_variables(content, file_str):
            key = f"{file_str}:{var.name}:{var.line}"
            self.symbols.variables[key] = var

        # Scan function calls
        calls = self.scanner.scan_calls(content)
        self.symbols.function_calls.update(calls)

        # Scan callback references (functions passed to SetScript, hooks, timers)
        callbacks = self.scanner.scan_callback_references(content)
        self.symbols.function_calls.update(callbacks)

        # Scan member accesses
        accesses = self.scanner.scan_member_accesses(content)
        self.symbols.member_accesses.update(accesses)

        # Scan events
        events = self.scanner.scan_events(content, file_str)
        self.symbols.registered_events.extend(events)

        # Scan locales
        defs, usages = self.scanner.scan_locales(content)
        self.symbols.locale_definitions.update(defs)
        self.symbols.locale_usages.update(usages)

        # Scan library usages
        libs = self.scanner.scan_libraries(content)
        self.symbols.library_usages.update(libs)

    def get_unused_functions(self) -> List[Tuple[FunctionDef, Confidence]]:
        """Find functions that are never called."""
        unused = []

        for key, func in self.symbols.functions.items():
            # Extract just the function name for matching
            func_name = func.name
            if ':' in func_name:
                _, method_name = func_name.split(':', 1)
            elif '.' in func_name:
                _, method_name = func_name.rsplit('.', 1)
            else:
                method_name = func_name

            # Check if it's a safe WoW pattern
            if method_name in WOW_SAFE_PATTERNS:
                continue

            # Check if the function name ends with common callback patterns
            if any(method_name.endswith(pat) for pat in ['Callback', 'Handler', 'Hook']):
                continue

            # Check if function is called
            is_called = (
                func_name in self.symbols.function_calls or
                method_name in self.symbols.function_calls or
                method_name in self.symbols.member_accesses
            )

            if not is_called:
                # Determine confidence
                # First check if file has dynamic patterns (lowers confidence)
                if func.file in self.files_with_dynamic_code:
                    confidence = Confidence.SUSPICIOUS
                elif func.is_local:
                    # Local functions are definitely unused if not called
                    confidence = Confidence.DEFINITE
                else:
                    confidence = Confidence.LIKELY

                unused.append((func, confidence))

        return unused

    def get_unused_variables(self) -> List[Tuple[VariableDef, Confidence]]:
        """Find local variables that are never read."""
        unused = []

        for key, var in self.symbols.variables.items():
            # Check if variable is accessed
            is_used = (
                var.name in self.symbols.function_calls or
                var.name in self.symbols.member_accesses
            )

            if not is_used and var.is_local:
                if var.file in self.files_with_dynamic_code:
                    confidence = Confidence.SUSPICIOUS
                else:
                    confidence = Confidence.DEFINITE

                unused.append((var, confidence))

        return unused
