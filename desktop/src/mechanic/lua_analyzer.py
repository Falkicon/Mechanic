"""
Lua static analysis utilities for WoW addon development.

Built on the Lua 5.1 tokenizer and structure walker (``lua_tokenizer`` and
``lua_structure``), so strings and comments never produce false matches and
usage is decided by identifier references instead of call-site regexes.
"""

from collections import Counter
from dataclasses import dataclass, field
from enum import Enum
from pathlib import Path
from typing import Dict, List, Optional, Set, Tuple

from .lua_structure import LuaFile, parse_lua
from .lua_tokenizer import strip_comments as _strip_comments


class Confidence(str, Enum):
    """Confidence level for dead code detection."""

    DEFINITE = "definite"  # 100% certain this is dead
    LIKELY = "likely"  # 90%+ certain, may have edge cases
    SUSPICIOUS = "suspicious"  # 70%+ certain, needs human review


@dataclass
class FunctionDef:
    """Represents a function definition in Lua code."""

    name: str
    file: str
    line: int
    is_local: bool
    is_method: bool = False
    namespace: Optional[str] = None  # e.g., "MyAddon" for MyAddon:Func()
    reads: int = 0  # references inside the file for local functions


@dataclass
class VariableDef:
    """Represents a variable definition in Lua code."""

    name: str
    file: str
    line: int
    is_local: bool
    reads: int = 0  # reads within the variable's scope


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

    # Usages
    function_calls: Set[str] = field(default_factory=set)
    member_accesses: Set[str] = field(default_factory=set)

    # WoW-specific
    registered_events: List[EventRegistration] = field(default_factory=list)
    locale_usages: Set[str] = field(default_factory=set)
    locale_prefixes: Set[str] = field(default_factory=set)
    locale_dynamic: bool = False
    library_usages: Set[str] = field(default_factory=set)


# WoW patterns that should NOT be flagged as dead code
WOW_SAFE_PATTERNS = {
    # AceAddon lifecycle - called by framework
    "OnInitialize",
    "OnEnable",
    "OnDisable",
    "OnModuleCreated",
    "OnEmbedEnable",
    "OnEmbedDisable",
    # AceDB callbacks - registered via db.RegisterCallback()
    "OnProfileChanged",
    "OnProfileCopied",
    "OnProfileReset",
    "OnProfileDeleted",
    "OnNewProfile",
    "OnDatabaseReset",
    "OnDatabaseShutdown",
    # Frame script handlers - called by WoW engine
    "OnEvent",
    "OnUpdate",
    "OnShow",
    "OnHide",
    "OnEnter",
    "OnLeave",
    "OnClick",
    "OnDragStart",
    "OnDragStop",
    "OnReceiveDrag",
    "OnMouseDown",
    "OnMouseUp",
    "OnMouseWheel",
    "OnSizeChanged",
    "OnAttributeChanged",
    "OnLoad",
    "OnChar",
    "OnKeyDown",
    "OnKeyUp",
    "OnEditFocusGained",
    "OnEditFocusLost",
    "OnTextChanged",
    "OnValueChanged",
    "OnMinMaxChanged",
    "OnHorizontalScroll",
    "OnVerticalScroll",
    "OnScrollRangeChanged",
    "OnTabPressed",
    "OnSpacePressed",
    "OnEnterPressed",
    "OnEscapePressed",
    "OnInputLanguageChanged",
    "OnHyperlinkClick",
    "OnHyperlinkEnter",
    "OnHyperlinkLeave",
    "OnColorSelect",
    "OnCooldownDone",
    "OnAnimFinished",
    "OnModelLoaded",
    "OnModelLoading",
    # Common callback patterns
    "OnTooltipShow",
    "OnTooltipHide",
    # AceComm
    "OnCommReceived",
}


