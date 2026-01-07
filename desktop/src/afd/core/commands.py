"""Command definition and registry types.

Commands are the core abstraction in AFD. Every application action
is defined as a command with a clear schema.

Example:
    >>> from afd.core.commands import CommandDefinition, create_command_registry
    >>> from afd import success
    >>> 
    >>> async def my_handler(input, context=None):
    ...     return success({"id": "123"})
    >>> 
    >>> registry = create_command_registry()
    >>> registry.register(CommandDefinition(
    ...     name="my.command",
    ...     description="Does something useful",
    ...     handler=my_handler,
    ... ))
"""

from dataclasses import dataclass, field
from typing import (
    Any,
    Awaitable,
    Callable,
    Dict,
    List,
    Literal,
    Optional,
    Protocol,
    TypeVar,
    Union,
)

from pydantic import BaseModel

from afd.core.result import CommandResult

TInput = TypeVar("TInput")
TOutput = TypeVar("TOutput")


@dataclass
class CommandParameter:
    """Definition for a single command parameter.
    
    Attributes:
        name: Parameter name.
        type: JSON Schema type.
        description: Human-readable description.
        required: Whether this parameter is required.
        default: Default value if not provided.
        enum: Allowed values for enum types.
    """

    name: str
    type: Literal["string", "number", "boolean", "object", "array", "null"]
    description: str
    required: bool = False
    default: Optional[Any] = None
    enum: Optional[List[Any]] = None


@dataclass
class CommandContext:
    """Context provided to command handlers.
    
    Attributes:
        trace_id: Unique ID for this command invocation.
        timeout: Timeout in milliseconds.
        extra: Additional custom context values.
    """

    trace_id: Optional[str] = None
    timeout: Optional[int] = None
    extra: Dict[str, Any] = field(default_factory=dict)


# Type alias for command handler functions
CommandHandler = Callable[
    [Any, Optional[CommandContext]],
    Awaitable[CommandResult[Any]],
]


@dataclass
class CommandDefinition:
    """Full command definition with schema, handler, and metadata.
    
    Attributes:
        name: Unique command name using dot notation (category.action).
        description: Human-readable description of what the command does.
        handler: The async command implementation.
        category: Category for grouping related commands.
        parameters: Command parameters with types and descriptions.
        returns_description: Description of the return type.
        errors: Error codes this command may return.
        version: Command version for tracking changes.
        tags: Tags for additional categorization.
        mutation: Whether this command performs side effects.
        execution_time: Estimated execution time category.
    
    Example:
        >>> async def create_doc(input, context=None):
        ...     return success({"id": "doc-123", "title": input.get("title")})
        >>> 
        >>> cmd = CommandDefinition(
        ...     name="document.create",
        ...     description="Creates a new document",
        ...     handler=create_doc,
        ...     category="documents",
        ...     parameters=[
        ...         CommandParameter(
        ...             name="title",
        ...             type="string",
        ...             description="Document title",
        ...             required=True,
        ...         ),
        ...     ],
        ...     mutation=True,
        ... )
    """

    name: str
    description: str
    handler: CommandHandler
    category: Optional[str] = None
    parameters: List[CommandParameter] = field(default_factory=list)
    returns_description: Optional[str] = None
    errors: Optional[List[str]] = None
    version: Optional[str] = None
    tags: Optional[List[str]] = None
    mutation: bool = False
    execution_time: Optional[Literal["instant", "fast", "slow", "long-running"]] = None
    examples: Optional[List[Dict[str, Any]]] = None


class CommandRegistry(Protocol):
    """Protocol for command registry implementations."""

    def register(self, command: CommandDefinition) -> None:
        """Register a command.
        
        Args:
            command: The command definition to register.
            
        Raises:
            ValueError: If a command with the same name already exists.
        """
        ...

    def get(self, name: str) -> Optional[CommandDefinition]:
        """Get a command by name.
        
        Args:
            name: The command name.
            
        Returns:
            The command definition or None if not found.
        """
        ...

    def has(self, name: str) -> bool:
        """Check if a command exists.
        
        Args:
            name: The command name.
            
        Returns:
            True if the command exists.
        """
        ...

    def list(self) -> List[CommandDefinition]:
        """Get all registered commands.
        
        Returns:
            List of all command definitions.
        """
        ...

    def list_by_category(self, category: str) -> List[CommandDefinition]:
        """Get commands by category.
        
        Args:
            category: The category to filter by.
            
        Returns:
            List of commands in the category.
        """
        ...

    async def execute(
        self,
        name: str,
        input: Any,
        context: Optional[CommandContext] = None,
    ) -> CommandResult[Any]:
        """Execute a command by name.
        
        Args:
            name: The command name.
            input: The command input.
            context: Optional execution context.
            
        Returns:
            The command result.
        """
        ...


class _CommandRegistryImpl:
    """Default command registry implementation."""

    def __init__(self) -> None:
        self._commands: Dict[str, CommandDefinition] = {}

    def register(self, command: CommandDefinition) -> None:
        if command.name in self._commands:
            raise ValueError(f"Command '{command.name}' is already registered")
        self._commands[command.name] = command

    def get(self, name: str) -> Optional[CommandDefinition]:
        return self._commands.get(name)

    def has(self, name: str) -> bool:
        return name in self._commands

    def list(self) -> List[CommandDefinition]:
        return list(self._commands.values())

    def list_by_category(self, category: str) -> List[CommandDefinition]:
        return [cmd for cmd in self._commands.values() if cmd.category == category]

    async def execute(
        self,
        name: str,
        input: Any,
        context: Optional[CommandContext] = None,
    ) -> CommandResult[Any]:
        command = self._commands.get(name)
        from afd.core.result import CommandError as CmdError

        if not command:
            return CommandResult(
                success=False,
                error=CmdError(
                    code="COMMAND_NOT_FOUND",
                    message=f"Command '{name}' not found",
                    suggestion="List available commands to see valid options",
                ),
            )

        try:
            result = await command.handler(input, context)
            return result
        except Exception as e:
            return CommandResult(
                success=False,
                error=CmdError(
                    code="COMMAND_EXECUTION_ERROR",
                    message=str(e),
                    suggestion="Check the input parameters and try again",
                ),
            )


def create_command_registry() -> CommandRegistry:
    """Create a new command registry.
    
    Returns:
        A CommandRegistry instance for registering and executing commands.
    
    Example:
        >>> registry = create_command_registry()
        >>> registry.register(my_command)
        >>> result = await registry.execute("my.command", {"arg": "value"})
    """
    return _CommandRegistryImpl()


def command_to_mcp_tool(command: CommandDefinition) -> dict[str, Any]:
    """Convert a CommandDefinition to MCP tool format.
    
    This is used by the server module to expose commands as MCP tools.
    
    Args:
        command: The command definition.
        
    Returns:
        A dict in MCP tool format with name, description, and inputSchema.
    
    Example:
        >>> tool = command_to_mcp_tool(my_command)
        >>> tool["name"]
        'my.command'
    """
    properties: Dict[str, Dict[str, Any]] = {}
    required: List[str] = []

    for param in command.parameters:
        prop: Dict[str, Any] = {
            "type": param.type,
            "description": param.description,
        }
        if param.default is not None:
            prop["default"] = param.default
        if param.enum is not None:
            prop["enum"] = param.enum
        properties[param.name] = prop

        if param.required:
            required.append(param.name)

    return {
        "name": command.name,
        "description": command.description,
        "inputSchema": {
            "type": "object",
            "properties": properties,
            "required": required,
        },
    }
