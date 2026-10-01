"""
API Definition commands for WoW addon development.
Parses Blizzard API documentation and generates APIDefs for Mechanic.

Pipeline: Blizzard_APIDocumentationGenerated -> api_database.json (api.populate)
-> Mechanic/UI/APIDefs/*.lua + APIDefs.xml (api.generate).  ``api.refresh`` runs
both and ``api.download`` fetches a FrameXML build from Townlong Yak first.
"""

import asyncio
import json
import os
import re
import shutil
import subprocess
import tempfile
import zipfile
from collections import defaultdict
from datetime import datetime
from pathlib import Path
from typing import Any, Dict, List, Optional, Tuple

import requests

from afd import CommandResult, success, error
from afd.core.metadata import create_source
from pydantic import BaseModel, Field

from ..config import get_config
from ..lua_strings import quote_lua_string
from ..pipeline_paths import find_lua_exe, get_apidefs_dir
from ..resources import resource_path


# Townlong Yak constants
TOWNLONG_YAK_BASE = "https://www.townlong-yak.com/framexml"
TOWNLONG_YAK_BUILDS = f"{TOWNLONG_YAK_BASE}/builds"

# Download hardening limits
MAX_DOWNLOAD_BYTES = 256 * 1024 * 1024
MAX_EXTRACTED_BYTES = 1024 * 1024 * 1024
MAX_ARCHIVE_MEMBERS = 50_000
BUILD_ID_RE = re.compile(r"^\d{3,9}$")
VERSION_RE = re.compile(r"^\d{1,3}(?:\.\d{1,6}){1,3}$")


# ═══════════════════════════════════════════════════════════════════════════════
# SCHEMAS
# ═══════════════════════════════════════════════════════════════════════════════


class APIPopulateInput(BaseModel):
    source_path: str = Field(..., description="Path to wow-ui-source repository root")
    output_path: Optional[str] = Field(
        default=None,
        description="Output path for api_database.json (defaults to data_dir)",
    )


class APIPopulateOutput(BaseModel):
    api_count: int = Field(..., description="Number of APIs parsed")
    category_counts: Dict[str, int] = Field(..., description="APIs per category")
    output_file: str = Field(..., description="Path to generated database file")
    wow_version: str = Field(..., description="WoW version detected from the source")
    skipped_files: List[str] = Field(
        default_factory=list,
        description="Documentation files that could not be parsed (with reason)",
    )


class APIGenerateInput(BaseModel):
    database_path: Optional[str] = Field(
        default=None, description="Path to api_database.json (defaults to data_dir)"
    )
    output_path: Optional[str] = Field(
        default=None,
        description=(
            "Output folder for APIDefs (defaults to the repository's "
            "Mechanic/UI/APIDefs). Must be named 'APIDefs' unless "
            "allow_any_output_dir is set."
        ),
    )
    allow_any_output_dir: bool = Field(
        default=False,
        description="Allow an output folder that is not named 'APIDefs'",
    )


class APIGenerateOutput(BaseModel):
    api_count: int = Field(..., description="Number of APIs generated")
    namespace_count: int = Field(..., description="Number of namespace files created")
    output_dir: str = Field(..., description="Path to generated APIDefs folder")
    files: List[str] = Field(..., description="List of generated files")


class APIRefreshInput(BaseModel):
    source_path: str = Field(
        ..., description="Path to wow-ui-source repository root or Townlong Yak extract"
    )
    output_path: Optional[str] = Field(
        default=None, description="APIDefs output folder (see api.generate)"
    )
    database_path: Optional[str] = Field(
        default=None, description="api_database.json location (defaults to data_dir)"
    )
    allow_any_output_dir: bool = Field(
        default=False,
        description="Allow an output folder that is not named 'APIDefs'",
    )


class APIRefreshOutput(BaseModel):
    api_count: int = Field(..., description="Total APIs processed")
    namespace_count: int = Field(..., description="Number of namespace files created")
    database_file: str = Field(..., description="Path to database file")
    apidefs_dir: str = Field(..., description="Path to APIDefs folder")


class APIDownloadInput(BaseModel):
    build_id: Optional[str] = Field(
        default=None,
        description="Build ID to download (digits only, e.g., '64889'). Required.",
    )
    output_path: Optional[str] = Field(
        default=None,
        description="Where to extract the download. Defaults to <data_dir>/framexml/{version}",
    )
    refresh: bool = Field(default=True, description="Run api.refresh after download")


class APIDownloadOutput(BaseModel):
    build_id: str = Field(..., description="Downloaded build ID")
    version: str = Field(..., description="WoW version (e.g., '12.0.1.64889')")
    output_path: str = Field(..., description="Path where files were extracted")
    file_count: int = Field(..., description="Number of files extracted")
    api_count: Optional[int] = Field(
        default=None, description="Number of APIs if refresh was run"
    )