class TokenScanner:
    """Extract meaningful tokens from Lua source using the real tokenizer."""

    def strip_comments(self, content: str) -> str:
        """Blank out comments (string contents containing ``--`` are preserved)."""
        return _strip_comments(content)

    def scan_functions(self, content: str, file_path: str) -> List[FunctionDef]:
        """Extract named function definitions from Lua code."""
        return _function_defs(parse_lua(content), file_path)

    def scan_variables(self, content: str, file_path: str) -> List[VariableDef]:
        """Extract local variable definitions (functions are reported separately)."""
        return _variable_defs(parse_lua(content), file_path)

    def scan_calls(self, content: str) -> Set[str]:
        """Names of every called function, method and qualified member."""
        return set(parse_lua(content).calls)

    def scan_member_accesses(self, content: str) -> Set[str]:
        """Names used as ``obj.member`` or ``obj:member`` (definition sites excluded)."""
        return set(parse_lua(content).member_refs)

    def scan_events(
        self, content: str, file_path: str
    ) -> Tuple[List[EventRegistration], Set[str]]:
        """Event registrations and the handler method names Ace3 will call."""
        parsed = parse_lua(content)
        return _events(parsed, file_path)

    def scan_locales(self, content: str) -> Tuple[Set[str], Set[str]]:
        """Extract locale key definitions and usages."""
        parsed = parse_lua(content)
        return set(parsed.locale_defs), set(parsed.locale_uses)

    def scan_libraries(self, content: str) -> Set[str]:
        """Extract library names from LibStub calls and library-shaped strings."""
        return set(parse_lua(content).libs)

    def scan_callback_references(self, content: str) -> Set[str]:
        """Function names passed by reference to SetScript, hooks, timers, etc."""
        return set(parse_lua(content).callback_refs)

    def has_dynamic_patterns(self, content: str) -> bool:
        """True if the file uses ``_G[expr]``, getfenv/loadstring or dynamic dispatch."""
        return parse_lua(content).dynamic


def _function_defs(parsed: LuaFile, file_path: str) -> List[FunctionDef]:
    defs = []
    for func in parsed.functions:
        if not func.named:
            continue
        defs.append(
            FunctionDef(
                name=func.name,
                file=file_path,
                line=func.line,
                is_local=func.is_local,
                is_method=func.is_method,
                namespace=func.namespace,
                reads=_local_function_reads(parsed, func),
            )
        )
    return defs


def _local_function_reads(parsed: LuaFile, func) -> int:
    """References to a local function, excluding its own body (recursion)."""
    decl = func.decl
    if decl is None:
        return 0
    total = parsed.reads_between(decl.name, decl.tok + 1, decl.scope_end)
    inner = parsed.reads_between(decl.name, func.start_tok, func.end_tok)
    return max(total - inner, 0)


def _variable_defs(parsed: LuaFile, file_path: str) -> List[VariableDef]:
    variables = []
    for decl in parsed.locals:
        if decl.is_function:
            continue
        variables.append(
            VariableDef(
                name=decl.name,
                file=file_path,
                line=decl.line,
                is_local=True,
                reads=parsed.reads_between(decl.name, decl.tok + 1, decl.scope_end),
            )
        )
    return variables


def _events(
    parsed: LuaFile, file_path: str
) -> Tuple[List[EventRegistration], Set[str]]:
    events = []
    handlers: Set[str] = set()
    for event, handler, line in parsed.events:
        handler = handler or event
        events.append(EventRegistration(event, file_path, line, handler))
        handlers.add(handler)
    return events, handlers


