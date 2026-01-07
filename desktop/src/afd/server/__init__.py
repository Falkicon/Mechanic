"""Server module for AFD applications.

This module provides the core server functionality for exposing AFD commands
via MCP (Model Context Protocol) and other transports.

Example:
    >>> from afd.server import create_server, define_command
    >>> from afd import success
    >>> from pydantic import BaseModel
    >>> 
    >>> class CreateInput(BaseModel):
    ...     name: str
    ...     
    >>> class CreateOutput(BaseModel):
    ...     id: str
    ...     name: str
    >>> 
    >>> server = create_server("my-app")
    >>> 
    >>> @server.command(
    ...     name="item.create",
    ...     description="Create a new item",
    ...     input_schema=CreateInput,
    ...     output_schema=CreateOutput,
    ... )
    ... async def create_item(input: CreateInput) -> CreateOutput:
    ...     return success(CreateOutput(id="123", name=input.name))
"""

from afd.server.decorators import define_command
from afd.server.factory import create_server, MCPServer

__all__ = [
    "create_server",
    "define_command",
    "MCPServer",
]
