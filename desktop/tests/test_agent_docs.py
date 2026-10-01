"""Drift guards for the agent-facing documentation.

`.claude/` is canonical; the command reference and `.agent/` are generated from the
command registry and from `.claude/`. These tests fail when a generated file is stale,
when a command is missing from the AGENTS.md category table, and when skill front matter
or relative links break. Fix failures by running:

    python .claude/gen_command_reference.py
    python .claude/sync_ide.py
"""

import importlib.util
import re
from pathlib import Path

import pytest

ROOT = Path(__file__).resolve().parents[2]
CLAUDE = ROOT / ".claude"

pytestmark = pytest.mark.skipif(
    not (CLAUDE / "sync_ide.py").is_file(),
    reason="agent documentation tooling is only present in a source checkout",
)

REGENERATE = (
    "Run `python .claude/gen_command_reference.py` and `python .claude/sync_ide.py`."
)


def _load(name):
    spec = importlib.util.spec_from_file_location(name, CLAUDE / f"{name}.py")
    module = importlib.util.module_from_spec(spec)
    spec.loader.exec_module(module)
    return module


@pytest.fixture(scope="module")
def entries():
    return _load("gen_command_reference").load_entries()


def _text(path):
    return path.read_text(encoding="utf-8").replace("\r\n", "\n")


def test_command_reference_matches_registry(entries):
    gen = _load("gen_command_reference")
    expected = gen.render(entries)
    actual = _text(gen.TARGET)
    assert actual == expected, f"Command reference is stale. {REGENERATE}"


def test_command_reference_counts_and_mutation_flags(entries):
    text = _text(_load("gen_command_reference").TARGET)
    mutating = sum(1 for entry in entries if entry["mutation"])
    assert (
        f"{len(entries)} registered commands: {len(entries) - mutating} read-only, "
        f"{mutating} mutating."
    ) in text
    for entry in entries:
        kind = "mutating" if entry["mutation"] else "read-only"
        assert f"#### `{entry['name']}` ({kind})" in text, entry["name"]


def test_agents_md_category_table_lists_every_command(entries):
    text = _text(ROOT / "AGENTS.md")
    missing = []
    for entry in entries:
        name = entry["name"]
        group = re.split(r"[.-]", name, maxsplit=1)[0]
        if f"`{name}`" not in text and f"`{group}.*`" not in text:
            missing.append(name)
    assert not missing, f"AGENTS.md category table lacks: {missing}"
    assert f"{len(entries)} commands are registered" in text


def test_agent_mirror_is_in_sync():
    sync = _load("sync_ide")
    problems = sync.diff(sync.expected_tree(), sync.actual_tree())
    assert not problems, f".agent/ is out of sync ({REGENERATE}): {problems}"


def _front_matter(path):
    text = _text(path)
    match = re.match(r"^---\n(.*?)\n---\n", text, re.DOTALL)
    assert match, f"{path} has no front matter"
    fields = {}
    key = None
    for line in match.group(1).split("\n"):
        top = re.match(r"^([A-Za-z_-]+):\s*(.*)$", line)
        if top:
            key = top.group(1)
            fields[key] = top.group(2).strip().lstrip(">").strip()
        elif key:
            fields[key] = (fields[key] + " " + line.strip()).strip()
    return fields


@pytest.mark.parametrize("root", [CLAUDE / "skills", ROOT / ".agent" / "skills"])
def test_skill_front_matter(root):
    skills = sorted(path for path in root.iterdir() if path.is_dir())
    assert skills
    for directory in skills:
        skill = directory / "SKILL.md"
        assert skill.is_file(), f"{directory.name} has no SKILL.md"
        fields = _front_matter(skill)
        assert fields.get("name") == directory.name, directory.name
        assert re.fullmatch(r"[a-z0-9-]{1,64}", fields["name"]), directory.name
        description = fields.get("description", "")
        assert 40 <= len(description) <= 1024, (directory.name, len(description))
        assert "riggers:" in description or "Load" in description, directory.name


def test_command_and_skill_pairs():
    commands = {p.stem[2:] for p in (CLAUDE / "commands").glob("c-*.md")}
    action_skills = {
        p.name[2:] for p in (CLAUDE / "skills").iterdir() if p.name.startswith("s-")
    }
    assert action_skills <= commands, (
        f"s- skills without a command: {action_skills - commands}"
    )
    assert commands - action_skills <= {"review"}, commands - action_skills
    for command in (CLAUDE / "commands").glob("c-*.md"):
        assert command.stem[2:] == "review" or (
            f"../skills/s-{command.stem[2:]}/SKILL.md" in _text(command)
        ), command.name


_FENCE = re.compile(r"```.*?```", re.DOTALL)
_INLINE = re.compile(r"`[^`\n]*`")
_LINK = re.compile(r"\[[^\]]*\]\(([^)\s]+)\)")


def _markdown_files():
    files = [
        ROOT / "AGENTS.md",
        ROOT / "CLAUDE.md",
        ROOT / "Mechanic" / "AGENTS.md",
        ROOT / "_TemplateAddon" / "AGENTS.md",
    ]
    for base in (CLAUDE, ROOT / ".agent"):
        files += sorted(base.rglob("*.md"))
    return [path for path in files if path.is_file()]


def test_relative_links_resolve():
    broken = []
    for path in _markdown_files():
        text = _INLINE.sub("", _FENCE.sub("", _text(path)))
        for target in _LINK.findall(text):
            if re.match(r"^[a-z][a-z0-9+.-]*:", target) or target.startswith("#"):
                continue
            resolved = (path.parent / target.split("#", 1)[0]).resolve()
            if not resolved.exists():
                broken.append(f"{path.relative_to(ROOT).as_posix()} -> {target}")
    assert not broken, "broken relative links:\n" + "\n".join(broken)


def test_agent_instructions_do_not_regress():
    """Phrases that earlier audits found wrong must not come back."""
    patterns = {
        "CLI -i option (does not exist)": re.compile(r"mech call \S+ -i"),
        "dotted fencore tool names": re.compile(r"fencore\.(catalog|search|info)"),
        "stale MechanicLib API": re.compile(
            r"RegisterAddon|RegisterToolPanel|ReportMetric|MechanicLib:Print"
        ),
        "removed s-working skill": re.compile(r"s-working"),
        "recommended reload.trigger": re.compile(r"(?:call|use|run) `reload\.trigger`"),
    }
    allowed_context = ("older skill names", "does not exist", "There is no")
    offenders = []
    for path in _markdown_files():
        for number, line in enumerate(_text(path).splitlines(), 1):
            if any(marker in line for marker in allowed_context):
                continue
            for label, pattern in patterns.items():
                if pattern.search(line):
                    offenders.append(
                        f"{path.relative_to(ROOT).as_posix()}:{number} {label}"
                    )
    assert not offenders, "\n".join(offenders)
