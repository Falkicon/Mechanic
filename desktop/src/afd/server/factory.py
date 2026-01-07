"""Server factory for creating AFD MCP servers.

The create_server() function is the main entry point for building
AFD applications that expose commands via MCP.

Example:
    >>> from afd.server import create_server
    >>> from afd import success
    >>> from pydantic import BaseModel
    >>> 
    >>> server = create_server("my-app", version="1.0.0")
    >>> 
    >>> class PingInput(BaseModel):
    ...     message: str = "ping"
    >>> 
    >>> @server.command(
    ...     name="ping",
    ...     description="Echo a message back",
    ...     input_schema=PingInput,
    ... )
    ... async def ping(input: PingInput):
    ...     from afd import success
    ...     return success({"message": f"pong: {input.message}"})
    >>> 
    >>> # Run the server
    >>> server.run()
"""

import sys

from dataclasses import dataclass, field
from typing import (
    Any,
    Awaitable,
    Callable,
    Dict,
    List,
    Optional,
    Protocol,
    Type,
    TypeVar,
    Union,
    runtime_checkable,
)

from pydantic import BaseModel

from afd.core.commands import (
    CommandContext,
    CommandDefinition,
    CommandRegistry,
    create_command_registry,
)
from afd.core.result import CommandResult
from afd.server.decorators import (
    CommandMetadata,
    command_to_definition,
    define_command,
    get_command_metadata,
    has_command_metadata,
)


TInput = TypeVar("TInput", bound=BaseModel)
TOutput = TypeVar("TOutput")


@runtime_checkable
class MCPTransport(Protocol):
    """Protocol for MCP transport implementations.
    
    Transports handle the communication layer for MCP. The default
    is FastMCP, but this abstraction allows swapping implementations.
    """
    
    async def start(self) -> None:
        """Start the transport."""
        ...
    
    async def stop(self) -> None:
        """Stop the transport."""
        ...


@dataclass
class ServerConfig:
    """Configuration for an AFD server.
    
    Attributes:
        name: Server name (shown to clients).
        version: Server version string.
        description: Optional server description.
        transport: Transport implementation to use.
    """
    
    name: str
    version: str = "1.0.0"
    description: Optional[str] = None
    transport: Optional[str] = "fastmcp"  # "fastmcp", "stdio", or custom


