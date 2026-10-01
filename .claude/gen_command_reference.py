#!/usr/bin/env python3
"""Generate the Mechanic command reference from the live command registry.

    python .claude/gen_command_reference.py          # rewrite the reference
    python .claude/gen_command_reference.py --check  # exit 1 when it is stale

The output is `.claude/skills/using-mechanic/references/afd-commands.md`. It is built
from the same data `commands.list` returns (names, mutation flags, descriptions and the
input/output JSON schemas), so it cannot drift from the code. `desktop/tests/
test_agent_docs.py` fails when the committed file differs from this script's output.

Needs the `mechanic-desktop` package importable (`pip install -e desktop`).
"""

import argparse
import asyncio
import json
import sys
from pathlib import Path

ROOT = Path(__file__).resolve().parent.parent
TARGET = ROOT / ".claude" / "skills" / "using-mechanic" / "references" / "afd-commands.md"

HEADER = """# Mechanic command reference

<!-- GENERATED FILE. Do not edit by hand.
     Regenerate: python .claude/gen_command_reference.py   (then python .claude/sync_ide.py)
     Source: the command registry (the data `commands.list` returns).
     Guard: desktop/tests/test_agent_docs.py fails when this file is stale. -->

@COUNT@ registered commands: @READ_ONLY@ read-only, @MUTATING@ mutating. The registry uses dotted
names (`addon.output`); the MCP adapter exposes the same commands with dashes
(`addon-output`). `fencore-*` commands are registered with dashes already. Protocol for
`target`, reload and previews: see [using-mechanic](../SKILL.md).

`Mutating` is the audited flag from `commands/catalog.py`: it covers persistent writes,
launched processes or UI, and code execution. Commands with a preview (`dry_run`) stay
mutating. Call `commands.list` for the full machine-readable JSON schemas.

`target` is the optional diagnostic target object `{client, account, character,
profile}` (all strings or null); take its values from `diagnostic.targets`.
"""


def load_entries():
    """Return the `commands.list` entries from the registered server."""
    from mechanic.commands.core import get_server

    result = asyncio.run(get_server().execute("commands.list", {}))
    if not result.success:
        raise SystemExit(f"commands.list failed: {result.error}")
    return [entry.model_dump() for entry in result.data.commands]


def _cell(text):
    return " ".join(str(text or "").split()).replace("|", "\\|")


def _resolve(schema, defs):
    ref = schema.get("$ref")
    if ref:
        return defs.get(ref.rsplit("/", 1)[-1], {}), ref.rsplit("/", 1)[-1]
    return schema, None


def _type(schema, defs):
    """Compact type text for a JSON-schema fragment."""
    if not schema:
        return "any"
    resolved, name = _resolve(schema, defs)
    if name:
        if name == "DiagnosticTarget":
            return "`target` object"
        return f"object ({name})"
    if "anyOf" in resolved:
        parts = [_type(part, defs) for part in resolved["anyOf"]]
        return " or ".join(dict.fromkeys(parts))
    if "enum" in resolved:
        return " / ".join(json.dumps(value) for value in resolved["enum"])
    kind = resolved.get("type")
    if kind == "array":
        return f"array of {_type(resolved.get('items', {}), defs)}"
    if kind == "object":
        extra = resolved.get("additionalProperties")
        if isinstance(extra, dict) and extra:
            return f"object of {_type(extra, defs)}"
        return "object"
    return kind or "any"


def _is_nullable(schema):
    return any(part.get("type") == "null" for part in schema.get("anyOf", []))


def _default(spec):
    if "default" not in spec:
        return ""
    value = spec["default"]
    if value is None:
        return "null"
    return f"`{json.dumps(value)}`"


def _inputs(schema):
    props = schema.get("properties", {})
    required = set(schema.get("required", []))
    defs = schema.get("$defs", {})
    rows = []
    for name, spec in props.items():
        text = _type(spec, defs)
        if _is_nullable(spec):
            text = text.replace(" or null", "")
        rows.append(
            (
                f"`{name}`",
                _cell(text),
                "yes" if name in required else "no",
                _default(spec),
                _cell(spec.get("description", "")),
            )
        )
    return rows


def _outputs(schema):
    names = list(schema.get("properties", {}))
    return ", ".join(f"`{name}`" for name in names) if names else "(none)"


def _group(name):
    for sep in (".", "-"):
        if sep in name:
            return name.split(sep, 1)[0]
    return name


def render(entries):
    entries = sorted(entries, key=lambda entry: entry["name"])
    mutating = sum(1 for entry in entries if entry["mutation"])
    lines = [
        HEADER.replace("@COUNT@", str(len(entries)))
        .replace("@READ_ONLY@", str(len(entries) - mutating))
        .replace("@MUTATING@", str(mutating))
        .rstrip(),
        "",
        "## Summary",
        "",
        "| Command | Mutating | Required inputs | Description |",
        "|---|---|---|---|",
    ]
    for entry in entries:
        required = entry["input_schema"].get("required", [])
        lines.append(
            "| `{}` | {} | {} | {} |".format(
                entry["name"],
                "yes" if entry["mutation"] else "no",
                ", ".join(f"`{name}`" for name in required) or "none",
                _cell(entry["description"]),
            )
        )

    groups = {}
    for entry in entries:
        groups.setdefault(_group(entry["name"]), []).append(entry)

    lines += ["", "## Commands by group"]
    for group, members in groups.items():
        lines += ["", f"### {group}"]
        for entry in members:
            lines += [
                "",
                "#### `{}` ({})".format(
                    entry["name"], "mutating" if entry["mutation"] else "read-only"
                ),
                "",
                _cell(entry["description"]),
                "",
            ]
            rows = _inputs(entry["input_schema"])
            if rows:
                lines += [
                    "| Input | Type | Required | Default | Description |",
                    "|---|---|---|---|---|",
                ]
                lines += ["| " + " | ".join(row) + " |" for row in rows]
            else:
                lines.append("Input: none.")
            lines += ["", "Output fields: " + _outputs(entry["output_schema"])]
    return "\n".join(lines) + "\n"


def main(argv=None):
    parser = argparse.ArgumentParser(description=__doc__.split("\n")[0])
    parser.add_argument("--check", action="store_true", help="fail when stale")
    args = parser.parse_args(argv)
    text = render(load_entries())
    current = TARGET.read_text(encoding="utf-8") if TARGET.exists() else ""
    if args.check:
        if current.replace("\r\n", "\n") != text:
            print(
                "Command reference is stale. Run: python .claude/gen_command_reference.py",
                file=sys.stderr,
            )
            return 1
        print(f"{TARGET.relative_to(ROOT)} is up to date")
        return 0
    TARGET.parent.mkdir(parents=True, exist_ok=True)
    TARGET.write_text(text, encoding="utf-8", newline="\n")
    print(f"wrote {TARGET.relative_to(ROOT)} ({len(text.splitlines())} lines)")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
