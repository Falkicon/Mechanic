"""
Lua 5.1 tokenizer.

Splits Lua source into names, keywords, strings, numbers and operators with
line/column tracking. Comments are returned separately so analyzers never see
code-looking text inside strings or comments (and vice versa). The tokenizer is
tolerant: unterminated strings and comments end at a line or file boundary
instead of raising, because analyzers run on work-in-progress addon code.
"""

import re
from dataclasses import dataclass
from typing import List, Tuple

KEYWORDS = frozenset(
    {
        "and",
        "break",
        "do",
        "else",
        "elseif",
        "end",
        "false",
        "for",
        "function",
        "if",
        "in",
        "local",
        "nil",
        "not",
        "or",
        "repeat",
        "return",
        "then",
        "true",
        "until",
        "while",
    }
)

BOM = chr(0xFEFF)
NEWLINE = chr(10)

# Token kinds
NAME = "name"
KEYWORD = "keyword"
STRING = "string"
NUMBER = "number"
OP = "op"


@dataclass(slots=True)
class Token:
    """A lexical token. ``value`` is the raw text, or the string body for strings."""

    kind: str
    value: str
    line: int
    col: int
    end_line: int = 0

    def is_op(self, value: str) -> bool:
        return self.kind == OP and self.value == value

    def is_kw(self, value: str) -> bool:
        return self.kind == KEYWORD and self.value == value


@dataclass(slots=True)
class Comment:
    """A comment. ``text`` excludes the leading dashes and any long brackets."""

    text: str
    line: int
    end_line: int
    is_block: bool
    trailing: bool = False  # True when code precedes it on the same line
    start: int = 0  # character offsets into the (BOM-stripped) source
    end: int = 0


_TOKEN_RE = re.compile(
    r"""
    (?P<ws>[ \t\r\f\v]+)
  | (?P<nl>\n)
  | (?P<lcomment_start>--\[(?P<lc_eq>=*)\[)
  | (?P<comment>--[^\n]*)
  | (?P<lstring_start>\[(?P<ls_eq>=*)\[)
  | (?P<name>[A-Za-z_][A-Za-z0-9_]*)
  | (?P<number>0[xX][0-9a-fA-F]*|(?:\d+\.?\d*|\.\d+)(?:[eE][+-]?\d+)?)
  | (?P<dq>"(?:[^"\\\n]|\\[\s\S])*(?:"|(?=\n)|\Z))
  | (?P<sq>'(?:[^'\\\n]|\\[\s\S])*(?:'|(?=\n)|\Z))
  | (?P<op>\.\.\.|\.\.|==|~=|<=|>=|.)
    """,
    re.VERBOSE,
)


def _long_bracket_end(source: str, start: int, level: int) -> Tuple[int, int]:
    """Return (body_end, next_pos) for a long bracket whose body begins at ``start``."""
    closer = "]" + "=" * level + "]"
    idx = source.find(closer, start)
    if idx < 0:
        return len(source), len(source)
    return idx, idx + len(closer)


def tokenize(source: str) -> Tuple[List[Token], List[Comment]]:
    """Tokenize Lua source into ``(tokens, comments)``."""
    if source.startswith(BOM):
        source = source[1:]

    tokens: List[Token] = []
    comments: List[Comment] = []
    pos = 0
    line = 1
    line_start = 0
    length = len(source)
    last_token_line = 0
    match = _TOKEN_RE.match

    while pos < length:
        m = match(source, pos)
        if m is None:  # pragma: no cover - the op alternative matches any char
            pos += 1
            continue
        kind = m.lastgroup
        end = m.end()

        if kind == "ws":
            pos = end
            continue
        if kind == "nl":
            line += 1
            pos = end
            line_start = pos
            continue

        col = pos - line_start + 1

        if kind in ("lc_eq", "lcomment_start"):
            level = len(m.group("lc_eq"))
            body_end, nxt = _long_bracket_end(source, end, level)
            text = source[end:body_end]
            newlines = source.count("\n", pos, nxt)
            comments.append(
                Comment(
                    text=text,
                    line=line,
                    end_line=line + newlines,
                    is_block=True,
                    trailing=last_token_line == line,
                    start=pos,
                    end=nxt,
                )
            )
            if newlines:
                line += newlines
                line_start = source.rfind("\n", pos, nxt) + 1
            pos = nxt
            continue
        if kind == "comment":
            comments.append(
                Comment(
                    text=source[pos + 2 : end],
                    line=line,
                    end_line=line,
                    is_block=False,
                    trailing=last_token_line == line,
                    start=pos,
                    end=end,
                )
            )
            pos = end
            continue
        if kind in ("ls_eq", "lstring_start"):
            level = len(m.group("ls_eq"))
            body_end, nxt = _long_bracket_end(source, end, level)
            newlines = source.count("\n", pos, nxt)
            tokens.append(
                Token(STRING, source[end:body_end], line, col, line + newlines)
            )
            last_token_line = line + newlines
            if newlines:
                line += newlines
                line_start = source.rfind("\n", pos, nxt) + 1
            pos = nxt
            continue

        text = m.group()
        if kind == "name":
            tok_kind = KEYWORD if text in KEYWORDS else NAME
            tokens.append(Token(tok_kind, text, line, col, line))
        elif kind == "number":
            tokens.append(Token(NUMBER, text, line, col, line))
        elif kind in ("dq", "sq"):
            body = text[1:-1] if len(text) > 1 and text[-1] == text[0] else text[1:]
            newlines = text.count("\n")
            tokens.append(Token(STRING, body, line, col, line + newlines))
            if newlines:  # backslash-newline continuation inside a string
                line += newlines
                line_start = source.rfind("\n", pos, end) + 1
        else:
            tokens.append(Token(OP, text, line, col, line))
        last_token_line = line
        pos = end

    return tokens, comments


def strip_comments(source: str) -> str:
    """Return ``source`` with comments blanked out (offsets and line numbers kept)."""
    if source.startswith(BOM):
        source = source[1:]
    _, comments = tokenize(source)
    if not comments:
        return source
    parts: List[str] = []
    pos = 0
    for c in comments:
        parts.append(source[pos : c.start])
        blanked = "".join(
            ch if ch == NEWLINE else " " for ch in source[c.start : c.end]
        )
        parts.append(blanked)
        pos = c.end
    parts.append(source[pos:])
    return "".join(parts)
