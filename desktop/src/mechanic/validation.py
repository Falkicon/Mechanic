"""Input validation contract for every command transport.

The command registry reports any exception from a handler as
``COMMAND_EXECUTION_ERROR`` with the raw exception text.  Invalid input is a
caller mistake, not an execution failure, so it is checked before dispatch and
reported as ``VALIDATION_ERROR`` with one entry per offending field.
"""

from typing import Any

from afd import error
from afd.server.decorators import get_command_metadata
from pydantic import ValidationError


def validation_failure(name: str, exc: ValidationError):
    """Build an actionable VALIDATION_ERROR result from a pydantic error."""
    problems = [
        {
            "field": ".".join(str(part) for part in item["loc"]) or "(input)",
            "message": item["msg"],
            "type": item["type"],
        }
        for item in exc.errors(include_url=False, include_context=False)
    ]
    summary = "; ".join(f"{p['field']}: {p['message']}" for p in problems[:5])
    if len(problems) > 5:
        summary += f"; and {len(problems) - 5} more"
    return error(
        code="VALIDATION_ERROR",
        message=f"Invalid input for {name}: {summary}",
        suggestion="Fix the fields listed in error.details.errors; commands.list shows each command's input schema.",
        details={"errors": problems},
    )


def install_input_validation(server) -> None:
    """Wrap ``server.execute`` so invalid input yields VALIDATION_ERROR."""
    if getattr(server, "_input_validation_installed", False):
        return
    execute = server.execute

    async def validated_execute(name, input: Any, context=None):
        command = server.registry.get(name)
        metadata = get_command_metadata(command.handler) if command else None
        schema = metadata.input_schema if metadata else None
        if schema is not None and input is not None and not isinstance(input, schema):
            if not isinstance(input, dict):
                return error(
                    code="VALIDATION_ERROR",
                    message=f"Invalid input for {name}: expected a JSON object",
                    suggestion="Pass the command input as an object of named fields.",
                    details={
                        "errors": [
                            {
                                "field": "(input)",
                                "message": "expected an object",
                                "type": "dict_type",
                            }
                        ]
                    },
                )
            try:
                schema.model_validate(input)
            except ValidationError as exc:
                return validation_failure(name, exc)
        return await execute(name, input, context)

    server.execute = validated_execute
    server._input_validation_installed = True