# ═══════════════════════════════════════════════════════════════════════════════
# CATEGORY DEFINITIONS
# ═══════════════════════════════════════════════════════════════════════════════

CATEGORIES = [
    {"key": "combat_midnight", "name": "Combat (Midnight)", "priority": 1},
    {"key": "general", "name": "General", "priority": 10},
    {"key": "unit", "name": "Unit & Player", "priority": 2},
    {"key": "spell", "name": "Spells & Abilities", "priority": 3},
    {"key": "item", "name": "Items & Inventory", "priority": 4},
    {"key": "ui", "name": "UI & Frames", "priority": 5},
    {"key": "map", "name": "Maps & Navigation", "priority": 6},
    {"key": "social", "name": "Social & Communication", "priority": 7},
    {"key": "achievement", "name": "Achievements & Progress", "priority": 8},
    {"key": "profession", "name": "Professions & Crafting", "priority": 9},
]

NAMESPACE_CATEGORY_MAP = {
    # Unit & Player
    "unit": "unit",
    "player": "unit",
    "party": "unit",
    "raid": "unit",
    "aura": "unit",
    "buff": "unit",
    "casting": "unit",
    "health": "unit",
    # Spells & Abilities
    "spell": "spell",
    "talent": "spell",
    "spellbook": "spell",
    "actionbar": "spell",
    "cooldown": "spell",
    "gcd": "spell",
    # Items & Inventory
    "item": "item",
    "container": "item",
    "bag": "item",
    "equipment": "item",
    "loot": "item",
    "currency": "item",
    "bank": "item",
    "inventory": "item",
    # UI & Frames
    "frame": "ui",
    "widget": "ui",
    "tooltip": "ui",
    "editmode": "ui",
    "settings": "ui",
    "colorpicker": "ui",
    # Maps & Navigation
    "map": "map",
    "minimap": "map",
    "worldmap": "map",
    "taxi": "map",
    "areapoi": "map",
    "vignette": "map",
    "navigation": "map",
    "fogofwar": "map",
    # Social & Communication
    "chat": "social",
    "guild": "social",
    "friend": "social",
    "club": "social",
    "battlenet": "social",
    "voicechat": "social",
    "mail": "social",
    # Achievements & Progress
    "achievement": "achievement",
    "quest": "achievement",
    "reputation": "achievement",
    "majorfaction": "achievement",
    "campaign": "achievement",
    # Professions & Crafting
    "tradeskill": "profession",
    "crafting": "profession",
    "profession": "profession",
    "recipe": "profession",
}

# Namespaces that are internal to Blizzard and not useful as public API defs.
SKIP_NAMESPACE_KEYWORDS = (
    "Internal",
    "Secure",
    "Debug",
    "LiveEvent",
    "MacOptions",
    "ConfigurationWarnings",
)

# Only SecretArguments = "NotAllowed" means the function rejects secret
# arguments outright; "AllowedWhenUntainted"/"AllowedWhenTainted" accept them.
SECRET_ARGUMENTS_RESTRICTED = "NotAllowed"


# ═══════════════════════════════════════════════════════════════════════════════
# PURE-PYTHON LUA TABLE PARSER (fallback when no Lua executable is available)
# ═══════════════════════════════════════════════════════════════════════════════


class LuaParseError(ValueError):
    """Raised when a documentation file is not a plain Lua table literal."""


_TOKEN_RE = re.compile(
    r"""
    (?P<ws>\s+)
  | (?P<comment>--(?:\[(?P<ceq>=*)\[.*?\](?P=ceq)\]|[^\n]*))
  | (?P<longstr>\[(?P<leq>=*)\[.*?\](?P=leq)\])
  | (?P<str>"(?:\\.|[^"\\\n])*"|'(?:\\.|[^'\\\n])*')
  | (?P<num>-?(?:0[xX][0-9a-fA-F]+|\d+\.?\d*(?:[eE][+-]?\d+)?|\.\d+(?:[eE][+-]?\d+)?))
  | (?P<name>[A-Za-z_][A-Za-z0-9_]*)
  | (?P<punct>[{}=,;\[\]:().+\-*/%^#<>~])
    """,
    re.VERBOSE | re.DOTALL,
)

_ESCAPES = {
    "n": "\n",
    "t": "\t",
    "r": "\r",
    "a": "\a",
    "b": "\b",
    "f": "\f",
    "v": "\v",
    "\\": "\\",
    '"': '"',
    "'": "'",
    "\n": "\n",
}


def _unescape_lua_string(body: str) -> str:
    def repl(match: "re.Match[str]") -> str:
        text = match.group(1)
        if text.isdigit():
            return chr(int(text))
        return _ESCAPES.get(text, text)

    return re.sub(r"\\(\d{1,3}|.)", repl, body, flags=re.DOTALL)


