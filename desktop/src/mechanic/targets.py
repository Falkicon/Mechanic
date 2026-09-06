"""Deterministic selection shared by diagnostic producers and consumers."""

import os
from pathlib import Path
from typing import Any, Optional

from afd import error
from pydantic import BaseModel, Field


class DiagnosticTarget(BaseModel):
    client: Optional[str] = Field(
        None, description="Absolute WoW client directory, such as /Games/WoW/_retail_"
    )
    account: Optional[str] = Field(
        None, description="Account directory name under WTF/Account"
    )
    character: Optional[str] = Field(
        None, description="Exact AceDB character key: Name - Realm"
    )
    profile: Optional[str] = Field(None, description="Exact AceDB profile name")


class SelectedTarget(DiagnosticTarget):
    sv_path: str = Field(..., description="Selected !Mechanic.lua SavedVariables file")
    addon_path: str = Field(
        ..., description="Installed !Mechanic directory for the selected client"
    )


class TargetError(ValueError):
    def __init__(self, code: str, message: str, candidates=()):
        super().__init__(message)
        self.code = code
        self.candidates = list(candidates)

    def result(self):
        return error(
            code=self.code,
            message=str(self),
            suggestion="Call diagnostic.targets and pass a matching target with client, account, character and profile.",
            details={"candidates": [c.model_dump() for c in self.candidates]},
        )


def validate_db(db: Any) -> dict:
    if not isinstance(db, dict):
        raise TargetError("TARGET_READ_ERROR", "MechanicDB must be a table.")
    for key in ("profiles", "profileKeys"):
        if key in db and not isinstance(db[key], dict):
            raise TargetError("TARGET_READ_ERROR", f"MechanicDB.{key} must be a table.")
    for profile, value in db.get("profiles", {}).items():
        if not isinstance(profile, str) or not isinstance(value, dict):
            raise TargetError(
                "TARGET_READ_ERROR",
                "Each profile must have a string name and table value.",
            )
    for character, profile in db.get("profileKeys", {}).items():
        if not isinstance(character, str) or not isinstance(profile, str):
            raise TargetError(
                "TARGET_READ_ERROR",
                "Character/profile mappings must contain string names.",
            )
    return db


def read_db(path: Path) -> dict:
    from .parsers import parse_savedvariables

    try:
        variables = parse_savedvariables(path.read_text(encoding="utf-8"))
        if "MechanicDB" not in variables:
            raise ValueError("MechanicDB is missing")
        return validate_db(variables["MechanicDB"])
    except TargetError:
        raise
    except Exception as exc:
        raise TargetError(
            "TARGET_READ_ERROR", f"Cannot read diagnostic target {path}: {exc}"
        ) from exc


def profile_candidates(db: dict) -> list[tuple[Optional[str], Optional[str]]]:
    profiles = db.get("profiles", {})
    if not profiles:
        return [(None, None)]
    pairs = []
    for character, profile in db.get("profileKeys", {}).items():
        if profile in profiles:
            pairs.append((character, profile))
    assigned = {profile for _, profile in pairs}
    pairs.extend((None, profile) for profile in profiles if profile not in assigned)
    return sorted(pairs, key=lambda item: (item[1] or "", item[0] or ""))


def targets_for_file(path: Path, db: Optional[dict] = None) -> list[SelectedTarget]:
    path = Path(path).absolute()
    db = read_db(path) if db is None else validate_db(db)
    sv = path.parent
    client = sv.parent.parent.parent.parent
    candidates = []
    for character, profile in profile_candidates(db):
        candidates.append(
            SelectedTarget(
                client=str(client),
                account=sv.parent.name,
                character=character,
                profile=profile,
                sv_path=str(path),
                addon_path=str(client / "Interface" / "AddOns" / "!Mechanic"),
            )
        )
    return candidates


def discover_targets() -> list[SelectedTarget]:
    from .config import discover_saved_variables

    candidates = []
    for directory in sorted(discover_saved_variables(), key=str):
        candidates.extend(targets_for_file(directory / "!Mechanic.lua"))
    return candidates


def canonical_client(value: str) -> str:
    return os.path.normcase(os.path.abspath(value))


def matches_target(candidate: SelectedTarget, selector: DiagnosticTarget) -> bool:
    for key in ("client", "account", "character", "profile"):
        value = getattr(selector, key)
        if value is None:
            continue
        actual = getattr(candidate, key)
        if key == "client":
            if actual is None or canonical_client(value) != canonical_client(actual):
                return False
        elif actual != value:
            return False
    return True


def select_target(
    target: Optional[DiagnosticTarget] = None, candidates=None
) -> SelectedTarget:
    candidates = discover_targets() if candidates is None else candidates
    selector = target or DiagnosticTarget()
    matches = [
        candidate for candidate in candidates if matches_target(candidate, selector)
    ]
    if len(matches) != 1:
        raise TargetError(
            "TARGET_AMBIGUOUS" if matches else "TARGET_NOT_FOUND",
            "Multiple diagnostic targets match; select one explicitly."
            if matches
            else "No diagnostic target matches.",
            matches or candidates,
        )
    return matches[0]


def read_profile(selected: SelectedTarget) -> dict:
    db = read_db(Path(selected.sv_path))
    if selected.profile is None:
        return db
    if selected.profile not in db.get("profiles", {}):
        raise TargetError(
            "TARGET_NOT_FOUND", f"Profile {selected.profile!r} no longer exists."
        )
    return db["profiles"][selected.profile]


def queue_target_lua(selected: SelectedTarget) -> str:
    from .lua_strings import quote_lua_string

    entries = []
    for key in ("client", "account", "character", "profile"):
        value = getattr(selected, key)
        if value is not None:
            entries.append(f"[{quote_lua_string(key)}] = {quote_lua_string(value)}")
    return "MECHANIC_DIAGNOSTIC_TARGET = {" + ", ".join(entries) + "}\n"
