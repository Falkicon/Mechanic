#!/usr/bin/env python3
"""Generate `.agent/` (Antigravity layout) from the canonical `.claude/` content.

    python .claude/sync_ide.py          # regenerate .agent/
    python .claude/sync_ide.py --check  # exit 1 when .agent/ differs from the source

`.claude/` is canonical; never edit the generated files. Mapping:

    .claude/skills/**                 -> .agent/skills/**      (all skills, including using-mechanic)
    .claude/commands/c-<name>.md      -> .agent/workflows/<name>.md  (+ `description:` frontmatter)
    .claude/skills/k-ecosystem/SKILL.md -> .agent/rules/ecosystem.md (always-loaded context)

Relative links are re-resolved for the new location, so links into the repository
(`../../../docs/...`) and between skills, workflows and rules keep working.
`.agent/AGENTS.md` is hand-written and is not touched. The generated directories are
cleared first, so deleted or renamed sources do not leave orphans behind.
"""

import argparse
import os
import re
import shutil
import sys
from pathlib import Path

ROOT = Path(__file__).resolve().parent.parent
CLAUDE = ROOT / ".claude"
AGENT = ROOT / ".agent"
SKILLS_SRC = CLAUDE / "skills"
COMMANDS_SRC = CLAUDE / "commands"
ECOSYSTEM_SRC = SKILLS_SRC / "k-ecosystem" / "SKILL.md"
GENERATED = (AGENT / "skills", AGENT / "workflows", AGENT / "rules" / "ecosystem.md")

LINK = re.compile(r"\]\(([^)\s#]+)(#[^)\s]*)?\)")


def _map_target(path):
    """Where a `.claude` path lives in the generated tree; other paths are unchanged."""
    try:
        rel = path.relative_to(SKILLS_SRC)
        return AGENT / "skills" / rel
    except ValueError:
        pass
    try:
        rel = path.relative_to(COMMANDS_SRC)
        if rel.name.startswith("c-"):
            return AGENT / "workflows" / rel.name[2:]
    except ValueError:
        pass
    return path


def _rewrite_links(text, source_file, dest_file):
    def fix(match):
        link, anchor = match.group(1), match.group(2) or ""
        if re.match(r"^[a-z][a-z0-9+.-]*:", link) or link.startswith("/"):
            return match.group(0)
        resolved = (source_file.parent / link).resolve()
        if not resolved.exists():
            return match.group(0)  # placeholder or example link: keep as written
        new = _map_target(resolved)
        rel = os.path.relpath(new, dest_file.parent).replace(os.sep, "/")
        return f"]({rel}{anchor})"

    return LINK.sub(fix, text)


def _read(path):
    return path.read_text(encoding="utf-8").replace("\r\n", "\n")


def expected_tree():
    """Map of generated file -> bytes."""
    tree = {}
    for src in sorted(SKILLS_SRC.rglob("*")):
        if not src.is_file():
            continue
        dest = AGENT / "skills" / src.relative_to(SKILLS_SRC)
        if src.suffix == ".md":
            tree[dest] = _rewrite_links(_read(src), src, dest).encode("utf-8")
        else:
            tree[dest] = src.read_bytes()
    for src in sorted(COMMANDS_SRC.glob("c-*.md")):
        dest = AGENT / "workflows" / src.name[2:]
        content = _read(src)
        description = content.split("\n", 1)[0].strip()
        text = f"---\ndescription: {description}\n---\n\n{content}"
        tree[dest] = _rewrite_links(text, src, dest).encode("utf-8")
    rules = AGENT / "rules" / "ecosystem.md"
    tree[rules] = _rewrite_links(_read(ECOSYSTEM_SRC), ECOSYSTEM_SRC, rules).encode("utf-8")
    return tree


def actual_tree():
    found = {}
    for root in GENERATED:
        if root.is_file():
            found[root] = root.read_bytes().replace(b"\r\n", b"\n")
        elif root.is_dir():
            for path in root.rglob("*"):
                if path.is_file():
                    found[path] = path.read_bytes().replace(b"\r\n", b"\n")
    return found


def diff(expected, actual):
    """Human-readable differences; empty when the trees match."""
    problems = []
    for path in sorted(set(expected) | set(actual)):
        rel = path.relative_to(ROOT).as_posix()
        if path not in actual:
            problems.append(f"missing: {rel}")
        elif path not in expected:
            problems.append(f"orphan (no source): {rel}")
        elif expected[path] != actual[path].replace(b"\r\n", b"\n"):
            problems.append(f"differs: {rel}")
    return problems


def write(expected):
    for target in GENERATED:
        if target.is_dir():
            shutil.rmtree(target)
        elif target.exists():
            target.unlink()
    for path, data in expected.items():
        path.parent.mkdir(parents=True, exist_ok=True)
        path.write_bytes(data)


def main(argv=None):
    parser = argparse.ArgumentParser(description=__doc__.split("\n")[0])
    parser.add_argument("--check", action="store_true", help="fail when out of sync")
    args = parser.parse_args(argv)
    expected = expected_tree()
    if args.check:
        problems = diff(expected, actual_tree())
        if problems:
            print("\n".join(problems), file=sys.stderr)
            print(".agent/ is out of sync. Run: python .claude/sync_ide.py", file=sys.stderr)
            return 1
        print(f".agent/ is in sync ({len(expected)} generated files)")
        return 0
    write(expected)
    print(f"Synced .claude -> .agent ({len(expected)} files)")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