def _tokenize_lua(content: str) -> List[Tuple[str, Any]]:
    tokens: List[Tuple[str, Any]] = []
    pos = 0
    end = len(content)
    match_at = _TOKEN_RE.match
    while pos < end:
        match = match_at(content, pos)
        if not match:
            raise LuaParseError(
                f"Unexpected character {content[pos]!r} at offset {pos}"
            )
        pos = match.end()
        kind = match.lastgroup
        if kind in ("ws", "comment"):
            continue
        text = match.group(0)
        if kind == "punct" or kind == "name":
            tokens.append((kind, text))
        elif kind == "str":
            tokens.append(("str", _unescape_lua_string(text[1:-1])))
        elif kind == "longstr":
            level = len(match.group("leq"))
            tokens.append(("str", text[level + 2 : -(level + 2)]))
        elif kind == "num":
            try:
                if re.search(r"0[xX]", text):
                    value: Any = int(text, 16)
                elif re.search(r"[.eE]", text):
                    value = float(text)
                else:
                    value = int(text)
            except ValueError as exc:
                raise LuaParseError(f"Bad number {text!r}") from exc
            tokens.append(("num", value))
        else:  # pragma: no cover - the regex alternatives are exhaustive
            raise LuaParseError(f"Unhandled token kind {kind}")
    return tokens


class _TableParser:
    def __init__(self, tokens: List[Tuple[str, Any]], pos: int):
        self.tokens = tokens
        self.pos = pos

    def _peek(self) -> Optional[Tuple[str, Any]]:
        return self.tokens[self.pos] if self.pos < len(self.tokens) else None

    def _expect(self, value: str) -> None:
        token = self._peek()
        if token != ("punct", value):
            raise LuaParseError(f"Expected {value!r}, found {token!r}")
        self.pos += 1

    def _skip_expression(self) -> str:
        """Consume an expression we cannot evaluate (e.g. Enum.X.Y); keep its text."""
        depth = 0
        parts: List[str] = []
        while True:
            token = self._peek()
            if token is None:
                raise LuaParseError("Unterminated expression")
            if depth == 0 and token in (
                ("punct", ","),
                ("punct", ";"),
                ("punct", "}"),
            ):
                return "expr:" + "".join(parts)
            if token[0] == "punct" and token[1] in "([{":
                depth += 1
            elif token[0] == "punct" and token[1] in ")]}":
                depth -= 1
            parts.append(str(token[1]))
            self.pos += 1

    def parse_value(self) -> Any:
        token = self._peek()
        if token is None:
            raise LuaParseError("Unexpected end of file")
        kind, value = token
        if kind == "name" and value in ("true", "false", "nil"):
            self.pos += 1
            result: Any = {"true": True, "false": False, "nil": None}[value]
        elif kind in ("str", "num"):
            self.pos += 1
            result = value
        elif token == ("punct", "{"):
            return self.parse_table()
        else:
            return self._skip_expression()
        following = self._peek()
        if (
            following is not None
            and following[0] == "punct"
            and following[1] in "+-*/%^."
        ):
            return self._skip_expression()
        return result

    def parse_table(self) -> Any:
        self._expect("{")
        positional: List[Any] = []
        keyed: Dict[Any, Any] = {}
        while True:
            token = self._peek()
            if token is None:
                raise LuaParseError("Unterminated table")
            if token == ("punct", "}"):
                self.pos += 1
                break
            if token[0] == "name" and self.tokens[self.pos + 1 : self.pos + 2] == [
                ("punct", "=")
            ]:
                self.pos += 2
                keyed[token[1]] = self.parse_value()
            elif token == ("punct", "["):
                self.pos += 1
                key = self.parse_value()
                self._expect("]")
                self._expect("=")
                keyed[key] = self.parse_value()
            else:
                positional.append(self.parse_value())
            sep = self._peek()
            if sep in (("punct", ","), ("punct", ";")):
                self.pos += 1
        if keyed:
            for index, item in enumerate(positional, start=1):
                keyed[index] = item
            return keyed
        return positional


def parse_lua_table_literal(content: str) -> Any:
    """Parse the first top-level table constructor in a Lua source file."""
    tokens = _tokenize_lua(content)
    for index, token in enumerate(tokens):
        if token == ("punct", "{"):
            return _TableParser(tokens, index).parse_table()
    raise LuaParseError("No table constructor found")


def _parse_lua_table_python(file_path: Path) -> Optional[Dict]:
    """Parse a Blizzard documentation file without Lua; raises LuaParseError."""
    content = file_path.read_text(encoding="utf-8", errors="replace")
    data = parse_lua_table_literal(content)
    return data if isinstance(data, dict) else None


