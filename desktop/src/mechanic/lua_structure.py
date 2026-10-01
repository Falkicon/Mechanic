"""
Lightweight Lua structure walker built on :mod:`mechanic.lua_tokenizer`.

This is not a full parser. It walks the token stream once and recovers what the
addon analyzers need:

- block structure (function / if / for / while / do / repeat ... end / until)
- function definitions (``function a.b:c``, ``local function``, ``x = function``)
- local declarations with their scopes
- identifier references (reads, member accesses, calls) with definition sites,
  parameters, assignment targets and table-constructor keys excluded
- string-dispatch references (``RegisterEvent("X", "Method")``, ``_G["name"]``)
- statements that follow a ``return`` / ``break`` in the same block
- WoW specifics: event registrations, locale keys, LibStub libraries

The walker is tolerant of malformed input; unbalanced blocks are closed at the
end of the file.
"""

import re
from collections import Counter
from dataclasses import dataclass, field
from typing import Dict, List, Optional, Set, Tuple

from .lua_tokenizer import (
    KEYWORD,
    NAME,
    NUMBER,
    OP,
    STRING,
    Comment,
    Token,
    tokenize,
)

# Calls whose identifier-shaped string arguments name functions or methods that
# are dispatched by the framework (Ace3 and Blizzard APIs).
DISPATCH_CALLS = frozenset(
    {
        "RegisterEvent",
        "RegisterUnitEvent",
        "RegisterMessage",
        "RegisterChatCommand",
        "RegisterComm",
        "RegisterCallback",
        "RegisterBucketEvent",
        "RegisterBucketMessage",
        "ScheduleTimer",
        "ScheduleRepeatingTimer",
        "Hook",
        "SecureHook",
        "RawHook",
        "HookScript",
        "SecureHookScript",
        "RawHookScript",
        "SetScript",
        "hooksecurefunc",
        "getglobal",
        "setglobal",
    }
)

# Calls that take a function value as an argument. Bare names passed to these
# (or to DISPATCH_CALLS) are reported by ``callback_refs``.
CALLBACK_CALLS = DISPATCH_CALLS | {"After", "NewTimer", "NewTicker"}

DYNAMIC_NAMES = frozenset({"getfenv", "setfenv", "loadstring", "rawget", "rawset"})

IDENT_STRING = re.compile(r"^[A-Za-z_][A-Za-z0-9_.:]*$")
LIB_STRING = re.compile(r"^[A-Za-z][A-Za-z0-9_]*-\d+(?:\.\d+)*$")

_BINARY_OPS = frozenset(
    {"+", "-", "*", "/", "%", "^", "..", "==", "~=", "<", "<=", ">", ">="}
)
_STATEMENT_KEYWORDS = frozenset(
    {"local", "if", "for", "while", "do", "repeat", "return", "break", "function"}
)
_BLOCK_CLOSERS = frozenset({"end", "else", "elseif", "until"})
_OPEN_BRACKETS = {"(": ")", "[": "]", "{": "}"}


@dataclass(slots=True)
class Block:
    """A lexical block. ``depth`` is the nesting depth including this block."""

    kind: str  # chunk, function, if, for, while, do, repeat
    start: int
    end: int
    parent: Optional["Block"]
    depth: int = 0
    func: Optional["FuncInfo"] = None

    def line_span(self, tokens: List[Token]) -> Tuple[int, int]:
        return tokens[self.start].line, tokens[self.end].line


@dataclass(slots=True)
class FuncInfo:
    """A function body found in the source."""

    name: str  # "helper", "A.b", "A:b", or "anonymous"
    kind: str  # local, global, namespaced, method, field, anonymous
    is_local: bool
    is_method: bool
    namespace: Optional[str]
    line: int  # line of the defining statement
    end_line: int
    start_tok: int  # index of the ``function`` keyword
    end_tok: int
    body_start: int  # index of the first token after the parameter list
    params: List[str] = field(default_factory=list)
    decl: Optional["LocalDecl"] = None
    named: bool = False  # a real definition (not an anonymous/field function)

    @property
    def body_empty(self) -> bool:
        return self.end_tok == self.body_start

    @property
    def length(self) -> int:
        return self.end_line - self.line


@dataclass(slots=True)
class LocalDecl:
    """A ``local`` declaration and the token range in which it is visible."""

    name: str
    tok: int
    line: int
    scope_end: int
    is_function: bool = False  # local function / local x = function
    func: Optional[FuncInfo] = None
    has_value: bool = True


