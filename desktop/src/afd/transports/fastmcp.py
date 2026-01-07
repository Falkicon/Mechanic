"""FastMCP transport implementation.

This transport uses FastMCP as the underlying MCP implementation.
It's the default transport for AFD servers and clients.

Example:
    >>> from afd.transports import FastMCPTransport
    >>> 
    >>> transport = FastMCPTransport(server_name="my-app")
    >>> await transport.connect()
    >>> tools = await transport.list_tools()
"""

import json
from dataclasses import dataclass, field
from typing import Any, Callable, Dict, List, Optional

from afd.transports.base import (
    ToolInfo,
    ToolNotFoundError,
    Transport,
    TransportConfig,
    TransportState,
)


@dataclass
class FastMCPConfig(TransportConfig):
    """Configuration specific to FastMCP transport.
    
    Attributes:
        server_name: Name of the MCP server.
        transport_type: Type of transport ("stdio" or "sse").
    """
    
    server_name: str = "afd-server"
    transport_type: str = "stdio"  # "stdio" or "sse"


class FastMCPTransport:
    """Transport implementation using FastMCP.
    
    This is the default transport for AFD applications. It wraps
    FastMCP's MCP server functionality.
    
    Example:
        >>> transport = FastMCPTransport(server_name="my-app")
        >>> await transport.connect()
        >>> result = await transport.call_tool("ping", {"message": "hello"})
    """
    
    def __init__(
        self,
        server_name: str = "afd-server",
        config: Optional[FastMCPConfig] = None,
    ):
        """Initialize FastMCP transport.
        
        Args:
            server_name: Name of the server.
            config: Optional configuration.
        """
        self._server_name = server_name
        self._config = config or FastMCPConfig(server_name=server_name)
        self._state = TransportState.DISCONNECTED
        self._mcp = None
        self._tools: Dict[str, Callable] = {}
    
    @property
    def state(self) -> TransportState:
        """Get current transport state."""
        return self._state
    
    @property
    def mcp(self):
        """Get the underlying FastMCP instance."""
        return self._mcp
    
    async def connect(self) -> None:
        """Connect (initialize) the FastMCP server.
        
        For FastMCP, "connecting" means initializing the server instance.
        Actual communication happens when run() is called.
        """
        try:
            self._state = TransportState.CONNECTING
            
            # Import FastMCP lazily
            try:
                from mcp.server.fastmcp import FastMCP
            except ImportError:
                raise ImportError(
                    "FastMCP not installed. Install with: pip install afd[server]"
                )
            
            # Create FastMCP instance
            self._mcp = FastMCP(self._server_name)
            self._state = TransportState.CONNECTED
            
        except Exception as e:
            self._state = TransportState.ERROR
            raise
    
    async def disconnect(self) -> None:
        """Disconnect (cleanup) the FastMCP server."""
        self._mcp = None
        self._tools.clear()
        self._state = TransportState.DISCONNECTED
    
    def register_tool(
        self,
        name: str,
        handler: Callable,
        description: str = "",
    ) -> None:
        """Register a tool with the transport.
        
        Args:
            name: Tool name.
            handler: Async handler function.
            description: Tool description.
        """
        self._tools[name] = handler
        
        if self._mcp:
            # Register with FastMCP
            @self._mcp.tool(name=name, description=description)
            async def tool_wrapper(**kwargs):
                result = await handler(kwargs)
                return json.dumps(result, default=str)
    
    async def call_tool(
        self,
        name: str,
        arguments: Optional[Dict[str, Any]] = None,
    ) -> Any:
        """Call a registered tool.
        
        For server-side use, this calls the handler directly.
        For client-side use, this would go through MCP protocol.
        
        Args:
            name: Tool name.
            arguments: Tool arguments.
        
        Returns:
            Tool result.
        """
        if name not in self._tools:
            raise ToolNotFoundError(name)
        
        handler = self._tools[name]
        return await handler(arguments or {})
    
    async def list_tools(self) -> List[ToolInfo]:
        """List registered tools."""
        return [
            ToolInfo(name=name, description="")
            for name in self._tools.keys()
        ]
    
    def run(self, transport: str = "stdio") -> None:
        """Run the FastMCP server.
        
        Args:
            transport: Transport type ("stdio" or "sse").
        """
        if not self._mcp:
            raise RuntimeError("Transport not connected. Call connect() first.")
        
        self._mcp.run(transport=transport)
    
    async def run_async(self, transport: str = "stdio") -> None:
        """Run the FastMCP server asynchronously.
        
        Args:
            transport: Transport type.
        """
        if not self._mcp:
            raise RuntimeError("Transport not connected. Call connect() first.")
        
        await self._mcp.run_async(transport=transport)
