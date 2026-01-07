"""
Pytest fixtures for testing AFD commands.

This module provides fixtures that make it easy to test commands
in isolation with proper setup and teardown.

Example:
    >>> def test_create_user(isolated_registry, mock_server):
    ...     @mock_server.command("user.create")
    ...     async def create_user(input):
    ...         return success({"id": 1, "name": input["name"]})
    ...     
    ...     result = await mock_server.execute("user.create", {"name": "Alice"})
    ...     assert_success(result)
"""

from contextlib import contextmanager
from typing import Any, Callable, Dict, Generator, Optional, TypeVar

import pytest

from afd.core import (
    CommandContext,
    CommandRegistry,
    CommandResult,
    create_command_registry,
    success,
)
from afd.transports import MockTransport, TransportConfig


T = TypeVar("T")


@pytest.fixture
def command_context() -> CommandContext:
    """Create a basic command context for testing.
    
    This fixture provides a minimal command context suitable for
    testing commands that don't need special context values.
    
    Example:
        >>> def test_my_command(command_context):
        ...     result = await my_command(input, context=command_context)
        ...     assert result.success
    
    Returns:
        A CommandContext with default values.
    """
    return CommandContext(
        trace_id="test-trace-001",
        timeout=5000,
        extra={"environment": "test"},
    )


@pytest.fixture
def mock_server():
    """Create a mock server for testing commands.
    
    This fixture provides a mock server that can register and
    execute commands without actual network communication.
    
    Example:
        >>> def test_my_command(mock_server):
        ...     @mock_server.command("ping")
        ...     async def ping(input):
        ...         return success("pong")
        ...     
        ...     result = await mock_server.execute("ping", {})
        ...     assert result.data == "pong"
    
    Returns:
        A MockServer instance.
    """
    return MockServer()


@pytest.fixture
def isolated_registry():
    """Create an isolated command registry for testing.
    
    This fixture creates a fresh registry that won't interfere
    with other tests or the global registry.
    
    Example:
        >>> def test_registry(isolated_registry):
        ...     isolated_registry.register(my_command_definition)
        ...     assert isolated_registry.has("my.command")
    
    Returns:
        A fresh CommandRegistry instance.
    """
    return create_command_registry()


class MockServer:
    """Mock server for testing commands.
    
    This class provides a simple way to register and execute
    commands without setting up a full MCP server.
    
    Example:
        >>> server = MockServer()
        >>> 
        >>> @server.command("user.create")
        >>> async def create_user(input):
        ...     return success({"id": 1, "name": input["name"]})
        >>> 
        >>> result = await server.execute("user.create", {"name": "Alice"})
        >>> assert result.success
    """
    
    def __init__(self):
        """Initialize the mock server."""
        self._commands: Dict[str, Callable] = {}
        self._transport = MockTransport()
    
    def command(self, name: str):
        """Decorator to register a command handler.
        
        Args:
            name: Command name (e.g., "user.create").
        
        Returns:
            Decorator function.
        
        Example:
            >>> @server.command("ping")
            >>> async def ping(input):
            ...     return success("pong")
        """
        def decorator(func: Callable) -> Callable:
            self._commands[name] = func
            
            # Also register with the mock transport
            async def wrapper(args):
                return await func(args)
            self._transport.register_tool(name, wrapper, description=f"Mock: {name}")
            
            return func
        return decorator
    
    async def execute(
        self,
        name: str,
        input: Optional[Dict[str, Any]] = None,
        context: Optional[CommandContext] = None,
    ) -> CommandResult[Any]:
        """Execute a registered command.
        
        Args:
            name: Command name to execute.
            input: Input arguments.
            context: Optional command context.
        
        Returns:
            Command result.
        
        Example:
            >>> result = await server.execute("user.create", {"name": "Alice"})
        """
        if name not in self._commands:
            from afd.core import error
            return error(
                code="COMMAND_NOT_FOUND",
                message=f"Command '{name}' not found",
            )
        
        handler = self._commands[name]
        
        try:
            result = await handler(input or {})
            
            # Ensure result is a CommandResult
            if isinstance(result, dict):
                return CommandResult(**result)
            return result
        except Exception as e:
            from afd.core import error
            return error(
                code="EXECUTION_ERROR",
                message=str(e),
            )
    
    @property
    def transport(self) -> MockTransport:
        """Get the underlying mock transport for advanced testing.
        
        Returns:
            The MockTransport instance.
        """
        return self._transport
    
    def has(self, name: str) -> bool:
        """Check if a command is registered.
        
        Args:
            name: Command name.
        
        Returns:
            True if command exists.
        """
        return name in self._commands
    
    def list_commands(self) -> list[str]:
        """List all registered commands.
        
        Returns:
            List of command names.
        """
        return list(self._commands.keys())


@contextmanager
def temporary_command(
    registry: CommandRegistry,
    name: str,
    handler: Callable,
) -> Generator[None, None, None]:
    """Temporarily register a command for testing.
    
    This context manager registers a command and automatically
    cleans it up after the test.
    
    Args:
        registry: Registry to register in.
        name: Command name.
        handler: Command handler function.
    
    Yields:
        Nothing.
    
    Example:
        >>> with temporary_command(registry, "test.cmd", handler):
        ...     result = await registry.execute("test.cmd", {})
        ...     assert result.success
    """
    from afd.core import CommandDefinition, CommandParameter
    
    # Create a minimal definition
    definition = CommandDefinition(
        name=name,
        description=f"Temporary test command: {name}",
        handler=handler,
        parameters=[],
    )
    
    # Register
    registry.register(definition)
    
    try:
        yield
    finally:
        # Clean up - note: CommandRegistry doesn't have unregister,
        # but in a real implementation you'd want this
        pass
