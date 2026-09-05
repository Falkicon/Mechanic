"""Focused tests for generated CLI reference examples."""

import json
import shlex

from mechanic.cli import main
from mechanic.commands.docs import build_command_example, generate_markdown
from mechanic.commands.docs import get_param_fields
from pydantic import BaseModel, Field


def test_schema_types_and_table_cells_preserve_nested_optional_inputs():
    class Target(BaseModel):
        profile: str

    class Input(BaseModel):
        target: Target | None = None
        filter: str = Field("*.lua|*.toc", description="Lua | TOC files")

    fields = get_param_fields([], Input)
    assert fields[0]["type"] == "object | null"
    output = generate_markdown(
        [{"name": "example", "description": "A | B", "parameters": fields}],
        "test",
        "1",
    )
    assert "object \\| null" in output
    assert "*.lua\\|*.toc" in output
    assert "Lua \\| TOC files" in output


def _parse_click_without_invoking(example: str) -> None:
    """Parse a generated command through Click without calling its callback."""
    args = shlex.split(example, comments=True)[1:]
    root_context = main.make_context("mech", args)
    protected_args = list(root_context._protected_args)
    assert protected_args, f"Click did not find a subcommand in: {example}"

    command_name = protected_args[0]
    command = main.get_command(root_context, command_name)
    assert command is not None, f"Unknown Click command in: {example}"

    command_args = protected_args[1:] + list(root_context.args)
    command.make_context(command_name, command_args)


def test_command_example_uses_declared_json_types():
    command = {
        "name": "typed.example",
        "parameters": [
            {"name": "text", "type": "string", "required": True},
            {"name": "count", "type": "number", "required": True},
            {"name": "enabled", "type": "boolean", "required": True},
            {"name": "items", "type": "array", "required": True},
            {"name": "options", "type": "object", "required": True},
        ],
    }

    example = build_command_example(command)
    args = shlex.split(example)[1:]
    payload = json.loads(args[2])

    assert args[:2] == ["call", "typed.example"]
    assert payload == {
        "text": "<text>",
        "count": 0,
        "enabled": True,
        "items": [],
        "options": {},
    }


def test_generated_examples_match_click_syntax_without_execution():
    commands = [
        {
            "name": "dashboard.metrics",
            "description": "Read metrics",
            "parameters": [],
        },
        {
            "name": "typed.example",
            "description": "Accept typed values",
            "parameters": [
                {"name": "count", "type": "number", "required": True},
                {"name": "enabled", "type": "boolean", "required": True},
                {"name": "items", "type": "array", "required": True},
            ],
        },
        {
            "name": "addon.output",
            "description": "Read addon output",
            "parameters": [
                {"name": "agent_mode", "type": "boolean", "required": False}
            ],
        },
    ]
    markdown = generate_markdown(commands, "mechanic-desktop", "0.2.1")
    examples = [line for line in markdown.splitlines() if line.startswith("mech ")]

    assert examples
    assert all(" -i " not in line for line in examples)
    assert "mech addon.output  # Direct command shortcut" in examples
    assert all(
        line.startswith("mech call ") or line.startswith("mech addon.output")
        for line in examples
    )

    for example in examples:
        _parse_click_without_invoking(example)