# ═══════════════════════════════════════════════════════════════════════════════
# HELPER FUNCTIONS
# ═══════════════════════════════════════════════════════════════════════════════


def _get_lua_exe() -> Optional[Path]:
    """Find a Lua executable for parsing documentation files."""
    return find_lua_exe()


def _get_lua_dumper() -> Path:
    """Get path to the packaged lua_dumper.lua script."""
    return resource_path("lua_dumper.lua")


def _get_default_database_path() -> Path:
    """Get default path for api_database.json."""
    config = get_config()
    return config.data_dir / "api_database.json"


def _get_default_apidefs_path() -> Optional[Path]:
    """Default APIDefs output: the repository's Mechanic/UI/APIDefs."""
    return get_apidefs_dir()


def _determine_category(namespace: str, impact: str) -> str:
    """Determine category based on namespace and impact level."""
    if impact != "NORMAL":
        return "combat_midnight"

    ns_lower = namespace.lower() if namespace else ""
    for keyword, cat in NAMESPACE_CATEGORY_MAP.items():
        if keyword in ns_lower:
            return cat
    return "general"


def _literal_default(value: Any) -> Any:
    """Drop defaults the pure-Python parser could not evaluate (Lua yields nil)."""
    if isinstance(value, str) and value.startswith("expr:"):
        return None
    return value


def _classify_impact(func: Dict[str, Any]) -> str:
    """Midnight impact for one documented function."""
    if func.get("SecretReturns") is True:
        return "HIGH"
    conditional = any(
        key.startswith("Secret")
        and key not in ("SecretArguments", "SecretReturns")
        and value
        for key, value in func.items()
    )
    if conditional:
        return "CONDITIONAL"
    if func.get("SecretArguments") == SECRET_ARGUMENTS_RESTRICTED:
        return "RESTRICTED"
    return "NORMAL"


def _detect_wow_version(source_path: Path, doc_dir: Path) -> str:
    """Read the client version from version.txt or the extract folder name."""
    candidates = [doc_dir, *doc_dir.parents[:4], source_path]
    for folder in candidates:
        version_file = folder / "version.txt"
        if version_file.is_file():
            text = version_file.read_text(encoding="utf-8", errors="replace").strip()
            if VERSION_RE.match(text):
                return text
    for name in (source_path.name, doc_dir.parent.name):
        if VERSION_RE.match(name):
            return name
    return "unknown"


def _parse_blizzard_file(
    lua_exe: Optional[Path], dumper_script: Optional[Path], file_path: Path
) -> Tuple[Optional[Dict], Optional[str]]:
    """
    Parse a single Blizzard documentation file.

    Uses the Lua dumper when a Lua executable exists, otherwise the pure-Python
    parser.  Returns ``(data, error)``; ``error`` is set when parsing failed.
    """
    if lua_exe and dumper_script and dumper_script.exists():
        try:
            result = subprocess.run(
                [str(lua_exe), str(dumper_script), str(file_path)],
                capture_output=True,
                text=True,
                encoding="utf-8",
                errors="replace",
                check=True,
                timeout=30,
            )
            if result.stdout.strip():
                return json.loads(result.stdout.strip()), None
            return None, None  # a constants-only file that registers no table
        except (subprocess.SubprocessError, OSError, ValueError):
            pass  # fall back to the Python parser

    try:
        return _parse_lua_table_python(file_path), None
    except (LuaParseError, OSError) as exc:
        return None, f"{file_path.name}: {exc}"


def _download_zip(url: str) -> Tuple[bytes, Dict[str, str]]:
    """Download a ZIP, refusing bodies larger than MAX_DOWNLOAD_BYTES."""
    with requests.get(url, stream=True, timeout=120) as response:
        response.raise_for_status()
        declared = response.headers.get("Content-Length", "")
        if declared.isdigit() and int(declared) > MAX_DOWNLOAD_BYTES:
            raise ValueError(f"Download is larger than {MAX_DOWNLOAD_BYTES} bytes")
        chunks: List[bytes] = []
        size = 0
        for chunk in response.iter_content(chunk_size=1024 * 1024):
            size += len(chunk)
            if size > MAX_DOWNLOAD_BYTES:
                raise ValueError(f"Download exceeded {MAX_DOWNLOAD_BYTES} bytes")
            chunks.append(chunk)
        return b"".join(chunks), dict(response.headers)


def _version_from_headers(headers: Dict[str, str], build_id: str) -> str:
    """Version from Content-Disposition, only when it looks like a version."""
    disposition = {k.lower(): v for k, v in headers.items()}.get(
        "content-disposition", ""
    )
    match = re.search(r"filename\*?=(?:UTF-8'')?\"?([^\";]+)", disposition)
    if match:
        filename = match.group(1).strip().replace("\\", "/").rsplit("/", 1)[-1]
        candidate = filename[:-4] if filename.lower().endswith(".zip") else filename
        if VERSION_RE.match(candidate):
            return candidate
    return f"build_{build_id}"


