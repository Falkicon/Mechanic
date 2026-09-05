"""
Documentation generation commands.

Generates CLI reference documentation from registered AFD commands.
"""

from afd import CommandResult, success
from afd.core.metadata import create_source
from afd.server.decorators import get_command_metadata
from pydantic import BaseModel, Field
from typing import Any, List, Optional
from pathlib import Path
from datetime import datetime
import json


# ═══════════════════════════════════════════════════════════════════════════════
# SCHEMAS
# ═══════════════════════════════════════════════════════════════════════════════


class DocsGenerateInput(BaseModel):
    output_path: Optional[str] = Field(
        default=None, description="Output file path. Defaults to docs/cli-reference.md"
    )
    format: str = Field(
        default="markdown", description="Output format: 'markdown' or 'json'"
    )


class DocsGenerateOutput(BaseModel):
    path: str
    command_count: int
    categories: List[str]


# ═══════════════════════════════════════════════════════════════════════════════
# HELPERS
# ═══════════════════════════════════════════════════════════════════════════════


def get_param_fields(parameters, input_schema=None) -> List[dict]:
    """Extract field information from CommandParameter list."""
    if input_schema is not None:
        schema = input_schema.model_json_schema()

        def type_name(prop):
            if "$ref" in prop:
                prop = schema.get("$defs", {}).get(
                    prop["$ref"].rsplit("/", 1)[-1], prop
                )
            if "anyOf" in prop:
                return " | ".join(type_name(item) for item in prop["anyOf"])
            return prop.get("type", "any")

        return [
            {
                "name": name,
                "type": type_name(prop),
                "required": name in schema.get("required", []),
                "description": prop.get("description", ""),
                "default": repr(prop["default"]) if "default" in prop else None,
            }
            for name, prop in schema.get("properties", {}).items()
        ]
    if not parameters:
        return []

    fields = []
    for param in parameters:
        field_data = {
            "name": param.name,
            "type": param.type or "any",
            "required": param.required,
            "description": param.description or "",
            "default": repr(param.default) if param.default is not None else None,
        }
        fields.append(field_data)

    return fields


def example_value(field: dict) -> Any:
    """Return a JSON value of the parameter's declared type for examples.

    Examples are syntax templates, so string values use an explicit placeholder
    while the other JSON types use values that remain that type after parsing.
    This keeps generated examples useful without pretending that placeholder
    values are real addon names or filesystem paths.
    """
    field_type = field.get("type", "any").split(" | ")[0]
    if field_type == "string":
        return f"<{field['name']}>"
    if field_type in ("number", "integer"):
        return 0
    if field_type == "boolean":
        return True
    if field_type == "array":
        return []
    if field_type == "object":
        return {}
    if field_type == "null":
        return None
    return f"<{field['name']}>"


def build_command_example(command: dict) -> str:
    """Build the CLI invocation shown for one registered command.

    ``mech call`` accepts the command name followed by one positional JSON
    argument.  ``addon.output`` is the one purpose-built shortcut exposed by
    the CLI; every other registered command uses the generic call form.
    """
    if command["name"] == "addon.output":
        return "mech addon.output"

    example_input = {
        field["name"]: example_value(field)
        for field in command.get("parameters", [])
        if field["required"]
    }
    args = json.dumps(example_input, separators=(",", ": "))
    return f"mech call {command['name']} '{args}'"


def categorize_command(name: str) -> str:
    """Determine category from command name prefix."""
    prefix = name.split(".")[0] if "." in name else name
    categories = {
        "sv": "Core",
        "reload": "Core",
        "server": "Core",
        "dashboard": "Core",
        "addon": "Development",
        "version": "Release",
        "changelog": "Release",
        "git": "Release",
        "locale": "Localization",
        "atlas": "Localization",
        "libs": "Environment",
        "tools": "Tools",
        "docs": "Documentation",
    }
    return categories.get(prefix, "Other")


