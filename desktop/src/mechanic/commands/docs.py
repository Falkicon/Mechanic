"""
Documentation generation commands.

Generates CLI reference documentation from registered AFD commands.
"""

from afd import CommandResult, success, error
from afd.core.metadata import create_source
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
        default=None,
        description="Output file path. Defaults to docs/cli-reference.md"
    )
    format: str = Field(
        default="markdown",
        description="Output format: 'markdown' or 'json'"
    )


class DocsGenerateOutput(BaseModel):
    path: str
    command_count: int
    categories: List[str]


# ═══════════════════════════════════════════════════════════════════════════════
# HELPERS
# ═══════════════════════════════════════════════════════════════════════════════

def get_param_fields(parameters) -> List[dict]:
    """Extract field information from CommandParameter list."""
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


def generate_markdown(commands: List[dict], server_name: str, server_version: str) -> str:
    """Generate markdown documentation from command list."""
    
    # Group by category
    by_category = {}
    for cmd in commands:
        cat = categorize_command(cmd["name"])
        if cat not in by_category:
            by_category[cat] = []
        by_category[cat].append(cmd)
    
    # Sort categories
    category_order = ["Core", "Development", "Release", "Localization", "Environment", "Tools", "Documentation", "Other"]
    sorted_categories = sorted(by_category.keys(), key=lambda c: category_order.index(c) if c in category_order else 99)
    
    lines = [
        "# CLI Reference",
        "",
        f"> Auto-generated from `{server_name}` v{server_version} on {datetime.now().strftime('%Y-%m-%d')}",
        "",
        "This document lists all available Mechanic CLI commands with their inputs and outputs.",
        "",
        "## Quick Reference",
        "",
        "| Command | Description |",
        "|---------|-------------|",
    ]
    
    # Quick reference table
    for cat in sorted_categories:
        for cmd in sorted(by_category[cat], key=lambda c: c["name"]):
            desc = cmd['description'] or "No description"
            lines.append(f"| `{cmd['name']}` | {desc[:60]}{'...' if len(desc) > 60 else ''} |")
    
    lines.extend(["", "---", ""])
    
    # Detailed sections by category
    for cat in sorted_categories:
        lines.extend([f"## {cat} Commands", ""])
        
        for cmd in sorted(by_category[cat], key=lambda c: c["name"]):
            lines.extend([
                f"### `{cmd['name']}`",
                "",
                cmd["description"] or "No description available.",
                "",
            ])
            
            # Input parameters
            if cmd["parameters"]:
                lines.extend([
                    "**Parameters:**",
                    "",
                    "| Field | Type | Required | Description |",
                    "|-------|------|----------|-------------|",
                ])
                for field in cmd["parameters"]:
                    req = "Yes" if field["required"] else f"No (default: `{field['default']}`)"
                    lines.append(f"| `{field['name']}` | `{field['type']}` | {req} | {field['description']} |")
                lines.append("")
            else:
                lines.extend(["**Parameters:** None", ""])
            
            # Example
            lines.extend([
                "**Example:**",
                "",
                "```bash",
            ])

            # Build example: use short form when no params, call form when params needed
            if cmd["parameters"]:
                example_input = {}
                for field in cmd["parameters"]:
                    if field["required"]:
                        example_input[field["name"]] = f"<{field['name']}>"
                if example_input:
                    # Required params: must use 'call' with -i
                    lines.append(f"mech call {cmd['name']} -i '{json.dumps(example_input)}'")
                else:
                    # Optional params only: use short form
                    lines.append(f"mech {cmd['name']}")
            else:
                # No params: use short form
                lines.append(f"mech {cmd['name']}")
            
            lines.extend(["```", "", "---", ""])
    
    # Footer
    lines.extend([
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
        "# Standard call with input",
        "mech call <command> -i '{\"param\": \"value\"}'",
        "",
        "# Shorthand for common commands",
        "mech addon.output  # Direct command shortcut",
        "```",
        "",
        "---",
        "",
        "<p align=\"center\">",
        "  <em>Generated by <code>mech call docs.generate</code></em>",
        "</p>",
    ])
    
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
    async def generate_docs(input: DocsGenerateInput, context: Any = None) -> CommandResult[DocsGenerateOutput]:
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
            # Extract command metadata from CommandDefinition
            cmd_data = {
                "name": cmd_def.name,
                "description": cmd_def.description or "",
                "parameters": get_param_fields(cmd_def.parameters),
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
                server_name=getattr(server, 'name', 'mechanic-desktop'),
                server_version=getattr(server, 'version', '0.1.0')
            )
        
        # Write file
        output_path.write_text(content, encoding="utf-8")
        
        return success(
            data=DocsGenerateOutput(
                path=str(output_path),
                command_count=len(commands),
                categories=sorted(list(categories))
            ),
            reasoning=f"Generated documentation for {len(commands)} commands across {len(categories)} categories",
            sources=[create_source(
                type="file",
                id=str(output_path),
                title=f"CLI Reference: {output_path.name}"
            )]
        )