class MCPServer:
    """AFD MCP Server for exposing commands.
    
    This is the main server class that manages commands and handles
    communication via MCP transports.
    
    Example:
        >>> server = MCPServer(ServerConfig(name="my-app"))
        >>> 
        >>> @server.command(name="ping", description="Ping")
        ... async def ping(input):
        ...     return success({"status": "pong"})
        >>> 
        >>> server.run()
    """
    
    def __init__(self, config: ServerConfig):
        """Initialize the server.
        
        Args:
            config: Server configuration.
        """
        self.config = config
        self._registry = create_command_registry()
        self._commands: List[Callable] = []
        self._mcp_server = None
    
    @property
    def name(self) -> str:
        """Get server name."""
        return self.config.name
    
    @property
    def version(self) -> str:
        """Get server version."""
        return self.config.version
    
    @property
    def registry(self) -> CommandRegistry:
        """Get the command registry."""
        return self._registry
    
    def command(
        self,
        name: str,
        description: str,
        input_schema: Optional[Type[BaseModel]] = None,
        output_schema: Optional[Type[BaseModel]] = None,
        tags: Optional[List[str]] = None,
        mutation: bool = False,
        examples: Optional[List[Dict[str, Any]]] = None,
    ) -> Callable:
        """Decorator to register a command with this server.
        
        This combines @define_command with automatic registration.
        
        Args:
            name: Command name (use dot notation).
            description: What the command does.
            input_schema: Pydantic model for input validation.
            output_schema: Pydantic model for output.
            tags: Tags for categorization.
            mutation: Whether command modifies state.
            examples: Example inputs.
        
        Returns:
            Decorator function.
        
        Example:
            >>> @server.command(
            ...     name="user.get",
            ...     description="Get a user by ID",
            ...     input_schema=GetUserInput,
            ... )
            ... async def get_user(input: GetUserInput):
            ...     return success({"id": input.id, "name": "John"})
        """
        def decorator(func: Callable) -> Callable:
            # Apply the define_command decorator
            decorated = define_command(
                name=name,
                description=description,
                input_schema=input_schema,
                output_schema=output_schema,
                tags=tags,
                mutation=mutation,
                examples=examples,
            )(func)
            
            # Register with our registry
            definition = command_to_definition(decorated)
            if definition:
                self._registry.register(definition)
            
            # Keep track of decorated functions
            self._commands.append(decorated)
            
            return decorated
        
        return decorator
    
    def register(self, func: Callable) -> None:
        """Register an already-decorated command function.
        
        Use this when the command was decorated elsewhere.
        
        Args:
            func: Function decorated with @define_command.
        
        Example:
            >>> @define_command(name="external", description="External command")
            ... async def external_cmd(input):
            ...     return success({})
            >>> 
            >>> server.register(external_cmd)
        """
        if not has_command_metadata(func):
            raise ValueError(
                f"Function {func.__name__} is not decorated with @define_command"
            )
        
        definition = command_to_definition(func)
        if definition:
            self._registry.register(definition)
            self._commands.append(func)
    
    def list_commands(self) -> List[CommandDefinition]:
        """List all registered commands."""
        return self._registry.list()
    
    async def execute(
        self,
        name: str,
        input: Any,
        context: Optional[CommandContext] = None,
    ) -> CommandResult:
        """Execute a command by name.
        
        Args:
            name: Command name.
            input: Command input.
            context: Optional execution context.
        
        Returns:
            CommandResult from the command handler.
        """
        return await self._registry.execute(name, input, context)
    
    def _create_mcp_server(self):
        """Create the underlying MCP server instance."""
        try:
            from mcp.server.fastmcp import FastMCP
            
            self._mcp_server = FastMCP(self.config.name)
            
            # Register all commands as MCP tools
            for cmd in self._commands:
                metadata = get_command_metadata(cmd)
                if metadata:
                    self._register_mcp_tool(cmd, metadata)
            
            return self._mcp_server
        except ImportError:
            raise ImportError(
                "FastMCP not installed. Install with: pip install afd[server]"
            )
    
    def _register_mcp_tool(self, func: Callable, metadata: CommandMetadata) -> None:
        """Register a command as an MCP tool."""
        if not self._mcp_server:
            return
        
        import json
        from pydantic import BaseModel, ConfigDict, create_model
        from typing import Any
        from mcp.server.fastmcp import Context
        from afd.server.decorators import _accepts_context

        # Create the input schema
        if metadata.input_schema:
            input_schema = metadata.input_schema
        else:
            input_schema = create_model(
                f"{metadata.name.replace('.', '_')}_Input",
                __config__=ConfigDict(extra="allow")
            )

        # We need to create a function with a specific signature so FastMCP 
        # can correctly introspect it and generate the JSON schema.
        # Using a closure and exec is the most reliable way to do this dynamically.
        handler_name = f"handler_{metadata.name.replace('.', '_')}"
        namespace = {
            "func": func,
            "json": json,
            "input_schema": input_schema,
            "CommandResult": CommandResult,
            "Context": Context,
            "Any": Any,
        }
        
        arg_list = []
        fields = input_schema.model_fields
        
        if not fields and input_schema.model_config.get("extra") == "allow":
            arg_list.append("**kwargs")
            if metadata.input_schema:
                call_args_code = "input_schema(**kwargs)"
            else:
                call_args_code = "kwargs"
        else:
            for name, field in fields.items():
                type_key = f"type_{name}"
                namespace[type_key] = field.annotation
                
                # Handle defaults
                if field.default is not None and field.default != ...:
                    namespace[f"default_{name}"] = field.default
                    arg_list.append(f"{name}: {type_key} = default_{name}")
                elif field.default_factory is not None:
                    arg_list.append(f"{name}: {type_key} = None")
                else:
                    # Check if required
                    is_required = True
                    try:
                        is_required = field.is_required()
                    except AttributeError:
                        is_required = field.default == ...
                    
                    if is_required:
                        arg_list.append(f"{name}: {type_key}")
                    else:
                        arg_list.append(f"{name}: {type_key} = None")
            
            field_names = list(fields.keys())
            dict_construction = ", ".join([f"'{name}': {name}" for name in field_names])
            if metadata.input_schema:
                call_args_code = f"input_schema(**{{{dict_construction}}})"
            else:
                call_args_code = f"{{{dict_construction}}}"
            
        # Add context if needed
        has_context = _accepts_context(func)
        if has_context:
            arg_list.append("context: Context = None")
            
        signature = ", ".join(arg_list)
        
        if has_context:
            final_call = f"await func({call_args_code}, context=context)"
        else:
            final_call = f"await func({call_args_code})"

        exec_code = f"""
async def {handler_name}({signature}) -> str:
    \"\"\"MCP tool handler for {metadata.name}\"\"\"
    result = {final_call}
    return json.dumps(result.model_dump(), default=str)
"""
        exec(exec_code, namespace)
        handler = namespace[handler_name]
        
        # Register with FastMCP
        self._mcp_server.tool(name=metadata.name, description=metadata.description)(handler)

    def run(self, transport: str = "stdio") -> None:
        """Run the server with the specified transport.
        
        Args:
            transport: Transport type ("stdio" or "sse").
        
        Example:
            >>> server.run()  # Runs with stdio (default)
            >>> server.run(transport="sse")  # Runs with SSE
        """
        mcp = self._create_mcp_server()
        
        if transport == "stdio":
            mcp.run(transport="stdio")
        elif transport == "sse":
            mcp.run(transport="sse")
        else:
            raise ValueError(f"Unknown transport: {transport}")
    
    async def run_async(self, transport: str = "stdio") -> None:
        """Run the server asynchronously.
        
        Args:
            transport: Transport type.
        """
        mcp = self._create_mcp_server()
        await mcp.run_async(transport=transport)


def create_server(
    name: str,
    version: str = "1.0.0",
    description: Optional[str] = None,
) -> MCPServer:
    """Create a new AFD MCP server.
    
    This is the main entry point for building AFD applications.
    
    Args:
        name: Server name (shown to MCP clients).
        version: Server version string.
        description: Optional description.
    
    Returns:
        Configured MCPServer instance.
    
    Example:
        >>> from afd.server import create_server
        >>> from afd import success
        >>> from pydantic import BaseModel
        >>> 
        >>> server = create_server("my-app", version="1.0.0")
        >>> 
        >>> class EchoInput(BaseModel):
        ...     message: str
        >>> 
        >>> @server.command(
        ...     name="echo",
        ...     description="Echo a message",
        ...     input_schema=EchoInput,
        ... )
        ... async def echo(input: EchoInput):
        ...     return success({"echo": input.message})
        >>> 
        >>> # In production:
        >>> # server.run()
    """
    config = ServerConfig(
        name=name,
        version=version,
        description=description,
    )
    return MCPServer(config)