def _extract_zip_bytes(data: bytes, output_path: Path) -> int:
    """Extract ZIP bytes, containing every member and capping the total size."""
    import io

    output_root = output_path.resolve()
    with zipfile.ZipFile(io.BytesIO(data), "r") as archive:
        members = archive.infolist()
        if len(members) > MAX_ARCHIVE_MEMBERS:
            raise ValueError("Archive contains too many files")
        if sum(member.file_size for member in members) > MAX_EXTRACTED_BYTES:
            raise ValueError("Archive expands beyond the allowed size")
        for member in members:
            member_path = (output_root / member.filename).resolve()
            if member_path != output_root and output_root not in member_path.parents:
                raise ValueError(
                    f"Archive member escapes output directory: {member.filename}"
                )
        archive.extractall(output_root)
        return len(members)


def _extract_response_zip(response: requests.Response, output_path: Path) -> int:
    """Read and extract a downloaded ZIP response while containing every member."""
    try:
        return _extract_zip_bytes(response.content, output_path)
    finally:
        close = getattr(response, "close", None)
        if close:
            close()


def _lua_value(value: Any) -> str:
    """Encode a JSON value as a Lua literal."""
    if value is None:
        return "nil"
    if isinstance(value, bool):
        return "true" if value else "false"
    if isinstance(value, (int, float)):
        return repr(value)
    if isinstance(value, str):
        return quote_lua_string(value)
    return "nil"


def _generate_lua_params(params: List[Dict], examples: List[Dict] = None) -> str:
    """Generate Lua table string for parameters."""
    lua_params = []
    for p in params:
        default_val = p.get("default")
        if p.get("type") == "UnitToken" and default_val is None:
            default_val = "player"

        lua_params.append(
            f"{{ name = {quote_lua_string(str(p.get('name') or ''))}, "
            f"type = {quote_lua_string(str(p.get('type') or ''))}, "
            f"default = {_lua_value(default_val)} }}"
        )

    return "{ " + ", ".join(lua_params) + " }"


def _generate_lua_returns(returns: List[Dict], secret_flags: Dict) -> str:
    """Generate Lua table string for return values."""
    can_be_secret = "true" if secret_flags.get("SecretReturns") else "false"
    lua_rets = [
        f"{{ name = {quote_lua_string(str(r.get('name') or ''))}, "
        f"type = {quote_lua_string(str(r.get('type') or ''))}, "
        f"canBeSecret = {can_be_secret} }}"
        for r in returns
    ]
    return "{ " + ", ".join(lua_rets) + " }"


_RESERVED_FILENAMES = {"CON", "PRN", "AUX", "NUL", "APIDEFS"} | {
    f"{prefix}{n}" for prefix in ("COM", "LPT") for n in range(1, 10)
}


def _safe_namespace_filename(namespace: str) -> str:
    """File stem for a namespace: identifier characters only, no separators."""
    stem = re.sub(r"[^A-Za-z0-9_]", "_", namespace or "") or "Global"
    if stem.upper() in _RESERVED_FILENAMES:
        stem += "_ns"
    return stem


def _render_namespace_file(namespace: str, entries: List[Tuple[str, Dict]]) -> str:
    output = [
        f"-- Generated APIDefinitions for namespace: {_safe_namespace_filename(namespace)}",
        "local _, ns = ...",
        "local APIDefs = ns.APIDefinitions",
        "",
    ]
    for key, data in entries:
        subcat = (data.get("namespace") or "global").lower()
        flags = data.get("secretFlags", {})

        note = ""
        if flags:
            note_parts = [k if v is True else f"{k}={v}" for k, v in flags.items()]
            note = "Secret behavior: " + ", ".join(note_parts)

        impact = data.get("midnightImpact", "NORMAL")
        entry = f"APIDefs[{quote_lua_string(key)}] = {{\n"
        entry += f"    key = {quote_lua_string(key)},\n"
        entry += f"    name = {quote_lua_string(str(data.get('name') or key))},\n"
        entry += f"    category = {quote_lua_string(str(data.get('category') or 'general'))},\n"
        entry += f"    subcategory = {quote_lua_string(subcat)},\n"
        entry += f"    funcPath = {quote_lua_string(key)},\n"
        entry += f"    params = {_generate_lua_params(data.get('params', []))},\n"
        entry += (
            f"    returns = {_generate_lua_returns(data.get('returns', []), flags)},\n"
        )
        entry += f"    midnightImpact = {quote_lua_string(impact)},\n"
        if impact == "RESTRICTED":
            entry += "    protected = true,\n"
        if note:
            entry += f"    midnightNote = {quote_lua_string(note)},\n"
        entry += "}\n"
        output.append(entry)
    return "\n".join(output)