def generate_markdown(
    commands: List[dict], server_name: str, server_version: str
) -> str:
    """Generate markdown documentation from command list."""

    # Group by category
    by_category = {}
    for cmd in commands:
        cat = categorize_command(cmd["name"])
        if cat not in by_category:
            by_category[cat] = []
        by_category[cat].append(cmd)

    # Sort categories
    category_order = [
        "Core",
        "Development",
        "Release",
        "Localization",
        "Environment",
        "Tools",
        "Documentation",
        "Other",
    ]
    sorted_categories = sorted(
        by_category.keys(),
        key=lambda c: category_order.index(c) if c in category_order else 99,
    )

    lines = [
        "# CLI Reference",
        "",
        f"> Auto-generated from `{server_name}` v{server_version} on {datetime.now().strftime('%Y-%m-%d')}",
        "",
        "This document lists all available Mechanic CLI commands and their input parameters.",
        "Examples are invocation templates: replace placeholders and supply valid values for your addon. Empty arrays/objects and numeric samples illustrate JSON types, not every command's validation rules. For complete schemas and mutation metadata, use `mech --json call commands.list`.",
        "",
        "## Quick Reference",
        "",
        "| Command | Description |",
        "|---------|-------------|",
    ]

    def table_cell(value):
        return str(value).replace("|", "\\|").replace("\n", " ")

    # Quick reference table
    for cat in sorted_categories:
        for cmd in sorted(by_category[cat], key=lambda c: c["name"]):
            desc = cmd["description"] or "No description"
            lines.append(
                f"| `{cmd['name']}` | {table_cell(desc[:60])}{'...' if len(desc) > 60 else ''} |"
            )

    lines.extend(["", "---", ""])

    # Detailed sections by category
    for cat in sorted_categories:
        lines.extend([f"## {cat} Commands", ""])

        for cmd in sorted(by_category[cat], key=lambda c: c["name"]):
            lines.extend(
                [
                    f"### `{cmd['name']}`",
                    "",
                    cmd["description"] or "No description available.",
                    "",
                ]
            )

            # Input parameters
            if cmd["parameters"]:
                lines.extend(
                    [
                        "**Parameters:**",
                        "",
                        "| Field | Type | Required | Description |",
                        "|-------|------|----------|-------------|",
                    ]
                )
                for field in cmd["parameters"]:
                    req = (
                        "Yes"
                        if field["required"]
                        else f"No (default: `{field.get('default')}`)"
                    )
                    lines.append(
                        f"| `{table_cell(field['name'])}` | `{table_cell(field['type'])}` | {table_cell(req)} | {table_cell(field.get('description', ''))} |"
                    )
                lines.append("")
            else:
                lines.extend(["**Parameters:** None", ""])

            # Example
            lines.extend(
                [
                    "**Example:**",
                    "",
                    "```bash",
                ]
            )

            lines.append(build_command_example(cmd))

            lines.extend(["```", "", "---", ""])

    # Footer
    lines.extend(
        [
            "## Usage Notes",
            "",
            "### Global Flags",
            "",
            "| Flag | Description |",
            "|------|-------------|",
            "| `--json` | Output raw JSON (for parsing) |",
            "| `--quiet` | Suppress non-essential output |",
            "| `--agent` | Smart compression for AI agents |",
            "",
            "### Calling Commands",
            "",
            "```bash",
            "# Standard call with JSON input",
            'mech call <command> \'{"param": "value"}\'',
            "",
            "# Standard call without input",
            "mech call <command> '{}'",
            "",
            "# The one dedicated shortcut",
            "mech addon.output  # Direct command shortcut",
            "```",
            "",
            "---",
            "",
            '<p align="center">',
            "  <em>Generated by <code>mech call docs.generate</code></em>",
            "</p>",
        ]
    )

    return "\n".join(lines)


# ═══════════════════════════════════════════════════════════════════════════════
# COMMANDS
# ═══════════════════════════════════════════════════════════════════════════════


def register_commands(server):
    """Register documentation commands with the server."""

    @server.command(
        name="docs.generate",
        description="Generate CLI reference documentation from registered commands",
        input_schema=DocsGenerateInput,
        output_schema=DocsGenerateOutput,
    )
    async def generate_docs(
        input: DocsGenerateInput, context: Any = None
    ) -> CommandResult[DocsGenerateOutput]:
        """Generate documentation from the server's command registry."""

        # Determine output path
        if input.output_path:
            output_path = Path(input.output_path)
        else:
            # Default to docs/cli-reference.md relative to project root
            # Find project root by going up from this file
            project_root = Path(__file__).parent.parent.parent.parent.parent
            output_path = project_root / "docs" / "cli-reference.md"

        # Ensure output directory exists
        output_path.parent.mkdir(parents=True, exist_ok=True)

        # Get all registered commands from the server's registry
        commands = []
        categories = set()

        # Use the proper AFD registry API
        cmd_definitions = server.registry.list()

        for cmd_def in cmd_definitions:
            metadata = get_command_metadata(cmd_def.handler)
            # Extract command metadata from CommandDefinition
            cmd_data = {
                "name": cmd_def.name,
                "description": cmd_def.description or "",
                "parameters": get_param_fields(
                    cmd_def.parameters, metadata.input_schema if metadata else None
                ),
            }

            commands.append(cmd_data)
            categories.add(categorize_command(cmd_def.name))

        # Sort commands by name
        commands.sort(key=lambda c: c["name"])

        # Generate output
        if input.format == "json":
            content = json.dumps(commands, indent=2)
            if not output_path.suffix == ".json":
                output_path = output_path.with_suffix(".json")
        else:
            content = generate_markdown(
                commands,
                server_name=getattr(server, "name", "mechanic-desktop"),
                server_version=getattr(server, "version", "0.1.0"),
            )

        # Write file
        output_path.write_text(content, encoding="utf-8")

        return success(
            data=DocsGenerateOutput(
                path=str(output_path),
                command_count=len(commands),
                categories=sorted(list(categories)),
            ),
            reasoning=f"Generated documentation for {len(commands)} commands across {len(categories)} categories",
            sources=[
                create_source(
                    type="file",
                    id=str(output_path),
                    title=f"CLI Reference: {output_path.name}",
                )
            ],
        )