class LuaAnalyzer:
    """Lightweight Lua analyzer for WoW addons."""

    def __init__(self, addon_name: str):
        self.addon_name = addon_name
        self.symbols = SymbolTable()
        self.files_with_dynamic_code: Set[str] = set()
        # Aggregates across files, used for globals, methods and exports
        self._global_reads: Counter = Counter()
        self._member_files: Dict[str, Counter] = {}
        self._dispatch: Set[str] = set()
        self._string_files: Dict[str, Set[str]] = {}

    def analyze_file(self, path: Path, content: str, parsed: Optional[LuaFile] = None):
        """Analyze a single Lua file and update the symbol table."""
        file_str = str(path)
        parsed = parsed if parsed is not None else parse_lua(content)
        symbols = self.symbols

        if parsed.dynamic:
            self.files_with_dynamic_code.add(file_str)

        for func in _function_defs(parsed, file_str):
            symbols.functions[f"{file_str}:{func.name}:{func.line}"] = func

        for var in _variable_defs(parsed, file_str):
            symbols.variables[f"{file_str}:{var.name}:{var.line}"] = var

        symbols.function_calls.update(parsed.calls)
        symbols.function_calls.update(parsed.callback_refs)
        symbols.member_accesses.update(parsed.member_refs)

        events, handlers = _events(parsed, file_str)
        symbols.registered_events.extend(events)
        symbols.function_calls.update(handlers)

        symbols.locale_usages.update(parsed.locale_uses)
        symbols.locale_prefixes.update(parsed.locale_prefixes)
        symbols.locale_dynamic = symbols.locale_dynamic or parsed.locale_dynamic
        symbols.library_usages.update(parsed.libs)

        for name, positions in parsed.reads.items():
            self._global_reads[name] += len(positions)
        for name, count in parsed.member_refs.items():
            self._member_files.setdefault(name, Counter())[file_str] += count
        self._dispatch.update(parsed.dispatch_strings)
        self._dispatch.update(parsed.callback_refs)
        for text in parsed.strings:
            self._string_files.setdefault(text, set()).add(file_str)

    def add_external_references(self, names) -> None:
        """Register names referenced outside Lua files (for example XML handlers)."""
        self._dispatch.update(names)

    # -- queries --------------------------------------------------------------

    def member_reference_files(self, member: str) -> Set[str]:
        """Files that reference ``member`` via ``obj.member`` or ``obj:member``."""
        return set(self._member_files.get(member, ()))

    def is_name_read(self, name: str) -> bool:
        """True if ``name`` is read as a bare identifier anywhere (for example a library global)."""
        return self._global_reads.get(name, 0) > 0

    def is_dispatched(self, name: str) -> bool:
        """True if ``name`` is passed as a dispatch string or callback value."""
        return name in self._dispatch

    def get_unused_functions(self) -> List[Tuple[FunctionDef, Confidence]]:
        """Find functions that are never referenced."""
        unused = []

        for func in self.symbols.functions.values():
            func_name = func.name
            if ":" in func_name:
                method_name = func_name.split(":", 1)[1]
            elif "." in func_name:
                method_name = func_name.rsplit(".", 1)[1]
            else:
                method_name = func_name

            if method_name in WOW_SAFE_PATTERNS:
                continue
            if any(method_name.endswith(p) for p in ("Callback", "Handler", "Hook")):
                continue

            dynamic = func.file in self.files_with_dynamic_code
            string_hit = func.file in self._string_files.get(method_name, ())

            if func.is_local:
                if func.reads > 0 or method_name in self._dispatch:
                    continue
                if dynamic and string_hit:
                    confidence = Confidence.SUSPICIOUS
                else:
                    confidence = Confidence.DEFINITE
            else:
                if func.namespace is None:
                    refs = self._global_reads.get(method_name, 0)
                else:
                    refs = sum(self._member_files.get(method_name, {}).values())
                if refs > 0 or method_name in self._dispatch:
                    continue
                if func_name in self._dispatch:
                    continue
                if dynamic or method_name in self._string_files:
                    confidence = Confidence.SUSPICIOUS
                else:
                    confidence = Confidence.LIKELY
            unused.append((func, confidence))

        return unused

    def get_unused_variables(self) -> List[Tuple[VariableDef, Confidence]]:
        """Find local variables that are never read in their scope."""
        unused = []

        by_statement: Dict[Tuple[str, int], List[VariableDef]] = {}
        for var in self.symbols.variables.values():
            by_statement.setdefault((var.file, var.line), []).append(var)

        for group in by_statement.values():
            # ``local ok, err = pcall(f)``: only report when nothing is read
            if any(v.reads > 0 for v in group):
                continue
            for var in group:
                if var.name.startswith("_"):
                    continue
                unused.append((var, Confidence.DEFINITE))

        return unused