def _render_manifest(filenames: List[str]) -> str:
    lines = [
        '<Ui xmlns="http://www.blizzard.com/wow/ui/" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xsi:schemaLocation="http://www.blizzard.com/wow/ui/..\\FrameXML\\UI.xsd">'
    ]
    lines.extend(f'    <Script file="{name}"/>' for name in sorted(filenames))
    lines.append("</Ui>")
    return "\n".join(lines)


def _validate_output_dir(output_dir: Path, allow_any: bool) -> Optional[str]:
    """Return an error message when ``output_dir`` is not a safe APIDefs target."""
    resolved = output_dir.resolve()
    if resolved == Path(resolved.anchor) or resolved == Path.home().resolve():
        return f"Refusing to write generated files into {resolved}"
    if resolved.name.lower() != "apidefs" and not allow_any:
        return (
            f"Output folder '{resolved.name}' is not named 'APIDefs'; generation "
            "replaces every .lua/.xml file in it"
        )
    return None


def _write_generated_tree(
    ns_buckets: Dict[str, List[Tuple[str, Dict]]], output_dir: Path
) -> List[str]:
    """Render into a temp folder beside ``output_dir`` then replace generated files."""
    output_dir.parent.mkdir(parents=True, exist_ok=True)
    staging = Path(tempfile.mkdtemp(prefix=".apidefs-", dir=output_dir.parent))
    try:
        # Namespaces that sanitise to the same file name share one file.
        merged_buckets: Dict[str, List[Tuple[str, Dict]]] = defaultdict(list)
        for ns, entries in ns_buckets.items():
            merged_buckets[f"{_safe_namespace_filename(ns)}.lua"].extend(entries)
        rendered: Dict[str, str] = {}
        for filename, entries in merged_buckets.items():
            entries.sort(key=lambda item: item[0])
            rendered[filename] = _render_namespace_file(filename[:-4], entries)
        rendered["APIDefs.xml"] = _render_manifest(
            [name for name in rendered if name.endswith(".lua")]
        )
        for filename, text in rendered.items():
            (staging / filename).write_text(text, encoding="utf-8", newline="\n")

        output_dir.mkdir(parents=True, exist_ok=True)
        for old in output_dir.iterdir():
            if old.suffix in (".lua", ".xml") and old.name not in rendered:
                old.unlink()
        for filename in rendered:
            os.replace(staging / filename, output_dir / filename)
        return sorted(rendered)
    finally:
        shutil.rmtree(staging, ignore_errors=True)


# ═══════════════════════════════════════════════════════════════════════════════
# COMMAND IMPLEMENTATIONS
# ═══════════════════════════════════════════════════════════════════════════════


