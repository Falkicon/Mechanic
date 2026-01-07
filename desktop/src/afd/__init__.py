"""Agent-First Development (AFD) toolkit for Python.

AFD is a software development methodology where AI agents are treated as
first-class users from day one.

Example:
    >>> from afd import CommandResult, success, error
    >>> result = success(data={"id": "123"}, reasoning="Created successfully")
    >>> result.success
    True

Server Example:
    >>> from afd.server import create_server
    >>> from afd import success
    >>> from pydantic import BaseModel
    >>> 
    >>> server = create_server("my-app")
    >>> 
    >>> class GreetInput(BaseModel):
    ...     name: str
    >>> 
    >>> @server.command(name="greet", description="Greet someone")
    ... async def greet(input: GreetInput):
    ...     return success({"message": f"Hello, {input.name}!"})
"""

from afd.core.result import (
    CommandResult,
    ResultMetadata,
    success,
    failure,
    error,
    is_success,
    is_failure,
)
from afd.core.errors import (
    CommandError,
    ErrorCodes,
    create_error,
    validation_error,
    not_found_error,
    rate_limit_error,
    timeout_error,
    internal_error,
    wrap_error,
    is_command_error,
)
from afd.core.metadata import (
    Source,
    PlanStep,
    PlanStepStatus,
    Alternative,
    Warning,
    create_source,
    create_step,
    update_step_status,
    create_warning,
)

__version__ = "0.1.0"

__all__ = [
    # Version
    "__version__",
    # Result types
    "CommandResult",
    "ResultMetadata",
    "success",
    "failure",
    "error",
    "is_success",
    "is_failure",
    # Error types
    "CommandError",
    "ErrorCodes",
    "create_error",
    "validation_error",
    "not_found_error",
    "rate_limit_error",
    "timeout_error",
    "internal_error",
    "wrap_error",
    "is_command_error",
    # Metadata types
    "Source",
    "PlanStep",
    "PlanStepStatus",
    "Alternative",
    "Warning",
    "create_source",
    "create_step",
    "update_step_status",
    "create_warning",
]