@dataclass(slots=True)
class Unreachable:
    """A statement that follows ``return``/``break`` in the same block."""

    line: int
    col: int
    terminator_line: int
    terminator: str


@dataclass(slots=True)
class _Frame:
    kind: str  # block kind or one of "(", "[", "{"
    block: Optional[Block] = None
    term: Optional[str] = None  # None, "expect", "have", "after"
    term_tok: int = 0
    term_kind: str = ""
    locals: List[LocalDecl] = field(default_factory=list)
    pending_do: bool = False
    ntok: int = 0
    first_kind: str = ""

    @property
    def is_bracket(self) -> bool:
        return self.block is None


@dataclass
class LuaFile:
    """Everything the analyzers need to know about one Lua source file."""

    tokens: List[Token]
    comments: List[Comment]
    line_count: int
    blocks: List[Block] = field(default_factory=list)
    functions: List[FuncInfo] = field(default_factory=list)
    locals: List[LocalDecl] = field(default_factory=list)
    unreachable: List[Unreachable] = field(default_factory=list)
    reads: Dict[str, List[int]] = field(default_factory=dict)
    member_refs: Counter = field(default_factory=Counter)
    calls: Set[str] = field(default_factory=set)
    strings: Set[str] = field(default_factory=set)
    dispatch_strings: Set[str] = field(default_factory=set)
    callback_refs: Set[str] = field(default_factory=set)
    events: List[Tuple[str, Optional[str], int]] = field(default_factory=list)
    locale_defs: Dict[str, int] = field(default_factory=dict)
    locale_uses: Set[str] = field(default_factory=set)
    locale_prefixes: Set[str] = field(default_factory=set)
    locale_dynamic: bool = False
    libs: Set[str] = field(default_factory=set)
    dynamic: bool = False

    def enclosing_function(self, tok: int) -> Optional[FuncInfo]:
        """Innermost function whose body contains token index ``tok``."""
        best: Optional[FuncInfo] = None
        for func in self.functions:
            if func.start_tok <= tok <= func.end_tok and (
                best is None or func.start_tok > best.start_tok
            ):
                best = func
        return best

    def max_depth_by_line(self) -> Dict[int, int]:
        """Deepest block nesting touching each line that has tokens."""
        depths: Dict[int, int] = {}
        tokens = self.tokens
        for block in self.blocks:
            if block.depth <= 0:
                continue
            first, last = block.line_span(tokens)
            for line in range(first, last + 1):
                if depths.get(line, 0) < block.depth:
                    depths[line] = block.depth
        return depths

    def code_lines(self) -> List[Tuple[int, str]]:
        """``(line, text)`` for each line holding code tokens, comments excluded."""
        by_line: Dict[int, List[str]] = {}
        for tok in self.tokens:
            by_line.setdefault(tok.line, []).append(
                f'"{tok.value}"' if tok.kind == STRING else tok.value
            )
        return [(line, " ".join(parts)) for line, parts in sorted(by_line.items())]

    def reads_between(self, name: str, lo: int, hi: int) -> int:
        """Number of bare reads of ``name`` with token index in ``[lo, hi]``."""
        from bisect import bisect_left, bisect_right

        positions = self.reads.get(name)
        if not positions:
            return 0
        return bisect_right(positions, hi) - bisect_left(positions, lo)


def _is_op(tok: Optional[Token], value: str) -> bool:
    return tok is not None and tok.kind == OP and tok.value == value


def _is_kw(tok: Optional[Token], value: str) -> bool:
    return tok is not None and tok.kind == KEYWORD and tok.value == value