async def _api_populate(
    input: APIPopulateInput, context: Any = None
) -> CommandResult[APIPopulateOutput]:
    """
    Parse Blizzard API documentation and generate api_database.json.

    Supports wow-ui-source from GitHub or Townlong Yak FrameXML downloads.
    Uses the packaged Lua dumper when a Lua runtime is available, otherwise a
    pure-Python parser.
    """
    lua_exe = _get_lua_exe()
    dumper_script = _get_lua_dumper() if lua_exe else None

    source_path = Path(input.source_path)
    if not source_path.exists():
        return error(
            code="SOURCE_NOT_FOUND",
            message=f"Source path not found: {source_path}",
            suggestion="Clone wow-ui-source: git clone https://github.com/Gethe/wow-ui-source",
        )

    doc_dir = (
        source_path / "Interface" / "AddOns" / "Blizzard_APIDocumentationGenerated"
    )
    if not doc_dir.exists():
        doc_dir = source_path / "Blizzard_APIDocumentationGenerated"
        if not doc_dir.exists():
            return error(
                code="DOCS_NOT_FOUND",
                message="Blizzard_APIDocumentationGenerated folder not found",
                suggestion="Ensure source_path points to wow-ui-source root",
            )

    output_file = (
        Path(input.output_path) if input.output_path else _get_default_database_path()
    )
    output_file.parent.mkdir(parents=True, exist_ok=True)

    database = {
        "meta": {
            "generated": datetime.now().isoformat(),
            "sources": ["blizzard_doc"],
            "wow_version": _detect_wow_version(source_path, doc_dir),
        },
        "categories": CATEGORIES,
        "apis": {},
    }

    files = sorted(f for f in doc_dir.iterdir() if f.name.endswith("Documentation.lua"))
    skipped: List[str] = []

    for file_path in files:
        data, parse_error = await asyncio.to_thread(
            _parse_blizzard_file, lua_exe, dumper_script, file_path
        )
        if parse_error:
            skipped.append(parse_error)
        if not data or "Functions" not in data:
            continue

        if data.get("Type") == "ScriptObject":
            continue  # widget methods (Frame:SetPoint ...) are not global APIs

        namespace = data.get("Namespace", "")
        if namespace and any(kw in namespace for kw in SKIP_NAMESPACE_KEYWORDS):
            continue

        for func in data["Functions"]:
            name = func.get("Name")
            if not name:
                continue

            full_name = f"{namespace}.{name}" if namespace else name
            secret_flags = {k: v for k, v in func.items() if k.startswith("Secret")}
            impact = _classify_impact(func)
            category = _determine_category(namespace, impact)

            params = [
                {
                    "name": arg.get("Name"),
                    "type": arg.get("Type"),
                    "nilable": arg.get("Nilable", False),
                    "default": _literal_default(arg.get("Default")),
                }
                for arg in func.get("Arguments", [])
            ]
            returns = [
                {
                    "name": ret.get("Name"),
                    "type": ret.get("Type"),
                    "nilable": ret.get("Nilable", False),
                }
                for ret in func.get("Returns", [])
            ]

            database["apis"][full_name] = {
                "namespace": namespace,
                "name": name,
                "category": category,
                "params": params,
                "returns": returns,
                "secretFlags": secret_flags,
                "midnightImpact": impact,
                "documentation": func.get("Documentation", []),
                "examples": [],
            }

    with open(output_file, "w", encoding="utf-8") as f:
        json.dump(database, f, indent=2)

    category_counts: Dict[str, int] = defaultdict(int)
    for api in database["apis"].values():
        category_counts[api["category"]] += 1

    reasoning = (
        f"Parsed {len(files)} documentation files, generated "
        f"{len(database['apis'])} API entries"
    )
    if skipped:
        reasoning += f"; {len(skipped)} file(s) could not be parsed"

    return success(
        data=APIPopulateOutput(
            api_count=len(database["apis"]),
            category_counts=dict(category_counts),
            output_file=str(output_file),
            wow_version=database["meta"]["wow_version"],
            skipped_files=skipped,
        ),
        reasoning=reasoning,
        sources=[
            create_source(
                type="file", id="blizzard_docs", title="Blizzard API Documentation"
            )
        ],
    )


async def _api_generate(
    input: APIGenerateInput, context: Any = None
) -> CommandResult[APIGenerateOutput]:
    """
    Generate APIDefs Lua files from api_database.json.

    Creates individual namespace files and an XML manifest for Mechanic.  Files
    are built in a staging folder and only then replace the generated files.
    """
    db_path = (
        Path(input.database_path)
        if input.database_path
        else _get_default_database_path()
    )
    if not db_path.exists():
        return error(
            code="DATABASE_NOT_FOUND",
            message=f"api_database.json not found at {db_path}",
            suggestion="Run api.populate first to generate the database",
        )

    output_dir = (
        Path(input.output_path) if input.output_path else _get_default_apidefs_path()
    )
    if not output_dir:
        return error(
            code="OUTPUT_NOT_FOUND",
            message="Could not determine APIDefs output path",
            suggestion="Specify output_path or run from the Mechanic repository",
        )

    problem = _validate_output_dir(output_dir, input.allow_any_output_dir)
    if problem:
        return error(
            code="INVALID_OUTPUT_PATH",
            message=problem,
            suggestion="Point output_path at an 'APIDefs' folder or set allow_any_output_dir",
        )

    try:
        with open(db_path, "r", encoding="utf-8") as f:
            db = json.load(f)
    except (OSError, ValueError) as exc:
        return error(
            code="DATABASE_INVALID",
            message=f"Could not read {db_path}: {exc}",
            suggestion="Regenerate the database with api.populate",
        )

    apis = db.get("apis", {}) if isinstance(db, dict) else {}

    ns_buckets: Dict[str, List[Tuple[str, Dict]]] = defaultdict(list)
    for key, data in sorted(apis.items()):
        ns_buckets[data.get("namespace") or "Global"].append((key, data))

    try:
        generated_files = await asyncio.to_thread(
            _write_generated_tree, ns_buckets, output_dir
        )
    except OSError as exc:
        return error(
            code="WRITE_FAILED",
            message=f"Could not write APIDefs to {output_dir}: {exc}",
            suggestion="Check folder permissions; existing files were left in place",
        )

    return success(
        data=APIGenerateOutput(
            api_count=len(apis),
            namespace_count=len(generated_files) - 1,
            output_dir=str(output_dir),
            files=generated_files,
        ),
        reasoning=f"Generated {len(generated_files) - 1} namespace files with {len(apis)} APIs",
        sources=[create_source(type="file", id="api_database", title="API Database")],
    )


