"""Transport abstractions for MCP communication.

Transports handle the communication layer between AFD servers and clients.
The default transport is FastMCP, but this module provides protocol-based
abstractions for swapping implementations.

Example:
    >>> from afd.transports import FastMCPTransport, MockTransport
    >>> 
    >>> # For production
    >>> transport = FastMCPTransport()
    >>> 
    >>> # For testing
    >>> transport = MockTransport()
"""

from afd.transports.base import (
    Transport,
    TransportConfig,
    TransportState,
    ToolInfo,
    TransportError,
    ConnectionError,
    ToolNotFoundError,
)
from afd.transports.fastmcp import FastMCPTransport
from afd.transports.mock import MockTransport

__all__ = [
    "Transport",
    "TransportConfig",
    "TransportState",
    "ToolInfo",
    "TransportError",
    "ConnectionError",
    "ToolNotFoundError",
    "FastMCPTransport",
    "MockTransport",
]