class _Walker:
    def __init__(self, source: str):
        tokens, comments = tokenize(source)
        self.tokens = tokens
        self.n = len(tokens)
        self.file = LuaFile(tokens, comments, source.count("\n") + 1)
        root = Block("chunk", 0, max(self.n - 1, 0), None, 0)
        self.file.blocks.append(root)
        self.frames: List[_Frame] = [_Frame("chunk", block=root)]
        self.bframes: List[_Frame] = [self.frames[0]]
        self.skip: Set[int] = set()

    # -- helpers ---------------------------------------------------------------

    def _tok(self, idx: int) -> Optional[Token]:
        return self.tokens[idx] if 0 <= idx < self.n else None

    def _push_block(self, kind: str, idx: int) -> _Frame:
        parent = self.bframes[-1].block
        contrib = 0 if (kind == "function" and parent.kind == "chunk") else 1
        block = Block(kind, idx, max(self.n - 1, idx), parent, parent.depth + contrib)
        self.file.blocks.append(block)
        frame = _Frame(kind, block=block)
        self.frames.append(frame)
        self.bframes.append(frame)
        return frame

    def _pop_until(self, idx: int) -> None:
        """``until`` closes the nearest open repeat (ignored when none is open)."""
        if not any(f.kind == "repeat" for f in self.bframes[1:]):
            return
        while True:
            while len(self.frames) > 1 and self.frames[-1].is_bracket:
                self.frames.pop()
            closing = self.frames[-1].kind
            self._close_top(idx)
            if closing == "repeat":
                return

    def _close_top(self, idx: int) -> None:
        while len(self.frames) > 1 and self.frames[-1].is_bracket:
            self.frames.pop()
        if len(self.frames) <= 1:
            return
        frame = self.frames.pop()
        self.bframes.pop()
        block = frame.block
        block.end = idx
        if block.func is not None:
            block.func.end_tok = idx
            block.func.end_line = self.tokens[idx].line
        if frame.kind == "repeat":
            # Locals of a repeat body stay visible in the ``until`` condition.
            self.bframes[-1].locals.extend(frame.locals)
        else:
            for decl in frame.locals:
                decl.scope_end = idx

    def _find_local(self, name: str) -> Optional[LocalDecl]:
        for frame in reversed(self.bframes):
            for decl in reversed(frame.locals):
                if decl.name == name:
                    return decl
        return None

    def _declare(self, name: str, idx: int, **kw) -> LocalDecl:
        decl = LocalDecl(name, idx, self.tokens[idx].line, self.n, **kw)
        self.bframes[-1].locals.append(decl)
        self.file.locals.append(decl)
        return decl

    # -- reachability ---------------------------------------------------------

    def _term_step(self, frame: _Frame, tok: Token) -> None:
        state = frame.term
        kind, val = tok.kind, tok.value
        if kind == KEYWORD and val in _BLOCK_CLOSERS:
            frame.term = None
            return
        if kind == OP and val == ";":
            if state in ("expect", "have"):
                frame.term = "after"
            return
        if state in ("expect", "have") and kind == OP and val in _OPEN_BRACKETS:
            frame.term = "have"
            return
        if state == "expect":
            if (
                kind in (NAME, NUMBER, STRING)
                or (kind == KEYWORD and val in ("true", "false", "nil", "function"))
                or (kind == OP and val == "...")
            ):
                frame.term = "have"
            elif (kind == KEYWORD and val == "not") or (
                kind == OP and val in ("-", "#")
            ):
                pass
            elif kind == KEYWORD and val in _STATEMENT_KEYWORDS:
                self._unreachable(frame, tok)
        elif state == "have":
            if (kind == OP and (val in _BINARY_OPS or val in (",", ".", ":"))) or (
                kind == KEYWORD and val in ("and", "or")
            ):
                frame.term = "expect"
            elif kind == STRING:
                pass  # call with a string argument
            elif kind in (NAME, NUMBER) or (
                kind == KEYWORD and val in _STATEMENT_KEYWORDS
            ):
                self._unreachable(frame, tok)
        elif state == "after":
            self._unreachable(frame, tok)

    def _unreachable(self, frame: _Frame, tok: Token) -> None:
        self.file.unreachable.append(
            Unreachable(
                tok.line,
                tok.col,
                self.tokens[frame.term_tok].line,
                frame.term_kind,
            )
        )
        frame.term = None

    # -- function definitions -------------------------------------------------

    def _handle_function(self, i: int) -> None:
        tokens = self.tokens
        prev = self._tok(i - 1)
        nxt = self._tok(i + 1)
        stmt_tok = i
        name = "anonymous"
        kind = "anonymous"
        is_local = False
        is_method = False
        namespace: Optional[str] = None
        named = False
        decl: Optional[LocalDecl] = None
        paren_idx = i + 1

        if nxt is not None and nxt.kind == NAME:
            parts = [nxt.value]
            self.skip.add(i + 1)
            j = i + 1
            while (
                (_is_op(self._tok(j + 1), ".") or _is_op(self._tok(j + 1), ":"))
                and self._tok(j + 2) is not None
                and tokens[j + 2].kind == NAME
            ):
                sep = tokens[j + 1].value
                parts.append(sep + tokens[j + 2].value)
                self.skip.add(j + 2)
                j += 2
                if sep == ":":
                    is_method = True
                    break
            paren_idx = j + 1
            is_local = _is_kw(prev, "local")
            if is_local:
                stmt_tok = i - 1
            dotted = "".join(parts)
            named = True
            name = dotted
            if is_method:
                kind = "method"
                namespace = dotted.rsplit(":", 1)[0]
            elif len(parts) > 1:
                kind = "namespaced"
                namespace = dotted.rsplit(".", 1)[0]
            else:
                existing = None if is_local else self._find_local(dotted)
                if is_local:
                    kind = "local"
                    decl = self._declare(dotted, i + 1, is_function=True)
                elif existing is not None:
                    kind, is_local, decl = "local", True, existing
                    existing.is_function = True
                else:
                    kind = "global"
        elif _is_op(nxt, "("):
            # anonymous function: look back for an assignment target
            if _is_op(prev, "=") and i >= 2 and tokens[i - 2].kind == NAME:
                start = i - 2
                while (
                    start >= 2
                    and (
                        _is_op(tokens[start - 1], ".") or _is_op(tokens[start - 1], ":")
                    )
                    and tokens[start - 2].kind == NAME
                ):
                    start -= 2
                before = tokens[start - 1] if start > 0 else None
                chain = "".join(t.value for t in tokens[start : i - 1])
                simple = start == i - 2
                if (
                    self.frames[-1].kind == "{"
                    and simple
                    and (
                        before is None
                        or (before.kind == OP and before.value in ("{", ",", ";"))
                    )
                ):
                    kind, name = "field", chain
                elif simple and _is_kw(before, "local"):
                    kind, name, named, is_local = "local", chain, True, True
                    stmt_tok = start - 1
                    decl = self._last_local(chain)
                    if decl is not None:
                        decl.is_function = True
                elif not simple:
                    name, kind, named, stmt_tok = chain, "namespaced", True, start
                    is_method = ":" in chain
                    namespace = re.split(r"[.:](?=[^.:]*$)", chain)[0]
                else:
                    existing = self._find_local(chain)
                    if existing is not None:
                        kind, name, named, is_local = "local", chain, True, True
                        decl = existing
                        existing.is_function = True
                    else:
                        kind, name, named = "global", chain, True
                    stmt_tok = start
            paren_idx = i + 1

        params: List[str] = []
        close = paren_idx
        if _is_op(self._tok(paren_idx), "("):
            close = paren_idx + 1
            while close < self.n and not _is_op(tokens[close], ")"):
                if tokens[close].kind == NAME:
                    params.append(tokens[close].value)
                    self.skip.add(close)
                close += 1

        info = FuncInfo(
            name=name,
            kind=kind,
            is_local=is_local,
            is_method=is_method,
            namespace=namespace,
            line=tokens[stmt_tok].line,
            end_line=tokens[i].line,
            start_tok=i,
            end_tok=max(self.n - 1, i),
            body_start=close + 1,
            params=params,
            decl=decl,
            named=named,
        )
        if decl is not None:
            decl.func = info
        self.file.functions.append(info)
        frame = self._push_block("function", i)
        frame.block.func = info

    def _last_local(self, name: str) -> Optional[LocalDecl]:
        frame = self.bframes[-1]
        if frame.locals and frame.locals[-1].name == name:
            return frame.locals[-1]
        return None

    # -- calls, dispatch and WoW patterns -------------------------------------

    def _matching_paren(self, open_idx: int) -> int:
        depth = 0
        for j in range(open_idx, self.n):
            tok = self.tokens[j]
            if tok.kind == OP:
                if tok.value in _OPEN_BRACKETS:
                    depth += 1
                elif tok.value in (")", "]", "}"):
                    depth -= 1
                    if depth == 0:
                        return j
        return self.n - 1

    def _scan_dispatch_args(self, open_idx: int, collect_strings: bool) -> None:
        tokens = self.tokens
        close = self._matching_paren(open_idx)
        depth = 0
        for j in range(open_idx + 1, close):
            tok = tokens[j]
            if tok.kind == OP and tok.value in _OPEN_BRACKETS:
                depth += 1
            elif tok.kind == OP and tok.value in (")", "]", "}"):
                depth -= 1
            elif depth == 0:
                if tok.kind == KEYWORD and tok.value == "function":
                    break
                if (
                    tok.kind == STRING
                    and collect_strings
                    and IDENT_STRING.match(tok.value)
                ):
                    self.file.dispatch_strings.add(tok.value)
                elif (
                    tok.kind == NAME
                    and (_is_op(tokens[j - 1], ",") or j == open_idx + 1)
                    and (j + 1 >= close or _is_op(tokens[j + 1], ","))
                ):
                    self.file.callback_refs.add(tok.value)

    def _note_call(
        self, i: int, tok: Token, prev: Optional[Token], member: bool
    ) -> None:
        name = tok.value
        self.file.calls.add(name)
        if member and _is_op(prev, "."):
            parts = [name]
            j = i
            while (
                j >= 2
                and _is_op(self.tokens[j - 1], ".")
                and self.tokens[j - 2].kind == NAME
            ):
                parts.insert(0, self.tokens[j - 2].value)
                j -= 2
            self.file.calls.add(".".join(parts))
        if name in CALLBACK_CALLS and _is_op(self._tok(i + 1), "("):
            self._scan_dispatch_args(i + 1, name in DISPATCH_CALLS)
        if name in ("RegisterEvent", "RegisterUnitEvent") and member:
            ev = self._tok(i + 2)
            if ev is not None and ev.kind == STRING and _is_op(self._tok(i + 1), "("):
                handler = None
                if _is_op(self._tok(i + 3), ",") and self._tok(i + 4) is not None:
                    h = tokens_str(self._tok(i + 4))
                    handler = h
                self.file.events.append((ev.value, handler, ev.line))

    def _note_locale(self, i: int) -> None:
        tokens = self.tokens
        nxt = self._tok(i + 1)
        if _is_op(nxt, "["):
            key = self._tok(i + 2)
            if key is not None and key.kind == STRING and _is_op(self._tok(i + 3), "]"):
                if _is_op(self._tok(i + 4), "="):
                    self.file.locale_defs.setdefault(key.value, key.line)
                else:
                    self.file.locale_uses.add(key.value)
            elif (
                key is not None
                and key.kind == STRING
                and _is_op(self._tok(i + 3), "..")
            ):
                self.file.locale_prefixes.add(key.value)
            else:
                self.file.locale_dynamic = True
        elif (
            _is_op(nxt, ".")
            and self._tok(i + 2) is not None
            and tokens[i + 2].kind == NAME
        ):
            key = tokens[i + 2]
            if _is_op(self._tok(i + 3), "="):
                self.file.locale_defs.setdefault(key.value, key.line)
            else:
                self.file.locale_uses.add(key.value)

    def _note_libstub(self, i: int) -> None:
        self.file.libs.add("LibStub")
        nxt = self._tok(i + 1)
        arg = None
        if _is_op(nxt, "("):
            arg = self._tok(i + 2)
        elif _is_op(nxt, ":") and _is_op(self._tok(i + 3), "("):
            arg = self._tok(i + 4)
        if arg is not None and arg.kind == STRING:
            self.file.libs.add(arg.value)

    # -- main walk ------------------------------------------------------------

    def walk(self) -> LuaFile:
        tokens = self.tokens
        f = self.file
        for i, tok in enumerate(tokens):
            kind, val = tok.kind, tok.value
            frame_top = self.frames[-1]
            if frame_top.kind == "[":
                if not (kind == OP and val == "]"):
                    if frame_top.ntok == 0:
                        frame_top.first_kind = kind
                    frame_top.ntok += 1
            bf = self.bframes[-1]
            if bf.term is not None and frame_top is bf:
                self._term_step(bf, tok)

            if kind == KEYWORD:
                self._keyword(i, tok)
            elif kind == NAME:
                if i not in self.skip:
                    self._name(i, tok)
                self._libs_and_dynamic(i, tok)
            elif kind == STRING:
                if IDENT_STRING.match(val):
                    f.strings.add(val)
                    tail = re.split(r"[.:]", val)[-1]
                    f.strings.add(tail)
                if LIB_STRING.match(val):
                    f.libs.add(val)
            elif kind == OP:
                self._operator(i, tok)

        # close everything left open at end of file
        last = max(self.n - 1, 0)
        while len(self.frames) > 1:
            self._close_top(last)
        for decl in self.file.locals:
            if decl.scope_end > last:
                decl.scope_end = last
        return self.file

    def _keyword(self, i: int, tok: Token) -> None:
        val = tok.value
        tokens = self.tokens
        if val == "function":
            self._handle_function(i)
        elif val == "local":
            nxt = self._tok(i + 1)
            if _is_kw(nxt, "function"):
                return
            j = i + 1
            names: List[Tuple[str, int]] = []
            while j < self.n and tokens[j].kind == NAME:
                names.append((tokens[j].value, j))
                self.skip.add(j)
                j += 1
                if _is_op(self._tok(j), ","):
                    j += 1
                else:
                    break
            has_value = _is_op(self._tok(j), "=")
            single_func = (
                has_value and len(names) == 1 and _is_kw(self._tok(j + 1), "function")
            )
            for name, idx in names:
                self._declare(name, idx, is_function=single_func, has_value=has_value)
        elif val == "if":
            self._push_block("if", i)
        elif val in ("for", "while"):
            frame = self._push_block(val, i)
            frame.pending_do = True
            if val == "for":
                j = i + 1
                while j < self.n and tokens[j].kind == NAME:
                    self.skip.add(j)
                    j += 1
                    if _is_op(self._tok(j), ","):
                        j += 1
                    else:
                        break
        elif val == "do":
            top = self.frames[-1]
            if not top.is_bracket and top.pending_do:
                top.pending_do = False
            else:
                self._push_block("do", i)
        elif val == "repeat":
            self._push_block("repeat", i)
        elif val == "until":
            self._pop_until(i)
        elif val == "end":
            self._close_top(i)
        elif val in ("return", "break"):
            bf = self.bframes[-1]
            if self.frames[-1] is bf:
                bf.term = "expect" if val == "return" else "after"
                bf.term_tok = i
                bf.term_kind = val

    def _operator(self, i: int, tok: Token) -> None:
        val = tok.value
        if val in _OPEN_BRACKETS:
            self.frames.append(_Frame(val))
        elif val in (")", "]", "}"):
            top = self.frames[-1]
            if top.is_bracket and _OPEN_BRACKETS.get(top.kind) == val:
                self.frames.pop()
                if val == "]" and _is_op(self._tok(i + 1), "("):
                    literal = top.ntok == 1 and top.first_kind in (STRING, NUMBER)
                    if not literal:
                        self.file.dynamic = True
            elif top.is_bracket:
                # mismatched bracket: drop frames until one matches
                for k in range(len(self.frames) - 1, 0, -1):
                    fr = self.frames[k]
                    if fr.is_bracket and _OPEN_BRACKETS.get(fr.kind) == val:
                        del self.frames[k:]
                        break
                    if not fr.is_bracket:
                        break

    def _libs_and_dynamic(self, i: int, tok: Token) -> None:
        val = tok.value
        prev = self._tok(i - 1)
        member = _is_op(prev, ".") or _is_op(prev, ":")
        if val == "LibStub" and not member:
            self._note_libstub(i)
        elif val == "_G" and not member and _is_op(self._tok(i + 1), "["):
            key = self._tok(i + 2)
            if key is not None and key.kind == STRING and _is_op(self._tok(i + 3), "]"):
                self.file.dispatch_strings.add(key.value)
            else:
                self.file.dynamic = True
        elif val in DYNAMIC_NAMES and not member:
            self.file.dynamic = True
        if val == "L":
            self._note_locale(i)

    def _name(self, i: int, tok: Token) -> None:
        f = self.file
        val = tok.value
        prev = self._tok(i - 1)
        nxt = self._tok(i + 1)
        member = _is_op(prev, ".") or _is_op(prev, ":")
        top = self.frames[-1]

        if _is_op(nxt, "="):
            if top.kind == "{" and (
                prev is None or (prev.kind == OP and prev.value in ("{", ",", ";"))
            ):
                return  # table constructor key
            if top.kind not in ("(", "["):
                return  # assignment target (a write, not a reference)

        if member:
            if (
                _is_op(prev, ".")
                and i >= 2
                and self.tokens[i - 2].kind == NAME
                and (self.tokens[i - 2].value == "_G")
            ):
                f.reads.setdefault(val, []).append(i)
            else:
                f.member_refs[val] += 1
        else:
            f.reads.setdefault(val, []).append(i)

        if nxt is not None and (
            _is_op(nxt, "(") or nxt.kind == STRING or _is_op(nxt, "{")
        ):
            self._note_call(i, tok, prev, member)


def tokens_str(tok: Optional[Token]) -> Optional[str]:
    """Return the string body of ``tok`` if it is an identifier-shaped string."""
    if tok is not None and tok.kind == STRING and IDENT_STRING.match(tok.value):
        return tok.value
    return None


def parse_lua(source: str) -> LuaFile:
    """Tokenize and walk ``source``."""
    return _Walker(source).walk()