async def _api_refresh(
    input: APIRefreshInput, context: Any = None
) -> CommandResult[APIRefreshOutput]:
    """
    Full refresh: parse Blizzard docs and regenerate all APIDefs.

    Combines api.populate and api.generate into a single command.
    """
    populate_result = await _api_populate(
        APIPopulateInput(
            source_path=input.source_path, output_path=input.database_path
        ),
        context,
    )
    if not populate_result.success:
        return populate_result

    generate_result = await _api_generate(
        APIGenerateInput(
            database_path=populate_result.data.output_file,
            output_path=input.output_path,
            allow_any_output_dir=input.allow_any_output_dir,
        ),
        context,
    )
    if not generate_result.success:
        return generate_result

    return success(
        data=APIRefreshOutput(
            api_count=populate_result.data.api_count,
            namespace_count=generate_result.data.namespace_count,
            database_file=populate_result.data.output_file,
            apidefs_dir=generate_result.data.output_dir,
        ),
        reasoning=f"Full refresh complete: {populate_result.data.api_count} APIs in {generate_result.data.namespace_count} namespaces",
    )


async def _api_download(
    input: APIDownloadInput, context: Any = None
) -> CommandResult[APIDownloadOutput]:
    """
    Download FrameXML from Townlong Yak and optionally refresh API definitions.

    Downloads the FrameXML package for a build, extracts it under the Mechanic
    data folder, and can run api.refresh to update the API database.
    """
    config = get_config()

    build_id = input.build_id
    if not build_id:
        return error(
            code="BUILD_ID_REQUIRED",
            message="build_id is required (auto-detection not yet implemented)",
            suggestion="Check https://www.townlong-yak.com/framexml/builds for available builds",
        )
    if not BUILD_ID_RE.match(build_id):
        return error(
            code="INVALID_BUILD_ID",
            message=f"build_id must be 3-9 digits, got {build_id!r}",
            suggestion="Use a build number such as 64889",
        )

    download_url = f"{TOWNLONG_YAK_BASE}/{build_id}/get"

    try:
        payload, headers = await asyncio.to_thread(_download_zip, download_url)
    except (requests.exceptions.RequestException, ValueError) as e:
        return error(
            code="DOWNLOAD_FAILED",
            message=f"Failed to download from Townlong Yak: {str(e)}",
            suggestion="Check build ID and network connection",
        )

    version = _version_from_headers(headers, build_id)

    if input.output_path:
        output_path = Path(input.output_path)
    else:
        output_path = config.data_dir / "framexml" / version

    output_path.mkdir(parents=True, exist_ok=True)

    try:
        file_count = await asyncio.to_thread(_extract_zip_bytes, payload, output_path)
    except (zipfile.BadZipFile, ValueError, OSError) as e:
        return error(
            code="EXTRACT_FAILED",
            message=f"Failed to extract ZIP: {str(e)}",
            suggestion="The download may be corrupted, try again",
        )

    api_count = None
    if input.refresh:
        refresh_result = await _api_refresh(
            APIRefreshInput(source_path=str(output_path)), context
        )
        if refresh_result.success:
            api_count = refresh_result.data.api_count

    return success(
        data=APIDownloadOutput(
            build_id=build_id,
            version=version,
            output_path=str(output_path),
            file_count=file_count,
            api_count=api_count,
        ),
        reasoning=f"Downloaded {version} from Townlong Yak ({file_count} files)"
        + (f", refreshed {api_count} APIs" if api_count else ""),
        sources=[
            create_source(type="url", id=download_url, title="Townlong Yak FrameXML")
        ],
    )


# ═══════════════════════════════════════════════════════════════════════════════
# REGISTRATION
# ═══════════════════════════════════════════════════════════════════════════════


def register_commands(server):
    """Register API definition commands with the AFD server."""

    server.command(
        name="api.populate",
        description="Parse Blizzard API documentation and generate api_database.json",
        input_schema=APIPopulateInput,
        output_schema=APIPopulateOutput,
    )(_api_populate)

    server.command(
        name="api.generate",
        description=(
            "Generate APIDefs Lua files from api_database.json for Mechanic "
            "(defaults to the repository's Mechanic/UI/APIDefs)"
        ),
        input_schema=APIGenerateInput,
        output_schema=APIGenerateOutput,
    )(_api_generate)

    server.command(
        name="api.refresh",
        description="Full refresh: parse Blizzard docs and regenerate all APIDefs in one step",
        input_schema=APIRefreshInput,
        output_schema=APIRefreshOutput,
    )(_api_refresh)

    server.command(
        name="api.download",
        description="Download FrameXML from Townlong Yak and optionally refresh API definitions",
        input_schema=APIDownloadInput,
        output_schema=APIDownloadOutput,
    )(_api_download)
