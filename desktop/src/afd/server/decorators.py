"""Command decorator for type-safe command definition.

The @define_command decorator provides a clean way to define commands
with full type safety and automatic schema generation.

Example:
    >>> from afd.server import define_command
    >>> from afd import success
    >>> from pydantic import BaseModel
    >>> 
    >>> class GreetInput(BaseModel):
    ...     name: str
    ...     
    >>> class GreetOutput(BaseModel):
    ...     message: str
    >>> 
    >>> @define_command(
    ...     name="greet",
    ...     description="Greet someone",
    ...     input_schema=GreetInput,
    ...     output_schema=GreetOutput,
    ... )
    ... async def greet(input: GreetInput) -> GreetOutput:
    ...     return success(GreetOutput(message=f"Hello, {input.name}!"))
"""

from dataclasses import dataclass, field
from functools import wraps
from typing import (
    Any,
    Awaitable,
    Callable,
    Dict,
    Generic,
    List,
    Optional,
    Type,
    TypeVar,
    Union,
    get_type_hints,
)

from pydantic import BaseModel

from afd.core.commands import CommandDefinition, CommandParameter
from afd.core.result import CommandResult

TInput = TypeVar("TInput", bound=BaseModel)
TOutput = TypeVar("TOutput")


@dataclass
class CommandMetadata:
    """Metadata for a decorated command.
    
    Attributes:
        name: Command name (e.g., "item.create").
        description: Human-readable description.
        input_schema: Pydantic model for input validation.
        output_schema: Pydantic model for output (optional).
        tags: Tags for categorization.
        mutation: Whether this command modifies state.
        examples: Example inputs for documentation.
    """
    
    name: str
    description: str
    input_schema: Optional[Type[BaseModel]] = None
    output_schema: Optional[Type[BaseModel]] = None
    tags: List[str] = field(default_factory=list)
    mutation: bool = False
    examples: List[Dict[str, Any]] = field(default_factory=list)


def define_command(
    name: str,
    description: str,
    input_schema: Optional[Type[BaseModel]] = None,
    output_schema: Optional[Type[BaseModel]] = None,
    tags: Optional[List[str]] = None,
    mutation: bool = False,
    examples: Optional[List[Dict[str, Any]]] = None,
) -> Callable:
    """Decorator to define a command with metadata.
    
    The decorated function becomes a command handler that can be registered
    with an MCP server. The decorator attaches metadata for schema generation.
    
    Args:
        name: Command name (use dot notation, e.g., "item.create").
        description: Human-readable description of what the command does.
        input_schema: Pydantic model class for validating input.
        output_schema: Pydantic model class for the output (optional).
        tags: Tags for categorization and filtering.
        mutation: Whether this command modifies state (default False).
        examples: Example inputs for documentation.
    
    Returns:
        Decorator function that wraps the handler.
    
    Example:
        >>> @define_command(
        ...     name="user.create",
        ...     description="Create a new user",
        ...     input_schema=CreateUserInput,
        ...     output_schema=User,
        ...     mutation=True,
        ... )
        ... async def create_user(input: CreateUserInput) -> User:
        ...     # Implementation
        ...     pass
    """
    
    def decorator(func: Callable) -> Callable:
        # Attach metadata to the function
        func.__afd_command__ = CommandMetadata(
            name=name,
            description=description,
            input_schema=input_schema,
            output_schema=output_schema,
            tags=tags or [],
            mutation=mutation,
            examples=examples or [],
        )
        
        @wraps(func)
        async def wrapper(raw_input: Any, context: Optional[Any] = None) -> CommandResult:
            """Wrapper that validates input and calls the handler."""
            # Validate input using Pydantic schema if provided
            if input_schema and raw_input is not None:
                if isinstance(raw_input, dict):
                    validated_input = input_schema.model_validate(raw_input)
                elif isinstance(raw_input, input_schema):
                    validated_input = raw_input
                else:
                    validated_input = input_schema.model_validate(raw_input)
            else:
                validated_input = raw_input
            
            # Call the original handler
            result = await func(validated_input, context) if _accepts_context(func) else await func(validated_input)
            
            return result
        
        # Copy metadata to wrapper
        wrapper.__afd_command__ = func.__afd_command__
        
        return wrapper
    
    return decorator


def _accepts_context(func: Callable) -> bool:
    """Check if function accepts a context parameter."""
    import inspect
    try:
        sig = inspect.signature(func)
        params = list(sig.parameters.keys())
        return "context" in params or len(params) > 1
    except Exception:
        return False


def has_command_metadata(func: Callable) -> bool:
    """Check if a function has command metadata attached."""
    return hasattr(func, "__afd_command__")


def get_command_metadata(func: Callable) -> Optional[CommandMetadata]:
    """Get command metadata from a decorated function."""
    return getattr(func, "__afd_command__", None)


def command_to_definition(func: Callable) -> Optional[CommandDefinition]:
    """Convert a decorated function to a CommandDefinition.
    
    Args:
        func: Function decorated with @define_command.
    
    Returns:
        CommandDefinition if the function has metadata, None otherwise.
    """
    metadata = get_command_metadata(func)
    if not metadata:
        return None
    
    # Generate parameters from input schema
    parameters = []
    if metadata.input_schema:
        schema = metadata.input_schema.model_json_schema()
        properties = schema.get("properties", {})
        required = set(schema.get("required", []))
        
        for prop_name, prop_schema in properties.items():
            json_type = _json_schema_type(prop_schema.get("type", "string"))
            parameters.append(CommandParameter(
                name=prop_name,
                type=json_type,
                description=prop_schema.get("description", f"Parameter {prop_name}"),
                required=prop_name in required,
                default=prop_schema.get("default"),
                enum=prop_schema.get("enum"),
            ))
    
    return CommandDefinition(
        name=metadata.name,
        description=metadata.description,
        handler=func,
        parameters=parameters,
        tags=metadata.tags,
        mutation=metadata.mutation,
        examples=metadata.examples,
    )


def _json_schema_type(pydantic_type: str) -> str:
    """Convert Pydantic/JSON Schema type to our type system."""
    type_map = {
        "string": "string",
        "integer": "number",
        "number": "number",
        "boolean": "boolean",
        "array": "array",
        "object": "object",
        "null": "null",
    }
    return type_map.get(pydantic_type, "string")
