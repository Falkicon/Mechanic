"""Guards for the in-game localization tables (Mechanic/Locales/*.lua).

AceLocale registers enUS as the default, reads missing keys as errors ("Missing entry"),
does not chain locales, and maps the enGB client to enUS. These tests keep the tables and
the first-party code that reads them consistent.
"""

import re
from pathlib import Path

import pytest

ROOT = Path(__file__).resolve().parents[2]
ADDON = ROOT / "Mechanic"
LOCALES = ADDON / "Locales"

KEY = r'"((?:[^"\\]|\\.)*)"'
ENTRY_RE = re.compile(r"^L\[" + KEY + r"\]\s*=", re.M)
VALUE_RE = re.compile(r"^L\[" + KEY + r"\]\s*=\s*" + KEY, re.M)
USE_RE = re.compile(r"\bL\[" + KEY + r"\]")
DYNAMIC_USE_RE = re.compile(r"\b_L\(" + KEY)
SPEC_RE = re.compile(r"%[-+ #0]*\d*(?:\.\d+)?[sdfxXqc%]")
NEW_LOCALE_RE = re.compile(r'NewLocale\("Mechanic",\s*"(\w+)"')
SKIPPED_DIRS = {"Libs", "Locales", "APIDefs", "assets", "assets_source"}

# AceLocale does not fall back from a regional locale to its parent, so these must be full copies.
REGIONAL_PARENTS = {"esMX": "esES", "ptPT": "ptBR"}


def read(path: Path) -> str:
    return path.read_text(encoding="utf-8")


def first_party_lua() -> list[Path]:
    files = []
    for root in (ADDON, ROOT / "!Mechanic"):
        for path in root.rglob("*.lua"):
            if not SKIPPED_DIRS.intersection(path.relative_to(root).parts):
                files.append(path)
    return files


def locale_files() -> dict[str, Path]:
    return {path.stem: path for path in sorted(LOCALES.glob("*.lua"))}


def locale_keys(path: Path) -> list[str]:
    return ENTRY_RE.findall(read(path))


def locale_values(path: Path) -> dict[str, str]:
    return dict(VALUE_RE.findall(read(path)))


def specifiers(text: str) -> list[str]:
    return [spec for spec in SPEC_RE.findall(text) if spec != "%%"]


def unescape(key: str) -> str:
    return key.replace('\\"', '"').replace("\\\\", "\\")


def test_every_locale_entry_is_parsed():
    """A statement the parser cannot read would silently escape every other check."""
    for name, path in locale_files().items():
        assert len(locale_keys(path)) == len(VALUE_RE.findall(read(path))), name


def test_locale_files_match_toc_and_register_their_own_code():
    toc = read(ADDON / "Mechanic.toc").replace("\\", "/")
    listed = set(re.findall(r"^Locales/(\w+)\.lua", toc, re.M))
    files = locale_files()
    assert listed == set(files), "TOC and Locales/ directory disagree"
    for name, path in files.items():
        text = read(path)
        match = NEW_LOCALE_RE.search(text)
        assert match and match.group(1) == name, (
            f"{name}.lua registers {match and match.group(1)}"
        )
        if name == "enUS":
            assert re.search(r'NewLocale\("Mechanic",\s*"enUS",\s*true\)', text)
        else:
            assert re.search(r"if not L then\s+return\s+end", text), (
                f"{name}.lua needs the nil-locale guard"
            )


def test_enGB_is_not_registered():
    """AceLocale maps the enGB game locale to enUS, so an enGB table can never load."""
    assert "enGB" not in locale_files()


@pytest.mark.parametrize("name", sorted(locale_files()))
def test_no_duplicate_keys(name):
    keys = locale_keys(locale_files()[name])
    assert [k for k in set(keys) if keys.count(k) > 1] == []


def test_every_key_used_in_code_exists_in_enUS():
    known = set(locale_keys(locale_files()["enUS"]))
    used = {}
    for path in first_party_lua():
        text = read(path)
        for key in USE_RE.findall(text) + DYNAMIC_USE_RE.findall(text):
            used.setdefault(key, path.relative_to(ROOT).as_posix())
    # A missing enUS key makes AceLocale raise "Missing entry" at runtime.
    missing = {key: where for key, where in used.items() if key not in known}
    assert missing == {}


@pytest.mark.parametrize("name", sorted(set(locale_files()) - {"enUS"}))
def test_translations_only_contain_enUS_keys(name):
    known = set(locale_keys(locale_files()["enUS"]))
    assert sorted(set(locale_keys(locale_files()[name])) - known) == []


@pytest.mark.parametrize("name", sorted(set(locale_files()) - {"enUS"}))
def test_format_specifiers_match_enUS(name):
    base = locale_values(locale_files()["enUS"])
    mismatched = {
        key: (specifiers(base[key]), specifiers(value))
        for key, value in locale_values(locale_files()[name]).items()
        if key in base and specifiers(base[key]) != specifiers(value)
    }
    assert mismatched == {}


def test_enUS_has_no_dead_keys():
    """Every key must still appear somewhere in first-party code (as an L[] key or default text)."""
    code = "\n".join(read(path) for path in first_party_lua())
    code += "\n".join(read(path) for path in (ROOT / "desktop" / "src").rglob("*.py"))
    dead = [
        key for key in locale_keys(locale_files()["enUS"]) if unescape(key) not in code
    ]
    assert dead == []


@pytest.mark.parametrize(("regional", "parent"), sorted(REGIONAL_PARENTS.items()))
def test_regional_locales_are_complete(regional, parent):
    files = locale_files()
    missing = set(locale_keys(files[parent])) - set(locale_keys(files[regional]))
    assert sorted(missing) == [], f"{regional} must carry every {parent} translation"
